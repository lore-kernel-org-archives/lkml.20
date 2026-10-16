Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DD2481A8C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154064; cv=none; b=KEzBf1RjcR5TNJ40LHL2PIwgWtRBe0N2x7ULEpIdemToaDC15hHEsIpVrcSscUq53pPHDrC6iq4pOjLORaQzwL9s/ElwVaHZJPl8HVhEXXn1kIX/+hlb74lsV4yIENN7mxE2yUw3Zuwi2uncAGWarFvRLEtBn6wTAT/e51g7Xds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154064; c=relaxed/simple;
	bh=H901y/QkJvYdCGEuP2t3lOhzjYYuytrCEJW3ZcAsWDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JH0QtsmlxFm/+/3eXEq9UtaDrFDrFPUk3fftHIlo8DJIvyYjt8yk+eUuv5eCwErw93xGf96YY/R0G6G58l/a70mIyw3n62fvl8U3XdEnfYAF/Z92TODKF5lcSAN3mPYR7WUNGVYgN2sUA9EyjLeTz/K/EFxGhL9KzTNBXDj91ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=jXGbv4Xw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="jXGbv4Xw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so40223945e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154061; x=1792758861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siwcp2SaQ9PRcVqmu5YFkmoYwBXms/f9IkfMmvb8ktQ=;
        b=jXGbv4Xw4E4sH9+ltGURBBpprBw7pVFnSC+2eZzB+4sQumL9NHxCwWiJ+qZ5bXKy+v
         4YABeYU2Nu5jRDYqgY1eo1rnROVEihbEWQ5jgqhwH1rec5sCTwWa3Pn29twU7r5vYQuc
         WRQAC7HGGkWNUWKX5aOj7+NqpTYYU/mI+vQ9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154061; x=1792758861;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=siwcp2SaQ9PRcVqmu5YFkmoYwBXms/f9IkfMmvb8ktQ=;
        b=lMvjW66KI4+nS8oMyS5vjpbfrJBI55zugJdmuwKAKx8gi1Hwfxk3OspMlXY4x7kRcQ
         Fhe42kUy7nNGcTwad7GzGQmmYUX+/HF+SJJDniZUigpi8CYdujWhFzWrd/t11tBclV7O
         Fr4HpUktzvDythkDfcBtoOgDOxdMzOkceK0mvgeynj6rAqfRI375FNjVDHeHB+eTT/6e
         Ij/sSasWNSZKgaJkWGJXEh/a6oJFaQPntkrQf4XZaLWh1cXJVONON/mlq/8KsoYbPB+i
         lMXwkXHCXYLnWzTkIEWKncEskfCGsxQ1xoomG1790/e9C3Cq7OBXDXURtQe1wqv/gujf
         XWYA==
X-Gm-Message-State: AFq9FYK/oTOd9nxZ3Fu2XIOUq7k7hLCnW6B3/eqcTycGLelj+ce9xkLQ
	T3hauImaGc7UxK+UuSZ+6dhZjfZEgs0ovNYSPBk2gk5NnKgJ6LD8WRkbu1DjpsCsSlNpxpR+9kS
	57+0a
X-Gm-Gg: AYBFou3DibyWleq65z1pgBjWUkflrh/z9+s9WVr0SveLhP/AcKHIxPTg19oxZ+scmey
	mxe3yo+1x8zmcK+o+dt6n6ZYc2enBqePBRIIxniVvnDL0tAvry5YsG0dNtf/LT8mQYWjt48TA2l
	iGeJkhN2BJIoNmQPrgl9v29JH39AMhEQZ3YUkVwzuQ6clYWlJQ1DGlspfhTXnoakxCIVOqbFbQq
	AIle+rEsMyjlLA9cqJ4UHgK4xKh5W6cBw2FO2kgEXPefD97SRoJklgj/zcm9nejyK7zNCG+mbFZ
	Yb3A39P+XvgKV+my7Lru2rmpDbKIh9Tzu76qQFAu09Fa8KdJwzW+2QGb2tFFcrmK/2xz+R+KLv0
	oHyOEkQRR4pH8XidIGm7q5uUnKifMujTpJIs7PLX8zCkfqrrTuJ8477UE9pNjiyJh+RIiiJEcBf
	o5910wUdrSfkcGhgrMlxdaODwWzHwGZv7WD4loHrqMLTgfpzy8p10I5xfZu5zIcw6aAvMR9vSUv
	rsdHOR6G1syRjA=
X-Received: by 2002:a05:600c:3f06:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18e4ca2acmr438130335e9.32.1792154060975;
        Fri, 16 Oct 2026 05:34:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm110564045e9.1.2026.10.16.05.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:34:20 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v12 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Fri, 16 Oct 2026 15:34:11 +0300
Message-ID: <20261016123415.3272046-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

in v12:

  - add proper compatible string to the mdio node;

in v11:

  - replace the ethphy compatible string;

and in v10:

  - add device_type back to the memory node;
  - move the compatible string under the phy node;

news for v9:

  - remove the name property from the memory node;
  - fix a typo in a comment;
  - attached phy-specific skew properties to dedicated mdio phy sub-node;
  - add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent;
    with its other imx counterparts imx6q-m48 and imx6dl-m48;
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 102 ++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

