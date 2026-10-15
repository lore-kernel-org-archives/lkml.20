Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1104BFE88
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061248; cv=none; b=Raeq77wmS0SkGIJSwEC883/cxiFp6a7xNIQzIKpK1NzPYqnRVedCK5Gqac9KsLnIIZTAnHEtKvNWvio+1JnxOxzzT5XWjM9Ydl66ki1KnUqjwILqQAdzj+0TJ/BL7cjj8fp6ltDge7BOzumZ8OZ0vpDvDHNvQjrlIU0mHvsal8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061248; c=relaxed/simple;
	bh=/TlcWZyr7cUD7Hmg77PL4GmJr7p0uBkeFjaHBxuOZoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIoSy8LV9QgK3wfcxKvACUDZ4Qi7nO+e1phpcterT2FJcAxBTFAl81fwszIlewfF0RTIK60mVXqop/V5GKEJVrfqXrjlxH7NnKW5gUq4whKcB78EW0IIzM+vbAbCuaSn4yOTPVvGAhFNH8Ox4iLqGHFUnU8cX67ToLUmNRFdtPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYS7XCkR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPnVjWRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYS7XCkR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPnVjWRH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jhFC3510305
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80/kA9beZNU0ILkYW4k6rBi5XEHbzEFFell3QuipJow=; b=iYS7XCkRNFlgvj81
	3oom2Lg7Wt/XoDNjXFjWoBMBVzK0aBw/0zLWP8q6zqGXh/Qzpg80VuaqvxzAuXWp
	vT0Ff3CQbtLzDcvsMYKk9ei6BrsuFDEka26R33RcBApWN4b+Y0GL5fgF5ElEYuOf
	LbgMAORUWIPzwln5m0U/Lg4ahQhTNdcoazYgmzmd8oJPOERt0W42lkz3hw8sWWGg
	zrNA2NprUL5eEbeekzK1ZeXzkmcTZa8k0sPTB4uagFtV+r0YkltrcqE4eWb6FTxE
	Gz93HEdtE+89fID0JY1UjXLvYNPHnby5OKa+wCJf+u278z1jJoKI2/FbkPfHUGhB
	LpzYBg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9m8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:47:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917aacb7abcso13489006d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061245; x=1792666045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80/kA9beZNU0ILkYW4k6rBi5XEHbzEFFell3QuipJow=;
        b=GPnVjWRHJiswlKANnvFq+PG0CO1FQy8QamCb4mLboV+ro4mhF3sX9/jrBUF94r9OQi
         eAYYLzsV7xEpUjrJT21IhlDaYl5vdPYYAXeCrC5AFwrfx80eli9L0rtAxzOn/CSqiC8I
         TiwA5JogfrYqnLLPUz3/dbHFsxYtsY8yZ31WD7Unk0aPAgMdv3Jnyk7DoCnBnQ9lumac
         G0VDh2VUlVFXallVpK/oJPxpbNV4GxDk5pAGK97dnp9zIFGLVE/uRNVQOfjRu/BHXNrB
         BxqYl6wPIRvwt0wShzq/jPz95Hoj0DTwyTmOxY2J3M8t7EDS8I/vCxstKngocIjxzdWN
         TuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061245; x=1792666045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80/kA9beZNU0ILkYW4k6rBi5XEHbzEFFell3QuipJow=;
        b=Znpd00zPpXX5pS8ibv8utMUqkTP7rfhBoTzy1Bq3EsSWTpS28I1RF9TrtOWL37MzK+
         G1dtjhrkXvBt38lfbo7qI992bgLa+vZTT/ZdRIQeLMM187CHVEGBCIJFmESNVBSo43Hu
         27hSR1lwCdS9arJhHXvBfeR+Gg60YciazEo9ZcNgOfbE7sT5R7Y9af/1hf9Ir0KF1i8Q
         CIS2IpdKUBTFfJ8FtidlsaHggxO4Uu4hI1W33hPY/QGS5T7v4mL9gkBaCGT67wLhgZl2
         7XP31D2druNzGMXALqvb/XbAkV68Yp2q2wi1sw8nh5DYPTVgb1emNAG+qF9rDNABcAag
         MAhw==
