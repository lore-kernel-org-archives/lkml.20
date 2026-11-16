Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864484;
	b=1RxKkMssfOIPt4zTC9uBzB55gxvrNW1rRBuPUN2nptm6L3T8RTVBExjlSKPVfNzKigoS
	 GLo5G85w8gPedkcSete3g25+8Zumc9q1hy6UWuH7ajzpnsdFKdsC/oOQ+uAeuUt/s/7oq
	 EVqM9cPc2WkHfPajd4Af70EOhFs3iJ6bUgtdgKV0XVGNYjRmbZUb8YA8JXxpkbt/Fjuah
	 z48Pwv273X/S9EyJRF2QB2kqtafwTlvdl3ppQ/yXf0sbODgRaq6GiftHk4Vf+oyC9tURn
	 E0U0fdv4OI4rAmbtLbVTJnk26QJM0q+JVI+Fzz2db3v0rehbgd5I2K6rsKqRuXDokZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
	b=qs2xnjrB4gQJMUp63OHhFYKPqs3CYHgNwra1NQdIvDb5OO30cEftNVQnNApUPzi4x+Gf
	 Sg2Vs+JwQNMifCvVFPVabIzSS5gERIycCD3dpPgoOQrsO4M9Q0DMLaQouXpL7t12jLKLG
	 mAt8xleKp4uaCjqZzThXYc1TcaaJQk7JCkq3i8vHGrtLg+0k8CZpgG2emXj8a92AOausH
	 K4tPSxZQQNd+4YmRC9abI9v9DDQX7069lGPpwIPgCubDOWKbgy0ydKkoasMi4tGU9Ybgu
	 ixiFM+jLNOEB9K1sTJ66X3DTtpEHhuuBQOInJT/Q7V0Fe0ddF1Zgcoo4RTvt7ZCvl8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGH3kEag;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BBF606A880
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1BBF606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGH3kEag
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490585eddfcso2811657f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864482; x=1795469282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=UGH3kEag7+QnSPw8NgN0my144BL9MI6P+lzS4lSmWpGQLU/I1Wj2jG9zLis6cKkcyN
         ttu90mcZBjnspWeaKA1sIRwB9cdXaff25bi0pIzo2nlZOYJTE5UudY0yiqgN+oIc1Gk4
         27gWEvQJDPseqUIJdZV/bKhN6eyFQZ7udD/C2KLm+okaF7uw60hj4NRq7HAVpwg467V9
         MmOa42/K0JqbfZnd737Yd7PfrKLwppbtes0cyHasCRpOwm/EKfvIwi9YyvfmdII+iysG
         TW0GSAVvcD/jtsTLZMB/5KuH/HSlooTeqSEMLMXw4y/dOpM0oYUhyTRXoRWTIM99mqwk
         kqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864482; x=1795469282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=Mjpa2Sa53Ed0wfrCWNmA9j68BbUcQ1Ko1MGF44rYvThkOPgN/aRs5C3fsFNmsEv+f/
         LrEcTLvOkv2mahzZWWGOb3CA4rv770V5n6C9vrnXYA1jEsPXgN7yoruVyAU5hUYRznto
         iZcH/eDqolTcGg3KiFU8GTHOByjKP2cIlVci5GHvxRcye/NxR3O/PHWqLqaxOITWu/MX
         9jhTkXbQ4hTNAyh/HjHtu/foHmLHblnTAVm+qyRtXMpYvBKDimVZYAkZMahD/GcH/lix
         ijGjruU35jHxB41W2MkcL4bQrRsot+vkBw+zwjN9TITSm4PbbpqJjDCTD9UzwUdsiKV1
         2rdg==
X-Forwarded-Encrypted: i=1; AL+hErFIJuOgg/XGR2F8CLCC+T7802RJYVG52IHARLaoaVrKtiCTK0Dyjif4ENt0QWIGWn4+SxLodfQu24zMEtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+S5SD86o3L4vcL9yDijOcK4iQoNWvRAteFbTSR73RILKfCNG1
	qtUe+O0jExEP+WgW9AHWHwFPn3Sg5nwi1x1/LeEBVsv/D3O2LbKFVQ0H
X-Gm-Gg: AZFdTZcXcbYNWhE7rIByCDtPXFueqndEexWOsSMf8SqPWwpyiN1kmNBfVxiHXSAsTPx
	XtdprqO8cG8HqAy5+vi8kpAeoe4sHRPlATPMWxPzRnvQ5pchO2MFD8KcPgKtsg3np7z+AMhgniB
	i5w1Y8bAG91dMX0Yt2fCwrXgBX7jdqjiluBUCBEXyZsZ8C0tr1Ssn8uL7T7pYiTurF6hmAQKg2h
	M6LWNso7J5pAVbKrlH3JytutSkpUmimmk/mHuRimK/mMlV2Y5uCXoejfnCbnpnN65L/E8xtTz5c
	TeFvthn4V/Mt5KT4GOe//V9yOvKlccFz220iKrU2DV/OKZjP06xF+aCN/ibtXqYOHWTY+dB1nCk
	zrkbxxhA2LrdZx7gjV4yLbSi9OoNm9zZkdzusa3nyL2uUnn3Eru+zU/4lIK/V/R/vn8R/yyP2w0
	6dDLYfiK2xUV/0efBM2K55hUrKvNFV0QH0k3g4vPVcAzCqlUNTEZPG03kg5OOKZcEaGXZGw/2Gz
	nVjbWcCyXZ5IhENmXq1CohjqOKpk3Uvtv9AafVHtfdE1jPQCwQW54A5CG4fATG0kYT4ev2E6TyN
	Zd+B/R5MAhoxrd2yialw8GiA37vsbFU8O5j4Tf6n
X-Received: by 2002:a05:6000:5c7:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-49c7325b40amr23107019f8f.57.1794864482125;
        Mon, 16 Nov 2026 13:28:02 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:28:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:30 +0000
Subject: [PATCH v2 14/16] soc: qcom: socinfo: Add SXR2250P SoC ID
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
Message-Id: <20261116-halliday-dts-v2-14-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=L3bECMGWqB70KSAXliPLAtrm9JvwyHz3xUlIS/JSaVuyDRybXKh4TJZIKniI807WZa1pL3+Ja
 bm5mXrDXMYUCX9Qe7poGqRt5BD+3P/4++4UczCRJAuB1UHs6hFIK/pI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0

