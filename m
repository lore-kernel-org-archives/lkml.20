Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702135;
	b=OSgrIkACvQRNdMwmeFfi878BSaN6uxZ12X0oRQyIgL9wYKYj7jHgLydDayl+90G4tp9I
	 VzipNzp2tcpTTml1BmThAEdzG1DcYDzPADCqKmiAI+enuJfjVeRYDrWAayFfiyXsTwTCu
	 MPaUV1UxhmdyqAGAh94QMf2IT1nhmvuWCmRh0HWurWvZIIJjGfw4pA/Ge6pGo9nCzzWqx
	 8j8EPBaCUuqkCnSucl29B7d+Dl22Q0z4hQAP6EU34b0VQuqji02gPAOylvlpvYRsPhLVv
	 RzSP0IUjRJs6NYHiHF3IiyQPL5yZKmMDfK8YFAqq0qi2UtY1svqa/ug7MuznudsyGUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eMLO9Fg6IwSw8K79EAC+WMzi7PlAaow3vS/afcDMDq8=;
	b=2PP1++xKRT+EfNDFQMS8xbAZN3YMcIhN3yrZBr90lkNDb5/knwEDnBJMoYEHkITUp9J0
	 CquqzM1e6P38PQcQZd4swB4/ox3KOotlEBeHn7RTjLAc3GSmz6OdIJVSqWOc4mUaqPyTt
	 Zbi0afdcJNlpqGSkgookp41AL8ybHEvrVwYw/msrW2eErYTP96USnBn3e1r53B5DwnWop
	 wEM4+i/CIAhvGe2Fh6rhOdNsm44j0UER1LfBzrpIKU3n6JjpUPCwN/X7ixsFEeEXMehAA
	 r82uqVx2CEuGYC6jAKdBOQcFpjSKdn4f5BojInsdTIBcKWOPEv5CM12b6By+YDoGH4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Urydaz3s;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBC3607FA3D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBC3607FA3D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Urydaz3s
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3acd239776cso9971211fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702133; x=1794306933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMLO9Fg6IwSw8K79EAC+WMzi7PlAaow3vS/afcDMDq8=;
        b=Urydaz3si8T7p/pcS4cex3Ss/KYsBOEoJ8SM1SINua9z1sPVi574cWGe17XV1QlE8g
         dJAdjNqZQlYh64XQdsfPnYb8JMrYg4Dq5hnayjKxmZzAxRv1+HiI77mRYUGM9VX4SrMV
         LAR5JQ1VaH2Rdj2BKLuDWE/aO8AbWfkYAutPcpHibc+9+aQg/qupuIjIF7vXyaZUpxvg
         V0l8nLOzuxz0Kf4LJTlsWjxPUfR26MMrPj6gntnBdWPQys9UR8aqK0Amtsw9TkpqObNF
         Ly9G4VMMlhONuEpGXq3ARvjflafB0IQYjRTJQow0GosXGbGTbKeZSt+YAqFIk2zNIYuU
         1gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702133; x=1794306933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMLO9Fg6IwSw8K79EAC+WMzi7PlAaow3vS/afcDMDq8=;
        b=hYWNE0xGbw0soZMsHB88A/6WOB5g9eDiI62mMIeM3K/L8uaRovq+7gQUd2XCSYtZoV
         D5ngi8TdCqkbhuZntqizHnKTPl5T53RwKvYKS6+19Mz3Y1clcKa1ogo8jqcE55a6khqT
         8Y2JAnGtC0KJ2S4tAwXp7GRGA3fplr65NfTicCFXwl+RN41FApa9U0G826Ib9KXwH26t
         XmEJYb1nPvgIrXQiZd0r5EjcRRG/2+mZiJWsQNr7ZEFM43GNI98CA2VZRsPIxVs3eNkK
         RIUEpet5ZUAI3uyRhpTsfsVcrj5YGBY2753CJV2ma/9XCrMoCcqTlMFsAWWsh8Ix5wTb
         U5pQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4NkNk/yY26u+ow3CLSefiHyJSpg1KZWn4LTPY9nBo0ocFDQYJTeVTD9GHwAuI+nWetSSmJGQ4VL4G36w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t4d6vMCHCR6Y2kcLK31aMzY3FYU4unV5Ib1NlHJmyBFvwqc9m
	bl2ZbiSyoSjl9/3ZY2ktoAo0p/VKGaE4J3zUOwK8Uv57UA+YjeExTTc39dWtAOam
