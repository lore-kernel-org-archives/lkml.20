Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839E5471262
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256465; cv=none; b=p0dwzXdHNrgrO6sjRvqPa1ljrFvYqMkJCOndR/38XBheqGhl0LUcaaqddJ134g0ci1Bkgi1DTWzKXU44nKK036VuvVoxuJy4+E/wizQkLVhsS0W6Gix6AJv8TAMyiYo4+w4tNHtSJ5afJTmPZDsQA5f5tX13hOw3nujgeI/g11Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256465; c=relaxed/simple;
	bh=4afiGkcNEeX8WmPB9DJBvWqvGi65/MUDjG1PvDWjfHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3L1ecTPIcO10MzSgZW5kLJulP819xMjaJSSFjaOWdtfl8r6CDNJZ6r7pDHcKxNoCwWAbkkQcGKy7GklZ6vFJLmdpbrFc/LaShlbimbaNQ13+EeqExZrAG346uMjfiEwGokDtGRgdAhNCMDMQ9fmja/oftKzil9Ro+Ed6jahC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJfeO3cE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I22aSru4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJfeO3cE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I22aSru4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681792Pk705447
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UPDyURVG0qLypFDxekoTlpl+By1uFOwQ76rrcLT+Bs=; b=nJfeO3cEXlUVIPo0
	Jy+RmnXZsLvVBfCvabNofn2k3E3Pq8bkzJNvFBzeJ9pjhrrIcZnyPL3SXqc40UqX
	9d50f8REiLc/zmV3xwrYCgiE9Rmvl75Ahtrky6OaqVObCwbqaT0y6B/uG8Ti1nFA
	k+BioNg/xmir0clteotYFL9wQl4FFwOdBggZqS917IDM6bfQ97WxauGSpYNKF7Um
	E9HOzXMyjaT8jkC4jRzYqEhW0FLa1vLOw/owjWkRbP4zvv3RzoEZOhxvU9q0bi+8
	hLhbl/5azFA4ocsAXmR07LZtTbR2yAQzDJn6iT2GttB+T4r4VOvc8pd8N9LvMXEh
	PpaicQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsh6am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:54:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso115367785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256463; x=1788861263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UPDyURVG0qLypFDxekoTlpl+By1uFOwQ76rrcLT+Bs=;
        b=I22aSru4Iar/dRHVNQ7BWmOW9B+EZmVj0FUmdVwgXToiIavJOBWSK6cL9VSu5rKfRJ
         d2BI1UqxVDd+l9f9DeWtRCVsVv7WP3LSBRbOrqqHhNkf0Pohs539Pj5YByLkm9R4islj
         kYraWqwdpq9EO8cQmNz5gbS1/EVCDUOkDbWkXazRU41J43RRETBB9DwUALfx0HDFqhaH
         c528mtHoYuTupMj9gG0CabdDDNI8epIpwNKRbVw99+MWj7PYA5hOJiCOuXt34dIIwHd0
         hIvmfwufX2sJS/QP5k50sQhdRc6a7GC0Ur9cHdvzFjt5Q5Gp69OEhLf2KQ5Rvqr9o53p
         HOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256463; x=1788861263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UPDyURVG0qLypFDxekoTlpl+By1uFOwQ76rrcLT+Bs=;
        b=dYVKPmByDn1e+k5Evxs7ngpYAUXWrFmQa/wN2xblQZSClgXaJ5uYtYJwYwcLWAVLhX
         QLuavt2eh6zUxsY4bE+5olalcQ8+9zetZJeZ4YHJ9nsEyWG+quax98ck/zacZ9Eh1HPH
         Xo1hP/R+psSqBz2Nl8WX6QYG8R1NwbScSf2lL8wlywl/jmrSGhrPaGQjJBefsQmUnK+i
         q3mKPUyhlKff/L8tZzcjQjY4NU475ut28Ti9rlozkQQ/LP7fpg1kIqCCBKhEi9V/b3Z8
         ARgVYcbsgAdxFVikHCKWOOrdN4RV/QgIZN8+xRp4Q+sK/yZCVdafsRGzr18kZma+kBsO
         ersA==
X-Forwarded-Encrypted: i=1; AHgh+Rqm5FGE8bj0kOmpBj08WF/7Xd+72ISphN6H5mU8YbpZyBosw0HTo02D08ptydkTH5TT6DiPDOFRa4kEQTE=@vger.kernel.org
X-Gm-Message-State: AFuF++liwQNiuHiqC5ijhFCBPjD/wHDqi7YqClwFpRAHhxxn1ECPet4q
	88swG/kESDkhfoI5YpPwxi4/fSacpZzZqexyVIsq0HXGBymMQksA0rHrczYF4auTQo2+MvwpQ5J
	gJPzZC2YnOkQT5dkiIR+dl7L4O9RGyvr3FcEZetwSOkuebzGKDj8ysC/3gYk4lwbz9vA=
