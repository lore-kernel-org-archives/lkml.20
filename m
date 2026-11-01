Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543439;
	b=oIV78LQ/KExTaP60TayhKm3lg8okzdXkRWn4N08ijARcQf4C285S5sf1etLZ8dbFLqI4
	 7h6C2+xJw8eIF+OYOjOMmcEsg8CjLEk1KnQi2pGf+E6zncXd57UAudRokgUtrH+PLBpVG
	 r92XDWvaxyLHKpAAk9qRS4xfzf5zsYy5GxCyBDi982fjBk7MoeOvcGabALBsPRblGtx18
	 7hYCg+CybKAL9KRL/bzZrbW8UlzK7Wi3v/O/xv9kXlrqpbemEeRXXsBsdWoW8tSNPY2vO
	 3xoxUkJMSZV7/03RucsyCezQgUklsgxdsHkF7smMGRlTM4kpkb8fbUfra1uCl3d7Gng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
	b=jWYsc0UdQDKBuaRiYwYABOlYmYjgYJO2u9D4dlkSPvapmdImuvVuvLbfbkN3YmInmjWV
	 DpL2c/5QKVx1PfhOew/fEI6AdxSV2m43DSArEmOXGoJTOQBmLH6wjhfA+z6ISxAPBdjM7
	 D7Dh+JZs+5fM+cmBkQbvZByuh2QBfvzMiLeikBuoGVcdLchG+KtOlG87LBqviwahR4X18
	 ikzzzzjNq37fpfvpKQwCtE5P8dgmbpPjsxPLXWi9skGYOLUBtvVDechBuvtLV0TUvDDQV
	 /0p9+f/bGC3UCUb/YpYDF7GqqQjmed2ni/f8DAuVGtb5uks1m+6Y5ZxRrUfT1GKiWnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyXJcmJH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A53606A332
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A53606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyXJcmJH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22463685e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543438; x=1794148238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
        b=xyXJcmJH5wPsOL72onw5F0BVHspNB6fuOYfQQ2Wjiv+rYv3SQHyW6LdOMQTp8MEwhs
         kh+AalkYom2n6GOMe1KJUigZ4UrLRFvojVNCiq07f3Sl8tFSafUlMjsAG/lNtHO4UONB
         gkoZ4e3N6Ylz7HjqRMYK/Mv3bR/9WCzybaN/1056W+yV2Rd+74WmlsiBvQqK+nabX5kX
         etWqijTGGhorbsgh/42yDc5tNd4KCnkErlmB95Dd76Wrgrt6zo02Pc8n83UtgHc8V6zY
         TKTd4yT7eUCkdwBu2RLLwcx1qYoRWBdrYEOczbSraAtzkOs4IqknsrFLC7Rz7kftSv3C
         wJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543438; x=1794148238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
        b=JBm0t2a/yhxNthe8padkLWqj2KrejXebysYs6nr2gh/kILHEf45wpSgZr+UvnQtOxO
         Mcaa0DPbe0fnkUiD/PZHwBiqzZrGtsNw+UJ1v7+zKXn2JlH1NRC1UHNIPtjinNvxT5ED
         bGkRL6WODyNj65KeYFLHPcoEkUJdFYHna+VgPqwGST7ENHzUgG26GBF76MZcKvobVLtF
         rVS1/Ji7vKYScRe/ncjOa5a532SuUk5J0JSdZx1ZNZ+XxtGICt4oD8/Q2eBUzO8W0y+l
         A9Y8815bomcGN0YIaayNQxy31gGDQALzzZU+lxVeHPgJHN3mlMkX0iRngh5tX+GnNwl2
         iGtg==
X-Forwarded-Encrypted: i=1; AKwUvBzGhVHfQKUCQmvtR4SZZeCMM4u1nhAVU3YxHrDMMtA+2y0NXB0m+EaR/dPkzqVshMpUOXlnvlPHfv8YI3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB7Lp4V8Odu3yXW/2VQ5b0+AC5r9b/6Cpdy4zc3B3g/nX1bxfc
	JQlyocgOFm1M/rJP+h93fYk2A04ygzmFphksh4UqAQYGNbEohjbNhzfk
X-Gm-Gg: AYBFou0vjL1ejpDKOHTr1UeDzb4hUQ649pRJr6H/QDo27xfMkJ6Qv/aYFMKk/l2dYFh
	3ktgpGxwqOMcee3QOhyJZ2WdW5FDS6aWQ60RP58PUqmSuDTewQAzWw+exYzRu00IAeWEocpawkb
	pGSqc+NbwRo9TBZA03VZWTA2J95MOUTk6uPwXwEfouR8fk+cawqCx9jCbApb+9X5W8/D1sJZ4T5
	kFp6Zcd5347b3F5+wzx7eoqswAou7wqhg10U4DsAbSI7mnvEAL2kjHN6R9k6O8+xRuVb7UakoPh
	ICHPyFezupJzX0KIvU8yBGhRFdnNKP1WyO55XqHC6/yEnzd99K7CUkQTmA9joVYv58KTYfKsftZ
	7UgbXKhKwdkcOiqNRnlMPfyoO4iTQyGoM12Aa6hsLdcFFOH6ZTsWsME4i/iA+/e2Yo+tpiK/KQV
	h4k7R9L+JKOWsnwXCyU29RDhknYeuve2uehpNViYVUmgozZSfR5uPL4pMnwmTeJof1Xx2WyC4YW
	B5xwrrVRuCnu1Ry80VY1o2Z8J80aRqjIde7fO0PtYpdANNw4E5iC/2uWy9vTyumABWggLU1MhbC
	euIRVSz33ius89wdB0MhOJ//XU/yuD4RnjyM5HA/N7M/sxRd3f2c6UZ99OpZZlwKQqD7DjZxyZt
	HnxkxC6XGI6nsZm1YfJQRmycp0FXiMYaofkgc0UQadFKh
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr176697105e9.18.1793543437845;
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
Date: Sun,  1 Nov 2026 15:30:34 +0100
Message-ID: <20261101143035.880469-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

The RT5631 runs from a master clock on its MCLK pin. On boards where that
clock comes from a SoC clock output, the codec node needs to name it so
the driver can keep it running while the codec is in use.

Document an optional "mclk" clock, as the realtek,rt5616 binding does.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44..03ee25e1eb 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -45,6 +45,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   port:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
-- 
2.43.0

