Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420356;
	b=f7t1YYcTDxLOyLJ9hhM69Jk83B8Wl8gLJafGodf/g8PV4t2KYl0R1klGuXXwU5YvUcgr
	 qZy1fFlINRezz1+qflw3njP3uRzxZ6PxXaV7IM1oqCTxWbBE7C0Uu50W8/LaJJAxnW4A5
	 PERft48rigtYrZUr0ahJe27LxYGx8zo2zymOTweNgkP/3imJpQh5fHM1yOiGCHLq+MaSz
	 me7MVjl2/BR+ca5FtAiuT85UC7FHgFVwuUKcvPYqcGqGAMWKp5IJHTNioXpZxyFW5K+PR
	 lFnzuDjiifEH+zjc/5w9M1HVIMuu4ctrZJU9WoCh8wswhTRyc5LqcTIkKFmNlVmtP3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
	b=jJwYAr/1MSI09Xsqh0jF4s4WOs74fCXiohrkGTVk9LlzOCG5+hXT57tEk7Y8LXORoxkf
	 0uwo4CLrYS/+146nrxIzTXdkserHL/TIEt+/vGoqDiX4WjMruIpLdNH+Pc6pw1qZ0lveq
	 31yKwjmDyTU7DeIlEEKtD5XQTXqnAD5hsO2WHM2LKoucTdgPBwU5knbCOMcaUWfO7R89g
	 JFfdJh2gVuP0GiE55zdnbwJczfcnaqZ1Vt39fGlGi8KcQmIbtKQyAz6LS3rWi8tQU+Dlp
	 ogMjN4hY8JXx4T4OrfEGMqVpCkBSIMSBarx+UD087urRnH8xOXoHCr5Yjw2CAYtxFCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJwLpcqz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Am76AyIr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A249606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A249606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJwLpcqz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Am76AyIr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHthOm1400059
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=; b=OJwLpcqzCAs4cZ9R
	z79WRUa3kfaODLgha23FN8hrLdUhGKs74uKbdt+Yf4oI6veasW64FLMOCaf6OAGk
	mFD6WbWeItjFQqohIZRDhLa/oD1OJ01Vp+BQZhIJvAJBcY96SJ8tVICiiVsbF1qP
	2QCBcEpHn9TtvGFPszk4VAPyBbrw5FQsLLF6++mJ9pfOUhwaZrXCQ8dfcoiFHKMa
	Li1a/UZjBq58QfHz7MzQg5nOZRS8xt0uJNha7EGAQkdau2p3fWrWHyoys+6z5lQc
	3hWEcFu4wnISOXhzfeqWm7eBMhW/FIRcVup46XwiRSjbNG6JPpUduS9BM2AEeHho
	ED0h9w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34unf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:05:55 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso491675241.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420354; x=1795025154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
        b=Am76AyIrpUwIqPQ3D2u2pn/RwXeY2UXIMJixmbV8ObLuRXb7Gb//G5FrRezs+7qyZE
         ioOp/8gfJQrYva5o9fizUCWsy1on8TbspSWq5AfjZtM9NTmUEdphiVKVS9pjJmkYZTSC
         KV7KpV3quh/LlkPj4EjCMEm3qDuK9xRVKW9IqB2diQc8aVrGiBBU94JOX7E8WVA34vOf
         WYTIcqwtyQ1JHN6TFLMCOw21j/DRY1ZG9LnEK5CT2CUNk5lsxRCG259Cnax7BXgQj3S2
         D5jPEv8V8dwbmsTgRoiwJEE7xekf7fZ+5j3Z0sHWOWkfbGW1byYHaNeJN9M0CJjsEjpq
         g1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420354; x=1795025154;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
        b=cRpdtfMDQngHy/JS5yFR7BvJNxSuXgyHToTAtNjG90g7DPSzaO5I4Z/WN3TaCdbaZn
         eXnHE98RokTh3nu+MeMRY/rCIwoXf3rtlpAd2myoxO/zzmSa2IWL4e71W5YhKFAkAVaZ
         dic0GwubnyINUXY6l2TRylvVk+hkEjnrdqR6gqZ8BKhOEo+CTembPzbR7EeBnH8DRwDq
         QHmCSvQKvvf0BozwxUD1FeE93/aeKjRgLkDu5jd6TAADRI/Bish4TZpXMfVvpEdf3br6
         Mn+UdpLIPUwWvXPjVkPWzhS2HFmeDfPu4jW8wBLJ2Ft4jIS9A1O1kqnIqyOx1Q5i0gZ8
         H88A==
X-Forwarded-Encrypted: i=1; AL+hErEISKNqmfiiy0uaaz+RawmEiFgUp8dJdb5DY1cNbOFKR+V9Djq8ZXPXI39LRm/ecE00bUiaMZRFJqmrdtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EYgitDkK0PheIz2RTLLichCYgx9Hhdjjub27t3poVAoswtRC1
	efYUPdt7Ok5d2t1Ld3MrwaUezWv+x7aaSB6zpmYNStkyTo+alTE44AiUm6v283ILccvYh1sfsKH
	hf+hALM4pl2AJIFiZlHQEwlVqXNP2g5FLjz1lE2LpOun7nW93KHt2B6k5H82yU1jgdUM=
