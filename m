Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE00495028
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988568; cv=none; b=MYIrRvVg0YVByPCaIkAJU/5NoBAxI1LAuLYZwXh3Zk5BQV7Fnxm8lTUoi0lBEmYCk0NFI0KbzO/70ku6nw+/GOru/B8PCHeay+fcp8nvkxlvRA/rnrR7DLLfq1xskpOMDw/y5uJOq9ADEMx8ENcPuHfZXUGFF0K/Efst4C5fR2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988568; c=relaxed/simple;
	bh=vlkxXW/qwDDLMWmx5HyWZ1mVXU9auxRCAbXXUDGSvYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwtZuqGpfSSnnh/7wXf8zMoXOMKR3Y7fRshAu13D3Sen65+ZRi4ByJ4kBhfV/vZ67Y4Myn81QXW/yD5TNoCoNnxLwc5BEbhUBuuLD1s3EBgNdZ2fN3dbia7Q1vbqaofQHXGRe06DFV9S3zNLBsSiY4tBeGucdsj6GAtldjkIW7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FV4pKmqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUOKYsOY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FV4pKmqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUOKYsOY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe1Fr3819174
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhxdGMSK2hUgq50ogbZMAdAqGDY7N/0SjhEg7XlRwBA=; b=FV4pKmqYfTBQ4LZx
	l5b784poLgcmcnlLgOzEFsncqPRNcABtEKInDnaNwzN/N5lCbkh94GYGXeDbbRE1
	bVz0cLXcAHXjQHlaISevTt7A28SaQgoRf0cRVX6kmSgnN/H4SAh3eq35JL9OULIo
	9Slvlm/Arx2TeOrtvjqibJ36m6IXrOFiyrwUcK6vfJEVuq8OopRMVav7I8KmCDew
	vnzHO0LVczDmpbIJIGNM0XCNiBHMRhH4XrFcLajeHKxCz0TLDKHedUR7sua392dC
	4Ha+mgaIr/QJlzkWYvWpv+9+6byvpECx8vDDzY2Fg+ZfhknjGwag6UZImcvRF2r7
	LWKGfA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79aaef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:02:40 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-451b3cca625so1127732fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988560; x=1790593360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhxdGMSK2hUgq50ogbZMAdAqGDY7N/0SjhEg7XlRwBA=;
        b=UUOKYsOYZ/RTokwRGgsFfWnq4r/isyHY7SmdM7/+NamBLKMUAa060O0aZ27U3NGlsH
         yeyL6u8Vb0gILacjU1o+tQ+kifXzJOqXjRWSDr8YT4Oqvo6BKrcTToMvPE+Y8iBHz8b/
         F/xrkH73v24s6e2G7Gx8RS9QDTRp4IM813XObZ1lZwtCr+Ed7vUk9ASqVpSirCXfzaVZ
         Iya519R73cinuCdGYjS+jmyy0Oo68rcfoqRptQa56xGpeqVGCUKmnhlgpN1701ndfjpu
         mVssRjCWJRLA9A8VlR2YEs5kFhF/3Ov+3GDtiwowHYKKQMDhyK99c0/1bn1X04E2uH7L
         ZyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988560; x=1790593360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhxdGMSK2hUgq50ogbZMAdAqGDY7N/0SjhEg7XlRwBA=;
        b=aPkX0jLg76L4Hy4OPTkblkKYmGrPzL23Cn6B/2egMDEsLEAnwC5dthtivT8wcLtUjq
         xaQoc8T9smpH67TM32Iha8S3jcbFLb4jCZYpBEEZ7o3EYCEuoc9M/ggwd3UCz6itDenc
         aQZYOjUBjIAF9VGDPN/mSqtPBEAM2PvtDlu1yAJrn9p9Un1u1xIkLVULJQscSFso7ivK
         +57mhmxrMOIHYvVm6tOfWgC1B+XpcbaSv4jTo1zqhRirnDl0jcZJ3hvLt153VCWRpifF
         ah/zoEInzTKRSY1QA08F8LVkZbfmvPNnrIL/QpzvlH6iKfVLHCg66xZuSSSP+S7dvGYL
         ro0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeXCIltg1+UQNk73Lvg+0QciTHSuU2pjwngBZMgFJhuWjnMwoKOLvRzGV25ZpAqfyTTyxio9J/KN9gvLY=@vger.kernel.org
X-Gm-Message-State: AFuF++nr2fdLof5ZX5PPO5YB5SEOENPos4100RfN2rAwvxRYAIxYiVYB
	U0Y+04+Mn2f7zmcdW77C1wYM3SNoI9wOzHZV52T5cq/qPGuzy/AysURzcFOUYMdaZNUb/PHn2F2
	i4ct0kN3aePVb7Npvx2uHkjqZotbe8FXp6OjJoQo+aEVN+9vkwYR8fjUEK0sn3Ce6HdU=
X-Gm-Gg: AYBFou1/VsxqEmt0AerlUrEeuC0e2tmxJzGPh2dLZy7wktjfGWQebv34rQUpQZuDSdn
	GMHmZuvIbhoWCwuq5fvrDnv1TCVA3orqzJjiznPMEnwVkv4MgSfomJRTLxbJbQ7DZDfZpwVbSdu
	yJgh3FKj9HBnYvcBkWKynsZ4eQaMmWE9g0tq3JhYOdf5bwAcPxrxz1MX+JVOedTDR9sonK0/fA3
	HVw9nfvFDD60sGTG02ll8PtiCdVb2Ip/ShAe+/Yo6/Q5u3/GWIHqU7Amlu5z3ImvL7KUVy7iRca
	uabUmfLvZ3UZ+7BXevtPilFUg0jSTZyzTnvC+SDgH74S4mCAju9X59OGDkDXGgdDRPuhDEcyYYv
	sbcTfLeY2MxvII/6uR2tm5w==
