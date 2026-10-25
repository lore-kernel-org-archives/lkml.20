Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936707;
	b=ABtLvywCPpRQOL4SjUhQ7GtiU54cFZvra2h4sCVBjUAL3joyJ3vS1Tl1YpUJUyJPWLse
	 xowYqtFrbyH7YKmhPvr2d+CYNodXPXwPEriashGkrlPodx8szGaGkBoA87SR1C7ZeGexP
	 Ouk1wEjxPFJFpUQs13WTIqxiDZSucA0Zv0XBfimcCEf8eGharP16wAWSU+J5q3tgiE8J0
	 T4GSD7ou9lYO3ttBvZ5aFONdZYmkutR39ROqulhd1KnSfpQk3ifiYW7aRpRd7n6sREHlv
	 VA4qAwiZzwkbqDut4QnA1blg+DdoAblhr1Rttw+UFXhZBlyGYrmRxoCvoX7bRnj6xOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
	b=JTd18PhJqn2GdTVHc3yKh8UPf11YjqCA8sBJ5pnCVkPsA1+omyNId1VA1hNlHM0MoqQA
	 m1RCJvwMwBMfEv8T7kfcGo4eHD7l0zqiUdzFT1MUo3tENuwkPqCHC8eW6kn+mBltC8x1U
	 dnP0QUeOY9PudnrVg3Qp0NZ8C0WWh8xM0g2CximBWlj+bKHUwCAq/Pzb6J8R1g68HQErP
	 0+Tu1azOgRfDEex6fsGv3HKP5ptOtcw+AkgxtBUSFYiSGtOK/pR7ugJ8JhgF28ZllwtTT
	 NCyWq9RGVFdPrfUKpSGBDaLv+OG+FhZBqco3WiTs2oom+q6XwM9P5FEcE0VeyVwxjYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oqLF6mqt;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5438D606A325
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5438D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oqLF6mqt
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1893816f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936705; x=1793541505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=oqLF6mqtZX/wLfOVtnb3bMuXtECCsqjc7qiCPIAXSOwGIBXO4XzwzWsJvbfPiC0PIb
         Zg4wofMNHNcoS8FvRsG2haIgdsD/b+GaYZR6PcfyCRNRdkvDj0nIDOWwCD1PctuuNs0T
         tmXq4HL+sIjEa8a+KdlW3jVhiYfbQtOlhT3NTFlKEiB0DIR/zpaEFYGigG0mSOpkHIyY
         2Qo9nNSnPO0O+J3GdNi3bJw/R1m5wMLJmZroUkard/bEhK0RumpNKew8/kVXaa2WIMSh
         T3nFkn2BqCElYS4d+N+cTRLjnt9kSqfaFlUQU0TkFNE597VOYf3DZSC4TPZFQF49TgNc
         Arog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936705; x=1793541505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=vZOnJDgMNF01F/LoQnqdgcsquIHBg6OkIrdbFQThGQYsKhBSN9+9zOTuqlCunQ2XjQ
         CnYAkvanIj268JjMgV9WH1p20nrU0gjBSNLeZsOFX/m+A8JGNtPgfTlZdMERTlqcu6Uc
         OfSowu1VSy8h1vF3WH5RRI62140dTfHVZPkoy6MDpUc7QulRTHw7+0AyiGS/K3MDa6ZD
         NKKYpF6gs3kSivAztR+rAwDQZg4VxdfDfO1vKXcGPmlzkk3M3ZuwEMhdqq9Jti8D9Kw3
         US7yvcHl4wBy7nkiZhO3Y+dkhW45h5ggxNF8YUe+GJxYaMRbq/Cg1fj8F2pa951Wvygp
         a3IQ==
X-Forwarded-Encrypted: i=1; AKwUvByhdL8CArorvsg8imAFBX+Fvdnd0XEb9f5kdK/rTg8BTfpEcnTiREZFriWE4b4mjS2jBaStMJaLmuj9MTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpsUO1NfgUOIuoA1MOTXXt5JjOTWIVwW6zmAe3vBNnRlljDCym
	DlHowSUBlAT6qMX/egBvD8IfmKAo/UwCQ1cdx+J1ivGots+HV79S4ARK
X-Gm-Gg: AYBFou2Ur6njQQT+ZGV0fuHzIaFl1lb9iOniERTgCKU8EgW1/G3ZRsCXldM3yw+o0uh
	csCsqP5EbNP9poYgfhkb/BLshPck0ua51UXbXPMfN9+y1BT7952lexWoM6lmq/9xqr78r7Apgg0
	rqHofk7Z19LdKV3+9PfndD9R0NdUevmPjkjbe/HnUT9qDM7Ks/R+0YHfBODb1LwY36KaIG2/7Lz
	RCa3m2V10iV4301M9o1+krP2CtjJv8IgyiMy5wcvmBz8X+wsQ5tS9n5ZoRwTfvEot29nIe94pDJ
	oFBRPU6gmVP4orQ5JbNg1lt+ckS5pLjHZJpWyPw6PUcf7cj48NvidT/ec2XNwDtUj04Pvb6tDZf
	zknDISuB3bfRu/LpUPDDGChX8i9xauOlQD/M0OAVxCYZSqU49VRzXtqptdUIohC5Po+7S0YyAG7
	SsZuzomIw8wJsVmJQToHk1mIAygECkClEsQwNY+RBr4Sp4Tx/o+yIEWB3V6dOi1FAC7KbNdjEkM
	7IbFIaRmyQdJtB+A/Ga1V6FkiMjfNLytFTz2SA8iBE+/pvq4Z/8Lfv3xn1SKmpBQ/c02O4lMeGl
	qGuISXsZxxmXfg==
X-Received: by 2002:adf:e004:0:10b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e3ebb1168mr4784693f8f.41.1792936704729;
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 13:57:44 +0000
Message-ID: <20261025135745.102970-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.0