X-Gm-Gg: AYBFou3KDv8M0Ajyx2pPiXGr71zWWB2qGqJkYmezfwimcnB2aiF94eLn3eZuFiQ9I9l
	EF3TtKGEbzKAECeSZuzJjLYXX/P36x0DDGl9ZOchiNKYkBChxoheSnCRqcpuSPm44e7zaUFXMU3
	8IygTim2cncvgVmNVUqC1VbOO4poxemOEIQzyU5tJxPolbqxhV93+vOB/BJNu8W07OvkkmOg97C
	KpLDPSRYuc/jbdRtsGl1aBm0aWHc4lXa+rf8+JpomItgWf+LFhZViStchsg6/wLhqbTOAU1wDsF
	vVnuFIhmfXulXWzGf+eeyrWFyX+ELP/kdq3cxUyD/mUo6CkhbY4clPlgfwGMFRdS9pEXuwjkyyA
	ongmq1xJAQUde7CciPKaPYtU92zRmTAILFTyt2/uZ8OXgSgYF4lixPHaXluAsMHxczFz4qrQr1y
	8=
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr1237683e0c.14.1794420354325;
        Wed, 11 Nov 2026 10:05:54 -0800 (PST)
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr1237606e0c.14.1794420353724;
        Wed, 11 Nov 2026 10:05:53 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm8588796f8f.32.2026.11.11.10.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:05:52 -0800 (PST)
Message-ID: <72bc9dbf-a4d3-45e8-8647-a8c4a41045d1@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:05:48 +0100
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
 <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
 <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
 <0f2c0eae-ed05-41a2-8688-e4b6fe1b7ff3@oss.qualcomm.com>
 <avRy_D6MTK5u01_9@houat>
 <8a557bae-42ae-42bd-a149-cf854b7af9d5@oss.qualcomm.com>
 <dki5db5xizrwwijmjbnbx7irg6if24l7punctr2wx35j4toi5c@4rip7azwzt2k>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dki5db5xizrwwijmjbnbx7irg6if24l7punctr2wx35j4toi5c@4rip7azwzt2k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4ae83 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=fswbabxtGTeL9KkrVe0A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX3aaNeyIft+pw
 pT87VlRgZFknbvnMWtqHHvuVx0bkS7MFUPTZdx1anJaxSHOEy8C8vLoIqLMxWpq5gSRV2FqmITG
 A/FEdaKGShy9nX9LomHN4Dz4zuypKm7hA3/fQlNPHAZM92j1zT8y2Q6pNZPgTB/0n/0W9y1bupH
 /k59Uix8sosdTl2CzTpWwe78ppBiNKtlXB0iE6mQQkjCS2L8WFW+knvOjfEZeNKQQacLpeP4pOC
 jPK8C4mrHlIPq+U9srIPK4+YNBsNaOdMEB0Re1j9rVUzVpPkqbTWuMBWnsLsLIVtJ2XKgexAE5W
 T/jO24y4vUcYx8Zfu12hggNeboBxQWlKLg1yPngmJcAiQLkXUf8/4AsryXMQLf7kG3qeFc8H1B8
 BJxGd/vQyyBXaEsmQqs/WOtGMrwIgJ0ggf2CvKpANy6EnX4uIb1jR/NmWFgVnhr2jilCaeJpSwv
 BH+9b/rBy3NYBnpe7TA==
X-Proofpoint-GUID: g6WnS1gG4emoeHfupsP2zVQtmeJpTAcJ
X-Proofpoint-ORIG-GUID: g6WnS1gG4emoeHfupsP2zVQtmeJpTAcJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXyg5ZpguUm3CF
 MMDd5dHPOEVoIHMlJVFGvdjLCVpxxLsJ3VZas1k90LcW4vnY1VyB+L7TyijNxgQBJWxoIkle6XZ
 ey2g+RJQd+HbefX1dhAz5BVSwrpfIWk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On 11/11/2026 18:55, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 02:54:54PM +0100, Krzysztof Kozlowski wrote:
>>
>> Commit msg said:
>> "many Linux DRM drivers will work fine with it"
>>
>> So many->some? Is this the only problem? What else is not described in
>> commit msg?
> 
> The commit message points out that a minority of drivers use and require
> the port, while majority of the drivers don't. I think up to now only

Ack

> the Exynos and sunXi were mentioned. From my point of view, it would be
> better to change corresponding DSI host bindings to allow port bindings
> and then define the OF graph connecting DSI host to DSI panel (which
> might be done gradually, etc.) even if the OF graph is not used nowadays
> by those drivers instead of providing a false signal that it's okay to
> have DSI links without OF graph connection. It's not future-proof and
> not okay, especially for the new designs.

Around 33% of DSI panels bindings do not require port, so to fulfill
above their bindings should be changed and ABI broken by requiring now a
panel.

Even though neither the panel hardware nor the panel driver needs the port.

The requirement of the port is on DSI host drivers, thus it should be
required there, just like I did for MSM bindings today.

Best regards,
Krzysztof
