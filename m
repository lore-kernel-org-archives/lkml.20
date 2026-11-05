Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909234;
	b=1KjC4SulpR+c3R5kyDI5Ex2KLZ/wKO8I12YxKbLvSxi19C5CKt2vVQdBcmNmvdjkQ0er
	 5ejU6Rz/4wdBhwjdWfQqdy4ScHw5vWpyFmz2aMYfBogRdjVqfLB0jQrKCJdTqE2k5BS7Z
	 72M8Ui3cZ08fCqwtWbVI2ZBhhIQ8iM47OzI06kvepItDi7XLQKbk69rwsYYjaI/5A25+4
	 XMl0gdDRzAJjUgMX7+KMPdLv1NY8VWOSpxJgpkIIYs5cK9hYqRCcqzeBj1zXZ1owwCd2u
	 AAKrlkVVewOpIhrVLNfEkE141bglmErzNAFu9ZoIR4pu6qDwW3KT/JWdKbDyVSWUGHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
	b=DNiWIUH4IpQMHaAv6+GnPqMzinvXbnD51ZMbK2wJxFeNwySyaG6uek15/6VBDqLC6SiQ
	 sdS6u1p3yFiPWWFtUQEt7b29BxQfqINq8jTgfa9VBZT7S7+Q1gx95c7hdMFob25fvbwfU
	 sDD3ZmVbcnFbgF7DjtwkgpUu1CjE08e7XOcyDClayq6WW6ozggPseEwWgTk/klXfi5Peg
	 46dyzDwT+TzCr2WwkDuvHK2KHOiuVx85wOyR4mHLNwC+nKSQDTtvsEx6iwYcb7oAg4z5i
	 d1qO2ZykdKHjf+6/eTm/8TlSqiGDv11p62DvawNZZIVUzIVf4+8ponLqoUZRu5BBoGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NdL4j/Sf";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D70F606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D70F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdL4j/Sf
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so17793805e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909233; x=1794514033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
        b=NdL4j/Sf2euHzhcOElIVGfgvu2LhDvenH5bjqq2qaHGaLaIrdyqsOm9TpNX6ft8WhM
         8NKw4opLm/USQ/0OAmiYO/NLb42AVD0JtX68uwzpOHYajR8dsA3ekVp/nvz2T+mFA+Q+
         EoQzAuYrldZcrCCfET5NNuGy3OQ2/6TjKivZN5TAdW7jsmy1T1OQnWV1y7wTr59/qosA
         I8syR2ByaOSihh+UAI31e5TJPH58LGuTTt+qckBr1oAntXuGGIGWmYSPzdkGui4QHCFf
         a1G4ifcX9f0eILhcRlA/hA5aE9cn18E/zl3GBXib0bSdw0fw2XZQVPSa3AYLsKr1xHsK
         Yknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909233; x=1794514033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
        b=wk/eACyGPutz2b7d1wH06ov0Yt6YYr9W0/k2iHA+c1VPiGZookWvQ7rpIR1fT1BEjQ
         ectNFkt5mRoqSk++QhPF4nMD3k9X0gjuBd1qfJriP68n6LAuD1XgCFEENr9Mc5IZM31W
         3C3YzAmZ3e8QzSeCKbL6Hqkal5iaZam1LxmqJhpOTNOxi4lNUwIU4wqcokuhOZ4W3r/p
         4UDCz/XbMcWplcZqLPSmcprdylqBiy/vOyZu1noVEvzdp4PfgoBaqj/fUqfCJ6AIMUqB
         1TcDW9bj3tkCG0InmzP6TxIMskCe2i4j6eDLEeDz2rtZKBmsbM5Td9lR4l1CgP7MaIIO
         oijA==
X-Forwarded-Encrypted: i=1; AKwUvByJv622newUhJrTZuoJm5tyOsX8bpaTlhY0O99ezQWNmnJR9PsuZbOp46KwwMadX8pto2U3EiZErzdwIY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fE2crL3+eZts/IxBSQX1o0xGmkEyqro5JMg07abomiQn+/rSV
	FRkR+WhUCK4SqL+R8VpDQBfGfsCFd/4qQhey3OqBWNBSYfKAy5bwYWl0
X-Gm-Gg: AYBFou0nwMnL52NQDZ6SMkNwwf4+KxkNxF8Q8rmuLBCA5jLNNCwYpRGvVEg1fWJQfcY
	A/jZsJZp+wUZ6kZANcZO7B8qkoTuXL7ZnijNcadfjF2qkFRPGXtHkUmIMnj46nCy/BesV/XcFeZ
	j27SANXZQCCaL2tDiZiTFUGGwYOPSbDuaEn6x8XvJ8xkP56iV6rOXHNNmxG7sM1JYf8myQcXQiN
	LUb51XIWrt3o6SCL8SF6CPAF1Y2Jxt/NFV/7dUkWehqIRLsmg420NpWGG8awq+mbTpYQzlhHSTK
	vrWSugR82lfCQu+wKKPmsjMt5CdSdizDEFsfy+GRY7Hb8YSIDwLzA47RyuMJtG8v8d1/UddTCCN
	y8NfALj8RKc2H5dzty39T2+zr+4i1RTeS7fDVaMq/IpdemvlC4EfuMAEX+0sUvpksd7rUuIAAZU
	sefSdj/14J8OKaJsvKy7IWZ0zV/kCVje8ZbTRGvkk1TKUZ4v/Nv66ifExyXYbWyZVUq/b3wTHYE
	w5o+CurzbG5TIctxy/mmfa4EQuxTeoswFunmzRJWjOkDx+HPxV4xuX5LmULBZ9IhCJKTY2XgPdW
	Cn/IlUvl5ZbDkJE0F2GEqipuJPXrt/PB9JgdoJn83m+GHKA3DzLRc+eoh20=
X-Received: by 2002:a05:600c:1d26:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4b6dff86444mr3062505e9.34.1793909232668;
        Thu, 05 Nov 2026 12:07:12 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:12 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 0/3] i2c: omap: add support for DMA
Date: Thu,  5 Nov 2026 21:05:51 +0100
Message-ID: <20261105200556.34240-2-apokusinski01@gmail.com>
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
Content-Transfer-Encoding: 8bit

Hello,
This patchset introduces support for the TX & RX DMA transfers in the
am335x/omap I2C controller. I tested this implementation on AM335x 
(Beaglebone Black) and things seem to work fine.

Kind regards,
Antoni Pokusinski

Antoni Pokusinski (3):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 291 +++++++++++++++++-
 3 files changed, 303 insertions(+), 4 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