X-Gm-Gg: AYBFou3AM7jgWycxS6vi+xB1T4kChsJMaISFLV10otQxOttV6zF4LH2J71REq7vBC0f
	hFSXi/CNAe69S5U8xGk9vEiCozNiuaq1bDVoFHBv7x7ICtrUWwcoB1GoqfWcS302YVGkXS3WXVW
	6m8cQyQOH4701jkEr8oQcBJ6wn88C2bqLJOeapB+YzBuaJeFS3PI7MWPbjtLZBkh+veRgKFC3Jn
	39H5yiYqyRXDMNYLSGtw7vhvBu3T9LwRhrOpjP4CxQOUn/MubQu72AgtbGEPC0EaQciJf0uNHaM
	7xWyYo814ByAO/CFp4bHlQxcQNazeP5ac7kepCiL40W0DFVMZWOtHScLgwLYPgR79YTtbeiL3jk
	mbyuvl3A5DAQIh2udWl1PXD0mmOzqOJpU7joVats6F10zNnZuxjtxRu97hNIRcegcGj38FMmZ6O
	2a/wcfy+wjCUgXISL8ZxZHM1ey5895VsPK0hfgw2cfaUk1XxUr+t6EIPvSlVkkeZJNDHZmgmVfj
	XF6zo+PpARfJCE5OE94KIPWONAJxfEAWpEoJuQJXBKcJgw2Cp5Lls5RpV+i8a7iA9aV1IwkGkoS
	iUXF6I+ZtCi5yzXJfhNN5Zg+Rj5sv9Wc21eh6cas2xCEv4DkVrEUbf76g3nTQrB6zNY8pgCYLiw
	9UA==
X-Received: by 2002:a05:6512:23a5:b0:5bf:b945:2c54 with SMTP id 2adb3069b0e04-5bfd957d04fmr4385163e87.66.1793702133542;
        Tue, 03 Nov 2026 02:35:33 -0800 (PST)
Received: from valor-verifone.verifone.com (balticom-242-238.balticom.lv. [83.99.242.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074802esm2121007e87.73.2026.11.03.02.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:35:32 -0800 (PST)
From: Stanislavs Nilovs <valorcool@gmail.com>
To: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] Bluetooth: qca: Clear 5th byte in TLV tag 27 for WCN3950
Date: Tue,  3 Nov 2026 12:35:29 +0200
Message-ID: <20261103103529.804025-2-valorcool@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103103529.804025-1-valorcool@gmail.com>
References: <20261103103529.804025-1-valorcool@gmail.com>
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

This fixes an incompatibility issue of TLV with 5th byte set to some
value in Tag 27 (Deep Sleep) and the QCA driver for WCN3950 SoC. If the
value is set in TLV, then 2 symptoms are observed:

1) The QCA pre-shutdown command (0xfc08) always fails with timeout.

2) SoC becomes unstable. During power cycling test it could stop
    answering to any commands and QCA driver enters into the "SoC crashed"
    loop and can never recover.

Setting the 5th byte to 0 resolves both issues - pre-shutdown never
times out (so, is always replied) and no crash loops observed.

The Claude Opus 5 (Anthropic) was used to create scripts for dumping the
tag values from TLV files and compare the differences. The fix itself
was written by me and verified on real hardware.

Signed-off-by: Stanislavs Nilovs <valorcool@gmail.com>
---
 drivers/bluetooth/btqca.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 60735b70d89a..a7302a3f9774 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -443,6 +443,15 @@ static int qca_tlv_check_data(struct hci_dev *hdev,
 				 */
 				tlv_nvm->data[0] |= 0x01;
 
+				/* The byte 5 in tag 27 (Deep Sleep) doesn't work with QCA driver.
+				 * If a value is set to anything other than 0, then module can
+				 * enter is some "endless" sleep and stops responding to our
+				 * commands, and the QCA driver enters into endless "SoC crash"
+				 * loop. Setting this byte to 0 resolves all problems.
+				 */
+				if (tag_len >= 5 && soc_type == QCA_WCN3950)
+					tlv_nvm->data[4] = 0x00;
+
 				break;
 			}
 
-- 
2.53.0

