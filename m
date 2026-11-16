Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856222;
	b=kgW5SU8XMTDyEo8k65Kh3owcrqyc8wnJVAu1l1K+ofoCc60NzDpCtKmDtgAyJod2rnFI
	 hqeQ4jQ0HApBINihlewQmk0HFgDyg5hdMpItg8JAQAOBbdeV9KXAjbzBo6lh9xzvfZJRR
	 2Mxku+RocWukW1zQ2FpW1MilpKRwO81MdsQ9kuSEm50oe13ntU1TS33Von9bpI6Gqmd6i
	 ktZDT2yUl03/ZnKsNaNuun+mPYdZnZHEqh6KxaZ3lVlBUkjWDCHuLQmn3zUIfv/ist6/r
	 XZqcs1WXSZnwvQZYCTlNyvAwilAhvPEbP4nTyo0R+ydfBvqx3zddQ0f0JodjYO6DNdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=MWn0K85N+ZeqSnbsLKHm706qLEbyvRyCHmz09C8OYvg=;
	b=X4Bb1gEorbRDtYuc+MiPFdHb0GNx5IUCcJgfJQXXCOLviaZgsM5B48lB4hJuxmfOWZk0
	 Vd6MQUjiQKXqU0sIz+GK4kCyVUhciqXfWTgH2EevIkG5u13eMHWqo9nrH/Wi4ESnjum9S
	 hA6nm8dTF1ZYv9rooKGpyCX3bJJB6TZFu4fiD2nE2zoDk3L4hHS+6OsZHaacT4sx9+BG1
	 tirvjtxh3q/vgekefeRxIpi+s6D3V+N/bZzzpPj73Rm3C8iJbPkxAdBBUkLbWR1okqV4s
	 IptKXLt6x6Th6DPupn4hRTp24QA+cKqC7fPlnChcyjr9rmOKlzVV6x0gPqsAzkvPwtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=MLXqvDMp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D331E606A323;
	Mon, 16 Nov 2026 19:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D331E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=MLXqvDMp
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.4.pengutronix.de [10.17.1.12])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C2D36202963;
	Mon, 16 Nov 2026 20:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWn0K85N+ZeqSnbsLKHm706qLEbyvRyCHmz09C8OYvg=;
	b=MLXqvDMp4Gz7ObZa6lIGo7YjqWn63OHKVBQs1DWpnV7q7eiE5n+2iSnI6uUzq7X/3Sfii9
	f6B02gf/1fNNZEBH1XTu2S6+eeApcfkLEUHnVxk9g1wS7L9okOv5tWIwfxsX84pIPLqsgf
	V5krfx0wghKsMHJ8y8tpjNZPVoZWRBhydrMxz7AMZ2E1gegyl9P064UOcXdp1I1BrgOcZH
	xxrg7E2cLxPZ98MEi3iRVnUt13Ss5g1dgXFq20rXJr9QfAQHRTsSZxNYs4TCadJZKVG9SG
	tQx8CLJfXsS3D4Aoo/nyzzqd/jvCy4bQCxePSyftZcKhqECHThaMDkUFhH00jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWn0K85N+ZeqSnbsLKHm706qLEbyvRyCHmz09C8OYvg=;
	b=PG5PB6gKkqEHOe5QDlizWEi7/3fvdUrc8dIZ89+11HnwOVQk4vLx9701i/7GIv8AvWQxUK
	8CyAyVT0i7jiki7R+yw43oFV8mn/Oz99Yra+UdorP4frj7CmqzlqkJzZueqE+zrrZ0RjNt
	6hxzvDRWcunuXKNtCR9QwoJYcUbLzusiJCm9YXUb8I1gXD/DttCf2WCgH2lkgiB5dl6KcO
	FQh0tLp/uMaOXqBZWUk3D/pfamWYPT77/HDM6imneDezhK0jHamYGK9Q7IE9GuflgJmPnH
	Fx3VHIqTkNTEdUo4hFvBbukunfHLRpm6+ySOXhLaaOYazTIOJUMVSXUi7K1WlQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856215; a=rsa-sha256;
	cv=none;
	b=Q1mwoX4BeUWmo4QfTUnoFzW3Ko3pu4M8L5hwANuzmNCObNplVhOivPaJ/cnJrKGDjzx86D
	NLT3fR8f1zX48A8aPTVRk9IPiXzVLP8vhrXEGcoqbf2lTIq6QD/7CGDDiEAObJpiBPWw7A
	Htef65R/gsx8yEwwr/fIiaX1gmYdtLuXXdWVIslThgsDDvpyUoAGz8+6NmUBhfWJgBwTyh
	2Iq1i+r5gIldFS5YGumr7BV54dyd91Q6jN7YAc3JXISED4OKlhCkFYDQ4/lqBIas25hUD6
	W2p9jvqncfqEDnGnWyC0hczJfLzvPS0185ZoPT9PJZolxk4fj+AVxM5bjq4Y3Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id AEE1E381265; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:14 +0100
