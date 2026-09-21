Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E97F45D5F5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981667; cv=none; b=ciQvjzoXPGduzlBK/swzBbP9KIoBV4I6ibox9y4nQPH0e/ePAFlkYLz/9C92ewPlxHtKOlS6LSLae8xpw3s5XbMfh8bFzmVU45GDkZLB09C7C5Igi34NvVJgFiqMMfYsmASaJZcHzIE0L0xxj2LwIvRzm8H+32qTcbrxrECNI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981667; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk0NkgWVEfILyMrKSukOmEAT7icRqpF2vPH+vnxKn1IzVVpmTcX2Q05YR9lDmyQoBTwTM14+ZF4Fm9GhTv8HsuIjVWyMPTIxYUuq/OVEFAK+VmYX5PGwVJmR4MP2u0q9GfXb4yLuVKguqjVbBPeZC1ZZq3weS1fVecRliRvMd/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=iDAZQHL2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="iDAZQHL2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso23202075e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981663; x=1790586463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=iDAZQHL2WjJzLVlUTMLi6wbmHzCS23LUNmUj6njwOjNclDAzTtQRugecRJFqOfKTxs
         pr0jVQPIJOK7BjK+dWtL+RjCyjECTH41a3JWGTfoWiqncAwWNq7GFsoAjbpV0oE3/TrF
         bcatfI8+SeHlgowowc8VfkOQ0HC17+S3DdsI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981663; x=1790586463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=UwpiGGcBk0wyKoyLk890TGXP/BPqBHeFT5MCtGoZr4/1zeoGU8m2K7YO4RYUvnwA9J
         QcXedvCPyDEtVSqQ9fOnFo31QxUC+0Z8TIuxcR8tnUPrW7rbkISISsw7Cho/7OMtkejD
         stvl7IElB1FrbhtrK7GUoyxS9/XZVH1fzh97S3yWSYEutPVbU3ZlwOg9ZB9KM4J6Jxmn
         LG/ti/Jgrv5gseAKfzorzwn3ej6J70IWt0zq91GdkXBU40bWuG8Ketp57gpq8s6K+4WK
         FMA8Hp5WVn9QerVMB0Oj2jMGa4n62MxERpmE7OD+6Tx4LH7nZgK3z/IIQO4A7T0feBfd
         NpVw==
X-Gm-Message-State: AFuF++krUvGLsihuTT3CXL2THVH/3rp3JvoU4cwDiciRswn+BW6CVl0V
	infCujnsPZxknvNMUUS/AFzJJI86y/ZP7bzUZXffmf3fRmP1/tNWTBx7QAC9HFrtuhi4/7w+FzR
	XHpCBvUE=
X-Gm-Gg: AYBFou18p3n6paRYhEH6GD8YkJ2rhxPeS665OnUiz2XPYhXYsM4aUzq6Pa15cZg8heV
	HGDXQETf5ShQ4opX8WN6XwU1xKzekib+sl5Dvtj+y3yGAijMnsmg7r5bpELywV4I+IgMjBuF2ID
	R/k4y8OTRCOLuw+TTlagEuN5lpsbKGZAqs/g8jLLyCYwN3neyqGbgUZ2ieBUh9OlX5esiFBdjeI
	8Hmlo4qkfv0+b0aw325QCDnynPXdNOKi2pjogldrR4oaOgOQcMRatNx4m6ylxY+I6PvDIVi26oV
	jDgEwfCVzWTkLCarYfn5OY6On/iRukLBuztJP/0oVQcybz70DldsW2GI/BUyVBWSMfya5Ju5+q8
	90agmJP6jRGD4vawSzn/IAgMRvxx2qV3TAIaHZj7KY0TommlUfsA3+0prDPJbwRep5+zXHylY7H
	1rRiy3gH05XR3qk4YebaXzfA7g/OICV97QWxw4LhnYrP2Se0Lh7J2TJ63lKkvW7GDvO26fABRxs
	XeO/bdfqwJpE/mmWnbxAupIbBGG
X-Received: by 2002:a05:600c:3547:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49fc574121dmr116761795e9.18.1789981663620;
        Mon, 21 Sep 2026 02:07:43 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm587218725e9.4.2026.09.21.02.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:43 -0700 (PDT)
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
Subject: [PATCH v7 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Mon, 21 Sep 2026 12:07:31 +0300
Message-ID: <20260921090735.3174292-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921090735.3174292-1-petko.manolov@konsulko.com>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
Link: https://www.draeger.com/de_de/Home

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..276d62b848d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: DPTechnics
   "^dptel,.*":
     description: Guangdong Dapu Telecom Co., Ltd.
+  "^draeger,.*":
+    description: Draegerwerk AG & Co. KGaA
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.47.3

