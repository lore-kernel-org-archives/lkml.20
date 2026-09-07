Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07C4EBAE8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787605; cv=none; b=gYRnuf2Svw9Y8zztcloBI+Lb3O6Goz6p1qddgshXwE7z5784mBx8OHQB19GF98/BnXhu2bseMAU8Sjm/rot3ThNXBxjecNmApqZxYVwsG2ak8IMaberKDO+EbunmudOWwmEEwrGQTuv5RqawZgYroxVFFxnkdL/xwyTaDz4Bnc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787605; c=relaxed/simple;
	bh=xb8hi4uuW3KBK62XY1yYI5XdCz67rzTPXQ/r+H7c1GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAb/WsHthZHbmUaCYt+UTbHWiQ3Bn05aWf58TAda3Esuvdcp/glclXHwVPBAF37Ci0Q+ohMx/qGtsULcBBrYk6mLegwjp+2Jswz7cK54VbOz6p8E8v9bFRHCpB6qeDBmla6wiKQlGCIYmFtoICU0NPX31f0NNifUYlaacEymCNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=UgrvRRAT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="UgrvRRAT"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c259e5c22ffso203405566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787597; x=1789392397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4soDR+0gZiqt37Lbe4DFFhbgclQyHpPTsvSalKhA+JQ=;
        b=UgrvRRATI/dMOrr9BHAIcGsFGYw38dnHEJoJEDjj/kP2pgZlxqL/8kDZfnW+jUPe5U
         FkA6ENYCxXD+NcgA1NbbU+zDAH7+Gk92w2+P+8JnMpYd2ASsDRZW7cnp/CHR5H+iUGxr
         CeFXkI9InwuPFG/OcxZgrnK8C14uDC/pD/ZQ1HThJv4K0vvTysNS7CS9Tv3TOeNVvTio
         99Ph0nuADUTIVaPamcBCMEDhC09gHuj/4k+hu/KgEVmKJobLsNqCA9/fwBeNK7rzsrY/
         q3Jgx4KQf67bUdn6F2NrfEAbIdkAbNW2tKvOLNBV4/JwtncNvuuqEHWPn6E2LNwBTD+K
         aGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787597; x=1789392397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4soDR+0gZiqt37Lbe4DFFhbgclQyHpPTsvSalKhA+JQ=;
        b=mpuCXmhj1+DvbqSJCHCpDQFvz8hujaYwFogJXqcED491gItNZVbT4o4cr1qllE+qTx
         j3LDijI+8yhNSxqR1nrfeMNUlkuB3rKMiX+IFUmSdhnGM+iz8G2WdrPzGXV4MTK9Hh22
         /6IkkQVXi2nCqbWSJPoLNipx1X5sJeN4MjNG+txC4H0vXST3Syw9vUje3jmEepaFX20+
         Ak52jWvb9sTBT/85bfVDvYe9zEwcXX0VnHRl5hf25Fst48CmJhZx6BJuKRVBtIPirrA2
         WxEYjZQKa1W+KSPFRc82J1IvId4cehjyhoWIY2GS6I0vyPQsWZ2t9CL4bChLs/56hRbO
         rtRg==
X-Forwarded-Encrypted: i=1; AKwUvByhu5yN6t65q26KcTEzT5Ft7jEwRSVl/eEWtKiW0WUpsz7d7KBQaaHPO8v0qzayoq/hzsfeI02/2tzpJtg=@vger.kernel.org
X-Gm-Message-State: AFuF++leqnHu0z+zOsiUOhrCYlIHoEF+I996pV7RygoQltUXQyWVsIUg
	i/FjjLbla2dEPuam5/v4OWupqrmqzd+JdLBgVqFq0ZYkR4xgwwqVeueNWXjQznDvgVg=
X-Gm-Gg: AYBFou02JEri7Ath52a1TB983mGU6oxBXCURsOYoTI5agN84CHYxTy1DgOZ+T9DtBh3
	Selfkk8garUBtwTAxPdwHQVPAmKNShC6DZbL55V1Q4E8fowHVfkmW9L7V4ox7NLegDF6GMlTyLh
	rivq4pm09ypcA03NHgeSx+RKcQF4Z2xAud+/R15EydsTf2/LSrq2qcKnBiNY51q57mjM66e7zMM
	BH8COLCc7oEx4la0Ol3BoDo5Q3dKahsHw2ub5loJUakT2OX1M9wZMGKHSs2z2B4w0bhjPu94ZFU
	ilYMyhklO3B/tJy57R2F/zqhxBgQLHbee+4HtghoMFgT2d6qghtI/bQLbeHLS5HbWxFBFWM3652
	3VIRWZCCiKzl07nDgUhpoaACD1fVsfAHFA6nYggabsqM1k2sH4uywHBe/6IN6N9uBSCuNHQYO6O
	Nf27C5TsPch5PBcoXgj8jpFaky9woR+QlWjWL7kqaI+g/B3gaQHvs5RtN9pAmTCCgo0McloTgKz
	utZlEd9DNLOvipbvOhx2wYI7X/uepu7aqOXgtmqum4/hXy01hUHfQ6CzAMnScKD3paLd1FNxOKP
	Lx6GD1tfE0R4uTYm7o3CfkmcqITMPXfvD5i02A==
X-Received: by 2002:a17:907:3f8b:b0:c28:e01d:1d10 with SMTP id a640c23a62f3a-c28e01d2ae8mr393259566b.49.1788787597442;
        Mon, 07 Sep 2026 06:26:37 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:36 -0700 (PDT)
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
Subject: [PATCH v2 5/6] arm64: dts: microchip: ev23x71a: enable QSPI
Date: Mon,  7 Sep 2026 15:25:33 +0200
Message-ID: <20260907132617.1198548-6-robert.marko@sartura.hr>
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

Enable the QSPI controller and describe the onboard SPI NOR flash.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

 .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 4012ea7d07bb..985ca31e74e7 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -463,6 +463,21 @@ phy27: phy@27 {
 	};
 };
 
+&qspi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+	};
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0
