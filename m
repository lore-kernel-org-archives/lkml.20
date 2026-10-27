Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102541;
	b=gdUBhqo+RTnvAL94fpB9QV1mZaBRlDFBmXva8vS21uLIZGfE09Muq0lQE90B9QjsXcVB
	 DI6rLhB98aeLg8IjtIchneQqjliaPA0V8ySWr/wY4RxBAjLHH9UwI3p/IUHXVMi1Q6u0Z
	 8dSF+zNF0mwvWv+3u0i8cDqx8VQN5h8QeJ8cb0jQxrWJCi2SnCgfpats1SJn/sYNIhjoU
	 zoR0Uau3VxufZhQvTsSFqM3NJ2BWTUqd7HJ83AFy70J7L1BBBY50OhmusOxxVTxds4sFX
	 omdemWKl3DyI/BG4SfqQ3wnWRokL/RJJqsx+svZn90ZeBBEiRjY+7jUN40lpvzwjEqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
	b=mPx/IGPagm/dmSS9sJ0bZyKlPFydxUmTpK7oyiRibBju3AvmyO2PGRapPcK+YM4WHIGd
	 adySv3JK1SM5G1IwaoWizJSDBdYWHkpuErDhodufnEXHh8o05d4O8HLbQ2gmcp6/aVfCe
	 0iEEyuBNKV0CavVsmh0NH0M0vD2s2InM2jEmNIsTNilqIgWz2Iynd4MD/P5bUtDLXbm/i
	 h52R6nfE9bOcMKpnVmFsW0tIg2A1FtJbGEZLJQF1WyTfzpTPjoEfsyVfVJr9BunzvrXly
	 KUv7aZQ42t9uWsMeeqtMCYUgvYTxV5ex90zxcRiYNi1mJsgOtzKorUQmGz8HcXK1qDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VY6nyYT/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i1AI/301";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C66606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C66606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VY6nyYT/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1AI/301
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3Jh1935897
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=; b=VY6nyYT/KRTbNCFC
	54PQYBA2zoc6U17Izq0U3o8/EyrgmiDpVBFpqS1Hog/UAm7o+P2JAfrf0RNEwfc4
	h0CT+6QhALItvX2cDGlPHVL0kFwsuzL1XKA6dhnehQzwXvYubi6ZffI8hSHBboVf
	25VyvhyY5eUjGXmw0HRZQtp4a0NY80F7y7sU79GfWdi+feJTSe42rJA+tSn5dqWs
	dB6jFsOrxd/MAQoV/vI7RIUOQ6kHGXlND2Ek0tMf3AO2R4rOiolhsTR0Rxrb1ppv
	gZyMSrh1GMofm2sNUgUDrSJCrgg6xd+o6vSELXd75cAaKKZ65Bxztt0TRlwYt1TZ
	FxOtdA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtpux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:02:19 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8003169e5c5so2656241a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102539; x=1793707339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
        b=i1AI/301zX3heTMkN9c8ZZkb5Tscj40kcE1z85dn6Vnbx4Gdg+RkXhRiuyUrVzfHqf
         5735QFXK6gbAASSdhsQi9XDevQIaljA63li4tCXFZ+dOUKEO/d7+2rJ8KTJy8hYAwIwK
         l181Sv4IiDnqCfCa+QWaLs8d70mJkxzzGGOZFwFPiBvwcj6MhtoMvcPAGSuLcrE+kDdt
         BVhrFjbvYGwjCaBs2z92c//PLAYMh9I7qwHYgq4wB/HlVhORZQ5x62+/t8999CxpMMoL
         xzZWWcIUild2fBi8z0qu+/6k9Ro7gnM3BwSAA9JyIC+qR2BHzQRmdY3uGqOsW254DgAN
         8Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102539; x=1793707339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
        b=HysAT22NnfmTA/L1HTm6MNsS7QWtijRwjFcvJKzu6P1fHInukeDKgaZ8cGdhXlPeRw
         svfMHrfqH1sSJ0Qlad12iUbJ+1dRNP7QnKkIqhpkjQ0rnLXxejIQHd2XO1xkYIrQUvj1
         PtZMLuaZzG3/t0A36iKIaTYPD3QyRdiIR5eDW3hw1agLb9m5jftpNY6+xSzVPeWGeM2K
         SpR41kzoqT14mWyMyFsPggMz7o/UollhGgZ0R9od/Dugl0PxNH8M7rZ0wlHAnHEfnpCH
         iaMD88G/uWXUCirEWt7UBjaivqCTL9+UfFYDERiZx8LOMiiRx/KudbxG4fz2j6Y/WyfY
         66hw==
