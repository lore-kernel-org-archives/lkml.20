Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747881;
	b=eRZ3slTM/jZwqqTOqWc044coFxxbf/SK7A2fBpcTL40paFL1Lus5LIMLpnFQrAb0Ec8L
	 omoiw5kZ57qqaYwipelIAwmkMtxhZWt/6YeuHIsct4tAk2cH4eSLMFDgkGwB7+YhqzThj
	 kTXmp8IT+gxo4PURSmh4l9eTkHd8XnQ5D1xc159yjsTdEHCnwYKR00ATH51uj6PFcPEcM
	 MNcADSjLTg9yaCY9+kgzjw0GNH53DaKgHPmnxhzwmTLhfemiFl+wz0yIlcCwNcpJvHJui
	 kDEldyE4IrwoqfZ1Y5x7DNK3wakTqdj8Buv0ixyKBsVsxBXLwzaCeUWTQnSZcDLbAdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Tpy4PRbCAKzUQxsE7QsWxmFHgSXmFy5olOQ9La0VFrM=;
	b=LATN9af6+pVhm2AoC129xilDP6iv9/46QJ4c6ATioWGDWFz3CAqgzKY6ef2lnQFJp0Ie
	 AGJCVhdzcxCLl8WQAlCruR4R1shvFjG6VILnlQ8GkIplolZjE97EVWN6UlTJQW2fPD4lT
	 rtFhWN1fIWqZLS1p+ZSqX6/RV1G+SrCVSnbfmAOBgE27sUG244xImkF6CmhmgABHg1wJ9
	 A+loxjnqvne0b3MTd6VrM8T2WvzopGFOhoQMqybM+oUEoo0LrQgq8m/LqNs72J5uc8Gqf
	 39LXWzcPsr+L9s6MR16FTZlXXshMvdbCjUTnIUvpFrgi9xZ33xVNGxHf3tOmUiyn+7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rTEFWjiZ;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8490606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8490606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rTEFWjiZ
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8217177c5daso26502a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793747880; x=1794352680; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tpy4PRbCAKzUQxsE7QsWxmFHgSXmFy5olOQ9La0VFrM=;
        b=rTEFWjiZ+Jnsy3gRv3T/SnBBSgs9AUaL6vOE+7yMkR4XBNS3Uwkc4XCxp1gPzcq8nv
         tgsmCLCjmeSaBk0NK2skN3EmKF8OHvf8AIjR/8YFHPHBxVI/ICDM1PoBX0LUhExScW6K
         RNWUAWuTAPQPc/fKNzlwq1NEpW5lNGFSYB38/gKnXLdvpo2wcr9mirGVCwCY+T56/hNL
         0S20dGXcZ1hLqB130oDwjv83BXOpWAClDiNE9HBNuPhM9Qbrta2aHbrqAPkLk81WsAJM
         kTsqDIPCCaJNmKTKE84VE6jIbGrLzeQrVJpz/NzfUVWz1TfH+BD4Awsi5oxJiUyMKAsu
         7v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747880; x=1794352680;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tpy4PRbCAKzUQxsE7QsWxmFHgSXmFy5olOQ9La0VFrM=;
        b=DlULETB/2DqlXa0TCi2vWkZIaPUQPhc4nnBQRpQv6rvDfw6Gdyvd+Qvc6yPFzA9j3E
         w+FBlNSY+6zWDUKNDAe1M+D1j1ca3ZRMfEAJlEh5oIABHl5ZtOskTkv48HrfkiUib9Kl
         5vLItGMffrFRWrLThTu2/9YX8i/joRdpBp3noqBkorvEyFDOwSaZuAoDt88NQ8CTcq/0
         NONtY/j28pN7IC9281M5BFBuGPScGm/dsqXeJ5I6nDgl2Q0F2c/qhkZgImbUYVPuCwSj
         dNlT53MExHnttL3ZYOEMy3/V5H14Ys7Njnj7QPppfjiUXlSveYJ8u673V+G/gkKkJb1J
         1vQA==
