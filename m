Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501221;
	b=J18yNPsDYb+43z2n4SrvTpHkz9gzyGayKn9HTfsabVeO7smG9DqRe2+ecw4ilfaLNYYV
	 V1036OHCjEUqWMVjNUgFB+CFhIEft6LMSex2vU49WSqwS7/6R0/uIHReQuF8FneW/XXBP
	 7u2QPNUa3hd5N0AIV8wuI85kO3hWF1ChBx7bnpGt307UcpTw+3qTzBpxER22OOxYtk5WO
	 PoUqVLlrNm0kYo0reMHqxvCgKmjzupsgrWVdR/2iMfYPtE9lDq5+NKEAwWrGQTdXCEQZ8
	 o3qZK89+OvTD9VVconCeT9AQIqTw9qPQ2ccM2S46N+lh2Na2G9AEPMLfky0qkPv0Wyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rW8APe3WvjmaSlpRO1MnJJ5xQdZ7K0W4HoHT++1heEM=;
	b=LWNUdFXGAdr55HVtmO9QwcgwHbuUbOBeycmOLjhAy63p1QzMX3MvPT17S+Lir34jSXqU
	 xsVpQaiReRD83Fdy5oL4uriuyrCN0mpTKTE3fgXtfyrLwK9xFjbhqPiWc5F10U79RfNNf
	 jyrKxQt8Sx+4jrAZjVKwMoJJfha8T4VEPzPc/LpryJXhPlq07P1T0UDNTlySq0ntHJj5r
	 yTC+Yc2Gu4OMNMF8gXfMLEQ421CqQ+rXL+hjAPYhyTau0BZIhdyDkmWtBobhB3Nql+Hwl
	 mkFZwHtAaN2BoCqFTceGHXPOwZikixiRtBCkucNRAXxiw/0fD72m1i3fM3nrU4opipQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k0O50tbB;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503B560A261D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 503B560A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k0O50tbB
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so41026105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501219; x=1793106019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW8APe3WvjmaSlpRO1MnJJ5xQdZ7K0W4HoHT++1heEM=;
        b=k0O50tbB7rRUcvvLidpA78bwoI4CqFjyw92MDTzEykafkkwRFDrkax55mWY/4ie3/P
         831qQdZz155hEgrCVw5UMW8Q9nppUowTea3hO94Fs2Kn3SQBHE6BKLWgEDElgti6dwjF
         iyZKcKjy9J7mO+YvC0cz6Qa4PDYgpE60AwlsG+hncYHA4X+EqABgZQw1PsCcnsQzyd9t
         Vr5ekisX4jQAbBeKn/J6cedjVSbtFctD6ryWrubcu8/fALJtsmIC5ALPRZihYeNolvWB
         DbirqEB2S1U1kL9OrDDEqe3pHRb5FB5NhTla+qhOxs/EgRANIVlip4ezG83dxL+yO+Cr
         +clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501219; x=1793106019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rW8APe3WvjmaSlpRO1MnJJ5xQdZ7K0W4HoHT++1heEM=;
        b=bGqN7d8Q21JPp6XttZltn03pnC8dknH6KI9Q9uGh7yZg8mIVHTsLEAWV2MraA8b07n
         SFyd20wbT045dpbJAMRD+0XeNxyA4Gh9VqNZARPjhHWB9rswGfBFn7Y0I9fqiPTHcjTi
         SHV0se6SybxsJBWLE0G4TL2KAsGgmldjeGeZ97co038kHe8LP5VUSqHVWlt8wdH1t9KZ
         sGS2LNegtC5BhRz/tMFMXAfLOMZOEAlaIVwZW1RYUr22VuoNy4t8Cw5fofd3lOGs/fSF
         ubof1h8ysmFNW3Dx8pwJnJsLvRr8hZZgg2QbYR5ASOBXRfhp8C34vxfC5HmtW/0+AjiD
         20BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTKra+HDD//Hbd13hQ30nRf5go+B6l5u06z4zcIRWQZoDpVxyj7NzAuteP7n4RBrcE8HTxGWA7VuO6FHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLORmgiZxeciBainoCD70+/LNqFnYsJAN9Lhr3qfY1o2ay93IUa
	6ck7RnyPRifD9aAe7tufVQme4bfA8onnHkZI0nVEIFuboaWwqdQ06zR9
X-Gm-Gg: AYBFou0RNU5DBabwrBiKneaInmoaA0h2IeU1hd8jU5VzcDJNwdsEkVGW02witdvVdHH
	gxL1me9tkImAYYxVAjJXOJAqrFJTX6Xckt9sPAwUzffhE0plKcWchRb5hv/iOk+EpQBlFkbkGhZ
	/ulMUE5NHDXfVOOU5Z9tEDf2oAt49KBYnLdI8hWjGphOpq4zzCHnQtRHNvT/jwE++EgwJZdjatj
	Qtww8uBrsd71yYNCYAr1KU+Yj0BqBXbuqrqUcSfOg1xmwX34AlN2hsUyK2pA11xO9jXvKBjKgiM
	Nd8EJ1MZEzxkvnF2dbo0bDUJck3xmD3XkjTssIVIG1lE7XTIXSbupJ53S3ygAMp4wvHBVxoUm+n
	wZpCOzVxWeFZg4BYU+/VeOLE9OGmz/eTLJZKjbMvuwhhVxNuNWp/EhGmxe3BsYnbohYybuenwk5
	cLEtzX1FCnX6VRTd8U2mlVRlVPzMlT9hy9WNDTzw+zPpaAJx8GzcRxKCYOaBULN1XGc80gAI7AM
	2Aae3dwc2PY0eBppDSEHUAFOCvhlKqNaAhZE72putkYDGLQG3irHQbonkqBCWJC454bMPshVg==
X-Received: by 2002:a05:600c:3e05:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a1d763625emr222865625e9.29.1792501218007;
        Tue, 20 Oct 2026 06:00:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:12 +0200
Subject: [PATCH v3 1/8] of: base: Fix stack overflow in
 of_parse_phandle_with_args_map()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261020-fw-devlink-nexus-ready-v3-1-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

of_parse_phandle_with_args_map() reads the #<stem>-cells property of the
provider referenced by the consumer into list_size. It then copies that
many cells of the consumer's specifier from out_args->args[] into the
on-stack initial_match_array[]. Both arrays hold MAX_PHANDLE_ARGS cells,
but list_size is never checked against that limit. A malformed
Devicetree with a larger cell count therefore makes the copy read past
out_args->args[] and write past initial_match_array[].

The cell count of each provider selected by a <stem>-map entry is
already rejected when it exceeds MAX_PHANDLE_ARGS. Apply the same limit
to the provider referenced by the consumer.

A plain reference to such a provider, without a map, now also fails.
Previously it succeeded with the specifier truncated to MAX_PHANDLE_ARGS
cells by __of_parse_phandle_with_args().

Fixes: bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Link: https://lore.kernel.org/all/aq1CSswlo57jZpMH@monoceros/
Cc: stable@vger.kernel.org
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: New patch (Uwe)
---
 drivers/of/base.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f63a9486b130..5abadab22392 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1587,6 +1587,11 @@ int of_parse_phandle_with_args_map(const struct device_node *np,
 	if (ret < 0)
 		goto put;
 
+	if (list_size > MAX_PHANDLE_ARGS) {
+		ret = -EINVAL;
+		goto put;
+	}
+
 	/* Precalculate the match array - this simplifies match loop */
 	for (i = 0; i < list_size; i++)
 		initial_match_array[i] = cpu_to_be32(out_args->args[i]);

-- 
2.43.0

