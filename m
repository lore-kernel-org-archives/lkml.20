Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206240;
	b=TccMAKsk69Uapt7VzgPKBSWHdMdopud1CoJJXzKiFIZ+8iEzaKe4nAlzINzJSPHpRt1u
	 xjBldECLsY18SulFWYHmtoa+cWpHrMNq/Qj7vuu0/Amx+xUwfFGU6uLuV+7Sj8FDWyHTi
	 b7FW0qmDByN2UXtD/Yv3r3ncBUZP/gVugnoxYMsLMcWyxIJ8CukQ0LHGjvLgKQ65iO8D9
	 HLTverjaMoUiFFcBGEXExAh/ppfC0sp2WILOY0/h7gqyij/kv0WCnc5AyuK/9P4NKC8rU
	 9tbefwUiXTqEMta9FmPxydUeukJbSqA+7lWAaCvbBjc9sB72a062vyAsTdUeZZt+lng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
	b=1iaa0fLT63CykmwqOVWJE1gu5WaMTG+vHN8UpW3IVQWGExMsvPUBrE2eUH8oZBPb3jF6
	 k6LcU4uhds5nhxmLb/e2n2+tYW9gzQlYQHIWgnmrnQin8KEDe0z6R075oOGJE1G4mXlIJ
	 w3Aavqt1+c1vlxKBwuMCZyCoNMzrOQst3EmRAzWJs+EdEpHY2LloeiOil9sKvs1UienBX
	 xNEwlIpc7VoMHmEg6T9IQlQ0Dsl1xFxOaKai4V2KvHdxrAarT3meg2Hc4u2Vr3WYZxijv
	 lcXmUpqfJBlMcvmG0R7Uz6jJmBaSSadftfAElf4wYRVxRLc/F7994pqLtyUmr60+/LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43426606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43426606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13630555e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=bvVViE7sfBqKWfi/kLDJYlnvzOUXPLQxwi7WE8YcmF6ZlMSeeXt5LVtwTgYjpBwkt8
         SYP3vMcQXr/owFcgMM1gE2QwZ/DTceP96Ogemeuc3wSVYptLjbh5WQ0zOa/QFUl5Bsyv
         t91KeRJRSejTTfSC30ERKT+SYsNtmNlFP19tG7VGrb/Fyrtxkv8HCWTMM4co1xxufiUC
         fsayYomNX2KXae5ip40Tnzxu0+b09pZZ8pnmB2UJbRFHhmlzRF7my1fWETNYJaMtDwI5
         xLbeFqSzSFzkr23lLp9iNBgX8plx3P3KNsPgixIQp18S34Dqr3UjM2Pb0SImAbIC4Wby
         52og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=wkiCGcHd2MhocHfJ+YtBKE3JwLofq0W/IFKVjaVafew1fQQStmCY/Kc9zJnS5Z2dTp
         BN2P1aKQi1xo5v+sXB2hGUyxg3SWaUB6w5RSXh9fJPwGPe54sSbd9Rm32tBgYzJETCHT
         pW53Zgb5fEcGG7m2ZwSbz7Xc2ZXw+HMm1l8H62ZN4AzBWDFkVNZwVxD4c8+puUZXFHB+
         1vQsoN2uL05cqnHP5pLqp7EXhOiT7MdZzjomjNzxrkzFP0O1uphz1Vr82Js1aqh2V2cE
         vqWE9E3u+CffA5aeW+quaS4+0T6Ve0Ag++2mKx8TTzhrMX+iIgNmSReUOftSpoekkf0H
         biSw==
X-Forwarded-Encrypted: i=1; AKwUvByPPRxgTTJHIyCZEm0XVvfGpVpOsRBgI7jeXLMqGYUpn/QiAnkiQ5tiBm/QIkS/zsGZjpUYvLFdwFwsfzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLig3sxvBnUa7TITZG2RZ8ixxFpbS7xqBUlPqT3N01Xge5xjxpf
	/qMe6jXeaFPDq+m7AEthi0VzaIOiqpL5+qCAml7Xnb5MyifLtrPGR3Kd
X-Gm-Gg: AYBFou17BSanPk51LEKjr8OHwEQkjBkKyXEAgx6Zognvz277Zvt9KdkqcTt1oxnLH8p
	y2E6EyJ3+b4qfWS30BpqBFmpixw05uOBOBrIO/nnV0b83wwAAbsjM+u+YFQtV55sSOD8AuVofLb
	IfcW+EEwNzIt6UKtsHE3rYFxDpJH9Nuq0bkbgrRionGJY+683bu8lMWMfw6NPUO2UCGTgppnGSE
	Tqv3Aa25Dqz/Qr7EbBek+MOgGdxIG/IAHm79AWEv3oVoh4RCWp/l4UsN39oNToyuU8RaTe99mOD
	zSpG5t9yWUjdLTKHOI9cNri8l1k7rPDAHFY8oUWHvWq8jrKCUaFkTki0R7+HhnBqdq2d4bT40rD
	5zQ72J1+ueUKcanc+svYYXgF9qNuk7daUtxl26Sg+QxcfpHeDORPhPKviiW78/60fNcFDzJLmEj
	KztgdB7j1U0sda3KH+Yyx7QSCEJix21g9yiKL61/681OxHoA0zbPjDyW7UvSu6ROHdHQs04KSNM
	20Oz7XowbV2mLT0x1R59k7ilMiMPF5jmKjsZlpZ+cEQq4h3k0TSxTO37jTIFbfjVcn/99RH3Zpn
	iiENJ4E7ZgcNdfn90/oQdZaQf56OZ9CLTJ5qQBrJ3MXuoqlE1m6Oqgy+DotAvzZc1g5hLYkVQwX
	jNxPgV/re1//8ztAn
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel
