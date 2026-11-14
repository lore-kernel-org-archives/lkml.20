Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.82.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665090;
	b=oV7mmbFGmEgDDzs0hl0pP4KmiJHtajLYbmtwSXU+IhvFuUdJhKTleAHbi+QHgtj5wRBd
	 JxDpaSdSgzEdqsjE2Uk0CK/J1GjuRFYGQYpBFh5Fp26O4VLpy7D3ZAIxXMzIbAZq0xxur
	 cP8iISTQb/xjDreju2IXQcPSGzq1MveeHtNFhD0470bpkusGtFMoUp15aE31hGxuZYYF1
	 K0Y2ug3sb2k24DSO16ApiWIZAPGPAvHrJ+ALZz9nO/KOnU48rEL/+kirpo/BYNlLx1yyU
	 Cv+2UHHV6cIETMjMKev7p+Jbhmmf0Pj9Fd3GargfYxJYc+TfpgRtWH/0h5kU9KsCKgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665090;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 References;
	bh=LArHksXx882LvxvjREY6QLDBRLeXNNSTIylaOqhXQaM=;
	b=ytA2to9N0Q8RU2JzY+NDmYcIxM0VZ4tOiJr+OTRMMFVWx7n/IOsvd5LBMFPUl/7Ehz9S
	 TSia8hAy8xuZK3wEE0KsDwXAzfIGCTJmepCza1cl0EdoHO/AIxfv0SRlMgK+PC30oSr9t
	 APQncANPhP2rBi+JJIJ8UKxx1H4jh6C2OwkQ6N+Ux2Cl/cbm2epGSf0ae+bQGK+gEOP7M
	 oRu4AlUY9d2T3Y4g7IxnWMmhzxIrJDZUanIJQEHZZUtgRrBgwV+/lcqfwPAoY9tYH6C4E
	 nU2+R1e/tPSMWh80q9GlnIVmFYdPXa3Oy2Jz9vxr0O6bOJNpqKRxxpKMVab1SAJfbOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.pl;
	spf=pass smtp.mailfrom=yahoo.pl;
	dkim=pass header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=KhTMtRM2;
	arc=none smtp.remote-ip=34.2.82.16
Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB3C606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB3C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=KhTMtRM2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1794665087; bh=LArHksXx882LvxvjREY6QLDBRLeXNNSTIylaOqhXQaM=; h=From:Date:Subject:Content-Type:To:Cc:References:From:Subject:Reply-To:Content-Type; b=KhTMtRM2bwwNdd6lgu0V+1ySGpmlqwbxNe+Tp2epGyYfDJONj6qu4clAETZffxPav7ev2xXqs9cMtrMmVB+5emOY/P23qVgZqoqYAHIdGoTGIDYACeyU6aXMvw3o27QM1D7jj6PVxHVZTGDMG7Nd/t/eko9oSEJVuHxndsxWDYqg7jT9ISZB870QYrSGYsxEyqlWmJw4l21iiU75OrpbsPCfX3B1audnoNaMO+Z/fEHYgKYXatOavQfwwiV8FsfLjAnLgyjh1ek/i9z7QznwG8UDeEBFK6tGuOC7jIi80QvhtUFXGlIWCX2/4vp5zvByeWvcgFB2JF+IrTO/QSiNkw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794665087; bh=nja7FquGY0bVxl6cGwjrnXL3GPFDzIRUnUyDyk3v0Hg=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Xx4BoLNtxJ+eKbJWpu+z4zdKZoj08+eTPUyhRbjcqT/yMRvqlOzLrw+xJ6VSLbTC4ArpBmra32g9K9vRDMhymtjqeu+8uLIzxyoREnqZj3y56Wb4Nhc4dP7WdwxX/Zo1k8dSTo+m/i4bFxaNt6RyYveJ5i8NJ/A42lfvAZPYT7n6+NFXW0c4x4bfZ0zHSnf7w7VII+z1xxNTLzikN37C5tk3JaF0v8XT26RddFOUih3mNiktJnFisaw7qOKsmsK8SgruNgTf3UL2ryBpj+LSWqtz9AY6BMoOKBh+2h4S4FOCVkjdj3vVyTElOM3Ej6slr+3hXW1JVMy905vwEyqbNw==
X-YMail-OSG: NxudaJ4VM1nJnKdLE5.aAHPU1R9vlfucBKMZrYLzxN4nT.f.wxmDZ.vl8nbkH4.
 BgZ2ZLMKGPoKseFLvIVpXUEWO7bGKkdgJ8B7crHJCoGlrhdXZXjzJgGmEkmdxsnl0CBsYzrO.Jpb
 ZbctTNhVrnsl6wglpxkpLQfTq.tbNjtkQhyA7TtXc7Vaofsqa6nmkYY0xdzb9tPB0PKtARpB55b4
 3dHwxxz8T6um5Gpxtlb1zMzPcQcVkQzpT3NeTjdr06Tm2j0UwDXd_6yT6w_bxnmGB1d05ZRsfX6y
 p9.qWyOgljzma.nIdwMTA2bSDkJKZw.WFiWnJpsMnYXIyXCtBY_KRV85i_cg85e5dOSQT9VvFyG2
 ozI6mpNivN2T.IG.eMCmsNbjpZ.Xwo1wtGE.IpiqkqYKWgSp5txjEYtSfzsjp3XyrAaMwwFlm_jP
 SCMCFmJHeEfERUKoPBRyOoIizTm8ayrLcCzu6V86bmNRmOsekal8KWf20lyTAJhpyO.Ag0kj5MIX
 gKk47eNfx26bTUFiGQRG4vw9c6HA.jxMz.9xEZc3maxsg7HEl9HHdxXcqKLfs2sPho4pJLsmYTes
 KVMee2N87uCowovwhEYInMPPbHvlF5KbOFp4UzqyWKSnGfnY2n39yKSefDeNC76GhHbLXpuTsRLg
 sUFJYve5IEiPcxWHAlNUHoxwQm9U.vbuDWojw5ElB_OS8mxv2Fc43qZutM8vOmlJLB8z9GU.UAjU
 PonH.GSDaiDeYA57L8fgA4WYo2C7qezO0PTV5c0seHa4jQexRKOsLncCncOTHl8iquylDpfZvBKF
 umkP1Sz9ytFwh10eg12R1bokiYZAQtAVhaSeQ4KE.xwjfpbKUYwl4MxzsFpr7qC1_pV5_uTNFCam
 VG1aX4Zs.xL6S_NmVYqbOM76nnuNFpIpiaW8KnC2rZbt8Y3DiNuhcoAV51ckyZrewifi4Rze_le6
 3XbzRl8p0P4AQTC3NWd..np9dXEe_0yGUROP7QWv4HAVh6SRKsY7T.WM8xf6l_cYZqAqnBbC70XM
 EcJQ4GJ0qz367sSf_s16jAPtBVPetXxFhs8Jn4REVAOqIcZjOUbXtFaLgMyEkDS1BNUmihGbRwnv
 Ci2xfESmjwq50SxIVkUc92V7DzpKJKtYg81QrbOlAlEO9yzZ01ogiTyDjvSnQjZowaosYUL12hJv
 DiVWp16BSnzhQucPwkqOZadxIni.Ba_MKaKWvSpfu.XzpndoUJib_MjLDz5Gt66oQFKSvSUmwcys
 6ffGbPpC8hReaVlhwT_oeLCdu08c6.7SKOEt07tekhjkrCZVpbndANup8oFcSVoBkeax2qSFWIV9
 nMAAC5w2UDU_UG.RGN7o3pYUMpuGdhzyYiK9OTzQFWanjpYJ0yQGdxZZHRHsSb3fR1qz8.VTA5zq
 bcnYvgGq.1Y.ihx5YqI0J8wiFeRuAHJEzs73a0KnH4lzn7ZiMxQ5Ovw0ye8ZgzYPch0Mqxhj6nBD
 XuNyS14qxuoyyOgeFfMfIrXIRihvf0TzKiy6hSV2bUpnrdQoq9q3koSp7xOgcEqpYBKCvSpqaRgf
 Cs1H3KBrMY3D9JyFbNNcjm9ymX_8pnghigELzzL4HfF6PlQKtJElp2eQJ4D9Kx3K80GPDlA1skR6
 NMnGoTJ.1_S14kUKthM6KZlsR0pjgVpg3f2vt_bEOcdeFBBWDfET4BItXKppeTugLUT.yY0LopN0
 hX5BRhZnraUIWC7jHUne1S0ql_ZfSWJbS1S3PQmgP0thkkFZyAxRtBYFGXp1HFZjWFfcz3PrdyGj
 nXn9GFjPT4WXcHDv.2JlzejJ0WOnx6es.QoYKAZ1O6BIiqAyqSGU7TcccPDjELoSfpitvJIrPOku
 cWiA7JYymNx_TTkZWZvVuZKWWcFWD3g1w5DbyO99dq3yoKe2NJ_to8nQRZWyku17dRk8ItSoRZFH
 OoiQxuu.1vXUlQEComp1wCYrQFpadDOFQYZM.zgYQZd0kqGgMwPkJJp8c.SrQCfqCZGZ22DMzzHL
 94lB7dMxCF1QSoJ9oNtVqwQPF1hQEEpnieFiBYqw-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: d54309e1-8636-4d48-b2d0-538bedfe1ee3
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-104 with HTTP; Sat, 14 Nov 2026 14:04:47 +0000
Received: from dip46.lsn.ir2.yahoo.com ([87.248.99.55])
          by hello (SMTP) with SMTP ID 83da8b2aca0211a601e704a13be817fa;
          Sat, 14 Nov 2026 14:04:43 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 14 Nov 2026 15:04:41 +0100
