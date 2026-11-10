Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286696;
	b=U8sOVdmwPBFpaNRhamXoATdBUV7t5OtM7KzibrjKztmV1mnlXKNLBTI2RBCHj/PdaQyG
	 K6m2766EHLGj0eWcTLwVk/nKyAoGLx/E1Xm2y1M0nvo43KVE7z25/vedv43IIZU4IVtgv
	 AHVowOFW8+sgRsuyaQ35d6zeBnurRuWEqKBC2AhAe0KuBDesBD5oFOt0k0MM23Fd8kVmd
	 B7gbiM5N1TgH34d9d3CCHOFvivNODh/sHHXuqVJNnhHhFl2nwbcJ36lIy0c9zXrE+szPD
	 NWVFa/VD1v7f7Gd//YTs9KydmvM/6//emy+wBNM92gXNR1+imTB6NmmYvNtYrGmiqYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
	b=xvaPds6HPAGxCo5HPAh2S322wPWIx1xa/myfnWYKHakX0gON9Ab109BNuqDMP0mBL1fu
	 N2+lfHCGzMNiwP54G0LSDAuBgWiOD9ZXsk6weid5y8dcw+Q8Hje63hCwTlu9yqaThrFzP
	 mdgD53ivcrIeS2vzk91XexMmkykxpPhvq3A7+WWJ6MuWux0niCDN+Yol9ZOQxqOQu3teT
	 6TGnPtQEDsKeVKnTyhTcxYfPWlS8+0pGS6QcmDGqq+7n1cZyjaJVJiPpFIKjRC/27stGV
	 GPc617j+tr3vUeBBnHlgyEK7OLR/+HmJXd6D+PPquhgx7h2/f4xgtmkcOH2PVHnvGnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NXv0S8FL;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C72560A2610
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C72560A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NXv0S8FL
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f3c8958d5so179761285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286695; x=1794891495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
        b=NXv0S8FLOQHfhuO6I2CqBGOOuCAG4lhUOeaMh1B27tF2xMlL7EajxdrJ9D08qAvZzS
         hMYCojNslIXK3SYzg2S1GlJNvnd0NN+fTUpCVyycsdK9wwyQlgWf2xMK1Y5tgX0X6Xls
         diQpEv0AECqtRsIiaQKBeki7kB1bIucOSUpyNNzZ9aQn8SKztUDqGB9iKPr5hJBHD4mz
         E1cMUbtoQPOHOsSTpBzHXuFItKjy9nB3GFWRpjit1gXuy7Sk9TM2TCW7czZGPoA3iSNX
         6AaJYmf4PjHpVrjhfF/xEyCOl/oG3nEy0X3KXTchvY0ymBsRsNB5NQiYmzFW0X+PYfbT
         2npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286695; x=1794891495;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
        b=ayq6y97T+LHBZONMHlfR/WEnO4CFqKpM3HTVyae8YalahWfloKRzdRtPBJ1cSDCaG9
         llWLvZjHng740DRdARi1s4s3AdUYOcgIZwM4+lz8/s8PvGM6q0A6tck9ZsoNvNMRGjzA
         iKJD3TMD/5Aft0idoaSQ2yNW6yeXR8LyV/C1Uf4CGvbvPYt69LnxPBa+4UHwh2FTKDk3
         2rmSRPtwveO5Q2uQoFgnP5RVnpr6/ps2dy98P+OxW4Ax4EGkX4i+JJbE4NxnEHEXps/v
         6a6FS3TCTPrp6a7ANkG7CiPPVGYPaadNTmeMpmNwzkOkWDiYrNSlMDsiXiJIS+IxfCi7
         UUxA==
X-Forwarded-Encrypted: i=1; AL+hErG+AruAg23TPoMF6NK2L52HPUQT6jTGuhYipwyudMLRQOtKKZhdHsNhHTMs0l+Vfzw8FIWj9D0HzMOtOus=@vger.kernel.org
X-Gm-Message-State: APuU4Z/09Plwq/xD01DA7TG6POYhqRIyCEpvhBSwCqGI7Mp3G1aEAihq
	VLIAMbgRjFdbplLXIoHeGi382wscX/+VG30bT/kdoXPmAdo9iJLp4WE=
