Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0485471CF8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799801; cv=none; b=mYo9i0i9fTcfD85Pr6Gu0q3Xcxxp3nW1RxaTq1yGRCGBbQjbRGh2VBxfOPO/OJZDtA5rEhnG+W7DNflif+yNNIRM8g2wC+1av1j7SH7Rm7N21WS6b1nbi6l5+vHQf7woGB371sE/t957hCKeewsis+pJWp+aiTbLjXLFHaejyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799801; c=relaxed/simple;
	bh=GdBr63/reP3Wl9EB+qPXsBbASaozd7eVeU8Brd8bmQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TH+nxYt1DCo9cnME8HKlp2nivhJkoJxX/uScvrIjdI/WyADKSukE/a1R3co5kRx13jXVUxWJC7JPRXUSpQOJX2X1ZE9JSnP1ln9koI8DexnLYAbiaMoKJXu797dS4lLnv6ttcueOsdPADzuhir5Ev8bZIRscXEZ2bKBvVCmpM+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q23PGFPP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q23PGFPP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso22321215e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799784; x=1792404584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=;
        b=q23PGFPPozSr/KCXj3cm7fVXgqLqwXIcadbZmO20DR6tcdwCKBrYEv4U+PvELrr0cW
         5dScVZWjrmZv+DQabTlbLfA2RdRHwJIl+PE/kckGH6P9lJ84Gkq2ORKF8f/e8/3/Xdi5
         lsdStmU17MS5yk3XEtnb8OeQ6Ek5pt8FNsfMnqgZip9YrexwXivi5qsD6HP0uzTm1HcW
         lxtXgeqXAu30yO47GJXDNqafYSPjNEoe0ADRd2HGrbQUlSPA9sAkwxv3Zw/2aKEPBpRc
         2xTGtdL4DJO3CAAoP3lMBbcuGbBLM8aYZ1x+XQK/B659GvhZvsEM+42x2QuvRT7HtTAo
         PLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799784; x=1792404584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=;
        b=NUtsx9qsIIC1VHkB7H50hSfxJQHlNI5oQK7WppQ27s6/DgJxHKxAhQgCn1gS9HCDGv
         kD4sJ+QpF7FI2vc139qd7cZGCX6E1Zgz8edtXJPiwkC4d57VJB8F3Evx1tOsJTQk62+a
         vqvC+6sGKsp/me0rs7o4d7psrsha3NJHsp62wSrispoqB+koOfjCq0co9q1qwiSvOPVS
         xa22LbbxmtkuqTlSJgz1jDHhpLQp4ycil2WZl0ZbEKQ/yJ+fhB1sqUxv0xV9MSBXtUq5
         smcdQsAa6D0r0x8pZzxXzTF+cItPpS2FT1go9qSUQAeDMcYTKLRMmu5wcWtlPo2D5LNQ
         xruw==
X-Forwarded-Encrypted: i=1; AKwUvBxo1MViXPPaT44VeZaOWD3ZCNoXuYHm0taM96QSxO2NjIlrwAEf+i1FHtGrHJfeLfYZrEjrEcOd3dI61kQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvBEgQMPPb0iEt+1NDDlf4p1UwHTtnBCyRhetLAkMpHqK6hIQc
	Y3zEq5nA5ycfNNEuJ3Ovh6XMf65DgzYoJVGq/aSwICk5HDgLW0tresv2
X-Gm-Gg: AYBFou03cqZ1wAD7eKAzdtgsVczmS+6gcF8UDeei6d4sk0KYEWjFRGAatJAUstbrsfm
	es0bYSe8VSyr28J4MNQIj40uH2Bf5C3mfD3S01Pz5j1Rkz+GstRWIO0VlDHyfgFwwj97lBNdKqy
	53Tg/MPrwvRVv6Epi27j82hIsH+Ffi08F0bOSQUr32FOVx1k2R/S89wSWWtEMPI8r7GWQMFwpf2
	1SHgkoo3/X9t6YLw3sCTD4a59ylkUpLQka1T1NqteENVE2THdoYJzYxO31UDin49295v4HsMNSI
	EAKBrfd6NfLBd0qp4SY1dH55OCVj6m7HM62kesUpoq8qHLVy7ywNQLOCIahVbPr3GS7cfo/4yao
	JGNFl9TF0/8o50Acj2tN/SaLz5AUr07vHTmFnWQKHZztoshIhI9N6kSqU4XGBU+jw7tYfcQWUiR
	noMV2JmCHx7ZyugvpP/hp4+fy3dFqJww2vO/86TjagQ6u4G+4XcBtdzv6zzVz1gHuYZ/wr2vXZ+
	+ZKX8aUac4at0mQWXmVzBZXotWEYwrJ
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a18e4b1311mr160592305e9.17.1791799783597;
        Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:14 +0100
Message-ID: <20261012100816.331033-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same watchdog as the A31, which it falls back to.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index b35ac03d5172..b70a6b45a33d 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -20,6 +20,7 @@ properties:
       - const: allwinner,sun6i-a31-wdt
       - items:
           - enum:
+              - allwinner,sun8i-b288-wdt
               - allwinner,sun50i-a64-wdt
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
-- 
2.52.0

