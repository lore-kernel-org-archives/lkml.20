Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3D4E80A5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232107; cv=none; b=SKDvHsHuEUEu8mUy0PJa3APR6vHq5IY27ypu1qfGhi6ch33Tx8uj8eY6W/vDN1dVEdnG4FkkLh6DmbAwJp5Ir/8Azbk+CX1fBYggikp01y08ezzwx441CC+shl0/39AQeMtpxQV+CFUzoYbksNNYGr7MTdVAkBaZRVeinFeYIq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232107; c=relaxed/simple;
	bh=NZEhLjw5bMgmkKPM3eQxIzDQex+0YWm9iF8idBHlWBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rsyk2TYC/WNtUBn7523qX3TIR4f7gxQ9Y6uERwfSkAVZAXOXOzWQuTXB0gR77sls50IRoeXWduI9Q8T/FXBv/tdymSS28ZETciBBhOAn2Sz7TdhVQPDpTn5G8KaqhOZxJAqIJgtiEgj6lgFbRuB8ws3rwg4lZoqTY5/pj7yEips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTipE9Pk; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTipE9Pk"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb91ecaccso3446873a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232096; x=1791836896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=;
        b=VTipE9PkFBuucZ9lUSB2cuwca3vlxh8wUfbnubBX/6qYuh3jJyvHsBD/HXHfaSONCn
         spGZbuTOXebLkV5AfhMGXDq4Q1nYXY6X3UB42L1eZ6nkFlJVs2/BxMy4yff21jyimo9R
         qV9qvTqoYRvaBODo0g3zDFTBTznjZYeew72H3yIPQR25LxrpAUXtXLlSdXRybblSS35T
         uWJE0YevfMyYRRRn0+q1EBNzNMt0Zp0gkyS1Els/LKiCB9d9lCFGWX48T/b1Z4gQNtSB
         GOEBBwvY8Galdmd2oDGLbSchq5KwmI4iWtonGkeCWj8r/w4zY9LsDx0c2+dncNF1F7kY
         bSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232096; x=1791836896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=;
        b=EFw7n744zNgCkN5IVpFl7Ke/Db74Tc/O71kbCtM/WekbBH90kpj/FLR3ZXs7d+q8fp
         pcFqqG33tZ2Bp/yWBxjydO+1Yv/6mSTqLgaIhAvrrRq41cvrenaO96CmnX6SgblpM6T7
         5487h0l+isL1FG/XVPSNqw/CHsrS0JZg72ehV5JYszmIMfF6+9eQynWnRBzLmClxwl46
         nGdBn2JaPPeV/36HgkrStM9PcQ6p6gSBklOwqQrAnvQKQAsKus7rdPOzC8R92BfA1cnV
         2G1+imEfnvSt1vHF5sjbLdpSgCSwe0zV+mb45P4SuOwmLkybhnsACKIkDgBNpbVMbxNX
         oixw==
X-Forwarded-Encrypted: i=1; AKwUvBypEQW5N4cON5RbBlKD+Kxe/ogGR6iN/wukk9LmUhcWAXe0EmpXoWeG/rlF7HloAGi+PDaKZyJLR+6f/eE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0WPbicGpu8Y2G01NUtU7JI8ZqGyFtnnOSTe04lr6jUSKJ+KcN
	3/CRXJCH0xu4z9S4qV2R1PE9dRDDJ3vUBa7jZMNbQCQnVVtEyzi9gNxg
X-Gm-Gg: AYBFou3S24Wdos93ri+Dszqn1u9480jHC+fLzHs22RzEyYWVT+ufBXkzsN6TfJzh6XP
	TzsoftyP4y6CFleixltuOHn9os/8+q3U3f8g94QvDqWMAh73cKcqrcY6IEwPQ6ESLmxpVQiogFr
	ovHgZjqHlGNe2Ry0mnHyi7fmdhwvr4zPvV03Pf4LzXoD0xMgcoQBDGBOygEylIGCNIKRMREHWUr
	A9alcQqebqVlGVpfuH42WVGYdJtrN6k//0SqZ933YAUlr1xudzh1T3rRaQ4CPWe57Fa9ANALJXA
	xo9SAsNAIIO88tF0jBf3Jy4jcU7g1/B0HDBcPJVdnEs3EsGAdKy5kdOWyjrVabf54pI0m96zN6q
	8j+b2wc6sHE/opjN8ZtwciyrjiKIDwsCy+Q2li1h+F8QhoDdPPW9zXtWpZ/aKgynKl7NcC9mxiD
	zejRJLwXA21TJ8Wz5Q6ak73raIj6tu4SdFsJB5iDCFv7QFIcLaH4zUMSUtgInrURC3+1ysuA+Ay
	uM3qQqLrTdetKCmKEni1pgolKyou1Fa
X-Received: by 2002:a05:6402:360e:b0:6ac:72dc:c3af with SMTP id 4fb4d7f45d1cf-6af9e373012mr9651907a12.38.1791232096315;
        Mon, 05 Oct 2026 13:28:16 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:14 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:25 +0100
Message-ID: <20261005202731.153971-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..ebe35f893f8c 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
@@ -162,6 +164,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.52.0