X-Gm-Gg: AYBFou0H8pjEaDxdCy63oSye733Sq6lQGaFIbKj3EpVTx6h/yGtk8qZKMNqLaVZ+vjU
	0t/5NjI88dX3pVU217w/uxeHOaQ1g8eHKH7dWfEgfxI2AlJBEOVaQ8sCd+abTUiiPiloJNxwJaB
	K0wPnVhvDM5QF3ACXQ6Zkd0A3uDGCy6OjN4w+1tSFl7lOOvZTfxGqR6k259BfhwdDnsyDjoQzjE
	zBptolAVlcwrn+7oM4TtcHrC1Ck/x8HgSHWvGGoaIxjXMhbMPh39nyIX6iiwx6aB2juhsChlhoa
	ViTYztDcaqK6HJQJ6MGNu0Dkn9XrhLG0tuLp5igest5IddrunJJiVM7l7xU1V4F0M4F0REsHVCy
	6VNuzAtuNNpzi7pquH78ORA6r95cUENHzyn0Ik/ID1lIbpKz6TYzfN9CCP6xYgB7h5tXgSzTZrE
	kuMmvvE9WKNS06mDCh5PWJqS1JZVyarF4VSjjDXIRmca9qOn31XY/INqUGkOYzEu4Nw4BO85Upf
	b6Vq8Mm+X6ta5VlNP3o1drtcaEBgUJgIpThYA55IFdFXehKsxu+/pKbCEuElMBRRBq6A0o4zy6c
	OvHp9ZXRs0h5WknwlBTlTI1w0+uqmM18InAIkiOGgkTD4ss5nN+0/JlBZPiXIK8VfQCaOT0TYlO
	o771n03LzKw+69QyWlMKRc7gOigSbT/09BOXDPhj1Ee7n2Uu0gn1vbMCIGoU/fDwxpmTJjPBz3n
	0LgXPA9AK9fw==
X-Received: by 2002:a05:620a:2614:b0:947:8018:978e with SMTP id af79cd13be357-9479f22d879mr260742685a.6.1794286694660;
        Mon, 09 Nov 2026 20:58:14 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:13 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 2/2] media: aspeed: drain IRQ work before stopping the engine
Date: Mon,  9 Nov 2026 23:58:09 -0500
Message-ID: <20261109235731-aspeed-v2-2-mhun512@gmail.com>
In-Reply-To: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
References: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Last close cancels resolution work while its IRQ producer is still live.
A handler can queue work after cancellation and buffer cleanup. The worker
can then turn clocks back on after stop has cleared VIDEO_STOPPED.

Release the VB2 queue before shutting down the engine, since streamoff
can need capture and mode-detect interrupts. Disable and join the IRQ,
drain work, stop the engine and free its buffers before re-enabling the
IRQ. Check VIDEO_STOPPED before enabling clocks in the worker.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Split normal last-close ordering into a separate patch.
- Balance IRQ disable/enable within stop; add no reopen state.

 drivers/media/platform/aspeed/aspeed-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1423,6 +1423,7 @@
 static void aspeed_video_stop(struct aspeed_video *video)
 {
 	set_bit(VIDEO_STOPPED, &video->flags);
+	disable_irq(video->irq);
 	cancel_delayed_work_sync(&video->res_work);
 
 	aspeed_video_off(video);
@@ -1438,6 +1439,7 @@
 
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	video->flags = 0;
+	enable_irq(video->irq);
 }
 
 static int aspeed_video_querycap(struct file *file, void *fh,
@@ -1847,11 +1849,11 @@
 	struct aspeed_video *video = container_of(dwork, struct aspeed_video,
 						  res_work);
 
-	aspeed_video_on(video);
-
 	/* Exit early in case no clients remain */
 	if (test_bit(VIDEO_STOPPED, &video->flags))
 		goto done;
+
+	aspeed_video_on(video);
 
 	aspeed_video_init_regs(video);
 
@@ -1901,15 +1903,17 @@
 
 static int aspeed_video_release(struct file *file)
 {
+	bool last;
 	int rc;
 	struct aspeed_video *video = video_drvdata(file);
 
 	mutex_lock(&video->video_lock);
 
-	if (v4l2_fh_is_singular_file(file))
+	last = v4l2_fh_is_singular_file(file);
+	rc = _vb2_fop_release(file, NULL);
+
+	if (last)
 		aspeed_video_stop(video);
-
-	rc = _vb2_fop_release(file, NULL);
 
 	mutex_unlock(&video->video_lock);
 
