Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251425;
	b=ys9JjsGudAVgdOfCETA9v8UuUzgo7bJeLyonrcp8NbEqnhQTgdCtjjYS+J465b5xD+4j
	 BfpIKy7rpBwQ4/tX7oLfiQ6obsVs4GB0ieVVaNE0NfUPUABkjDojgHcg9/bkokJkxAO/6
	 JXfjxkyQVG7KGzeq/D7f+yoHwt0a0ABfLSug+x6437+Ae/mRocrQ81hDghkwsvIZkD/3U
	 tD2pm0LG/68v4mJmZE9Uic5W8mm2nFtcZaYN+7yczLDf870FcSlamX/0oN5Cw9cxzf5n/
	 dvKazA/+MU2UAc87ODMR5DJ21eIfJCHNlFZiFyG/ivOLIZCM65Ic8NgQAjPacb3xM4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251425;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=v0mBl7hoWWZxgfiDy74OaVykDzjYIYsVcPspg6hZ9zc=;
	b=L3OWn63VOKfN2SID4gHJHbpnqe8Rtw0mmPD+OHfUkEqtdp2DoCfPRNKR3jBtqrRCqAny
	 nL0DYo0wslUCao7OiiPpBnX7nePxF+AibNOr+tbh4Us6JuHdcFSJ9MXy1SvtXx2smZMdD
	 ZyCFwmalLJeifKDtWWaGTrTt7CYI/rA/ZpHr6CgChcAqM1+nnBkTRojc8d5SKfDOqheqi
	 SIcxh2xpwhcbPzKo/jdoaTTwob7bWbLeXSyJ+f4SS7jUghuD9MVAlfEDt2/dM9FHk+pDP
	 0sZb5fvaN+/+3/fntAlSAM2U0PvIJTdnrZy9xY7fUglG8OGpTRGu9oR82XPt6cb0Pmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="M5u/AqsI";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC260A2608
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAC260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M5u/AqsI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794251424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0mBl7hoWWZxgfiDy74OaVykDzjYIYsVcPspg6hZ9zc=;
	b=M5u/AqsIVWp51yjnnX9RYd5nXY5XCGd+R+Pt9+b0IGAy+EJtG6CqiChINpVOqcMSxnyxJm
	OOPcEmBdPgg7s291z1LjhAtLMkWbBojiLvbvIqiUSjguyS/M/jZS2mZ9c58fGwMmkgg6yl
	xOC/TOgbPS9E9WDvVwZXgosUD6S7E/E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-BrF_51FsOnOdx0YXRB8gKA-1; Mon,
 09 Nov 2026 14:10:20 -0500
X-MC-Unique: BrF_51FsOnOdx0YXRB8gKA-1
X-Mimecast-MFC-AGG-ID: BrF_51FsOnOdx0YXRB8gKA_1794251418
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79EE81955F6A;
	Mon,  9 Nov 2026 19:10:18 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9A7C1195608B;
	Mon,  9 Nov 2026 19:10:16 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH-next v2 4/5] cgroup/cpuset: Protect current->mems_allowed read in cpuset_fork()
Date: Mon,  9 Nov 2026 14:09:54 -0500
Message-ID: <20261109190955.1398611-5-longman@redhat.com>
In-Reply-To: <20261109190955.1398611-1-longman@redhat.com>
References: <20261109190955.1398611-1-longman@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Reading mems_allowed of the current task outside of cpuset_mutex critical
section should be protected by using mems_allowed_seq seqlock as the
nodemask can be updated concurrently leading to a torn read. Such
protection is currently not implemented in cpuset_fork() for the
!CLONE_INTO_CGROUP case. As a result, the child task may inherit an empty
or corrupted mems_allowed nodemask. This violates NUMA memory policy
constraints and causes subsequent page allocations to unconditionally
fail, potentially leading to crashes or spurious OOM killer invocations
for the child task.

Fix that by using a read_mems_allowed_begin/read_mems_allowed_retry()
loop to protect the mems_allowed read.

Fixes: 06f4e9489891 ("cpuset: make sure new tasks conform to the current config of the cpuset")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-601100b4-fa77-45fd-99f9-bfbd4385201f
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index e9b84671af21..7aa614c6ac4d 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -3868,11 +3868,20 @@ static void cpuset_fork(struct task_struct *task)
 	rcu_read_unlock();
 
 	if (cs == oldcs) {
+		unsigned int seq;
+
 		if (cs == &top_cpuset)
 			return;
 
 		set_cpus_allowed_ptr(task, current->cpus_ptr);
-		task->mems_allowed = current->mems_allowed;
+		/*
+		 * A cpuset.mems update can update current->mems_allowed
+		 * concurrently, so retry it again if it really happens.
+		 */
+		do {
+			seq = read_mems_allowed_begin();
+			task->mems_allowed = current->mems_allowed;
+		} while (read_mems_allowed_retry(seq));
 		return;
 	}
 
-- 
2.56.0