X-Received: by 2002:a05:6820:4d52:20b0:6c6:92e0:2d9d with SMTP id 006d021491bc7-6cb2da01de5mr6777775eaf.1.1789988560019;
        Mon, 21 Sep 2026 04:02:40 -0700 (PDT)
X-Received: by 2002:a05:6820:4d52:20b0:6c6:92e0:2d9d with SMTP id 006d021491bc7-6cb2da01de5mr6777742eaf.1.1789988559558;
        Mon, 21 Sep 2026 04:02:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701bb8sm284496966b.28.2026.09.21.04.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:02:38 -0700 (PDT)
Message-ID: <ad57e0f2-87fb-4259-b55f-a8b259b337b4@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:02:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: add missing pwm3 function on
 gpio13
To: Gilberto Conde <gilbertorconde@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921093419.2870168-1-gilbertorconde@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921093419.2870168-1-gilbertorconde@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab10ed0 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-AmX6xWfTBpQRwCXi9cA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1OSBTYWx0ZWRfXzRlK8mHYGe1c
 rGWMia/8/57LxlPqzymVcc9802IHOuWlzsTvMs/yi7nQSiwNvtxb+Tnesxj+JpICiipCB4ytNhl
 Kc9HOMyFQ8PGDnQh++cZtAToAnyn1k4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1OSBTYWx0ZWRfX8OtUTGDmIoYt
 O7feizwNkQclvk9rodDp43EMleXXw82lH0/V1Bi0LqBgQfpe7jEGZakAzrAXpX9wE7CLP1YqN2B
 027Xq0obADi0gzcroTGYr8wGcA/2piw6/STD8UuC3Twyml7PsgRfHdV3Meqt5w1+plThISEotUY
 SyNmsBG2O9ySvGLGH8T6fh2gFnxfrI8vTJtxgvpWm6a73zts9ovZfuRLZlrk4nHnWazhpQJBUnH
 MvCPsGiHA68rD0FqxgLTJibQ2yXxfxtuYJSFtUSW31niFEfAOnfKs/ZgCbtB5zlL1ZeAUPHrNX6
 1yJBOurYAQyqbHx8n86kEFkPzR2/k+ze0HA4H6LMFXmaSfuSxmo5FL6ZMJX0vjaocchUjyHjd3Z
 cmhASnIS7+SwZ8HGGLMx7BSIYoFlvM8ReTj+FWMnQtqM9n0Ga7gvBHDyDhZmiGdGhDf68YZ1Jdo
 /RNj4J8P4Nic82xUlcw==
X-Proofpoint-ORIG-GUID: TGIXrzymQzdaXr_o8DAQgy8X-jeplsAe
X-Proofpoint-GUID: TGIXrzymQzdaXr_o8DAQgy8X-jeplsAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210159

On 9/21/26 11:34 AM, Gilberto Conde wrote:
> GPIO13 supports the PWM3 function at mux select value 4, but the
> pingroup table leaves that slot empty and gpio13 is not listed in
> pwm3_groups. Selecting pwm3 on gpio13 is therefore rejected by the
> pinmux core:
> 
>   ipq5018-tlmm: invalid group "gpio13" for function "pwm3"
> 
> The GL.iNet GL-X2000 drives its fan from PWM3 on this pin, and the
> vendor firmware muxes it with select value 4:
> 
>   gpio13 : out low  func4 8mA no pull
> 
> Add pwm3 to the fourth function slot of gpio13 and list gpio13 in
> pwm3_groups. With this the pin muxes as expected:
> 
>   pin 13 (GPIO_13): device 1941010.pwm function pwm3 group gpio13
> 
> Fixes: 725d1c891658 ("pinctrl: qcom: Add IPQ5018 pinctrl driver")
> Signed-off-by: Gilberto Conde <gilbertorconde@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq5018.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> index 03cfba9534f..84392fe258c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> @@ -563,7 +563,7 @@ static const char * const qdss_cti_trig_out_b1_groups[] = {
>  };
>  
>  static const char * const pwm3_groups[] = {
> -	"gpio45",
> +	"gpio45", "gpio13",

nit: usually these are sorted but I don't think it matters..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
>  };
>  
>  static const char * const qdss_cti_trig_in_b1_groups[] = {
> @@ -689,7 +689,7 @@ static const struct msm_pingroup ipq5018_groups[] = {
>  	PINGROUP(10, blsp0_spi, blsp1_uart0, led0, gcc_plltest, qdss_tracedata_a, _, _, _, _),
>  	PINGROUP(11, blsp0_spi, blsp1_uart0, _, gcc_tlmm, qdss_tracedata_a, _, _, _, _),
>  	PINGROUP(12, blsp0_spi, blsp0_i2c, blsp1_uart0, _, gcc_plltest, qdss_tracedata_a, _, _, _),
> -	PINGROUP(13, blsp0_spi, blsp0_i2c, blsp1_uart0, _, qdss_tracedata_a, _, _, _, _),
> +	PINGROUP(13, blsp0_spi, blsp0_i2c, blsp1_uart0, pwm3, qdss_tracedata_a, _, _, _, _),
>  	PINGROUP(14, pcie0_clk, _, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
>  	PINGROUP(15, _, _, cri_trng1, qdss_tracedata_a, _, _, _, _, _),
>  	PINGROUP(16, pcie0_wake, _, _, cri_trng, qdss_tracedata_a, _, _, _, _),
