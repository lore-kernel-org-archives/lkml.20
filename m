Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC212434998
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482013; cv=none; b=M8CliC0CJ3Qw8iN/bpa4f0fs8M+k/9YO8QsCw03AA/kuyUv13RHnhec6dfyGsLTwB/R1LlaGu4A7gF3JF6iaUjo1eBCjLDZB9D3DDLHu4G+RtG8tVWFRy82GEttL/m3GGCyAdrVdhpulZS9DqIYN9l0VRCLIRHoX08yAqFrlJLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482013; c=relaxed/simple;
	bh=77hqLc9J7JNzbmg7AMorhPOB16l5fiuXalMgNBngkQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXWLO9Ex2KNMlFU0uSK3sFTlbwmobHQ2Hy1dj++w64FfCreQnJQdSyVXXkneHhCZVopHh7Fy4YgyBL88msvnG+9ySmLBlmDws3hJESkey6qlFHOpEYMD7CXd5/9fRlHLe/eP73UBWW023NfDk7FYd3wvEen4L4WbtrD1qdbi3BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6F464ud; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6F464ud"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1965630a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482011; x=1792086811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=U6F464udNz7sAkBvHjW/0IKodXHDHrUra980xqWG7jHcPKRn97ZGLK38uhsIxr6Ady
         2N3zhlr3Mi++REofXu3KX3v37Lhhmc1Fuhwoa2gIBd8jJpTRMgxT/c2wGcDs7SM6Ogn/
         EcfjwhZRCYESzkZa0bWnnwheVxPhdGmL9IVB+jzleqVf+qukmbvPTV5uUu80vEkJh2Zw
         PBc7O2ORvTld2g1fxmi+UurxtUgYRrCoriv+hjpPCTAJs0Hg+OkNuWQkjiDbldKSqmdr
         3nkTSoWzMlKSsQp2hzloZDw6/TdV2lTvAuJCx29y6XzfYjCqJcanS6Ei2lCya6AM+Hey
         bi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482011; x=1792086811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=aQs5SwZ7nWYFTgXHef63P+qsoleJXowTDpiYWJojOJqqBpRFzjkuom94cN7Tb+lNJK
         nvB2n0vROsimXPXUTdrBYG9+RcEwQKw0gXGcY9HVEFiEWCVbzlMZJifZsdokp1npLuJi
         LGPQt9upEBZ6bi6V+9lO8gbfDFKaU1d3JlkWRchp3MioVijs6rscURCCBZKzi4bQJOQv
         c0/2t1ebwNeM2Xg63xroWfQHa3am4AywTIky+/X7TPFRNb3TA3ksPjRWqWRaRqN6OYUe
         k1XbHh2VWWC9K7ZHqdm54C+bAHW7bcr8N8oN7QYcayMjRTdIakXWcimbVcbvjHA48ebM
         mNbA==
X-Forwarded-Encrypted: i=1; AKwUvBxU90snszmzoHL5Ci8mlTvCHElyRGzFxzZC/ngUgpKGi8VLGl0osVSq08HwAxQEE3yxkLXAtrTX/L7vIBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0E0aNXfLMcTRC0JgUH9vRuhizoJ8fSDzdcGceF1KKOYQaFcmD
	o8UuNZuYNFWpnC76PXecdBtTc2knI7mkOtqcXq68AlACAsRZfZ3dzR+l
X-Gm-Gg: AYBFou3nVdNPiZsSviNih0wtrdISpFpUGcL5IhDVhageoJoNa0LWEoIBz+2BOYmEtiP
	1SlfSS3aWqGhOPziQMztz5lqnyjJFp97cNOIuEtjXNU8f95GS5Mpcc5FBdcF7Fhvi92P2nv4nvT
	WXbng4zUZ36EZcsXIwjzPCF4z802zR/L6nkX2/frucfcsxtsV16K6A61G1Rr+dRrva6N2GTo74D
	9ZIPKmoj8fyFivw7ykg3TEGboePQdwhfHStwBvYNDFCgFhxkd5yJJ+7GlhjJOE84Gc0ru4+ekWc
	KrCZnhpydBVjEG5dyX67sCYihagazRwkLEJQkLKW/JgjZngSC+8CPAHVyOlLk32jT4N9x3wqs8b
	thOKTQaP2v5qepsvzE+UCaRhxAjv0e2ecwLfhkwXVjM1aNxspLAvx5jeDSvo6KDeb34NMLal2qy
	dqyF2SJjqpHd4zmrWczTl1bd7rW3BWYILaZI2IhZY1BCKbtTjERbry3O8VKpvv7VgFYNI3p5yJc
	ePTGuY=
X-Received: by 2002:a17:90b:534f:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3a8a0cd4b4emr5164503a91.32.1791482011331;
        Thu, 08 Oct 2026 10:53:31 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm144332a91.16.2026.10.08.10.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:53:30 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v11 6/6] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Fri,  9 Oct 2026 01:52:00 +0800
Message-ID: <20261008175225.3375274-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008175225.3375274-1-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b1..2f0f46eabcf54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23757,6 +23757,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

