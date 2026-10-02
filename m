Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C0367B86
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927807; cv=none; b=TOKrLdqOpY2QTdM/QY1sCg07GzuIVxGZdmW+iWpiB58J3KQP/6SIpcw3Kckq/TqEBnmb3edU40Py/kxkhNad3mPtY2TnHL0o9PmevStzmsGx5Lb/cM7zu7GL6m/xemKCgmUYCAceoNql/ZvlSEtOB1NgHKpefz6Gi2Plw2c9sHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927807; c=relaxed/simple;
	bh=JeNxMWZO1rRtu4rbEuExcXII9g7Ou5O4PhCtCbJm5wE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fOzkqN5Smq1W/DVgJBkihUKlbnfLmZmKkmbNn5hHZHKXfieFLW5Zk1DGZqpvrYbSgEmR8JRzoWLY2U+tgv0CZ3TRCkkcEXKFeG3thABrbRq9znBzJyBb+DccHvnN/UD6WzkivouRvHsjfh02NIcIwO0Cm1zc3Na9FbZfIdpoOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVCGDKH+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVCGDKH+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso46022125e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927803; x=1791532603; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DK6t/sZOXlOI0flttlBEPNoSoc64x5EacC7Gj68MXFk=;
        b=nVCGDKH++4zynt+jwFogLJZ9FM08uXsVC5pCcnKS58yDho/EI4cuvwMcLUUnBGj+y9
         R/T8uH9W/QE0zUh2fuMVqx+YmG/6glnHt6+JMqzo5ENntZ/Hlht5TroxWtmSZX9c8wkG
         PcEDwuRqCmprVjAjL4V0KMNAGdie55StqOI5sBIldYcwOCczMuS97pRNsL22FU5mgK4q
         FMz2l/YVhOGYscbRJ7UJ30EmFzhlBd9AL7uTWxrQ8tudJpb62mxSv3r4KPRpW4sVmj9U
         r+kpjLv/rGl+elLECkP6df+UC2wrKVnzIBzGObtQmoDH88FDpsqExIvsXTQkUULXYcDV
         FgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927803; x=1791532603;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DK6t/sZOXlOI0flttlBEPNoSoc64x5EacC7Gj68MXFk=;
        b=t3n9sbst3D8ZefWqBXCIC68x16NvtfJceQXqBIAk2ldEB7kEt2IKt/LDhkbXPILfFy
         bAGGgHRSWJuDOioRzqcjA2UaDI598w0LjRVva1HWClU1jpxW7erkM+4ENkSl75NB6qh/
         dFdqzg413KOzykt28kI3j+Hc4Sqje0g4EADCx/2GpSQuhCu8IHmbmnSMXFrnX/9sqaCs
         JMIrMc2sv8ZzxeYvf4lUzzBDv/jDFuVCgdzWcOx0lVwXxxVsHB8So39ohFfnHzmatlIH
         hr4jfyz9ZR7Fd3hkRjqfMBULUvKcUo3kItFYDeKkYtd9yp3j11MshoBsiUi5kUp3FIcr
         dCug==
X-Forwarded-Encrypted: i=1; AKwUvBwOi6//BzVYYpMZeO5bXaLznhmXRSU8Ey81Xq6rTsoVGXw9QbKtB2/yEMXNGhbRsyt6bln1lsC9QBo8x4g=@vger.kernel.org
X-Gm-Message-State: AFuF++kTB93tEJHmR150JYe7fexL1yghCk6/jIMCV3lgehntUUwoaS3Y
	IqOjkmCgxXp7YIZGt+l+uVGXjGdQSaKB7HxuRAlexPJTXjOHHqDDYi+6
X-Gm-Gg: AYBFou13J9NcnLCx/ZGRz6PGeMIltQaDa80zvb71hWh9F5vN3W/GMhDBT9Bw/bIcqO2
	rPV2lPdWHXzCpommM9/0hy5maocOsUm0RODwHrpS4uLYY3wgB17WG2CzxK0O1GfotljxHaG84ni
	Ttj3dG/NWfrMfRITZCP4PPo8K2lGIdBPQtACpddNQrCwlSSy1HrQ/b47GNPvXoeww2ANXLLS7Vs
	a8nfsoOcgyZBQfP2yim3Fe2OjAL0ZXK7kum68IpW7MJNEhzzSo9njt5+1h7SP1QunpEhcnoTVXQ
	JWJeTzZRAUqTKBDLP4gC5/m7+9QsAI+1ACNpzkr2XMQrG3Z3xlbvevspAHjuYTMmh2HqvIhTGhC
	vLeq2oegCdLG6euNDUTjr+WNxDK/iYdZ/KpRgP6vFHb8sstbV9uWJsnWTZ5sHAgIsISALrKFY0x
	QLbiXPeX0NVZnd8Oc7IuaOtyj94ycKazQUd0dN+6jZ20vjaG1KzeAVUVKumFll8qKsGAJxYRKAq
	JVc/vZJ1bjra3cY5/O+kSamzuuFEUbG4KytV4VRwlPtCSKFAU9Tp7C3/MHxstaHd7QSW75Vwg==
X-Received: by 2002:a05:600c:8b2f:b0:4a0:e45:e8d6 with SMTP id 5b1f17b1804b1-4a027559b0emr30989015e9.13.1790927802784;
        Fri, 02 Oct 2026 00:56:42 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/5] arm64: dts: freescale: Add SMARC iMX8MP display
 overlays
Date: Fri, 02 Oct 2026 09:56:36 +0200
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRjv2oC/x3MwQqEIBAA0F+JOe+AKYTtr0QH07EGshVndymif
 086vss7QagwCbybEwr9WfizVbSvBvzitpmQQzVopTvVG4WSXPHIabcpY2DJqztQflPiLxrXaqt
 7EyJ5qEMuFHl/9mG8rhtBB9uObQAAAA==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for display accessories on the
Toradex SMARC iMX8MP with the Toradex SMARC Development Board.

This brings SMARC iMX8MP display support in line with the corresponding
Verdin overlays and makes the same Toradex accessories available with
the mainline kernel.

The series adds support for:
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex Capacitive Touch Display 10.1" LVDS

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the SMARC Development Board.

The DSI-to-HDMI adapter, 10.1" DSI and 10.1" LVDS overlays were
run-tested on SMARC iMX8MP with the SMARC Development Board.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI

 arch/arm64/boot/dts/freescale/Makefile             |  16 +++
 ...x-smarc-adapter-panel-cap-touch-10inch-dsi.dtso | 123 ++++++++++++++++++++
 ...ex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |   7 ++
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++
 ...-toradex-smarc-panel-cap-touch-10inch-lvds.dtso |  80 +++++++++++++
 6 files changed, 453 insertions(+)
---
base-commit: e7a7fb1dc235053369094c3f8afdf67fefd67983
change-id: 20260930-smarc-imx8mp-display-submit-3a128293dfec

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

