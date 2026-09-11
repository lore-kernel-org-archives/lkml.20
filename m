Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E049B219
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141683; cv=none; b=Ti7icYt551owNZUa+CDXS4lT0EYeLHMtDtMBJoi5m7mPET3zYHX/SiyQFIUd4ICnkwtSeSQ2jOqGY2upMu4VGgydCMSS1wqKGm1ts/lSjQnaqxQUCTGl4r+rGMbsXZnjNH7s5/PSY0MSiOuOzUGB5Cx4ze6cY9Kp388ao6gpqeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141683; c=relaxed/simple;
	bh=Gf1Q0sTU/UBy5u52sv5kJvv2O4ZJCxnZRcFqED9rhiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQZxXwxJp7+kX5zU3jVheXozytYHXH67VgdD+MZzdKYJbLX+SajS4g06rybFWBNl1NoZ6pi7G6c07NdNST31oQDK1d+qT5LBOtP7qEgUkPDjKEwBOSwoC8m9gdYf1jayk9+JaytbYheTKsCz/CL3GNjKODD9HGqTAd4CCIu8P7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCpPo+MJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBIf8h8d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCpPo+MJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBIf8h8d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAil222576
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UfwvCJZ18lp93+WPqAxfERzMxNsd00Xm06mrFwnyhZs=; b=NCpPo+MJDgFf29jc
	jKcs3c7NPOXvzixt1cRi/VTasJ3xtoZZbYy/22fn4N0GiRKcaW4/kTtajBvta1fj
	bzGVpSwg+dCjMrhUn19SM14/L83MLfmuDpmVJfw6MkLo8drwuJhVNXJKWhfN69b+
	D9b+AC2fUKo3J6J0mcgSfZL+YUvCoU3gC5WvYzJ0px7mTqh2mm80dxAxLWCFuTte
	+diXadbQUlcpQT3bxwfD/8+eEkbtFzABNB9Cw8b20Uinr+6S7arO+KVENv8659GD
	wRaU8ubXpBt9cFkrKoFKZ4VbhxPW06t254skdkxJy9FEkGUIQ6y20sbN83qFAM18
	ol9atg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrahjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:48:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7f0b92e84so38734e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141680; x=1789746480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfwvCJZ18lp93+WPqAxfERzMxNsd00Xm06mrFwnyhZs=;
        b=cBIf8h8dFTycAWsYO3LpCfAChfRgFAR8KoBqSYc5bDInilr48ND/AHtHziQCeihboU
         czGHIW3qT9spUfd70c5p4veNDDjqw8Hq/Zr9IA61tcUMGE6VPkS82IfkBRlQ2WC9zhf2
         scdty1mFsNouD80HNmncSG7S5HngMKpXc0/Q15TMD80QqHhoQYob6VYEEpsdhIrmPWmO
         Xm8iLK0XxZVPS5xJnXmB7SdRjm0NClG147X25MjxA7NLEcL4lfTU/hEIsMOWfgTv/9/u
         K6+DUo8o12eR53rewtErUGloP4LQdo9FpHTdEXxwBr9uOZ+wAs1KiZzY8oecxUxKqYk4
         a5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141680; x=1789746480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfwvCJZ18lp93+WPqAxfERzMxNsd00Xm06mrFwnyhZs=;
        b=SHj8Yr6HPgtrDehEJ3xaspgvojp9Fa39MhP21+gTrpHPOYwvIIC4HVCpcxXBlGadJy
         +fGvrAar+NMiCWm34BKSkMq1iL397quEy1yXG1dbmiacXqgP9cahpvC9gARqArXtgDOG
         oyaFhJwFiS5bgoMj1I9yL32xcZX/ms78N1Th488XHHBsN+/qDGnF8XoWAmkLZ6rSR/L5
         otVayU9j++2g+bQgh/ztR1U+x9GdWxN4gVwkx1Udc3CSAhrMr5jq0Kp2wqabw6XH8+DR
         i6xGGb+sUoLUHSJYrUk3THTVZHo7M4df0LvO8ICRnYOp5k5CIguZBW47VQwDXmVs1Lah
         6I8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKtutf2+3I4eCCm5i8Z6/zu1DoZSJCrG1VZrnHKDcddEbeHLBevQMId25jAGIHyiqd1Hxy4fmzwCnIVOg=@vger.kernel.org
