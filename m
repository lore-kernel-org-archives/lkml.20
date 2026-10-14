Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD74F5DF1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975900; cv=none; b=jnQ2KZjm/phexdwBG4HVgzwDMO1o3Lq5A9B7mzXbz8MgkCSzOln7BuFFbPKPzoZfkqrTSdpH5DRhM/XHzpqKFvLDw7vrFR0V2WoEQQlaHbe4QIzujCRzuG7n9PJ4DpX70XP77Fu0QxVEBAaiVseN8X4vLTYEluzIC6VKAjDXkIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975900; c=relaxed/simple;
	bh=Z3h816ZXGxVD4csE8LYPHv1WBDy5zaS6dsqoEyjpLBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exx6NJBuk23llQM/i5EWUll7Thxw/a6vXqCa2SUIhNJhZBvBRlYoZpUL6CpqliT4b8M6PGuiUlegtfo9CEKsDVZeEH1k3IHvUrQbD4ptxHpQUIo3h3gP9ICABYkiRZgefvvHC6FvMpwpELqZswSyV/tiPAs69L0OULpduLMo7oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehh42rNz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qe5Baexx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehh42rNz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qe5Baexx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6899s2516002
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNulU2JiXUoxqitj0tDF9NlTQTZRzx8RpIvKK9xWQ+8=; b=ehh42rNz+TnsrvSN
	W7q6pgy/4ifYFAd5GvgGL+diTEULLtTvql+Q0VnzYU5IyrbfqY+YwOP8ZxknrdMp
	eF3NJSU2yW74LRUc7O6fuUW9f+xEpnjBH84ERJV2YdcI9d3nIjjs0bPD76mKHEEP
	zoMFmvOWtqoXaM1vtpDw9/Qr4xA4+3yY1qAOXp09KMAZ6Dj0h0DjALQfX8Ip/UNL
	7CLFd1+WRV7bUBNyKH24NGhkB1YuG2yEAZF63Vkcp+MQxerYB90FSGrSjU6bfT8P
	8THc5W/8r5K+5vIdbIp7yp6bFoawm8lN77iIFMmyrO3YJi7LP8YR2XOzyJ4M15M0
	aai+aQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470974e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:04:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c1fd351530so124452137.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791975892; x=1792580692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNulU2JiXUoxqitj0tDF9NlTQTZRzx8RpIvKK9xWQ+8=;
        b=Qe5BaexxWo6EPoWxE22OOIj+cv9kZY/SMyV0Hh7+ts24l82vwiF0Odong2/KBvaHQ1
         Ot/e/aWBvWXE50uzjBvzE4XxfLxrV0RMf4ps5ngO5bA3ugMNBUdnn98DKftVRh3tKO9O
         INZj4vQDWakipiy5Y989KfoTsKr7OCIF8jSFGQ/MhVaOd0qHgrDQkeLGBCN/XUsp6zbO
         CPnJKzdvP3uABz2KLatBTbIlRNL07VUckiqX8Artf7t139HfZVeUJapPLJVyxmRZbKhG
         esF22SBfx9Q7pkQvBZcJsMjFC3DT5nXsSrbSJfD02BaAxi6YTYaa6IkhdzR43hkYW0dS
         yOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975892; x=1792580692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNulU2JiXUoxqitj0tDF9NlTQTZRzx8RpIvKK9xWQ+8=;
        b=cpvfzSo1p89MeOEfcPNQrUzTFTYkVLmMiez6kM1dHNVFmOerEaEznVoGf/Z5KRP6js
         5lTzpcRF0Ex0nORlhgm5PtMu5BOcUWYvktZd/1xgzyviZ2S6jqGj1Z2yFdEPJ+vigPU5
         JZE9wVhLWBZH7297ZY7kZ/4Gf4VLUnuujG8Q1qWWF4BCcgSP8l4HRjAJiQCeBlGYexPK
         ns8ljkg2phJc7zhENgrwn3RLd7PWn7/cpIFtw0M58MgYL9cS/uDDVfFulibb4La7xoRm
         O4ha06yrYnqRl9c2m/x+8a8EQAohfgNkOwuGXKUy/PS2bh2WY1J8rg/ZnpNOyd2xaoAT
         6jaw==
X-Forwarded-Encrypted: i=1; AKwUvBwJxcQn7X5kzLNHB/cpizu1uaVDoDcrbrdQCeEi/jGNxM75Ey1NRQJxrbDj/VPnajmb/VGQtZOGEMn3WqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9P5bc+KzMufjU0De5yQCZgWtDuPCUcfDeL8KlnHBm0yYA/wvm
	JgBnbncr2ykMT3LKGTcSh6ybx09xfqtJdwMB9StgZfr9Lsv6cZ+fdNaXmXy7rjQLcVmHTOyFy6F
	Bg7f1geeoEeZ90ae1FYvld9MWktjZ1tF70cUVu2VUs+T6zkv5InqkTylnRl9kBxI4XE0=
