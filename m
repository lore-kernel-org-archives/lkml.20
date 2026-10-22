Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792706343;
	b=Oz5oYTtbcpG8u8i1ZQA5z3v9pXZ2ORAyFa1I9XqrGRwcDEbkRWNSaYmXXdq1pC5teLXS
	 T0JHZJL12NNt3Bjd5U18zkQ4N3ysYb0pfMniwkn3RNckLFpM6i+74thbw5rdWaPH1fBuD
	 uhnpVp4FijRaP+aklHtI5fjN3DNGE9k2Xb5ITr8xHQ003PW/+J/nLoxV/0FW6z1125Si+
	 UskVeRenwXEqBjf5gVDFvUTYXtfm4S26xuGKj71Te6m8EDdSx+dO5sylKGKw4yOhONKmA
	 rhP/SNj/Wy63NjZzLeC6XNWdbiQMgtmslF6b5Yc64xINJtaY6CX1lHHL+4Gncm2XLhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706343;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=J4dWhXL+arE5vZ9bVeyPtt6G9OZ41B67BZQznT1XJtM=;
	b=GKZaPu8Th7XCIrpNrzfCK1fn0t7sK+M/W6Umdnw9r2Aq2Ia5BUfdjjAh1ymR99Gxj9N5
	 dIFNg3M3sjCxIO9TUUUKPvbdKYE5mXtkmx8fKWgiXGM3cWmm7gL6Y1Qa/Pyen3ZgQd6iK
	 OeEiI9HCGuRJDzAFCHxzkLnAtcGhz4trAJV7EEIOFN2Ryl99zvQ7zw0po5wEE5tFFWeCQ
	 ohYx9ftTz1cEQ9ObWJxoNrVvXZ/nh2ieUE7RU7I4frHcoQj9X3evsGXXjFLS7iFVUpz6N
	 XSddALGaABLX/+cWnwxUdA0N/oGxGh4hwN9pO440+m3lDhHZSn/CuqWmj2FVGsShHdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EFtu/Zu6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E69606A320;
	Thu, 22 Oct 2026 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFtu/Zu6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792706343;
	b=Z/Y3QxctSAHQ3lnsvsO+so97Lgoh2FsKEJPWH7i5Nu5u/n/kh6mHnMuKIhyEtDDdraaC
	 m2zW/Pm56RKlbJjJr6cvkC3iLGUv0kl+5jD+apsSWUpIdtfynLz60+tk2ovNKr6enT4QN
	 PXp8OtsdVbNrzrQ2kxb0ZZ+kmpYfqWD360LDvl8uZ7QLgXnAY5UD0v3uJo/VIz+GHRIlB
	 IyG7Y29QEdrpkIgRVrESn9y+9RWUhZK6VPauU/1F5gSQfJE6c3PqWDH42gGMrsdmWM/DB
	 dX50E/f7HA5cj+9FEg3JL0+Mi9NOLY/JuvNtrB9YTAWMWWBIer5Ge1/++D5dQLSe++A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792706343;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=J4dWhXL+arE5vZ9bVeyPtt6G9OZ41B67BZQznT1XJtM=;
	b=arJ9SvAxDFuXXtI3/YnfSt6wDhPlxC8B9pcrLyG9MmisJmt5Vwr1v8ER3d9ma2dK/muw
	 yLJ9KwldIROonR4aEZg8I1n/tjZspPOxYMEjpd0ulhZpuIU3V9ZC2L5ufZM3eZ4+j6uit
	 2OkFuvBgjfIEAQgeTKteyV/ygTBaeWcGIx5xeTsXrhHhquNPOwQLMwmbcxL/ulr4O46nD
	 M+bhrqT6N1U96/t0XPlY/lFuaZIFVcKROx8pWDG2A+hejIFjutQTF7nAnJNx3Rmgo1562
	 5eqoKJVqai6b7+NDze7mqcs4fT484wMw3ot/ZWhqqro+qJfev3BHBq+0v4aHeQF89hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 699BF1F01825;
	Thu, 22 Oct 2026 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706343;
	bh=J4dWhXL+arE5vZ9bVeyPtt6G9OZ41B67BZQznT1XJtM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=EFtu/Zu6KCxxNNvI7AEpvEeIo2IHe5ewm69R30m/LBeZ2fYdqSUkEqbkuxhxIV2Wa
	 CO89SQz6XIlNIph3de93W5jR3I/RDn7E451ZFh5w1uckAaYgkXriarp6YYKQ1KnfNS
	 VTkh9f3eHIjGdzTMWVnzZvStYnSrM+Ee3tSoP3RxwlZ+K9lfAZS5z6FEURq51tJms8
	 WwchVKxuzY5QVTGhjql8yTWnFJlLrig8WiutTZgJn9370wRPxgGV6KBQe6mYX2FrrP
	 rpbHP7Uwt1TjoaEIj3Jg/2WoxAfaV6dATjPSGvW5Rrb0ZDjK8d1NWu4ofBbE2dlF08
	 rw2SnCSZT0Yow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B896241FA6;
	Thu, 22 Oct 2026 21:59:00 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Subject: [PATCH v4 0/2] Add Samsung Galaxy Tab S9 Wi-Fi (SM-X710) support
