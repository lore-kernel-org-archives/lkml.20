Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816484;
	b=dvkJQWWrnl4mkwRzyLwvUUYjhk1a6xlw42tG/TbL+djF3LcI775KKxQAW1JyAjIGrJGS
	 D1agVHrCKAm9IsQ5ykag1HH4wQhLE7F4z4grEX5rqOGgrjJVwJErkh4LSRts3mMZ55F0U
	 ZDfvqMKRk5GqL/XjHJobu+S3CJSoCJaMy6tQmThGZc90YL+a6K6OyycOqEdXXQMv7jstQ
	 AtGbjzE90rfcrqAWZNDRSzoI4NhbFKaEujej82JH0v+KQJlgYSFOkikxNRsnAKauSZWCk
	 LHZHeOYyfQEL+Jp6kI8YvA8ANizAnjBgNbMpgmUY/RuDIVSVUWPhvCcNKfbiU5/3mMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
	b=N9V+ndEU0oW4pWc1XgOe3d4ujVP6uyWXBEdRlzY6pYKmGggcu6l+ZdEa2n3pXoAGIr0k
	 inrYl1P4E6PHDv8XEmfl1t0Tp1zGVy2T4Ug7FFchYsi9rsG+LGFvjdXCHBNN/HWC2IKYB
	 MSSuXbcTbG6oooqT1CCYhlRG5bfo59lVtIhjKGwcWdBdzKgq7mJiyAeQXCriZR2NZbs9E
	 rjiNXZfXbYN1qRCcoQQ334o1QUBmEE/3+q2Lag3plT21GcVEo3lRDgD4bZzzGr7ucL+W/
	 3KyBHiC7qFqkpbaATZcjpOKwDXwXsSgN8GLUkxGRrKVcVZlYqgb6GBQNzaWl3QIzlwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+cJhG4b;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9860A2617
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B9860A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+cJhG4b
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e47347279so630177f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816482; x=1794421282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
        b=G+cJhG4bvR6+Z+oY8S4RJlEN38IG1EGgaF8mSO5/bCTCqWATVsH+4Y1VZGtcuLRjMk
         VAFY+p/LPm43GaDRFhaqT+bL9cc5Jte+JSMCUNHxmogmCbkJMi533Q3QF07rFa+eR3C5
         3PWz3vYqfDX15L8ZdXL0oAETyLZj2WU9Cxzxpi7YJGR8slBt8rBqn2m/JXVXVbzZxAW8
         Wpb3HqBbwy670/5bgPUsSOOXWR/9wcNWZctApoIgpEW6rA5gtzwotyW6S9Gsn8TOwdMQ
         gwRXdgmEGQXbCKkelU52x4emvfJjeRi07OAnOnUcqD0bdTy/crxb1V5NoX1rZ3KXk2FG
         sQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816482; x=1794421282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
        b=XquJYocA26Y3UctmKUcGf9rmo0fX9oPlI1ByXiNTaSWci5Q37MIlGkKph1HmjmxC1Z
         zU/be1ZZxRqURvIgeLcjqkIgbkyeCE+l00qsMNcipVnmtsLU/rXd7r2LNEYynqd+Cc+Y
         UmuJrwucdty6zN55bg2EmMjd2H/N/2r2SPsGfyTBYXkugwrUepcQrpJx0Wv2co0qSReU
         t1Ab2T973aGnt+BGHQ+RJb+xacX7qKDrtng6m/hmf6OB+/gd8DMyP6ZmBQxQu3hmNxh6
         RBFJpnuiFEU0A027CG/4v/EbxqOxjzv9qkDozoLMy08nWRl2UxqklxuGq/f6iMR4hVJS
         NPLQ==
X-Forwarded-Encrypted: i=1; AKwUvByfUxz8uHM2k8/kFvPwwmdTW72U4cXc07TPe0bfzP6px0XEJtjdKes+lGdQDbS6Oa1TlGtcKSXgTv7x7dQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hkawgktWCMW+NPxEMQQZWNs9o8OQZXWBVucwkeo4r/qappJ69
	OP18dRHy8e5vwNDGAJVIk6RCIYOWXMOw4IXKQ2Y90bcGfAuqpYxXnu5v