Subject: [PATCH v2] platform/raspberrypi: vchiq: Stop kthreads on
 vchiq_platform_init() failure
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
Message-Id: <20261114-vchiq-probe-kthread-leak-v2-1-72735334a731@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7RimSEVX3sOwaGGwFUKxxUZCu
 LuAF3D5kvffnyGwtxzgmszgOdpgXb+COCRQGdU/GG29MohUSCI6YayMfeHgnWZsR+NZ1dixarF
 oJJ0LeclVlsE6Hzw39rOn7+WPw1s/uRq33mYYG0bnp/070ub9cRMJCbXUoiHORJqnt0kZ545DB
 +WyLF/JUZg00QAAAA==
X-Change-ID: 20261114-vchiq-probe-kthread-leak-8f6178695a33
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Umang Jain <uajain@igalia.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794665082; l=5445;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=nFskL7sdI0QtBpVIAxqrSqNa+hu6nhp1HW6ukvKlzhI=;
 b=jY67Lg5Pk/Tla8gXiL+D1BEYX1mbVtEAvhg8VE4uBs2DRWo34SRtTsMCLOwaUBtP+/t33cL0u
 vWVc+XS3KcZDoGTsC+LjzudZ5DTKRMOGntf18iI8QeOG4aqhoHd/qSh
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20261114-vchiq-probe-kthread-leak-v2-1-72735334a731.ref@yahoo.pl>