X-Forwarded-Encrypted: i=1; AKwUvBxbVwdiCat9Q44NTA9YjtIZBBkS5+1zqX17HuIxcx9JFC8fZJFnYQ2Vzgx0AHrSBkH+zonL4PuVr91CfwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgJMoqHCY8bXqOo3BNiuHKQzvB1ZF6/PP1dJOT8jdHlLN2iTER
	WBavcpw71udLwUXHGY9igpQqSwqsmTtBhiQWETWFWpO0sj0YF0jguZMccUJ2LZc/5SIyyw8fVQ9
	b9Fd3J7+LwCsXOHI1qb1pmJrLl7d4jRbyFKui1bSO0s+bkTer4X5tGE6XGETmKrt1Ll0=
X-Gm-Gg: AYBFou3w3kwbQ6DkqZ3tsHDJpRQLAVSDrR208C/wjOynxg5PpNc4DP1UDbV+qh5t+2D
	B+PXRzBQ5e7odnH8ZzNwnVLqtNC3voJjMHUv8ma8n2RW/hL6H3WO6ZPslPCdFq/ulUBaH6DAdpp
	BI1wr7O2U3FcKWeQjcNLoJpZHAoL3pX6MU+pZOkRQRO0SoJuCZ8pFeOpj1k+kHqTM1GoFumvs3m
	Yf+Uj2VDaBjU6R+m3E2U3Q+w7vhQ1mwIDFwO7u7FNxVszsqIA4Qk6cVE21ea10UHtT6dcmckaYc
	GxsjC+KnMXJfarMWxRe9kObo6kE8UCjLp2yU+rEt0friWOcgUzwqc7sxFBD+LE749iR/R6HoUpK
	FSPHMuzv4VUGBZm1V3BMvFFTlFAGs0zqqTGh35TV/Pdnesl5wTcdI7tAjVBXKQ/KrVo6uFIg=
X-Received: by 2002:a05:6808:4f46:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-55bffd42ee3mr10422860b6e.0.1793102538825;
        Tue, 27 Oct 2026 05:02:18 -0700 (PDT)
X-Received: by 2002:a05:6808:4f46:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-55bffd42ee3mr10422778b6e.0.1793102538203;
        Tue, 27 Oct 2026 05:02:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971383sm4756451a12.21.2026.10.27.05.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:02:17 -0700 (PDT)
Message-ID: <83abd085-b052-4cbd-87ab-8e882ac781b8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:02:12 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _lAzzPt92gtHBmJl7ELYwbrwI2svE_BF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX8W3d2tLm+WGl
 dWJFoihRJB/0lVwpLqahD9LqD9ysMtcLzHd9Oxf87e5FqHATuMzONj9GghtEsiYik62UJ8wuE8Q
 wYikY0DriKhaIzR0GCV1HqZRQ1m7BZM=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae092cb cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mY-c6RtcwyEVXP3PGRQA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: _lAzzPt92gtHBmJl7ELYwbrwI2svE_BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX0BEdhJkTZ3SP
 xLAYTHZ+1bpXjmKpAASFQOGrCv+p7KfA7mnWzX8DDk7phuWzQ7T+/Bm8xvlfhaL9hX2tLHvbKUN
 qwz++8OScCqmFt4p2PIgu9hwIXcczMbXcxdzqBDSMX492NY5cO2oNbjCgPnk8Zi6BoLpQmk+GiV
 j2WnC8/+uA1ihhngg3cdtyHvurc2F9DX1fcMWibUYMvq8gaIVZhpTGPOFam9Z9FO376XdL/p9iK
 8NTIsJlv8jUscd8+XTLh3mHmtTQRMu6t2z2nWjHwEZeOKDIcnWO830pD44WiGN7Kn9UmsemtrXs
 xS6VRkj7vh5QYTM2mIPgsPF1MqGxBl9fWaimLqhJ54NcAE51UlStnLPGkTZGmgeoSnYDLKjvAu6
 JwwHZyy7Af9e7fxg7nPHNCvPUkUGjIFpu3RIZSH+pKovmCVU2x37O6zjs+o0gsrmbfF0jWc/f7G
 RZPy5/29qqjUNtOB8qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

[...]

> +	dp0_phy: phy@fc3a00 {

Let's keep these labels mdss_-prefixed so that all the display
nodes are close by in device DTs

Konrad
