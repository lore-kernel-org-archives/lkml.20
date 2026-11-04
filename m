Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776932;
	b=BVl2mPlmy9/8xtFZISqfuXoMz2RdRETrKftESOeVTyiaLVR5domrQVnV2/EV81hJb2iO
	 rbZU5pASATZLvO3eIKZXWCCsBaIvJ4Z8K8cYi0Sizmyfzef3i38TmtHQGu0IClad2085v
	 ZCPOXzfvqgI/22g1l5iSyaZmnDwITZ5jaH7r0ulhrE9Es99oyivr7hM1jfZOmRXSfwDLu
	 IX1YJvEmhk8WQWZZZDoWpv1JGInkE4omCjhOzA7YEo3Hn9iQkPfgd7esbrGNEXT/93GwW
	 u8QRZMqoeg1RjxK6TBxPdgXw+FjSrX1t0ab5RWx9UbIoZeRrWRQp/XeWB3jyCgIkRuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776932;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=mh/QEZGtIgbMbkhZzPcGgt/dCBZ8tQKjIBv0AxgbHCo=;
	b=e9A6uadr94zCzhZi8sQHCqWf5I/Wpu15kxsLcBkG+0MCvE0Ge9gG1ePER/WwONtxg+Ou
	 SGKpt2DzHAmqZfKbT1EaMLHkSVYwcQNZa000HQJedRPx4uHOK3R85KVNeHj1TN5BORc1D
	 xSzFY2ziKDw32kWBs+NH+cFUiUwrqYb7LGWa7KW9/QvaVFq95rqKzjzJduWIYzS3aO0rN
	 +kDKJj915kan76WlijcJ1Y6hooVzUdVCL1DKRjFIjR6jU5xgF3ShFMJNsjbvGnEVwmEZk
	 oooLqYDxCvJDNHlvJyLnLkz329/uU+i67YasFGxXWyPtJX2Td8u3v1yp4NfeniI2Qyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRW1z8tH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F79606D81C;
	Wed,  4 Nov 2026 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRW1z8tH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776932;
	b=n/t/ylrr9CSdW56ygPHnqx4yuOHpnNRYsVoLdRSXiKFuVrDF85wZdUgQm0D5/Mxco4s3
	 3ypDC55qvTWpzNxdf7gZ9Y79M8dFYIXkdRp4WHA9nYdLJTE34NnRivZFE/hatUAsLRs97
	 sEfBJ531NQ1e4JFVBQUwvyLRe0x81cfYOVp//rasnmuVZv+7OZ3RLNQAI/+WcPp9nwV97
	 acuq8XIbibNgTHytDK61c5118ICd/zyIlgAASJ2mQbSbHaIFTqJB/jxlpnU82AudOMrR1
	 qg17k1WlCy4wnkdKJ5qrFW+K8za2atnjfuSnKFQPSdJz0DPU/L4vJE3EX4L2TPj/V5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776932;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=mh/QEZGtIgbMbkhZzPcGgt/dCBZ8tQKjIBv0AxgbHCo=;
	b=sITdCSwS0HK7E4DCA+pES6hFZ/C0UD+aLwj9N1Pcl3ppoGloYBjY+Wxl3YyjeuXMBs5t
	 OpBCWuRcYCCPe8N+cWueLcBKGOVOgKvl+toBUc9Gf6zbLCSZnUxjV8ghJr9aqAIyiK1Pa
	 R4y6xF3LQJdvbGt6DyAJjSM7UTX3mHRhvMYQ+a2wGv2dCujpG3YB2nw6Tgda750HVLC3A
	 IX1R20d4f284toTrTtErHGhGnEeWWJge6/H6r5qR3t0ltNxNdpDC0unqeTP02KVIKQV5Z
	 Ne1FCwyZQP/bcBPtTblziC551SH61U1OwbpqvdaUioLbCu2jHAV6wdUXbot355mj22g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 377001F0093A;
	Wed,  4 Nov 2026 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776932;
	bh=mh/QEZGtIgbMbkhZzPcGgt/dCBZ8tQKjIBv0AxgbHCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GRW1z8tHk3uawaXey9+Y45Z6/wO6yvrLFhcrr0yhKu5plv6brpxOT849H0RRY+HKB
	 koqDf8Q6aa3ekmPoD9bY0TsbWxhCnTiaTFQ8RwUb5qCfEwd1ifzrygkdTfLtf2sOak
	 bPRWyLfQTg2xJUR0gJm4AZy50PsmhSI4unchvOkjC7iPsMh0cWgoq9aTUhhLmykk7g
	 Q+2dPw/rbRbuKWGF0VPKExZVTepB+FJkeFvpMSKpjBwnx3gUAM1qY/eMKpnrwHiWCM
	 oDV0SQh1WqoyFzmMrz89YqbJrClheWSZthROWapxayIOLRHBqVt/uyylwSCNF2XQum
	 2pnvOKJjReGuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C1BDE46D25;
	Wed,  4 Nov 2026 07:22:10 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:22:08 -0500
