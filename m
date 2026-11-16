Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792243;
	b=h/sdj5a7ByVlG3EhC+FPkxZCvQo+mJFE4aWC+T+Mg6Pc/kMMCf+WwoPuzYhsXgLFYJGq
	 FzkFnkHwDtM8eNN4OMttYi9cjPRxcmAG1Ylr1D8B4lplaZr7dRfdz4ca/uy3LrdpwrQD2
	 S5n/vi5dEAe325ZpDKx15MbM9UtLNtLZ2b/2D4KL7TNTAF4S3JW3Xkv606dd2jsJS9QiP
	 ezfKKWei9qboeUZnCEbqFFJyS5KRCeH+xCcnKVa9g1XSSXiEnBSaVV5wwiTzvcGazVAgm
	 G/zFy2aVEnpvE7RviaoayPI+c7VNY6O67taCd8zU+xSLEZPbFQuUTj1ydk6jvv/BhdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792243;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=DMQwrY6kIL6tGeY1mSLslHZcBs9nPfXd3bumbsHQnZw=;
	b=kjzmbfR1tQA7mWI7mNnQolYKpINwnwnR15wq7X7N1+vNg60Yj3aG76jKlZYb2B2Snk2h
	 4QtglgKGv1jyv4zQzIDbLq/AS7dEtb0XORu7mm6I9MufbZ8xe977GB28x4R5a+FuFvVM3
	 pkxtFCQgr6TolZAWalZk7pAv1j/Git2gN6x8jaxEG1Vgm4DGhvzdFsyQDvYgQFobcyJdT
	 iloARnQp6i76ZSkNTAoRaRdtvqcwxmftII43HNWxUtTkEKDKz4v4li/+a7MsGcgwdFV+A
	 FueFoOXnDEPSvo16B7JIG/ct1koO5dgwmpZeNyGOlwaWAoKBKDcxovJaCEHhw2Gwt7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NgeoYIGw;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8794F606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8794F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NgeoYIGw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794792241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DMQwrY6kIL6tGeY1mSLslHZcBs9nPfXd3bumbsHQnZw=;
	b=NgeoYIGwOG8qR6sx8VCBcz17jBF5HG0K68c2DDpTtKzV9RbW1p97rnjD4UwEvthwECplWx
	KJ4s31qCPbvUTotCG39fqGfQRQHtcFc920ZrMp6RX0YXOtSPA8BNvbTcE6owpmGENIogvY
	rWMFrhbuNh4tcHegA0ZuQTEm3uAe/cE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-B1eP2zyNOEaQGoMZHJIAag-1; Sun,
 15 Nov 2026 20:23:56 -0500
X-MC-Unique: B1eP2zyNOEaQGoMZHJIAag-1
X-Mimecast-MFC-AGG-ID: B1eP2zyNOEaQGoMZHJIAag_1794792234
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F2AA2180049F;
	Mon, 16 Nov 2026 01:23:53 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20942436;
	Mon, 16 Nov 2026 01:23:51 +0000 (UTC)
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
Subject: [PATCH-next v4 2/6] cgroup/cpuset: excpus parameter of remote_cpus_update() must have at least 1 active CPU
Date: Sun, 15 Nov 2026 20:23:05 -0500
Message-ID: <20261116012330.2271010-3-longman@redhat.com>
In-Reply-To: <20261116012330.2271010-1-longman@redhat.com>
References: <20261116012330.2271010-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

It is reported that remote_cpus_update() fails to invalidate a
populated remote partition when an ancestor cgroup update reduces its
effective_xcpus mask to only offline CPUs.

When update_cpumasks_hier() updates a descendant remote partition, it
passes the new effective_xcpus mask (excpus) to remote_cpus_update().
Because excpus still contains offline CPUs, cpumask_empty(excpus) is false
and remote_cpus_update() only checks tasks_nocpu_error() when adding CPUs.

With the partition left valid, update_cpumasks_hier() computes an empty
effective_cpus mask and jumps to get_css. The populated partition stays
valid with no effective CPUs instead of inheriting its parent's CPUs,
and its tasks remain affine to the online CPUs returned to top_cpuset.

Fix it by invalidating the remote partition if there is no active CPU
available in the given excpus parameter.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-936b7155-f652-4146-a4ab-ec48fd392a1d
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 631fb449cef8..195d4e3a283c 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1810,7 +1810,8 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 
 	WARN_ON_ONCE(!cpumask_subset(cs->effective_xcpus, subpartitions_cpus));
 
-	if (cpumask_empty(excpus)) {
+	/* New effective_xcpus must have at least one active CPU */
+	if (!cpumask_intersects(excpus, cpu_active_mask)) {
 		WRITE_ONCE(cs->prs_err, PERR_CPUSEMPTY);
 		goto invalidate;
 	}
-- 
2.56.0

