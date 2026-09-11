Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6C639CD0E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153471; cv=none; b=DlxAhE2Xm3CImKQhX+Yxs5Eg9wCgmvrP/C94tzy6gVj/v0yBPEgDa0mhcq2pLdsZPnDo3cu1X4tLDwfoPOohn4gKGsrKu4kEXL+xexD3L71CU1+TFZkfFB31F91XdLWofGyWIiHlgwYpqoYimaQ4ao/Tik4caPuFzR7+3g56dvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153471; c=relaxed/simple;
	bh=yQiRl9MeV9tKsX6X7NZzmTmBBE64w4gdOL9s7E4Z9Z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ij6hZQ8ksRNB7ySUq/4gHvGmjitAzsZ+JBMHRtXSrQNIz2kjdID2bgxCHn2PBRHYdEwNtfrwsNFVBUKyBw0r5MEt3yuRdBtn9W5gHiNPABQBBwl8RTeJvLyoifvwgoB0MOSHug/VvGmPnbbs2vDi9TVnaWKBvyAntI/UBt6s/GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8jVy2+c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzyL0hFX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8jVy2+c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzyL0hFX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWwr6590312
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXs2xynHDSjRZ/impVK9y9vG4YJMz2HwW3zOJHMfq+0=; b=E8jVy2+cXmNlHJ5I
	DpylD34o/nqKksIYZEYwk+amlBAXuOREpoaufcou/sxzeQZ5MlGDfYs4C6WszNzx
	6NDlbC2im5su898AOt4+bh3v2tkAPS5BH/wIESHT7sBFgmoJOQBvwYF7RuzucFMC
	UVwIYd+d1aM4hSVXbIrRyAMrMbtQ2LiEQJ3ik+JJ36ZDHOzfjoIrCDtVljg7bfcK
	OlelqzF8vAkjR2yh3WLCFU9TTd+ozwbAW3kf8gu4gZjnAlnMNzZThWFBpjivzvYn
	RvAfpDTksjUxF1dV9vSTt+B5ASlWg/3Lr/w0767lUwHgAWQEatUF5dwtb7s5Ptc5
	JJTZmA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrb915-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:04:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso15398665ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789153467; x=1789758267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXs2xynHDSjRZ/impVK9y9vG4YJMz2HwW3zOJHMfq+0=;
        b=bzyL0hFXDWY9OdDoUkgZeUrl0fC6ddsarDJ4+MuAyk18gnUMTgKz2wFQy3yTQj6h73
         FSAGnW+NGMvsoAFQohsbeVtxWBk3j2CjmYfI9a64J7iN5DQRzd+aXM5uxDF1MLCyfjvd
         +OHyj+4++cW6WQcGAo44KwmSg7wDmIYO/bQhqAnm0PjLKniFttN7YWWNx4ux8p/HVFkW
         mdgdcbrHKvSR5ubhGZizWpXmiBR44vz04nvuG1JZu6efymamgBN7DIafxQROsnzZwzFP
         JHlS4LG8Ebt4/wvFO2GilOGoKxw+aXTOsYv4SeTNJpWfoxNAoYV5ZRtnm+hdDxsvTBZM
         YXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153467; x=1789758267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXs2xynHDSjRZ/impVK9y9vG4YJMz2HwW3zOJHMfq+0=;
        b=oAePQRKa7TOFP/nxtQBwKu1hr7+Vz0HtJ0kOsepjPPK3RpAZ05i2u0EMvHs8u1cIk3
         rgpm/HPNbvhvGU6KQqPhf9v42reag0hg+K+01E6ufSoYX3fB3KRNQRy6loypK71XV0Jd
         uYHcdTq3D0i2Sa6PNxvHfnYt9ZI/ZvZ0oiKeLbCnZaLhhpV8A1KOSqEug8fp+JnP7sPN
         upA1y8XiKRMZOB5KKB6xyKOs3Ixi6zDBF+EbOdQ11T1Z0xXsYT+v75SA1qewj1zIfdSH
         LDFFbE4cpgKczFOR4jRJD85W9VsOjH9YLUXpVNODcWxu8UwiXpSi8ZYLsMUIs9EzE2rW
         9/eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfQ9AXE0cXPUI1ZRzMjpDu1c/GmTYn/Qwwrj7wgQR3pbUpX+Ql+X+Xg1CXEouKQObXyZpJvd05rVCzD1E=@vger.kernel.org
