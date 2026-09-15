Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C13A7F62
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506028; cv=none; b=rnyI7wpQzVYt82UF59+fYWWONtPOyihhnVVyHUuKmiLbAKZJRe6/QEAGmXOsESSBNvnhfNTiXbAf+Xq6UPS2p94vJnLyMvwkBL0iZh389VYGDzWHDqYNAhgU+b/t30JR+lr8QfDaNTEKA1L/HVlVhfyipEp7fzwFz+lF2xk43WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506028; c=relaxed/simple;
	bh=nFvXJUaWFc6QwU6CBdz4mifcLJAAVpUo92s60EY25OM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAarEmSf3rVjdye4XHJyuZHwy/lRIFV6TWrNtxnYJuDv3CwBbTYKY6lX32BUDCYrgoyNCh/3FBFPzH9dI/OBP+Gyrb0FYpgZYsNNUaPhjt6NENEq0DtYxZhAGJ0MsiT5/ZwQwaybCDzhj5fy2bl9oTo3fwi2X4PwKsqZ0WuomsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIY1yEkZ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIY1yEkZ"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd89b59dccso229045ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506026; x=1790110826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c10SF/7zsBBaBHTvbD0jmeqK8wv98hcte/XAw0iO1VU=;
        b=mIY1yEkZToMYoKlaSOM5x92WXu0U4Ob6qwEOg7VJm26Dt9Y6YfENrvPhVwiwy1DyVR
         UC8OGf3N5fMAqXjQ1UPXaaDwhGXcgv0czt2BM0U9cjejsqwBALhIwOcqUyUJWqZX1qo3
         vK3G5f22CA0gB+iYz13LLwG12mhwqvBiTMwgFsOMNZnnzmbpA891kz76W+PLFKvHlLpF
         Q4k8mv4vKXr46DLiDJmII375h26BQ37t6Xy9adqf6OXwZOXOetGTFzly74W3BWN30Ctp
         81/ZIvS4UPf7TDXCpxiAlg+XojS5Y8d5bIuUrm0Lj4WHPa3N/Pq3SBCx8OioGuoXro5b
         Qkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506026; x=1790110826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c10SF/7zsBBaBHTvbD0jmeqK8wv98hcte/XAw0iO1VU=;
        b=jbUKy2iwh1p3hl2qPtp1MBQbeGGmU1XKB027gwkxSvGIuNgZLSp7UWeghk0vV2Egsm
         4yoJlTEJiFpTdvNFzNFQzZoRqNO7bWCEzbV2e4jc5RESZSGW2p1hTzUT5dULbUe61+tC
         jm0r+9H7qC0iZH+3tSGJgOOu2ZZNCXS8nJkOXNQ1gLpguxRrGhLizSe2XN99tBjFLMlW
         wqQodoOWPJuxYIekUDLfclHxeJrsF5+eqmHMG5zW74rNdOCgroNAzexcLj+YoX9xR1Eq
         P/k1t0WphpGpyphN9t3HFAdQMj6XDLBr+YgI5lE18X/r6WyixUCk8UwgcFuumDCu2Ls2
         T+Yg==
X-Forwarded-Encrypted: i=1; AKwUvBz0B7QPjEb57HSzU018N09imUb91DCZAAxZdeD5/CYERL1rXcIBOTtM/agcnNwvW+cY7BfYj33rcUW7MGY=@vger.kernel.org
X-Gm-Message-State: AFuF++mm/lSAeesItEMpZsmDc1B94HEBk7MCOtkHwZJw1YReABXlAEKh
	6nXUj394DohQBJP55MkMaHAODk7QrXFoSNy6rIXZvPKKaBjfjNqtdLyG
