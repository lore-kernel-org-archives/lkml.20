Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816486;
	b=heyxUXjDT1yeVqqyH8mMbMPksiiOx8fpfbElNjSIKrpbl+N2X6dn3ISSXkehDYorhz7X
	 cHHrIKDAoxMTTzl0TE8lsHnvgVMAORyG4ReQO1WPTswTX3ue3kyuyk98g2LTU6HB0umBd
	 YcyK0iXHhFJ5ifH93DClt+cAxZmnJBo+dYNGydcyOSjRnG06YN82UQpQSY/DFWZcvclJf
	 O5D+zSspSRRcNVL3YmI69IObaT3iwOnehQlxJmv3R4JjpNaJIVUfgGPDMiBV7sa59+fqH
	 Vrrr5mK+T1YS5SIPd3yCN2J0sJw/LnJ83TIKqUoT9pP8AQFwodcwFz69rlzZjgg3FAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
	b=KrOs8w/1vPY98+nNWgJK9pjypD3B2GEvKboJ5dtZVFFf38t2g7C1nG47duhfnGnQPvpA
	 55IdmXJnvp/b21JCoOPHw4JUL0e/Pwdz5P7RHfovltxx/1GiD0kqSBA3FOaK8mxp2fO8U
	 TQlNSoywAJpxrIPWlAvljUuSZa21U4/BrS88F7IjId5kXRAJ92d5MSj+I38gHcZS4Q6qz
	 hu7T6mpLmg/LiYaM0P6MPF/XOF1Ww6Vb9sRrmpdgonSo+1ElIVITowA0qiBt+MV1I1dTF
	 mxQ+8nmxAdE+IhGvpbGVOB4IEbBkl7zzAPiut9+Tk/+8+mfh6xar4PTjNGkOVnWWh/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2cgLMeZ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC160A3838
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93AC160A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2cgLMeZ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8622085e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816484; x=1794421284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
        b=V2cgLMeZZt/RrMcjTOPGqIFR5x+T3e9ZJqAFvwV+Kd+/sgH/TECjzHHEh3Wqg8Dtmg
         vUUWzch3y2voBzpfsFrZxLTCJJI8ZLp5kTwvjniMN2FqbHDnytOWQISIevoo+hhVWA+B
         xKM0s6gVt87TUmdYMkgMES0yiA5T0PU8Mz+Wi0JbAbvhSfj7hLtS61j64zaMhJwk7so2
         ILfWWDGRbLoaJBXVqIXwETLwer6IX/mtY6FETllRw9lUcnd5ezevvx/AQIwub/s/G2rk
         OFB6/B6sA+DZCt67zT3bDZTIBu2eexm2vmJ1aVzM5KKGk4BTwBYXF/XYgoUpo3rPcvEl
         hTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816484; x=1794421284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
        b=zYStWbDkeKMZqYTyl7Ll0A2OueiiRjvOirdMJVBg61bJrw0yZb4EenoJn8vNFxD+g0
         Oh4UdMSC0RjnF4Vu8ktnNbc6fPedP3IjmTi0bTIAgoznkFX2Z5E3K+q9OFSJQJTIfMzr
         3gawMQQAYCjNe3VmpbgArkzjcCyrOoN9pl9+9N4FJEUIUMdUVMvnwqd2wzo8a2LngmoU
         YGfFAe4B1h0Is+xf1OyVW9AQyd+VKAQ4NKYG3Wia1jN6uRzRpjhKu+Pg+xxYFexK12V+
         Y8GB65aOX8GmLlIH4PwL26OqbZDBFg7T9OyEkBPkj55TwJiAL3QO+4CObxTBP1+yxypw
         eE5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0kBtB3S+8oUAdW/Rjo9Zi/2819aFQRWji9A6c/DhwVyOMoXn5UCqUPDnyH7Yf+Yr6XkNLs3U9+TMqFUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D2vzDomf5pFHl8hJNAoMZv/CXBMft5fV63goXv9OhdZSl0qwn
	GDJuBJqOwrv6eoi+c9YPptpPnvDHpJMBRhaJB68mG0w+P5BrS/qI7QCA
X-Gm-Gg: AYBFou38ZpynM1DLl4KRi86k3bAOzMLslelkHE5LA716+GIssMFjIC1INt/cqYKVht7
	IP9TXxbf3RetZoux+uoamHOCIP6SFAL66i4xhfdRv9zPQ3jh9+TvFHDNXX6pZoWzDkqUHJYL0aP
	uADHGD/e84KEZfEOooq9VhGAQC7AmUlz/tSqIqqz7p5Lw2IVNXceqcdGikobkpg/HiztJdAzhW8
	/Qwm/05ys2qIDHL7Bb7m4Zj65iooitepK/ztHSHXsxrqS0DNlI1ZMmRddZXwtiYsonTq/Autbmt
	E5BDrodw3nRWF8sOEHCInuGzzfXoiOL8UNnECuNw589uL3wEEvaQ7vEaTj6VNO+9+z5qztcLr47
	vmG8UCFAahA4nSO85YPNYre8FamiAMXKBGQsMxAEg+PtiNwbskF8H947XqQpnU7W+El5Rq3bgtZ
	Iqvg4BNX48MddQtapapiDVAHC12w83yUmfQpdVwAQGHnxQ306cC9XntGWnekbnsMz29cxLgo0OC
	ZXnhtxZpeLRCRSIr7M8pb+KcfzkHkI7bt/5kxlGBTiTbDxQfTNjFrIilS/DrK5LmGG91gX1hMhM
	UZfCz7K3u8yTZlbzNQ25q+HW+gV8osgJCm4ae0zBUdeUbbfJQr+0J9QngGPu11aoi4kGycIoUEN
	hoxx4hujx6EPUTNJ0eV38sAE7ePh0iAD8Rq9jJw==
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr373949755e9.31.1793816484012;
        Wed, 04 Nov 2026 10:21:24 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:23 -0800 (PST)
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
Subject: [PATCH net-next v4 13/14] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Wed,  4 Nov 2026 18:21:01 +0000
Message-ID: <20261104182105.1102555-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add device tree match data and configuration for the Renesas RZ/T2H
SoC Ethernet switch. The RZ/T2H uses the same A5PSW switch IP as RZ/N1
but with four ports, the DSA tagging protocol `DSA_TAG_PROTO_RZT2H_ETHSW`,
and an additional 8-byte management port frame length adjustment.

This prepares the driver to handle RZ/T2H and compatible RZ/N2H
Ethernet switch instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index f3eb8646dea5..66b155686474 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1338,6 +1338,14 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzt2h_of_data = {
+	.nports = 4,
+	.npcs = 3,
+	.cpu_port = 3,
+	.tag_proto = DSA_TAG_PROTO_RZT2H_ETHSW,
+	.management_port_fixed_frame_len = 0x3fff,
+};
+
 static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
@@ -1346,6 +1354,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-ethsw", .data = &rzt2h_of_data },
 	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
-- 
2.56.0

