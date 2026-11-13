Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595139;
	b=pqbf5T0ypPsUnbVSbrjkSIOPcfZovKCRxSDNVAhKy55GPZAFJWO5mR4ulyPPhEessUnl
	 8rHeoTNqprL9sky+P8xEOzqsSgymUrPWu0kz5uEL/PoLzn3SU+1/jIAdkvzwAsPecuZI9
	 l6+BjeBmsUVa768VMMdgy0vq/Rvt6bvkfMyHM6gsmsrW1TwDQnwzK7frk4zYqtsRAxv6G
	 iY+13lnONNaXZqvkFn6IrxbTeU5acaXLFt46ThkFwbY0EeVWvSf+ydWlThnHN2O2lUwwQ
	 +2EaPJ4eHJozarynGSjnCVArvih4szO1jNt8f3QFRgg3IUPVyrV5C7R9xkoHJ6KJUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
	b=QMa8UM746eKo5HKih0eRi5GBuoOTnC092mDeS5/RkS7CwScI+irRTAYN+x13n9xKDV5g
	 Eed+GQYO6EM2tHngW4RD+2T2wUHNIS3BzwI2d/FceM81wvoNEoQXJ1Y+YCvSr7bVkwJXC
	 27UWctnDZBFDnIoJrcyOzJOSPi67LveEf9b95IfuYA73VNgWbcA3DG7OR+ZituGdYYWKK
	 3Yl+dnjFpzsO6gxxLyf7Mmopr1IIMs3a+bhr2dgyTtZW9aWvni+ZKEbgri2JnCoBd+7hU
	 5Pjdove7FRRqM1JT7ESFIPTRqy6CBx/LohBWtIhF53AMfpBHgdqaSu2nEKnrx46VG8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzlEBQos;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6EF60A6F41
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD6EF60A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzlEBQos
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so1507239f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595137; x=1795199937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
        b=pzlEBQos34MNNpurfGyXR57C0NNyfj+EPBTsCLT6EE+7Fi4G/LzhXJ2OL8x2yklRtp
         pqU54v0RQTpZvIhbxhHQAqnB67+/B0xguWkzoVW4mlFHf/P/SIXv8yTbgcIoAwF3sLVc
         0uU6yujcPl//gZIlsko9pCMGUJu+DrMJXKAi0weJPQRsfG/WFs45W01w/RJMFgO6ZoV5
         Vwk/qHGXElE0LJb0jJSGAZ9EPx/P9Flo9CkkyrFfv6Z2mOAFLHBzWVt7wJLnsVXYUjNs
         sC00lnvD4w4JP45/2HdtuuH/dT+gDYc+OyFd1TnDoB5XNPJFrJ3etxWnUAWZVE4I17bJ
         97mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595137; x=1795199937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
        b=gVI03H9wJKSw9NBZIvdB967iEsLePWgBgScTUer1+pyUpPIKaxUh4zZMAEC+u+iXJr
         ZqwmIzCYgwO58r97U7ZSWi854BbqlzM6jQHofYP8PN2Piua9iYKHIs6rm3HqYmHUzp1I
         7ZO4819UQaKMjwKQCsr7s/Vlt2VRrgj2dkwQbjF+6IFBIgBcvycoipHvGcEZP9UbmHX4
         ML+W0Dbe5eLlYdpoqVh7TBYRzDTfH5rqhsgYKiDPY5L2o1nDMeYhJA2ugk617Re9NeMR
         9Pk1/L6h+rjpXdNOzy7F21RMhwxcOd2nj95VR4Cd5/z4udJeAP7opa73HrdCYtVt3dGT
         hp5Q==
X-Forwarded-Encrypted: i=1; AL+hErGMG8Z7eg+07I+i2w6A4JjHcJpMZIW/1jfKOJTVfzXhs0zqK7AjzABSwJ2vJxuOUq1p28cc67CWIpbYeVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iMYWdmRQ5dwjKvtTp4GV8Iuc/BW9yP+xyM14QNk3cQ15LJWxi
	CqcsVWwlmaoS5gXpYWcI8es/nMKJ9JHsNDJhodO18WCPDjC+HZtHcRTdtZGKu7O0Ph0=
