Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C67639A07B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665898; cv=none; b=Gl4SsjQsxEC/l9QTx0mgCw8xZiXXhCOrPO02iQnQmb/1sKftcBhGj5+LFFpKTdigjBUPeuILWA/sXKcp/69D3I6Yt6rQo06AOtPFoCReN3td10/7BvvMqWII5E6F++9CEJ9/20tK06CUlbcN67sz4xxRhF8jkf7XPaFO3Fy8UrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665898; c=relaxed/simple;
	bh=oz5CN5RjjP95+hn3KIVzqIGYCeN2q+QJdx0EvADSitg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhAFNzahfK5+29XOcqXCak9DCSzskXc6Qw2lT6jl9Fx7IZB69dsZlK3Y4FQRSq9KKoeGEx+zKGDR8iH3PksbdWylUAV2cdD9Kv7X3USNsDtBgUejVOL4ZkY3CD8kkFWVCsYH8kxeum25Ga6YrilbfGUw5hITB3OAtQuxH4qfZig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pdxl5tYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daOMATY8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pdxl5tYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daOMATY8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T470cq419560
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DGbSxQ+ordORojocaH0U5BkUwxizVp+6KhwnNAplOmM=; b=Pdxl5tYhEsfAnRXT
	gev0v8DJT0KstEryTCVz3088i/nuuCAK1oRYjZilhwr4Age9XdTRoj8FMAqv1QbN
	mhjZXBZ9DXbDjS6qDfqHdzOSKjYvO++wHZ2odV6sWLLaa3M07Libo7ldgLBeq9U1
	/oIMNwFH5JZahpWHTA+uMzjXJVJ1SslEC719LpjkiHQdJDmec9XCWs0QmLDycbzc
	NReNLfiAt+tkCeIsmJ+9+aEUpRaQ6VD81Pdn0nUkcWzWeCZj2g+NpY3CDdu9ADq2
	R67FXj09Q1aG1SIdpDhH5VmnpXRH2rGpF/WWRmANT709B88sXCu5zkJpxeFLUw9g
	UiP3pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmua5wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:11:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so708655685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665895; x=1791270695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGbSxQ+ordORojocaH0U5BkUwxizVp+6KhwnNAplOmM=;
        b=daOMATY8OkyKLQzQ2Q0wFt+/ButrCKfGKvSHs4yWDwon+qkK20T7dTuqpUj5dHHzDz
         KeU6ssolw6w/q/htfLQkQAXxpUbE+Z61VW+LecdGeqi5f5Wac5n/5kZ0n87JoX/XmhlW
         RZPd5QbbEHjk/1DV+Z3raa9ZQ96Z2k+gutd15endBpyXr5Cb6Y/JnaTPXAxe+o8ADWUJ
         sJE7KzlsIhOl+dYh6leHpWqGyu5Wys74KSNez7rVQXVB2ZVMoXAo4FIyVFATj/C9P38v
         pjDtpQeCbOP32dAPYkN82LmUt8DuyuhF5CS2BBlXJYK8KTePrwoNIJirYP4zgc0Rd8vi
         s+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665895; x=1791270695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGbSxQ+ordORojocaH0U5BkUwxizVp+6KhwnNAplOmM=;
        b=Jh7sAzlRrohsq5MV8yRpDZDlu/SDATtX5BOUGY4v8x4DtKRT47Go+HP5rTnEqr4DMt
         sLzMMepbN7yPftb22Tp5Zgz3EoI8HMjZKYKYwTpRyv4wRA8Qfhr7LKm7ZEFv2j7OnjiC
         q3JD5qPWbqj/JS8YisgHnLWVkfg5iE9nA05QZPR6FrmGYe/ZHU/FauMBuCkOTS+8yp6q
         JhNWDnkaRnrSfqq/oCV5bapcbHc1jA6lTrxVAvL03ZM9E+kOLHqilLQO0Y6RP1K6ynpL
         bK2hDFriE4wiHCjWqGS/NkdUvuQqcZhup1RghqNwF9pnZ+HoNBzCoJLBCeysPx4jPMkt
         fR3A==