X-Gm-Gg: AR+sD10uzxA0TsSkUCu0MSTUQfOPsTjiLOHCKLpT92EpNBjJvfHelQKvG6Iqdjw+SBj
	/PhVP3vEz2afs4ATTPlxeuGDGmz+8oBgQULE5vvg3Bcng2PS9yAU7QrtWn6lxwz+UeRNrkPzzmN
	OUuPRcN+XFGyexQO4QMnj15WJvvSEccamgWX0n7u/Tm5q7EkYY+nZcD3x0AQUcfnyy/zYHX0qq4
	c7yJemrp/yMsjw9aiY9+gjY/el9bWNAyKVWLzxpI4Z5zpJAiEmp4LOYoqiOy6xXN706aSQYcAG+
	lyAZQjSNQFghC824q8+Lg60Z8KwNrKaC1R2PW1GVTzY1v95OF753zzCTly5vntlipHMY3flyQmi
	qp3OVwKrzjZeGpZa1jfoGEg==
X-Received: by 2002:a05:620a:280b:b0:939:2884:e11 with SMTP id af79cd13be357-9392884109cmr1442796985a.5.1788256462412;
        Tue, 01 Sep 2026 02:54:22 -0700 (PDT)
X-Received: by 2002:a05:620a:280b:b0:939:2884:e11 with SMTP id af79cd13be357-9392884109cmr1442793985a.5.1788256461852;
        Tue, 01 Sep 2026 02:54:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1facbcsm546460666b.44.2026.09.01.02.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:54:21 -0700 (PDT)
Message-ID: <f6f632b9-cc2a-4966-a43b-c474a05da7ca@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:54:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] phy: qcom: ipq4019-usb: Propagate reset operation
 failures
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260828091857.8581-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828091857.8581-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX+r40Y38izqNC
 c1HQVu5preZZheOhW98bWC9EM4C1tCBOdkUdC/Sw4XKANiTIaf1muzjsxBhhwfq9RUJZYzeVuU2
 2zoQcpjiU5Ikcu/XY3SHk8aWGwdIPMc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX7T02ROpwqR38
 MAavzYq/jw+fgd3ir5l9cVT9n2UFc8elLWLFi3JwSAhnQb5YGu7zBq4yQiAwzOHyoCrKxN3frGg
 qaJJ+hBTsXPtGRkMFbLB+8BfUJDSgG1+Txbm0Zwsw74J9NvJNGabedlgHY9iNhIL1Wln3T89sCR
 jPfCgUPRc6qghCV7Jv7j8ez24nx7oVN0djtcV00afbP6CraqC4NxF/rBfWW+NksXoJ0RFARi3QR
 3MQObj4HEA37KVdRpF7YZOZHzr9j9xxPt861jmudh2aU3v8KMes3tVRF10d5NwCQDnxo40bHIOM
 JbvdmeV6MxXfY3l/8HAfl/VwIGPFCoWQF4BwNScGrkfVJJbjhNNcxsGN7dDH0gARlugAt4ZwzKI
 v6usvIspan/oNGJtjy+Klf2smJaGEvP4hUMB2bVIDuFDwqxgPIGVTY7gUH42hFWBLtnDlmzG1Ks
 6Ca9AE2Y6CbyEGvBCsw==
X-Proofpoint-GUID: UknUR-H_WZdjFw8f4SAKqwDT_0nLyx0O
X-Proofpoint-ORIG-GUID: UknUR-H_WZdjFw8f4SAKqwDT_0nLyx0O
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96a0cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YGK_NnCJ5jihIqQlHZYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087

On 8/28/26 11:18 AM, Pengpeng Hou wrote:
> The IPQ4019 USB PHY power operations ignore reset assertion and
> deassertion failures.  Their callers can therefore publish a PHY power
> transition after the reset controller rejected part of it.
> 
> Propagate each reset error and restore the reset that was changed
> earlier in the same HS transition where possible.  This is an RFC
> because a failed reset operation can leave hardware state uncertain;
> feedback is requested on whether the proposed best-effort rollback
> matches these PHYs.

[...]

> 
> The issue was identified via static analysis and manually reviewed.
> 
> Assisted-by: LLM
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 46 ++++++++++++++++-----
>  1 file changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> index da6f290af722..8c1834cd6a8e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> @@ -30,7 +30,12 @@ static int ipq4019_ss_phy_power_off(struct phy *_phy)
>  {
>  	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
>  
> -	reset_control_assert(phy->por_rst);
> +	int ret;

Please don't leave the blank lines above 'int ret'

[...]

> @@ -69,14 +86,23 @@ static int ipq4019_hs_phy_power_on(struct phy *_phy)
>  {
>  	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
>  
> -	ipq4019_hs_phy_power_off(_phy);
> +	int ret;
> +
> +	ret = ipq4019_hs_phy_power_off(_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(phy->srif_rst);
> +	if (ret)
> +		return ret;
>  
> -	reset_control_deassert(phy->srif_rst);
>  	msleep(10);
>  
> -	reset_control_deassert(phy->por_rst);
> +	ret = reset_control_deassert(phy->por_rst);
> +	if (ret)
> +		reset_control_assert(phy->srif_rst);

This return value is silently ignored

Konrad
