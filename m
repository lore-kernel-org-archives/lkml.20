Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298702;
	b=3URBVSdWH1R3ypB7IY2I5iiAwng/DIyK3tihYyuj76Pbo7EhZl8rfF4jVaKKhdNLX5nd
	 FRLqNt7+D2yKQE4L/W1Fg/8UtUZ0B+Vu/4mw3bIbmVtCOMF+9ir8EkfAr8GC6M+LvoQKH
	 eKUKheGq82gdzG/Xi++lRkRVruQliRicmjwDoWHdiOjA5AWxhCRrjMysvhXpBZcMrvSG3
	 DRohdoZeEBqjmbj4WcuLAtHk7f3DTQuW9nlTq+y4ioHC4iThttC84fEsZ0vCywfTltqW/
	 9TWN/uJOsr+Q0KQXu1AqyShoQRScivdGjDWqIoA9f4G5lVRgh99ERVA8mQUAz/78J4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=;
	b=wp8HqZEh8o85QRW/MjP0fsLJ3tVhBTdQaTGrZsBNKjSKQbCwZy9T8BGMxedOQH3I/D8W
	 cYqvNM2AVkA2t04wt3IDxUU5Vtu/BfQmtE3ZbXzTiX4CjERWwHw0lgy9IhSCWvtKE6i5y
	 pD2araRCGHpoY8AMwF4VMe9EDBSzYRNU4verhnmuW/mJHurFOuqzFjHTD84EHH4bTBtLu
	 ppg6iZdvpp1wyWsW0732/eSsKO3kbqZFahiWOevYC7aXL2xXx1FIMNVlv6r690FyAcW5Q
	 ezPH55jT1MfuHUOZc7tsyV8KMA9QMTIEH2kQxDZKtb6eNX9aX+V6+B+y3aJDLsIQiJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtXK7Vl8;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D67C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D67C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtXK7Vl8
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35159e0092aso171575eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298701; x=1794903501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=;
        b=AtXK7Vl8nD1YpvHfshGLN79X3lT79XsqmgtfrkX89gAdkL9drQysNO1yxzT+P91UdA
         LihdS4X2wUZ4+K1LkyXgDyT+u86nFJLuM9xsxZIW1nEn24COMkhKsj5RNHQSkfBl1+Ar
         o5ygjyP6WspOqZX6h9fkeTdayXW6/cuU9JTE2B3IpbsVVgxFI7GrvJ+KB9gw9dEB7Ho3
         A9xxIWAs4cR8b5qVqK+1ACKadQ7QRkYhrMUFaE4PK47oE/AiHRMs/DOH72CidfvOHhvf
         g29W7/RWLNvwyfSlDWC3mypGJcNshesUEK0Mtrl2OjgzmDA+btTxqm9A4w36/vPmSBqR
         QRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298701; x=1794903501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=;
        b=TJd0K5TnlJ6b7posf6Tlsb5DeU5EfIAcLh+/E8HiV9mnxL5Z6Q7sTi8hIPt4aU0lOZ
         UpqQeAxt5+l3ZiFbtkgHzZwIl/dtcQKB6sp733AG0r13TGFjFWZcEB+rHSNZgle7yJ8f
         /pYgQ2ETn313ObsLXvgLMd8ET9XTCGzPw9eRAVvFQYEMMeLwkf6FNcikXWGNOgC9feHg
         UxvhKHK44PGKaQp1MdBHAVViAU1ZP9VbrBtx5Q831H0vnn78k5dnIS2FyeSBw7Auvf+e
         xtTVsL+ZRjF5OyX8dyFcznusOUQt4d0MsqBbvpSceR2NTP+sv1ZyVHZHwd+jPxYYI3f5
         QWSg==
X-Forwarded-Encrypted: i=1; AL+hErF1XG4IFmhL1ktFpwV6FPqExOIechI4VPLs/Cg+uM6AHeTADu8zu32ubKbU5PMaE+k7ZeqJdk84/9qQByc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q7Hchy5/EenS8JJcCR9ST7LQKaP1k/nHFIWYKpjcE2E3JRQ0O
	EG9cEWItLVZX09/Hmsn5EkEzw+kvJ6HgG4wFmyMlEyAlUd1IX883CwJB
X-Gm-Gg: AYBFou07BiHIBnL4MfgmLFqPYfzDPJb57ot9Wug7CMPK0xGHUONRqC9pK/SN4qPYXhU
	+XMPGl4gakwQDEM2Z6CCRnKUtd1anmIkjGBsDlaDMuaDo5N2PrMe1LNeHNH322ATtnpREFgi2uq
	WbSBqLUqxiUGYv9xZ6z8yk1Aa9JHsAXs3txbr7hG9wX+Qa8cxYFN1I767b9Z/rIq50sUtTODZq0
	7JP0MS8J95xPyS404exKPkgk1Uoydb0xjz8qv8gJiCzzKTRElw6QO9LrDgZRw6JYv3a/ElYhZGz
	Uz7fEmO2r9DFWyZVDtIt61CynG8cR65vNsQXQmqm4LmPVnbgJDcbCtHCA9RLnkP+DvFLsNuhz+d
	pD6842UeQ9EjqUUkKsr60pjelDAvgQwntBZuZrOTOQrbS2zFh43oOnAh2ngpbyEgCYmQWYFZp+b
	Csh7aKY7Gu647RUc9cfnvK8f76PahrGU1iZrGbi4ZYspi8YSmWea91NoKh5LbmPW/G6y+C6y0h0
	Z0seoAr6zQcuUh9TVZi8v3mbvca/5Njlb4xbaFhUHUAnS5tBiAfYVKQIjl2yQiRJKMt6l3N8nCw
	UX6cwjp3gcJX1jOApXTkv/jdjB4Rmujqgea18PHFncTm4uieqQsm6ebfar9e
X-Received: by 2002:a05:701b:21d3:20b0:144:fd17:3b21 with SMTP id a92af1059eb24-1b3b5bc50c3mr3885712c88.0.1794298700740;
        Tue, 10 Nov 2026 00:18:20 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:20 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:04 +0800
Subject: [PATCH v6 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
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
Message-Id: <20261110-dcphy-rx-v1-v6-1-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=1290;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=boFp+ROAJs+hn528tIchPlOUGZl+pUW4spq3YalZAuQ=;
 b=2Om6akpYt4IeVtY/W3aZ9CiVBUWzCN2RjS/mjsi+pChJrq9agUeJiKjz+mS39Et2p8MKNQOFe
 a8COwdPb0ThCDXpwhBehkJTJFZtzG3JqdNkYva+Xa8x2FSzw82cXcnb
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0

