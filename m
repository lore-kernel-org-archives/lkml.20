Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3048D89A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336353; cv=none; b=QH1Gsrv1W3K5+p628RvC3AiltFPT6RoLrhA/+dvZUSAYcaDFyI9SJfoQq4y2GFy7m1sKqznGtfGxuC7HYa0cdUKVGJJ0PAQ6/u/K8BV5/29u4aa1Ft3Jp1OIg+kELElkg86Day3L9pCR+vr27pC1tzbQixnB7JMYEI2mWtvjByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336353; c=relaxed/simple;
	bh=1Np3IuCVpVqOJRzPZ8gWYaqPWYBNcVe3bkFVnYYTqwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jykZawcTRxeBB7+Rm68Nc2mc0U8F9LyldH6UWA6m0ZoSSvOR3uBRdAHoZcPdgkatZ2sF6GTite6BJVl38YNXFyTdprEsfmQNtgTrifCigiw1JXO0vlo9iL5IE3g0QtfLNOd9yOOXbbXhCF8pNRNlIB1PNtuFBYGJLTH1BP85czA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xDoA/J85; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xDoA/J85"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6BBEE4E41070;
	Fri, 25 Sep 2026 11:39:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FBA86073B;
	Fri, 25 Sep 2026 11:39:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D9D010329514;
	Fri, 25 Sep 2026 13:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790336342; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nRETuw8JsXEchs489Ud2eN1dEe38gGQ0nW0Z6hsxDl8=;
	b=xDoA/J85KSmiaAzghIGTC1VmRUK8eoGiullhVstUnkSvSP6mdjSAg39+UhCHzPFuof2CuE
	2txUrgfjTvZCtahuA2Hdfe6Hf/PSqYHV6z2MfiF8gZn3gLbF9LeOJLcqweVw7ppmNWP9q5
	p0uuT6jo8SNWEIUpBE66c1YV7syli33+Y6T7TGHkzvmUfT5yycdaPcUaT71dHPotfzSFDK
	1v6nn/t5W7FbsbLIy40RnGJDQKp60gMIS9cQL4Ejh5N3f+gy8PADSw8TLgNJVDcKLz1AEn
	pNW2XvZrVKW5wlTCdR0uclDs3Oj2BiTgEK1MzMbVYUZ1I2ebfWYkVldYjlYxbg==
From: "Bastien Curutchet (Schneider Electric)" <bastien.curutchet@bootlin.com>
Date: Fri, 25 Sep 2026 13:38:50 +0200
Subject: [PATCH net-next v4 04/11] net: dsa: microchip: use dynamic mask to
 check pulse width validity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-ksz-perout-v4-4-d675bd21ce49@bootlin.com>
References: <20260925-ksz-perout-v4-0-d675bd21ce49@bootlin.com>
In-Reply-To: <20260925-ksz-perout-v4-0-d675bd21ce49@bootlin.com>
To: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: Pascal Eberhard <pascal.eberhard@se.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Bastien Curutchet (Schneider Electric)" <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The pulse width validity is checked against an hardcoded mask. KSZ8463
uses a smaller register than other switches so this check won't work for
it.

Move the mask as a ksz_ptp_tou_pulse_verify()'s input to allow changing
it for KSZ8463 case.

Signed-off-by: Bastien Curutchet (Schneider Electric) <bastien.curutchet@bootlin.com>
---
 drivers/net/dsa/microchip/ksz_ptp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_ptp.c b/drivers/net/dsa/microchip/ksz_ptp.c
index 84c799959aaa..1889698691e9 100644
--- a/drivers/net/dsa/microchip/ksz_ptp.c
+++ b/drivers/net/dsa/microchip/ksz_ptp.c
@@ -86,7 +86,7 @@ static int ksz_ptp_tou_reset(struct ksz_device *dev, u8 unit)
 			 0);
 }
 
-static int ksz_ptp_tou_pulse_verify(u64 pulse_ns)
+static int ksz_ptp_tou_pulse_verify(u64 pulse_ns, u32 mask)
 {
 	u32 data;
 
@@ -94,7 +94,7 @@ static int ksz_ptp_tou_pulse_verify(u64 pulse_ns)
 		return -EINVAL;
 
 	data = (pulse_ns / 8);
-	if (!FIELD_FIT(TRIG_PULSE_WIDTH_M, data))
+	if ((mask & data) != data)
 		return -ERANGE;
 
 	return 0;
@@ -242,7 +242,7 @@ static int ksz_ptp_enable_perout(struct ksz_device *dev,
 				       KSZ_MAX_PULSE_WIDTH);
 	}
 
-	ret = ksz_ptp_tou_pulse_verify(pulse_width_ns);
+	ret = ksz_ptp_tou_pulse_verify(pulse_width_ns, TRIG_PULSE_WIDTH_M);
 	if (ret)
 		return ret;
 

-- 
2.55.0

