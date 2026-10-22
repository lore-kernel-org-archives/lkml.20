Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673494;
	b=CicV6VST9X+LYFODIPL3zkDp9ChyljLEwLulSsxSXowEyxAe1yZEZO3F7Q7VCjQ12LOx
	 1F5BC+ISkxZNa2QYPCvdo3TrfOnFWgKGDcswXh2VTFllU9yQTAIn6sJ2Vgo/Orve/98F3
	 ZUBtbLA0ywDQGfaR3AP/wYbaCbGh1wGSuyvlOaFVW8gBvLiv26Z9rYh8kD5PyHAceAorn
	 RkK9HGc4tDlDOsqxzwTwsd/EYmAo/CBmDdz/dTrgPslrk9fIfFw+9q/b+6H9uMNUXwUXP
	 qXD9EQuQgd/3mSL8RvjfFUDlciF9jL0yOFZxoCftO9nF5EmxCMJveVgnrl9ICKvWcqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
	b=LB9xNoACphsaulB+IoBzTIepqzVsjOIHukqkja9Df5cEJOuUuOph0BlnWBJhXNh5bcM4
	 8OtvBQe5TI58RoOz6Xi+q/2conSmU+qq7Kx15U2wIYqqENyKUM0e7mY50WdBK3YcbSs6c
	 qd3yFgmnlo8+nA4i4ZIjMxdwrRMxkIhFzxQkCE4AABjkmTTCJkQm4KjgAWn2EyapqHrhG
	 v6tcK0mwhK8gvz/GhynErEeQmRokirMDvT5Z4QfAbgZMYiDgn+vKorbc2mSUsBCaryo92
	 2rdRXFsJVTVtaCIMFyTgBMqdiGx9Oien+XintpRwvY0yUYmiR0NIn2PeE9eHgOoPxWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sPUbiRAZ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493CC606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493CC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sPUbiRAZ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so14664835e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673493; x=1793278293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
        b=sPUbiRAZeuEsI5ibMeCBUZheyo5ErKbO1xhV4+I1YNM7O95sJ+j7sWdMlDgqcUjYsw
         C+YoKjRT1SGd2ik3I8rTP50AEznFHgMPseA0iVY/TI+lzp2m3TFo2WTqOgI3SLAQLbw2
         gpw74vPpTkxFSBtIAtFLr3VEQHIVKMMqfhzYwDyCe27vzux6pfgnmda0T6dCjNzRXUMD
         kiT4H3EYXpw8cF3C08Y/kTLPdBhIzCDSE94ejcHzTT9updg+Hdqxu2s87YpgNkO6tSsG
         29Clul0ExBHBbRzNAVpDuhYs7LVo06aEVHCcFO+Wrpej/UjnY656if2zey37aIMvmv0o
         3iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673493; x=1793278293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
        b=nzuMG0ZIFVNllmcaMMRcZdZHM6k8HzETyflhlj+/0see9TzstnRrWy3N/7V3Y2FeZL
         rWrZp5pia1wtOfmhYsVTR7F/ZBUcKu/qWJpCin4zIdEuYVYYVQegSKa6xaSsoQfCP1WP
         OFnR3533vVN9ncjlZ30HmyyKZj9kk9PEXN1Mzg14OcwSK4NtcLoLMCbFiLv5ZCmQkEVn
         C1U84vrKo/NjtebAKCLcQ5o7F8VesV2OjcUF2NiDczkdNdnoD/M8FUBIVx5oojlRr553
         zCNKd0TyIVuV8hql/s+tA+0dExHyJcBO8MZx7C1dbxVLJOYXzDSNi+FtARC8UANjkbzW
         dWhw==
X-Forwarded-Encrypted: i=1; AKwUvByJ2h3wkpGEOF4zystJAH98aPMLvXYPJUE71//YO2gVFtL0dQMC+qnKuNRNnjMVmgU2JMb7eaG4c9k2qds=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwcpt7XavqKu+Cyx8qhq2BydqOsc6hx2k/Gg2rJjP3tr1zSOxG
	4gf8hzODeXb+IwfUoWlgyYhjdcPHiAfmg4ECOcMwWiUVq4RF/TuJJ7Z50DKBvdiP
X-Gm-Gg: AYBFou1gqoGUrSGbA1qDP+5yXZXsBYJmJhZnENpbstfNuoFZPzUC1wxiMAfcWQSXjg8
	QDFVEeF+muLV7kVZYCI4J7z5sQ85EdGh3ndh+sdIYk0xLOBosY7vyRBG6s2+Db0rFlucoxLP3KQ
	cWJniEKfJBFSzcrVIkqv2PXulwEP8dqa6tqFFqpOnWxmStFpl3heFC8HiXt5eXVS0F2BmwwQ6Nu
	sVJNUQz7f5oZ46NJtLAWgON48oSjnQn1cVPtpQ4iEdbzTRuaWKv9R0TedejjHd3TqGMs4Ot0Idg
	srqM0+JMH1ySnUn+O0jRFDATXx/DBd92ocP9Zaw2Cj86212G4ZEAJzkdWSIHdH4rYDJxwuDvWy5
	+LeQuiNBglSZ9t6vaeBh6lKnpix8twbMSjYaSeScrMdnMKvoX8quWOMdRgjwDWtUYYBdmAJQpGl
	+XEWRZn6Ui4jQfEJLjmsPRW7CK4tSBCGrQ3SU+TrjqRktj3rrCSj3wH3/Tkn6fI/NzobMSXXCfJ
	xyozj/ap6L07VJJutA44sMsdw1xzRAinNRS7rxUIc41Y42KSJ7D5LyK4qnaCsLSV8dS9KR9mGTd
	fmuH7cnADCCKyd2Yo8oi659G46VxxjY6mswro6Re9fQjX3Bzu1rZNLk=
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr105959715e9.7.1792673492547;
        Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:08 +0200
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx95-verdin: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-4-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the
Verdin iMX95 Development Board device tree to provide a ready-to-use
DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b8f497c5c6e..18d4ed73eba0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -985,12 +985,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 

-- 
2.43.0