X-Gm-Message-State: APuU4Z9FeT5pc6Msyl06gLXhG/bn4xSLJs2zAAGDuTvRhmjsFfxbtxVy
	CzxIvMFUhLWqdxRz2MguZ/YDkNSqJAmqwyRtMQrYnUaBzdqk8HoPPxh8
X-Gm-Gg: AYBFou2s4doionwD6VUUTxtU35CMJO+vY762sanzUfYtwJtUu3Dy9+fY7eclpfgTkiT
	cH6B8mdnnsGKxJECA5VJ+6cEgio8wMvTT+McnSJQVVtEtBXahk3HzZW56TzdCZ12KHtTob7hVK4
	VtxwyEkaTGxIahbYXUQ5qSm5SYq/SoRdj9kwl2dH5rg/Wjqbbi8Rup06UmCpd06fZtfP+T/Gy3G
	u5PJ2wSPP3DGrmX50shrA+744P8IfiAP9GWXjO3AMRcoD8GvlNLWyq7hh5feSELPI876l1DpEgZ
	tCl+jgncBk8wCGFlZYpAGFyawSVUeFBVvxDSVarF3d9AWSeeGTe/899iujv2ORbajcCq8SsBSoQ
	VNkSKH/j66dfiQF9SWbuKqgJR2F2Ii0IK1+xet3+z+3/kAZC02q9zzFdMWE9l5+kkpHLXOWsp7V
	ZFWoejmCix/GA73vaFeYNUPfXQs1DIFckYxJRJEZ9o5dWj/8OK3G1AtiARJnIWKEv9oUtVfg2x9
	uDWkeGRwkj8XWhBpAijw6hKNJCGSrBrF5DWgfYfXZycdymHqF+06DdX2lQI1ilViOvRUxxrBr6x
	4eEtPhaLng46/Dal2PgtIG2zcQ==
X-Received: by 2002:a05:6820:55d3:10b0:6f8:92ab:bb40 with SMTP id 006d021491bc7-714f2aa040fmr5152695eaf.79.1793747879615;
        Tue, 03 Nov 2026 15:17:59 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm358638fac.14.2026.11.03.15.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:17:58 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 03 Nov 2026 17:17:56 -0600
Subject: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
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
Message-Id: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MWwqDMBAF0K0M8+2AsUVjtlL6EcxVB/HRSSgFc
 e9CzwLOyRmmyBzoZMNXs+4bB3IV8TDHbYJo4kDc1E3rXP2QoitMViSNBYtMRxG1j+yWYBJ955F
 824/+yRXxYRj19+9f7+u6AYLwTM9uAAAA
X-Change-ID: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793747876; l=2356;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=yGcoZIDBoDZaoXv5N00ORiCdvk8UCgSBEFmG1SGHBlk=;
 b=zQlgFfpPbSA2D44pTkzsI0sGU0Rsc6rLUTwqyQEGX2VR7QZAXOcKKsoUPCQGI7WoSIgMJKuka
 qJexhsO3wDwDGxFK9Wmeb+Q4COKXl6pS2/nTm7WQ0H4X8fmjzwU6/s8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Since the driver probes as a platform device, the GPT clock event is
registered late in boot, when PSCI CPU idle may already have put CPUs
into a state that stops their local timer. Those CPUs wait in the
oneshot broadcast mask on the hrtimer broadcast, and
tick_install_broadcast_device() arms the new broadcast device to expire
at once so that it wakes them.

mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
clockevents_config_and_register(). The forced event fires while the bit
is clear, nothing is latched in the status register, and the waiting
CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
state in use, this hung the boot in 20 of 40 boots, and in none of 16
with this change.

Enable the interrupt before registering the clock event. The IRQ line
stays disabled until enable_irq(), so the handler still can't run before
the clock event is set up.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
MT8173 with PSCI CPU idle the boot then hangs about half the time: the
broadcast device is armed at once to wake CPUs that are already idle,
and that event is lost because the GPT's interrupt is enabled only after
registration. Traced on the board with prints in
tick_install_broadcast_device() and mtk_gpt_init().
---
 drivers/clocksource/timer-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..1b2cbcc2795a 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
+	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
-	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	enable_irq(timer_of_irq(&to));
 
 	return 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

