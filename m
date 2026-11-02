Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626845;
	b=f4lOECR6gqMDCTQcFUYhtv5pfT6kGQ6i7+nt4yi/PnRDcu6qanM3w5R66xxis+dkhinS
	 KIGlyykQMZJ0zWcmWLCvMp08bLIu7n3r4HpNHyX28sbFjUxgxbCZ9SCwXA6R3h+GR7Jch
	 2uJQyDSv8CkFuTWoAo6/cRqBtOZqp+32n9BKVp2VsPUE21YIYK6XdHzlbaQVp1o2A1Esv
	 M2tqpqo5FqPJx7eGm9VRdY9GdxADSBRSeqcXi9Wmb9fCazW2gII8o9YWouPV9GgHGoXIs
	 FthyxPV0S1pjdN3GyhfeSxtDC4NFldUtLLgToHLyHyw83oVwiD568nIDjh/SnushgXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
	b=WqEWVvZQtOQiwkm5wmcdA051Jl/bcAb1x2iZGtmZN3obrQ5bpADUnefeo2N0OacAsmOV
	 n63hxQ4MSePTYIPqUc8YytXELZ8qXjeqI6N42V6WdoMxYNo95fYSJrn2L1mM7Rcv0Xii/
	 aPVsSk/D9Y8EgiQDvISmRDslxay5iJlRBqAAwhlxDmxXuL3Q0aUzsxK3hagHHtgTjfh5f
	 PMxFfSApRJC7a69Ntx4Pi9Khcfz/9ZpTER/awfCx8BR76kF8IHoK202NEoUAldao0s0jy
	 QE06XiKyxNPop5VxzVF6IUrFxvMfgxZVBUjUjRiAVewtRZSE+FezkCkSavc/rcVkWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6MyQrtd;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8360A2603
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F8360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6MyQrtd
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so31966635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626844; x=1794231644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
        b=L6MyQrtdRgTojq4Da8UNcdHLYgW40/lqqyejq6Ba2wWQQ77JV/8AbrZFrQQilEQG52
         vp0IXvOuuYFNG6czey/PnETBySbY0jG2C0kEDXfvy9AsvFKyHAzaSAKV9FaByaa926Sj
         vWLwz4YpVQIxjiN31GSXSeLGpxjrmvDyooV/8VnRgRLXGknMkeqFGI6WpmvHHbniWyuB
         4doj3edxKYyVA9z+hde5r8T9w3n7J2mtRiMiu3hLPt+Z2ZFUQrkPAhvigbEk9z8n9xUg
         AS4Tug3xzuDf4E5+IuuVWsnj5ZlSaa9Tz1PVw04MbkJCEcDRTnoixavrXvzI5VgVthkl
         JGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626844; x=1794231644;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
        b=qGK8bJ+4hrzDL1ZdheCiVY7TPXZ4hOP96FELXHtYXybUGvCEkf0M6Kq8ypB2XocMLm
         If3CR/6LoOM5ElIndzzHLKG9vQoxhLILPNcE9VcwZ+wcHi9aUXwZbwn0ch/pGLHAGDWF
         2ZHvAc1Km7XASLeGFYYLD0rA7oN1r9xvaA9eFDqjsEgoAY+lqrYcfDjiskIC3r3yPrAs
         33f+iaD18Bz4G4Q/QZN0vAgzLI5JzkLFTy7Fso664TVwzVQQEHS3bUacZb4WJN9G3vzE
         QJSoSMFPxJQJ+aFDbNskOhHOzZUFmGcfz5fBxrGG6gy6/f7DBUMpUhYsWc4KpQC6eGy+
         2yng==
X-Forwarded-Encrypted: i=1; AKwUvBxHcLzyDFRREo7ux8oAMS1kp2kma0SzuT/XwAnXz9S0hOF5SbsWPBhsJVEmG/DZN6jj0avH9XdHtSxFO3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG//9d+lADgYGCIIu07qysDJ1T9U38/rmwrCV5AHVgebU+Wwtw
	wZ+9D107CjXS71P60SB3Qx0tLNtwq9URtsV9ceGSGXqQm+v796a+Yg6tYBovbpPKs2A=
X-Gm-Gg: AYBFou2cHvOIkPQni4Sl4O/xw+AXHAfESPVprMasj4+xB3+prQGCCEdnZfmgPBXYsD/
	BDBA6+Mh2O6GWQ5vR8DV20ZA+twf51sqF0cpIgNwnSok90WOHZdC5tdqvJvP60NPOa1+TkCwY4M
	mMPeuKsIcfGNl5oaPcYwHHA7wrqvIK94Zq/rNE5c2VBmpQ2LaL0Bqtz0ikXXmQnBPC2YbfH2ERb
	V/5ydaaG/txi9l2M2aNPGA/tenZzyJFRukKV+DvhG5hPgfvPODlJJL53B2vgZUWbkVp5rdz//79
	URl2zcvFCIcdl6cfNNl/wRNgv8mfroKlKU6s8jT37hQ5dLLPYwRlPQp+7TjcnOpjLnNBiGKL0sz
	X7/MqNLbRB8i9bZGASMymFrx6eLPAS/nTjFJUC4jwP591DGRWb/ku8cXeCdeSHhjDOIigTqgG4C
	ljcpQb/iYa3wXdcq/5EO8z5XGbGfdL9PabEooOJP+SbIcfGszJhiWDlM1BNEnMJ9VOelXveaERe
	ltTX3928WfZNCis3ice65q8QXN7V/F+0/KCfFTm+jN7QeZ90XYwHBGUCyQwnEz/Y2WTbMUBDf0Y
	AuE5d4GCOHtUCo0pAYONb/pKSHZNgFEeN8n9GjAVBbBYI5oA3Q==
X-Received: by 2002:a05:600c:6214:b0:4a2:9cda:57cb with SMTP id 5b1f17b1804b1-4ac151a9077mr246967155e9.1.1793626843602;
        Mon, 02 Nov 2026 05:40:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] arm64: dts: qcom: support SDM845 HDK
Message-Id: <179362684245.3310106.2514816704767701626.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:42 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Mon, 19 Oct 2026 12:18:02 +0300, Dmitry Baryshkov wrote:
> Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
> for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
> version of the chip (SDA845) and provides a rich set of the peripherals
> and connectors. The DSI panel is an optional addon, so it is being split
> to a separate overlay. To (hopefully) ease merging, the overlay is split
> to a separate patch as it depends on the panel. The base DT doesn't have
> external dependencies.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: display: panel: add Truly NT36850 WQHD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/79e6e49d681714aec69bdc24a4d1cb592aea4adf
[2/5] drm/panel: add Novatek NT36850 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cf022beccbd43c27b1e9a4b03ace28bd39504d7d

-- 
Neil

