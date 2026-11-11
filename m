Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400290;
	b=FLi7z8XhaEhQApo4yOluWOtR9ewx2n4veAZaiquo6vpVxXq687k0QxP0xVPfVA98zLF+
	 1nlmOPmLmwPG2zXZkdnYz1mH5Aj62a/d9kaRmJOFVNw6jsw12jeGDwL8ykUkZ4arf/FRn
	 ho95hEUMgA2CStLWLKf2StyTzCVoLAoSkjT2uBrlpLdk/8OeIX3miwYan8JvOdcF1Rgfi
	 7GQJdDpGMON34Oub0tx1kfJstw0R6ecHlXHgsatO4reXT4lccIGT8JU9okuGwDVXRKhs0
	 tkvMM9egmtPRdvYLVO/QUM1xueSzJkN7WlKDt4AHR0sHEJSgjaCSO9iXT3SWJlsNSqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
	b=puAugTGco2Ck1EsJ9NuA1rNDiE5OPKXuWiBDVmwvrmn8rOBSA9/Ke97MkwuCcrGtWNPl
	 oTQllrsikqlMK4wp/ZmQJtgfouC+aEKocqc55eoj86nJQ3/t9b2Gy0xGGEDcvl9TFNzzc
	 wEri2AtWA9jSNiNIX6qqp+b7JNAKxxBRtE0nEmftpFmfMM7Yduc5hKV8/U20FxiH5oE8C
	 KZQKf1pAAuK6xozesO2+J3deLBOSdVJ29QiWp285wT2eoVGj5t9nTg/gBxnJfJwFWcNSC
	 2JNpeigQCtVULTqKpJ9DN+o3BDFtLRmQkFtJxHcYFenhsz5AEUj15XXWLC1KyPhd8BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M8YkKQJz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXrBCESG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B287B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B287B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M8YkKQJz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXrBCESG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCQGcj687409
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=; b=M8YkKQJzuae/NJV/
	myZr/ObO1tyiVD4Kg4EGhWc6KoHQGb20zdsWicCyoLKMeZhcUCke/QJMOjNT5jmu
	fB776SPGIbuzhCGAIJ8KLoAU8JVtR2lHaqj46EwazLtjQWts370Lb/g/NXbEWVoB
	zboCxylr04BUsBum/wyv48LoDD0iMCViAnbvtS7Xjzkh5d8VU/fBL9f0RZqgasNe
	r1hG/116uhf/78bQkcGhl2HCRRjJttIrDHvVjRVMLvsWId6Lv7tqoxOXpIF0AyO8
	Fc4QUi6POKw2ZWLdD5SCZJRLZ1VeRbvaCGQFyP2YeziOMnzpA/9g+B/tpltJwqvt
	SFrtkw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33grm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:31:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d57f6ea49bso133072137.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400265; x=1795005065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
        b=WXrBCESGksfG2iVqbJzIS39/c6seMqYr6TJwZ8sihsJD/mNjRAYXcnK0ckeW/fKaSO
         DMWOR5WqnHTlf3L/bDpC1yLVl42xzMRFMXK/XQOd+Dy5L7BGbPzGEOZCurRToSqJGp0F
         UqkgOXSyfqgX5omedxr9i81PuKKiQK5CX1Xc9zmYN4TMp+G4kxvLtzZkcDECy3yt8yRh
         CSGTAuZA8ctRYsBFT3AtbXNsNolXh5bahkFZqQf7ZfC3kIEZLbNRtpiRsTSGdYEpHwED
         0DyKmi6KwPMhhqEXgJJ5iEi5IDtuHdhhdWDAXVaDWtol4Z5DsjhQpAiLJ9jMJb9vpptV
         ee5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400265; x=1795005065;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
        b=iYxyCCASOS9fELhbpMP6/v78qPE6OGMF3XF6rpLTWnmYzdnoaC/aqoL5NddModgpd4
         IJo7vhwZ45TfYjyDSV9VDY+yGh0TLevxMgLxPR4+mJJqEtsSHx6bltogPG5LYbg1tjn4
         JzEXMDmzr9MFAIsWPvAJDKQpYMeayzP5uWyDMri263yFRlW+WmyYhka6/PTWKv5sGx0v
         N2ww3/OhZJTrFXJYyT6tJeMRGrsgLdwlCorn5vXcfhQo+YAX3JJl3Q+rGRbFApaNrpwb
         hu66ym30S+JupAhZDGskasgeJp+no7PDzBQ0M2yr8s0NSDoGXW5IAQkiphr6kgNjolC2
         8CcQ==
