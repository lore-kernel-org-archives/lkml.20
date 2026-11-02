Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636954;
	b=eEWCdG8bHbzmADxV0S7CPSsAzoHXPFDfo1VE5/lGhAthqpTijnGqrtw8kubJpZiImDPm
	 rCN/E/ublLqMSBpJDt82Epwsy3lLby+i0TGOwSMlQbggLA/ad5d5CbXHR6lT/ZFI70V+K
	 56UC2JsyF4xWY9xur568Wwm10TowMw/dlmlzZCRyM2qfRrPEcqFew//QMsuDNylMWGQ+j
	 wpWeba/BDVruWO4AGyfyaGxw7lI5qYmHVXTVCcFrWbgePVjH3/2QadEjZaimO4XFqSENo
	 aemE9n+w/kRwO7ezo8zng0D3hP/PTwvSgEGULzvwsG8OMvPOu9vHlXJLtRQQbdBuU/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
	b=DAAOYpPFwQUg6RjEjaQH7M3VIvCRPWjgVEJQl6wJIjQSQuO11vBelP9ew9ybyRSp2zzz
	 MuWwlTbktHURV0PVuKNk9ddRdNzPWNyVPP0KBalQBLxAK8bnJKjyvmaHk6juneaA6u6Qw
	 AiuJuycBc58j9L4cAqUMysIHA+gWYP+A/LoLl4C5nbf2w57Mu16jxVnvtZPlTfs0XuEI5
	 GKE253UzTZ//WGwNiP0FMXDxh2xB0jD1jlrxXyOCnRs8hqb2WFkPpE39YYA/dnO/aiYLY
	 76VhxjCS2J+OY0+LMpxdlYBEii6UmAzE3U4IPMHNiVAQsiUOJEhpF1mclJMJcdXQWFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+fNIhL2;
	arc=none smtp.remote-ip=74.125.231.74
