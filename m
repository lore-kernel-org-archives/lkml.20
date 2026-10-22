Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660623;
	b=GndIM6Nj1C4UIznKBOher8qqSnRwKHgYxHmxoczDMro4tg1tseE/28OESGFutIuh7VkQ
	 rN/9B9a3yHj02hEgb7i0fJLsst4B7EnfbAgITi0DTqbRppk1DfnhJtp4CedjdpKUMqK0C
	 0PVqcZ90tUMJ+s8xtlZNTTTfxxZ4YqWsJucCyjSlmUkgQyT/yqn8/IRbdt2iCpGf7JRw3
	 0d6NbtKytu4eoXkqg6IflwGDScmBRU+qG6uDBToZS6xbnF156dfjUm0UPZNYLYl5uXwRE
	 bUPYWmuQ0WcjOu8Q3fX8KcuYN3iWxgD4ehjrbZPvwW3m+6ZQLUj+AzXU03ZS5T4Jsbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
	b=eRkQpZvWp6LwRC9zeZGKHIN1i+WHBDmlOlZk1lRsjmtXi3FlozI/pAbVVqn/W2h9WtMG
	 zDjLTDqS6M8M0Nk0YG6827PAet116pmt7a4054fNhq6ZPsnuUax+bQuqmmAAKlfVPa0nT
	 xFss9r3Io5XxNRAS9GXXpOCyI4SCWu6/JfG8tFiXLFucw5RJj4WPApota2NidRqWiCzVc
	 QjPsm/Eey20OQExyYFcmvDkXDH1H/I6Wj9Wv3zRSsBWWvU5hpRG0xNXlKmadOuQfEooW2
	 8wTNpCFNiZHrFu415MmnRhs2/F5f4fuP9rEunpXyqui6AvDaPHo4sAMdRRSw2J1el6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoB5nAPU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117A6606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117A6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoB5nAPU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so956946f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792660621; x=1793265421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
        b=NoB5nAPU72HPKSj24x2jYmQAVMrvyGV09hmlsSiU4mdh2uFiHPP0finmH7n7quq6cQ
         koAOQjkS228hRuZkLi4VpAPiS+X39KrVfR/hYEAVBQRNipi2xyxEC5LEJxl2iBMAM1te
         H3bfs5NWHPCiOGojsTSD6QZtFJvqJ8GlkJsFiB9XUAis2a591OZNzCTzqs7GLUdotP4F
         5SI/dA5xk4Ao2tUPznmKpqLd2XxJ7qy1Z95ghawXmP/ZcgwrWt9UDzMjiEfewX8D/Vho
         Chr20vwuTuJ1C0rEbM/QhWLl4lQ3guh2DBeTBCGAhk7WK87kW5gR26wl3xQlKW0/asW9
         PPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660621; x=1793265421;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
        b=YZ00FKRuh6MNsvb+v1Y4Sjx0T+PNjeCSORQFWOTIawl6WhMZe8s7tv700u0KfVqFeU
         XyOv6pgJ68BuN9Ls6TGctBl7QxjGwlXQQSKLgGnxGsGe8qNTVWOH8Qj9qrQvbzrc5xQC
         wltn4JT3bP8KnOK5QRIfilcSra8/nSNSRU3b3g7BBoRDjRODTuPAvNmp17aR4L9VbKHb
         OVeKfIP0XgUlgX7auqyD38tm1fRFU2bw4MnsUvNhoQVl4ctaykHmDMnCniLnPMU7hH/Q
         KQxO4it/5RPQz7CfhI4CzUKTh77rM5JqO/aXBiCDPdCe2kYSE2hPmoRga1/to7TFfZ6J
         d9Bg==
X-Forwarded-Encrypted: i=1; AKwUvBxqgiZ425cLar3HBErYs3Z+6xY5Y39CI71iTh5U5ZVvPTGG+OlW/x+qfWmmtzwV0ku8CABouDKXtQSzmsY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI4hNs+EeRr6STJ/agvbQ+TNskEQ5DUWYyuUyWMa3fYB9+kQ9u
	C5gtrVkvm3jDlb2+LKsOXMm1IrP+dp5OnDJL+CI8ahuXAv11CvPg10b7wwgBP9YzF8TF0cwPQl8
	iMP1V