Date: Thu, 22 Oct 2026 23:58:18 +0200
Message-Id: <20261022-gts9wifi-dts-v4-0-a361428fe59c@dxdmail.cc>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ6CMBCF4auQrq0pQwHrynsYF6XTwiQKpiWII
 dzdwgoxLt9Lvn9iwXqygZ2TiXk7UKCujUMeEmYa3daWE8bNQECRCiF53Qf1Ikcc+8ARZAn2pHL
 IJIvk6a2jcc1db3E3FPrOv9f6kC7vn9CQcsFTJ7BElKWV+oIjPjTdj8awpTTAVuc7DVGbTBtVC
 aeMrX50ttEgdjqLWjsUhasAlVNfep7nDzlaXDElAQAA
X-Change-ID: 20261004-gts9wifi-dts-d2472e895234
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Nizat Mikayilli <nacht@dxdmail.cc>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792706340; l=2005;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=PfTYWAs2CSTbVke9UM6xjpocxVnW5Km5StAU7TfdOwM=;
 b=OHn7JOVgbCXm8HZejwM3Kz0D4MBzAQ1UZW2LAbeJcW/oRK59BCpXfyfmFKRckuWxa8fpAGLjo
 32lpAB7UDZFAoMGooWKVW9XtcAWMUQULYxG8DQKTZvhueR91dCssu3W
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc

Add devicetree support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710),
an SM8550 tablet. Two patches: the qcom.yaml board entry and the board
DTS describing UFS, microSD, USB 2.0 peripheral via eUSB2 with an NXP
PTN3222 repeater, keys, GPU, video decoder, ADSP, the CS35L45/VA-macro
audio path and WCN6855 Wi-Fi/Bluetooth.

Tested on hardware on top of linux-next next-20261002 (boots to a shell
through U-Boot): storage, microSD, USB gadget, framebuffer console, keys
including the book-cover switch, CPU frequency scaling, GPU firmware and
render node, video decoder node, speaker playback, DMIC capture, Wi-Fi
scanning and Bluetooth firmware loading.

---
Changes in v4:
- Keep the modem carveouts except rmtfs_mem, the MPSS firmware is
  shipped on this SKU; memtest=1 is clean (Konrad)
- Add Konrad's Reviewed-by
- Link to v3: https://lore.kernel.org/r/20261020-gts9wifi-dts-v3-0-afd06fb2d9f9@dxdmail.cc

Changes in v3:
- Add Wi-Fi and Bluetooth (Konrad)
- Test microSD and audio, update the commit message (Konrad)
- Add a blank line before status properties (Konrad)
- Expand the GPIO36..39 and USB comments (Konrad)
- Add Krzysztof's Acked-by
- Link to v2: https://lore.kernel.org/r/20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc

Changes in v2:
- Use my name for author and Signed-off-by (Conor)
- Link to v1: https://lore.kernel.org/r/20261004-gts9wifi-dts-v1-0-1f0d7dd47e4a@dxdmail.cc

---
Nizat Mikayilli (2):
      dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9 Wi-Fi
      arm64: dts: qcom: sm8550: Add support for Samsung Galaxy Tab S9 Wi-Fi

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm8550-samsung-gts9wifi.dts      | 873 +++++++++++++++++++++
 3 files changed, 875 insertions(+)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261004-gts9wifi-dts-d2472e895234

Best regards,
-- 
Nizat Mikayilli <nacht@dxdmail.cc>