X-Forwarded-Encrypted: i=1; AKwUvBzYOv3IyfjZpQh61mgVEZv5OpnVRrzrP6DeeM5lbOe0DhPtuPrQATSLsZmQvw2lO5FghQIUqboPgjrvotA=@vger.kernel.org
X-Gm-Message-State: AFuF++nnWZozwA8sEVEES6IpRytLCvZnSR0hafFNz8o8ETlJTjD8s8my
	KB8TG7Y1abrDmwnJ0LArwE83/g/u4TlPMrdD3QphmAPcSsJtti8amRCfwnqyM5bRPcRpAO2L83m
	BiMoZxjvCenP1vgbsBO5zT2jmxzemig0bXlhXS39y2psaGW0MFCvpoTxeDT6YDHIBNh7dVwY1Q1
	I=
X-Gm-Gg: AYBFou1RZn7ZzZ1mUvrYnRk6Se1UignOVe40uEtMAN1qOAptikDh9Db34q2suiguZiK
	fEI92eSLtcY1WYUQcbiF2gZxVl0f2qms37V38eABQohdEZRG0TgpxQA3T9kPDMiuB7ehY0SjX+H
	x5YtPzANEKNIfrJhC4MvqRQnM5wTRRM2/5Pf6LzbBCfNMpnO7SLNBH74iPds4i5XHTGz7C8pHof
	t673b/segzSEBZXoge+gNlvCsC+58EdylEMX2cWIr3HAY76TQLfqKP7FJr0akB6br1plqMzym3z
	5WHoZzEXLq8tqyv0FI+/eGGCOZKTlhe/YgfZ6mPZtgqnTaVbdZ7I2DXVGZl+ocE1Z6mSeRCJtaa
	+pJkKq2i793oATAgSXouXP7/XLsjX9+43sJgzC87cxid3QebE7MZi+hJ9fIGvnA==
X-Received: by 2002:a05:620a:c41:b0:939:4b31:4669 with SMTP id af79cd13be357-93c43c1ea79mr2442107685a.29.1790665894712;
        Tue, 29 Sep 2026 00:11:34 -0700 (PDT)
X-Received: by 2002:a05:620a:c41:b0:939:4b31:4669 with SMTP id af79cd13be357-93c43c1ea79mr2442101785a.29.1790665894123;
        Tue, 29 Sep 2026 00:11:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af506fdc1sm1730213f8f.21.2026.09.29.00.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 00:11:33 -0700 (PDT)
Message-ID: <4de27200-3598-47b7-b0af-8f7acd037618@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 09:11:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] thermal: qcom: tsens: Add support for MSM8952
 tsens
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-16-b96fd3fe298b@mainlining.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260921-msm8952-initial-support-v3-16-b96fd3fe298b@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfX343jAfKyO4xY
 LT1pbgC7wTqIYkpePbOIvHPsv7xYCPj+FdW8PXJkkYeILyjk26qJumrAE9NCBbFZir6HmMr5pOF
 igmdg7Hlw0LdqRHVdeLBx4ld0v4eUIOpQBNhLJ6COxBn3wxM5Z9mQZwvxSLqpbs3BgO3r5T9i5y
 xa2xtoOYbkK0MlJfn0DRxl5YdjqGCB/bU5V6IiHuMr2Pl5jifBDhrB+9X3nvH74Qt5SP7W2bUL0
 KWM/oHFl8CIGLtVRjXa9ckHvaPkWPm4xAy63+jTEbOgaUHp5fIdyoRgywnAFQQvS5OLPez64IB2
 LE3kjiKBjvlimOeYKEFc4opnO9P9R9VpIWy1Ya3uNNkRehPVBUfqbJajgOsmBYrnk2A2VHfwJnW
 BzlqAAlFhRgup2As6ETRNLwpLLWmG2I99YFu4n4IIAYz3Wv+4TUg2bQIv+O9cMpl7uo6wcn9z15
 odoeau07O5q2OPrYN0w==
X-Proofpoint-GUID: uFaq1hJSXKtfxxYQvxjdJ6HVXbrckEf4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfXziY5TH0T0qJX
 88NRFkBwPGH1WiXH2pBw92yi2lzlTqb6AxJnYlftwu9kPAJazCJleNKqum4Q3I+60nPH4BDcOOJ
 jTMZvzfoT7vMfu0ySF4IWpDBM2myDt0=
X-Proofpoint-ORIG-GUID: uFaq1hJSXKtfxxYQvxjdJ6HVXbrckEf4
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb64a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Oh2cFVv5AAAA:8
 a=OuZLqq7tAAAA:8 a=uWCFXIfD3x_FUo0uTIQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=7KeoIwV6GZqOttXkcoxL:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290028

