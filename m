Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736125;
	b=1L1ze1VY3JLZMMxJ67kIsH38S7u6vp2f8wK4R+KdLkcOlj+HZ3LM2IYGUQZPLR9jVBmu
	 mKGyDjWVKjCSY2KswUJkziknxLyJuOz+u9basOrUnGX1oPGNlI9ToiT9o3nUBQ3qN62vs
	 8fzyf6os8yvQaSPcO6RFrKFNj7jYQ9/z9z2QrMw4LstwFrYSvCUnEQwsUs0U16nEdhVwE
	 rYsaW6aE6pBjSsYVQqEQ8pS/bNo6/HX4utT/fG6zCA5FoXjeCNuvYeap4qP4cGzFuclMz
	 Gy0i7i2yPfyzHCKFPrEHoBw/JE21vYLI21RDK+VZ0UDS1pdp8NV4p9QRIOQqbR2p7sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
	b=m2oItS39Y0aUWUnIFpF0JYnMBNcum4eOqM8CxLIeddD0s2w3anyr2F5RvB/+mnefJwTG
	 sYWvarEVgD/xTZX0EHwwWP/e6QjvuogvFURPiecafGDCxeScFeR8qH/elGWrJYcNDpz6Q
	 RGYsvDI2ALEyKK8Mv/gkTmgjJl6kwpIFejudWHljUqC4bfX8pogbpcILCf+F5vP2S98er
	 vwg4IyoxkmwXqOHax90efT9K03cus5xrqh7MQEeJx86YeX81UUji8F0ODbm/9UeOmBKyf
	 RcZLiLjYktjFqvuwzoRXn9MnKbcd8d0SmMZix1RnaF9DWINHyBXWRx51hAAwryMFeMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXFt6lcX;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F6606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 237F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXFt6lcX
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-679e6ab6471so1088918d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736124; x=1794340924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
        b=eXFt6lcXyY3xz3GUePc/hTpzjE21KaHxC9VhQ4OjdgZ7mu6xqRudA6K0t6Kan9O05l
         Uh5wT4aIBZubCXlCChyNxfv9Pdmx/AHENFxOoXsPtGyRNFxdHLsVyA4SsI++ytX5uH1W
         L2Sr/4gU5IzOAOuScDzrw1AGuwADoaGly6TQFASZJF6R5hC43vh6WyJlhD3gm9YWZzMo
         7dC5X52Hn/hBKMm0+fbSvmZMMapPJbUCVhu4+gKoP7Jc1aulmoXw84Tc4hPdkOyCNTOK
         WTmfR0m/wgCVKW7hPxnzqT/1qneSgNTgr6s9oFm9pCYJDo7zBJgInnXpY0dUCvs69jrV
         m/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736124; x=1794340924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
        b=qyJ6cf2iLKwBPiEiM5nTnyaiPRz4zCZwOjKW1npj2NTd94vlxKVWMfXLLkb8+q13xc
         XEGEZ0yDfwm1jbhVfkzVn/PfHb5AmhtHg9hBJybpO9e0Jq4fXtQgHOlDNnoKhJeLtCLQ
         V17Wrm6lMXvUWhMZuat0x3jhS5FpFePjDVkkzyP4f1Ixwir2wHRFdrvj12NUKw+VMngb
         dKbU2isJciO9GYvfXGmfoPhRefA8o1qL9vlG9qQje8clsQ6pvRd33G25zxprHUvVpUFi
         tam9dQ4pjiQKFm8Yx8w2zoyTQy42Ohk1/WqoksnCMq+2lrBcgJqMzwmsSj3JhRCDMVJo
         fRlw==
X-Forwarded-Encrypted: i=1; AKwUvBwPmyfHM8JEczkKgVyt4qKJG1/Vht9RijTDrDKZBTaYNZIQNygsj9yMZYPVqmLfPM9CKZL98m6dOOPA6yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z82OUg2N9zC0/VRkfZo+iZKEbFGbYNowdMuNrE+HlR1T1kjtWf0
	5mwIoTRkBnCKqeip6nxtIRUS8GGNOgjblWT62y2yMd6ERyZOSjubRV6e
X-Gm-Gg: AYBFou3W3nyU3xiuJuBESfD6CKkYBnCMZvyYAdvj1q2pmXZkCirM4X9M/1LpMUhpoJ4
	TIXJ0h5BjwaA4UDtonz7/yvo3Cxsn0xY1D0ZhSdBKWa+dGPX5D1Zk8Xdz2ZC90UbcUas6xUfGv+
	LYQKqHL7lWUP2KLTj+1MFbfUFq101OE8iRxtvZ3vdPCftsRQ9EKl66AcpN/w7wToT8wQV6I8idF
	fpE5ai56z86905hFyxh8r/d+bKwxPbxTQ5h4byJkwuL7G1x/F6/ZIEIV7dZmRZGj3luAKcp3ajd
	sXAr46yd+oB2knVeErIRrxVs6HvZdqv+DGuKDeUvWEil7hw5RQKFhVS+SaeP5IWBy6jNnDRHLAZ
	hmcNffxaDwf9FfnlrPFZn2k8Y6lcARTZ+FVgvKLwcKVniiLQeQrb8TwMK0SqBl3ZsLHRHDKRJua
	vC7RNOTfKXcAbPp+q5tq8MBn8FhuqA+wlxyRYCepSBSwqwk+LBxZXV9wOlL8njFYW3MtTx9uYuY
	IK9xV6QVqZW+LfRHXY9Z58TBnAfZpalDN9Z0hXQ7tVEoFQRVBf9v643O9YSXwy0XEvbWpzFnAVC
	KtBBFBrf5jR0+OCsqvRpta/uDafkl01G3M+ZtTsCYcs2Ifp418to7JVw+Mn+U4HmTCJP3UmH
X-Received: by 2002:a53:d585:0:b0:677:d023:49c5 with SMTP id 956f58d0204a3-67ba4f07d96mr7810553d50.13.1793736124116;
        Tue, 03 Nov 2026 12:02:04 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:02 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH v2 0/2] usb: misc: usb251xb: add DT battery charging configuration
Date: Tue,  3 Nov 2026 17:01:52 -0300
Message-ID: <20261103200154.125681-1-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103185514.72144-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Add a Device Tree property to configure battery charging on selected downstream
ports of Microchip USB251x hubs.

The first patch documents the battery-charging-enable property and adds an
example enabling charging on ports 1 and 2. The second parses the port list and
sets the corresponding hub configuration bits. Charging remains disabled on
all ports when the property is omitted.

Changes in v2:
- Only parse battery-charging-enable when the chip variant supports battery charging.

Jhon Wilker Rodrigues Aquino (2):
  dt-bindings: usb: microchip,usb251xb: add battery-charging-enable
    property
  usb: misc: usb251xb: configure battery charging from DT

 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 drivers/usb/misc/usb251xb.c                         | 6 +++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

--
2.43.0