Received: from mail-oa2-f10.google.com (mail-oa2-f10.google.com [74.125.231.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7FE6072290
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7FE6072290
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+fNIhL2
Received: by mail-oa2-f10.google.com with SMTP id 586e51a60fabf-49e545b61f6so904720fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636952; x=1794241752; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=v+fNIhL2joFNJ2pxaxx6m5yVmCE6m53/MxT1dJKzSETMC1zLCRP52FjoaA0vXx5q6S
         og3VLfRPF+NKFrooopBMUnnML9S3Buf9sc96wFDNeUDBY18LiVupQ/Mn3+7dgNo9JWjB
         1s96YtiL+RcUISqDngzzUyQ218ve6r80rOLzXscifWsETLQzEJv6aQ41QaGOVN27B96u
         kBVHxg7wQL8Yyf6xQ8XZbxvPx8sHxyKxJdncdP1aXOg0xFdXWt6d/jA40fiJyPDW/fHR
         T36H8meCdmklAluI22oUeLvNvQOrgtfU17pULTM0mXNJtHMbjdj6mQ+1dwkDCK9qXml2
         L73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636952; x=1794241752;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=2JWg0snpeoLlkP1+KMegFt3rfiOuwIrdbOFRk+5ZEGo8tXcdIvi2ADryXmsUyB5SbA
         kBPTrIK189dILNBKrEqeX85MBTIMO3ZCqEUVIznmuLoV6L8gia7ZZ90pGVSIdG38Ymez
         FbXyo9mn9Kz0axnsjAWLOeGre0yvjaNN8cWT+oXKU7Xb84box33EVyGhDc1eXcf3bcMh
         +QLpeEQvuhDkidFI+uUSY1N0SPEZf964Mg90XJpbR0QTQoGqVqe0Sbg65CRW/0jAVTH2
         Ep4X/lJ3g8pqzpgH5JFDIjhVjX9ZgwAxMJayFRdmY1rvJeGnxXY0GJkFiGAd549APIyA
         gFcw==
X-Forwarded-Encrypted: i=1; AKwUvBwOuqJHPRTg4+NtICIUeXkHW7Rym+rw3BHsmnrVG+VpqaY5RT3y/9DAUkSDt0CSky5eGSXCTQTyEkX9jBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ekBI02tpZPoLr25/saDDC6wwQ+GoMxNFjHteKerIpufpiZdvB
	JUkYNuGvgrE7cbs8+3RG2QCvooKdoTUaqwverbWTtxe17McTnbrSX+GX
X-Gm-Gg: AYBFou0xyUz7D7WgP5yemTW4qIiEo6+z5Fy2/+ovPLQxHibWkdb5TlJ+KYJUK4FPBGz
	qEK3H+HkiUGFR1rktxbDIeSnG0nDGPzaZiuZfKcckoDt946tHOFGzmFnSW9TMHKZ+MVkp0HYmxt
	WxL3ipYeEitxMS715mW+ZCbrr6I0kAYu7pp+58uWXMVYLDNgZ5MQH7f0hYmpJS+RYMjafaaZx2p
	tzZIVxCTzftKJanOijpzulJ5tuF7SkwWe/sW5CR6me80F5jeLzYOZhBX9f9cRK/rx7Ch4exYYrZ
	U+zZBogp/2kW6Zz++WoOU14/mamM/hdLWDVB0Oi8XGbTVsVFMzyDQ1x4tBeC/wmi99O8QzIOhRc
	MTWi3BHfw6ZGJgF7OXhMFxLJR6aqc9aTOWxf0UENXkD/B07UJ+JoNXHMm7W4FTxnSHUxYVN5K55
	c1nKweVxWS33jdWWxH1ZCiREjtMrp6F8vih+XQOuyH5qWsYocNCCejHReXePYtD4goNCeWrWDJC
	wTjFMu6lFzy8yyi3gNaW7Ys7xl3sHTSr/cpm9n5atH57GWfMkDpWHuaoAJEuoCNFqjDzuM05NNq
	ATJ64aHEyVAa6862PL5iTcvCoVzkhIRHpBQiSYMNOWG8bqPjal+C2n8mJIunbDumhAYft2KbcHa
	eg8pmTFE+AEpMC8ri4oo=
X-Received: by 2002:a05:6870:2dca:b0:49d:999d:c25a with SMTP id 586e51a60fabf-4a90729b213mr5773692fac.6.1793636952420;
        Mon, 02 Nov 2026 08:29:12 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a9219148cbsm6536719fac.3.2026.11.02.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:29:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:28:58 -0600
Subject: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
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
Message-Id: <20261102-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-70a74a392015@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793636950; l=3537;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=42nYDcBAxNvHgQbbkGEcmz3UGXdz42wPE9jsdKzwvQo=;
 b=kC0RERhuUqoTk8as12WfjWIGdzHEwAzcXv3BQz1EAmrEV2a2RHogHoPYdNRcJAHP1bpdGIw29
 IyWH+b4r1bkASVyiHtRjVZPsvygEInH+Vw97GdpHLq7l7zt7e5pSCGg
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

ssusb_gadget_suspend() removes the D+ pullup for system suspend by calling
mtu3_dev_on_off(mtu, 0) directly. That writes the hardware SOFT_CONN bit
but leaves mtu->softconnect alone, deliberately: ssusb_gadget_resume()
needs it to decide whether to pull up again.

wait_for_ip_sleep() then asks ssusb_gadget_ip_sleep_check() whether the IP
can sleep, and that function tests mtu->softconnect -- the gadget's intent
rather than the state of the pin. So it answers "pulled up, the IP can
sleep" for a device that was just disconnected, and the poll for
SSUSB_IP_SLEEP_STS runs to its 100 ms timeout:

  mtu3 11271000.usb: gadget (high-speed) pullup D-
  mtu3 11271000.usb: ip sleep failed!!!
  mtu3 11271000.usb: gadget (high-speed) pullup D+
  mtu3 11271000.usb: PM: dpm_run_callback(): mtu3_suspend returns -16
  PM: Some devices failed to suspend, or early wake event detected

and the suspend fails. The rule the hardware follows is stated in that
same function: the IP cannot sleep while D+ is not pulled up.

On an MT8173 tablet (Amazon Fire HD 10 2017, dr_mode = "peripheral") this
makes system suspend impossible whenever VBUS is present, which on a board
whose only USB port is also its charging input means whenever it is
charging. Unbinding the UDC, which clears mtu->softconnect through
mtu3_gadget_pullup() and so makes the check agree with the pin again, is
enough to let the same suspend succeed with the driver still bound and the
charger still attached:

  gadget bound   (softconnect=1): suspend returns -16, "ip sleep failed!!!"
  gadget unbound (softconnect=0): suspend completes, 20 s of 20 s

So record what mtu3_dev_on_off() actually wrote and test that instead.
Runtime suspend is unaffected: it does not soft disconnect, so the pullup
is still set and the IP-sleep poll is still performed.

Fixes: e69027c25361 ("usb: mtu3: allow system suspend during active gadget connection")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3.h      | 1 +
 drivers/usb/mtu3/mtu3_core.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..7f4fb87d8438 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -361,6 +361,7 @@ struct mtu3 {
 	unsigned is_self_powered:1;
 	unsigned test_mode:1;
 	unsigned softconnect:1;
+	unsigned pullup:1;
 	unsigned u1_enable:1;
 	unsigned u2_enable:1;
 	unsigned u3_capable:1;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..5ce61240194f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -346,6 +346,7 @@ void mtu3_dev_on_off(struct mtu3 *mtu, int is_on)
 	else
 		mtu3_hs_softconn_set(mtu, is_on);
 
+	mtu->pullup = !!is_on;
 	dev_info(mtu->dev, "gadget (%s) pullup D%s\n",
 		usb_speed_string(mtu->speed), is_on ? "+" : "-");
 }
@@ -1023,7 +1024,7 @@ bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
 		return true;
 
 	/* device is started and pullup D+, ip can sleep */
-	if (mtu->is_active && mtu->softconnect)
+	if (mtu->is_active && mtu->pullup)
 		return true;
 
 	/* ip can't sleep if not pullup D+ when support device mode */

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-c69c5104b25b

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

