Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796078;
	b=GnyRjWVT/kDoCO0mIJ8poTfYF99tWhAmFupKOaNDgT4CQnSgMVuvNiZ8FBwrcInN6hzU
	 HxDVq+CsXI8noDt9agEQMJZUaPgtsbc7lSWOv7JEQH3Lm8T5pVlzSl9LVq+tKYhXF1JAv
	 V4QyH51ahrCokhHEhdKTnkX24PCSBUPMMchxozaR442ZtyrLolnY5+oZs6FVCQuEV4a2z
	 sYNA62ifj+5yvdNtv5eis84SJ5cmMHP70YGygssgGdbIE+y9SVf+GQVALzcLx/o/Sc04/
	 PyHbp4RoRdHXMLeB/rmvoUuq2LWPyngUXa2gTxp3A1gJz7QDp7UltxgRJjHjQ/KY/EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
	b=WhitThKH+6/WrBRBYEou5zA17mSLcHmLqXDrnqNbElF3u7DqBu4oVtCkCqOuUBdx26iJ
	 fj2hfm8zt32P0Hm841aKHCRiqSoObdGkdwBc+nKumngF0TA1wN73LO4RJL1WuDWTo5bM3
	 FyMbIrIzfGmuPT2ioP7bcQZkiCCbQH4rEzDpMj4ijMh5ZnZGsJQfxGQpDvt80pv2a2hoX
	 TDD66s1dZ4HRkGBHaeXoHYsxAw02WeMDQ3Czlzps7eTFwmwRWTtlU+uYq2tbzB5vFdaui
	 gRvyHkzj5nFLMuZMtQJ9ScD2BDL0cDeNb9yifCjiAKRe6Xvyuru/eAQfj2YFe9I99tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEDYL3Z6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21207606D803
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21207606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEDYL3Z6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so5835465e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796077; x=1794400877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=YEDYL3Z6VixFTTi2aQ1Fu4+G3ooQc+yBSLETFJPEYDRbUfbrnmFVMvzk4idoP0m/xq
         HAXfLuw4AyNe/DhdDuh50pO+Ye2UBQxQz+gI9bd003BBAyao2EMq8IPY0cxIziSjVKql
         FwKsnnxGv/GpS+xR4nHKQTdY35bcCYplrB2f24q1URxzOZG4SUgG8ux/xJ0xCJnfO7q+
         bJ506KJVp5VTdCI0HDbLOB74eMgh45Xi+C3ygm8V9AnUrgM//fiYLmsvOiimoXB6B1rr
         NIFPc7VV97IgVN67HGWaGyWeBkX7n61aBVX7x/8Fp9lMhtXZ/GSYwoZtlpJW0KiFzAfF
         KkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796077; x=1794400877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=N+ln1K4pR9fr+dRjC6vGgqUTtaBCTL7y3aptAApNNvFyrynFeGbIX/funCF9IsSL9/
         haQTMBZjzq49Cy0+sNHEA++bDLm7F8yQIIm0SS6bm7a5WjG/khLUaZdnnC091nbFhnMt
         tbZKMMYHt0FtIrYD1uTCiU1BY7Ju6nlk04mpXGp/puW62KqjCmMo9Vbsifqog0QLa5sp
         Vf3QGl4kEZnjF/a9t5bh0dGRWiXAV1pGsYtPDFdZesklokjj969p08nBPXnttfoOL9cO
         ON2t0wlTLu7/EVuy0IOgcRIHcMwqU2Z8ThD+X12PfbSvH2YFocAabHmZkO3dJ3J0N9AQ
         rl4A==
X-Forwarded-Encrypted: i=1; AKwUvBxAAf+UmJZ0ZlIshfiQxYkVhaxmfnLerdbpBmC3KfNkir5luike7r3drYMHjZlrR/EA2zuT2B8x4jj0aPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G8RnR3jyQ8F/yMMzwgwWYAukos0Y0RMKa7NVqEqCaYY+YJs5b
	BP5S084ALlbtqRilZAN0sRQLFjFGAlKAJGWB/2l7od0Ceq455Ehhe4BC
X-Gm-Gg: AYBFou07fojfRn94PKlZvjmBiZ1w7ELp/WfSzAnYh3Kw4GRGa1yswp5QOEKm1G0NbPg
	AOPM9cskjFCIWFzgVTVfFsRunYZmV19XtTEwSQSmLuGrBbyWECHmFQ5nHpDjtkTqteHYplr91ZE
	ryfSbJlSZUkzvWuwNV4oB5xKuZdQntZqn3FcOsjOEMgohTZ7yz2ZxNtC44vcBivHWeEXKjCQ3Ae
	NrdA+UuGA0Y8YsQxLNuaNZzSJK6XOoO+bwaJmsd0Ees+Bm9uABULSpnfG89GP+XR14l8uai80rR
	O+uhs5L2aClaBaq6gy9Q/P07jhjkLPRIXEvWmTe52IQitYeqz1rcS5u4WuWxGG21NHif30DvGcg
	EaHKUUHK3mrvSz92CLQ8BQVOYmDo9ApHZv+4pBJ2gFc7DH2C1PsfyOONIm9653F1ZZC5pIUs32d
	0oL1u+mkY4mALFRtYoBLaEfHpsck1Q3iC35QG2V+8CG1T5l+Gep94HpyFLHTxcf5yuU0ghig3Lf
	3xiHU7Jal7b0hIs40D1HYoaznRxlWzDVYviIW6z5m2w5BBMYzzLTE5Q5rYP2dSDwtFdthDR8tIi
	KNmdcs5W2SIzgc6fwxOsck14oLnpOtpF1m1Mln58iNArsnt4JYYPj/hXwbzL6I7aV0naQlI=
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr348752145e9.11.1793796076509;
        Wed, 04 Nov 2026 04:41:16 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:54 +0200
Message-ID: <20261104124057.240288-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Wolfson Microelectronics WM8903 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 089b673847975..bb96e8f790b2d 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -29,6 +29,9 @@ description: |
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8903
@@ -75,13 +78,16 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - gpio-controller
   - '#gpio-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

