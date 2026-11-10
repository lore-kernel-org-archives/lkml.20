Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354378;
	b=3NByRT7yzXclTIfczlQ3yIKrtrbhlkgzWryJ8BP/ACaqRennhjKWPg5ZVlGdxHzJ/JUQ
	 kOKGF7i0RKzhVNhduwgXu+H7nlU8yUmvciQkjmQxioz1h+68B/lXDmHby/Z7+Dm0Ji6e5
	 qo/sloK01DswHU23IDb8oQB7KtF5J7N1bgZn3RXwBPQqiMYjZs5B73awSs/GxxyMrnrrL
	 BFjxzp9Kx6KCFWl6LxiIhUAjPAiE1Y5HT91ZOobsCd5kdn2yf9oNgNm7d3UehNOmf2xvH
	 Q0wkAM4qeLT/5MvLqYzJzH4+FRzlzfMnMDWB5cR+ztMrEtGcf7kPppdS8fero/XpNiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354378;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WCdKUUEAMgyuIUvweS/CVZqWS7quwtCy3Zzak2dFXXY=;
	b=d9nBq/KfcHFp6uzY0R0CfgE5UT0DuUC2r8lqlIAb0+eQYNbuuLQH0VedJu7mBFRTncmx
	 3AZMtvzIO0DdJxT4oaeW4POMLXuOCPovfLppIQVlNzg2km4zNf6yA/l3isPqcRdRpa2bj
	 opbatjQprkHjdCwLFLANqQz+edW5MGQL0EHC4SE6bGVaQzphgQ10fBXnJo5h999ro33yu
	 bxn59/B9znGaMtntQBBJy/G/lPsZGdsLZUGKZN+J+kmMMwV1YAjvcMNn0e3ab57nrYJoE
	 iEB241fGJ8XCwtdNo88mq/8TiTAy/jOHN4oSZyDs/5Y5KeHVHnGvokfgqY817uWeSTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC227606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC227606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b30477a320so21032897b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354376; x=1794959176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCdKUUEAMgyuIUvweS/CVZqWS7quwtCy3Zzak2dFXXY=;
        b=FuKH8s+clayTqpXg61OhUGoZ17C7KrhoW9W7Qfr+7bK8N3dfg2eJNpMCuyYX8ptUUr
         LBx+WYZJ1kyPTF92XtD9yRsCm7WaqLIXY4y0L+MZ6GPZzUPhkdmNZB+9Oih3JATIMFbq
         zVFBwaGmxqGIQtLDruE7QKvR/WMcVVdh5M50UUvDfb0xfGAaDBGnCGrkQ0osAO1D+h9P
         dB2n2BIc392HUBy15WWUUNipbPPciExVb4u6wLhjqp9L8+3Qv2NilQI4bnH4iFavPUfM
         D5wTBl/wIDApn9tqmLio5lNcuX3LRuum982iSzevTB3jb7sQ+awfITDHUTUNWayyV/Z0
         E+Kg==
X-Forwarded-Encrypted: i=1; AL+hErHZefr0vwiOxCaVtDfjfyTbPtcww5H1ZPQrB0XtpkOK0yGujKsF1yU+zcTyFQt8dzEk4Bncl84G7bj9SQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hbZj38E2qNEs3Ukz32JeyBCckrs8h4m9mJTk7QQEGBAW23VKW
	ozyAZDN8C+dpxMPJ4tWBPcwcF1ipBNMBwgrvdEzjJpvZeuoRzc6QR9F4
X-Gm-Gg: AYBFou0t5AIo43mWruX361k4xJRc4O3t43+Xg/cum8cUNCi2TucI/wxdu42cmZH6mTG
	7KmW9b+oFtT2m7Z4t0VCMwwZemDIYhfQilhI42wd/Oq3jlVmhACzT1ZABCORZBiQC+Cw+pn/ets
	ajLWJmE4EesojC+nnlGgUluHKEZLtkWYANJQ52b+vuzkF8ayzk1H26pn9CHeSti5CMejT9ljRq1
	vORIqgxUtcuQhS/7EDQ0zOopnoNa/apXCK8x8aiBYefbjtKyBxQXws/lCqTKi6gyOBlb0xJWuNl
	KuKlHMzcoCpxsk31473CTz3JW7fkKjBsG+ielJth/i5NAPDVpN7kLUXN3qPnGlwkOZwRVAmaVW7
	ziEnX1SBAvypPEg3vp8NERA1cIGg0hw70OVzR0xn0e+jSjH2c4f2MCyBTDP4kj4XJZt9o86JvjM
	Rv8cF3Ruw1IiNw7GQugDWMfinax3+36lpHS/QW/NO1I8bYg0sGPAvhLdQz13lWoMO6jX0LuepgO
	IREJI1xzMhrQJ4BOdkQeLWolfMUQeA7+FKfHiOQs6liYoW2Iu3lkMainS6EzykKyvrjxOsVOTxs
	iIkFjtMayebP7liIgVKAf7uWfnN6fKt+RdEQlrjcJ6SSjVRqcaG3BOZwoVp4EUHWyK8ZH7Zk
X-Received: by 2002:a05:690c:e3ea:b0:8b3:15c2:24a6 with SMTP id 00721157ae682-8b3a7ff3419mr7031107b3.17.1794354376630;
        Tue, 10 Nov 2026 15:46:16 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c59cfsm31871827b3.17.2026.11.10.15.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:46:16 -0800 (PST)
Message-ID: <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:46:06 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

> That's an intermix of names, and you will get a review comment from
> Krzysztof about it, I stand aside.
>
> Here too.

Krzysztof did comment. I kept the vfe0/csid0/vfe1/csid1 order from
sc8280xp-camss.yaml in reg-names and interrupt-names, and asked him if
he prefers another grouping.

> Drop 'gcc_axi_sf'.

Downstream sm8150-camera.dtsi feeds GCC_CAMERA_SF_AXI_CLK to CPAS and
x1e80100-camss.yaml has gcc_axi_sf, so it is used. Can you explain why it
should go?

> Drop 'cam_' prefix and 'cam_sf_0_mnoc' also.

Prefix dropped. I kept sf_0_mnoc because SM8150 has a CAMNOC SF path.
Should I remove it too?

> Or C-PHY, right?..
> In fact you shall drop bus-type from here, because the link between
> CAMSS and PHY's output is not a CSI-2 bus, it makes it inapplicable.

Agreed, bus-type is gone from the CAMSS ports. It only exists on the PHY
sensor input now.

Best regards,
Andrew
