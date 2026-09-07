Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F7472F67
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787607; cv=none; b=gqmnhekCMiJJZUFeSXruuAnndQeZeE56qWx9I9J9UvFnaPHqtVk0Epe4uVP7wlIGffVYB8zl69ty1MyBJQ/isArdCnSaHks4AH+8egMLa+8tpWC8WSVv+yJ8sfabQmrJ+mA4q+PX7KZ0eWv0iMdTlekglJPKJjkxDEhze8sW238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787607; c=relaxed/simple;
	bh=vDebz4UsJmjORwt2efyOGqFPF9BjJ2eSha3yv6WZhk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXEjed6QRzCKLRveabCX8b3Cg/gqLnEuitCtuUt+/LNCxye42aoDTNayoTlQ76cf3B5JbhlB2757vxLvlLT7iDBlwnEsXfyZVidCLnHn0h3g345DC3XmWCMKRTIAjjrBQ12DL06pdI6i1Bj8SW039qAtl5FJjmj4ENe79H3hyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=uMH5bmbq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="uMH5bmbq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso573921466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787599; x=1789392399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1f+YXy7SbvRq8mPftGLFWh+1zroaa0JiAwnQyBtt98g=;
        b=uMH5bmbqe/Ac2Ie1Oy7U4c3dDiCIq2c3isL+VBJbrZfQU7VSC66VVNOPpLWWdRzCGh
         o/1C3iFVgvrNVzZpm0irIbzZ32fdu23n08bR7S7pljQ4/kaTwit1m8nOIt7G0V91JuU0
         Zgpyn/Bx9fQhtT0lpMAL3QPZ5LZi892+kwXYMMX2jaMnfD2dfYoV1glgr9sa48gpYVsL
         T4uw+lqsvfbgbuopoVY6oPflJsBQH3svP9DDcQSOHxYJu1sKrOxKDKCqm6MqeZ6kWVVA
         dDUHNUD2hQKhgo9PTbWs8dNZ2xpvKiP+DneBC19yugA804c1WAr7ivjOL1SmmCAlxWmC
         gIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787599; x=1789392399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1f+YXy7SbvRq8mPftGLFWh+1zroaa0JiAwnQyBtt98g=;
        b=REm4LrNlSpT1bcQoopi5uSPe8DMEgmaDx0zI0WS1sHrRSfFqARNlgf4Aae9d+mEbcD
         mUfNwrIboIf7lRGhSR70KSfgwwciNPS+zRKOp47E0vx7K34tB4LvxmLIacOvMKuKpSkH
         Gh+fZpyoyx38oa2JhrvAfDaeiNSGvnN/hCB4leTog1zJvWxu5XYg/XQf9RqVPmvIUWF5
         D9OxFXOvuzJrjD3QCMySej8US5BFMa+ITntmr+NppJ+asK1zQyUFnwRwEHecgRoCAIs1
         JK34eD0aahfK4AQRGX+gB0Xc2JSVJ2R2hzoQ1lMft0xYOkuEWFKzbzgrFbOoaTX/gPLz
         W03Q==
X-Forwarded-Encrypted: i=1; AKwUvBzd21OTQit44LTAlFxcyZSyo20pLuTFSngxV/IZ57z5Qj58yUHBwre9a8Hvcn/TMYf3Ffay7MJ7xoVauQw=@vger.kernel.org
X-Gm-Message-State: AFuF++nFA67+JKiu4pSexO3N6Oi3MtgMPqgCFC+2rlZH1XNvl6PMresl
	ZKt4IAOtTv6hmc3YruSoi/QqD04oToGpDjnXD/paPlsaEz58/KrZbTzYk9ykYi6OmJk=
X-Gm-Gg: AYBFou2Y/Bz1/Qj3Y5BBUiNG7Env2tl8RfbORokRqZiIqZhmMrJKDDpkEVS9UhcMJYm
	E41h2MX3GcGwOX4cDolVwd/avgpVHqUIojT53kEdAiczFW/D6Jz9X5Qv8rAIoMo1BdQkkT+kj9F
	qPGdNouCjGU7OCItmWQZMCnfX7ja4Mq6GWKF9SNFw3GhcYQUzwUrKdfb8fLR9WZkAyDjlannK2P
	cT7wD4l2DR2hv5Kk1R8tMjP4IajXLGUIXLOV1CElakokPrrCcMwyUO/FHnc0k9L5tlSNvpDCbw6
	MqLgrMca+8Ydwq8uNhwgoYQqniubmBa4Pf427Jauf3796uvAp9V+3pceqsnNo80/PRw76UNMTda
	6QcfXzbsBzK0UCP+KWTfdl7ohR0maricT45LMR6yDVXIjRilrX0uyEkIburBrKENLhWnqP0EOFC
	IHofF7utG41x/aHsw55mSGnYEcpvFb/6BytWC36kTaE+rKrdcUzDRTh+8ybiHuuNMxfXSsUZK7W
	1NIwnY92eJJ0EvK8EWg+C5/LkvMstoMbf2m8HNratKRgwJHd+2gOpuT+QiVxB+93ZW9sC6NBa4h
	2UWiQvGu0FvLTlo4NaxLyTaGSFo7513LZJxGIA==
X-Received: by 2002:a17:907:3f24:b0:c25:58e:83ff with SMTP id a640c23a62f3a-c260c9f0348mr1521074566b.10.1788787598895;
        Mon, 07 Sep 2026 06:26:38 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:38 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 6/6] arm64: dts: microchip: ev23x71a: enable eMMC
Date: Mon,  7 Sep 2026 15:25:34 +0200
Message-ID: <20260907132617.1198548-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the non-removable eMMC connected to SDMMC0. Configure its 8-bit bus
for 1.8 V DDR operation.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Remove the unnecessary maximum-frequency property.
* Expand the commit description.

 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 985ca31e74e7..89a161b87d6f 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -478,6 +478,16 @@ flash@0 {
 	};
 };
 
+&sdmmc0 {
+	pinctrl-0 = <&emmc_sd_pins>;
+	pinctrl-names = "default";
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	non-removable;
+	disable-wp;
+	status = "okay";
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0