X-Gm-Message-State: AFq9FYKBfVstThHA2D4AYs69ddHwmnqYtELSGj/pKNm5cgrTj4mzex07
	KMkPXA2Im+/SY+dhK38QussdKMSHUfUmZRkPr7Lq3tENQ9HdE5poQ9Zw4mNiwdQ3kW6epHDe9ne
	ZaH4z9cDruuuNnjuoGelNvNg40ANm0Bi/vPG4PY4BacwNPtdLYjBTrQqtmFLmXYp4uTQ=
X-Gm-Gg: AYBFou2udMK2z2304T9vwdfOCRbI1OWvOs3OGPhytsx2WjYHrfcesod/16MhNE84yYU
	XNglI7CtviF7DtZ7Ceuixsd+RzZpTK7btQn87GtL7jR1+1zhMrcP3PN2rmGNExx5MA2BEkHc/4R
	E6HNlm+lDsTOvXFWd6n4i/R7Tmjr7vZZHIxtZIDlntAQGZ7QyQ2oIKEHmxhhys+XkZtNV7xGqrs
	CwDMsJ9aKRpEF7UgtFbBnrwoahow7rYDI+r2ePWucR+no1AJty21Ln5zjMR4c5jWlvYVUa9yRYA
	ZmqYullTdqp9W7PmFGACambFnU/o7nXZXmpk4V0uo8Sufnt9iVEsJ8ee7zSDyo170Uyv88lfs7H
	Gc7QusmAMTfqnSheMeGoVjw==
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3142481085a.2.1792061244862;
        Thu, 15 Oct 2026 03:47:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3142476385a.2.1792061244306;
        Thu, 15 Oct 2026 03:47:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0c3sm107970166b.44.2026.10.15.03.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:47:22 -0700 (PDT)
Message-ID: <94172269-ba5b-46af-b31d-35a314bc0a68@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:47:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem
 node
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aLJTmR7aTEgE5jpLzwPCYF4hOdRkfusX
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0af3d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JgZe5hknAAAA:8 a=jVuTDJxxa8O3WlNxpk0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX7C2G+DcJlUtJ
 /XZdF8HH5pC1LPO2jMOTIb/pXzLZQn6uzmbu/WvdPyeP0mVYxUZPYJIilxORWSuVZYWWCjJ5zi8
 dlbSf87o5rolUxNeTYAITrRJ+owiq8nI6q9Mp+FL/rkBWoCWnKIGpFGFiOQ3WKjwMXRXO6VD3Eq
 hVniEv+61nK9OFef/vXSYAC+zvcLUQagE77vW6pqq5obmO1LQ7KwX4DFPCCeb9KOYQMhMcaLVpw
 OtLGBI//fTeXBsmvCe5i8is5bIf2Zga/9zddnSpGTNo9vw/lH78DapXWrQXCAd63dyvQZTf8tUu
 Hzul0FpKo1ssi3S0n14pyrgZ4UK88HZc+Ktb6d+Oe6Y3WMGcJ1fg3MEkGYii+kUr2zBwsvsHBCp
 dHqdrE+eOHA13Pk5iCInYeguboG/atEQ0IwD0GDtR/JSPkFwKUcBL1QOFlmA9fzxmxJ87K4GI29
 7xZfu/bgSv5J0RPfzSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX0fF2SfyPMN7R
 JpcOG2g8uGLR0bdqjxMj+gYT7iJrqMYOA8mCrrLF7KL7prKHdR9vNSc9A0DL8Ic7N6h28bnNk17
 ETnwIZgSmDmK+wfEvsmLyLk/tjZ4XK4=
X-Proofpoint-GUID: aLJTmR7aTEgE5jpLzwPCYF4hOdRkfusX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Adds the qcom,rmtfs-mem node required for the modem
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 79aa2521aed40..0ef3e9e239786 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,7 @@
>   */
>  /dts-v1/;
>  
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -54,6 +55,22 @@ touch_en_vreg: touch-en-regulator {
>  
>  		vin-supply = <&pm6350_l6>;
>  	};
> +
> +	reserved-memory {
> +		/*
> +		 * The rmtfs memory region in downstream is 'dynamically allocated'
> +		 * but given the same address every time. Hard code it as this address is
> +		 * where the modem firmware expects it to be.
> +		 */

This is the case on all Qualcomm devices, you can drop this comment

Konrad
