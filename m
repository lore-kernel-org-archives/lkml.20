Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677780;
	b=PcIV+6gn1PbodZPUPd0HdO/UGrcvD4lR2axj1dQqAw10q2GsS8ZH1xnFhsnfqv0CO9mI
	 T7OTmFhZZjH0dJ4qm9KDs9ncr4ga4+tU7OIb/kUCIjo4Rg833Kso7tzUrnuHbgeEvcaPO
	 Q7FwrKDy9kRuA1O0koFQNv2WgFnbwIpPmPbcUlllWrVn1Tk9qG0qucRmD2xiCdPla5ZB9
	 o0IWvDKRZjWeMKDjaS+7tBWvZ1gwQwVWjNFiHQz9YRHEGLkEMTyPBfVvhAcw6pYmSIkmS
	 XhKFVlTUFNg9nER7lJCk1nRtG7t9+XdP7ME4IQiD8eNPduOiHI+7sD7BmRpatXgoAZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
	b=f3xK9RmXtNo/iEqBJ4pPEABbs2E3tLtMdSl4kEr9JMKFR0IUCFWz4FAMzFJ/DosZevt+
	 +MXlyX2rNhKz0hSAT+MVGxciSo293XxNlU5wgqASSnlgEUsPz1L/I/Zb9BXKzzInD6D9z
	 9A9UwgWfscezDIYZxfyVGvUdXnGKXeyUImFCIzZsJkIpS6ToZqgPqz30e6C5b8/3SIZNZ
	 V/JjNAVaihLgT6MnKeK1o/jfQ14QttNFsYdPBKHEBIVTsmhXRUr9imsVlvr24jLyJmKBj
	 Dfqj0FkI1ByuZb6XK54LBSHlfXCNnm1ljDAvTIXZIO6+nb2CRBg1H32XAusgVuXKwcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=AXQ9HFzh;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B833606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B833606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=AXQ9HFzh
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1756262f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677778; x=1793282578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=AXQ9HFzhd/Z3Nvc9F5PL8GYl2otL1UEi671CjDSsedcCw87bOZI2GQC5b9Sp5LVaqy
         Kpe8DzFhZY0WQ4WHeu/Y57Fnv25O/HC1UzsBdIijueZfg0nuD0V01KwpDR9575h0dCIK
         e5/D2XfyYzfVRck9PfNZ2scW5qPJEROenucls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677778; x=1793282578;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=TPabimWRGLcAO6+c+rqLD9t4vs8QiDFlB+PiVCvRfgW7wrx3aGy0ZTa3NivzV3AO+T
         3qwo/Rj8e0cvZlo4DCk4WzTx0kP0cFr6g72/FhnX33TMtWoxwZ2lOeCoZVqzTh8EvSHN
         oLYSw6GDqTKzACEIOPrZsRJeVR916mRkKKHvFug+B2vIzOreg/c3pXYdc3agJTgu9Htf
         o9281q4BNHoTb6sAccKMvt9C5pntz3RgNmTL/oAvk2D2+euR9aTfNCRVH2nJ3DDpiIj0
         2O/ZPOTKxm20h11/FeoOUYNItI2BUZkATYOBZVPpPH9UkRVF/FrYKwteney2jk6BEo0l
         20oA==
X-Gm-Message-State: AFq9FYK5zkfvhP9hn1kiYsHkSDXqOCjXc9vOZHWUnrn4oUWzO+y7ilUb
	usr6taMPzhhvlQUQkfte2VzIxsZNtDEfaPzRQbc5dwd2vYPKgl0Zxfdn+sFrClr0+k5nkI3iM+T
	0gRUB
X-Gm-Gg: AYBFou1CX5u7fzXsm2JF42MygCTuvyf6m7Wg3iEbMhuv4yjwUrTw0MdMLeFv2rE64BH
	ldZgOhzAcEauyn5AKzgccKw2PuXhok96y1dFQ5dL3RJNu38R5kxLEtC884kkdBME1lWpgpSFiAm
	XiT6fMpidRVcY8HhAVXaVWkEoYJpnwf0tzeL+vmcSztMl3QaoryjmkI5di4tzv0cp+dU8VD7Z9r
	2OEJUo2rQ0sPp0bpGm4TcTkPjkkIp572z5qtvRumu9E8ng71XI/0Lg6x7iXoZQ/qyYrQ6yWUrDy
	R5iYIThWgR2O345HM35TWR9YhnFH3TcQ65sIJrnOSqPDO8gMMSsqh+SjVz1/+Yl/pjxfqVD7VRR
	rnEylSuWKXFEO4gRHYOkrc+nOE+C1oVTxSZeruiYEl7ltba5MQd9SdNT4kqXYZNAy/KvmIb4/Mc
	HWlpqXUerdoHtU7Qb6vRDKWsIlCK0f7gvzNe7lwPVTYmDBsDM9frWEoZFdeXedjUgfAxzNAKC58
	ApZM5AngDXUNnjyQVFm7KrczxglD2gyU2nfnmZp8w3OJZL+wac3/2EGFiUS3/fENaAA88g/
X-Received: by 2002:a05:6000:2612:b0:48e:7fb:aed3 with SMTP id ffacd0b85a97d-48e264a5a5bmr11406983f8f.17.1792677776798;
        Thu, 22 Oct 2026 07:02:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:56 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Thu, 22 Oct 2026 17:02:41 +0300
Message-ID: <20261022140244.3476844-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v4:
  - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
  - fixed the halved LVDS pixel clock in split mode;

new in v3:
  - used LLM to cleanup most of the errors and warnings;
  - proper use of dt-schema this time around;

new in v2:
  - add the tag from Conor Dooley <conor.dooley@microchip.com>;
  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3