vchiq_init_state() creates and wakes the slot handler, recycle and sync
kthreads. If a later step in vchiq_platform_init() fails, the function
returns without stopping them and vchiq_probe() only propagates the
error. devres then frees what probe allocated, including the driver
data and the slot memory the kthreads operate on.

Forcing the devm_request_irq() error path on a Raspberry Pi 4 Model B
makes all three kthreads fault right after the failed probe:

 bcm2835_vchiq fe00b840.mailbox: failed to register irq=34
 bcm2835_vchiq fe00b840.mailbox: arm: Could not initialize vchiq platform
 Unable to handle kernel paging request at virtual address ffff800080ba402c
 Internal error: Oops: 0000000096000007 [#1]  SMP
 CPU: 1 UID: 0 PID: 370 Comm: vchiq-sync/0 Not tainted 7.4.0-rc1-trace #1
 pc : sync_func+0x44/0x3a8 [vchiq]
 Call trace:
  sync_func+0x44/0x3a8 [vchiq] (P)
  kthread+0x128/0x150
  ret_from_fork+0x10/0x20

If the kthreads are asleep at that point they are left behind instead,
three per failed probe, still pointing at the freed memory.

Map the registers and look up the interrupt before vchiq_init_state().
Neither depends on the VCHIQ state, so these two failures need no
unwinding. On the remaining failures stop the kthreads with
vchiq_platform_uninit(), as is already done when registering the
character device fails. Add a forward declaration of
vchiq_platform_uninit() for that.

The missing unwind is older than the commit named below, but the
kthreads could not be stopped before it, so it is the earliest point
this fix applies to.

The bug was found and the fix drafted with the help of an AI coding
assistant (Claude).

Fixes: 863a756aaf49 ("staging: vc04_services: vchiq_core: Stop kthreads on vchiq module unload")
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified on a Raspberry Pi 4 Model B with a test-only one-line change
that forces the devm_request_irq() error path. Without this patch the
kthreads either oops as shown above or, as in the test run for v2, are
left behind: 12 of them after four failed probe attempts. With it probe
fails cleanly, no vchiq kthreads remain after four failed attempts and
the module unloads. Without the forced error the driver probes normally
and audio playback over VCHIQ works.
---
Changes in v2 (per Stefan Wahren's review):
- Use a forward declaration of vchiq_platform_uninit() instead of
  moving it and vchiq_platform_get_arm_state() above
  vchiq_platform_init(). vchiq_platform_get_arm_state() needs no
  declaration, all its callers are below its definition.
- Link to v1: https://patch.msgid.link/20261114-vchiq-probe-kthread-leak-v1-1-b6b2f1e32050@yahoo.pl
---
 .../raspberrypi/vchiq-interface/vchiq_arm.c         | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..3e5c10039b4e 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -187,6 +187,8 @@ void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(
 }
 EXPORT_SYMBOL(vchiq_add_connected_callback);
 
+static void vchiq_platform_uninit(struct vchiq_drv_mgmt *mgmt);
+
 static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
@@ -243,10 +245,6 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	sema_init(&drv_mgmt->free_fragments_sema, MAX_FRAGMENTS);
 	sema_init(&drv_mgmt->free_fragments_mutex, 1);
 
-	err = vchiq_init_state(state, vchiq_slot_zero, dev);
-	if (err)
-		return err;
-
 	drv_mgmt->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drv_mgmt->regs))
 		return PTR_ERR(drv_mgmt->regs);
