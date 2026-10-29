Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264128;
	b=44sTkrZO46Iztv+mNrQpZ8Re6hsKl4IYjDH/1tkY+An788ty4MLW78HWDKMwYS2syl36
	 +QH7SWeNQpNel5Br3+KcHvItnDUkQPxRyfHUxNqp+aFjXhpvhzegfPs90/BuwnS/2Cixv
	 kk3W0m0als3tp/YkppCd2nBAnO2TwtZacEYY9eyeNkmbs6egjf4cHkC5KHFRUkEt4C5+4
	 o2KGKjipPU3MlsH6OJyGQGsOCd6b4heesb2r65OTpVnAJtQh/ZKQoDMkCJijhg3vjyWLz
	 M3jf3jOROR1Wtp60VI1ZB0eoNaqvcADythW12XweDHvvt+Wn+XXaUMujVRiw8LRGPsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
	b=RDpSP5y5X+TbGOTz49icg2clSb+YdNyVUYfFx/Tt5+JhvxpvR14HHpGyCfaWotDXCAkh
	 nYMLZjzUf3plPjbxpmFtM3oqxn4GdhO1HFta3HROpyw5bZVzgOfkAR4Qx6ncFzIlGD+FE
	 zdl3kEr/EtpQrBgEBSvt8VfRapK29Q7hMphURuhFqTuotQfYmVcF7lrJlNdIL8vXtbBOY
	 VyXsXv4E2xQNsec7bVb9j9ecXsqciMU/nRMPDl9Wy7XHjwGE1RMQierSc/suQiHfd4XyK
	 OgMAylyhKn51BJwdAJjmFtJjTVBqTbKmRSBun/DbUMdjmMyyWxtxe4luxN7ehfWM8MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="orN/2GPp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYDSRqK5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C985D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C985D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orN/2GPp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYDSRqK5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gxea2427201
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=52z90qNXU4fTO2VX++tJFlr+
	k0DTB2MGrjm0OuMj88k=; b=orN/2GPpMTDSoklv1RrKjncnRQGMGceGxuLJxmJN
	MrXUBz5S2h6DlIPE5TSi4vK0mt3fKTjwZtLzIdhE6fMzsI695bOUxY1kG1ytKSGq
	hVkKcMguhoYUwE4h030++C9iRBO2n2W5FRWI236ceKlkuKKmh6XRV5aGAm8OfNTh
	Vktks62Ya6RPp3Z5WUDmoZXx95Y4ROsAHwi1M5lBpV/Gp6nrbUxN1JhzKys/V4CV
	v4iGzT2WCHMVJnqBsAUq2lqS0nBmixDBikCkbKbfezxzk5YntR6U+EaCZfYNUOO8
	9hee2CNn+eoOc6K++S7kL6hN/P/Zjf/nG14SX36/T+Kk7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2b54g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso96456985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264126; x=1793868926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
        b=XYDSRqK5KzB0tLzj7IGp7RoE6isFaFO+UC1JrlwzJRWlyTpmb65AAigFfxJAhC96vD
         zWukNgTou1GCz7TwFkIqo8lAaBiYLmIj20q+FzE6Iq5a5gYCM7hAeBulFK8pbUxfqunV
         GofGMcZy4jTwnI+sj7Gp80ckQgoq1QZ/ewq/WQj9y1albk4ThCLURX3hfIRAFv1Z1LuW
         1gkFxnmyO94QQ1xSROIqKiiKgxjZR7w5fIOZpIRdFoy5/e95rp/26PMCP5r+lWmQbC4Q
         l9HHfu72JB9HaCmJ877yGKgiQAg3RYRNHrlVECBDGDYcRZVDRwcQNXtZb9XPC/eY5k4k
         6zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264126; x=1793868926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
        b=KpvdNTfP7U8UchfPbAxAoe10dQxokyrXsCgDN4WK46vmaflGmby5rXLys5Zt8gbXqQ
         NjI7IHlZolE16+q22hzVm8Xf+7GIbf50XkCAcJ/LWq61dBUm5vAiky4/Un6on373c5nx
         syYWckn9kKMgKmjaIYFWfE1CIR5qIwNHoA6x2LOYzj5/lzSFoXH2KH8PVPaITVQis39N
         AjCAaXCzWZ5DR43icqfeLfkxFFB6nXNLLMoL9mT0QQuop4nrOZOC3/RCf8hYk51gcrXl
         3Tj4Oxi5bZM2a2Kf8w6c/J++NJY0Gko6znkLQCKJGLiyjwVuEItof6OyQKXOa5oC1ytN
         aXkg==
