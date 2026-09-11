Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27BD345CBE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139289; cv=none; b=YDpPSofGXw+3/JV33YLZ2CeeyQGTJObDkCp2+pKH1Vx9+OiwcfW2nlp+nnn1D+sUY0b6kwbK29y11VEVS0e7d2Q6XaufQXCQcU0H9GsRlw8tSgMIYuldcfDYwjvx0LxzTUxvMSiJno00PKieUFkugKcxzIkh7dkEXRGGqvxI2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139289; c=relaxed/simple;
	bh=6Lz1w8I4jTEAaYTzPTwMJF/7TY7BvjA3HgkopZ1NJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iI+v03Za6gN4WJWbNwIUp95KlxLtZ/8ntDKGuGOArKwO8wDAdzgYGVen8pOa86SAct5CQgn+pCHTxAx/oyGNUcjuV3onaJ8hlvP6hvhnSZo8RxJoO0aabXS8V3JdLJCWweKstXybIVb6kaKmW+I4wbPNW7Sxy2QA4aAfHFvEx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=RyV5Cpao; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="RyV5Cpao"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e651e83dfso5864155e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789139285; x=1789744085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9it+H2KzAMUWqwq/e89Zc+T4Ptx2OqaJ7EErcD6+fQ=;
        b=RyV5Cpaoiw/IvztEBWQTxDjF14vseaYJ59YJug4FNgxQHqptFDLdyBlpq/iHtCRmeK
         ujf6Blo07QR35PoPGr3AWnnSsPkDcZizwfL3N+WL07AsC/768n1RDiJNlq0CJssE5DwY
         YHPoeHcAjD2oCsVZ3E4RGNVJ8727xpYDyIrV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139285; x=1789744085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9it+H2KzAMUWqwq/e89Zc+T4Ptx2OqaJ7EErcD6+fQ=;
        b=BKgrcxK08lDj8dfwPQgOTM4btwfTjpxTvd9PK717Vg3tJqYqKCStmwh7cyhxeiyaQ5
         KnA9mzyl3PHe5pr4t/pr1LHNw5cotX9CU3CgF6KtKpt8NuTEJkdQmIIOES2MinRpRxJO
         Qq0JRoCyCzyhhD4hqLlaG0Sjrf3EwApCDEnP35nMqi/oJs3kZBMQP4UeZ7BQZu6UbqDc
         +2S8Uz7VlyEh6EoBsGjzgFR4DcDGOyewz+qy8mvH0gVQ9hcC3WD5Vs5wYENTt8Je9F+V
         Vj6Ad8fTrt1tAmUjdeQlXJjWpCFmKvuC5xV9ggqJcn0IFCvby7yVdx88ocUd9+Fi0sP/
         DmuA==
X-Gm-Message-State: AFuF++lmM/Ba7ZCjMZKsuL4sqwMQh93nWOvEdQdiZFBIHOoeivBBflbs
	dHM1H7AXuQ2T/U/tjmuz0sct82MBCKFCSguYb5ddUPl9hnE429Zf79POxft7GknNKlOIRKe8eir
	pxMJz
X-Gm-Gg: AYBFou1xHzyEmJK02AEOGCfr/L3Wp+LEsJSmEJBxj6nJXbtpOa9AzEc3gONiBVLWreq
	RypXwzZCvAe6pygIKjjcoo05Q4+2xwT1BUvPYTCQgwYINW9ZLcznZxppUTnTuop9H+0+1FqIk9M
	Q8ytdeAsdJdCWrvLb2rLGkfw25mtaD7CT5Vzi2PdK1eW8iSS+FaIuUIaV4R9MSNb6PJU7eDMBwo
	EJ1ajZA655yffTfuUS40le1tOFg6AKEfZLgP28NdnhBuQx7Ja+oVob4t2WWuzWkb+hcGpV5W6Eg
	7JScv80PWkyKZFEaRTKvltN52YSIbVwu1bdjAfetRgK2LFHJRjKsv1icaFn/X8JY1049hrHASKd
	3BYTlGxQuAA6hcmVoOT5UVk9noVqJXYlMjn4p3bBNzoOLtUVo2VWSiPcMTLthMnt4vvrY5oLlux
	doyqCCENxs8XYqvjBQ5XdSEeGIWC1o2fmYf1TZWp5tVQLC005Ip/W+203HVsqoB0qqXRjZZfJWJ
	vOpnx0ceIwA3h6C
X-Received: by 2002:a05:600c:83ce:b0:49c:fc6c:bdfc with SMTP id 5b1f17b1804b1-49e619e0e02mr53442745e9.19.1789139285211;
        Fri, 11 Sep 2026 08:08:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm108933095e9.4.2026.09.11.08.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:08:04 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Fri, 11 Sep 2026 18:07:52 +0300
Message-ID: <20260911150755.2803736-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911150755.2803736-1-petko.manolov@konsulko.com>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA

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