X-Gm-Gg: AYBFou1xjbzrdxCl3PzxiXjwJMAe4TbIU80870sIbxj8fF73vqz7TKV6oKw1dP8qqqS
	IMkmlRfg3nF9/gWWmkOSTAF6phx2vir7UYnMrSARzZbTZ1m252CIGlveJGv0vBjl+T0r1SYfTde
	U6tcInqEJoKBezCbLfGDDdbApw3MV4M8du8ZR5jEENmRyTs2tvtE5Jyx6a8dQiVrFTm51wOuTmS
	q9e961mVaTWELue749S0vsJoRIPJtW6sEG2D61YS/33crLR/vjyiksTYejXSp+ZhvYDz4asvW6d
	1dZvcma5/o1CJJzTsI8YZCdwo9en1y9pLuL/T6QJvv0tiClHd+9rhxVJZAv3KlfcGzFnkuCXJTK
	kNtSb/tj1iAG4+c69MDsSHtA4z/20Bw/y7IO7rRkmRZMnQevfPMmvNk6/D9iI6A3opREnMhZueX
	3NtSTWMyrVlNHlGzNMioJV6OjdYFdUX7FwsUXcaD5GMsCIHQq9VSSNx2T6HYcZlkHjTtTTPooQG
	E7+HiP3gvA=
X-Received: by 2002:a17:90b:4c49:b0:39b:3510:4af7 with SMTP id 98e67ed59e1d1-39e1e2655f1mr157584a91.1.1789506026119;
        Tue, 15 Sep 2026 14:00:26 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1483sm465432a12.26.2026.09.15.14.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:00:25 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 02:29:39 +0530
Subject: [PATCH v2 2/4] ARM: dts: ti: omap: dra7: Remove clocks from crypto
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-dra7-omap-sham-fix-v2-2-4eadb60081e5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789505986; l=2316;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=nFvXJUaWFc6QwU6CBdz4mifcLJAAVpUo92s60EY25OM=;
 b=CfWKw1q1THlrNfh7dWWm0PgEbxlH8ywWqzQIz8h3CsiuUl7xUDuYrBeLl8FQ1VYpjps62JJPM
 iHpqQGYWTutAT8aMfSFYoWDNkgMhJXLzVGHCdp7LNlJJQ5dOaWOELdZ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The omap-sham, omap4-des and omap2-aes crypto drivers do not use
"clocks" and "clock-names" properties. Clock management is handled by
the ti-sysc interconnect parent wrapper. The dt-bindings for
ti,omap-sham and ti,omap-aes don't define these clock properties. Having
them in the child nodes causes dtbs_check warnings.

Remove the "clocks" and "clock-names" properties from the sham, des and
aes nodes.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi | 2 --
 arch/arm/boot/dts/ti/omap/dra7.dtsi    | 8 --------
 2 files changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index a595745afe59..bca035fd7e62 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -2086,8 +2086,6 @@ des: des@0 {
 				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&sdma_xbar 117>, <&sdma_xbar 116>;
 				dma-names = "tx", "rx";
-				clocks = <&l3_iclk_div>;
-				clock-names = "fck";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
index 711ce4c31bb1..0784c6d9cbe4 100644
--- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
@@ -1012,8 +1012,6 @@ aes1: aes@0 {
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&edma_xbar 111 0>, <&edma_xbar 110 0>;
 				dma-names = "tx", "rx";
-				clocks = <&l3_iclk_div>;
-				clock-names = "fck";
 			};
 		};
 
@@ -1043,8 +1041,6 @@ aes2: aes@0 {
 				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&edma_xbar 114 0>, <&edma_xbar 113 0>;
 				dma-names = "tx", "rx";
-				clocks = <&l3_iclk_div>;
-				clock-names = "fck";
 			};
 		};
 
@@ -1073,8 +1069,6 @@ sham1: sham@0 {
 				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&edma_xbar 119 0>;
 				dma-names = "rx";
-				clocks = <&l3_iclk_div>;
-				clock-names = "fck";
 			};
 		};
 
@@ -1103,8 +1097,6 @@ sham2: sham@0 {
 				interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&edma_xbar 165 0>;
 				dma-names = "rx";
-				clocks = <&l3_iclk_div>;
-				clock-names = "fck";
 			};
 		};
 

-- 
2.55.0

