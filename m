Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956138;
	b=xL292KHskg+fBemhqXsRI0YRSoKXFGxhLICeYTjLJQirmu5hWM4pWV19W1W7IIgWnlo1
	 scKXXATnsyT5c/dxL8u/U27Urk1HPr95DBJODUeH4DIZ/C5YRGvU2+3yf9CFtzVYUjWDf
	 R8oNTbVM/NUnWyf+aFFugGglcYg2bdC+WsL+rCSqkZS1aCnPvofJTiydthXq5mA/cVVvW
	 yEeM1DA+3FqI2Ewotd0dBmzGBZqxXcaGhfkN82BN04H8QAxv5gQgaFhlAwDAAgF1d9ZW/
	 M93MEeXB/guHAIi31MUBRuFQDqxZjoT+LV8am1YfWUTDAT1iRFeA/adDxf3BKWCwLrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956138;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=ndUblt3nJlZZl1MwBVzDwhzSLV3QQxoKhFCgCQeYDIA=;
	b=fHyXUTtmmSw7ZprWkO9CZb6WDuYwbiipNj7DOobxoFNlTns0x4HkupdLDNG9oh97/PdJ
	 9mP1ZuqvBAfMwC1deewJBN6kjfR88ANUIQvyP7nUYRm7l5zWLE90Y2hdf5styJcwYu7Jd
	 +6aSRJ2Gpi03pmWUBJlwOTinH/poGcCr+/m9ciqkoTXAZDLXa2ZA+q1E48NE2ljZlDFUi
	 iRGlPX3joN5BtuipG4u20tZK0OwQR0XDjZkRFKYvEtQi6tZa8XdW/ObGB09s+e7u7eBMr
	 zMLVqBbfjFEh7urj0WupWwFQj3iqApRe97jvi8+SNVySMtKZYZktSH+BhUJbhE+eFGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=syxGUENS;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6ED606A32C;
	Sun, 25 Oct 2026 19:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6ED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=syxGUENS
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJM3W5516897
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJM3W5516897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956127;
	bh=ndUblt3nJlZZl1MwBVzDwhzSLV3QQxoKhFCgCQeYDIA=;
	h=From:To:Cc:Subject:Date;
	b=syxGUENSBkiwYcHFahGPQ0HhNtrVW2Kly/KX3MoG82QvZEH/zzw9LayEQGmRQfTNS
	 PVHl8jq0Aq3LJ7hXhJTazNQ3z9tX7SD86xnMlQJAkF+Qfi0phYA1EDzeSvRZG2irkx
	 qu5JDU5CeeFNKODtXv7hLHA9hPUKQPtuKDmn1CNs=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] phy: amlogic: meson-g12a-usb2: add S4 support
Date: Sun, 25 Oct 2026 20:22:00 +0100
Message-ID: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The S4 USB2 PHY is the A1 design with different analog trims and an
extra disconnect threshold; without its PMA update bit the host sees no
root ports. Add a compatible and the S4 settings from the vendor driver.

Tested: both host ports enumerate keyboards, mice, hubs and storage.

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (2):
  dt-bindings: phy: amlogic,g12a-usb2-phy: add S4 compatible
  phy: amlogic: meson-g12a-usb2: add S4 support

 .../bindings/phy/amlogic,g12a-usb2-phy.yaml   |  1 +
 drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 65 ++++++++++++++-----
 2 files changed, 49 insertions(+), 17 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

