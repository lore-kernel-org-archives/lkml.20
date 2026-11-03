Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675706;
	b=jBq89patHT2wwsf2X2Xyvj0D7DfO+ZkudEUsIq3O2pVdqqaxBmG1tc+OiPeT8Kt2d12M
	 hoxMr7AO0+++FlJn/V9bIgMtwXuKwRDKz+yMCD2Wwgeoq1noqnii4DGo4gO/R6Ck8Xq16
	 aC/fjmU7DbqD8Js1EY4QymJAM/2UJkldLWJBvryk95wfaR6el4+oHWt9VBJVBDkvw3Xrt
	 MuC82mxw3LiJi8hUfvpViI3TWS37Yi6CNLrEr1oX1oU/8bsZUthGCsrZugd0Fn/Kcr3pL
	 ZCEiV2jxZQYXCc90ZAHTU5ZYXBrTOAex7ZIV8jtwSxsyWipM6VtoYnoKQhL3BKiRbcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SKXI0sWSYT7UPLN0EauTsGPP60jK0MdnGiP43AY+iUg=;
	b=vgDOXMdqPJGN4Mj0mXVFthsUKkXO+EezKtiaknwmw+q9lbYx49YMG+sTwHNF/NCGEF8g
	 3ZYSBnz1khgmV+bgW0p8YR+lUpLDOFGIg0Klf9ngxmU23FwiJuUUlWML07sosFwQsqyrV
	 +vpHOafoYzyCJqie/kZ540GTqQYdxPoBTZcHFCwdJqaFlt1BmuGiISLdNX49960cYKXzT
	 8v9wgRc3AroyFQ5F8jEEt2caO0EjAFku4ii5xj9w7hQkHH3rM35ZfMhkoZNolya4jdQYP
	 ezvQCO01BoeEA20dOlXK5gJ3EmThNt18gJrZRBQ6RMGI5KeKTztzJxRqXGM7Ov0KiMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoqvERnD;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E7D606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E7D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoqvERnD
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so5545441eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793675705; x=1794280505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SKXI0sWSYT7UPLN0EauTsGPP60jK0MdnGiP43AY+iUg=;
        b=MoqvERnDjdRBmannAIgk2l9HInTM0FPNujozqtsQ4dstlvoAFjQCJzok0+sNhI+JUy
         XwXs8xnYC8+49sZyeTLv1HUUjSm8jD7LnYq/rnJ5lbrQA99QNKrSXllru+eSfnEcJK/4
         nOGhHej978lwod5zvZesxKvfjV2IXK0iEyLtmJia8zPimZBV8qO2B8UuBQPLqnaN6k5M
         l9cHUO5V47QvH6a8PgJIjg+G6hwFnhABVSPdsP4MCdkeFOzmqCLmIiCaMDd/nCDpxNNj
         ptZVaJgQpDV4pWWOg3xwN8BJLBwD2oqyDo4OKR7d5aI6x/2YOgqbNX5NPA1o9xxw+Egl
         Gmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675705; x=1794280505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKXI0sWSYT7UPLN0EauTsGPP60jK0MdnGiP43AY+iUg=;
        b=a2IbcBmRsOd1/3RvF99xOjUFyQH6Zc1y4zNMuX8aaSCNsDkbj35xgFCTiGZSfaFYG2
         hXQd8OYFMXNQQYyFZ8/RGIZwUh8J3x1V6GdEQSykBLqO7+JoTxoUstlU1KSIV1vsjPxL
         TVC5oyBT+dA6bxM4tKi856hMYjWxNmmJkt38sJItSsCfHGxrahwWJXjRDZtgSFLikusy
         uOSzNOyft7kgMgZqQFQVOBEuGKZo2m9rwTGkn7Sne6Wtqc9GQoilG9rKNyxKzGFPrnXM
         FVmN3J8zl1++Q0otVw/9u3dmZYYwZsyPv3dKZo4Ljf5oxi5/FPqNrZ3fVuzkLA0DDHGa
         z6fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJTDyptMXTZCCFyYh85EFv4/kqQD/d/qImO3wBbbVGJLGJjTNV7GxcY3t29f5PMzt5yRnwjuphQhjgbQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8suUMkWqzXM9hv8AxeQrWUa90wZ0PeHPG+jaNIpFqPVDjzNd7W
	1T1o5VdisO/adyxxt2rCpiDgrH89u/B339WvrDPmv5l2gQjffvWzJrSO
