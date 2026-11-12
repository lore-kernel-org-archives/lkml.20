Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490395;
	b=P4AhfRfEF/rsfFkxmJvCyuzm8Ein4lNU2ZcsG0S5HwR2NkifkrFylvmqM599uEYEpCxA
	 2up1eIl6tXvsbzEUkc3U2B+uXnLcdE16ArLFeBEiC6FMfO6xT9ITGTuds2Oe/4zDtwf8M
	 FJeOUwhHzBS0/UJZoxc4BM1MUtf9V3wyxtkDFVmQlJJzTi2V2kt+4JhHcZ78wLc8Qi5dw
	 kk/v+U77ziviUPMI5aUj9PSAjbNfddj+vgDBatoXsHSozzzAFmG+CexLMF7fHeFQW1PSb
	 Xi8xfBkAE2RwwgS6eN+pGrVj0GTbO8OGx6zjoz3WA1Hl7z+786KDsLA5mWxz8ZRNCeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
	b=DvmqyeANe6bxgmf+n+SEOM5zLW9Zl1qSsKBr3nv30caNaZcdUzaU6xWLm7NUGN6FXP7b
	 m9s5y06rviMS8QgE6AFVCCufyNor6tCI3qZqCRBt88B4hIhnTRgiENlvLUl1j/NRcWC6T
	 KfnwGhkAStKjiQ/SUmAU7TRMvWJoVeli03a01nnhD+UEgVbU+qMcKR5yW3vkDRKJlQ9/u
	 uBdpoCbVuUcf5d4nubzc08Ev6nM6VsecANIOImzgO2YK8hjm8YqrOxBbWmFP7tQRLDoYd
	 HtcS6YrtuwFqewj5WhNaJwfffYFPys1uYypScYF+zLZ2oeZymgI52V0cfQtzYlTf33A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b84wM/G4";
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90800606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90800606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b84wM/G4
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so36149081fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490393; x=1795095193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
        b=b84wM/G4vgRMKU6oCG6n7mGlXsC5PjUWqVhtv+VHwzTgQ/POI42br+FPYNgXKgeDMC
         gLIwKYG0rSsVu9Zp/iLKcFEbA3WReq99mpRHi+ae8TDkvji+Y7IU8iblAqCRkxEEN5YV
         Z5FvV4/Zg1hbD5/ByTdxz1Fslu1hi6EHd6N3HHgi6XQEI6SGHHSqcWQkatt0r5+ix0Wf
         GqI/pXr2qrbPa8ikNrHRMK+At38t4EKqbIMUp/ApLb8mCxWCN9IS7InZ8OOn0nRxDLty
         seAGVGYOLaJjkjb8v67DwCzn0gN3l4PfmtcPtWUJ42hVGFCXWgJ8tAWMKgS9900UCXUq
         Alag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490393; x=1795095193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
        b=g3jZ33T+Ll5qQVfk4p2jLCJqpjp+HHh4aC6R1417ppIhF0QEx3CehcHTTHUnQO30TT
         5pzrQDm+DmZDlBkHKumhM9pRGx++42kGnGSu9SmNtc0ID8lu54CfJkM0/uU+NRxqDK7p
         IcsxShHb5I67StaJijVZ/PBVciQhDeK3uNVkBA1gM7uw02nRa8SwVBbdbb4uZajr4C6s
         Ux9GbeYy0RRnmfyFBiN2WnYFqi6wusnx76T5oGUMjqPSBNATqtblmizAOu+Eu/JwUQEu
         0Bb3CoqoRiwxGG014yZ3NV0ktmcG8vYTiLLk4DYV/BnBwa8nD0HtQ6SYqTeBtVJ2bm4i
         GzJA==
X-Forwarded-Encrypted: i=1; AL+hErEDJfTB7jIE9FHUeLyZxt/3A4CbK4bpRbNlHHWPyXRBy8jpf8FKbTHanovqItOrZBdy3jyzYSVh9uzW8e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OHtp4nFcmdPmaGuItAuSk580t9hcHOj3YJsJ/jU/eF7pO08XK
	wWBFaE/0RQTVHR7Ch0cxWna+WRHMCa5snrL/eXcYvXs2Is6OZzyeI4vf
X-Gm-Gg: AYBFou0Co78ekc3KtY+Ck7MKkK0UrVqaVCauMU0C2wevo5O1S5sH0xbLEHjnLyDsgyL
	BU9150pF8nxGC3mIVgdoUsf+G/w3+YMTL8S5zF2sGPgIIQ7lM18j6LdaoA6UU4cSXwp6Bw7VBOL
	zTMTR8FkTxhf7IWx/nEeMoHpdhfYMuHjK0/6mvn679UHndhoaVb2MKzYw1RNKbyDUi87GN6LrMD
	rVd72XpY+6qZoGg4YcbWMjXensi6+cvvuEtV7ENwxs9f7wyazfLi4NwJCSlynBnI+EcUFb37uPE
	xYKQav6TbcFoH6ZQBqNvYrAy9/BIaHhlL7eH8rRMoMpNi4+dVF8WI2CZ0JQFmcXaXiVC/lkZpxK
	S/Eh211F3T0B0DbX+IAn9ILVyo+1g3IWqSGfS0uZS+BB+etRu3F06CSifr4zdT5lVX3Xe5Wmbt1
	ZZbhhc+bWwEqcE7nFi7itsWFO/SOnCv9n1yp8r61qauK8nlgRvH4IRhCOvW8US0zX6RuqPGjQR/
	Qlco43C3QfmNOzdK2eDFrJ6cvspFJvtk+JWeCBBy23E9VBKtEUAb943NcSzL5dy/ZwjTFDGOgM1
	W3iEVO7+to0rPRUbfGos1jFfook9WXPEKOHsaftr
X-Received: by 2002:a2e:a882:0:b0:3ac:8e61:fd7a with SMTP id 38308e7fff4ca-3ae126b904dmr12347471fa.16.1794490392858;
        Thu, 12 Nov 2026 05:33:12 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:12 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 15:32:58 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sm7125-samsung: drop unused label
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
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Drop unused vdd_cx_wlan label for vreg_l9a_0p8 regulator.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 59ef4921f31e..5685755a44f6 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -214,7 +214,6 @@ vreg_l6a_0p6: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vdd_cx_wlan:
 		vreg_l9a_0p8: ldo9 {
 			regulator-min-microvolt = <488000>;
 			regulator-max-microvolt = <800000>;

-- 
2.56.1

