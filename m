Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375927;
	b=s9XlG7Dl+knoTfJNv6K5WwVd3+vDFTsT92MCenVdbhVnBFHwYjLSzKil9V9/Z+2yFEjb
	 Zma0ktxFTkq0rQsXaxVm6EpnNGGGTHeyc9OEiK6HZ9jBpayllf+9h6dxXPNyW10q6wOIq
	 DejsCLUe2vFF31V8eD6u4AElMcnMLXbYxRAre5kQgK+E2qn0kj0nGcwYHg4ElQcUPj6qd
	 sesNmGKczXxn1vTlL4mRdLIT4LZgTIIQfPnDtQcZuLlUBWTyWRdxD2vtbs4u1t5HRfwna
	 +tw8wZb9pKmq28HfSXEup+sCFvVnHJKjWe4p3+p1t+x8yJXRoXcFH0Zbh7X/ZfvdA7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
	b=ARzG5OBELaBpXEKQNmwL4T5MFTnduMXLz2/AeqFXyDuhc0mKkhmW3gfcFpPBzmMsNx24
	 PWZBtZkOtsZ3KMLTpR+os8tgCSrEBmKU/EV27AkTuaKp2afTRp5Zl2ObHaRp609VmZktl
	 N1kkR4YeSTPKE+Xlw/99w9BesJ8WeNqTlrDLU1tipbY1hOjteYDONeYLTQ5GVmJwGjpYx
	 kU1KhIkpfAqs+UbYOA7zG0OleVURGvXKETq1jyb+xwByrmXnthBHK1MIzjOiU7NlOJ5gZ
	 Sl9IBqWcqdTkCLbW+4GqbrpNgXe1Yz3iW4T4HVc0Cf0c1MQoyKzRbd07tZv6bKWr4Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=no1NUXfu;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C950A606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C950A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=no1NUXfu
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso7897975e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375920; x=1793980720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
        b=no1NUXfuzQQ58syEI6DSHr6K09poEWBp1PheN9m+LUUfmjsSyv8P0XyGVA/mPJO8de
         QUmQx1u2N6as6AqRj8HgJb103X2/s7DmTeCXb/EYZsBN1Zk9OQWJTbM37BFtoQFXA70w
         EJ3RAzZiXKcpYoL3ZjqhHXBqOEZ01zOctuTxbNSI+E0R92C/vQ1S2PchXRJxg5aFvfpm
         lIGnzcidYTVTlqqUfiLvox6Pjs1dkINosLRrA6PQJTb4OC6xA1KRvtNE+8yiOD2ndIaJ
         oJ+ogN3bwjxFwKq7W36emk4xLJ4rq6wRA+NorHKhwTIWtrN7lgyEkG3rlz1ivOnSzEKo
         PHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375920; x=1793980720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
        b=MEdVORRaBFPp3AjVJ6X1g9FW+1SVI0tNOo77TbC0MFlAjNwImTFlcLyei6MDmL8cUJ
         MsTN/ZKfENe3njoK/wjMJwC88ZMM279KewJywzWOQ68E2toSdejT5HJpq2fdEs7IFIyx
         +9GKQ+N3j+cxMVUzzfffN+UbUV32XrdXyGZkE7YzB9K92kTR4BCQstbMg0eIyD25LMEe
         4oegVM/n+ZReYLJ9CJ6YPBM2P0qxjl0dpKz9FhSJ/kWDcH2ZzvwlOPQAtF/QqR36zals
         sBxuY3vaYUcAC9LYVCQmXAgWoHwUXlYS/aYrBiZckNQgDjs5ZYsyoWhpjCiMn3fP6jU2
         VmPg==
X-Forwarded-Encrypted: i=1; AKwUvBzmgYZ8n77oyKNWBoszC0qSedTcCWtC+J2iJgQUuNIX2lS9Bee07TsaVaHHvTuzD4cpo3vyFSgmxeyYiZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkn9fwHQU4M4kLbBiZah/vghW2PQ1vyqdcvf0//WFXwX1w6JE+
	0ZKIHcaGcdGjBi+eNrCPfaSKcA8JE82Q3wSx1rmYY6FnEyQpUJfora78thDuxJ5/SzM=
X-Gm-Gg: AYBFou31VteR9Y56iI9UaN1ji5KiFSx3p3D42ju2MU74OtcnmR0dsyRBj//Tguds91C
	C6TqPsG5THxbEgiwwhX9bIloxMtOTC/DWNKNk2dEmWJDb/9tiJVva22n+ZJffkC5MB3wAi3TTTc
	oBlqLSOWYQyn3aJLetFd1n3iXVqKVoBqMvlidWI7Zdhk0RwJibXhBv3MHJs1WLiVqx0nRYyzo28
	jszxXsBgQj2ZOekAl4gNGBmHK2r454ttJz9TLf8xqWTT/jggnA0u08YHJomMtci8kR0Yh/gA24g
	ER3y6rbgE2nVxknv71QsU2w9W6yhrrV2+iQlmNGwceP07KEZyYYNVlputJAUhyt4AM6AaKuzaoJ
	QKNW/8OQMD6BqCVCoYynlibIR8a9yXahisS/7YtOT9HP2Jch+dEPw4Zo5qEFtKN9VAxZWr7VhGH
	cW4EwJwifwbQz3/JLO62w3fEjBOJc2LBhmPWwWroerteRWbSjMnj0uO1eQOiHilHLXjXw+O4f01
	j6vIs66JF0VtT2t4JodBqvxAQusWNpys4YflFTzmdwAODAATB2OUuBl60U0sONTqvhxiPCSGnaG
	zY8Jcke1lOwdFpOw/BxCZwDfsSFjyi+QeGjALOLcvQFeN1Jo0U8=
X-Received: by 2002:a05:600c:46ce:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ac18a88820mr62818445e9.33.1793375920100;
        Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm5738054f8f.53.2026.10.30.08.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:36 +0100
Subject: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Use only the identifiers
that were copied and ask again for the others.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 42cb1aef1fe1..69645ce73d9d 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 					   const void *response, void *priv)
 {
 	const struct scmi_resp_pinctrl_list_assoc *r = response;
+	unsigned int nr_fit = 0;
 
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len > sizeof(*r))
+		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);
+
+	if (st->num_returned > nr_fit) {
+		if (!nr_fit)
+			return -EPROTO;
+
+		st->num_remaining += st->num_returned - nr_fit;
+		st->num_returned = nr_fit;
+	}
+
 	return 0;
 }
 

-- 
2.56.0