X-Forwarded-Encrypted: i=1; AKwUvBy+nTAud0jw6KaL7qdUqALUbOG0N5yLt8/2XvHIhLG+CyQUQ19+RvY/8pl9vEgTKyMT5pYq+BqW+1PHhew=@vger.kernel.org
X-Gm-Message-State: AFq9FYLANmSJHt8vPDtTEhQ6w/o2IMBVPWYxTw7u7LZZm7EbInxWcKCz
	SpE6cSkW48A9Mj62TSMyY4+H6JOtfYTfcuVt7pd2aHC6W9hWrLVzIDv6ul8fcu9IQBMIqxdYIjw
	xALc3F3cxF4EzsKKxu+Qxf2IdUbrAawa5WqCI2xW1Qd8KfaxsjGMZHEnJLkSu9U7UgSE=
X-Gm-Gg: AYBFou2jZwio7OG0I8HyLhsPcz2Ae2VClRgxg22l3OZwEJRdl4P+5vVTrNAnGu9rTQA
	MkBai2gYdx0SxPduMS3bWJfZAjDsgeVYKT7q4IUoP7+LUA/uA7A47VEO7JYqSPBEJ+/x2F5+odN
	eNXxTjP9qr1mimSzCdXPSdcBIbgChK0cHtuvnXsS90rVFP/sdYxGKllSrqD6poerSMKNRM/WA/0
	o7MwCecSLZkL9W9Duf36ecQhEa823A2eSinF7outw2xa5QtQZmnorRVhvr6HhGYjiWNqGA1dOLn
	35IOwseQrxhHnrMyMc/yIUjWlpd7d68kmsmJNX8bpo5tdm4vPxvtrfMFuKz3dWhFdy6tJp+AUkJ
	q6dbypNIPnoJX5W0bgq7mbwwV5H6RwnaP6KZ0aR0/FHjqHFqZ4xdKLgPrLKE5VANO
X-Received: by 2002:a05:620a:2815:b0:944:6ad:1b7f with SMTP id af79cd13be357-944133c303emr256649885a.32.1793264125916;
        Thu, 29 Oct 2026 01:55:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:944:6ad:1b7f with SMTP id af79cd13be357-944133c303emr256646485a.32.1793264125336;
        Thu, 29 Oct 2026 01:55:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm48686055e9.8.2026.10.29.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:24 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:55:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: nord-ride-embedded: Enable
 eDP0-3 display output
Message-ID: <g42dgla5pdrswflwlfnddejk3kkoasdooecbiwq7zkdwxzfkbv@c3zanmmdyzat>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
 <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae309ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=N2KePwhmbMOsMYKRcNoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1ZNSM74tedYcK5wteYiMJTRmRNUfSFz-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxlGoTBHH54+z
 Yzh8mPDezBMNWKnJ5HXAoRJFtbax8pQv7NQkPhk4OS1rzGz5hHhIn5wyNUu447e536IpcFfLAwW
 ZyJs0q3numTbV20Gb6dPtoAdQidsC24=
X-Proofpoint-GUID: 1ZNSM74tedYcK5wteYiMJTRmRNUfSFz-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxwdhk42DcZAl
 l1r0XHRsAZQcCiN7mTAqGFQ6KHVDTWQUWtsNljKO/e0dYpTHf5gVy2dvWnmHgL3jIQyJd7zlUW+
 YQ9hy2cKZFsRJRovcU2RLn6iz/4zFqyyCPf8Gwvvx9Le3/p7YsOujKVOdfzoBSw/eyjKWarXgXR
 R7Y3QZeRrRvenbSbG6iYqTdGTdE/ZZmR9OhY5my4BBH4rlXToZzS3TSHbEAue19x+62ztSG2exP
 Ol0d6qhTvdHVhwCzX3qhVNVAatK2QmCf3U4aZOWnn3vjQY16J/HJU5mJqG2DWIOKoFNKEsoQAxP
 EpGn40K+/WLnRazfGe1ng7y6JfhyizSsZ5Xj25Q08lCqdvMkBNW5P3DeLy3vDBmONm5pwZd4iN6
 n/x/zYqB6eBOIpvyZNrkHuN9xbMehHXkH0xoSraKlCY3Ztbk5Xei22cK/taLjp4g+vvIHA8MqdG
 r8UdGRaKLUY/qy8xjPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

On 26-10-29 11:47:27, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
> on the Nord Ride Embedded board and describe the eDP0-3 connectors,
> their 4 data lanes and supported link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