X-Gm-Gg: AYBFou3iY0/aBdg0Hwt7oq2cgD90yAEAaNzr+B3kZB2McfxD0PxGghJ/LDY7ceeKLRo
	Xz0JSxZeXezyjKtXFSZ1JXdDgTVIKoBKLVDX0Y7p4rglErPU7D1ObEpWR2iwUo66SNbYRz8jQOH
	aCWR9rcBf/eM8k4ntGxwP2z5sY0afHKiOmnJYqkGX+wOzPCJgRzv6dz3RM4keeGwV2m/iTiMUI4
	saidc1CRiGdfiZFB/8AKKwK4EXTMdYxFhd4xXEDwf3n4PMiaMyvt6Gop8luqXD0eFs2QvBP3Czc
	lLhTRkLYNjoeJJDNu9PWMinh5gM+hIIuE3VULo5/HcNagOlTRHwkiCOTl8ZClBx/rbSTWEO0TGc
	GLGiEk/khZgyWieSSJeO6tiTT4VBExlJRhIz5E4tj4+Pt8YQ0cbxxYMZqeqBrOddsWp/J2BDXic
	Z7L2Y7NgbxJ6X3FApg1LQKskCSekvL+yzlcgmKXJmYWayGT9BD7e1KLSq4XK7EqoaLCYgtU8q1e
	ioa6AsGferDstj0BIO0n39tCNZc7VGR1UPspbYc9Qc4mcPV+s7VLJ7+8je6tyls7Wav/Wp15moQ
	wBLx+rvRsIWsrTY/thIrPCbKMqnWKgBdWoHtbqCa0hM=
X-Received: by 2002:a05:6000:29d9:b0:498:b92a:30b with SMTP id ffacd0b85a97d-49c70ed7d88mr4816619f8f.15.1794595136922;
        Fri, 13 Nov 2026 10:38:56 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:32 +0100
Subject: [PATCH RFC 18/23] ASoC: qcom: swd: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
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
Message-Id: <20261113-topic-sm8650-el2-v1-18-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=588;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B8W0+YjZEiqoAbB2dPCHvIJpxKQMBOWC30klAZVCDd8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kmG9XLHJeLS7JkptOZPLWufRWNkDG/W5drmOwW
 4Y4Jx0CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJgAKCRB33NvayMhJ0R0kEA
 CPcpfO2Q7RH/mOuBrdmSsYWh/Q2dOu/1HoNUT5WDw9BCZ9KYeOyugM6c4PRXbtOZWvx5rcmCrgj4dK
 uOctwbfOrRO7CrXqfSUhskQ4BbiH9AtLqvcmDNt6lZQIi++PrIPtZu/3RVospJueeLMMtkTxlQnaka
 BhIHrbr0o7jHeVHDde7MIVJb9jsk7r961kQ3n+tSxuMkYZuzW92q7kLDMf2T3kdUG49fQq+HtNb7Fn
 oS912dRmDG826ai/0NTCaoM26y1CYZR5zKxzdXmheZPsHts4GBG39RZcFIGnnKaWHQNaQLpdQ1CP6L
 qyjGpWD0rPxLsHi/mmKZ6ImyWTSNsxBUJXrAr8vionS6Cps9C3lPWY5sqeaTdFU7bjYjKDByBY7OCg
 zVwH+GspOzc97Yqo0/CfpwTEuI99sqsyN4nECNVVlEsGYByj7Y8W8r95sMqdWyBeztHhfLBsl75oMO
 FGKGYrfOx5ArkG9Neh9MIvw8uLBIR9Lon0M4TE9Kynly51xl6CZvyJaPlCnIpK0CdhY2hbx/6rLKLV
 Yv2xDY7I06/F7K3vCRn7tR7/9U9vJhFHkTGT4DH/BCpYhpbjNZbOJFT97MfTCsp1HaGiiLeCrg4sS9
 lXXSdPVk3ThK2lywQ+5XCWFy0iSp0cNH+gJPh5QzpvZw+n/45H+zRxX33QHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Like for the WCD ports, allow the WSA_RX0 port to be initialized
as a soundwire DAI.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..82a12c050d5e 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -41,6 +41,7 @@ static bool qcom_snd_is_sdw_dai(int id)
 	switch (id) {
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_WSA_RX0:
 		return true;
 	default:
 		break;

-- 
2.34.1

