Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669D51A746
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750490; cv=none; b=u1uWMbDvN6ohMDF6rwCm8iB6pHIAhpOpERjlyGJwvwCT2aCLYDdZMFRRLD4Xrdl3NAyNld3RfCQHnfi0oTjeKrcq9hVzorcsFxMypey6IDHvZcyFH4wa5Ea+FffXqgV7yZpBxMZuNNZYdcdwy58SN9d1aVfjnUdVj5WUIyOdt48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750490; c=relaxed/simple;
	bh=qnoog98K51vnfZCiv1es1iBsnXh8XTJszGX/9tFR+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyBIrCyQ9nofH+Ix+gjrklPHEIKNikzmm/xKgACi5gg04r7I2y6k0NHR59qx7XAgo+Hh697ZYs2dsTDHkJDYzA1DPFoLn7N8ewY4uPn5/YuCWZ3Wzg4vBJJvP+k1hfXdLcweFyUrxgAHuTIFNhrpN5OxuUuPBt3gyQG+UAWyvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7xsj4xl; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7xsj4xl"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so198023a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750485; x=1790355285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=K7xsj4xlkET1yEtwOJX3L5JhPJDBGdLT07HD5NH46dsvLlB5G/x/pjpCmYgcdYZ89i
         YxXms9kczpDNqLWE41vpaT9VXRO02JWgiWcEAoLWPOKwwaGWX28dZyf0nqj383kcAF5m
         X9t2oCvdlIOIwAhQvgGulzmIsAupauABDSfihL4jonPIQBpKxrbLb9Bxxp7MQyy9TVpi
         RGK6L8vsSq/wUfdwnmt63aY1W5A77rqpvZDtyEeBuGfHj/TUH7AaJWogH8czKyO9cCQt
         LY9as1TavpB7hYEYc6MytMeuGzN/5zCQr7dTHyH0PgXw2/bILa6uMSGFhjEqfD2OHOUZ
         RraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750485; x=1790355285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=jwO9x/hZUKjU25x7QLB6c/c1pe1PuABuoZ1tiaMPIqfIysJgInujdo1hpqg+5xI059
         sJVwcZp+JWEVNIaNm3SCWpSyblHZBP9cgzLliAOdlGdGf6gturaC3ZlKPDBjZM6bdSbg
         n/mzjlgPrX9XWIMXfdwxDy65KRVb1ROzdccNrbzahelj6A6sxilxDmb4+hvThD1P6z2d
         ve1F36jGmd9nzQhWnZZXswUTcIEU+12wDJvyNxPwM4gA+KG/Rn12k5wItY986jNy+R5t
         XXLmYGmTkw1hiz26W0mMEYAtrncgd78ahX5GiQ6e6WcgaHMlcb2A5jPNyFcrnlsYejET
         MnKg==
X-Forwarded-Encrypted: i=1; AKwUvBzZZFp1+XhZpVBJqV0HwG3jGEyOOj6DwhWciFZQX6OOnWIWbbbvOyx0PdfBkpjg19gps81OouiAz75vg8w=@vger.kernel.org
X-Gm-Message-State: AFuF++l7ldNvrVGIeHx/CCMksLWQ4fE/wVwGh96+larK0II35cQrSxYA
	iDu0FGuQE2Rg/Z6r1BDWtXN/LB2KTxdYufIa8YGjPOW3LqXFQMbs1NuG
X-Gm-Gg: AYBFou2owdFLT2bZAHJQsGaJ8xCfaUsIFvH97z8zR/2Zkl6awy8iTqlVM2pTZZQVFf0
	fKqetcUGpXcJq+x7ryVI9rmK/+huHOUSlsooLSbrkW8OjNIxPBWssySJ4lw17FlE5t37kJRgXFx
	JfYf2tomob7Zl0x8SLCXY7XEdycY4bNpjHqrBNKw5NcLHWOa0LxWxF8bnFj1a2se+ZeZ8JsEB73
	+sRYblrjM/Qb7InRoBOU4YqmLMKSt7aQEV53RQREUYAbZe4z3bVlH4gpYvQepLsrkKH3q5UjODK
	FKVtESl5bLrYkfdqTOtPhrt06kzlg4XFoFxLo+csMR58gN4un+yTxYA5qF5a0BURmFhz28zEZVV
	bKQXSKTdEVbV2uoeRy6be5/baYUJvrghuPW62pLmETqLGFiR1ytf/6xEsHQjj0QVMwnJLz1bu3E
	fwQIEuKthKBT6oylRQB3EbI8NXIB/M/yJ7vt3Q45a12hd04eA6ePfD2SJ2ernPtXX5QbNpd17X3
	Q==
X-Received: by 2002:a17:90b:534d:b0:39e:6c68:fd8d with SMTP id 98e67ed59e1d1-39e6c68ff21mr213045a91.34.1789750485331;
        Fri, 18 Sep 2026 09:54:45 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:45 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Date: Sat, 19 Sep 2026 00:54:12 +0800
Message-ID: <20260918165414.1129076-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the Teclast P85T tablet, which is based on
the Allwinner A523 SoC.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..b9c2268fe 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P85T
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.55.0

