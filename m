Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE174963C8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174954; cv=none; b=CdNnOwGXkTIuXeTIwyblqqeoD4dhe703fhnK2MR6QBg44uYnQrb8+Aq8azKiKvx4UvHQ3fXJQMd04hXf6QcIja6NIVBFHUpiWkpgoINeOC+eFG978rMfAYWGRSndxyhr7qpnBq+IzFkCmNnoLhj3lV3tULbBXVtbm+G+PXOep7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174954; c=relaxed/simple;
	bh=pSeEJPU3lkfh8cgLcenFy2jzqxMX5d+PxutRSDesZoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VEYN2XN7oXIt2QGiqyE26uVHcFeu4/JFZCTtGDbrNgoByMPtuJAcx4F4TiFBW6iDaQvZseqZkdIv7CMRzB5NY0/8IYBt4rdM6kJLr/ep/sEZVTdGZCblWYkPqUB0/UM+PwEk34HnVIP+FwsHn1iVp+DZJtfoSxC9bqJWL0H0nYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=UlsN0GUg; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="UlsN0GUg"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso8859905e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790174951; x=1790779751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uYZRT0nIgMlAwRKG90W+rLkaTWtRA8cAKQ7+v7bJjc=;
        b=UlsN0GUgtcuHplOFez3FwQkmoOuLY06F3v3t6oRX2CS+ug69goioqIP7TD04yVUdER
         bYTOMNJmNl0OXBrMkGFrY+mqRjVpiRwA7y0KriMOuZH9xqxiLQy8G5Cn8DhKzj1+amxM
         +8xj3C7Q0/EhBp/KFkZ1yaAqZrLQckvRiy2zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174951; x=1790779751;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uYZRT0nIgMlAwRKG90W+rLkaTWtRA8cAKQ7+v7bJjc=;
        b=BlTJH3pnatVvyMj7LwEQAzhXu2TBK7nOpOXkrIWr5P6ssGHIlFP+Q/BDvs2Hos1Rzd
         DFKfE2K+yQ37cHox+KkEUdo9u7Cp0mXqoAzbOpj6IvH+gaDm3fTmNcA5KvmpE1yqHpZ2
         CT7hyvcUplT7V3OuXb4Fr8rtgPNGQqI3bAOAbnvAnRlSxgL7ZntmFsEt++Kdt147CJXv
         ULNWTV6ztB2ssTI0SnBcTdb1lD+St4NrlOhgt+ZqoBfrXVrADn4t3udWWMsNjteqdQUo
         8sc9gXInXVP94DLhGkBPS+HgRIVt9hR5vDOy/+Hr0x4i0o/sGnG6FXYqgGxmFqUJk7kx
         YbhA==
X-Gm-Message-State: AFuF++kcItNWXl14YhEd4Xxoqv5XRgDBq2Tfhx2EbSddumwJBpVH9CtY
	BokkVeWc7wW19LZJ25nHujpzospJ3uKURIMJvR9XwgtBZXCK8BnT/pR+oXuRHl7P3OeWaDYBoRc
	hYiWg
X-Gm-Gg: AYBFou2rK+fkFEsvkVY3YGs5woHImTB4H4MQCBKsuWKKLB+ThLmOwOrFrQhc2EE23G+
	scF+vvkeGozfEwydbg+n8hDYQHIYRQQGqMM9C8XDrcxppWUjOB27WbWWS0sRH5aOgdNDiFRik+X
	Y3jIjMM1gtnu+tZUjz+NaDMWoWrrOaeTsPINBLZX5PvWgPSLtz54DYq0Tzt1rkmJx79V3L13Mge
	dNhtmUagP6RISA71LSPgxIa69UZ+34RNsLt3+f97W4pi3lmw/Kqj7MDvhHJBriLPnPJ1B8E/Ki2
	R7lUuioF94JcZ9sCXfyItMxjcC1G8R9nhmbfmnscQDtaBgb0YDqvOl0p0ugDZHs5VgodJex3tUZ
	dG8hN4nYqK3F73kak5dzdqddcAYayemrKItw/+9PJdF7umOUbYeEXtX/mqPI0OlW/1PSKAbltW4
	NnCXPh7CGhkFzJjrSlTgVkvF1aGOEF90f7Dczca7XVSuY76oXQrx2IGcVW10o0WKMM7i6NyjmGH
	So9UGw2qCbBeEU=
X-Received: by 2002:a05:600c:198a:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-49fdf1454d2mr40893875e9.23.1790174951337;
        Wed, 23 Sep 2026 07:49:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm82614915e9.14.2026.09.23.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:49:10 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 23 Sep 2026 17:49:02 +0300
Message-ID: <20260923144905.3365851-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 6 files changed, 497 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3

