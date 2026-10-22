Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661787;
	b=xezmk30gx6XUmzYs+I8P7Ea1g4eOvyNXQYEm32TSnrJXItBPdE8ZlMafAMkfkzBeaBbr
	 0O7IIrbsJZj6J2UqoBGpf3W7FLrx4mGoTq8Y22Spou/8jEofQArO5S4MqMKBvb7dda2bS
	 haax0UsbKz5sZUXwwatvR2IehOVHHTvln04L/IyEjuQF4FLiVho87vDvUGxWb1x7nD6k/
	 jvrAsb1gosU5uU2VG8R1GbY2ey1+RALl8goaX1lKm6xoFNB74j1Ac7oTjewV1MmIP2QmB
	 m8wzedTiu6vyDmq1vUZ7PafMOUVyEGh3z/iiSTbfeOye072ZqGOsLoX3Iggqnc4w+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
	b=IzyLkN1loWQ5zn8aDniu9akstXuvH08GfqtuW65PLGa8qks+j3ElfH2tGvEsUzX1Ugu5
	 cJX/uc79MzgKMDtLaRFWKd4klJfqwaAL5RfwQrfIrffAKd4mZE9FE0tWY6H8AqNswbQsu
	 1fp1dWmbcUVvPyNZiPh3orUdl+tS8oUJrWokpRLGyPfRxIcPh34Q4IRsw+6/mGy5dwiOl
	 ZvYZgo73cQHA7r7SpVGtczPqlV19pVeyT9jRptlSHPdskVBKmqK/Aw3AOYZ0JpBhI+ZX3
	 hrKlUTC2ShmRNSdEoUnso4NiMO54CAPxO3vwiLyrjZ2VyzqAvWPomnwGTy1HI1vloIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rziXJ9qi;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494CA606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494CA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rziXJ9qi
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so19050715e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661785; x=1793266585; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
        b=rziXJ9qij4OFJAmAFJ1BxqIN6YtdjyDlhmFtcq/QtfnV73Ld97qwC3N25XJD0qIktJ
         CkWUPBm3hxSp0GWMHm7REXa3Cl/0RafAkOE4nZtt1cLIr1AaTf0Tw16aVNbquLwqtGHE
         Y/J6pmsfvbIznOgNAE3zPax9iwZ26dsABvE4BvIGxht/tkD60KqK3CLakPK2605WnIYs
         pUaAMIyyvDwMG0reQWBDIqSv3s6P0XFMAn0q16a/UNhexiQzt7oHOdZXC4mZIjZ81d2K
         hon5apkGQ/4spv1+YofFLt8MrmjYV8XQT3jYR86SopPUIsX072M9WKF0xofnfzrWBA3w
         Ki2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661785; x=1793266585;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
        b=i00/lEjCE/V6zmEEO41XcGu5erSFQInQeNyPlH6zikrXqhqi+YhOBgvzEffSvFtQv9
         xzIE57330B/cPiF1j1BfqqSqdH0cCQSHNHOGhGbTc+v37D+QHUbEDkukKPXruIdxKufY
         ypyFTTDs0ayVq7h47RGHFcHbumWqpo134MBVgk/frc/8AEFUWNxaxLF9brG7n+8vJJrJ
         2Q++5XfIYAyj4u7tkzfuK3WZY+VU6DE1wQtrYcmnq4bZFLuTTy0/wliJEGMznTSQbqPI
         0l1IgFOAxxbS2atA85YRyqZnCrnYcHdQraUenxDppBxd/YzklTUFHjqf7TYQsB6AcL9M
         HsVw==
X-Forwarded-Encrypted: i=1; AKwUvBwbRKzFszhnjE5gIF10z1kxXrntLQPk/h7eqRSZFylf5DMG9LrIeM5BFigg8En7/oJlSS63011NXY4NR4A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9m0RTxwQc1rt01qilQ5MHQB1dt/AeOU8MnzFujmeZiY5hPYP/
	UxiEY7eGMp5PYuU7tKPWrTdMnpRTmRM+KKDKllhU4jzxMiXIfDjxlY95dgWAzWoQ5UimzmKbA1Z
	U8+Mm