Subject: [PATCH 3/3] usb: dwc2: Handle OTG interrupts that GINTSTS does not
 flag
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
Message-Id: <20261104-sf19a2890-dwc2-v1-3-d959375e26ab@telaak.dev>
References: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
In-Reply-To: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776930; l=3164;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=+gnzh383ADRzly7Ief5zkWrWw3Pc47lfMuoWe2KoTVw=;
 b=1yVicNsr/efnZEvvp94GLSifXj9AyCXXPcTOUGEKdU2lZ9aNrNouQYqdzn/dvoE3770lk5VEi
 7rp+Fl7JCq0A/Y2wCu2UchGJRbWOze6EqUcUiHTKA//MwZjQaVwmei2
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

The DWC OTG 3.30a found on Siflower SF19A2890 has battery charger
support enabled. It triggers MultVallpChng interrupt (bit 20 of
GOTGINT) but doesn't set OTGInt in GINTSTS. As a result, this
interrupt is never handled, and Linux disables USB interrupt
because "nobody cares".

Handle OTG interrupt in IRQ handler regardless of whether the
OTGInt bit in GINTSTS is set or not.

On a GL.iNet GL-SFT1200 it shows differently: after a few replugs of a
USB stick the system stops making progress, the console repeating its
last message with the same timestamp, until a power cycle.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[jt: only on cores with the new otg_int_unflagged parameter, which
 SF19A2890 sets, in the one place that already handles flagged OTG
 interrupts and with IRQ_HANDLED returned; the others still handle OTG
 interrupts only when GINTSTS flags them; what a GL-SFT1200 does without
 the patch, subject]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/usb/dwc2/core.h      | 6 ++++++
 drivers/usb/dwc2/core_intr.c | 5 ++++-
 drivers/usb/dwc2/params.c    | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 015a5fb78..288baaaf4 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -367,6 +367,11 @@ enum dwc2_ep0_state {
  * @no_clock_gating:	Specifies whether to avoid clock gating feature.
  *			0 - No (use clock gating)
  *			1 - Yes (avoid it)
+ * @otg_int_unflagged:	Specifies whether the core raises OTG interrupts
+ *			without setting OTGINT in GINTSTS, so that GOTGINT
+ *			has to be checked on every interrupt.
+ *			0 - No
+ *			1 - Yes
  * @lpm:		Enable LPM support.
  *			0 - No
  *			1 - Yes
@@ -466,6 +471,7 @@ struct dwc2_core_params {
 #define DWC2_POWER_DOWN_PARAM_PARTIAL		1
 #define DWC2_POWER_DOWN_PARAM_HIBERNATION	2
 	bool no_clock_gating;
+	bool otg_int_unflagged;
 
 	bool lpm;
 	bool lpm_clock_gating;
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 9565e6a52..e7bb9709c 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -874,8 +874,11 @@ irqreturn_t dwc2_handle_common_intr(int irq, void *dev)
 
 	if (gintsts & GINTSTS_MODEMIS)
 		dwc2_handle_mode_mismatch_intr(hsotg);
-	if (gintsts & GINTSTS_OTGINT)
+	if ((gintsts & GINTSTS_OTGINT) ||
+	    (hsotg->params.otg_int_unflagged && dwc2_readl(hsotg, GOTGINT))) {
 		dwc2_handle_otg_intr(hsotg);
+		retval = IRQ_HANDLED;
+	}
 	if (gintsts & GINTSTS_CONIDSTSCHNG)
 		dwc2_handle_conn_id_status_change_intr(hsotg);
 	if (gintsts & GINTSTS_DISCONNINT)
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index f6379e616..22ab9ce13 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -243,6 +243,7 @@ static void dwc2_set_sf19a2890_params(struct dwc2_hsotg *hsotg)
 
 	p->max_transfer_size = 65535;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR4 << GAHBCFG_HBSTLEN_SHIFT;
+	p->otg_int_unflagged = true;
 }
 
 static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)

-- 
Git-155)


