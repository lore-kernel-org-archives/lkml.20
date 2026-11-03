Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735423;
	b=wE7VT2T38/pnS5aRUufWHvhxVxs73szAWqjVFQe2MrUHz/PVbVgt5qUs0pi7JIczdEJg
	 RlZgkJUeuqezP/T8bH23CPEalFjbGfqPrUdMr+b866vlmPOS35hQlR5kAc1F6l5KYECuG
	 l1R+5FoD2ttqEy6pSzDXI3qGpvR0prww+AfI/PacsCYKlmuSThCWm6MW5NGZmVZfDT64Z
	 aj/HM7PHL3ZSdy9hzBGDeAfeiV9f9kFvjEfr7rut1KAhFIZUEOROJe7xXJhtntWmSzv70
	 Eb/QN5R51YSZQIKBZWNO8r1T3lNf3ld4kyx6bNL0xEV/nSIQ0k+/PlbYRK6Iihq7Trg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=;
	b=3v/Svv4ME7SgjpOTxmd2fHJbubANZlDFXcA3uwan4jBLBKl/nTNefVw3fhLxAzzT48f6
	 DEyDyxhMjWKsbp72Oh0SXdylP2kh/+O5kK26K8hMYZUQdXjkcHq9tVkctudMI2j7/gFDz
	 SYTV4BwB18kyp56UfgaIMALQMbI6NDc9pvT57s4qKAt9lssRn92XdoxqBzMSo8UxIB9pK
	 7/+/MEmttePpUdqKWiB0EBN/oiZ0pg0um+K4eY11dRlBul15mVySG4vFEd2tU8Y8FkjWM
	 pbn5bF9WpMivy0Q4Iw4NzmRzFNxvywlh9YRQlbf56pjAsW/YM2dWzZ1CmZ5bbEf9mEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WX5St4V+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD3C606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD3C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WX5St4V+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso50859155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735421; x=1794340221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=;
        b=WX5St4V+2QCsIafPGA4uY9kFxu4RcNUYm6QOUHzr5WQ3QQOH0SZwyf22DSM53G5X9O
         05NGESiuHr58dRO0JittkYt14CJl4NnYSJ3lg/i2sHwd9vt4LGSVfjH7985JvX5Mn+l8
         bMmk95SgMvpUTpnBU2GIprP6EfklflLp4oLcJiWfaBVEA+BtT9PYJvBT//fmiHuoBEqt
         0rZBejKR6YZfHWeNlo0HmqG18Gd8hPO+BjQXDSOxapuRn3FBEPW1/UhnWc4lc7+2j9MB
         Ehqh/18Pd4ke0gQlM6X6VewkxJc99eQ0Wn4AnLiupFQewdaJ8knjIKvm/5VgLA3HRbQy
         j+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735421; x=1794340221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=;
        b=q5pTBxhtlKXBXQ+jbv7aqICaHf+d/165RqLkMBD6rf+CpHuCjC6dWJik4emvEjSaYw
         ubnTurbfIRy3FRprd0pAWBGz3w9fC4BQEgGkT+yvjZi151ICihp+fGN+jXeiLLY3JzzP
         esdlmCqE6Czv9hY2KaMmKZ8Rtwld/ADRrFOp/Xn3FRK+d68XawXebJuzVrKQCSxcD1wD
         0trvZjvZeD16IWeV1MbcCY/lIzJPOedeVSvZrOE1NGGDE4Vv/O0p+PSIIgrzdTKpkueZ
         pJebWb05sNW4zhP9I23xieJeTKHotmpKAZggaoq+kGXOjq5xFF7G3Q3WHHxqmSZ3S5OI
         3Eog==
X-Forwarded-Encrypted: i=1; AKwUvBzq/bMZ38TCfAluQpAGOGKThI/TbxuW9KlL5clpw1cFDmGNJKe62cFvOCKfx5Qz0jzfSynrgkX1dQkSfUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UUzWmsapanETa5gwPoWnhcyvl7xWu4chRHLO5HbnaW5MmXB1M
	T9fkfZ189V51xj7t4k1VoVLSOaUWd2lrmYiN3W04CdE0dmvFM1pVtbmt
X-Gm-Gg: AYBFou04xJ6/vfe4Fjt4pIWHuyY2UHb7nXVAEk6yE+RxerGDiglPXN2semmK2H+LY+k
	+DxFSFlO+gQcJc49ZVAPnmVSRjpt7Szc/MMOLWkHn3WQHqorXC1zcKYygHfOBeFVX+/czu1Kp0I
	5MPav5X+NDXKSremvXbu0il9sLr3q/Sf06SAysk4PQ64bTx4l3ZyIt1yehghlDauJFkjYAe1aOw
	9Se7oLkdw7c1hYFr9jugmBGgtbn0xCEDlmyzoEd13pmRjIuJVSksw0ZSoS9KZ42dJxpg+5NXNTK
	etqtrXZYdaHnjYlDJAV20CJUv2OfdrISe28uPM9HzbsTWJBVuOR3DrpyBaaFKElzunylAXIK/Qk
	FxR8N0Eiqmd3yDV2vVxf2dZEjY+UalRXL8VJ3hwQjSFTwAP8JfTQdb70DJf1MVKbrLpZt2PyVxq
	Nez4s0wSNHGD1CTRYOXEvF1Ru0oJLhRtB6Hj5+F5MyZ73kXpH2pkgL8GMvRGSBoCx1wRrUgDd6c
	f9e/oHJrszwSU2KYakvh9BAKlBsH9uxR5OUyq6LvlccY6tSiyPsJfCa41kAw6s98ZUMRTTHy5lb
	8+VoHZK7z6nRy9vKthpkIo24lfuMiWD1f2C01JH78EuOt/jj7ORAQqOwvf0nhNbQVxxfJcI9hYG
	SqqizbcD/dSfqvxQ0kxjJCbB3Tmn0AOuDQQ==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr143567615e9.29.1793735421412;
        Tue, 03 Nov 2026 11:50:21 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fc9d6b0aasm417802f8f.2.2026.11.03.11.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:50:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Tue,  3 Nov 2026 20:49:58 +0100
Message-ID: <20261103195007.9721-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v5:
- Rebase on top of phy/next
- Add Review tag

Changes v4:
- Add REGMAP_MMIO to kconfig
- Better handle exit
- Add additional info on QPHY usage

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  14 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 823 ++++++++++++++++++
 8 files changed, 1292 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.55.0

