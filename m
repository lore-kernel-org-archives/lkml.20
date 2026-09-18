Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A934F96A1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743048; cv=none; b=KYWd8V9Q1fUQ/RTvff2gk6HOdQdKBD7Ala00YXa2PImkf56oif65/QES9h6dcOxFz6Hn/v/KK7i59uVRZ68KfUvEzbaS8SteNedA6x6GXuHjIxROBAzBYMx3K6bYMQTCkWC9LhAOCgS33E82jreRMgFUJsjjGgYubwdRSrOK464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743048; c=relaxed/simple;
	bh=3g32ZEKgqgdm0mzzfeeD6m0KdEMdwsvPWO8RE57p70U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ngeMWY56VgnNjXS9rdteicbPGSlkfZsRl40+OOOiQ/Z9UUms7ZwVVs6ODT3ArTH3D5Sbpo7yg3eRF7Of+rnD9FYfGSdxHIKK1Nb/6URkgmkLiWSFos2tNaIp9PEid7V8lZcRjCVo0fM2MH+Q6rXTPkeZMMkGAIegldkJBxUlJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A7uI7+nT; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A7uI7+nT"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a60591bb18so543369a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789743041; x=1790347841; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r59C/B+bGqeFr3iprC+rozYulFppGtTTZNSFZMONdm8=;
        b=A7uI7+nT5gTJYtUZNUuYVj0NK/8INYXpvT+dj48RmCsB57fE/H/rXc36w5gh5/p22S
         p+U7aE1ARtIxOHE+TjLcNDwh9HRz30R1WDJV8m4SEgj6xvuSnN+Zet7n1YCLuo6/lLJE
         odhfsumAtx6xlZH1ZVm7ZJw14YK1AeITvdumui3LFC/QDAlGy4jsev4AD2mQKpO4fAzm
         BpJYHF1aqFycfttDoX64FQqtf8nSH6Gqcw0HS2/5NrS5HZ3YFH463J8BM1SqmddbbH3o
         BAtPLeUI1sjVn/3vr8PZISNMnL1EV713XZl2bCoMfttdl7jMlD2T9VTjl8BsYBTwPBUm
         S9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743041; x=1790347841;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r59C/B+bGqeFr3iprC+rozYulFppGtTTZNSFZMONdm8=;
        b=sKHPc3adadrybES+4RYNiPRU2QcsoenUaDS+yyy+RHzq27C6KYwHVcgRSNnZtkx54D
         wAcAqc8aM1hPNGfL1yssmjG7zyssfhj0McvxmW67vHJWrcLxQYT3j+J7x0NnAjBXcdrV
         H0KzNufLVOv4BHiG6OibTnUBKNEMty+saWKGict8Nv74P66xmCBLoqfKtdpNVnacaBGu
         E/RZwvRCsDipV6KhOkYUHkNdA8Om6m/NZ/w4nzXpenJLhumHiBYA4usHJZgAC2pbQiAb
         vmOMnEz/nQbjfUqRtcsi5X8ANu1Um8+aoWlQR2RZ73MW9sj3vvEL94yuNMusSHttbiUm
         D/4w==
X-Forwarded-Encrypted: i=1; AKwUvBwCUHhTHnwyN9pDmjODdf+Xh3emUpvxxdg1I7ipqWrPbe4ag2D2TqMfnRtJr2OpbW+ySubmiTSuJMTfRFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n9DhC/yQfKSiHvqAAa2dC8fOG5cu0rNjjkEEz9HYNX3DMra/IV
	dp94Q5PryxqK8WYXKHOeUygAd75q0mTZraATVdXR7U4snWTxqf5xt+2Sm67e6lCBztU=
X-Gm-Gg: AYBFou3lCrqw8SrX8c6WwrKXPAmga+cm71rz1QwWJ8yGjCsuB+dXX/oLilbUYmMp5Hi
	0+qcqtpYLcI+9Pjo2zlPK79q5XE6UXcSz8qGNCP7hdWy+5ZCcHsUpPUF8ObmWwtL6tF19mqzU+d
	nfa3D4lg/VUmv0v6p38lJiQh6Qj1Bl7+NXnecqTj6Yf5fZDtSv5cpArze5NuZb9+07ry+flaNij
	GPRsN4cmKNRnCdIgw6Nz2OZ/4L9f3GzM7ov9rH/UoSFDimurCJ3WtLu4fLvfjHbqpPQBrpdNGD3
	2051yY/DrVbjTMKdxaw0LJ6HP/sYu3yTGhv+oIQKtQgGZFyw/ztietNMZAOOL4pf67reE75bLTk
	vHCYW6xiTXb2sSON4PVifiZf0PTX79aV4vr3vUQVDVcGO/TOdwiJKvfUjT8iAcKRI+Yn8vIEpoq
	SRBhMf0Aepe3YDyDGIPF+nQOp1V7E9SJ+6p2Pil1cDEwDdks6XEL5Bj/Evo4ZF1vEPCoddg0nN4
	Hc89M/cDgdSlq/kha+NjpNZfEgMqu1nURzfWO/bt2rHLc8Qegmelg==
X-Received: by 2002:a17:907:d503:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c2a16597a38mr269720566b.18.1789743040987;
        Fri, 18 Sep 2026 07:50:40 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb46f0csm66329766b.32.2026.09.18.07.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:50:40 +0200
Message-Id: <DLIIYI1PL2MG.1UYJFILKBWBEJ@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: OSM L3: Document
 Milos OSM L3 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Alexander Koskovich"
 <akoskovich@pm.me>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
 <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>
In-Reply-To: <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>

Hi Georgi,

On Fri Jul 17, 2026 at 3:33 PM CEST, Luca Weiss wrote:
> Document the OSM L3 found in the Qualcomm Milos SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Could you please pick up this patch? Thanks a lot!

Regards
Luca

> ---
>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.y=
aml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> index 41b9f758bf8b..17690ff34489 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -29,6 +29,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,eliza-epss-l3
> +              - qcom,milos-epss-l3
>                - qcom,sa8775p-epss-l3
>                - qcom,sc7280-epss-l3
>                - qcom,sc8280xp-epss-l3


