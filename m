Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16637A843
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580370; cv=none; b=GRDEdvBJ6bXbMHaQXX7OpBdt8X+AFs9Pd73vTNiL3H0iF2RuMU/EvNAuoRtnVlURoeOhi6XT6PVHulJvPnPLZFRhUTgJNwF4IkenvChpqtSCvFWHsgNCtomf6FmrQ3FI64opbsIKxjbUF+cjRgO2LQ0lN4KDgoMXVQ5T0bLZ+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580370; c=relaxed/simple;
	bh=cxDsJ4blj9u4IfiHLpko8QL7wsP74eTP5AVZcS/pAb0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IxINFCQ7JuBcK8EgegU+K6FHAWmgQ3TQeBxL9H4OLRF1/JY9R+i0kCLjrhcX3ypA4Gu2LyUXpq6YrslNCvMx5w/GmN3iCUXorc7zj7jC3ST3TH0m51HB1FF65Np6sepvGvTErnZZmoyzXO7zBBqTQcngzHqwZUNNimPjlEdiMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=mSa7zR0o; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="mSa7zR0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1790580364; x=1790839564;
	bh=unjKkgtACh8NwKOOMGWkfB7w8uxTmjW4EKK0ZLhUmiM=;
	h=From:To:Cc:Subject:Date:Message-Id:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mSa7zR0oSixskLzmBjAi3eaQ9f49rkm8fXO4VuRvFLwH8nve6jbsdoI/SgsuDSr3x
	 amc/KC445F8cl/BTG+pLM5hdBFA7rjv0B3J6CaEvBJqnxtfv+lAX1cDap7dMU8hdil
	 VGEuR5MdPZbGFUyV96jFQrpaf0ayJhYtI9kyfpA+mcgcFSggrPkH0Ft1IEbyjCX7tj
	 6oATMxWKH56Y7X8prv6zPLCAun4zloVQWdUiU8JhrJdBHdLgs69aUs3lHdG3f9Nl3Y
	 RHlwj4ZnUZ1foIIRGpRZLMvMzrkTcqSN5M8yoiabmGkV6ZgopnUSIQsbaGVDCY5Ht2
	 TdYf5hkNSRWvg==
X-Pm-Submission-Id: 4htXsj1mFCz2Scpc
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: Christian Brauner <brauner@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH 0/2] userns: reject out-of-range uid_map/gid_map values
Date: Mon, 28 Sep 2026 10:25:35 +0300
Message-Id: <20260928072537.115668-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_write() silently truncates uid_map/gid_map/projid_map values above
U32_MAX modulo 2^32 on 64-bit kernels, so e.g. "4294967301 1000 1" is
installed as "5 1000 1" without an error. Patch 1 rejects such values
with -EINVAL. Patch 2 adds a selftest for all three fields and for the
unchanged in-range path.

This is hardening, not a security fix.

The patch and the selftest were drafted by Claude Code (Claude Opus 5.5)
in an interactive session; I reviewed, built and tested them. The
assistant flagged the truncation while reading map_write(), and I
confirmed it by writing to uid_map on a running kernel.

Tested on v7.3-rc4-393-g165768bb7026 under virtme-ng, x86_64 defconfig
with CONFIG_USER_NS: all five selftest cases pass on the patched kernel.
On an unpatched 6.8 host, four of the five fail as expected.

Natasha Klaus (2):
  userns: reject uid_map/gid_map values that do not fit in u32
  selftests/namespaces: add uid_map/gid_map range tests

 kernel/user_namespace.c                       |  14 +-
 tools/testing/selftests/namespaces/.gitignore |   1 +
 tools/testing/selftests/namespaces/Makefile   |   3 +-
 .../selftests/namespaces/uid_map_range_test.c | 155 ++++++++++++++++++
 4 files changed, 169 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/namespaces/uid_map_range_test.c


base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.34.1

