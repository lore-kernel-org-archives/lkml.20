Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BDA30DEA5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436685; cv=none; b=O89kjIhogD+WmqXG8CVs49OUfo38wdltRH9m2W68GKx8aTIduhgcuPcJueAgIS0RmMsgxzTLV8XhaFY4JPfflHG7mUn0dNtilHA1oa3KpOV6WzG+RH9PCl98KcyQ/P4QCCVFfrl9XuRWsn0ZdeoGBZugSsKo1kBb335FTEZw+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436685; c=relaxed/simple;
	bh=kS8sab3+oqQ16BkkWTgftQpd9FY6WwLaiCkt6PdFW58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVykHRNCbH7bDYE/AkUEQ2cIeCvXh5gFna5cl+/iO93dETCq4gYjyxYcIOJB8jEY4YMsv9yob2BZAswztkzeyn0XwD72fWmOPCWqZ9X8tsXCmYnYgwusFxvyTUv0DevAWGJhcQsRz8QF6dxrIvTmBmO/rX1RP6EtTVqKUWOPXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcLDftjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSqlG8d4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcLDftjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSqlG8d4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHANO440128
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=; b=jcLDftjBcHBpvXD1
	CXxXFHNudhYx8FGU5VwxJKzWM8el536Q5h3XyiZnOZrQ6Et+E0FyhZlWYj0Id4jD
	k/jdoziPvaF5N7R+50mShcmf0ydpQK25FdvxmleWoYcMgIH74qL4TFyALI92IF3X
	Xpx+aauUDHIUp3Uxs3eGTcZ1HEYS4oJ70agschGic9XQxQzjjTVdNIeMUYt0QiIu
	uwrAOo4Tb1Ng3iPw/hLHuZ5j7Ga4ogUnmbOfaav4KqVY/F1fu5TUK0cMRxHga7gg
	FuNk3YzlwUMeqYUAsQyRMCTOGTs7Wfqai7f+hWnXvVLnRroP3MpCeAAcsXBo2MBU
	+Xn5Gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70f29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:57:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso29912285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436677; x=1789041477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=;
        b=FSqlG8d43Ph8L34ex/6WAxPV4Y8NBwU5iupDX1pDsdIpVY+lZ09dqm9ja5ergpVWpG
         wRRgfwRp0nr3Wm4rHcfmr7LxWzcpXM2gBrgVtTkvLg/AVeI+YGR/4CZfZHUq2+8FxojR
         3u0ovrUffcm/+WykFdmn9E06SZuhIngOerSF7wHZEnehJjwZDHRu8z2ClYu3ThfjDifj
         5F0No7GV4qo7XL984eGfXuCaYhZohWPd1OH5UQTlSMiq/+NukXKqDTzrERHY/d9Bwg0a
         K8zM22Ji0Waj0FrKHl/XKkg8gtED2ZtqH9h182OlcpMnt623vlB1xvFpjm7h1h9nNimO
         RpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436677; x=1789041477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=;
        b=VfN+6YGBXAXUjaiPd+L07xGfC1TFUSFkOzj+U/UErSVF1rXFoeOwDMmuqE3NPmSLCW
         b01e+dS1ErkneftqGnCdbfg9QyUnrO4lNPkZOCS9OtrD4dkJHR0WEOqirDgVBrgWmnCP
         ezUDsnCXnfy1CEw2fqLvo3DSG4GU5NxbHKM1K4iqsmoNG5NYEGxmZyMT2HdiN5NfFAOy
         cD5PTbiB57gXYDm3l0j1cgxzqQwjeALVGN4UJdD8VAXrYeWB5Iw4folkHCb7MQ3rl53z
         pAAunO/Bql4u64ZEmOL86AhzdFXwLK1bQaBxBnSiL+79KY1j4fraUk+4Q+AJKjk/3E1v
         pvMw==
