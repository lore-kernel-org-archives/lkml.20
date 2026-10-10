Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BF1D9663
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620962; cv=none; b=R/p12Fi0qHo3xRPu0KyS+G6Gm/o8YRsI624kZhPDT7GgjuJ+x9Ia76pbzM66QDGv/9Ehla3Mrljp2FijorlWReqhXluOjsb+vQGpDpp0nbSWeyTEaGr4c1vF1ul6p4fdyKi54OQJwLfigapFNArODuPCBHdg6cn/udChZrVeCgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620962; c=relaxed/simple;
	bh=2jKt8PDp65exMq+3NIxy36MA9YBeWKCVSjeOlQS/iyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jVNBktVBczEaZY3RsLnGIr80XczauJbQdd/zmt/+s+lVb7LFUhvfu2k9OpZz3aYxA0Ig24s8i3grBSW+5OrG0a3hWrjsdIjbtlob/t0MkNZifI/PLVWHoin8/adeKM+o/xwSj/Rb8xToTVPXBXQPyS/mqfw9vh2ddeERwrvi+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aMWcaVfU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aMWcaVfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791620960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TnYjiyz/pjlnsafpBhkX9T35Q6Sl82HjB82XNY2yD5k=;
	b=aMWcaVfU8vQnIT7nCj+aZ2IrNIfwVtMFjucisxnBQhATasP33eKYgiCCAbrrjEMnOJ0I3g
	RW/7CEvIO8+ku2NePIqcwB97x7IOgBLjQJrzCDKBvu77M1P5IhFoPYJZbbxoBNhmJlhjOQ
	kSL3qVGEGBDqzclxJMK5u/+McWfE56o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-KplirRT7PIG2ero--CFD-g-1; Sat,
 10 Oct 2026 08:29:19 +0000
X-MC-Unique: KplirRT7PIG2ero--CFD-g-1
X-Mimecast-MFC-AGG-ID: KplirRT7PIG2ero--CFD-g_1791620957
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54446180A204;
	Sat, 10 Oct 2026 08:29:17 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E7D5B1800351;
	Sat, 10 Oct 2026 08:29:13 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next 0/5] cgroup/cpuset: Fix various housekeeping check problems
Date: Sat, 10 Oct 2026 04:28:43 -0400
Message-ID: <20261010082848.193182-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Commit 4a74e418881f ("cgroup/cpuset: Check partition conflict with
housekeeping setup") and commit 103b08709e8a ("cgroup/cpuset: Fail if
isolated and nohz_full don't leave any housekeeping") add housekeeping
checks to fail partition changes that will violate the housekeeping
rules. However there are several issues that make the check incomplete
and missing in some cases. This series fixes the various known
housekeeing check issues and adds additional test cases in
test_cpuset_prs.sh to test for some of those issues.

Waiman Long (5):
  cgroup/cpuset: Consolidate isolated_cpus_can_update() into
    prstate_housekeeping_conflict()
  cgroup/cpuset: Consider all the exclusive CPUs when doing housekeeping
    check
  cgroup/cpuset: Do housekeeping check before converting invalid
    partition to valid
  cgroup/cpuset: Properly disabling partition when partition state
    switching fails
  selftests/cgroup: Add tests for housekeeping check

 kernel/cgroup/cpuset.c                        | 162 +++++++++---------
 .../selftests/cgroup/test_cpuset_prs.sh       | 105 +++++++++---
 2 files changed, 166 insertions(+), 101 deletions(-)

-- 
2.55.0