X-Gm-Message-State: AFuF++l/PF9JD7tdFcX1MJkqN+6Ny40PI2GkIefh71+C9Rc/onIijj61
	jU1fMpRG0oCNtX04YeRlQLMk+YjPrcBuNOzkVqrSNtbMD9FGmmFirNTOHCQXxabcs5AugRIt4Eu
	T6L5fZt820L7VdSPavBI/RFUklRDhfmLUmyVGu+BFst8s/YrGsP706tISVd1VXh7U0dw=
X-Gm-Gg: AYBFou3GK2A2mls4VlwBxKEQq2xKoTu0Gv+OUVtb6MlYdAXSks4+7ZnJlnLSVUaOlWF
	VxvXdiEkra5fmISIfLSzaylXy4zgkEJp6DtnJyPMgmg92SxWcz8gKGj0s9WMYhvwQ/pppp596Pj
	GKqXmkz9qjPcWhM2rlwwo8VHPYDd1NFZa21CMIoikBwNxyTtsHiDRrlAvY1S4BCUjynRpTKSa2+
	7FJL1CwVM544aozhg5B6nQH6XiOFORY6MkM2MCEuQPM6QA31UQlliGMlJwMla9gTm1daVtVQkFf
	RObXPKY6oOzecyAWwU7qbqe/c9A/JuL8pX0zlhPQwT6UhJ5erbx06+XCNIThD/8J/mJBbv8+oqr
	gNUNXTC9d66Gj3qq5AzI5lQ==
X-Received: by 2002:a05:6122:4a1b:10b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8460814acmr1633992e0c.1.1789141680151;
        Fri, 11 Sep 2026 08:48:00 -0700 (PDT)
X-Received: by 2002:a05:6122:4a1b:10b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8460814acmr1633976e0c.1.1789141679590;
        Fri, 11 Sep 2026 08:47:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd69sm716054e87.83.2026.09.11.08.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:47:58 -0700 (PDT)
Message-ID: <5ab7084b-1bbf-4e1d-a8b6-fa29dd9ba5ea@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T5gdOyqQQM-uW6QDYZioZHV_zl6cH3wx
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa422b0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5N7f0bWkOQp0pCbeU4sA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: T5gdOyqQQM-uW6QDYZioZHV_zl6cH3wx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX3sBQbXBnS6ue
 eQpMbchumd9JgB+ZE9Sep3+HtZD5mCTSp8IPRjR+EEdsO16VVedO1GGZysxLnRc1DQOPZlFzab4
 Cbo3ELC5v/IMUqqnEzHFfAVUAh8ovbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX73FRZz5KDOk+
 le5qzdxAxjUbLR/M4dSYLSYAl/1gT8qw1586ZBXtaj0kJMmtjgHlTh/SLjSQ2aOPcRgaCy6G2hX
 dWpCTh3jkjXFTI0MyP4TWCrsDGhFk/TpnErLteAeUCGtPWeRnDZ6yVzLLCEWC0mMCWguBE7DdE4
 kMWOJgAHrZfNj4pa39WsecTi0fDppCMaZrLCyengsPy0Yv8LYM1y4kZwISp7TnqC3Os8D5qwU9A
 6xPTbwDmQR0lYBJsqcBsUcPtqscAMnXzUKolsLcFvVNiT7126MiG4LqLtzDakXyjWNG6nDB/QNM
 YhoUfNOOIiirIVOsRTZ68aW7TWfJABPS0lS+Ztt5QTqyKztgn5TWpHP5sQSWh3MLVXT18QI4w5n
 g9pDTN6E2PWj3mR451v0pv0fEI0eyjXc3NK/RyuMnzzu+HIYkexalgOQ4U0jnV8fMhMG0rBU4Aj
 BXyWi+01oFoTfi/9wbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110220

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
> it should reverse the state of things already changed.
> msm_hdmi_phy_resource_enable() is used also in probe path, thus such
> failure, which could be simple deferred probe, would leave these
> resources permanently enabled for the rest of the runtime.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> +err_clk_unprepare:
> +	for (; i > 0; i--)
> +		clk_disable_unprepare(phy->clks[i - 1]);
> +	regulator_bulk_disable(cfg->num_regs, phy->regs);
> +
> +err_pm_put:
> +	pm_runtime_put_sync(dev);

This can apparently fail too.. one more argument for PM_RUNTIME_ACQUIRE_xxx

Konrad
