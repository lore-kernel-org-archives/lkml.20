Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A98352D2C1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689270; cv=none; b=c0ohZ3SoBBU3gzugWYVjIs4h4FFlPb5aLSBNKLvaKfy/aVUzVDqLANSlIySd/KCfcKgD11uQyyIOuv1CzoNk80sOy6JCZ4IqCjd6vU5k0PQ/5Xl8llsBrYR5aeQSDG27g6IwAlQAp28qLQCaveaZWJWmfFqQHoRozdvU/+C9YJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689270; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWkCEYkqf8T67R5Be8bozqqA8Gzk0E5OH/613CfY5Z49/kd9ESmi4yhreexdramxp6is7LxiSfup9AiI7IlQ367JCxEJ9fqrmRo4ovNF2GBPPg6f0gktKL85cZ+p87C1x5CNDhhyuzYe2/C5ozyLJCQCb5L9uPOe0XSGSimi2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=hifxynlZ; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="hifxynlZ"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so1527074f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689266; x=1791294066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=hifxynlZO6OoMK/VwF6qjrtfHIO1jJgV6SzCAie3barSfYbXJbVt3nZ00SnaiXbJiC
         T07ENyvtg7tF2+JzqDDD96/LYgIPYnsZpUg68D7OsWwFD7/9pi7RCiL65V46AtLyK42k
         GpvDiczVn8yVinuCNU/b0lhD8WqGDJYom3eZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689266; x=1791294066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=19mH8Ld9xFscq0QO07MSczh8fwLv/gGZzwmSwVNkRDpSYlAjGpA1CJVEGxKimJ0RhG
         iPJ9EZrU/B39Y9W0Y8QwF0gTGah0ivaFodjPoLu65FCd5WTEAjPHyTaRNhM4F4qMhyn1
         z0QMs2mSjIFaFBkvmQyYJAau4B8Lx9Mlk9qSmEusPMefpVMQF388R3Bsxpr19HI4TeqS
         cxICXXcdTsf2sf3X6EaXRxp07dgutKY7Yd9m8mn6tn4x6hGOcFkXE395nS/65NQL9X+w
         7ixoniyEyalHLF4F7N4BpMJyOWuO+2bBCfGG4nOnUZsLoJOwDsrslgwvxd/RiKAbQM/I
         +JMw==
X-Gm-Message-State: AFuF++kmz0yFAhdblEPWOUey6+XiZLRWZJ80D020RjOgEYRF+ZH69ZRQ
	PFvzRWnV87U/9S6MtMwdxDO6DrFrpmPGxuR6FADWfGPhxCHPf5nP4ERp3xagksIVQEIoT0kJfrm
	7jCvZ
X-Gm-Gg: AYBFou1MKTaH9cHEcZhv1iomyBG9bDJqLIw+BN6KvMgy2vxt2LVQ60/iLG4JvOTgNH9
	ymNiQMh2Rd+Pczw45r04c3isun9y3VRS3NvY0bit5sDzPNlrOYWDRX1h+fqv8QRBofsc6xB3Hs0
	4BN5P6htjWqaktAA2kMQD8jIt3HiqW2hehejoh288Mn+L36YhFJB9Y5hZUnG9CxKdGdKEqoa3Qe
	7gm/tbNxsn3DhQWR+H2pmvwGEQnhXy8fXxKAXofJHFzEg5DjNJvqgmr5efzVhAAQxXH2zrxKWlE
	j/aTR9t48/H2B/XcouqDlQZF3WAn6sP4FkIz5P5DRHnvRtuTpgL6D9323Syf33mVw53Cn8Cfw1J
	IB1m6qhjGoUV5zqeAuIfTovDEPJTym9hQjlbw++A+TTsU6kgLhs9yn6iAOMngWQY6eyK94VmuId
	B4KXLgY3/90YqAGbIToK1N0GVi8+8VAehh91otmRPZBy46SZNDHHxjE+iAij0lcfMHCD0SQPbhG
	rdWDoh13qaGI7s=
X-Received: by 2002:a05:600c:1f92:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a00d75ac32mr46144095e9.3.1790689266111;
        Tue, 29 Sep 2026 06:41:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d1011d9sm91835165e9.15.2026.09.29.06.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:41:05 -0700 (PDT)
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
Subject: [PATCH v8 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Tue, 29 Sep 2026 16:40:55 +0300
Message-ID: <20260929134058.819371-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929134058.819371-1-petko.manolov@konsulko.com>
References: <20260929134058.819371-1-petko.manolov@konsulko.com>
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

