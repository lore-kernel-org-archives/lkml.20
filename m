Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7343998AE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275145; cv=none; b=hpeORKSVpzpY3+XiXF7vpCcn2ebA6lyGnpogujLvakec9/AuZs3X3vWnys4IE47+NjOR1n0RAODNedACwzttNjGfM5JVp/HKxWoeWWmYW+r/MlepVRa2AOPNvAQaxDksEcwvLN1hvIqNpLPab96m7LzyiKIOx0NUlaNJncZYir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275145; c=relaxed/simple;
	bh=ri0EKLCo9ykbHgtbxMCU2oFNY7ARzNutsXrI2nPbGwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIz9y+GTiiBnmVzS2+B50IgFBdqC0ejegip/dcnclZUp1ecL05JfGl2iCPgNcLIZsf98C0wUG8bTrncn9pLOOv2OGhtVvD4m9cWSyfg79d+1TJJThoIFPnxyDIF0JUCPQdrb1HyfiJDoSbZczsLRqIfpZtspSIy+VrtTf83AiQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=a5tb9TcU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="a5tb9TcU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso7102645e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790275141; x=1790879941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=a5tb9TcUHs4JKCWTrvGIIaMWghQEmrjLVL/F7EtGLNlw8eYOH4odhT2Z00PQ8mLyih
         Xhq5cX6dgfcunaKci4iAk6VvPPt+Ss9LHO/E1OI1G4OFYA6sxaj70/podmzYwEN7upla
         bdLXIfs3amngzGsLn86g0HDQvZMNG9LmGb0MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275141; x=1790879941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=tsUWviH2Zc3/aDEAcZNyOQzhnWB6Sp90nNmgrlRTLi86cfzU0f0ap7zb01/IMYuD1X
         0FLZfAFwb369f0ZfKk8APTzhPEcmJquVc2ECwu8uPCa05zHcFqAr4+qXMB1PNS/23NiC
         qDkVrMVOlmzJFp3NiTDqSdZhA+bkquFUDEG0kTNo3HyaM0nprVVWxQnXiZzIj6gygL9b
         QPVMLNSv7e9QY662IK2jju3R4j9qA5z0T7xLK0WhBVHj43QFdYJg+HAeg4F8muLPA2Yo
         PsOejc3vk/6Hi6Q0RxkXfYSD5zeIQt9SneHIpBS6NKLGGZ+OpOhe7ozNKTf8xhvXvPSJ
         CNeg==
X-Gm-Message-State: AFuF++lEIlGI+X3mZW+tPLHaals4rweKfZOWiLXuBtJkV29gjOUrC1t6
	P//PMP4bChqTUjh8mzUKeezUZeFH3f9rGAjYK1L3K/P/z05+4myj65kitwfYwYtjPTo3HErcGW9
	kvClr
X-Gm-Gg: AYBFou3HfwcoeGj9w0zcdw/9aFGNnzxeFzk/q08P1B6wOijbOb3I6uw43mr7n1ZwBDa
	i3CMnaHdta+wY0EWYT5VETRKoxCtLooLuZmqllhH45+DMs9fNgSL7mee+g8m/fK9bvywgE4FycA
	BAktdNV4/HvmUFGZux+rlYKXCvC7JQ9BpZ8D0UClEJBb+8Dk0gM5wIuB1rTtAOM7kSsx5Q7AR3k
	BKtq8irHhuPMpmVOZO5tAjvZBEfG0y8PIkXEUkfCa0/5tDwRkyOPMUu6VaVOVrp5iPCsheEN0Cn
	At+cNJo/Vpil/4A4A+0lfeIRkPpv5CH9aPHSMH4MOUkhE1bkJXYEAfbh/pUY/o6WgHt2qh9SvcF
	O2WIDu1MWVycrmvfEmRJpfld1wtZERti0PYz2cb0UVoWqFLEDldc+CvoeTUg3mKQPUAio4VuHqZ
	DH1xVLhuB4+WJKA1bz3Q5ZhoBBrwMtc0v0I2X1Pu9UJDVtTMKBON/0ZySNDXkhzly6mNRoKPdOx
	+OC1EcNh89gO7JErjVjmws71g==
X-Received: by 2002:a7b:cb59:0:b0:49f:d84d:25a2 with SMTP id 5b1f17b1804b1-49feaa026c8mr36096375e9.4.1790275141515;
        Thu, 24 Sep 2026 11:39:01 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm852642f8f.37.2026.09.24.11.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:39:01 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Thu, 24 Sep 2026 21:38:53 +0300
Message-ID: <20260924183855.1393302-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924183855.1393302-1-petko.manolov@konsulko.com>
References: <20260924183855.1393302-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

