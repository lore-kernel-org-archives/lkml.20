Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E45158A1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983959; cv=none; b=cLyo8jBiqP3ci2LGvQbQBPVAR7pJrt95vftL+90Wih5qz8KJmY+O26PnlpOK516UcQ+Zbs7AYw3igSeJw53qM/Wfzd0+P6J51CgWUE/9tm+qNKen8kXtQoFMs5in637SnZhHFwoJxiju52M8kbeakgComyciE3e/6RgyDYVOo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983959; c=relaxed/simple;
	bh=S1FPZunortoUUsoWUiazxOo3fd040dvbtTBwMQS+1jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5CdnVT7WO2xJ4MyZYX+/H569kYyryT0L5usI0jags/VKSlA/c9zgJ9Y599BJSeQsuaZCtN89Z9lnrAKo+cO63psgoDC6cBO8EGIYbIZMJFAK51uYAIpvKSW9LDC0r8vbqyzh443Rlmyn44WHk6eHumH83I3q+yghdWijmB8MFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pX6+KRDf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pX6+KRDf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a02718da81so33028125e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983954; x=1792588754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhSoCSfmAQV+RF8pzqx0Qx3v6sPVIiJFHvGuJT7AMu8=;
        b=pX6+KRDf5aSx87914t9lAuN4bMoxSBKBCcxpl0XyWU31yECgrGsbroh9MyS3p2OikP
         9Ys4enwwtHtOzHQr9+Xzc3R9Kko49Gyjw9dxPpMH+VQjdzS3WAnAPuQvBySyCp976D3H
         ys4pq+9IrwJxAqvsPoUe2nBqMRVEUTWaYu4hG2UbvnFp21sTZbL71mIIE+jRHH8Hum3I
         HqiNg4LsP6rXWkey7fjzLJIj3xBv2xpfggAhc6x0+HRe/xbHs+dTfIk8gq2S1NlNCJFG
         D+jmYdhWzEOxZg5wDfGcSR9eI9W/GV62NHSrEryfC+LjIsoqgdmue3wyjkmzf9/AaNMW
         LQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983954; x=1792588754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhSoCSfmAQV+RF8pzqx0Qx3v6sPVIiJFHvGuJT7AMu8=;
        b=kWRVvRvy46MJTntLKMYNU5pkSJUAe0JOgVBA/fbm1BZ7wBsLlVM9JwIqf/QhJyy3qK
         UgPtRjKaObx0HHwUKZEkXexS8kr7Je8oFrk+4sqvGALUBsm/h58OxPibWw2hfwQxFKWP
         6mi6/pXVU+Q5J6tBqZ3adjDgdw2luSpTmBV1KRn68TH4sd9PRUtFex/rwmAbm5UVkoOQ
         5F79FUTpmCduxT2gMjGQjT/gW5kjW1aEdAB4M9SKP7z8rH62DCx3MoSBJQlaPen0uNCq
         J2lvHobGeFeh28g3D+lTBwubKVjYBA3KWxySW6WY0vcqpDo0k/pHbp459ozGHeuprP9d
         Pnkg==
X-Forwarded-Encrypted: i=1; AKwUvByKkoZ+/IMClQDqPWNfNp1ZXakXr+qzkqBNZhY6FpxZ07GUj3xpjnHA4kFZLJQU3m18TAdQG1zJARiPBlY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJznn72jC9N/cCn3FxSfxonAZzl7kt1Nzqjcjs4Cot5gqY1izA
	JTNoYIQahwjxDbHROoWDjNUUexItQ0O/MvOgjl/XmrhMEGxOOH3NMVo3
X-Gm-Gg: AYBFou21lTQJHMrZxj1FtO962HRTp1vJA8+v350+yZF+k4avwgx8CA9TdolaDzd6Ta0
	489J8JkKYDtWzAlFmGmTd2EeIKJw+vat63vVjcXXDlVDZsLruDYHMKiDQCQhs47SJjTBN2/xjXf
	/yCUkIhvpFfcPHyxHXIImYMQpz13EGkfnrQYVSFWa7cYLRPiE9uzSkWY22tqerHZaMR04HS+xkO
	8uC2TVQVdtrzjfiC+yMTy2C303gtkR3vkeqEze6HFGtgt/1JzC3Nv/MAk+03K+djpbSCq2mfDRT
	SMvY71GCUd9qQEPPFdl8cOgVjh0nZmMvQR+dysY7CP7K2ZsXhfasNE/pVdjjqUiIKCuOMaYkqeV
	lDvjze7+E65M988U4INfZaAarQko4H0SABkp401+M91mDwDI87lFhH3knZgv6/DAafgbcX7Zrz/
	Q6PgGAnMiNIIEY71oJZKiOVAlQ0jVUbNHZ0Z8wMhdfKegCEgDfjRQdstCLaFHAAgaG5uK5U6JBC
	go+1t8raSFnah/Vb3Dh9H4nsF0PcfOLuCIA2fQR4Rj/CDU7jbVsHjeCQszpRgaFsynKWm7U61c8
	qsPM0tQRuJAilJtXDqJTSnIBMFYjAQ==
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a18e4a003cmr314676615e9.11.1791983953700;
        Wed, 14 Oct 2026 06:19:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
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
Subject: [PATCH net-next v3 02/13] net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support
Date: Wed, 14 Oct 2026 14:18:50 +0100
Message-ID: <20261014131906.990077-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a distinct DSA tag protocol for the RZ/T2H ETHSW to separate its
semantics from the RZ/N1 A5PSW, even though both use the same tagged
frame structure. The on wire layout is identical, but the ControlData
bit assignments differ between the two switch families.

