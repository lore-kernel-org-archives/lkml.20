Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7649D58D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591005; cv=none; b=LnXUhVlvJkUh+lE8DMN3kZKJOqkfLI0ry0l6F5kLhMj7+MqlcbBJwQhY1eD9LXsthi+rQKepwz+dggd3rBumpm78/wvYDo34A6h8qIsm6NXFCfMHAyCNSaYchQIA0daGWR/qdFyMOHXVVnGpY5o3cp4GQfPTsEm+FKLAopql5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591005; c=relaxed/simple;
	bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWi2S2G/r9vnGX/tGNT7MEDSNfhjxw36yWf0Ga8ULPGDsmIoTZ3Qtgs9MWRJ/bbo5uM9s7fujuk974SJN7ORW9HoCDWl6YzZ/P5nl6C+TNmkpc22D6vhGd9cQ0qsqsXF9uqpyOOPWuzokONhe09yRCCr4phOqA52mAHfIlNBqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=U9uEngRt; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="U9uEngRt"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2da4eea067so195445766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1790591002; x=1791195802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
        b=U9uEngRtKkY7mvafN702Hdxj/4YmhjXHyIa9/ozX8gTOUxadhNawGBBGt7439H4q0C
         Pdano1VUy0D8dwIUBF64yO/J8SKR/agU3awPsNd23uf/BOAGVQLppqwJOFbTIwVVYkZr
         8BbOKItVRuNjXPCZHyJDWltVBjrf2gs5OuFrMqLKZTxQn0plfbFTNzOiT/1JuVCpKHJL
         poU1C2dI6TMlzywDaBUdXvFTRvqXZhMuZmoPphDKQStpHxbcYJHInMRY2ueR/84prwf0
         p4iz/NIZEzEAvRSnFj8B20y5tcJrSucZhH/gyyOIOb2OEJ8ki1L89NMCK0asBnZwXdla
         IlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591002; x=1791195802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
        b=cWOIhdsN/PYue0BpQK0+yxBNclgxXPJK9u/xsMgv7cZJGe08M1SwsuZD2MVqcGk1sX
         dgSjsgoyTA4XmPSaXFajsyC1nfKehDsjVu0DYb/11zGsSeh0sxO+hRyjlEm8NI0x88Sg
         VpfN1fQibGkBz1tUgnH14G2d7s91HilwTCTA+d6wWsh4bxgD6KLwBr+5MMYvp3buN+do
         WLC1+NmcNeNEHNlewQ7OB7HJItOTvKwFU7c6kH7l+SkbQEzGDGipl1vgqAMi8nO/p8Dh
         rUlx7dFVpTl2v70/Wayw/WnayUBFNalgZxky7CIQlcw2OdQiNyFLo3qQITcQpCTDgimi
         o6tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeG09NZMH+gb+4p+qSa04CQg8dWNXuTVARuiU/skb2pXph+/BLTLSKXJ0lSUwFYfS9L3KgP/QNDSlYeUI=@vger.kernel.org
X-Gm-Message-State: AFuF++kW7s0bsEwaUpFuDwd+Q356ZkkJBvjn2Xu0JFboBRHM/6OnEHIf
	1DJ/bYSdGe3Z6w3gg1Ot9i2EJfJt3o2UllbIYgJm2mWgVtf9EVwTKfE+uskqGiGa814=
X-Gm-Gg: AYBFou1aXiISxl9RyJWuu+eARemppQDppkoOnEvwOrmFr3uvj6qMgalO+YwbaCsPgRS
	gOK3nFeNODF3kJ8vRd3zeoSWF/+zAY3tkeDT2BRrRYxJ0r8+fx4WLp15r/qRocbywZmco5EcC/M
	pVKccVpG83Lb//I97/FkY5hf6KwrqOIBKoS/7DNN5JjDj179U47dV8KLl0LyM//N6PnbosdRSjF
	QDEmVaOt6MTVqi4+DlADfIAekbC29+hrmzp7s01NDhECFx+hxc2ZNx0Oc1CQ5/fCG59EBNdPBPw
	B6IuipdzTEkq0/tijjtP1X/WQOLaPFUnSa+EMMYIOrHwZw0LJld3ry85hNxYM7F2USgLLeDwX3Z
	B+SU2Ow9DGt7m5NIZmE6HVwEuHh7s9+NI/aiScV3esHmnC0fLkN0DAiwaQD2WIDO4FZTkpU9F5x
	Avg+XLgLpIVBhJ492Eu/V1GRFHA9LFOC7L15wthS6x1HEoUaRo8UhIypZXaWioZwdT1PdsJlaIW
	6zbKGIRvZjdZy02znAv3j8xJvV+jt1rmJGR4C1NDjwq6Kh9D5CPf2kcSwz70m6FElY61L9xkxcL
	MXsMDKlyJLwaGwFyAxRoMKwRJAT8nGYitfctXcFT
X-Received: by 2002:a17:907:3895:b0:c26:1649:47a5 with SMTP id a640c23a62f3a-c2ac53964cemr968869466b.27.1790591002152;
        Mon, 28 Sep 2026 03:23:22 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757ade3sm450982266b.29.2026.09.28.03.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:23:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:23:19 +0100
From: William Bright <william.bright@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <arpAF3tYlxKw9hjj@will-Legion-Slim-5-16APH8>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>

Gentle ping,

Can patches 3 & 4 also be applied?

Regards,

Will
