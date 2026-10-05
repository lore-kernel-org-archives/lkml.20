Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D9643785F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239481; cv=none; b=DQCcEmYpTmP5poKHB1rHKrmajSp13BzIIZztwHWFNJQoRZMdDkrjtDxmF1AiXjzScYtJcEtmh1GKLrpz2XUdNhzT23M1V0nSBPCkC6fgde/CCAyudreWgrdzuzwF04M47qwPjdazDe++pa17gSInL0TE63mzKXF/sWN8AbNabmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239481; c=relaxed/simple;
	bh=77hqLc9J7JNzbmg7AMorhPOB16l5fiuXalMgNBngkQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVjRqmvSJ2e/NYWUrnz+gEA8m+kzgQlJSXTS0aKHrPD6ZjCZX56919IRzqA/3u/Q7umuYqCl59eSHGRQyKOtl4ebSr/JqisbhX7FXDWHHzxPKhVko3NPdIDDdY62DdvFsik/BgJ8anfHYwEllHYT+ifWpU8XKAV2pT+PoJvaDYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBHF6wg6; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBHF6wg6"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2dd9bce707bso9595265ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239477; x=1791844277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=cBHF6wg6EN2brUIc7EjrlTuEh1tDzRMsVH7OmiGsYDdf75R46+l/kuhJyeGa9KYtuN
         LLiiqAmtKXVDYXQDL1Nx2OK62JMwjwowIonEqGIZuVrs0QLVQUCTB/tw/JnKJFO3bsNc
         OT0hRe4TUv4wONJI75NjnJ0tw4tbAXocNcaNVj85d9LS1r7D3IWvnljBNxVrsd2ze1aJ
         BQLG4wOICZFXPwPBtfRdYd7DWz8gL5Q2CLyAr9x/kseFV3dC2IdXJapDqtQzBbxlcHEp
         Y1koVCLLwM6w9/ZmfT2TaGdcHAAF+eRIXDHbXh+6ry+LJfDC2vtJhQRBdgJZ3t2Kw5ab
         Ifpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239477; x=1791844277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=sxv+E+v65td7/sVJN0r+vTdYwHYC6tt4Jt5CWXZMX5Jhrirdxh66Ok6NwqOY7bnxqd
         KP05/cKNsM9ZRViiqoUpoh/7PM2IC0ThUvJuBEPU8Abky+alb6XubmM8jtzCGk7EfPId
         PzWkR/x2+Goa2PTVCs8qpZhwfLzmuEj0vZxdRB1Zr/EG8J6izpS62bBfVsNJ+lKoq5a7
         C8cPHOVzxTeQssneymUTHif6riArt05f31SfIOFUoTMMdNJsiI64ByGo5zuQFPezTDiI
         P/KdlQoIqcxjry5on6V1yOjq9td0uZfvlvYkzdxCwPhLfs4spb33UD1/Q4gVMXpw3Xus
         v7gA==
X-Forwarded-Encrypted: i=1; AKwUvBwtZl+dBNfCYb+vdB7jVGR02djpM1thdfY+AUYi88GFiV+cp0KW9Shct5UAzmBvyZjUTsxqzOfXuihqFho=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgBTHyeS9KLyAm9X9LGyeRVS0qjEe2xhrN8wTDSDFA+zkrp7gF
	vtGGQPs9tiD17R0j6IDxzVGvvx5dLOFTwvpsVzLcTU8/xtS0biBJe1Zj
X-Gm-Gg: AYBFou3Hvkv+GsTYjTZvk/l7e4+uDAMlU9bFf31g1W+s9+mm735ixgvDGgZ2x80csXg
	9VLd3UG+0WJDJMQAm95jVZw1lKEnBfg2G3jJVzBmu44XEPJ+sS1IzcZQnC5641w6f0pbKR7/1t7
	e/kYioQW9Rvh54ak4+onvcxDKW+OcFrpC/dqEYWjQUYYEqRo2PmkWluwPqWnJ7ngb60lgpiQRJU
	Ffw9jjzdULEXKXcKAP2BvuP9mUq5JrAoNrCWkjZy4XjXkehvaVYYSRcEqPNlnm+PgpH9WA8/LPM
	TnmmSlhW2jkKs2i9lZ6mFWtb5av7HA/vIEw5UYFf8y10odXTvLfHPZnbiIOY78iE5HB5LcIOLrJ
	51KEg9nAzkLIIHGYJx9r1BLLk7yaWYFAUsw6GNcuCkkNZsvGtbQLTnwxPzpbwKFOPQmxEsGuaCF
	QtJOI1/XU7gMXHgMoj+s11IagqlmzVJGDop8FZHkir/JxbboLaoyjxfFYotgJ4RCriuLk/
X-Received: by 2002:a17:902:f60f:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2e49b6290dbmr124418145ad.40.1791239476903;
        Mon, 05 Oct 2026 15:31:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:31:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v10 6/6] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue,  6 Oct 2026 06:30:08 +0800
Message-ID: <20261005223011.1124347-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223011.1124347-1-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
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