X-Gm-Gg: AYBFou3MnqAjYAVI4dNJmmXCblhBUfHkMISPgo/VL8lLWBu+PNaWQVkIPBw2wIxazJd
	S4PsxnQW5bRuJDfQC/e1I4MpJreFE5kU4iDtr+NZBdj0I5PqEZmNqFsK1D0idruHQ2uneQZf0F4
	o4W7wYAx5B7EItKoUJQGKVIXSu2BxeNIvBlRYU51pFoz5l5Rn18WqzConJtW1OLBs1Wt/mobd1d
	rvDvIijYDvTk0qVRzgHLuqjDdlJuMz7RjqBycPkz/U/F/qsDFuM1LwHYvC2+JOTQc0CKr6WPHuW
	qNI5dApo7+DNxMX2QjPwvjK470J53lKsoiS6K0LNsCGQNCm/NfNUg0ufsoy/sx6/brfTJDBVl3O
	yBcGHulLBNofVrehTpzYCHKYV/2dCC/9kiv+4KEz2QRWjDnQbrrt/5paKJoSC5/W2bePoyJIKsA
	zur3Z3spvxtkb6ZuCAWrwxLt/cF2iRCg6jZU9BOV3Hiu07tmRQ4g21zYtm2RQVqkNrfMy5lORgS
	kIfGACmw6tTJOWZdHBe9PYOgLql9sNwkwynTVLvC1hu0WocTnig8CS1woFG0WreSKd+0lY=
X-Received: by 2002:a05:600c:1394:b0:4a1:f714:3f3 with SMTP id 5b1f17b1804b1-4a1fdd41954mr97614395e9.30.1792661785212;
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to
 play audio via DisplayPort
Date: Thu, 22 Oct 2026 11:36:20 +0200
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIABTZ2WoC/yXNTQ7CIBBA4as0s3YSIBWrVzEu+Bl1tBQC1NQ0v
 buoy2/z3gqFMlOBU7dCphcXjlOD3HXg7ma6EbJvBiWUlkIprDGxwxKGZS9wTqVmMgF9QjPWED1
 hGs3bGvdE2ctBHw+9t9pC66VMV15+r/Pl7zLbB7n6HcC2fQBi7tCNjQAAAA==
X-Change-ID: 20261022-topic-sm8x50-upstream-dp-altmode-playback-14186974db6b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qKv53hUCdB5HADSZusj8p39GNxevUv3qIqlUKSPJa3I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkVhsuZdM4BaihAYctDIMply7ywt8lea57J3qVq
 tY3Hvz2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFQAKCRB33NvayMhJ0dywEA
 CbVpybwZzi2MlMF4IgUep6Wjr0GOM20uL5jax/ZKCXVifV+OwYJz0ad+kxhitWOp0hNn/zUG6Vu/jP
 sm813xJ2moEo1gGo94FCfJY9r6dPd0ml5XsPuby2V4LyrmM7UgmAcVTb1n0uM4Qo6/g9D+YonjEfJQ
 hA3xZxgEBmIfNgyfJIH3f84Rz2y1JJ3YztW19BMJpPkG8OZ9KZUQFctozxAbVqxM7FHRPHClvvd9Ho
 E2hrRt6FghBvOQ5SRY7PcgPAmRSo9spaFjobMcyYDCjyxE9C8V6hgWAxXqwAYNwYCYBnhbjqpltG6n
 QgKCBBxY+3AfX3hAb46i4G7czZd3rhzpgb+TSaRiziR2ow5lcP/f1og4gZ/A0OumVemsKKLbB5j9aR
 gH8siSt3SA1KSARP51Li6JBqM47/RcU7sb7pjDMM4D0/l0feyy7+gpWM+ZaA4l1uPx2NqFSGGKWM5Q
 cNTGukeVp26q8lEGZmyCyb02tBb9tc5y7fHKpHnp7yLYsRQckWz3d5FnCoG97kso0Lsws/e3F6nukv
 YRo/9bqvKdaCW/K45hrGRJy+VgZM5EvaDgPXGNC305rVNIQ7ZfbGB7D2yRMlI/m8+QXfZHIQilf01A
 2YoNeqbDZk/kkY280LoLKEcm2P2/eHPXI5JBewhvL1eawd3QVJfSB/nhuJuA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the DisplayPort altmode
outputs for the SM8450/SM8550/SM8650 HDK & QRD boards. 

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (5):
      arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
      arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 16 ++++++++++++++++
 5 files changed, 80 insertions(+)
---
base-commit: 5c2379ff1e0d26520b3edbb58fe2338fb17706a1
change-id: 20261022-topic-sm8x50-upstream-dp-altmode-playback-14186974db6b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

