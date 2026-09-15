Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564354A1DF6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506014; cv=none; b=fLBP0iBitu88hEXInlv7Y+h7S/T8rQEXtt2rvs89/C3SToOS+Kc71Oh1VIGf6I/E8GDsw0jJYWPf0dq2x+IjemRVs8XHzbyFQRWA3aHUM78I7AlvF85w5uWio43AabtIbLUCfLzrZWb9+gA+LM87jPl87esnoPrp+kdYxyQ3sWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506014; c=relaxed/simple;
	bh=cBWOFBzMLsYPxfimfbKAlO8qMRXN7yX9hOB3gswKS8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GTqbpxDtG3n7Zhlsis0tCkbPXJY6bXRKFI4SPChT3wKyEUCtOnThhyRtvVNa+qhu+Vuc1M4XOZ4DJRtfzHypi4RgorpxBCM6uCcT6ZZkvNEDshJGyph6DaUycgtA64mYD/ly4Azs/WgGAeJ5A4PdTuor01wDRJDyP8p6+WstP9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/1C10UI; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/1C10UI"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc42c773d05so18137a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506012; x=1790110812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yglg3Sys5hZqxYUDp81g8N0jGnQoqfRpeFpHtjkozQQ=;
        b=G/1C10UINK19mu8aOniYEMY+NFWgD6uvFrxIeBqMTqIe4ZYcd9WnT55ihVHuwLBcBC
         DILj4biEetaG88Mbze81gdoUFspZlxiIlUv2NrNDKBjq7RdyFcel52ukDF7c0/djkhrT
         O3z7ALfBWXE+MHofaYO24NFDF2kkuONyMgYUhb/kNpq0dxoh+I00PoVarDFnWEixW2hO
         z3Rbb/49NcVdVEhljZUYPoZpr49hdeoOwjMv8BRWrL4JzsGdc22i8ohQIuVe+fIisL+r
         29fKI56YFbfJ13st4W7ymFm9OG78xct/2NEWYyIf1g2imu19CWSI78vetO6pEOWiiJ4R
         WyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506012; x=1790110812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yglg3Sys5hZqxYUDp81g8N0jGnQoqfRpeFpHtjkozQQ=;
        b=QasY0e1/nFLjEfLXI/h/4/6BQQF6EVP3lhiGXVmr9oIeDklfpgwRqQzVZEEYS2dau3
         cZUjThMaJNXEFlkSw+RKrSrLh6Tev8F70KD9oqFdkDxeFv+J1pbk7Vx4V+RxfMPnLoxP
         /3mXJCg8+CnVfo0BO6JQEeHYSErZuo6lN53DG48jJiZtj0HvEkucmr8zJ1Ifm/46EY6T
         SOKOqf7SFJD+fjgrXzQiQh+MelZGUQIzL/NxODjVnlr1l5DQLMIQjovFey1oLgrrwQjH
         q9YG9EM98UAuptpxwktun7EyqwSEJ7Lm0zNYfzIp5cK89MDjZ6R/EeO1UlodSmWFMNMf
         vNyw==
X-Forwarded-Encrypted: i=1; AKwUvBxNqC0Ntva7l8uN5sIs6HVfvsxPcqfLfW45OTD++BICyevFNsFp0Jd07HxTpOkfYBhrAeipfbqRXlz6sas=@vger.kernel.org
X-Gm-Message-State: AFuF++lVy7rup9qfcpgrI5bIiAFCF+G8whi/YAOj5dRgRjcQMCXCfft7
	Uq/O5JB4dK3iXGUIkiP7f7KVjDWCzP4XQkDLXRhaCKYGB8gnIZCbBS8e
X-Gm-Gg: AYBFou0cb3m4KME1RkHBu/wgeFIJBmv8lM1QQbG6J4/daNwa1WqPu0MJGC8LHrhtR0b
	q6YIOyscHYugsQbNacI1bhQvJ6DWhm6e0Kg/6APWv8EvXSMQpTqEqhjS+9t8+mpbM82m59Hj5/h
	uuhuW8Ey0N8l0pfBGclzTAWrYArPiSMPrHGP0RNkzbwVXjX63WaLqRRvS84Xf6Q5adzFpz72O9o
	/MjyX4/CqfFMQq58mW8xPfOXWbhZl5U8v5sWT/x4yGrpvfE10lnVT4T2YDcz8VRQ0QNoaIyjFm0
	ego78SytUzTTJN3lFYRaaDGqryLckTBy6IbTQCa0oFvTZ7wfb1M1ulA8oi0AnnMrNb1CfGhN41j
	/fR6HxxvrBKQThkhUtBTAGclswbwO5xH1WXKVLwvWIVxGErcmZnWpfk1RVyOgBHf6p0EBmYGwY2
	1spNW33zHeX+Jk9PqgcBOcaL3iF4ESgB3ps55qSLJ3fDBexqq8axmATo3k0JKn2Jj2nN20AKetc
	zqICELOSxhZNS8GIh7/lw==
X-Received: by 2002:a05:6a20:549d:b0:3c3:7f50:fc39 with SMTP id adf61e73a8af0-3dd5f0808abmr272462637.0.1789506012429;
        Tue, 15 Sep 2026 14:00:12 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1483sm465432a12.26.2026.09.15.13.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:00:11 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 02:29:38 +0530
Subject: [PATCH v2 1/4] dt-bindings: crypto: ti,omap4-des: Remove redundant
 clock properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-dra7-omap-sham-fix-v2-1-4eadb60081e5@gmail.com>
References: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
In-Reply-To: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789505986; l=1434;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=cBWOFBzMLsYPxfimfbKAlO8qMRXN7yX9hOB3gswKS8U=;
 b=KUd18yw5fwIIZ/7ECVBLSNjCwhgLFtTHojMC4oxj5+q+01W7orHCMx08MGwoSNxLANFWJmlkT
 fLwWG/npqVqBhSBM5U6Yo0q6F4/kTZpzwZYBAr0xhiXqZJ8GbR+xTsu
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The omap-des driver doesn't use the clocks and clock-names properties
because clock management is entirely handled by the parent ti-sysc
wrapper. files omap5-l4.dtsi, omap4-l4.dtsi, am4372.dtsi doesn't use
these properties either.

Remove these properties from the binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml b/Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml
index f02f1e141218..2ed6f77583d4 100644
--- a/Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml
+++ b/Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml
@@ -31,13 +31,6 @@ properties:
       - const: tx
       - const: rx
 
-  clocks:
-    maxItems: 1
-
-  clock-names:
-    items:
-      - const: fck
-
 dependencies:
   dmas: [ dma-names ]
 
@@ -45,8 +38,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
-  - clock-names
 
 additionalProperties: false
 
@@ -58,8 +49,6 @@ examples:
         compatible = "ti,omap4-des";
         reg = <0x480a5000 0xa0>;
         interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&l3_iclk_div>;
-        clock-names = "fck";
         dmas = <&sdma 117>, <&sdma 116>;
         dma-names = "tx", "rx";
     };

-- 
2.55.0

