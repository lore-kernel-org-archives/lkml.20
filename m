Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20330566F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479496; cv=none; b=mHktoT/+ppua4MRZcVMdcvL2QQ+pbIRaZh8mBZP9Jum3u/VYST+L7USQJhgdUKBNIbPmpC8fSEbVdUCHsuQ/EG6pAHmwlQltE843+PcjgzJHss5ZB8VX4c/kx2eN8uYE5WhLLwrZ8cAOKyBOZwsez/IfuYNw3P+PCkPu1uUYEPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479496; c=relaxed/simple;
	bh=6Lz1w8I4jTEAaYTzPTwMJF/7TY7BvjA3HgkopZ1NJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwLCnIZGPjSupo3w9MHeN/bXAH/8pwzZhIkNtN7fJ2cO+Q07ov8/sc6YSrWsoMXpwidqpXJ0FVjKb3kfRN06BBSUNXtAGxSOVFm/zHAsPTnOAjylQ/tzjmeLVWDu+tlRq0ARsdmrJiT9vQ9ox6zYeLoEok4nptSy/UJQce+ZCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=XD62+2Ry; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="XD62+2Ry"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso26378665e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789479493; x=1790084293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9it+H2KzAMUWqwq/e89Zc+T4Ptx2OqaJ7EErcD6+fQ=;
        b=XD62+2Ry3nLK+Y5it9CMpczWppBrUDeYnz1rWJFVJ/6k15aKXGAUcB/yVGOdbjBtRN
         LKrJF3p0OF3S28JVG2+GlhDXpZlT/eIZ7aD5yiNk52cqPxE7SFEzr+3M2HawihvICdFQ
         8+xrrtT59GVkqs35rfM9OdBbPtomWgUALjF1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479493; x=1790084293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9it+H2KzAMUWqwq/e89Zc+T4Ptx2OqaJ7EErcD6+fQ=;
        b=hiw+W8v9ghJkzoOGUFBgiHWLOAyHovgV6XwuTt4FZz5CDkrbD+7KZ0bZ8So+MX0LDc
         fv43yZ9K9W6YWZCAEfpjnyX5xTPvrG3Jf3l9K1MIynzUkiCXeRxZGFJDK/ugsB35Bdvy
         NWFwlluQgPIWmj/dAr/sj6KvjnP5RMUnoT1UnoKrAdv1tp+jp6P7kp9G2Y+aIHRnYHhE
         XpyPsFRWxyvHJLvdW7cAe8CLMe/eYQovHPfV+gcpj3k/lfiawl6+UtTQ1eyKLjr06lzS
         Cq5DLEq4i+D9cvAgpjhFQezpkqYW9h8BH+xNAzYiJ6HGbvaZHFuD4BSSxemaujCrGBbe
         PQjg==
X-Gm-Message-State: AFuF++npIwCbecs/zkzQhPUj58ESJ4MQzp7sGsE5MHDb3raxd0kHZd3x
	NK4FrkzvwMamcgocxkt2qgAV/VgI0PGTcEcCAWEZlumdq/K+DZVTa3ST53nOr8oVUhFU3UuLqCJ
	WjL0n
X-Gm-Gg: AYBFou0LBBlzOp9tqvJv+ZOH/BXPgl17NJEqSEae0OcTBF94RY4YxCNwVSciDpok/ZK
	K5WbUzGPLCMcajB9Mqlre6T8CEl6xnAPPJX4wa/kKnlshjH/cGZHYQxEj6ZdPe9sw2JlrDkQGMd
	FEIbEyg7lNMxemz9Jkrv/3EG4hujmarIFQrdKZOOzhodQ7/hhLGf9LmTIHfOQa4/p8fUY/nZqYj
	Gel34Cp0J709l9RvF43ZHIBp+FvQy+iymTHW4Qu6PRsB5mXn9wO5cuTB3dVvgWzM1Y7NAvcvDZ/
	07JMdJlCCvNIBaDCa6WMv95208HI1H8OX5ChGaq+yFf+x9qfmEc2atjiWwIOVS+6BQgPEoNRSRv
	s548HUl4fKUx4YbUG5wcH7rAo2HxaUuYIw18yLi13bDZSULaGcOkSKSBFA/tBUy/RSQviSo2NaW
	XOYUFzb0qKcCK2X+JrZkavJSPa4qbwJII8wVi8K4LflvbjMQ3Ac7prrTmWUkEJCOpRp6O0A7vdI
	oQRPst9u76WCSCD
X-Received: by 2002:a05:600c:3d92:b0:49e:6777:da79 with SMTP id 5b1f17b1804b1-49e7a678649mr96419565e9.26.1789479492758;
        Tue, 15 Sep 2026 06:38:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm88186235e9.15.2026.09.15.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:38:12 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Tue, 15 Sep 2026 16:38:02 +0300
Message-ID: <20260915133805.3249587-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915133805.3249587-1-petko.manolov@konsulko.com>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
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