@@ -255,11 +253,15 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (irq <= 0)
 		return irq;
 
+	err = vchiq_init_state(state, vchiq_slot_zero, dev);
+	if (err)
+		return err;
+
 	err = devm_request_irq(dev, irq, vchiq_doorbell_irq, IRQF_IRQPOLL,
 			       "VCHIQ doorbell", state);
 	if (err) {
 		dev_err(dev, "failed to register irq=%d\n", irq);
-		return err;
+		goto err_stop_threads;
 	}
 
 	/* Send the base address of the slots to VideoCore */
@@ -268,13 +270,14 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 				    &channelbase, sizeof(channelbase));
 	if (err) {
 		dev_err(dev, "failed to send firmware property: %d\n", err);
-		return err;
+		goto err_stop_threads;
 	}
 
 	if (channelbase) {
 		dev_err(dev, "failed to set channelbase (response: %x)\n",
 			channelbase);
-		return -ENXIO;
+		err = -ENXIO;
+		goto err_stop_threads;
 	}
 
 	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %p, phys %pad)\n",
@@ -284,6 +287,10 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	vchiq_call_connected_callbacks(drv_mgmt);
 
 	return 0;
+
+err_stop_threads:
+	vchiq_platform_uninit(drv_mgmt);
+	return err;
 }
 
 int

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261114-vchiq-probe-kthread-leak-8f6178695a33

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

