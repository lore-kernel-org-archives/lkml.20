Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280993;
	b=ZOgEEQkZRUFieOxUljA4bTbGBmDMti/+evnXeRKHtQ8Q4dKqHALWWoYqE3m81RZ9ZgNB
	 Zz+1YJXKGW7sd/FADSMJ1Krio3inKDZ5PHudPsqv84Xcqru83AdNF9gEU7tCI+CNkgua9
	 5nYGcouUKqcLubCScf2eXYZZEgSQGZc49I5Njko/cRZeWCO/ab7C3LlzOpi67L3rA+hpn
	 +nhEKjjGxVkDci5qUdk0yLKDaQtRWOp1QpxOYVrKCdrqOIhWmRTHGeeReMsPuFTVYtEVv
	 TLSVoUePUxZ3NM/7nqemL4rmlrIwWRRqU7KAu/1xG0dh3onM2MwCF//pay+5UZjUgPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280993;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=A1P82utl4Io0xsJbtO1DOGIXdrEc/LiH8oRZ1H4OV5o=;
	b=xAYziWsMhEhKVpDSRfHvJ7VWFU3Khhh+5dM25/ahQFq7O7t3f/7Sw0vqgDSwsLG1cNao
	 BvLi///20zGyMhxC2cWW+Lysj1NM7JWIlFbXIBIdQbETLqNTscCYR4FnTrvqVdt5+Ju6z
	 ht+ooO/fzVuPHPCMsH2+nJ9kY6Fn19iMJvMXz2tY+aQVr5ryTyd2Mb20wwoCVfWSgUpCM
	 nXHUYs8g1jYvOeWjnntc67n0lT9z/YYRVSHS00038oObtiBi6zY22fRjjNJ0XFxeqUfA3
	 QHp0lDrYs07XEcbx5Czy43RyG+6tHxjZsNy3iNnNgX4hcRioqMwZsBhjuZLdEdZhVVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lUJYcFEE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lUJYcFEE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346751F01825;
	Thu, 29 Oct 2026 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280992;
	bh=A1P82utl4Io0xsJbtO1DOGIXdrEc/LiH8oRZ1H4OV5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lUJYcFEEsv4wWW+ZS18Lzdk8jR1BdOYu9JzYXW//+I0HEwD8g/LcLdGbWK50iyVEK
	 yuFxHD/06AlgEnqC43Pk1JV4WhxJEnn2sekTfE4mBkgcxhgHbBgrXeMphY3Uuxb8EE
	 yyRNnfCDBZJauNC/9nYC4NKFypMbk9OTH2akB1Uux3wvcWTdYflqttPrBvCnUJFw0S
	 2gdzoZrVLN8lxo/no7MU1FJVgHNzqkCNapRI1SigcAYyZD5w5PoVknBBR1+u6/qTXv
	 /lhLjS6HRdjTb207UYYraaDxzcrrlyG5B+lWfpjQO9mOuMvk2rScfJTepDgGJNozC5
	 74z6uAIJ+hdlA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:35:59 -0500
Subject: [PATCH v4 12/31] accel: ethosu: Validate timeout command offset
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ethosu-fixes-v4-12-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

QREAD is supplied by the NPU. Check that its command-stream offset is
word aligned and within the validated command stream before using it to
index the command buffer in the timeout diagnostic.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_job.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index 3976115902e8..77218bb17006 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -345,6 +345,8 @@ static enum drm_gpu_sched_stat ethosu_job_timedout(struct drm_sched_job *bad)
 {
 	struct ethosu_job *job = to_ethosu_job(bad);
 	struct ethosu_device *dev = job->dev;
+	struct ethosu_validated_cmdstream_info *cmd_info =
+		to_ethosu_bo(job->cmd_bo)->info;
 	bool running;
 	int ret;
 	u32 *bocmds = to_drm_gem_dma_obj(job->cmd_bo)->vaddr;
@@ -367,9 +369,15 @@ static enum drm_gpu_sched_stat ethosu_job_timedout(struct drm_sched_job *bad)
 			return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
-	dev_err(dev->base.dev, "NPU sched timed out: NPU %s, cmdstream offset 0x%x: 0x%x\n",
-		running ? "running" : "stopped",
-		cmdaddr, bocmds[cmdaddr / 4]);
+	if (!(cmdaddr & 3) && cmdaddr < cmd_info->cmd_size)
+		dev_err(dev->base.dev,
+			"NPU sched timed out: NPU %s, cmdstream offset 0x%x: 0x%x\n",
+			running ? "running" : "stopped", cmdaddr,
+			bocmds[cmdaddr / 4]);
+	else
+		dev_err(dev->base.dev,
+			"NPU sched timed out: NPU %s, invalid cmdstream offset 0x%x\n",
+			running ? "running" : "stopped", cmdaddr);
 
 	drm_sched_stop(&dev->sched, bad);
 

-- 
2.53.0