Subject: [PATCH net-next v3 03/10] net: ieee8021q: clarify the tt_to_tc()
 traffic-class mapping
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
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-3-657f5fdb4db7@pengutronix.de>
References: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
In-Reply-To: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2

Document that the tt_to_tc() traffic-class numbers are the pre-computed
composition of Table I-2 (traffic type -> priority) with Table 8-5
(priority -> traffic class). Note that Table 8-5 is the mapping for
implementations without the credit-based shaper, so the helper's scope
is clear; credit-based-shaper implementations use Table 34-1/34-2
instead.

The existing kdoc cited Annex I Table I-1 as the mapping basis, but
Table I-1 only partitions traffic types into classes; it does not assign
the class numbers.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
Q: Luiz: does make htmldocs build cleanly and render the diagram?
A: No .rst under Documentation/ includes net/core/ieee8021q_helpers.c
today, so make htmldocs does not render it. scripts/kernel-doc -rst
-Wall on the file is clean, and an htmldocs build with the file added
to Documentation/networking/kapi.rst produced no new warning. Adding it
to kapi.rst will follow as a separate patch.

Changes in v3:
- No changes.

Changes in v2:
- make the mapping diagram an RST literal block (Luiz)
- call Tables 8-5 and 34-1/34-2 the recommended mappings, as 802.1Q does
- keep the Reviewed-by tags: only the kdoc wording and the diagram
  format changed
---
 net/core/ieee8021q_helpers.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/net/core/ieee8021q_helpers.c b/net/core/ieee8021q_helpers.c
index b052120e67c525ac5a45b26de4cb879a0d758d17..8fd3ea87c7bcb6d7f34a4cf5969530633edd6abb 100644
--- a/net/core/ieee8021q_helpers.c
+++ b/net/core/ieee8021q_helpers.c
@@ -13,10 +13,10 @@
 	compiletime_assert(ARRAY_SIZE(tbl) == IEEE8021Q_TT_MAX, \
 			   #tbl " size mismatch")
 
-/* The following arrays map Traffic Types (TT) to traffic classes (TC) for
- * different number of queues as shown in the example provided by
- * IEEE 802.1Q-2022 in Annex I "I.3 Traffic type to traffic class mapping" and
- * Table I-1 "Traffic type to traffic class mapping".
+/* The following arrays map a traffic type (TT) to a traffic class (TC) for
+ * each supported number of queues. The mapping is the traffic-type -> priority
+ * -> traffic-class composition documented in the ieee8021q_tt_to_tc() kdoc
+ * below, reduced for the given number of queues.
  */
 static const u8 ieee8021q_8queue_tt_tc_map[] = {
 	[IEEE8021Q_TT_BK] = 0,
@@ -85,17 +85,22 @@ static const u8 ieee8021q_1queue_tt_tc_map[] = {
 };
 
 /**
- * ieee8021q_tt_to_tc - Map IEEE 802.1Q Traffic Type to Traffic Class
- * @tt: IEEE 802.1Q Traffic Type
- * @num_queues: Number of queues
+ * ieee8021q_tt_to_tc - Map an IEEE 802.1Q traffic type to a traffic class
+ * @tt: IEEE 802.1Q traffic type
+ * @num_queues: number of traffic classes (queues) available, 1..8
  *
- * This function maps an IEEE 802.1Q Traffic Type to a Traffic Class (TC) based
- * on the number of queues configured on the NIC. The mapping is based on the
- * example provided by IEEE 802.1Q-2022 in Annex I "I.3 Traffic type to traffic
- * class mapping" and Table I-1 "Traffic type to traffic class mapping".
+ * Return the traffic-class number for @tt. It is the pre-computed composition
+ * of two IEEE 802.1Q-2022 mappings::
  *
- * Return: Traffic Class corresponding to the given Traffic Type or negative
- * value in case of error.
+ *   traffic type --[Table I-2]--> priority --[Table 8-5]--> traffic class
+ *
+ * Table 8-5 is the recommended priority-to-traffic-class mapping for
+ * implementations that do NOT support the credit-based shaper (8.6.8.2).
+ * Credit-based-shaper implementations have a different recommended mapping
+ * (Table 34-1 for SR classes A and B, or Table 34-2 for SR class B only),
+ * which this helper does not implement.
+ *
+ * Return: the traffic class, or a negative value on error.
  */
 int ieee8021q_tt_to_tc(enum ieee8021q_traffic_type tt, unsigned int num_queues)
 {

-- 
2.47.3

