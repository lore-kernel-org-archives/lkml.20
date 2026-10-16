Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC04DA539
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157706; cv=none; b=CPZ+PChtmCMtxC0nSziMQxyckzFscnYgFbOd4DisHSAd0J3+FgNiQ3tgE68oRhZK/Vv4sDMi+j2epoPs6/p+U1SgN1pRiBsknYzOdcPxkwr53stahwvc+Ufxk1T0qO3i7M8Kq1HOHTBDp3KHXhVNQTEzfEc8bJGPHfKabYWqaFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157706; c=relaxed/simple;
	bh=dRZedsXewJ7k0dyhzhYnHamgKjexRp9Kdmjv0oGUStA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcoIZDnMA3EZSDxaXZHA8chmRL0+SPuMMsLNgjri4pazz2L7oOBnKFRDZSbeSZbHQv1NQg7kDplqDKYQuXTlzaf3MA7ebE72/nfPsH02dcxyvXv1DZ4U+XZV8f1boDR8iGP71RC/fnmaA9Nd8UEZwHpS7/UWQ6eKQ7uwwQn4h4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKIsq1Yt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFb5WlY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKIsq1Yt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFb5WlY3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAvEJB1503804
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njwMX125nYX7Y7esAb3jpSpeXBBuKrFsO53FPtwpfrk=; b=nKIsq1Ytw8tE6UbQ
	rxgaLGfpqwjy8DGVazmvj4GzP7oq4Lz7JoePkCzfJ16uoPx5TSGQ/b2gPuXOU69O
	M5CQRRknKY479QI3FXU6TOAVecZkAtsJnuqoPdzX4DYc2JerXeHheLe18/P4iM3A
	fwCJATRY0sC9QBLNbHLBvSdEX6K9qGUtGnKfLQIEu9u6z9Atl0USZiwhHox4xzhy
	Io2T2cDn8OdCKMjdvbgT80iw570HRmI1NHXLu/5HKTxRKCiUIDAqyJlTJ2jaIzEa
	htUOlkbWbeexhENDXlGSFsl8UsHCMSrnxH9ohSc/kKrZ16dEKlHMp6yaZV5r2eBr
	HmGhDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8hne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:35:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so13389121cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792157701; x=1792762501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njwMX125nYX7Y7esAb3jpSpeXBBuKrFsO53FPtwpfrk=;
        b=KFb5WlY3UjzpDXOgsWFmoNZfiXHN/fz9/C92jS27oqt4v2PF32kIUIJMx0V7D6mROd
         WmqT9rsXOcGiHe1CAIKMx2cVBbESq9SWXIfbS7MH2+TS9pwsV0n9kHjkXKEnlHDweWJ5
         mSY113bpHB7oulB3mcA/yxyH5rA61SVpd+ujlyiZTECf9geSfiTZghllB7BrMN2wjXl0
         hG7KiYijdVUaP+R1zcxSe7ksU7EWoAWCoSjv5yxTRF2mIc74Nbl4QNL7NouOsXKhU22k
         SzdSHMXQVRne3CuULk/iETGIaf00ETc4SsaNSM3e+7nZFWqRmkvEQE/jRRTGzp+NyVPr
         iwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157701; x=1792762501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njwMX125nYX7Y7esAb3jpSpeXBBuKrFsO53FPtwpfrk=;
        b=OAWHjNMw6lbQgRY91cfcWoo95wGLc4YdGbv3MWMCRplK4lwEnUuTzI/IlpgoSq9ZXO
         TfVsRmcQO2NaRwVrHIlbUEoq/s9BGeKBJd6onVH3aEDP/k1KqbAJwf53pGVA0PtGMHQK
         nT8KwJS4frXQLwWCFpt8FZIPrdaYzVXdqyD1fylU3ACyqy7mqO5j04y2cUbXiSn+glNm
         MNvYoC9FmBVc3+lIzV4ysrOxNlmiktMOulYNj3b5Q65G4MdHp7ZREPbWQOlaorn+dIkc
         UnbCM0VFOJt/+Lv9n+ZaEYxep911rWaCFQYZ/+8cuJuq701INZoBxlYRfkdyuYUIUtR0
         FvZw==
X-Forwarded-Encrypted: i=1; AKwUvBwh7usHfdoQrYFW7gtxWOwwXaDkjhPkNRs/eoUD1I4aqh3w7owM9G/6Hkf1NbxzVAudjjWB+QlXez+VAVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzMij6p3bg8HlDxmqntRd8D/Yar9WhdfusmIKs7GewYB2rbpBL
	AnV3KhTD6N0AQLL6WeJnKX52WngFwhqMDiTAxPp0NoRbZj+D3s2yOONmhVWyVwbIJSkePjlhCA8
	HQLhWGSwPeg4rTOxMljuiNjdq3u2bS5/R8299zXPPPbvSvpvMWSEmlL+vm5amPTefI3w=
X-Gm-Gg: AYBFou1CxdLy52Y1urf2r+cWWQ4kAaaIC0fTNW4OFtAVPEqhrmPloFpVsbFtNMxfzBW
	oxo067OKRRgEy+rUs4t1L/Lqlmdm5JSDRXCu4nO2yg4PDf7OHRWKMnqhMnhMHIY9xSkEYfYuxc0
	CEGWu35bRTs2nvFl0fV5T/2Kio4BTfqrmb08IwqoKIBQbs5gTacCY4zCcHgCO4cYpZKzlkVHiic
	bppitV4y/nDIWfQmUcA+1u4fDdCilZVya+rKvYsLjMe8owqQ6IVQHLjN3euU/mQyEsFN+F4qsb7
	i5ZqDW84pClrSNdbzRx/fA/Thu1PsNGTY1aTYvedMdj1RMorkH61jwnFzTtlLd3AbpgCSylMky+
	AK6JbgI9CdFLriGjgInrhiA==
