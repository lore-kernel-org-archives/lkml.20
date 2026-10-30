Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377970;
	b=jMIWqvNlX2WeCQUpJzVIIpvJdAheUrLai1GDUdoWGGkIDy+RSFjhJLdX2f1dx/U1lvDJ
	 IkJ98yH6d9z7PPeRTBM2jdlZiYPhuf+vomWPL+GF7BNY8BIHDauxkoOFbl3rM7TbeWDHd
	 UXoX9GkTEsRSffxyMcDYJUBL1Wy6U3iCxijlt3cXiFb61kuEFCAOE2xnyDeJTnwlzB641
	 kDlCFD1oZpK55zg9UhXYVDeII9fzwSSstCJSyGCubwOwTWkBUs9CIYRBIrSeYEIY4MMfB
	 U3GHyzzHgnSvjCiJvfrifrRKMFbK8+KrdkDnbnHULACMXgcFrPuQKVzsVthWtKFMgBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
	b=yiZsC6JDqXGezWh59IOTkLkkaKoW181WvRw0Qc76lx+jnIxwIV0AqIaL6ssY6m/qjt/M
	 bv5+9YU3hx7GmK8upfFIKApuDA5dr0Tps3pIglxvzSpgxGrtLlzPpmX5wAs9G2Zpmho99
	 Z2+zr9ipT7fKsd9lltUqhFs80gP88l/O7os/rXiOFRIfDbctYCJLc9OZnjsudaf/oD3DT
	 9dIZIL9t1nfhSAe6TqR9DaAKTtVwFSv0SjFeinpmgrLtDI49e/2qCqfoHBJEYKiB1Gp39
	 +FbG3NtCCsBZh+Bmgtj9KLan/deUKmXIE09phNaJe+w4SFHQxDWTCJzALWnFo47Wxog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="kBiqrbk/";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4AE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kBiqrbk/
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48bbb06e746so470344f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377967; x=1793982767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
        b=kBiqrbk/dCQYNigE3JuppVC+5aXOMm3uDwohrN1p4hZSNpp1loTbvBmm+94OAVszBr
         t13ZJekGenonoNiPNUc7DZboP6mtCGnri5Twx+GRKwowegQbHPXP2pK6+Lg1Itz0pyAW
         q+k6+cboSWo48+n49U+IKM+Z9OfaDxHtlTxY0cAvDGvNG4AzyfiatrnAC5Zwu1ppXa9T
         z1ccX3bE2Gv96J4BH9qz8pJSIGaSgTkL0/HGSkEO1ASpKvlu3vvfLuqUZ2/+z8v6XKTN
         KSN1vRYOcCVQwvERkX5/oVtWZUU1ecU26j7kHnlnO+i76bniya3kLO3/9iFyE3MToNfV
         o6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377967; x=1793982767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
        b=Q01oSqhI+t3fvQUKITQfrJt7rGILP8Oc6k9S09NasN8+uTh6JKfACauY1ytFI+rD8R
         orc+Y7kWGwt8ynwTC/cL4xUO1nqxlJHc/8q5wcAdDeLJtQHDRO0ecbvmXF7vQTRYaWPz
         U8/AR28fSXYqG38ulsgh6+W6lVX0RoTUNtrui48sEHAQsftQx8PGOMgV9e+gy9yR1GDu
         +EPqTFjx0PuCih4cjatE/OnIo8wVJMRheYwJWBpzGL/RiYHvIeKEOjDxPtTNgtCXtvyD
         6C1ile46iUTsxMk6hcN9Ud/uQDRcu499MMExNF48xKoBS/JMWg6XRRywHqqVFjI5lk0n
         6j8w==
X-Forwarded-Encrypted: i=1; AKwUvByTcjKQpW4KI9ir0Q32LtKrPfgSkROHTK6XqZQQhqfledpF0saUd/vuitMdXWy5G1RelH3GJCczWYXyhRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc0ymymH1GffU2qLcc+Dpc9PyMtX+l6kGa2yMv/p41UQwlwGV1
	A+W2LGzaZhVbq6+BSNFwLw54kKMynG3a3FqgoAUfsHa4B6F699H3jCenor+uay3egl0=
X-Gm-Gg: AYBFou1OFimygA4/rsj+9m8cgYMsPAkcZV0007BSFJwwKSZN0O0UXyne59is6E/OvCT
	5dg5JwKzl9Gm9IDUnUGOc5joZQ6RvSAvf7vIMlZyj4D+fkXKzSbezff0BIiZZMWvUZEeLlcYMRp
	oIidAp8rJVCQioFgmmarZT/UMLuWOWV28sNYA9lxxGmbuA89OcGafGbaJ0evNpK+7NzV9NfRmXb
	9KgHmKXmEu9/+2z6l9m6rLs5vDOW637rIIYHXatkZnbQwSg3n0FictaXtFG2a7sgpuGRcYWbTLW
	ksfsP/lYoqSUiD7/gmFvJHG04KkZNKyvLPvdqoEjvmGuwMMN1owAjVmSvEP3IquX5VPpqiD/jFe
	jGRYyw3wrMb4ZQVRKXQ/D2HreEf65N9KLuTl7IpITm73rcYnBZDSwLiUd3us1T6N7wZFPtQ7E3c
	e1jzGV3gXx9KMQBg9kc6sZhUYtaPoABrhpQIDbvpeGX1b5uI3DmLBAu46LLJ9EPtmvVej7+9hed
	Wboadp0xHsp4/XIb81RydQRigrNJKCjBDehawvLtU1rEs6hdfFZ6DrGYIyIuph4hvk6LZ0zU+5u
	Kb0cZiwDfzoDEsx612sfQ+hnbo44v/34SCpY5e4sgiBW6R8gJVCiWa7TSFrNgKdy8ueOEw==
X-Received: by 2002:a5d:588e:0:b0:48e:6bbb:c3f3 with SMTP id ffacd0b85a97d-48e6e2fd071mr6553038f8f.28.1793377967347;
        Fri, 30 Oct 2026 09:32:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm3528697f8f.59.2026.10.30.09.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] ASoC: meson: card: fix driver remove
Date: Fri, 30 Oct 2026 17:29:52 +0100
Message-Id: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQBAEvxLm7ICbiFG/Ijlkd9s4gpswk4gQ8
 ndHPfShaKpWMqjA6FKtpHiJyVgcwq6idO/LAJbsTPW+PgYfP2Fj4dRrZsUgNkP5Ju9l4ibE9nx
 qcnuIgdyfFH782tfuz7bEB9L8DdK2fQA9Y8sMfQAAAA==
X-Change-ID: 20261026-meson-card-register-fixup-31b7983d74b1
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=660; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fXalk+osyG8+ZDMUyak0NQXBdifxrSPFw4QoLcm/1KM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq27xpM6JbNrbZS+3gUH2UWJRwWXvzs54T53dvrNP
 OsuwaMqHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZhI83FGhmOy6VOFZrpkt/9+
 JvZO33RJ8RuX5D19jk84d99jdl62dDUjwz/NL/wOz9/2mnOfb741b3nRzpd8yhcs538x/+P47b+
 dDAcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

meson_card_remove() reads the wrong drvdata and frees the card links
before the card is unregistered, which crashes when the driver is
unbound. Fix both.

---
Jerome Brunet (2):
      ASoC: meson: card: leave the device drvdata to the ASoC card
      ASoC: meson: card: unregister the card before freeing its links

 sound/soc/meson/meson-card-utils.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
change-id: 20261026-meson-card-register-fixup-31b7983d74b1

Best regards,
--  
Jerome

