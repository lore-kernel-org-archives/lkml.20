Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BAC3AD507
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668281; cv=none; b=KQdhje0P0Wz9KDVbgiBdIwrYRZBYuVATduL6QR84bp9rHqa8tJ/WYG1n8iu28st+qO9S8EGxI2Jwmaj1S4BQM43ForFqfNJLKWrLBTIyTq3lT3wLNznQdKhHPkLu/NltzacZkz3Je2NDSN1Q/CVf4MgXshmvVaF/4oj6GH4rWGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668281; c=relaxed/simple;
	bh=b4UiQ7BM/gF6s5KH2UvT55txpHaofyKA17WFYBDCVyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JgKeToo3fB6IojNQD5lSO9jvLxq8c+BK/7T9Wslx4bGNIe8uh1f81z5dAsSt01/mXxbo1CHDp4ncmDb4RVu0jesxT/iJfejYnKEN38ctM8eFcAcELKNBMh6b5uLzmr8He4okEAXlIbTC1/jjNX/wDeoe1IHdTGwK0puxNAVcfmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAdKjvL2; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAdKjvL2"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so943922a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668280; x=1791273080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NugkDqfPlG6XLb9mhraRjCVSd7VH0v9iuNruR6SSHo=;
        b=JAdKjvL2VgjEyclrwoV+svNAZn1QA6r0PY+7SOemuh1BilPf5RLNYQ2Hbco4ngak8f
         wr+Xyqt7PVVO9bkrR582gFpjMqbXnM4s7+QLhsx2iUNPbHmFoP93XPmkW9drJj2YGiki
         8vqq0qWcxwWkJS4TNuFw6KmZT+nthNoETU7qdJWYv9lBd8tBfiiDLgCYCauMB43b3k5p
         FcvExYdapoEZJjOCdTLtj8TFGGo7K1KUi8o0I6/psY8HFYH3bTxzE/D4JJqXhaaorNMG
         bHI7lria78DyF13P7wsbYcxy4hCRs3ZPPKbPybTEbHMD3//OaZ9GlOStRV3pogN0YcF6
         FeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668280; x=1791273080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2NugkDqfPlG6XLb9mhraRjCVSd7VH0v9iuNruR6SSHo=;
        b=h1gCPx6w94TnI5Yp3EUqggj98/L5uWT9mADldCAa61wxgEgJ+2bJCvhb3Fy30x9+jw
         4HV98LrABtGcAa0u0mFSB6BQLZdd8EcLCvmVc/dA0wsAoIUklJ706/+9Cxvo0RxJja6x
         CtRde/gg0bsrm2wcY1tDAtN2SKTj+pWYNH5BSOSCieG78QXzMJneaE0AjpQ9AnrFK37X
         afeLSe0+2o/zWmpy3xbp4zx9hqW+nDIzZtW0zoPZqw24lG5ytQM6Tgz4aNp5ICURAdYw
         vYaAICEYx5nem7yWsmq5EJWfQSPJP5IAlFY3VbzM+TXcX8RT3JLK0bcjX6M3aBOToTLz
         E5cw==
X-Forwarded-Encrypted: i=1; AKwUvBw6/QVfxKHLiR6HtIpT553hO5888chW5pgRQm6q+g/z6o4u5jPMFNIA4K11L28HOJch4wjz4JrAEDYaQ+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6ZrUglL+CUrN0pmM7BPYg/SxnTiENre8vEGnZjOh134rA5+87
	/tFo7COmg+TN/rogXLTtJIMHSXzuuLZYFKP0EQl2ZTYHWrMav2ViyaVs
X-Gm-Gg: AYBFou3owExPMH2O7nEIYORxUBk06+v3IKLm08TnBSJ5fNUh/OpOSmmpLGVE8D7hepK
	AxTKUpLWygi7xVG+EiGf4kxWLNU/s879EXbmds7uSuVrglbjijN4lerxtCN7Yp7cqscgKVRFVvk
	Z0HRyPLle7NFUayNi9DWBYn0Bfb/VU81mUJ0sEt+uMqgku8YGbNxeqWUGJE+7DhLHcJSCO7VZOF
	PLGtNZ1EVOfY06Y/t3PtaVT7vbmhWBaDbht3uZ+ah++7BDQezicOkL+a6ooge6nuhQdm5VvB25h
	baM4bbitUuqF/CIXjuvP5H35XN/gKIbzlXmDTqlbkQBEgdgr62EBfU2WwYK8Nr6lK/xN7DgQR36
	X07wQ7u2j6m0fpyMqmygIGSqmeLCbRSn9iYq7X9PLBbGaeXACytMmAVFAx90DpT7VNrE4gWV4Fr
	p1G6BdVd08BBm61SR5s0Xrb65u24OTLz3aR0ltklglNqlogJe+7hPcFZyrAGdS7yi/tdeB+unbc
	/g1sczVAgBDqcaAmmGc6B28DBjxhBWbxXmFSrOwy8PuVo0dYV8MJXRHq30r8UoVOqzwcjuXCuq/
	Bg==
X-Received: by 2002:a17:90b:4fd2:b0:3a2:b0a1:456b with SMTP id 98e67ed59e1d1-3a2b0a1459bmr3740009a91.47.1790668279738;
        Tue, 29 Sep 2026 00:51:19 -0700 (PDT)
Received: from suewang-PC.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ebc998sm4049236a91.2.2026.09.29.00.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:51:19 -0700 (PDT)
From: Sue Wang <suwangquanta@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz
Cc: Steward.Shih@quantatw.com,
	Martin.Peng@quantatw.com,
	Fred.Zhang@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v14 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Tue, 29 Sep 2026 15:51:05 +0800
Message-Id: <20260929075106.74731-2-suwangquanta@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929075106.74731-1-suwangquanta@gmail.com>
References: <20260929075106.74731-1-suwangquanta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Meta Ventura.

Signed-off-by: Sue Wang <suwangquanta@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..ce74b89445ce 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -98,6 +98,7 @@ properties:
               - facebook,rainiera6-bmc
               - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc
-- 
2.34.1

