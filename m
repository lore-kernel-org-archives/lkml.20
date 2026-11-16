Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856222;
	b=3gVKbleHkT9L07C4DshTDKGE7bAD/4jx3sHiGRrl332gWYSrZwviig/Lh5i/yLPQV5aa
	 woY/E2txtxSXqG/xuH4Jv8jr9yKvoaluSqYViSPElBt7E7WNBjiLCkQmuyU8xdl4FfpF9
	 LAVhePV2swsMmoDWlvzHUeVHbMrSmKNTLvWdEIWzqItb7wrNqjN03mVCa1jE4uUVDpjQ2
	 0fOY4iezplMfTo5f8TvQIWWdTw0g0y3IBx/pa7roC27WWjnqMSKbcEiL42A5tINrcrCC+
	 v7PFZWEPKEZ8FPFYjnwaWb/YH8tnICOZKLDAqAv1WoNJwVBHrc6nW1WhrdQctZpvXKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=hsDqUAO1D8l6U/LvbpHiSMYZs+O2HqscI6a/blXF0FQ=;
	b=JSy1bHtzx9g4QcF6NjuVIm9ZcQ3TFEjFefuHyPDj6r1qvYx3VbkRyeVRXv5U0gFSwejj
	 8ukN6l6CGPCfiEYz1n0m/ghcJP98X6uumLkYhrv21R/99BhstbbBG4ZKbcl32QAYsykfr
	 O9GUx+adii3XR+fsqhjXqbRdiTwYwEzR3k4YJhdjCn29E9qYXdEcNLEOSq6MAiEKVgyE+
	 kU1F7r38Eh61YUHn1IuRdNZolXNLQgksnwvvv1+ah2Sj8Ok+GLaifriQExSpbM0TySOA8
	 ljEF1cIGD0Zl9kkb9HJmsMR3dnq8nhuFAYiIV1vMl2NW3fOTpnsHD7qHhAAk81Zjrhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E0OZtB+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338C606A329;
	Mon, 16 Nov 2026 19:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D338C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E0OZtB+N
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C79AC20584B;
	Mon, 16 Nov 2026 20:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsDqUAO1D8l6U/LvbpHiSMYZs+O2HqscI6a/blXF0FQ=;
	b=E0OZtB+Nfvv9uNWiokiKpPEtZcbgJGGpBzGBrp01WR7hn48CPImAORz/4zwOjv6x+HU0Sl
	uZz/T8pl9WE1WKN5eRoqIqfNxxWqeG2zY2FtF1Y1Ulfv6cbo96Ldvm2qD+Lhai6VHlWOLS
	JQMjm3+oVFQCw5Mu1VY4gu1rcnr80R9mLrVYIq4AwunOfGsEWjifTu7OTm12exZDL92Uo0
	2jJEwI8ZxzOagM0KMRVTSd8IeRcuEhXzn4DEPJsBP7fLoC/o0grRlnyUpaiyoY5t6KSSZN
	ARXdMgNl/XJ/DhziMfRE3axB99uJD5v++QIU37K2fVKB3cUJpkCIPtTX6Q8gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsDqUAO1D8l6U/LvbpHiSMYZs+O2HqscI6a/blXF0FQ=;
	b=IHQk9jVHAMpYfZQQSPkuTv9qYdXwjkYMH2Me2TNJw3UYLFOlPZ+Y6e/Uzl/P1ZNc3nImUl
	luCvUM6TIO8xVF3SNa3GbkxqNPiZWHhl/1e4XGlub/zZrLj08hv4OxOUfOUcH3JQEnKTLZ
	HfL4+O1yGpeR2kfgXIqZxDXN79pYhIYI0HT4ssEAaURWDcorjKEIX98FyPPzU5dxdkYWIx
	tD/MbQ4GAqxKBlGW9fN0zXilZg9MaSrRpb3dkc/rIcBFfoRvBLZmaX5zEhwXZzHDx1MOw0
	eqmkbwU2IavW/XRAskBySBRcoq7UDLaGdWK/dvaYLIh8C8oKPorALI0dAEStMQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856215; a=rsa-sha256;
	cv=none;
	b=K/wwlii2NhJXdQksH5OyH7l39Y+0YKsgOB4MbHlxVJ+qPTgLP8JKXZRKy+zf9g+KfL0BmK
	7D/ioc0FiOCX940vxH3JCX/Wqubbw5jlwHuHXdDyekXImqKensKA1y6TjE7kM/bJRqG8se
	Opg3x8DdAn6iPcz8JHAq58fKtCrKabKj7i2IWL58yczXPQxK9D9YFe/EJZ6k35o/hjaa55
	fIvYTCK2uLPPLeiVfsszHWBZoX1UCsjJpk3+jPOIeL1qoiPxvOSH9lQe1XYQ7TvTIpO/Ux
	25FmNiHJ14m26XtWfwqQWWN9XceyWUDDxf9KXDM4TwzuVV59CeNPNOPyAVr9rA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id AB9AB380095; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:12 +0100
Subject: [PATCH net-next v3 01/10] net: ieee8021q: print traffic type and
 queue count with %u
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
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-1-657f5fdb4db7@pengutronix.de>
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

Switch the out-of-range diagnostic in ieee8021q_tt_to_tc() from %d to
%u. The traffic class count num_queues is an unsigned int and the
traffic type is an enumeration, so printing them as unsigned matches
their types. The print sits on the range-check error path, which still
rejects a negative traffic type; %u only changes how an out-of-range
value is rendered, not which values are rejected.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
Changes in v3:
- No changes.

Changes in v2:
- Drop the reference to a later patch from the commit message. The diff
  is unchanged, so the Reviewed-by tags are kept.
---
 net/core/ieee8021q_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/ieee8021q_helpers.c b/net/core/ieee8021q_helpers.c
index 669b357b73b2d7746e4856afdc8187cbaa4f9a6d..bbacdfff9b4c2ec14779baa79d341527fed1920c 100644
--- a/net/core/ieee8021q_helpers.c
+++ b/net/core/ieee8021q_helpers.c
@@ -99,7 +99,7 @@ static const u8 ieee8021q_1queue_tt_tc_map[] = {
 int ieee8021q_tt_to_tc(enum ieee8021q_traffic_type tt, unsigned int num_queues)
 {
 	if (tt < 0 || tt >= IEEE8021Q_TT_MAX) {
-		pr_err("Requested Traffic Type (%d) is out of range (%d)\n", tt,
+		pr_err("Requested Traffic Type (%u) is out of range (%u)\n", tt,
 		       IEEE8021Q_TT_MAX);
 		return -EINVAL;
 	}
@@ -131,7 +131,7 @@ int ieee8021q_tt_to_tc(enum ieee8021q_traffic_type tt, unsigned int num_queues)
 		return ieee8021q_1queue_tt_tc_map[tt];
 	}
 
-	pr_err("Invalid number of queues %d\n", num_queues);
+	pr_err("Invalid number of queues %u\n", num_queues);
 
 	return -EINVAL;
 }

-- 
2.47.3

