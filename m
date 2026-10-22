Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680412;
	b=iWWDkv0w/hSEMP39Bv2opBkXCj0K2+/4Mb3GKQAgYvKy/QdZo7RZYbOoQMYgvM6ghDVB
	 /9rxOgB9F76C8+xppNIZXmm4vCe7O4LG5NulV19D0frPs65bZ3REsEvRpXbrU2Cc5JuYS
	 Vv9IdYtKfoF1BcsUf218xj9IHxvmUjpuKeBRop+46Q5j1mRO6n1m7QHhUaTUmT6GizxKZ
	 MdAk4CL63CwO9s2w/SB6QPc9ZgsB+wV8ELjsJq2MHHMLRxXYCYgAieOq92fZrZCH2kifc
	 BsyxPzZgAHPrGvhrS/APBJPrRKcChT9T3cg9yWGRsfOF0Cke8rQmHSyp6QinbzORa9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
	b=yHORGi0X6tKy8I864/eTLdzK1cDLziR+bpcxUOOl6R0nq4MpEi9y30WrJ+i2JaMaOO9H
	 Nu9tkXX5uw7hrkgUINCEqDEQmbyWCIdNefqreOnwXPbRoR2fsmD5KozCUBzeCKCTjgKS7
	 tNWaJCATpLsqgrdDsghCsQGui1w/GN2MdmGsYaFErRAufNdScRQTfsQajH6MI8lfFCmCh
	 NQFQYbVBB16S2ieQNf4/L34rsXsiIT4UZu0RZv+XIWmpocOq7q5Ppm5CqiW6AIXIg/Ex5
	 4eckkqe9jY1NahXzpEznPJ0Fb9C6G1ok4SDpQBtZVLWquLZ+metr2qP1m7VO9UWw49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ot9hvuVq;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77265606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77265606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ot9hvuVq
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1215862f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680411; x=1793285211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=Ot9hvuVqUOq4gabmyCvwiOpEYaHkAlol+ZEJ+1cT1OVD9ezQZHGG5WY0oXtZtDiyr6
         Ivg3r0z2c7XpTJYV3ApxAeUk1jBLru+ESu1rOMHU8eh9HA18XmECtcNzJnXmFqZ2iTsh
         YpNJAQnuOxyrnYpd1okZKSdwZaEF14wa0QzA/wF23clzBXZBi/GmS1mD3ASyxywDPg0E
         MLm4pbqNwrLuizs9rJH9Uxm0Ne4GUkc6wjHYff23khKp4lmz/jyu2/l2mZyfrIG4ANXl
         YVFqI6TM4zlk4fdkcmsgDsAX3fYVHv5thGsXhNf9sGnQG2I9+IiC+aUBiCayOy2/lEw+
         X4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680411; x=1793285211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=fMGn0B+Mxwbt3hhWqNAeo7lu6dWWMfgnWe+3nYN3bHj4a95xXKBjQOlNKXzTn15MaU
         S/c8yGKxDFVeY2H2FPHDklNXuUJEGoYAuxhlom/cG/B2HI5EZrx3ji0vcZxIe0R89vH4
         Cn7HmbTRbJWwBwHCv2XJWnbG83yk8/icryv2kaA7bY87RLsrFp0dNoHsmdJudJXKDnHu
         baSJ/Sjs7lgMkrt+WMDqaxcAo3Rg611MDxqy4MCxckJFEZYZbIH3A2F3MwnKH9xSC96l
         B/81KoTvw4UzqweGykFO4t1VgjhtqjB3uFBHZ/Bt1NbZ2crKhvhdIqkL/h0re6DFmtg5
         ZE2g==
X-Forwarded-Encrypted: i=1; AKwUvBzIP37wdQtdDTdV8dAc0usgZgxQVKv6IPzvEJstkOyjW0R3fQiqH4mZF6Csfl5v7NdoX3XJuldVJ0aNwGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhSCyCYk2MfhZEdKig/o5K2nG+XiVNtJ4ZtXf8ozQSXhXAdaTu
	/kTc/gMJFCaWSUwiYNZOpfYO4SrU+C9rnMRWFJuXF92vmjRtGgW3D109
X-Gm-Gg: AYBFou2c3yS9RSXVRoMxU/Zt6VtTwvqpAzBoPiuh1Pn7OAO66GvhZ5tt1lX9cruOpiU
	BmHRj1txFkXZ2zTDL1iaLowplxqQeCdvxfNFyrMTcSuN3w7nsFnHy3bwuRN5FL3VxF9+O8BnDxy
	8kE/uz2jxpKpRUNAFb69IiCnOd3vk9cD59oKMIPQJkjN2x8sq4pkH9wdt8BO8/L3n+2HvxAyHZt
	2+0XMdSKZsLv+bHeJ8JDdbw0ybSD57Fg2Xv+l0u48XCZNjF0Te/7OWTf5lJQfdx1aarp0wdsgmL
	3CqcrmL1OE4rn4Eko36FagY8oA8gGLE8FQFhiYAPe2zmliuOjG8PGHLDPWgbt+Zfe9QORc6P1hc
	Cu1XoBQwGjyMh8m9LOQv//XOJFKW+UGovOjgnKF9PjSEeA618VZ4e3QhKUu1yWrRcIcXQhxqwHZ
	tuDpv6ZHaHnFdAZNHldI+CD2weNa9bSFgXuagg21ZySwRNeMmGx+v54RXu7gDjx7vZjEHk6xZ0d
	gVerZfCZ/WyFyYxWia0OqoviqD40ihI9JCook/5zalriMAtE2lc6BUzEhYf1tXrU2F4OZMyt1ww
	K4NwGqB9FiO6Z7fyh4p4JrC5M8HQ7faM53ejmpz1mUfAeFsG8Tww51jHN4UoCHe1QhETqdOKoHY
	L
X-Received: by 2002:a05:6000:2c0d:b0:48e:d36:77 with SMTP id ffacd0b85a97d-48e2644f155mr11067241f8f.4.1792680410751;
        Thu, 22 Oct 2026 07:46:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:50 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:44 +0200
Subject: [PATCH v2 1/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-1-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c..c28d63293149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