X-Gm-Gg: AYBFou03T+PoL2lEk+x5aTyOn25eMnfAkmhZMyTd66jKRn2BqxPtZdEzfrVhhiJe36Z
	0w0RC+oWQHOApHFQD1N4J6dMhrV1D0MhqwfaCM3q4X/pGZGaEZiD1oMyGKrJueavwstbUzj3nb7
	cTdfXC6pa+ALC4s2nPrfU0CZ8Vk+GoHD8NF0eEKHJZ7C5ob8Mgq4c4XurSe1GIdNJ803vOPqWVA
	f10UeQ1sFAYk2O5SObtyalMd/4NdwMPaS5K+9coKDuRqSBDOMrFfzcF3vT9hJt/I2eea4veqOTn
	yMuiaR0+CO59TTHOy/xWoZTLJ26yvd/Qh62L0OwjKm2Kkev7WZaKaQ/txfvFg8MYFlmQpypSGaA
	Iu7j/UjdIJ4MY7B+Qu/b3LO/W917FrVhtKPqjqiwUUth8sJwR/fnY8PW7BOkOtmYik/jy+3CYN5
	2fVDeriO7V1Nnz6A6m99xk4JQCNZjx+k2KKK+gO26XQbbvUZ5RhVdY1IeDArK0SK0dBnHd4XRlj
	8TNkrvH/Jlx6PDZdMCio2CIoewrYTL2RM2lyI8MIcEyNOH+jzEys6thkmsetFJa1s+jYwYrqjNF
	Ccn9xS8MkGAVb/YIb3MSWFRCcA8JZSMsUlwkARYWbnAemmzuukDSnEUkbGkuwp2Rjh5dB04w33h
	m1bzcfSow6JQ77XwLztal685JX3sjEy/FwEaqyw==
X-Received: by 2002:a05:6000:e89:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e6e4fac5bmr27612625f8f.43.1793816482340;
        Wed, 04 Nov 2026 10:21:22 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 11/14] net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible string
Date: Wed,  4 Nov 2026 18:20:59 +0000
Message-ID: <20261104182105.1102555-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the A5PSW driver for forthcoming RZ/T2H ETHSW support by making
the DSA tag protocol selectable through SoC match data. The RZ/N1 A5PSW
and RZ/T2H ETHSW share the same tagged frame layout, but interpret the
ControlData field differently, so the tag protocol cannot remain fixed.

The common tagged frame structure is:

  +----------------------+-------------------------------+
  | Field                | Size (octets)                 |
  +----------------------+-------------------------------+
  | Preamble             | 7                             |
  | SFD                  | 1                             |
  | Destination Address  | 6                             |
  | Source Address       | 6                             |
  | ControlTag (0xE001)  | 2                             |
  | ControlData          | 2                             |
  | ControlData2         | 4 (timestamp, portmask)       |
  | Type/Length          | 2                             |
  | Payload              | 0..1500 / 0..9000             |
  | Pad                  | 0..42                         |
  | FCS                  | 4                             |
  +----------------------+-------------------------------+

The ControlData semantics diverge between the two switch families:

  +---------+----------------------------------------------+
  | SoC     | ControlData bits                             |
  +---------+----------------------------------------------+
  | RZ/N1   | [0-3]: ingress port                          |
  |         | [4-15]: reserved                             |
  +---------+----------------------------------------------+
  | RZ/T2H  | [0-3]: ingress port                          |
  |         | [4]: timestamp timer select                  |
  |         | [5]: reserved                                |
  |         | [6]: RED period indicator                    |
  |         | [7-15]: reserved                             |
  +---------+----------------------------------------------+

Because these differences affect protocol semantics, select the tag
format through compatible specific data. This allows the driver to
choose the appropriate tagging protocol for each SoC while preserving
the existing RZ/N1 behaviour.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 5 ++++-
 drivers/net/dsa/rzn1_a5psw.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index ee0187aae2bd..f8fe6f3b8e12 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -97,7 +97,9 @@ static enum dsa_tag_protocol a5psw_get_tag_protocol(struct dsa_switch *ds,
 						    int port,
 						    enum dsa_tag_protocol mp)
 {
-	return DSA_TAG_PROTO_RZN1_A5PSW;
+	struct a5psw *a5psw = ds->priv;
+
+	return a5psw->of_data->tag_proto;
 }
 
 static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
@@ -1324,6 +1326,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
 	.cpu_port = 4,
+	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 197ff5916578..e952afd95dca 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -236,11 +236,13 @@ union lk_data {
  * @nports: Number of ports in the switch
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
+ * @tag_proto: DSA tag protocol used by the switch
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
+	enum dsa_tag_protocol tag_proto;
 };
 
 /**
-- 
2.56.0