X-Gm-Gg: AYBFou3uA1/6GPg18urj+2rHf/hVvJP1rO9RfJJAZEJPpJlDfcM4pG87X0dhilRCZMH
	cLAlBNt9mZtvu8LBSIBS+gTXJEdHTKZ0i30Kzljf6pdUAl4lXyBDNQtaJCM7paYiGnKIexqJySn
	9oh8O260fzlLj+j5lIux9xqr1cI3PqLWvFCGa4h48mwONTuVkVfJV6UOJSNItKLcYtg8XSiS6Pt
	Y516THupOiz63GbuFBeKANr5vgv0ZyZjah5DudUFE4WS1zYO32xSPPEF670z6vFv0XP7wge4T8l
	OLm1LpE39aedIrPbjNbZr+fAXIs+vwohjOOwUQwEiBh1alTWK/Mu2YgxBm8iUY7QQ9UZTCgvPOG
	qDUTik3cgu8JBTbMh59E/iyBw69gD3OsWZi3J9GHIbZYbxYYkQSTyLCas0ZiP/1SEWLahNknfC5
	15msp+XPCxbsNLqCAVSobZRsPoWvh4cmuxvabo2zl36XDbvgnlvv8pegW/IKhitMDFL/1B7df/W
	Xo5gQgl5h0RLduqYLyL4I3wcOBflXFhg9zJHdGS46DJy7cK/D8KcMxxqQaSM2V03Gs4UlGp6AfP
	sOSn0tXHZmXw860j
X-Received: by 2002:a05:600c:1f88:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a1fdd4b4c2mr93088245e9.25.1792660621117;
        Thu, 22 Oct 2026 02:17:01 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm11293672f8f.11.2026.10.22.02.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/3] arm64: dts: qcom: allow SM[456]50 HDK board to play
 audio via I2S
Date: Thu, 22 Oct 2026 11:16:56 +0200
Message-Id: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAIjU2WoC/43PTW7CMBAF4KsgrzuVM7ZD0lXvUbEYnAmZ/sTID
 lEQyt3rwAIqpKjLJ42/93xRiaNwUm+bi4o8SpLQ5+BeNsp31B8YpMlZocZSb7GCIRzFQ/qpJqe
 h52mArvkCwQRlUxqPjj2TV/n9MXIr09X+2N1yOu0/2Q8LuFx0koYQz9fysVju/tMzFqABTW1It
 2yJ6vdv6SmG1xAPaika8YEyxRqFmbLoC/LMjrB5osydqrRbo0ym9JZKWxlvjW6fKPtAra+ymSL
 E/Le8v63/rprn+Rfn5YL7tgEAAA==
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2189;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RwnJkJ4XSH0ufql5jTfBYo07LHUrFtd0N7J3Im52S5M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dSKpuN+B9pWmXeCrZNed6s0pPHsBbr5qOVLlc+U
 eId9T2eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnUigAKCRB33NvayMhJ0RexD/
 9gBz+Ie8BYVTB5BBYgZWK12eBH56UZay3Eer5hIJ/18hQ0ls0+wPVwNi3YfRjrC4LYl4Urhd/4G4bw
 KXBNxl4/IeDXAYKCIKxAE3ujjoScUJcE0v426FU7nxMxQUyM5X/82IFiKRVIlmd0+zvW/kXb+fuTDP
 MvghTI186A46mr8JF9WzCSLb9a97tVH8l+k+tE0iXQ4nhJr94fi0pPLA45Bx/FGR2BEOWuCeYJCi9l
 SBC/A9AaSJ3fzh8JwjgptK+YaumOu/Q8dSLgk0hfZvJHVrTldFDQ9TKVnsCt8GlSXHCVLtXdS2yke8
 U/Ld9hmLdxLQrIHu5MeWZKiTQsGJb3tmT8UJhejxt5vAntw6QMfJ3fBpd8U34XzQo4huED4StFgVW8
 4/Jz38uyOXlKqWEAo2aznxqUiVdegeuvuvkY9leBhNgPMEAY5pkjJhxFPzElH03wrZIf0drGKEi/7A
 RlfLtAloyMh4zRL3cxTptn8Csx1IZqGqZRKsNJPekcadnc7cNr87YBkLY3hIbxWB6czk9JgdhhLUta
 Y4sn8y376AuayAH+ule/1uKQ17aigLfXKqiT64e0QS8oE6G9ydCXPMGY+zCbO3Rrw95Yy+GEzOFskU
 t9TLCM2V3XRPDOY2UgYtpmMvC7RrbMxut2HM58Yg5ZxV/2Lnb8MKA/98m7AQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merged v7.3-rc1

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Rebased on linux-next
- Link to v4: https://patch.msgid.link/20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org

Changes in v4:
- Rebased on v7.3-rc1
- Link to v3: https://patch.msgid.link/20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org

Changes in v3:
- Fixed node unit number on patch 3
- Link to v2: https://patch.msgid.link/20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org

Changes in v2:
- Dropped applied patch 1
- Fixed node unit number
- Reversed clock names order to respect bindings
- Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++
 6 files changed, 257 insertions(+), 3 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