X-Received: by 2002:a05:622a:1791:b0:535:162c:2e81 with SMTP id d75a77b69052e-535a014c6c7mr430286151cf.5.1792157700740;
        Fri, 16 Oct 2026 06:35:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:535:162c:2e81 with SMTP id d75a77b69052e-535a014c6c7mr430285181cf.5.1792157700035;
        Fri, 16 Oct 2026 06:35:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm73711666b.76.2026.10.16.06.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:34:59 -0700 (PDT)
Message-ID: <0e5b7d2e-e141-4ce4-a873-b65bd9ef3c4a@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] power: supply: qcom_battmgr: fix the battery current
 sign on Kaanapali
To: Joonhoe Kim <26rote@gmail.com>, sre@kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: kamal.wadhwa@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        dhruvin.rajpura@oss.qualcomm.com, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016124806.1789-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016124806.1789-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xuG0DURhcMur8EF0hVqhCqTJq_N5e0rN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfXxSYo3O08Njlz
 iPwM6PhgtuWJBLQx/LE3lrAACxo7Y3hbpqYETr06C0wp65BSqN1hMt8ujNNScrdLt/P8p/BR4xA
 hFvwhtwIRjqatv6HdBDabiMZ9nS8KIA=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad22805 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=gZfuR-GZJQvasSKj:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=DYa_1O34AAAA:8 a=pGLkceISAAAA:8 a=nbsK_V1Wq9JmJ-PpB0gA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=piCpHeHFVjWJlYWd443B:22
X-Proofpoint-ORIG-GUID: xuG0DURhcMur8EF0hVqhCqTJq_N5e0rN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX21LdIbFkBvPJ
 aagjC9sny7O6Sa2BqK+wL9jY92JK8SspvJoWlKy5l4lzO9hxSXIFNxN74jHD/BnlRByvdKzjfb3
 w6q5WEjtnMh0Z5DK80S+5jAvBCqD6tUI1GlyOUeSp5XDWu61XmyetmldMXhETnW41Xdr4nyrBjd
 X23kdAADmLClOuuArEIAwc52NVjtva5xj30ZHuwZAcRjoKH4O2BoxQTKpV9t2/MzbdjlhUE5NNV
 NvV3yr9q1UMx/dI8U3kgOEWEfhcgMH4DqyxwFYhgt1KU6PYB8xDc7KiIKgTpgnhLB5CV8ug8yNP
 rKQBlStaYBGxijSfFCRLl38pMlGfIfvY7IHS0V0N1lS2oHq0ettbc7r4jOwlRAvtvEpgfkJmrjE
 7ZO2J1MVuwfWgwv//j0xxio3cYs95yCVcCMi0/CqAMsz8x7hdkFopR67VmMo/rH28YBrlzb1brQ
 MU0mSf/Aq3gMJQSLGtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160054

On 10/16/26 2:48 PM, Joonhoe Kim wrote:
> The Kaanapali battery firmware reports the battery current with
> discharge positive: on a Lenovo Legion Tab Y700 Gen 5 current_now reads
> -9.1 A while charging and +0.57 A on battery. The power_supply ABI has
> charging positive, and upower reports such a charging battery as
> discharging.
> 
> Other firmware behind the same callback uses the ABI sign [1], so
> negate the value only for qcom,kaanapali-pmic-glink.
> 
> Fixes: 16a7c32e586e ("power: supply: qcom_battmgr: Add support for Glymur and Kaanapali")
> Link: https://lore.kernel.org/all/20260829054546.86210-1-jan.brummer@tabos.org/ [1]
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> I could only check this on one device, not on MTP or QRD firmware.
> Anjelique, could you confirm the sign there?
> 
> Both patches apply before or after my two battmgr patches still under
> review (USB_ADAP_TYPE v2 and the USB input current limit).

+Jingyi could you please check if this applies to QRD/MTP?

Konrad

> 
>  drivers/power/supply/qcom_battmgr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index a7237ba09be1..0d55458b2881 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -313,6 +313,7 @@ struct qcom_battmgr {
>  	struct pmic_glink_client *client;
>  
>  	enum qcom_battmgr_variant variant;
> +	bool current_inverted;
>  
>  	struct power_supply *ac_psy;
>  	struct power_supply *bat_psy;
> @@ -1435,6 +1436,8 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>  			break;
>  		case BATT_CURR_NOW:
>  			battmgr->status.current_now = le32_to_cpu(resp->intval.value);
> +			if (battmgr->current_inverted)
> +				battmgr->status.current_now = -battmgr->status.current_now;
>  			break;
>  		case BATT_TEMP:
>  			val = le32_to_cpu(resp->intval.value);
> @@ -1659,6 +1662,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
>  	else
>  		battmgr->variant = QCOM_BATTMGR_SM8350;
>  
> +	battmgr->current_inverted = device_is_compatible(dev->parent,
> +							 "qcom,kaanapali-pmic-glink");
> +
>  	ret = qcom_battmgr_charge_control_thresholds_init(battmgr);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret,
> 
> base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
