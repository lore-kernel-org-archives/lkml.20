Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0943E298CAF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139287; cv=none; b=mYVl3oGpaVFQYFtcRdcsNVES5a/q6GNwm6YSdKJD+v1MtinDmb2mKDwxeMsBHiu6zeJPe83dhR+lh5F3LfhcPTyNBzl56OU8adLb/rg+eNr1wienaSAEs8E/S/mL+Q0yZu9gS/wVwIkHWTeEL7tr1bqt0ODiddieoOIT93TuoQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139287; c=relaxed/simple;
	bh=N3frbq4Brgq8hgGZUJXVgs2Tedjbb/R+MDXnGu9l10c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SjrlQdG76fNbU2jw7av06alq804eoOtY9Swr6/yhzf8CQhi2JmCDMqHOjcRTFkp+6UQNpcJ22pS3s6yI24+WbC9ldTnZbP2nZUd9YIOUdV4wgamGbysX17ZPW3IRY1k05+wWyxAToyd6KpAfxyX5ZtpTMMRERCH0Ki8kPUPhiaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=PkieVPPu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="PkieVPPu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so6245785e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789139284; x=1789744084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+9EKefJ9I3t5TWISEhfwAczcNql/LEBcHoCAJliQOk=;
        b=PkieVPPuORXbFOCU0dD1etnvibwVAuVwocDSuWDQNWFMgvFpUaDP0uCXjmhptPRoCE
         veCrZp6EOjij2D8DZkqVgiAdJ7HV4skmGAWt63AN7lNBGMI1oClt0YbFU1DAIXFXvuTk
         6EAd/Cba0Mqs3rshRnThXnAd9KZ7BpnOCG8qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139284; x=1789744084;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+9EKefJ9I3t5TWISEhfwAczcNql/LEBcHoCAJliQOk=;
        b=HBBeQRUF0GVF4uz33YRcRAGlOlnzW/f1g7DGmLuUebzJlLO8dDVX//JUGV7JbWpU6o
         pUz98+C8BkOLuPifvcZFD1osRgm7JoiCLetKkhN0wXVmUeAyosMf9nQeYAAhhnZnc4AZ
         D/4Qr2KZ/d5CM3akm98miWgIjZZgt14SfjK2kc7PJ2iuIx+vqXKnfNiAJxtLiH/fcaas
         DCCAsapfTR7Z4TzRgRoCMyR++0tx5+YBlQNKrkRwShb/jOWp9u+aC8jfpIR7XekzBlIh
         9puQ2owU3HhB9fswo9UlVBO3F2GaM4GEPPxfcy8hbZuf3Fv2+1Efysk4EUdRr2usIZho
         UPxg==
X-Gm-Message-State: AFuF++klFEPSxpOPNDXX2WQDK3II1GHKAcLX0KfsHRPReT501un529ua
	FM20xZ9lxZQGPT+DliJcV/Zo8zylJv6UD7dNFaXPXbdwXNN1JqlzOcBje1otDIzGpv0WRkrUvU1
	IlZWO
X-Gm-Gg: AYBFou1l8fL/5hVXWHWA2eXzc2PkGzc+rUBGXeDChYzo0pqONmtY9S7xnY9d+/Lu5e/
	sCjJRSZMPi1AF6Fx0ULKgys/llt95XVGxKYzrIZS2QkFHPj56yxt6p5CU9IojS89OdVTEw2zAbg
	B5hWknime/VLDCCKhLTfENnQlTWc8aleCgbKPwhReSKUvDRh8nhow9Q+sRZAnFwAWUdnAzrlpuM
	UkxhCd3fr2YdOj1stPry1PhnEoRytHfm8MdeNCuX6rNp4z6ZPdyXtxjHoN2UvusEgfSkU40K3sO
	wFVf6l6Ct+oyS6oyv2aepElnZ05ERjSK6Y9b+rz43vsQLiNcA+rkrMD8j2iY3LpUNZB9fvsVe0A
	NHv604qMX2TV4AB3O8mTEBtrkuhNkJbMNIfK/zkqG1KhF7RzXyWV2/9ExI6QphBYyVS0S5SYfD6
	ybFOpMWeXxAsDkSsVnXoSt/351kQ5aFRc4n5H1B6DEEdzEO7HS+L1WLIriUZw11izMZkvE+7dd4
	VxnNUyAHs5Ni9Ud
X-Received: by 2002:a05:600c:1385:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49e61878ab9mr83494395e9.3.1789139284113;
        Fri, 11 Sep 2026 08:08:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm108933095e9.4.2026.09.11.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:08:03 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Fri, 11 Sep 2026 18:07:51 +0300
Message-ID: <20260911150755.2803736-1-petko.manolov@konsulko.com>
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
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

This is the SoCFPGA devicetree part.

Changes in v4:

  - fix commit messages formatting;
  - remove stray comment from the .dts;
  - remove undocumented "bank-name" property;

Changes in v3:

  - add Draeger AG in devicetree/bindings/vendor-prefixes.yaml
  - separate binding changes from the actual devicetree patch
  - remove "earlyprintk" from the boot arguments

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 Module
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
 4 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

