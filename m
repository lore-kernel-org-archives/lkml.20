Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625924;
	b=20qZvWFioYMGhT2gPkGlVG3M8CWJYWeAY6HU1skpSVR6i5uGimYYGBbzhcXjBbae+g3j
	 GimHhugSnV44OYdMtUMuznREpWUdEIEp7kAsrl+oNz3XQw32aTXwjzhvKzQZA1bCbjV6M
	 +byFebZ2KcvUxX5PGJKJ/hNT+A5537Riy6dkO/kP5bHehmpdbnI5rBA8noY+wLblwz2qX
	 LdDipSXbcjxNdGIo9fsKPNgz48OIrEWytbR2Y08bpUg+ENF4mejCbqukkMw2BtIronvpi
	 4jFMSoPV7HMzk2eEl2yJ+GYY8GoDX2/1dEVnRRJa1nYGlmvwBFM43B176/jrRnARaow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
	b=wfgwoO5UyJnAAxgRmrCS1905alQ510cvZAvBGXEKvkz70LVJZKJVVfu/ggd0sbQx0h7m
	 rfmxXwoNBJ8SmOIRCFoxdy5gMyCYX4VM3svILjhJAV1aHWoO8T/e3CAnfy/3s4rlZuRUn
	 4Nm4g9qziGpGei3vcw3H3YlDLXi8aNnlYzx0+t6uVmNynqSsATlG8xOJgmAthc1vdzXPh
	 HmRSnOkcSwW3GofE60pz2ep6U2Bv72BTR2vYIi5hlFAmC3199YBL/BniHpNikIvb2Cn/Z
	 EiLtKjiDzZfePll5K7odOgK0x4euLC+Kw4JorDlJSAQLJ9dT/x/P5D94gibSm8ximOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+NBmADy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lzr6Ka4K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADEB606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADEB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+NBmADy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lzr6Ka4K
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAHt62902123
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uUWEEnkgVVcM9gdESx6pqeOB
	CncyqZLXNSTJSCB8J1o=; b=n+NBmADy4liAn3FPBtfPpY2OxGEG7NI2qjoZpxvO
	8fBM1ROB1ZyVs6b583ZnuZQcPWUEo2WoA2uJUYiSdNa14TXWgfnPRTIiuXuW3pv7
	yP9M7KiQf0bw618boZCwFRuHXCiz9oDdX2ihhJ1QzW8t5uj3gpYqUJ9oDzPcwz+1
	BwJlcEniAw5dyXwKizuL+Vn9tp/MhBOnkbv/or0tZoa5pu8K/qmTmkQIoi9LYUcL
	VQQAWV595SMxn+BQZWxGwSDFqbMgNAs5H4nlk87dEOeWfEaIu67pmvwkbiAVFDs/
	MXy3mOrHtPfOON4Ca6uPPJpgdyFGQ3IkmLHSk9zCqa6H4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgg6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:25:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so574846685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625922; x=1794230722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
        b=Lzr6Ka4KqeLZ41urYrsYGPgVHEYk3Y51Nl6lTb+gWI67E2zS1dxM3myqo2sV8c6aIL
         HgxbwXKhh0H3qGLqbTKxBbtYyGdSQD9HE8+lkBe2RXO9wHIKscGCTOH4ZCjQKyaR7AF5
         77Tq+rItfMzZ/Qa2qfgzkzXnEmbR+k2y+tDhYjzGiFSHa9B53NiU9WFmlCmyQmC7Do+h
         F8LgyNkvD5acNbrPcAroI9AWylOKXEsfvNZ6Zr9cJ9jgtMS0zT1v354AlnXmcwsVA4Ec
         hv+fZpz+TbeqPTaeVMtXXIjdk4kKsJbvT+tVPF4YsGcxe5YlQtZslyCCB3vi75g3+f3J
         aMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625922; x=1794230722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
        b=LmZskxUjadsVrZvGuZCVSQVkJgODd+VeA9wmBquT3f/UCshCn//bmspJEaN9BmCwtX
         aovjmeWn1GAgDaqhetryZmBBgOrBEfYFg5j6eAQwrnt6VbGXUjWii+GS35ZFyteqjcVj
         7dAGMgkVBXijLvtjVhmttk6vsa/Nqptp0d2s67MvYTrnv0jNmxUY2DG3X6yRKezMAAJB
         YiPLCuKvXyqLIYCWnfGFXda7BaJ2aMUsguWfjIVoLnZyBFkYDbU1R6oPO5x/YCxnibph
         EXTD84I3wcnbxJnD2HSqAwyJ8u6KwHhrDsiOMGFCC5+BSwg8EMrA4GNw017sO7PyiAhs
         L26w==