X-Gm-Gg: AYBFou0pq0qPJ8NeLMLPd7PsDZuVsrb9ciIH7ncBoAryFEBDEPwQOaEFT4PKxgiMnfy
	Gg2tpId/IjZ4KDzqVucNeWQTGOFD6rJ3j9VUbJAFfsxpqf6hW+UKzIDZ1ANmqM0NytwvS1+KfaX
	IkMs2DJSePesXwi/f47k7nnE+sSH0XSaIErn5LK9aFhpkeH3K1fidbO45smDUFCQTuAXR/m7snK
	4XYmaz8oXtLQ1r+V8/p1Pw8TnzpDUWeRSU6OUBka5l1zrVFTg62aVPfhv11aQsNejP/iQe5Wsyw
	Be2Rtjwaedixbtp9Etbjahv81alxIv4fYsEg13tF8MaAoRDPqBLdJVS+OImuxixdeXgg1VqlYsK
	rijksObjWjoWmC+ftSCSzgxVjxUpIYePRfzvFOi8HIWs5DyHHlHcux3tDLxqTinXiRHZeqaBvJR
	gvo9uNxDHZQwRQjGUDocs+ptlk87ETH17juoI6dlfBClSO1W8qjaytCwLtSNeowfVOlw22A7TqR
	Abj3DjJD+oxNbWoh5RcJEsEAnPa8A4k7Sh9m6ifNX/Iq6BmsGZbcFaoXq2Fpw29HxYQkzz188jY
	xkOxcj4AnMuuO04o88CF2e8n0iqq2mkdEpKYlQ==
X-Received: by 2002:a05:693c:601c:b0:36a:270:ce76 with SMTP id 5a478bee46e88-36a424de9abmr19193358eec.33.1793675704513;
        Mon, 02 Nov 2026 19:15:04 -0800 (PST)
Received: from xploitoverload ([2406:b400:f11:1bac:4040:640b:8a1:8629])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm41090051eec.6.2026.11.02.19.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:15:03 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v2 1/2] wifi: rtw88: pci: Add DMI quirk for HP Laptop 15s-fr5xxx
Date: Tue,  3 Nov 2026 08:44:33 +0530
Message-ID: <20261103031434.14449-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On the HP Laptop 15s-fr5xxx with RTL8822CE, PCIe ASPM L1/L1.2 and deep LPS
cause the card's firmware to fail to resume from low-power states,
resulting in repeated 'firmware failed to leave lps state' and
'failed to send h2c command' errors and stalled network traffic.

Add a DMI quirk entry for 'HP Laptop 15s-fr5xxx' to disable PCIe ASPM
and deep LPS, ensuring reliable Wi-Fi operation.

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
v2:
 - Rebase onto rtw-next.
 - Pick up Acked-by from Ping-Ke Shih.

 drivers/net/wireless/realtek/rtw88/pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f5144..c87de645083 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -1779,6 +1779,16 @@ static const struct dmi_system_id rtw_pci_quirks[] = {
 		.driver_data = (void *)(BIT(QUIRK_DIS_CAP_PCI_ASPM) |
 					BIT(QUIRK_DIS_CAP_LPS_DEEP)),
 	},
+	{
+		.callback = rtw_pci_disable_caps,
+		.ident = "HP Laptop 15s-fr5xxx",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15s-fr5xxx"),
+		},
+		.driver_data = (void *)(BIT(QUIRK_DIS_CAP_PCI_ASPM) |
+					BIT(QUIRK_DIS_CAP_LPS_DEEP)),
+	},
 	{
 		.callback = rtw_pci_disable_caps,
 		.ident = "ASUS TUF Gaming A15 FA506II",
-- 
2.53.0