On 9/21/26 20:19, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add MSM8952 support for tsens.
> 
> Downstream does a lot of advanced things with calculations.
> But seems like using tsens-v1 directly works too.

Can you elaborate a bit the changelog please ?

Thanks


> Link: https://android.googlesource.com/kernel/msm.git/+/refs/tags/android-wear-7.0.0_r0.3/drivers/thermal/msm-tsens.c#1621
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
>   drivers/thermal/qcom/tsens-v1.c | 44 +++++++++++++++++++++++++++++++++++++++++
>   drivers/thermal/qcom/tsens.c    |  3 +++
>   drivers/thermal/qcom/tsens.h    |  2 +-
>   3 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index faa5d00788ca..f4201748ea29 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -145,6 +145,37 @@ static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
>   	[TRDY] = REG_FIELD(TM_TRDY_OFF, 0, 0),
>   };
>   
> +static int __init init_8952(struct tsens_priv *priv)
> +{
> +	for (int i = 0; i < priv->num_sensors; ++i)
> +		priv->sensor[i].slope = 3200;
> +
> +	priv->sensor[0].p1_calib_offset = 2;
> +	priv->sensor[0].p2_calib_offset = -1;
> +	priv->sensor[1].p1_calib_offset = -4;
> +	priv->sensor[1].p2_calib_offset = -4;
> +	priv->sensor[2].p1_calib_offset = 4;
> +	priv->sensor[2].p2_calib_offset = 5;
> +	priv->sensor[3].p1_calib_offset = 1;
> +	priv->sensor[3].p2_calib_offset = 1;
> +	priv->sensor[4].p1_calib_offset = 2;
> +	priv->sensor[4].p2_calib_offset = 3;
> +	priv->sensor[5].p1_calib_offset = -1;
> +	priv->sensor[5].p2_calib_offset = -1;
> +	priv->sensor[6].p1_calib_offset = 0;
> +	priv->sensor[6].p2_calib_offset = -1;
> +	priv->sensor[7].p1_calib_offset = 3;
> +	priv->sensor[7].p2_calib_offset = 4;
> +	priv->sensor[8].p1_calib_offset = 2;
> +	priv->sensor[8].p2_calib_offset = 4;
> +	priv->sensor[9].p1_calib_offset = 0;
> +	priv->sensor[9].p2_calib_offset = 0;
> +	priv->sensor[10].p1_calib_offset = -3;
> +	priv->sensor[10].p2_calib_offset = -2;
> +
> +	return init_common(priv);
> +}
> +
>   static int __init init_8956(struct tsens_priv *priv) {
>   	priv->sensor[0].slope = 3313;
>   	priv->sensor[1].slope = 3275;
> @@ -223,6 +254,19 @@ struct tsens_plat_data data_8937 = {
>   	.fields		= tsens_v1_regfields,
>   };
>   
> +static const struct tsens_ops ops_8952 = {
> +	.init		= init_8952,
> +	.calibrate	= tsens_calibrate_common,
> +	.get_temp	= get_temp_tsens_valid,
> +};
> +
> +struct tsens_plat_data data_8952 = {
> +	.num_sensors	= 11,
> +	.ops		= &ops_8952,
> +	.feat		= &tsens_v1_feat,
> +	.fields		= tsens_v1_regfields,
> +};
> +
>   static const struct tsens_ops ops_8956 = {
>   	.init		= init_8956,
>   	.calibrate	= tsens_calibrate_common,
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index b5ec70201e2f..4d7013fc79d6 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -1191,6 +1191,9 @@ static const struct of_device_id tsens_table[] = {
>   	}, {
>   		.compatible = "qcom,msm8939-tsens",
>   		.data = &data_8939,
> +	}, {
> +		.compatible = "qcom,msm8952-tsens",
> +		.data = &data_8952,
>   	}, {
>   		.compatible = "qcom,msm8956-tsens",
>   		.data = &data_8956,
> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index e8376accdff3..a35b15312961 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -669,7 +669,7 @@ extern struct tsens_plat_data data_8960;
>   extern struct tsens_plat_data data_8226, data_8909, data_8916, data_8939, data_8974, data_9607;
>   
>   /* TSENS v1 targets */
> -extern struct tsens_plat_data data_tsens_v1, data_8937, data_8976, data_8956;
> +extern struct tsens_plat_data data_tsens_v1, data_8937, data_8952, data_8976, data_8956;
>   
>   /* TSENS v1 with no RPM targets */
>   extern const struct tsens_plat_data data_ipq5018;
> 

