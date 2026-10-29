Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278471;
	b=Soaqtv8b9OdGeRg1ExApebuYeSKLNP9kaPhtXp3Tp5oBQk6zLL9Trzmnd72y4ynJRQ72
	 8mvFsw5BdS/LjJRCrsj1LduUOYfu71WcVqLNPJwisRX+F8C7SMWUirJk7x5DkPoqffIPc
	 UTuL1/pWMLA6UveNVC00SW6YjF7KSSBo0IuaD5IKM8PyFdJSXJUD3G9I+7MU39rOl57KW
	 mb+w7jaxNETli4EMbLgUhHNxKsssbxrlPg8/Bm4j8izFysLG5Y/CEHbc0vD+DL+7x4HSq
	 czSxjEd6sOphJlo2f4rdIhrLRS3VJNNs9KAxdGbyogqbaIx/c70Z4wynvtRNu5JdxUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
	b=olj1LO27f1HRKzhU2mwsjOK7VYYv0yM6oOV7WyzaJMYvfAvVmRu7c/cDRUOkryulD+Rj
	 NJYQyMrzz63sFPwNvYy6aMLMe5V7LJUqLkD0lY9ROZZNv1pzETAylPeUzknBEOo9iprSM
	 z9fFl8cFUnoyTqPFqdw8f7zs97Fzxwl7Q2GoJvzTVvs/nnxG9LZJ2BZKDtfBEVo2yy1NL
	 4EV1xC+O/kqtfVVSOvX+SLFYokWdox4uelcpP2WY4hsLNDgnem5NmoqTlQvzrx6ISjmgZ
	 mAwEMvG2x6gB6uKoinBwekYpGhYsdsxB6yqcRLqm4IMkM5XKLDpvBLmYwJYmPuOgA8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T08D92Le;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8AC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B8AC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T08D92Le
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df54150dfso1177589f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278469; x=1793883269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
        b=T08D92LefxbTiOmdoszmOa3NJLcJKrIGUeL1nhfMGg4Oama2vESx4fC5TWvDtpYeNX
         RLrwtcYscDVpJaE2rWjjUUZVPpLKVzEtoFDrX1pzYlaRkaFMP4gxcor4f8yLTDdhZEjl
         GJJXPKGJ3OkH33PbK02Ugzxw9SUxJDteNgzyPPUq3V1/N2LBjQSyvqkfwRU8W/zeIDOq
         CiMQhJ1+QcrdWSVU6Nw1iwVeZGiCd8vit2aHM3/FC6d+lqWxp7jt3OvznfYEi+4D4Lhi
         0DABHB7s7X/9bMmeKF0WvKdrF54n3VaU7OvFzjLsLcxijtCmGfzzSijuIVTBrUZLFN1q
         WliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278469; x=1793883269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
        b=dVdVyCducXys66oCyzzhuQsZZpTDeSGKqXME/HoKBJRXpBiR85sB9QvL9lWu+FrsQ3
         0iUeZ6YWvhFlvFJPWdfRxunzFsx9UQbXClSu85dBsDQHAEfbM+q7a3xs5Kje+oLJN4oB
         YWngZzo7ebdLfhmYB+YmZOfFz7bIxvUlsx9KrjbOUh/Stn62x/RKeFTw6aBg6/QeG4An
         75Im/aNv0cJ0+0IItN3srcdCJeBMg1hLG7/btqBPmY6LlPIbvKJRF29Kw9F6pbtslLQb
         cDdz6AqN2y/bOvkz7B+NqMAPMfhD1osmHFzpyXvQ3NLAwi16BCVTg/wxjCbPOZa/4fge
         PbEA==
X-Forwarded-Encrypted: i=1; AKwUvBz+a/caKgsMKNgSqrvJJOJnaUSErTHMkh13io/J6ytRzjOO9kxYsqsM3SeTCKGlr96JnOhYqaMg2WSFqjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYId8+WqUlpzIomLE82V6pNxuR+prXM0arIMm86Pic9YGPxWevAe
	D+B9XwS1ltLTZQbVif0h0FfWmsBe2FxM/RIHcVEk/r5E8PHyN6f9gHMLEgQ++9pwgiI=
X-Gm-Gg: AYBFou1nLN2n7dT2wIwORd5CbUDD9EwNS2M++wctQ093qxBQZW9He+Iy+uUkU4FpKYS
	lYH1wUi9nh+D763B/D5DPzrz9UZ5rjc7YZYmDeb97DNo2jdDkQWI+u7HsQctXkoYHp0ux1qu0yP
	C7FTNDKZxQKOTWXTqx1pY5Th0LBS7SQvxtyv5Tev0KGnQdtFvxuUjjCqIyXEaq6P7ambkoBtphF
	u7RYnHM7ZeJqXkVzDYnrbdaN+UM+p9nav38xfZic0SnaZiBnu3/ctkCcu3FMunUO+hl5qfILpfw
	QgJLXzuGsfWuuWXti96j9gIeXmxundNn8a8zOWTGPhswQ7Pc0l62CNPNXlKOtVLrxW0qNq8vvpY
	Ef67v8lAa3atXQ5FHSs+ItT86g2H3OQ9qgenrnYshGkcU8XjNFPTxOb3NNdaW7aP/krV+/vyDmH
	254nRvNDNHa7apkU411mFqg7Reu0C2vAAb8W/1X0iSRpCJJexDyE0AYBnOPMQSefG0F4Uc9Kq9j
	XAcX4y1d0htf/fWxz5VSUdwt37leqpXJ26RZ3KJuesmIUfLGO+VvWrmdNnHaAshns8cRsQZW/sT
	YpbuPWgVdAVBnF1fTdc5+gXNvhrx/E3BGGkR8IO63bcfSSDgtvsDPdZu8skOduOBbz+ms5eDpg2
	WnAmqxwdnLQiz0R26SL8OuvOgEwsw7JxoeewnQaEjqPFo/Jw=
X-Received: by 2002:a05:6000:607:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e5d5d1486mr12914361f8f.51.1793278468880;
        Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:20 +0100
Subject: [PATCH v2 2/3] clk: meson: g12a: add the missing HDMI divider /4
 alias
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-2-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On G12A, HDMI PLL divider values 2 and 3 both select /4, but only value 2
is listed in the table. Reading value 3 therefore gives an unknown
divisor and an incorrect clock rate.

Add value 3 to the table. This also avoids a division by zero when the
read-only rate-rounding helper uses the value read from hardware.

Fixes: 7aa6c24697ef ("clk: meson: g12a: Limit the HDMI PLL OD to /4")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..b23b9514fa91 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 
 /*
  * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0

