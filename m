Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400308;
	b=iohJdHSUgf+mHAV0fosxWvgbaIKOKwWqNVCz9XRgUJPariUiEamNX0DX0M6RGnFMH955
	 czbAU2UdnoBeSz77Toyj0ZwFfJ6uTx7mQl4v5LrPQukuIdKcjNXb4SWEN9Mu5L7Kfa+IT
	 oh+kigzjlXDIMBFubbWOFOMxw9baEQ41K2PSvhqyTH+5ZzT8sXy6l5ugjovyBmcMXpmCX
	 K9bgOS5o81ghFvOMLwT4b7anZFlQLru0aZQ5ZTLJ4hcmnt+ps0NwNkuZyy9RIW5ySaDM2
	 4s4M3pxQ4PkzkIzhEkfZTLo/V/hKaOlL9v49w+gU20SUZHh9PfQNxvtL2yLVYwcCgxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HYqCJGzgAv646u429yCqw4YAZhdaQondpXuCRwFFu90=;
	b=1q0Y6WAKyEBwHGmN4ejriHKKVtFZqGKUX1fgYYEBUmZQxZKVowKe4Im4ZAU1tUpEx1XV
	 vyAyywT3GORlidzViMu3da8nhxjOZsrFUz1MaDYnAx6thJlpEZ/YO82xEfhAbpUA4+Nwd
	 0WYtkXeu3QEJC6bAcRcnB+FHpVMgmmh7UxdmF9xOg4jkdUlOUWQNnfK8H7L+SNk9yrWhT
	 9E9RpMIHZG8BR6P84yS9o3aGFoLKGTWJQaBCKdhmF5kxr9PqGEjfB+snA1nR6ww/xD8OG
	 fQ0mZ/hOWhAvjFDGrbmhNZSwa03OTKd5s8EZLHG/HUviAK0mCo7NzOCLZ0ZBVY75EFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+fYDss+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XFLc9Uzj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF31606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF31606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+fYDss+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XFLc9Uzj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCPRPZ1786265
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYqCJGzgAv646u429yCqw4YAZhdaQondpXuCRwFFu90=; b=M+fYDss+XW4jSr8y
	zRCACHgf54Tzk75tMzpDYfNl9Dy4PPZIf7DnKhHSB2HhViYPzPyEqllRWe1AaHBM
	AGi6HGO1425ISVleGuGzGEdpez7TuZAPuKvNWPUt5vI/2GI7Wd/9rB/mu0QBkzYv
	pgDOR7sgNNgoNClMBBACIXYQ2cdFP2r0hQP3UXUQuLnZlrTBN7FeROainvJLALb3
	PgY9sM5ccD2nGqKC9d91wjPJNlTrBsxb0PWK+FKfhUiIP6/QpKjhp9VXZXvv44Ll
	nTnTHOOJXPJvLFVvOFRxvWFVgZjeTrymTgceT1hO3F94g+1eklrWHBGEE4EX5AxZ
	A+urLQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawj47d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:31:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecdc55c03bso586829e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400306; x=1795005106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HYqCJGzgAv646u429yCqw4YAZhdaQondpXuCRwFFu90=;
        b=XFLc9UzjaqOf8+lsKnpUyi9rOexLRT1S28FeOUDeFbSfr9iiKSSQZFc2sNRSs4GSY3
         Ke4B0WxQBFA637C+iDK5w+WURlA4t+x9pWBcdMBwp8pR0WN9WQTuGjv/ZecreSgnFUNR
         OjagcxxoBdpqGPCI8RmSz4nO4PU4E1JF0XKO5xxneJnYpkjGyB4BniuWth/MFLgwieyc
         BcutDwXQumiPAOUz6tF4H5tD6kMM10b6KSUgp5R9RK56Ju+Dif6ZQQP95Zokcx7mbXKm
         0p9oTiPHNIB81khz+JOxF2sV19aHm6G/oYAuN/8HQzLgJ/2LEb39Ow/pYpohKEK99i6c
         KJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400306; x=1795005106;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYqCJGzgAv646u429yCqw4YAZhdaQondpXuCRwFFu90=;
        b=BKxUAKIpWVAy0/5sdbhvlrzgkjRqd9MfcYECNN2l2NkmHy9OpWlLpnLJKO4i4D+QnG
         2SBD33QxYMq0MFjLJFmzBPMzRn6cLmY0Qb5YWde+X5hkQccFDmg5Q/4zexGs276LkBZK
         JJnoNVohvJ4dYuPpSmCB7y0fPRCO5cw5Pk2d+XNKdOSG/403inpm3IN0s6TR6fMwub4d
         MbdtztMCIvzIKFSoMzqmrpuLjN2Xo1jXHqYwNPTEhJucUTXaVz05Z6C830haw/CrSTJR
         EndcDkVVxxqhLtFTWMO69305U+dKw4RNtDheo+OFTnDj004lwQwl2DlrWZ69t6CAi+Zu
         YFdg==
