Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938270;
	b=1QRrv/wLJjUugoViCnYWHi3yjF+9GzCO5O/JqxcM+Dza903l+wAtHRvCz0vDaGEEMk2h
	 R/GtsqlNMAJFIgs1FHgQh6h8VSbZmsuccc8rA6pMFtdEoIs6icJ87y6HkrJ8ZMDpaWCW2
	 E3vjR4oOU9mG1BtCzxNx5Xpi3eRllGQumPvbpOxW3nCJNu2S/5wUV9XqJ0Wynwpgryvwe
	 knkIvyh+UhTTmxfESvPGGIB8Sd2LT4NNh1e3f/w05FaJIlSLq/v6DDe3/K57CMg++Ir/7
	 ifllL+DdhRcSzvdLorsi+HMFj6Vsn/2Otikwvyg2wKEn6yzqu6zq0kDoC4ghIQtgquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
	b=GTWth78Ho6xaAPWCtXsZnhf+sFXufmrrszCTRd7X0We1Oz3dKWdnHdW6JRSqdFJLmZpp
	 ij92rJFRlg84euqFp4p03hCkW8d5BWEwGK1XkA/X7zWSQ0AO/dJ2WvNckrIoiLZ2QOwjc
	 szkptMRFIjLnANSEULTPrtd6xcWuKngIvv+EfdWSbMFtbsFxkSpbkiILg/pnXx9flNUQp
	 7m/c7pbmwoL/R/2kAA+qXUyK58e8d+7QMMS6GHbouUiljxjPpAE+4rhR5wDIpmE32jGzw
	 GDI8LKPx66zV2r8XsTt1feuLxfrktFnwS0+h2EyVfV1E7s77/MYbafK/hULBVnyuSWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qu1lOI8Q;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277F606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A277F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qu1lOI8Q
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso17125115e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938268; x=1793543068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=Qu1lOI8QZekGc0/T3lNosVhVwTnTbJ87BRp5/wQvCSCYPk4ikw+AS5UJDMKlxbVEs+
         aDRKaCRya/og+zMFwYd81rsxgBxFa1/X5ySr3j2S4jRMiGp/QCV6f/AVhatXNWurb6UE
         RvCJqwQU+NzB4bPso1dYAlrdgoTig0bHUN1CUDWPSNG3r8Kg8+zhMR08k6aUfbbcEmMk
         GUxWNS1ACsh8WgAVL68lI5JkQlBw6b1nf1K7+Z5Q61tsoHuDL7uSUZN9NMoJgsmrxMzV
         scu3MBpumqc8oyw5GFlS2jUunLJPrOtNMMF1PN6VMtQCbLHm30ZIv9Mzuw92Pr+GaL2A
         gh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938268; x=1793543068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=K4OADLCkdZHmev7sUM68kAgtuRXThHNNw22Oy4qfYvvwc5rkA9rx2qNLDKCiZgYc+H
         YF8XToPl75tDxchVEajvW36dIH0J1ytI0B2bfU+QqFiDq/f3KsMDPthEQ7QCHyBnNIy0
         Xqcv9Dghc6Dbkkzscz9AM/c1ll2wbx06eorFnz6Aq1+7UPy5mrCKynSb62i0pxYLl8Ud
         4ZocUpquDMRGQ12a25R4hrR5LIgYp8y9Ja9xbzkPSOBQeTxYCNQ3NWysG/RXhvzmrfxi
         2bdcqjUGTd0Rnh2PBxyTM2uYZCJX6a2Nct8cp3106pkIqPpYW78tXatOQyrKBf7TO9Md
         8Ezg==
X-Forwarded-Encrypted: i=1; AKwUvBxkPGEHTa9tJDIMgMyCTfDFG2+LXzBJZHaqidvYE7q97dVf1MkRn4XbMgGoy81aBaGwIMcrVseZ5vfrkyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmXLKZHfgo+MwfLJl2jWXDyiU1JHN+kxwGd+ghqBya8kzP50xy
	+iUBLgxxFlTytQe798ph4T66NRfu2rgAto6A1ioynAPAssYK0Nrv6535
X-Gm-Gg: AYBFou2Q1XKfHBCnnBjHrk3mvwERBUFZCpV3UFcAuOjm2sAd3td8mEhF8hgqaJ7EfJc
	Iz4IKQqkN2L+dLC0VrjK9G69bnfAbKxBPzLEAR7BvU7r37QllDWyErWpfAraqWsENtJVu8wi1ut
	mANBqNhJp4Gu/SzDxugIGOFS+Z8hvFKx/6NzgpphkSx4NYzIiIBUhP5gd2S/ueAy8XTgTW1uAwi
	Lyiwb/AvlkuwDl7PRIAwFKa7CmY/hLrO9lvWihOnXwJ3mQPGnAxk4SKeerpc3qScK8OQg68phky
	wwGuDfrzV6ANvGZjcCuSZG4YLBCUfzefK9C09zt95gZcquv3idPqANlezqUhMtRJxkqefGCs+Yi
	UQFSfruq/+S3WdV+8nrnwsltj57RQCT1TCuHNpY9KO7nYW85OtetPQUxmFYHxMElsRvpEqBKIuL
	POKn5oJ2PaFyEg2EhrfFzngwLgEOCuZpWdFqPSpZx1Fkbfq02rTyK5UfzwIquJzRsLaQS5voNdt
	RSTd5UyAXuzYEbAgPEq56Er7Onv/nov67H99CJuZ5kBempfL854EsPuC5eOelUSDAin3ZVQ36Ge
	cCi4b+BV+aefPg==
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a35aca2b53mr66206695e9.25.1792938268065;
        Sun, 25 Oct 2026 07:24:28 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 14:24:11 +0000
Message-ID: <20261025142412.112216-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
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