X-Gm-Message-State: AFuF++kvj19o1WCkcm/DPLwMDtcB+iP74ypa/08dEzcQbPTLmm+HcRgb
	xoJBq3CfMRzVmcCSPrEiMx1YSbMsyXZ2Hoe8EoMbbFENrxivwB4o8KeowEkWINlsRpAOmhAzrDP
	kGIVpFG1LovmDH8pzGP+55we6KeUiT9Zm/X5qWMBLAlpup+gLbuaZ0+cscOSGbDfLgWxcX2FJJ+
	s=
X-Gm-Gg: AYBFou2ZtVBDT4UGg68QZNuQ1UpZf7INRHAcbaonZTT5hlEQvPE51Wewj3Pv0n5go1u
	t5ULCrFSgP89EDw6v6QAdOrWktyfAMknSn9ZzOmTrqGXzvw94jfBjII+fP5vr5PAPddEUbE2F9u
	lAcQZthUvfBm72lYG2If/9orzzg2+VcaLiitoUm07Bt3JCJOtXqGuTLWofENZX/QGXvnLj1EPBi
	YMRYfmvwPyBWp0mdzezikxaje1yx13+y8RufQctFoU9V5RFQPYs4bsYQNPx7by9UHkg39P6c4ou
	znB29LUpNImiX1f9vLHjb0DPKRk0V00EJ7I5HXHZysgg3bm6Z1SuKUix0e/gz2FCpClGwFIB9qD
	GZpPDpBDtXBlFCEftuSnlOMrmPgmKeY0tAIRrrv4JGBu+l0HcUPcx8NCxAb4m
X-Received: by 2002:a17:902:f693:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2dd2a1c52damr90034715ad.1.1789153467071;
        Fri, 11 Sep 2026 12:04:27 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2dd2a1c52damr90034185ad.1.1789153466548;
        Fri, 11 Sep 2026 12:04:26 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm8541303eec.7.2026.09.11.12.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 12:04:26 -0700 (PDT)
Message-ID: <eaf9335f-ec03-4a3d-8eec-dd788f47a992@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:04:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-devel] wifi: ath: split 5150-5350 regulatory rule
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260904022557.2679261-1-rosenp@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260904022557.2679261-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GFbXyaU92ZQ5TgSrzucUgJct3mZ1i3ai
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa450bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=ot0yeRjmKC6ZJrFq8XUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GFbXyaU92ZQ5TgSrzucUgJct3mZ1i3ai
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI2OCBTYWx0ZWRfX6tSKFGJbM7Tr
 vvle/vKOGmyzL4xjeZdmyQ/7dN3F2AVjZUWU7TBD5RW2utGR1oSzf6occh4kFZRKlt3ayq4yjXF
 JkddEc+gZnc3jDbx9BTpzaU1osQa/b8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI2OCBTYWx0ZWRfX6gvK+R/SS/eR
 Un/1hhwlRiTmBa/lESeCkqHdO0WLilDb074FJS9QAoG8Jsd8icG8aIPqVbY0+T9+Lif72yHMenE
 R7rTDeQm5ar+UmnNRQmUMEm+IySjaXw66606egOP8UUcFobJptlooxRdD+V/nI+4DAsOdvx/cQM
 TEsZXOrDtuyIRfb+5/KQ+ujascX1w2cIqvxsDXwa61/Dk8P39SGZCHnjSW0kQl3uPskiqUKrGNR
 45PN+Ealf2NXVInfT7coyrOJQqp+EQTn6aZCbXBnhOAAlQEKCQBTt/z2EvVMYU89syDqsLlTFLV
 ojpIL4Pmc2dhuxw+q2Ne47zDnqb+njCfUYFhhkmMPMgY8QwImuQw+f3OG2WOU3trlXT5IPsLDTf
 g6n6sy4ud9kRZk9OTJC+pnrQM7yNZaFXcXhiVszLvDCQb57v70dOL0HNZakcsbDP5+OIGDMsI+t
 DIuRkVKLYGkcKYss6CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110268

