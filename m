Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C7E52E063
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689268; cv=none; b=tABfOp7N3sPJh7ljLPybjUKI6wriNdaeXv/OU/3xCpwCepVf+u1AhSuZs3Qt3W3Pxi0LSuLsCu/ceYKX+Ga3C1F/Ovm+8IAH7+7/30+7cfFPuupXeOP/WECDqGo+m3+NkdLWtfp1sPr7ipv98QUr7ic07fcW15DdW/LKzTBvhV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689268; c=relaxed/simple;
	bh=td7HbxRYci/m7KfsXJrG5cihi0Z8xlfeWoVK9ghwzDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HZEmp8xedogbde5wlwqaiOj8hQ522NDGGImQUNROodZ3gmZVRfP/Ww7iMXh+rytLvIfSnFFHcRd6kxA3z1tZOrrXBWUVQI9/SgurG+qukjfBdbk92aoGZnBvEeu2nUsdl3ikAxKx+A2N5GmtoPdUCc+Z7ONhypjIwF09/CfTgyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=nhWsCgF0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="nhWsCgF0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so33130105e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689265; x=1791294065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKfS1SJFoYbz/LMv6O/HQU2dqXdfzkg1p64FHWJTY5g=;
        b=nhWsCgF0dLexbe3flVLP2LHiQeVplkBaOMQqUujT5XdoIn1I8EZl/cA47rsf8iXFjP
         J04NpUJFUXzeHTxyN2Z9EtO/eZvQTfUCiW58fxfsGOyX0wK++YkymDh1hyIMoxisAXAI
         N+p53uKBHAAY+r8WPsH3wpQJ0AuglD2vCzCf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689265; x=1791294065;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKfS1SJFoYbz/LMv6O/HQU2dqXdfzkg1p64FHWJTY5g=;
        b=hysS7qVmmegghegzXnjceFOKfA8ek/3nEeOjpoSFgxGsbCZKTxJOHv5CHbjiyOlduV
         PIAzOBv7dVk0SuUSIuNd7GkjyEr4IuLcIBlgVmnrJbSYNOe6YPVAyzVEfQfbvon5SEZe
         aWPFuimAsX+Gc2uO0F7kfJ+tr2lCHGZdb2BGOdGWK5cbGUvlaAMIG3gpzECl6CpgPL4q
         zWtyUyoV9KA2NyTUwKjo6sMYmGzUD+uQHMR/sUAie501fQEBRyjrXlR6+7ZoZTGBzPM4
         yl69K9BgK/emM/vJYFKg7K/C60mrpRDWi7NmH7yX0lU5FRITl1yE0BHzO9mPnHiBuzri
         gNZw==
X-Gm-Message-State: AFuF++nDKPyqWUQXFTLnlHTuoqddSUigtJQvRJyGhih/2jjUOGbYd82y
	hGlDILHht1Vv58Jqh24P4aj/in5atGHjyqhOcG7GaRcuE4v6klPZzw1MuYE1EW1YysVOQpa6UVq
	/lOij
X-Gm-Gg: AYBFou2sCWWDQUEQNXoxg6Ei8HunyDiz+ddJvkF4Ws6nrrQ1ybcokKexEbsIOmfLRyZ
	gZPShsaRSXh/wF3346+z5Sv9JGIGMyfpzQUerdg6j6J9AHE2bK2QahvJtrSA1k/sFp0gjrdz/cl
	VXiHYmkParKRXaYXR9sp2bmtXKPZfq02H9phsXJVWALqsTvksu+EfVMWlR0d0H9vucVywYUHlTa
	/+mJecJ4qzIXP5SLghC8/w1Kcay0yUwVSMLxpU4UZhBt2DnC4wiR3bv+zYW0//dDBoxuy3Toily
	/IOsCbVRer+uxeuKnkAgdT0mvhmXQdWCg8EaUbMIG5MI+/t10F3oXV11KW5oMK2Z7PRUuTwiG9A
	3VglTzhZE4rPMnfevYmXmSjMqNjq+au+xXeUAjI1S215JZmhwytMvc0XYT14xaa45Y0/xjr6dX4
	JdwRCg7f7cKjXiIumUjqA1EguHL35jJvyntrNhhI7FcbMSaxQlL9rBP1N7B2rdi7eqzTPmZ4li0
	AAKcsQI3itXc90=
X-Received: by 2002:a05:600c:34c3:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49fe66abcebmr281223965e9.3.1790689264853;
        Tue, 29 Sep 2026 06:41:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d1011d9sm91835165e9.15.2026.09.29.06.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:41:04 -0700 (PDT)
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
Subject: [PATCH v8 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Tue, 29 Sep 2026 16:40:54 +0300
Message-ID: <20260929134058.819371-1-petko.manolov@konsulko.com>
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

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent
    with its other imx counterparts imx6q-m48 and imx6dl-m48
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

*** BLURB HERE ***

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 91 +++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