X-Gm-Gg: AYBFou15K7pF+zEAC+AdfcSp4Zi8blad0IAlnE+sy3FIszlV5FpbohqM1wOmBUlkO1J
	nqZbZkf7J63FXxpZ6K9FoFZ8/8sqplFb5cqeKjG1hh01ecy1eTdo/HTxmpGbt2pgvvINjzobGJo
	hrEOSDoPvkz3zRai9PThoqDw4QnWqWXUSwctKdXElHRUDsPthyd4pvISYzXH/Id2gP7Op/QSokd
	QxdwPTYfXveCOK176ZBm6nL2o27gv3YimuuO+85qDQ8PhT8X4NaXoZq2cT4BUNR3F3He6jc+CAN
	kPlPM9PZL3vJmSix6s4O59s/OCcPNgdM3mNCLuQf+2UWVQW7IKoHtmjNzkj514ep3ribEVHyK67
	lC4a0MVcr9m2EwawK4/454g==
X-Received: by 2002:ac5:c54a:0:b0:5d1:9e07:8db1 with SMTP id 71dfb90a1353d-5e91f2b155bmr3325067e0c.1.1791975892310;
        Wed, 14 Oct 2026 04:04:52 -0700 (PDT)
X-Received: by 2002:ac5:c54a:0:b0:5d1:9e07:8db1 with SMTP id 71dfb90a1353d-5e91f2b155bmr3325050e0c.1.1791975891839;
        Wed, 14 Oct 2026 04:04:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9762af5sm700056066b.1.2026.10.14.04.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:04:51 -0700 (PDT)
Message-ID: <9fcbc293-2b5e-4b52-9854-a9afc39dc946@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 13:04:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] usb: dwc3: support two connectors sharing one HS data
 bus
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfX/PxbdLWG79Jp
 xli/F8RzDF4vnkcc03fDne+a6JNN8LxrNIKEvfwmKDtIWjGJKqKpkPsACnJL6LrB9weHuXamkSe
 cJm2UeeWsQ+U9aaNUcFLzFCp18MCTs6Y13eXSRBeGQnJ/IVMc20xaC8knOnVhNg0e/MdEyHSV3C
 cZaqonUxlXA0nJVDKhfq93agQ95yNVCBmk/yOiiCpSqNhS2VNbhDFwlc4OGzWpeyZsrofMX4U2g
 OOsGMLZqIBuTjcE0r9yewQ+Ejvm4dodc3ZoGhuTU5mmaGOSJf4YPlDeXV8r1XA73xx1TwG8p7hK
 sJyITFClIp/pGkIuTNhD5nCtEasl6+qmDVDBP1I5jjsf2PeEZZ3rhDlS2gYfDcr11wiQbbLziGT
 Gi7LnZ/MVYS3ouBX23swCsJ5OwQ26XAtLv5qtm+wJI7tQoITseQN71jIOp4/Qb2DsK4kxjrqG9q
 asQKhpZ7ECPiRwaBGrA==
X-Proofpoint-GUID: WD1b1WyKJcYVhEyeW0bShRcJ-TEUNL29
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf61d4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=hm8Rrv06on9B903gwGAA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: WD1b1WyKJcYVhEyeW0bShRcJ-TEUNL29
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfX0rGDC9MvjkEc
 AoFxwGyoNsIcRo0Ka4JM9l+dN9Pxjej1lmyNwAp6oThZ1kzzWSdAyVtWy0zBfu1pPMfS6ld3u1E
 Qn0kdUUH1I7SRMEZkAc+1G3iXmlkNe0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140044

On 10/13/26 12:29 PM, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> Some boards wire the High Speed data lines of a single DWC3 controller to
> two receptacles and select between them with a GPIO, while the SuperSpeed
> lanes stay per connector.  This series makes such a design usable:
> 
>   - patch 1 documents "usb-psy-name", a property the dwc3 glue drivers
>     already parse but which the bindings never described;
> 
>   - patch 2 describes the two-connector HS data path: "port-select-gpios"
>     plus a "ports" node whose connector endpoints carry "mux-state" (the
>     logical port-select level of that connector) and "usb-role-switch";
> 
>   - patch 3 adds the driver side: one role switch per connector, mutual
>     arbitration between them, and a data-path switch performed after the
>     previous host/gadget instance has been torn down.
> 
> Single-connector designs are unaffected: the mux path is only taken when
> "port-select-gpios" is present.
> 
> This work was developed on the Qualcomm SM8750 (Lenovo TB322FC) tablet;
> the board device tree is not upstream yet, so no in-tree user is switched
> over by this series.

This is an incredibly strange setup. Are you sure it's actually how it's
wired up?

Are there any hubs or other devices connected inline?

Konrad
