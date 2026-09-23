Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043657C72D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194996; cv=none; b=LZy55V1EaCTKptbk+MJG4FB0pJ6U/Tq2bfsI3Z19g07xTHLdHqP7Cdk/a94zPOR0GmGoOR/M5rYCJNWYL7tvbd74siEmz8cHWPG11sTIzd7qBFh38zCkhyC2qJqRHL0USfDZT1owVoGIzrJAYYnTralZT3TGKbXyUeH822fZD1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194996; c=relaxed/simple;
	bh=9msDYNKS2pX3bRTMRkqLXL2c0qeGUzPeGcRivpd7UC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0b3Vf760ZDUSmMPwucDjyaqS7YH4qItyL2XNiffl+5q8l/a1UTd4N7yc4xs1o8cRxkvKqpBwodujuVe4NoEvdOcBj+PWr3xzr4+xvMgUMLEf6OZJbp18VDRE2y/H9id95b+VMRnMn6JpLl390Dte04oqhmfHpcG9biIbSmBDyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1tP7Fn5; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1tP7Fn5"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so2347663a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194988; x=1790799788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6NdCou4tWyO9h5BHGqM0MWB7dKTxAp68NTU6wlSIys=;
        b=g1tP7Fn5T1naBF+UH/jpfkBlYbWdxxg3xDTzyuF8coAGMYevR1Pl8iac4Xq6eHtXra
         +33Uvokv9jeXW4E+pxaSlGqDVYZNDEDsVgxesW0qrzj69DUiLP/I1NLXrFbWWCfXwE+6
         /foVqdlogYYHUFBzH0a5mjgLBnWve4zusT3Fygs9FOqAdvohgJ1fDKnS041zIHsuJp++
         DhvdJV/vvXmeLCFK7xmiFiIxe1S84aYH60HV+j9DGnYzeccV/ewGd6pKCUazbKp4o+cF
         HuwqC4yrNJ1bmtzmGGldWBjjFH5nzO7nJF1Pe4IijhGpDXqGQmIReksteREeUCPnmucK
         /1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194988; x=1790799788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K6NdCou4tWyO9h5BHGqM0MWB7dKTxAp68NTU6wlSIys=;
        b=kdpFkKx/Wc6iHuybBY1OebfFhBuKAzpjNGy2jX76iCspASNG8KZUYv0xpYRgdPi78f
         D0tiphofT1hJrxiPRB7DUMbMFmvi5jIWEjXLBYX6lLxsLindbpzawE/C64VhDTvyiYKa
         84entjAZ8DzVtMWc8jczFrvqCR+ttDppYi3tU6hNhyOvvSieA05Dra20cOs0dnqxL1jm
         4yOKr82tBIutUTJ/BdPd0VeX9Ds483RaoOrVKGYr0MONCxmZi1GKUnIaCOQcI3bfsriT
         EI/5LhsGUBMNbutq8B85+60t8o+QR1k+2jJ9VOhLh3RgeoZKzYmZYKO8RreKmHiY9NDZ
         ygVA==
X-Forwarded-Encrypted: i=1; AKwUvByJNK8FgziFCOXLkzhRXdHjD0BFheHg3hjwEdSmOubfwqJzrycl2PkO3ptswYbnMcbKNwUFmn8ECHpGXmg=@vger.kernel.org
X-Gm-Message-State: AFuF++myqM8tZ4wKvtrNEcUqboPunILrkrm9GCpBBqOxVn+cQOODl1rd
	IUSr00a93nSsu6yBX/YcG1Bc5mC/BCMc2mxgvRFHggEQMMHQ1HFR6HUz
X-Gm-Gg: AYBFou0jfSazu0HzoRxjWCnoatIHHDU8/d1bXL0+9ZBr2fLqcazkRzYM+Vw971/p55Y
	LKr6VEZMI4896hqpFmdsTgkBadtK0HKRjbjXv0V611Q4HQdkRIWPzNRu9BEZyE05fX8e4NhK/R1
	K+CrN2yMY2GGeB70SwprlEEBaI32Qf6b75WflzNIb8Z6siAGEMDQCRuNbnODOg3b8Sn22qAOt7g
	FsIHG7LTYrH1Fz95C4nYIPpuoVAJbPDN8uZLKR12E6QVbnUvNgEoy64by7ccBFnNBb8HL8a95Rk
	aa+CIQz5CS1xRvdlLG17pmCVUSl6gO9e6vIsea+Xtn4PPmhxHI3aKhoEx6JeGoGNXtzCUVIlEK3
	OJqetsZkt78D1ChiUWWZG/viTYkDHyK0hm8j4Q7f22Cm9VzIhbfHLJNEyW+/jsYtgCVtPmvMu6g
	q/8WSsdOpox8qE8VohqpcZXtZ2+lpFS6jFHBUYeavp1ACiU+1I3H5xdw8FsLmHT0YN2vFHxUFaV
	wtt7tCh1vF4tkj8gvEyzZHWhKjoMy42VhGZ1u/ZK6O1/ve+WuIwsQ==
X-Received: by 2002:a17:907:6c17:b0:c29:f5d8:9c71 with SMTP id a640c23a62f3a-c2ac223e35emr24501766b.32.1790194987758;
        Wed, 23 Sep 2026 13:23:07 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:06 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/11] dt-bindings: i2c: mv64xxx: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:57 +0100
Message-ID: <20260923201701.43391-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 controller follows the existing Allwinner variant.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..d3b6f7668621 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,suniv-f1c100s-i2c
               - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-b288-i2c
               - allwinner,sun8i-a83t-i2c
               - allwinner,sun8i-v536-i2c
               - allwinner,sun50i-a64-i2c
-- 
2.53.0

