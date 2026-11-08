Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161344;
	b=jMB7g1uauJQOkeGBnVrfUfY0weYEGhvcJQzT3ZwVyNDc2UsczzVKG4Gt4a55YEGVzznb
	 zWaaVoV3z70M0zkFcBbW1RTcSAr+oh1qPkvd4F2euVHF7S5n8yW8BiKgdhkR7Exbp4CNc
	 Wda33CZup61mwbuR/5ezOyWXzvFLJHyaaMfKOYtrzsk91cnX4fqPTKiuFL+3Kw7SS6AQM
	 fpe2/QA5vCsS7ZxpgexCmxa+qWtg/Q5H1HjSFh0aonattj7C1alZj1jJip2QSwThc9QtB
	 SUX0i9w/YBMeaEPFEKMJsNdd/7I7ZTXajuau47D6M0+KiACDXAW6sBky/IdgCwgyKBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161344;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=r4LeeaZF52pnSpC0XV+xdG30IIgq/XdFRCqAisuv3+0=;
	b=IicUfJajo73BEapGwN10HBwFo/0WCebuhhVx1Hyp3Sy6rL4JWTwTj8iI5YGeRNDo+87A
	 GwVCk3IiKsqbx2jnsAtGzAnpI+mEPXfi7XuATX8xjItLKVprlpEGV8u/UsA555sdw6Of+
	 1+/KApzT4/dt30s8dntfAmi3ko07NkAELuVrOnq2LELcnGe4ARCh7jeewxznA99RG+NPR
	 o8Q6KdF+WSkOBVq8HjSHHuVflFYvXF1FWghdoAcNQ0mn2sPfYR9iSnqo58aY3+2vyt3Kg
	 ymWuaDW2BGdb0PekwBgpiM0Z/rMpATVnsC59GcJQzusWghEfDZ0ngOowiOmL2O0G5Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aabXtMRq;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34115606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34115606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aabXtMRq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794161342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r4LeeaZF52pnSpC0XV+xdG30IIgq/XdFRCqAisuv3+0=;
	b=aabXtMRqUIUweLgerc73sTP1CiUseSiEc6x9IoTBjGK5ixFS12m3jPqqWpI5m/C1FfwV7s
	vzAfy5awDmhAc0+56rKu+EERNRT5szrQUl1u9UWpTPwyI1BG+xmjkEI85CaCxTdryTaUOU
	/Bb8BvoXKTOMR5Gzp+biSbcCdjvggPU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-O1p3BgwjOnyh42ow3OmLVg-1; Sun,
 08 Nov 2026 13:08:59 -0500
X-MC-Unique: O1p3BgwjOnyh42ow3OmLVg-1
X-Mimecast-MFC-AGG-ID: O1p3BgwjOnyh42ow3OmLVg_1794161338
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0FBF71800371;
	Sun,  8 Nov 2026 18:08:58 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92D811956041;
	Sun,  8 Nov 2026 18:08:56 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] cpu: Fix online housekeeping CPU check in _cpu_down()
Date: Sun,  8 Nov 2026 13:08:49 -0500
Message-ID: <20261108180849.1268263-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

There is currently a check in _cpu_down() to make sure that there is
at least one online housekeeping (HK) CPU left after the shutdown of
the given @cpu parameter. However the cpu_online_mask used for the
check may include the current @cpu to be shut down. So the fact that
there is at least one online housekeeping CPU at the moment does not
guarantee that there will be any online housekeeping CPU left for the
sched domain after the shutdown.

Fix that by making sure that there are at least 2 online housekeeping
CPUs available if @cpu is currently a housekeeping CPU.

Fixes: de715325cc47 ("cpu: Revert "cpu/hotplug: Prevent self deadlock on CPU hot-unplug"")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cpu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..ed641ee6b37c 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1415,11 +1415,14 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
 	cpus_write_lock();
 
 	/*
-	 * Keep at least one housekeeping cpu onlined to avoid generating
-	 * an empty sched_domain span.
+	 * Keep at least one housekeeping cpu online to avoid generating an
+	 * empty sched_domain span. As cpu_online_mask includes the @cpu to be
+	 * shut down, there should be at least 2 online HK CPUs at the moment
+	 * if @cpu is currently a HK CPU.
 	 */
-	if (cpumask_any_and(cpu_online_mask,
-			    housekeeping_cpumask(HK_TYPE_DOMAIN)) >= nr_cpu_ids) {
+	if (cpumask_test_cpu(cpu, housekeeping_cpumask(HK_TYPE_DOMAIN)) &&
+	   (cpumask_weight_and(cpu_online_mask,
+			       housekeeping_cpumask(HK_TYPE_DOMAIN)) < 2)) {
 		ret = -EBUSY;
 		goto out;
 	}
-- 
2.56.0