X-Forwarded-Encrypted: i=1; AKwUvBxK99BdOvjWD/+ap4KgRnb+UP84UeKoabYnzinnmxR2+XQZjTB3zwSgy47I+uJtjEp1SlHdqGtmNjZSmcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++koJaKJkbkbV23oT2NQDvXPPuosEEJHX2NqEtcd0JvPwn+Bjamb
	lK6/OGzuy2D7NpZGEoBlE5SWkQvJIS3gPsi9non2lMlG/rZv1DQRZPZrFirL0KDWysNY75OuLYA
	MwDtomKg23HAWJf6A3C+uqcS6rjVrXyKd1kXx2FLuJwh0JRCsYP11I2s4vkSt6Xyxl24=
X-Gm-Gg: AYBFou21009eU1338F9cmyHCtapoHrhIudjlGVKSPzQ1xsWXdkqAsuAieMxk7YwR3mv
	ZwMEtlnfcuIVxqzbtSVhOVWy4mVCH1QxLRJqsA9r46pn22SreYOdC925/uPSUq+MKEX2kB0Xyy5
	ztiAkFZc9cDQGiqsg3tNh9x9kDcuns1j1SWG4ig0MOUgxaVQR0SNobsG+8zYwF9C85LsluXiB0I
	UkC/c0Mf1C2nk6zSoYxVvnprIxBq/AqRk+3NfYXC4Oqn704RfmS+M62h/sWXElqBgA6Ves2tOsQ
	3gFiBzoVtK8aaXjAcnPOzZRKRHkBAqqKTpcywx/tlGWaShpcWXTtu2SZD5wAhyNTaQgUKEkqpMx
	VLA48wY/eJtCpJA7y34uuEw==
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr898836085a.2.1788436677451;
        Thu, 03 Sep 2026 04:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr898832485a.2.1788436676972;
        Thu, 03 Sep 2026 04:57:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4174d7csm89224366b.15.2026.09.03.04.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:57:56 -0700 (PDT)
Message-ID: <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zja-680In1qxquwW9LBCbCJv8uaTyJRo
X-Proofpoint-ORIG-GUID: zja-680In1qxquwW9LBCbCJv8uaTyJRo
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a9960c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7Q0HT--lCe2piuyCE3MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXz49+ombaf7xU
 huNRgEWIa9uCnnO18HADTgcKT5Q+yWL6CJNG5DqMMj9SPK73jHU1HWL/rz/aWFB4ZLIAINjh934
 uTFrdZUhJh7oBZ5D5Igraa57bt/5hJc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX2VKL21o60kK/
 INZyzs3JkX0UT1RyQSpph+u2tJFa5GcMnw9uzPLILhFP8HXGH59yH8/Hzf9av54jPkTxF5gU3mw
 ij2YJKmaovy/mwInjwzJeRYQWTpzj6lPpyGhbSglyRMn2Rd96qh619MfdmPKvVy5tboJmyOcqQn
 WUN6DGcVNvb7gVR0Jw34z1AqUsr0H8PtvmGSmgUxVTh8dC6PBj0RH/8Maf67XtV/yYUsdBbtjyC
 cXHjSKC7JYw0AHe0rezkvcgdIGxodOfHG0FwHSfk1w90pwpkAAnVAC/ApMAxT38Ip846mrk+yFa
 izoCgYwAXAsawXyxQH/wG8KbECGkyxV2bl252vw+5pJ+0Sc1S8LF5VSaGQabDxmL14LsDMOn+fP
 5MRX8wY/f8AzSUD8PU7YFoFqxmjlCCjuiIlUyMKDt7WJ1HtN4dSDboLgTdglH5wIHMPsYgA4sgW
 qjNiAfAUUYyUOwGZBbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> The PON (Passive Optical Network) reference clock's parent is
> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
> configurable 8-bit divider (1-255). The clock supports two modes:

[...]

> +static const struct clk_ops clk_pon_clk_ops = {
> +	.enable = clk_pon_clk_enable,

clk_enable_regmap
> +	.disable = clk_pon_clk_disable,

clk_disable_regmap

> +	.is_enabled = clk_pon_clk_is_enabled,

clk_is_enabled_regmap

> +	.recalc_rate = clk_pon_clk_recalc_rate,
> +	.determine_rate = clk_pon_clk_determine_rate,
> +	.set_rate = clk_pon_clk_set_rate,

These seem genuinely new

Konrad