The common tagged frame format is:

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

The differences arise in the ControlData interpretation:

  ControlData field (bits):
    +---------+-----------------------------+
    | SoC     | Meaning                     |
    +---------+-----------------------------+
    | RZ/N1   | [0-3]: ingress port         |
    |         | [4-15]: reserved            |
    +---------+-----------------------------+
    | RZ/T2H  | [0-3]: ingress port         |
    |         | [4]: timestamp timer select |
    |         | [5]: reserved               |
    |         | [6]: RED period indicator   |
    |         | [7-15]: reserved            |
    +---------+-----------------------------+

Because these semantics diverge, register a new
DSA_TAG_PROTO_RZT2H_ETHSW protocol and corresponding tag driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Updated commit message
---
 include/net/dsa.h             |  2 ++
 include/uapi/linux/if_ether.h |  2 +-
 net/dsa/tag_rzn1_a5psw.c      | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..57143cf52f89 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -62,6 +62,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_KSZ8463_VALUE		34
 #define DSA_TAG_PROTO_MT7628_VALUE		35
 #define DSA_TAG_PROTO_KS8995_VALUE		36
+#define DSA_TAG_PROTO_RZT2H_ETHSW_VALUE		37
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -101,6 +102,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ8463		= DSA_TAG_PROTO_KSZ8463_VALUE,
 	DSA_TAG_PROTO_MT7628		= DSA_TAG_PROTO_MT7628_VALUE,
 	DSA_TAG_PROTO_KS8995		= DSA_TAG_PROTO_KS8995_VALUE,
+	DSA_TAG_PROTO_RZT2H_ETHSW	= DSA_TAG_PROTO_RZT2H_ETHSW_VALUE,
 };
 
 struct dsa_switch;
diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
index 1ffac52c39df..9fd25c5d96c9 100644
--- a/include/uapi/linux/if_ether.h
+++ b/include/uapi/linux/if_ether.h
@@ -121,7 +121,7 @@
 #define ETH_P_YT921X	0x9988		/* Motorcomm YT921x DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_EDSA	0xDADA		/* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_DSA_8021Q	0xDADB		/* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
-#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
+#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW/ETHSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_IFE	0xED3E		/* ForCES inter-FE LFB type */
 #define ETH_P_AF_IUCV   0xFBFB		/* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_NXP_NETC  0xFD3A		/* NXP NETC DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index aab0ec143c77..3dff661fa58c 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -23,6 +23,7 @@
  */
 
 #define A5PSW_NAME			"a5psw"
+#define ETHSW_NAME			"ethsw"
 
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
@@ -111,8 +112,24 @@ static const struct dsa_device_ops a5psw_netdev_ops = {
 	.rcv	= a5psw_tag_rcv,
 	.needed_headroom = A5PSW_TAG_LEN,
 };
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
+DSA_TAG_DRIVER(a5psw_netdev_ops);
+
+static const struct dsa_device_ops ethsw_netdev_ops = {
+	.name	= ETHSW_NAME,
+	.proto	= DSA_TAG_PROTO_RZT2H_ETHSW,
+	.xmit	= a5psw_tag_xmit,
+	.rcv	= a5psw_tag_rcv,
+	.needed_headroom = A5PSW_TAG_LEN,
+};
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RZT2H_ETHSW, ETHSW_NAME);
+DSA_TAG_DRIVER(ethsw_netdev_ops);
+
+static struct dsa_tag_driver *dsa_tag_driver_array[] = {
+	&DSA_TAG_DRIVER_NAME(a5psw_netdev_ops),
+	&DSA_TAG_DRIVER_NAME(ethsw_netdev_ops),
+};
+module_dsa_tag_drivers(dsa_tag_driver_array);
 
 MODULE_DESCRIPTION("DSA tag driver for Renesas RZ/N1 A5PSW switch");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
-module_dsa_tag_driver(a5psw_netdev_ops);
-- 
2.55.0