X-Forwarded-Encrypted: i=1; AL+hErElZ3tvHr8ZTIQga/iYiOlECeZZAQt3R9fuwEWapPg7B5hx24aIhdhu14K1ip/kjzx8ObhkAj1TvTw5ams=@vger.kernel.org
X-Gm-Message-State: APuU4Z82rs/SZge1XhsnyD7pmvSTPLTfZpMzvLnczPbwWen/7Ijaq91Z
	aziVqVAU2u5LzCK8KS45YK8HlQyD+w7l3T0DV5O7tDD8c5aC/Ox8T7Dz10qFT3yrW2Jblswq8An
	f+w5YbFYJTNTU01M8saPK2ztKXVLbc4ljxmhArvDRsffhtrWeQbSkQt4CJgGJJT7VtlI=
X-Gm-Gg: AYBFou1aiMjQXFXBjGF2rBT3Z67WN2qY02t+lAnpNuAHRzmfshUBxLkZ4Sr9eepN9HY
	1reBklwo8mwNKPfAXAY9aYtfTLRHp7iqdzE31tjsSmn729n9mkAennpIUpxKS7ZmqtbxcaAc5m2
	2doWUvAFJRvkhEIb0C8z+8GGgO4egxqPXxPX0mzVJzmh18Avj9nD/YxucJt6lJOibnCawfr4XfU
	m2CKr6jqMqnNoaIQYLEcjy0R7+egZCRusUKQd6XZA+Rr9xT0OulvlJVpgCpcKW1nQswYBUuaQyV
	1h8BI+lHvlBzeIqYPGwXFK4XFHY4Rq1H5VYYwOjRQf/XnFI0NPGOqSKOaEvuNrJ4ySQIksC30py
	y//57W6q2SU/Jf0mkSW6LQlTzDHixOxszi3mr+BNiKsjcv+Bf6GbPfKynt6Qesvsk3bJGLyXICb
	0=
X-Received: by 2002:a05:6102:c54:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7d4fb255ef6mr538734137.6.1794400264171;
        Wed, 11 Nov 2026 04:31:04 -0800 (PST)
X-Received: by 2002:a05:6102:c54:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7d4fb255ef6mr538702137.6.1794400263480;
        Wed, 11 Nov 2026 04:31:03 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951f237sm35965765e9.4.2026.11.11.04.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:31:02 -0800 (PST)
Message-ID: <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:30:56 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <avRM_GhtR8vMdTO4@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af46009 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iRCOULmDqfF0gFl_j5kA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX1Q7Xhp11KiC/
 r6pClEAYvfZy9fyPy3Rg5QHyHA3wta4HZfuS1iIZBt4l8WBbWrHdptcrbx8qmiMx3KBSzAT05Bg
 R/IIT1/hC0I3iXqBqo8Z/O3ucLGCdkyTjMAx0vqEmWovGBoBSmoxyG91ELSP0cbQBQ3/UC6f2qp
 SKU/AadQSmA7F9PjykJUv7f9LxCwKAqZrdswyVXUFpGGtI8D4sv1uLUrlxOjy8UqH3rj4gZfr1J
 rTVFk7jVCZL+Ygl+ZK6XQeVNhOV+vU7oTrvr3tXifDgYlGCuu8whPlxX88IqVKnTS/mHbmqxh9j
 idUqacPa1wH5ZTpHJ2r3W3Ahayd2iiSfH7Ui1fEuE8MFZbYTFYEz/1wBKRwGlWjmvq1Id19bFyS
 9e4BFxm7vCy6hMEQm6KFDc5jnLetTPLEIp4U1AYIsozvGYrNf2BgmgxYwIoDCpMTQoc7OzwUy7S
 eAZrBVotPRyvJb68g/w==
X-Proofpoint-GUID: VcLMo84FAoTnhT8EhCJRzOXV43REkFO2
X-Proofpoint-ORIG-GUID: VcLMo84FAoTnhT8EhCJRzOXV43REkFO2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX4w1ToGJ4P39o
 uyYUClz3LpjQxU0gsxvh1d/3VcG8LIOkZwxe/gYhn6cHgE4oScyVKwF080Mk1CQvAMrb4JwR7Vt
 9QWMfG6A2Ev09u/IrraI6m5fb/gmTH4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110049

On 11/11/2026 12:13, Maxime Ripard wrote:
> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
>> DSI panels can be placed under DSI bus directly and many Linux DRM
>> drivers will work fine with it: mipi_dsi_host_register() adds device for
>> such panel and DRM driver does not use OF graph to configure lanes.
> 
> That's not true. We do use the endpoints to configure the lanes through
> the data-lanes property. See drm_of_get_data_lanes*

Some drivers use endpoints, some not. As discussed on other thread,
there are more than which do not.

> 
>> The affected here Linux panel drivers do not use OF graph, either.
>>
>> Requiring graph port for such panels is tying the binding to one
>> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
>> requires the port.  The port is not needed for the hardware to operate
>> and for some of the Linux drivers, so it should be optional.
>>
>> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> DSI busses can handle multiple devices, and multiple data types. If we
> were to drop the port node, how does the upstream video device know
> which device it should send its video output to?
> 

We do not drop the port node, who suggested that?

You do get, that we are not talking about the DSI host, but the panel?


Best regards,
Krzysztof