X-Forwarded-Encrypted: i=1; AKwUvBxwW6xZ47nAm4XozDUqPvQFE/wtpGUTA7OrPGgmOoZy6HuaY3lI7AnXEuEYdebtNPzlNTXN2W8noIplVQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7WABZCTa0JjFYmPmBLv/MjQG6wCRXiartfobRVUyihsW89wVo
	TBkTco5z01byIgqAm6iGvcUh5hUmo6WQ8pN1VheC238qUwV3wFnF27UKzAebvNds3bFGN4Lpq1v
	nRL6B+4H+EyBWAwlHU6KWc/XJWS7d7mQQwz+iSxu/AXFJVNN9gQEq/th5U7Pnk+Ss8Gc=
X-Gm-Gg: AYBFou3VIN6d5c2W68JPdp/oEzX6HUNcCl8+QAWEa3h3CpPBtspxPTGWWyiaV87yxLV
	TFo+BwpAZbyzU+zGtaZEaDe9PWNzZmEyx7CFWxxDcuZfI/AdDNMeR3mU2dX5mmRJPDwHlmjdQUa
	4gHO4kKx+VgJZIlCZddHz5jZmi3NV/jayiTJs5NEOyXe+W68bcfhRBKAshMqGPCf1dAy/wukrzi
	aBgYWKplDvqqGbUng0ckgiTzrHubxe6+Sx/AzPQ8xFe9/UjouPSd4Om+5srvQ3sflXFMIur/OVT
	NG+vZWa+2vzWc38+xLEFDwK0c9pO+IuNrvfRgmolLKJvkYR0iAKOns+qlW3GC7/nKH9PMVhM+6j
	r0aO8SwEYTvlchte23TqKlZ4j8Dp1rcRFHodpXDxkAsbjm+hoTKZgn5VMQETe2gg=
X-Received: by 2002:a05:620a:84c4:b0:940:7e5c:7424 with SMTP id af79cd13be357-94421718c5amr1505537185a.66.1793625922212;
        Mon, 02 Nov 2026 05:25:22 -0800 (PST)
X-Received: by 2002:a05:620a:84c4:b0:940:7e5c:7424 with SMTP id af79cd13be357-94421718c5amr1505530585a.66.1793625921465;
        Mon, 02 Nov 2026 05:25:21 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c7852esm257033185e9.11.2026.11.02.05.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:25:20 -0800 (PST)
Date: Mon, 2 Nov 2026 15:25:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Message-ID: <mmpow46nqejnddkndwlwdslgspjl3b25gocnpbc3qaxkmyqstn@52zey5gvjp2m>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
 <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
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
In-Reply-To: <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXyDScKqzoeoot
 YRh5IfjUXtDZG5JnGi/EDyA1nZvQh+FX58TiiAekF6xzy9xD6KzxhY9/bFTn5x1eknZ4m8agLj3
 KeJkqn+P+Uy+aj405f8jWne0RZwt5Y1vTAEhfr/qOnTzFb/ZYvxLXTUgGXJfVNCxm7jXIqexTVW
 EbapRMCx5Wp54ZKftlVeo7BfHEJ9/CNc1/kTZJa9s5EvzoE8Kx9Lo/WbK1pEBCpDebBbZRUCl8f
 2HXQuQ/jrSntyAjOsL3GrbMSMEKwR8Sc8+N1NwvFsOpKjjmXnQlMFjBWhbG7QpL9VOTvh1wR6YL
 HdxUmvjlGSTpJSvjF+ugjv8TWaaaPU982yx8ud0g0Xio5aO6svVqqb4wuZEJvt0hfbWJXh46fq/
 BLsXvcdSATkaGVHFaH06KJULZMwmxyWjo0b1HPRqOAi3SsxOoGsfRSGW3PGE7bcPL9UZdGCnzTF
 +18Zse8o3ohlceP8yDw==
X-Proofpoint-GUID: XsWqUo83fsq4kzkoDbQeZyjQ925PvqsA
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae88f43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9QAMbel9zcorH4rNmSIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX9KBZUD+nmSDN
 ZXvmiGgylvQVmboqE0jcEWagV3TuY3bHfXYIf6SxNXMaBaNodDzIzcczZ+spGtKGapZW65ELNfu
 9v52xs6UFphI9PHLHhcaBAZHOrAspPM=
X-Proofpoint-ORIG-GUID: XsWqUo83fsq4kzkoDbQeZyjQ925PvqsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 26-11-01 12:02:35, Jason Pettit wrote:
> Add board support for HP OmniBook Ultra 14" Next Gen AI PC
> (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> - internal eDP panel (2880 x 1800)
> - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
> - NVMe SSD on PCIe (pcie3b)
> - Wi-Fi and Bluetooth
> - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
> - Adreno GPU and GMU (Freedreno GL on Mesa)
> - Audio playback and capture
> - Real-time clock
> - ADSP and CDSP
> - 5MP USB RGB Camera + IR Camera
> 
> Assisted-by: LLM

I believe checkpatch now complains about this. So drop it and mention
something in the cover letter about using LLM for this patch.

> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>

The rest looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
