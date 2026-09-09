Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223EB530E11
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952537; cv=none; b=K1yJqjCw4gptgDUP9GK9BPRm4akb7P9Nh9N76TRbovZDeIoPmEZA9j1MvV7XB3/hdhCs71hom/W++peWB4Ma7RX+Ozn2gKjKXSTeuCT/CekLxnuotVvbJYWnvq+zVmyv3Geoy3ul/5iEwSrCWCq3/QICuxrPi4AurPogy/CAE84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952537; c=relaxed/simple;
	bh=hbJn4NRCKD6Hzki2Taev8IkN2yqoPBZLK9XR/9cYFaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZIrSjOa3C0I1E8/yWQwQRhiQyvadCVj1QHg3PQNGuau+C/talFZP8ifnSTQBHiALBA2B/GcvsMxf4sqJTB+StWIQ8pHgPCeGwWTktquZHnVC4Vdf8jFL2wDKBo3X0Rd4Yq+995rHY/AK8H/ykz3OUbQ/IGU2FZ7GY6o0S2+tGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=YDOq1PP6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="YDOq1PP6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso60774785e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788952533; x=1789557333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PR+p0s4HRgq3MsIHDXZsHzRDiZPU8CDwPj6dMo6pUN0=;
        b=YDOq1PP6yAE1iwT7dUQ7Lf0HWHXeHZE0SFz0qt2LW3Tv/0KZi/j0DYJXEnbr7hRaCG
         dOoG4dHhR3UggWDF3iezuYu1nAheYnPIhd5vT9zbKQp/Ut1ilAHlxnJNuTDjxHCFelyc
         OLp8x3nFFzTK74sxUcTbxVP+hFS/hmrL4T7KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952533; x=1789557333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PR+p0s4HRgq3MsIHDXZsHzRDiZPU8CDwPj6dMo6pUN0=;
        b=MRkMZkzMQjCpX12z+51RYxd8sZXGuapUxT1dw4HNZSJpyZSBv1RIMyBF1MLrCjncLc
         F/L9IdMhgcyM/EQVK9bz60ZWD6+GlP9rgwqQ7JsGVqVM/BosNdE0/M6rPsjtrnrztf8x
         hKVeLMcJizmwiG237ltgCzOEyKszqaP2CJiesFq8yw9MJj7UQJ0FM1vTJGx94VGYkVu/
         1Ayzd0dUph0AJUZHWFaWGvj0K8cH1HWpAr7ibvs6NmJL9dW8sxz3/nXUrAicSTsa74b2
         IcacoMZQGpuPlIEaUAwY4cHkpgcXkyP2DhhPnkVRWWecS/Ldy23ontL2zeVV6tNwiYbE
         j3fQ==
X-Gm-Message-State: AFuF++nWdl8jcGLWqgou3HIWRuGPoyGpPLamKaUhDVJzbKEiN78Ikg3O
	Wdoc63oAYaUQxR57H6UbnlYipKpi86h91kDXJKRaxowl2DxfhtOFJ/GA0AbFgg1f5AldSUrjs1C
	zca5/
X-Gm-Gg: AYBFou33dIN5nI2BdYeVt1JWeeE7uR0a4u3ZV8vKqr35ThH58oRrivdaT7E52WhfmPP
	JwjlwCKT/jRanajo6CohU3Hg5ZuG2Wt4HF4PeTtEGnGxD48H+Hp6vJXErOLoITv4hupAHcBViDz
	c912OnYHDDhZYHSZ7UHy6EP9ctD2VknAXvpnONJFWPAPYEHGwzEQP06cxEDALBI48bNbklu1oDc
	HIk+HtUuxwMIBFCLunj8rUKLideBUvi1oQTzrGFK6JPhzlDtdYwKRQO3hjP2NJn14ZgDAyedH/q
	GQTRcTG7BOqsQ6HFjpyontiOCf9pD3nzAvThu7HZomlZftNkfgnnp/puQ5yUEO9Mjxa9d41prF8
	YhRvGu1FMBWGJSJZVkQVaszR/72Y4BG4Tr3qh0dA8ggupuphX8zkSO4WVoMFFshQiyCjGA7kedb
	ekk91/YcXAaEccLBL4/VaTGRtujMEHjTyquvMCR45LyXHdAqLJplt/XLSL8M7paQKQ1yGhf5zDr
	w3iAogF9PCniwfR
X-Received: by 2002:a05:600d:8645:20b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-49cffab5557mr212744115e9.22.1788952533062;
        Wed, 09 Sep 2026 04:15:33 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm107391915e9.4.2026.09.09.04.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:15:32 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 2/3] Add Draeger's M48 board to the SoCFPGA family.
Date: Wed,  9 Sep 2026 14:15:10 +0300
Message-ID: <20260909111513.2259643-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909111513.2259643-1-petko.manolov@konsulko.com>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..8ed1ba733510 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,M48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

