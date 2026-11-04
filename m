Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816486;
	b=J9Io236yhxM29rCu3s2l+B7DRhz1kj8o7e6EDCRraHP2X7OXiEC1XFGaMsBHiNMo2dyD
	 UwHLBKA63x1pLY0dU5wjZWZmgUANiuUtET5nmQ2DHEI0KGKywEt3tYiXCVKmj6YDuD2WJ
	 jqAgbzNzi6ATS9kDyCIG38OlmdUkr/dC/iNe7sRLv8QwU49tbcWg4CAaPkrsiWilMpTTS
	 8SEWQD1wZ9Oh0xWJeR3RFX7Xkl0NQXJE5w1ATR9/vLD/qcm/VDzpck2mb+Kd6H5VG15UO
	 fVCxHmx63CuxOBj4Jviz0uncUzNBsoiWtUbS+rUQw67C9bVFrYlgooUATHItXHty7fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aTDvp/Q0M0o5LAma9UuHl2ioDRXCh/2jQrBcsrQNRLI=;
	b=1zZVwlvwTdsynXrhOw7C5aly82tTmuXDd4ZLZyZnuTqnFwsvyrolNwMZRgBIcv4p7Hjv
	 jDZhgP4+Jx2JclkwNtqajSqR+g2YeOENvr+3DVuEK0NroYBrne5YBrJRSldo+juREXh/D
	 7+0d06189KEOjSi9+5O2rPjW1trh9o8R1bVfzn+mwZD12vwup/gnDvSlUvGTAwul03Igy
	 9BZ053VqptWld7HNMYbCFncJ9/4DeFMKDkYi5RupoJw2D7W4G8LnQuHlJJLs1KieUrO4K
	 KX9QyRn9bC8duyZZhy/G2GlkXsexp2bkuqd2FSGBqzqqaN0b0c696PJ5waEA5pmU6QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRNKux8j;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8390660A6F45
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8390660A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRNKux8j
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso505066f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816485; x=1794421285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTDvp/Q0M0o5LAma9UuHl2ioDRXCh/2jQrBcsrQNRLI=;
        b=aRNKux8jXMUGWHWagH10tnaFubvYY/cvfOC258fy0pVp0hcDXzySw/Q6YXq9semX30
         farQ9acn5oTFCbz1nQL+p/mcyFEYgrwgN5EvIVBNM71OgHEeF1zic8TstmtsCVUGPmJt
         svvzBkSOKPQlpOjEA/yBPnevN7N4NF7wBRjNZ1Zp8UNyUZRom8veuAMr/CkVFaneuGp4
         +M0dgse9SXLkSvVQNLQPEmLpXsXnEpd+P1McqG+XoZhCaKxL4P989KsnwcMm8oylWep8
         e32kq2zNveMI520KnbsIi5VuE6ZaIFO8ItsZWsNrPQZSO1WSM24gLV/gsz/cuJyQsZK8
         2L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816485; x=1794421285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTDvp/Q0M0o5LAma9UuHl2ioDRXCh/2jQrBcsrQNRLI=;
        b=WfO4KweBwQhKEbuGlE+/4GYAOr4dUc0BmBjAkngXuAcYUXxLFbrU6o/gSrpEsf9zeE
         k1bIvug1cgOBZYqBtI4mQ+Cm30PGapFdItlDCQFe9zhuNv7/YWSDuCFR/jImiUKsXHiH
         Ifbqq8PqNiSWlCBbPdyL6vi47hDy2triyeQ/EOTago/zTsnMUZ2WuVgul0dnHB5mhX2B
         ciEGPyn0ryBDpISIrUfFv8qnRkI/XG6gzi6LY3MBLZEQ62s2/x1srptTOaaQHrJj43do
         P2fHl1eO6FpR1/NfdYw+VhnwFW/IM/nHU0TU4T2J55VE+vuiXRlUwL7XPoAVzz/O2cFY
         V83A==
X-Forwarded-Encrypted: i=1; AKwUvBw9nelerqxzfJ/nPd45uTW9q/3DNTS3Wr6DhmSCq2zQCtkVWSB3eeAsEesRG9UNHV0U8Ii1SbwVpGLfDsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mo8H7cmmXZUo/arlKXgLFAHoy3Cb7hDnvLZDJYmfPP8BIgk/x
	Vn/99JRwUOj9cBEdIZm2VqXKCz77EAoOX9kI52qYfDQoMg9JHeihyosv
X-Gm-Gg: AYBFou0yHNTNEDgDp23qezTSlx4DDCUTFhqvzW1l8ubSJvNJvz3W6TOiF9jPP1Vzbwy
	UTfp7ix2M7HObM3Cho9iCnaM+cOTTMWLfO6WFeNawQ6dJx4J7JHdsHZ3zRpyQGh5TdoCQPZMEge
	BfT5uL5QvrM1PI3+5FNxxP8lAENZl6hI7d/J0zSoL8jOH0ibP2Hdz2YjOD4pkcFiAbXDvw194yh
	aByZmxE5qPFmu4yLJAv/6mnX0KAQkPEz3rqYbxXEC15WUkS9CiAyfY1SQsoJsEBFmfpglMriado
	vfxoUHRBa619s/XgU0TDyJ9gj4gUZUGMuX4ufEQ7BRVhoPiD0bq8DHfvKYccvI6aRJS+8geEDkg
	C0/b09TMEs+87oKa2bA4IHe3I89hECjTZn/hui8WfrQwNXRi2RSNai57V3WoJn9djFwTP1OB2xL
	93z5dwisIFq07E3NSNL9eBqGUsDlS69By4kNC4NubC+MTMkBvz3XlWV/xWRrqrikGvcTwNhPUFz
	2f9LBgq98bNMCrc9nOZEN4TuzO+TCKyTgH05PTVZIsOS2pV8X/TT1jNyoGJW9lhVmyHYXYwrF93
	32blqZxlPlbWhl/E/ogLMoqMSMYrHVmDl2u4f2wTAnG2D0M1YMJvu5FJa2v1oC01mBhRqLoF71d
	kGG1C9qjNg5YdcuOmOxGSPNZyl/EDp31i1jCCqQ==
X-Received: by 2002:a05:6000:46ca:b0:48d:f541:a6e7 with SMTP id ffacd0b85a97d-48e6e4f4976mr26708137f8f.40.1793816484784;
        Wed, 04 Nov 2026 10:21:24 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:24 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v4 14/14] net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs
Date: Wed,  4 Nov 2026 18:21:02 +0000
Message-ID: <20261104182105.1102555-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the Renesas RZ/N1 A5PSW Ethernet switch
driver to depend on ARCH_RENESAS instead of ARCH_RZN1. This allows
the driver to be built for other Renesas SoCs that integrate a similar
Ethernet switch IP, such as RZ/T2H and RZ/N2H.

Also update the help text and prompt to reflect support for the ETHSW
variant used on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 drivers/net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index fe8cd5338fda..f6894495b9ed 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -101,13 +101,14 @@ source "drivers/net/dsa/xrs700x/Kconfig"
 source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
-	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW Ethernet switch support"
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-	  This driver supports the A5PSW switch, which is embedded in Renesas
-	  RZ/N1 SoC.
+	  This driver supports the Advanced 5-Port Switch (A5PSW) found on
+	  Renesas RZ/N1 SoCs, and the Ethernet Switch (ETHSW) found on
+	  Renesas RZ/T2H and RZ/N2H SoCs.
 
 config NET_DSA_KS8995
 	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
-- 
2.56.0

