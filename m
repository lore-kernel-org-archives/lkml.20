Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056E48EC63
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154066; cv=none; b=qqIKUIG/uUwY2cH81I+Pe7c/hk79ceXIH1v6Qba7gJPR/5fnfRf5yQ5uz4bQ16N2G4AV6Auk5U3FHUgHE4e+uGPPLM9gHBnctTN5gAJtEKdOh2Tcef/3LsyewVi77LPrxv8vc56BLE8d2hw7z7tTwORdgzwCiznVxHdlTj2rM9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154066; c=relaxed/simple;
	bh=NExAlvPnpeNrybroIvK1yu+2PtogQY+t8w4M/9D2m/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YHnFZgKnjXFhUn516e7Wow+W41Pc0iPSDxylBeB6z6esDNUkahTsAheyYvRz53JLV06xjDjuuGwGl84Q8kjbSG7Cy1ehNfqSvmHyrKF3Jhvk+MRPX/hWEWFV+t6E12vgbyswo36P/U3gBV7rk1zo4u0Pv8kg5zcRtQZDOZxsnJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=p9rdrfR5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="p9rdrfR5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so31115055e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154063; x=1792758863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=p9rdrfR5T0XBdJtTvvXx6pKGF2f82MSw4Emzohi9/MXbLk6yWXAU9Lifq1DGbpRWgT
         XC0dPpsccMAEpC0nuJyU/lBu4nRcaJPgcYfkj4lWZJT0HPTC12+jsz0yYjFk6o4Sdl8G
         qX2jcl1ubHAunzQLBPcZylV/IWniM5jaI6Eq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154063; x=1792758863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=OK9dP6gZTwX0rLgAH8zEHcN3RCzKq+PCssawgy/bsysPewpvAhJeruwAr0BSmrhi8h
         Y68ef1dKGFWYffhXXz5TYCkJSf6kE/sQEzoN4UUQoj5EgUNDo47WNd44SBIcGjK/eBB/
         OwCoxkJzwKf43+ZVPIjQgtutEAN+wEshxSt1js2nwqoashVIVJwFdvnibCJZC+kU2sSe
         6pUFrW8yB4CNjaPcrxtAeQbkZLBT3xX+zawA/HbGMhJBljzEsM92Jw+iZZvfwj8u0JFp
         /IlkUfLL5uFsACobZ9wVJiYz4wJluHihrQ8gWAVN+NV+A/nVQen63QF34HiwiFxTVkiF
         YdoA==
X-Gm-Message-State: AFq9FYLlT1+1GqALhDDhBLL77as8wZDgrbDrFTBSq2h/FYQQTrF3vAJf
	o0uH4KwD4Qc+rxFmL+KJcBcXFBa0FHmHCK4qrXFGHgU0IgK9LPW1/d2a0kVxRQR8RJASd2zdaHp
	g1TdG
X-Gm-Gg: AYBFou2B5TsM4mWZX65r+4kK9Cy/XyFSoGb3zVcZCuIHqQajY6iS62pNPbhg1Zpu4he
	HliXqoalK+RLExWzUww/6NYluoTTvhwJcRqjpvUcu55TH3UQ+BrBr6+DHiEgavdWtalQM5dR++o
	sxfZm+uKolZJLBmTXN8hq+Zom6cIfNV1jeJm0RIJ83HqgEzRjXSYJfv4Y9ZO8YfK4s6iP7mfjF+
	ppGgSMJiGcwFrdjHqmeHZ4OcFV4iFQIDfxoYPNPsvZDrPPGc+5OzGKaGZHq7OxhfPWPmIOafGy3
	d6mUub2cRILE50NlRstkg5sGNQv4W3y86dlhou5hD4SR8ZL9g7MQ9Msz9hsITJI1cRP1cOIrRk3
	P1O+Y5lc/y4mjgSie1yUT6X48+VbR00Mf8oENOcvD95NEQkMNMRjyH6olTd3GhGJkV6dhpbTaTn
	Uwprk6rnaEk8OWb4Pua8ZK6vJtLgKh01Ihf1Mvo/496DY6hF44RBCfq6w8HUJITr73nHyjtAp3u
	wE6jU7qIb2mLV0=
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr449398505e9.6.1792154063333;
        Fri, 16 Oct 2026 05:34:23 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm110564045e9.1.2026.10.16.05.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:34:22 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v12 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Fri, 16 Oct 2026 15:34:13 +0300
Message-ID: <20261016123415.3272046-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016123415.3272046-1-petko.manolov@konsulko.com>
References: <20261016123415.3272046-1-petko.manolov@konsulko.com>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..b67dc10b0a11 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,socfpga-m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

