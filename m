Received: from cvsmtppost24.nm.naver.com (cvsmtppost24.nm.naver.com [114.111.35.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D74825AF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938595; cv=none; b=S9/47t4FNNh3iDffmGWzEbWJsRUuUIpNRhcAoYdurfwMbbsbC0sc4zG0IHomV3wS+zBRnZ3qUrpwpdgTtxUJBO9tzH2fTXjrtXtsFkJwzgV7Vfl9o0nwwJ8xnrJVE5Adc00mh7+j3SP7nP4pN/14mgTs1OHxDYkZ33aIZOJG7FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938595; c=relaxed/simple;
	bh=C8ot/11l/XK4YxVaGNujg22DIFt6ej+wd5mPVQ1P4aI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oy6FEuCSrNfOk9BsVpma62xso3zDstlSaa7xobe42CBu8upGyJixjmlFHuY7f1g0KI4QLhf/g7Xx/7Q4ic02FlaKFuYjBauVwjhXJb4SI5AEkWq69To3aAFHq1eU0bXpqW9oj+peTpYODYmm+hycRz4vNcfU1qF69W3XKzPCM/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=tLTAqqae; arc=none smtp.client-ip=114.111.35.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="tLTAqqae"
Received: from cvsendbo029.nm ([10.112.18.60])
  by cvsmtppost24.nm.naver.com with ESMTP id 8aM4hl+5Rf6DQO1B4oZViA
  for <linux-kernel@vger.kernel.org>;
  Fri, 02 Oct 2026 10:56:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1790938584; bh=C8ot/11l/XK4YxVaGNujg22DIFt6ej+wd5mPVQ1P4aI=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=tLTAqqaeSNS1Xkc9kNrCUivkBNJNCPBX+E0vHFpiLIwnGsmpNpmYpg6lY0CfRSM+u
	 6dcM3NZ4nsH/zw6/jrW7Pa+sO2QEXunEfwoECpTSXB4ADaL+1zWnNAZhfDJhzsTxgQ
	 kQJttPU7FSL9Qn7ztXtv4s1dC+6OYaOy/gCRUIX45TW4AP4wC9jbIPQf2hM01eezaP
	 EYhqWLImme0pApowBDveogoIXdZZ113cA1bXx9moYngo1TP5i/UypP0CeD5YaoFPJG
	 lwQKmz4XQIZWjLf5CjIrJcD4wdU/F5YZ8csRFaPbf5hqSUFA71lieyUmxEbkaAgU0E
	 Be3RLMHcaeE8A==
X-Session-ID: BxO2uDGsRFiUFQ09q6O3Qg
X-Works-Send-Opt: Os+wpzGdjHmdKHFOMr39Ko3YKBm/jAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: PqnmaxglFqJZ+HmqaAur+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp004.nm.naver.com with ESMTP id BxO2uDGsRFiUFQ09q6O3Qg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 02 Oct 2026 10:56:23 -0000
From: tjdqudcks0424@naver.com
To: bsingharora@gmail.com,
	akpm@linux-foundation.org
Cc: xu.xin@linux.dev,
	gregkh@linuxfoundation.org,
	shuah@kernel.org,
	cyyzero16@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?=EC=84=B1=EB=B3=91=EC=B0=AC?= <tjdqudcks0424@naver.com>
Subject: [PATCH v3 0/2] taskstats: fix cross-netns exit listener delivery
Date: Fri,  2 Oct 2026 19:56:12 +0900
Message-ID: <20261002105614.195370-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 성병찬 <tjdqudcks0424@naver.com>

CPU-mask taskstats listeners are currently identified only by a numeric
Generic Netlink port ID and exit records are sent through init_net. Since
port IDs are namespace-local, an unprivileged init_net socket can bind the
same number as a listener in another network namespace and receive that
listener's cross-UID exit record.

Patch 1 associates listener entries with the registering Generic Netlink
socket's namespace and port ID and cleans them up when that socket closes.
Patch 2 adds an acct kselftest which constructs the collision and checks the
normal listener, explicit deregistration, and unrelated-port controls.

The test was built with GCC using -Wall -Wextra and run in disposable QEMU
guests with the same userspace binary. On the unmodified baseline it reports
3 passes and 1 failure: the child-netns listener misses the victim record and
the colliding unprivileged init_net socket receives it. On the fixed kernel,
three independent clean boots each report 4 passes and no failures. No
KASAN, UBSAN, BUG, WARNING, Oops, panic, lockdep, refcount, use-after-free,
out-of-bounds, or kmemleak diagnostic was emitted during the final runs.

The exact Message-ID and lore URL of the previous public posting were not
present in the available local sent-mail or raw-mail artifacts:

Link: https://lore.kernel.org/r/20261002075842.146026-1-tjdqudcks0424@naver.com/

Changes in v3:
- remove wording that called a private draft "v1"
- add an in-tree taskstats CPU-listener network-namespace regression test
- send the fix and selftest as a two-patch series

성병찬 (2):
  taskstats: route exit listener records through their netns
  selftests: acct: test taskstats listener netns routing

 kernel/taskstats.c                            | 135 ++-
 tools/testing/selftests/acct/Makefile         |   1 +
 .../selftests/acct/taskstats_netns_listener.c | 945 ++++++++++++++++++
 3 files changed, 1037 insertions(+), 44 deletions(-)
 create mode 100644 tools/testing/selftests/acct/taskstats_netns_listener.c


base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
-- 
2.43.0