X-Forwarded-Encrypted: i=1; AL+hErE0vh9C44INFWgDTx7G3BozBnTseQm3OIngBpET2OaQ5+oIW2ypjvvTxKJgaMvRrLSr4ff0aonh37cmhEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U0Yo0FceMmkc+yieNOISx5J+7lt4U0tLdO3eoQCu4a4CaisOA
	pZegpktIvKaWSzC8ILmADkVDFQWWw6INZW15hV9dS99l4pitvDuw2lLYVqXrGTt2cvIAvNuh427
	oc9b+JQiMsuP9CeKkz2H/7XopJQqoXjXaz47BYLg1imHyD0T3Ihc0n4bHYa7cL3EYMYA=
X-Gm-Gg: AYBFou08tgyzoAssHAnkSixyiAMH5L2qkFOogv5kwl0VKEBkRpehdXc4HZF6jeydaYw
	hb2xaclzZSGI2wJH6Rhwe5Y/Sifgz2YTiyZ3rQVxaT+DdQARCpo2EqRMKRODtPFvA2bgFZg0ghr
	cbFMCp3eB5MIdzO02+3RhMFBk+kL1b81XmkRAOh01z3IO5issGVi4btxDNmLzq3mlTsD3MnlF2M
	bFo00C8oC8Ji7uv1yHvnV09oJIBjLPOYTbIsFFHz11WlZFrCQWpH+PXbV/sKPLwE1ZgkMaGbWt0
	R69ZiakQiQMLoZ61L20H058+TAFN6/2LEnTXXJhg0Fd7DV5C+/BkgjmeZ3I3/l0urWS0gKEThaa
	s6mTf7+MkxH13WP8/vYbx4QpHxWyBAWEN7q1Id6IKOf/X3++3+2cSmU+v090RL6LI7vK6sr9XDl
	M=
X-Received: by 2002:a05:6122:4317:b0:5ea:e196:272d with SMTP id 71dfb90a1353d-5ee1c3db8d2mr575831e0c.6.1794400305562;
        Wed, 11 Nov 2026 04:31:45 -0800 (PST)
X-Received: by 2002:a05:6122:4317:b0:5ea:e196:272d with SMTP id 71dfb90a1353d-5ee1c3db8d2mr575799e0c.6.1794400305032;
        Wed, 11 Nov 2026 04:31:45 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c2793sm10687527f8f.45.2026.11.11.04.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:31:43 -0800 (PST)
Message-ID: <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:31:39 +0100
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
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich
 <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel
 <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX+vJrhgf49il7
 hHZNOZVFos6/W2EdxquiIQrngXSWketTe0dvIUHOYAfgO1qXrRchRT3PahKR05jZ5512T+zCZ1W
 TmJzTLf8DNGnKVXDI31RwxDpTFgjx78=
X-Proofpoint-ORIG-GUID: MRZQVHPemligIwau78yEmbTygTlKtg28
X-Proofpoint-GUID: MRZQVHPemligIwau78yEmbTygTlKtg28
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX6sFGtWKgbp2c
 3Ta5RthH7hxRtTyc8qC2ychl0/MXA02Wsg86WYfIXI83VkkEO7C3XV/yfiYyg/GjO1NatMnrdY/
 4HofCdvwFq3xIxW7wS1YPW9cmWNXBOvZT/ESfa7sNtGC0nzgc6Wzg3oQYQrXt5NHb5AiGPrUEBR
 CDBACsr4tnaA43Kf2iVT5PehmfMcmqOwpbYgWDixVUlaIf4WQSkR0NizlggGFLKhBxjyeri0lm1
 YU+yWuQc7/+R8bMs73ebHHcr6fQei/fDrOLo1ho7p8/UxNzhy6+q5mqd49Bdmz0zU99EjCdrPjQ
 UUWSauy+/uKamkVpi59Jk17Ia66eyyuHSLkFxuN3HuLpONYqz3cEYeXmty/oU4/IkoAlREmMdB1
 F1Pj5UnuKMftXoDe8dBmpsG3UAU/3TPjBWHDmjZcxLvFbGci+NDdd1hBAsHgopwx0ziuNIsTUlN
 kurRvCHmrCl9Ykj4amA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af46032 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=P0j__KAnszyX0y2xDOYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110049

On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
> On 11/11/2026 12:13, Maxime Ripard wrote:
>> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
>>> DSI panels can be placed under DSI bus directly and many Linux DRM
>>> drivers will work fine with it: mipi_dsi_host_register() adds device for
>>> such panel and DRM driver does not use OF graph to configure lanes.
>>
>> That's not true. We do use the endpoints to configure the lanes through
>> the data-lanes property. See drm_of_get_data_lanes*
> 
> Some drivers use endpoints, some not. As discussed on other thread,
> there are more than which do not.

"there are more than one which do not."

> 
>>
>>> The affected here Linux panel drivers do not use OF graph, either.
>>>
>>> Requiring graph port for such panels is tying the binding to one
>>> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
>>> requires the port.  The port is not needed for the hardware to operate
>>> and for some of the Linux drivers, so it should be optional.
>>>
>>> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> DSI busses can handle multiple devices, and multiple data types. If we
>> were to drop the port node, how does the upstream video device know
>> which device it should send its video output to?
>>
> 
> We do not drop the port node, who suggested that?
> 
> You do get, that we are not talking about the DSI host, but the panel?

Best regards,
Krzysztof
