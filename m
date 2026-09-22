Received: from mta0.migadu.com (out-113.mta0.migadu.com [91.218.175.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B074DE714
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061611; cv=none; b=IbB12w9TNB5h8T/f16wsESD8jPcl4GPEGmUtHIBfHJlUm2fopUeRzK8hThrd0xOsbDK/ULaDJPJXNeQvcyn6kE0DfKuVEBfj4P84ZvUb2h7Euoz8JR4fsE+H91DZOTHynwl99M/QpA3/e/ktO2+GskbUrcvmRXzEPHJxNrfVJho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061611; c=relaxed/simple;
	bh=PLPxpngUOMXOVTPIenhgU/9YK1OmclBahSnqwbDCPGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mZ3MBsMn+UFIPbTy0HWmpDiNbBPmgPZhJmF+23qElP99K/lGrCtx0HDchi3pVA2V4fNDIoR3rbKjYnGM5V6t1vSw/jxdc2BiJN/FEAAYQle7fbFZcP/xY2aqOAx/Bd1X6QJMDlKVJK6Htez6QN8rLRq3lRGmoJEmGptO+xMk4fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KKs9TU76; arc=none smtp.client-ip=91.218.175.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KKs9TU76"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PLPxpngUOMXOVTPIenhgU/9YK1OmclBahSnqwbDCPGg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790061600; v=1; x=1790666400;
 b=KKs9TU76tRwz9JyWC2VWUtdmkqm8FJiVhmvVfFmQsmmFYD8o+TpDuu7MA/yy3EaPLbWuWvaC
 58758Gq+Vm5fNxtRZk/fkdfpjXfazHPWnAookuSkF4rm4L0bR6SPdJLXkrvayjTlEXbuxYhR65w
 Tl+lrETE91uWFA2mdeZoQoEs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cb2d1057d399de0d;
	Tue, 22 Sep 2026 07:19:50 +0000
X-Mizu-Trace-ID: cb2d1057d399de0d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	James Houghton <jthoughton@google.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: selftests: Fix incremental build dependencies
Date: Tue, 22 Sep 2026 08:19:43 +0100
Message-Id: <20260922071945.693714-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v1 [1]:
  - Use FORCE for the sysreg header rule instead of duplicating the
    generator's inputs. (Oliver)
  - Added patch 2, the same class of bug in libcgroup.mk, found while
    testing patch 1.

Two fixes for Makefile rules that name a directory where a file's mtime
is what matters. The first is arm64-only: the sysreg header isn't
regenerated on an incremental build when the sysreg table changes. The
second is arch-independent: cgroup_util.o recompiles, and every test
relinks, on the run after any rebuild in lib/. The two patches are
independent.

I'd suggested v1 go through kvmarm as it was arm64-only. With patch 2
being generic, this one is addressed to kvm with kvmarm on Cc. Since the
patches are independent, they can also go through separate trees if
that's easier.

Based on Linux 7.3-rc1 (cee9395acd804).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260902134118.2718200-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: selftests: Fix arm64 sysreg header dependencies
  selftests/cgroup: Make the object directory an order-only prerequisite

 tools/testing/selftests/cgroup/lib/libcgroup.mk |  2 +-
 tools/testing/selftests/kvm/Makefile.kvm        | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5