On 9/3/2026 7:25 PM, Rosen Penev wrote:
> Allow initiation in the 5150-5240 MHz portion of the world
> regulatory rule while retaining NO_IR for 5260-5350 MHz, where
> radar detection is required.
> 
> The previous single rule marked both ranges NO_IR and unnecessarily
> restricted channels 36-48. Update the rule counts for the expanded
> rule list.

My understanding is that this is not correct. In world mode the entire 5 GHz
band is restricted since some countries do not allow any transmission in that
band. You must establish that you are in a supported regulatory domain via
802.11d or other mechanisms before transmission.

So I'm dropping this patch from patchwork
> 
> Assisted-by: Codex:gpt-5.6-luna
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/ath/regd.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/regd.c b/drivers/net/wireless/ath/regd.c
> index f15e7bd690b5..b129af0eed88 100644
> --- a/drivers/net/wireless/ath/regd.c
> +++ b/drivers/net/wireless/ath/regd.c
> @@ -43,7 +43,8 @@ static int __ath_regd_init(struct ath_regulatory *reg);
>  					 NL80211_RRF_NO_OFDM)
>  
>  /* We allow IBSS on these on a case by case basis by regulatory domain */
> -#define ATH_5GHZ_5150_5350	REG_RULE(5150-10, 5350+10, 80, 0, 30,\
> +#define ATH_5GHZ_5150_5350	REG_RULE(5150-10, 5240+10, 80, 0, 30, 0),\
> +				REG_RULE(5260-10, 5350+10, 80, 0, 30,\
>  					 NL80211_RRF_NO_IR)
>  #define ATH_5GHZ_5470_5850	REG_RULE(5470-10, 5850+10, 80, 0, 30,\
>  					 NL80211_RRF_NO_IR)
> @@ -64,7 +65,7 @@ static int __ath_regd_init(struct ath_regulatory *reg);
>  /* Can be used for:
>   * 0x60, 0x61, 0x62 */
>  static const struct ieee80211_regdomain ath_world_regdom_60_61_62 = {
> -	.n_reg_rules = 5,
> +	.n_reg_rules = 6,
>  	.alpha2 =  "99",
>  	.reg_rules = {
>  		ATH_2GHZ_ALL,
> @@ -74,7 +75,7 @@ static const struct ieee80211_regdomain ath_world_regdom_60_61_62 = {
>  
>  /* Can be used by 0x63 and 0x65 */
>  static const struct ieee80211_regdomain ath_world_regdom_63_65 = {
> -	.n_reg_rules = 4,
> +	.n_reg_rules = 5,
>  	.alpha2 =  "99",
>  	.reg_rules = {
>  		ATH_2GHZ_CH01_11,
> @@ -85,7 +86,7 @@ static const struct ieee80211_regdomain ath_world_regdom_63_65 = {
>  
>  /* Can be used by 0x64 only */
>  static const struct ieee80211_regdomain ath_world_regdom_64 = {
> -	.n_reg_rules = 3,
> +	.n_reg_rules = 4,
>  	.alpha2 =  "99",
>  	.reg_rules = {
>  		ATH_2GHZ_CH01_11,
> @@ -95,7 +96,7 @@ static const struct ieee80211_regdomain ath_world_regdom_64 = {
>  
>  /* Can be used by 0x66 and 0x69 */
>  static const struct ieee80211_regdomain ath_world_regdom_66_69 = {
> -	.n_reg_rules = 3,
> +	.n_reg_rules = 4,
>  	.alpha2 =  "99",
>  	.reg_rules = {
>  		ATH_2GHZ_CH01_11,
> @@ -105,7 +106,7 @@ static const struct ieee80211_regdomain ath_world_regdom_66_69 = {
>  
>  /* Can be used by 0x67, 0x68, 0x6A and 0x6C */
>  static const struct ieee80211_regdomain ath_world_regdom_67_68_6A_6C = {
> -	.n_reg_rules = 4,
> +	.n_reg_rules = 5,
>  	.alpha2 =  "99",
>  	.reg_rules = {
>  		ATH_2GHZ_CH01_11,

