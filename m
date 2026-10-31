Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413616;
	b=boowkdRgGB9bHguP5MvwqmJ6H4axBsviKoX26LTlGBUehngqJB9W1LSgm2qOUK3c6vLs
	 w9VYmxiHgJa9SYKeBZHFEkBU7YxUeJ1QNDgWj2G3nwjqf1rW8tOb86/bfdmQOiyl93b4E
	 AH7+5DNPFHi/I0SJtQPJXZL6kvqYA4Yxewuc6iD5ywPuj6FGOg+ZLv83KyqG0d6Fr4AsQ
	 xL8ouLwYvuBU6J4t2YyKTjyLUlUsDTpzCdTp9GBXMKCR/oLd/MwHhM666sypntP28PeC4
	 Or2nsOScufbaB+XvjEftgOEUmJ+Pk3s86Ih5KTIruzmk7Jkr2304kxkcQ+ALljs1idA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=;
	b=FQQxHKGZZYanlrxBCBeLkMHhjwp9q7e8WxAv4Evi88I7Ni/xio3q8T649DMPWO77YwTA
	 GWMBYNhVlSE3sa2yMSiVNhdgoGZ5KekDAJGQ1rOIcaMM0SarZIgTTsH9+hv/IFPjXqMuG
	 614gDAsfxXd4qpDmTrHpZpV7riRw/91Dz5iNt6FzAew1nQjnERlHo0eWWubTJCJkxETy1
	 IPJcW7vT8JT4W2K2xVjXsEFmTCF6ciSUDlCt/yuslhwtYrM6UA/XvBdakZGwnIPhoiQnq
	 JTgO+USbGeYoIEEO31A2KkN2G5AQJmSRAqx7I6PowUSF/jqCVrvZPL6hzq8JWUrypxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQGhbwT9;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D162D606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D162D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQGhbwT9
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-82109f51565so631432a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413615; x=1794018415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=;
        b=pQGhbwT9JOnKRlqqjQWNJ/5RyfhlsDyLZ08Kpar3tiyfp1JyNhomaxg0lyec9Q5fO2
         JPcn7P9f3omSYn7CRTYmQn5lHU7DRwcMDveAi18fawmthtuHk5gyxmnHJIt1MKT8hkT/
         tGiEFrF+WuV7H4TOd6phjIazlrAh7ycrT7sKae/b0m8AXRSGokfl6NJxkplO2ZmU0wDA
         Xmqjxn9wDJHXENs9+Zoff9TBkr4xO2H1paZ7guLqATKmNZlOZfJmO+hU4Pg1BTdL4BtE
         0I+LF293GP8Xyz9Ne392YyS+yT1sFKgbrA/1xD7lC4U7wSL52ibtxbLLOKhl5JF6yNLz
         Msrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413615; x=1794018415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=;
        b=scy0oMQiMHuraYntFVWmcMPjRswspbUjBxyLamydnxVuvEWDsnyyY5erWtjK1vHviF
         ZuLGVQSr/zvSf3bA0kqPL1Csd5qXAd2TVSInbwYBaUCom4Ql3MDpMwF9i7dwS5hySK/+
         n83D0gD5DDKgKbn1lKyd3KH9m5YgoRm9bW0FWRNIhSoN8BvE7pwdnTjFGJbz9xkNoDwV
         yqP9lZ+2yXfiNYKO5AhTuODoAZBrAe0h+o/nztkLd5C8wdt64HbQ8FCL6pscjlJEeGNz
         NO7R6DcO0RXw3G5hioHRYCB1dEbcozFye5vFmDJktKuM4CtbGzkUnImLZOkG7sLq7Xeg
         3VnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2uvD3aa7HACWJwBog3g98bgaBYi8oewnThwHgPoUGFK/bF1tQ3r0AVcocx67s0ehZn1nVPZAj59XK0p4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6vlIvGi43HUo/0nHPEo9meOGp/1MvknPzTjuxCQCyfOZ7V8Is
	GvG9tPmxi8voUo/51ZxW/SdmUTu3CyvqDw0EYG7PJ4bGfFLRKZHZ9LIJ
X-Gm-Gg: AYBFou1hArqaGIlUwrFMiRb59Bsl/JQFKK1WJPbAvorH0Vft6bLqm9cOd6zdQl61cLD
	TsPDsKFuB+igffaTC/y47AP7V7Ux0gKwrckCaoHy9rJS3a9KlTKLNz6aePCsQAHxDKuZ5NP20MS
	z3sAfJWa3aURn0jDb3keP7zdeZ6sS8r8t7c6qDT06UPADziNnVH47QgvLXaVY91388nT7Txr83o
	z4cFPG40h0nCcK077n/YFsWczexeoYmIeMnyu5LsWK+SdShVVczzuPZqydp4XiECapEp1YGNcOI
	PiSZB6mskR4Cn5z9ozqaElNsA1g5FccmKLMuD32acsaJ1HRMmH/JimDDN9Oh7oRqPROBTUWMlY0
	PTNu6gLfjMHtalbKVAHA2e2ewNKhRrW61+ZC5n7o18mFujC3UE348Y2qKHYVC1OXZPen6dLQwZ2
	jXcHfbKEhFvq58lehRabKG2eZrDoTw9HaK1e4XPsFnhIJrDuNNkmWpthYx3Ylb4GTEtbjYY0OYu
	qJWVpp+6E/OCNdhs4bx4Vv3aF2jwZdpGVKtQiUlTmJy8oE2VELk5NueQn/atzZs/3fSjIhSRAJf
	7Gvu6wvYg0DE2Ij9jTemPd9FitJy63TWpo/I4HGqb6yWITglX7lhlaLCJ44jQwhHtXGDrn303ri
	QtAZ2Pw==
X-Received: by 2002:a05:6870:8101:b0:491:88f1:f3aa with SMTP id 586e51a60fabf-4a9076a4e0dmr2895056fac.26.1793413614745;
        Fri, 30 Oct 2026 19:26:54 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92196a7b7sm1528358fac.8.2026.10.30.19.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:54 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Fri, 30 Oct 2026 22:26:52 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-1@gmail.com>
In-Reply-To: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
References: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Document the Radxa Cubie A7S board compatible together with the
Allwinner A733 SoC compatible.

The binding hunk is unchanged since v1; only its base offset moved.

AI assistance: Codex:gpt-6-astra.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01bf26063777c97b14dd27851dff02..37a7d713ac71691e33453159592be31194b974af 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: a733e6bbf6de77dd9f260e65912894fd4d97aa78
prerequisite-patch-id: 2bc04cc14b2b271fb6aa55f78351e523cd81d1e1
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: 9abb4ef3faa58b35d636626e69b4b66ed4b04cbf
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
prerequisite-patch-id: a42183a0bb2ac1f94f7e040c125ca270cf77c44f
prerequisite-patch-id: 2f5645c9f307df3edfcc73dafc4dffc78c607df2
-- 
2.53.0

