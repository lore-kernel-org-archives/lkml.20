Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FF64EBAD0
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232126; cv=none; b=YNT6ZKYj9fHPESgJ3UvueAr0bN2iHFH17NtwsSFRYQ1mDXmc0itGxEKnk737S1MBJ0R7xm1qIPaTV4TA9ROeSSqKn22hEEJ6VVqb/z1rX8VzaDJA9wKVSOJn/FThateFSh7B3DpGPJriux0pyLUQSlWoToO6wsnyjXN7rZkUIcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232126; c=relaxed/simple;
	bh=nSeIB9SqI3YR3qh8EwI2spWM6L+JrfQJZacP9d3kjTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaamoIqxCR4i5w/tgjp/18rH4sATtNtcCNSgHZnLdDpJnJ+KNZ81QECJ5B8dub97CnFyYCFqFxu+K+QFMgRlempIb+YqryBKw45s9JAH361BJfzez9NiueckorD/uPjPIxjr7sVeJno1IoMOMd5jZAOgZqwf7s1BcNE507fXyk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIR5RB0P; arc=none smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIR5RB0P"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so2878081a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232112; x=1791836912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=JIR5RB0PjGMgi/842jsQpFDKR+Vp3DfMVFP0fuLpQq2A0XmXJcVfcbPRmHkV/OFqeF
         NiLrpkDVM254OM0KZKaXGIhzvHIvS7t0owbH5xlvMyRitPXjCJBDPrint0k2drtz3bRl
         9Ns9XIukVlLB3Gln5BaQ+slHtQsOBT0bh6o7b5/c4t8XXRyHg2pCWCUcaFDe3Ud6C/UW
         e46Xp27whuEYxMFpMfMymxDVDf7Gc4aPiJRwcUfADKmO8tQlCW1lA4b+T7QHqqgkncU3
         HxGlhY2bmKluL1aetP7JSXf9tAldCsdw/IWlxQmVqc0QeDkq6sVXYm3PE1rneAqOPgKW
         PbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232112; x=1791836912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=KZK4fAs2zHYTTmiAPs1To6H49ZUDVJfWLLj86iCFfsoBk1v60c51xqUH7/k7r9otZy
         Bo7GqHpiqVbn8nssRsHO6YQQb13JzRMtw3K1Cs6XVbkj9W20uLLo3iXaxloa5nNfKOJp
         Mq8ut+hD6dVZwy4GQt4Qsu4Yga0PaSG8Yka6V2zudNjh4qLmEY0Y7CLkvulr5uroHvvK
         ezxiTkyrPlZzDl0oRihxU1NW/rjtwRZZq3BQ12tzsL1Z/OZ/ojLR9kT5IYHtpLr+QDoc
         ua4Gu5pMSMxoSUUnkR8dLPDgt7BoUV3bBK+B1r4IgWW84Vby1VfxIwcQbqBtc290d1mj
         A5zg==
X-Forwarded-Encrypted: i=1; AKwUvBwBIpFJYngyl2Saj0cNbZ61/Ij7RhPVlFWNKCK2DHLYqb3ipqHjqKkzmSTLPgyenWuNjGT+n43RkaFb21s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpCFIrEsPQSuheFckOL2QiHnl6+xujh+YSZKsLJihBIzakWyUw
	xxfcq66RzOX0MuxsU4BOPhH0V9RZshpXYNax18Olj7nc2L6ErMBQ3/Oi
X-Gm-Gg: AYBFou08RjE0V6zPlwI07QxzWvil1x49zbBxadyhQGTfKKkAKjcIVZuoPx5bXmPiyO+
	JuSHJKv39KNB6FaxNGXmfPzTVDPNCivFzECp95qb7JSSZPUnYogMFXJjrjw8a1RSrQyRz65erv7
	xpvI4WjsO/3RMGMr7ouJGhN9MKXv59+wJzzmUJJj5rGa4ic769v+P4AY3VJhX/QjBFQiUSgNPh/
	nx6DWln0Dc/a5mRH0gGWgKY1XtbZb51Dy2CPF54QVKRopdrO4eO6o+URdFPN4sHMc1jRVnVquIc
	RUr156PID/c0+tZSGIicuCWFErWJuIIFLpWht1NssEjw6QZXBklUkiL0CychuIPZ914F6uGF4Ox
	V2SeQCc9zSATNYr1rK9uzgGCU0DJ2S5T5cbMbQVobBvO5kwWlyO8wcS5PCK4SzxPt78QNnM3am/
	fOV1WkQseC83hsa8b2ZAWzxU1rwNUEcahj8BET1yqu3OAMCegELuwaYB/vs0V10aP+5j7lj+9JZ
	yvBg0Ee7myA/hsGKfCIYy3UP5CfwwMtB0j6uAn97yY=
X-Received: by 2002:a05:6402:254b:b0:6aa:f11d:b64e with SMTP id 4fb4d7f45d1cf-6af9e34ccffmr10161152a12.32.1791232112351;
        Mon, 05 Oct 2026 13:28:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:31 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Mon,  5 Oct 2026 21:27:30 +0100
Message-ID: <20261005202731.153971-11-pmazzini@gmail.com>
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

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..fa34786f0652 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.52.0

