Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187734;
	b=unhlNHDAzn6sadO4Oi9svTPCeLKQTXXIkiiU4okvrr1k4w1yIXan3EuQXBzjumBoKKr0
	 EQkJaTDRUTFzm0OHwzKELak0qwNpBmBrZ7sC+ntdJMZ070aMZ0PLEjPT1Uq9/RWRVIpFO
	 OQE+aC27o0ZqREJ29GopMy/Yku4ilBM1qleGSXG4gUOMB6M7ZNfDu6JOV5p90fQhTrkT9
	 +be/B3pn20SqZpkn2dzParES8jeq8tset8WsI5OWGYYV5UJfRnc/sX7PdEjFWFdpvDR+T
	 TFP7xQDr8JmuKn/K1Glns/8rWR4hgG06mZRIglAxcsT+3PGNq0L3UEFVV4bq/vc0mUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187734;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G1vqXWzE+0WPp+dRQIYusXTpkNgynB9O9I7bhcdFXY4=;
	b=wmhmuLyHCUV5Vj+wInjRH9vWd0R1i9Nrwm97zI/+93B/zdSEcnNWnR+dB7Z+2FjxYE33
	 z0T8N1wdnwdwisnTpEoTvMvgQyLC1NXgN3LLwBFDN++mfGDe64lR3A3d0NReC/jzSo6u+
	 I2cRD8zGmM5DasI1TjNTOZ4iTCofy7a17qkI6AwRzIQ1M67A5lS+w9NJIPsgnh3ZB5Sh0
	 VvHhLijgZs7BBpNe54tvzG0Ux1aBD9OIW5raPPMtA6GRHdfi1JAo1Ql1NUH4UrqkLrn9A
	 kwq7niIO6T7HOm5acoVl2rHluj0lbPVJLQ4w4iiqVoi7KW9fLYvN18QRlKuVhQJ0v+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ackz3tAf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XikGNDfv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CBF606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CBF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ackz3tAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XikGNDfv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H3Xo2359895
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 01:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1vqXWzE+0WPp+dRQIYusXTpkNgynB9O9I7bhcdFXY4=; b=ackz3tAfiM4/zl87
	Ld39IzD1AEbuHDgxufhcnw5RwBF3Pg+jB5yWwfsXb84NTi2ocAyIk0DUX8NPcPIu
	APsg+ms/uoswnDvy321Hq0xgxGR/jQSxWd7XrI6JbLrgNqZO7WqdUKUxgXtuSLus
	HSjMSqFjy8S+DpFV4zuJUV+hz0fS8awXt4sUZotS/Icgpfl+teG7mqJVTjHPur/y
	YQ4387WrpIz23vZNFv/fb4WSWhfe/7cyDG/lCIDh1CS4nIKj9J0DQ38MGnNlIJ9f
	Yf9AUm5btNDcEkS4KVqteQyVWHn0Xed6e5xtUowVVU/d+QYPcRWHVU9lnaMGa3AM
	gG1+Ow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvrev1uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:28:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed02a00b24so3914735ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187732; x=1794792532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1vqXWzE+0WPp+dRQIYusXTpkNgynB9O9I7bhcdFXY4=;
        b=XikGNDfv8xSw89GYvRNXn37OVYgzb1Nz2/KPPdYEESF9ARrC1hpDFS9axdadLwjomI
         fyrePb1sWD0iIZZj0eF26o35/AaE9yBZaaXA6GGyejEctRdyYmBdRTo1Y0uzvH+WqD6C
         8HuVmrmwWM+2DjRtFyok1lJmFbeeFt+3tn3c9jKjwgLCajBzoG5L4HmdyPSC+QjdkPEJ
         b9TJArqZ21MyovMhaeojwDKakgb8BxiKz3o8eIHPFdttZawu9HcLnuFPDY0PrNaclXTQ
         RNxWeUMIG1xPUWaoCVbQMBVbCBAE2PHIgn6oUBMURuRTarhHvWpf63iswbM7CbWS6NKd
         bUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187732; x=1794792532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1vqXWzE+0WPp+dRQIYusXTpkNgynB9O9I7bhcdFXY4=;
        b=Ckway83BeJ3FFGVdylWEAJGlY62DHiu5mlpjkzcGunsZSAtYq4jKyPe46AIsP5cuxM
         QOs5hUQakBT3oWtsq3aKJ34XLRGfRLVx9QJ1hxAEHCd4F7auXlPggKrk9xputhPnmDOa
         S84gRY0cPdKYSwfQWqnsdBrXDduCteDhDONlQ+xJEo8OF9A5sIrqWqtQJubzsEvzRMQl
         Mxsf3DwwYriLycx+xr0M0RpOb3E79U75AFWsNTVcMOs5zwXGe94BYTYGm6EHVNG3I2VK
         ZTQo5PEi9dN/pb0I+A3j8uZTFfZzp6uSGW2oLKdvZ1ffL8s+pDe8TLDYLKBab1asGSnm
         G1LQ==
X-Forwarded-Encrypted: i=1; AL+hErGrCD+qtEEBzt0bdqwYEM8biCYMf3qMKKqmin1/+8TjxCTm2YTWaxMsSuozaG1EUeY8Cw4RSum+GTFOH2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CA2fhnqaESsf0zI2iCAu2DnBuj5UO7W6uDUpSu76jU1AUHJXT
	EIEC5wpWB/a1V8++MKgAZTrspqP3+cOGXYpae7/TssgsJGx9N+uIkl/DeW1UlN+fDmrRedonHg0
	EAh7Lh8pcDF0JQl7Uvq3hTkerwvMSKjeOBk+BBEtITWYk8mC454Sx8PEtdOWG2K9ANL8=
X-Gm-Gg: AYBFou3LpV+4Wum3I4Lw6GgPLvN1BzMBeLKLsVlgWFL8JBq2XocYZJSd8pJ5Ihi7aXt
	Yw2IMsibxdUmHDWQprR4QmnDLFv4crFo6cokyMTq8Z6QbSN99OlUT238zD3+2CA4L7mE9lcg2wj
	xwEKwl0eE8Q1nQCoUOs8YobfCPrACfaHj0Dc2q889vvb0acA0Z0tjwt9FHx+bYEPa7S3xSFgu+i
	3jJgjOW8m/ETPFZjjf/kVR4E2J7L4SmxJ97Wr9Muu9TSVmvLhNqQZmHZAwYzmViHsBVm6ZUxTnZ
	1z5kbip0AkNBTlLVbSKgVyXhCyVJjXh6zvOGsPuk00UGvKqOPrGPTBAIuBuQje4oSgqse4iubNg
	JJNYSrsuMrOauip6Zlhk3JXibGz3Wju6VqGNTJ3Ux8041/iaCpN9I50wLW1wCC1wAiYPh
X-Received: by 2002:a17:903:19c5:b0:2e9:84f2:3738 with SMTP id d9443c01a7336-2ed833c4a02mr24027125ad.6.1794187732117;
        Sun, 08 Nov 2026 17:28:52 -0800 (PST)
X-Received: by 2002:a17:903:19c5:b0:2e9:84f2:3738 with SMTP id d9443c01a7336-2ed833c4a02mr24026965ad.6.1794187731523;
        Sun, 08 Nov 2026 17:28:51 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8146da74sm6248625ad.10.2026.11.08.17.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:28:50 -0800 (PST)
Message-ID: <a34ea028-77f9-4e01-a7dd-eb4811c97845@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:28:46 +0800
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
Subject: Re: [PATCH v2] coresight: tnoc: fix trace ID path assignment failure
 on non-AMBA tnoc
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX+yyK/1nrqBA3
 vGYXgw3chOwXCnTwJGCP+dz8xiXuqPqqKcfau2akCfnwWwOk5+N1HjIdeNG8uWeguGsS8aMkHoJ
 k5rcyzN09h0EwCMuIbDd0CzgHkmBo8U=
X-Proofpoint-GUID: gVLf7rTT2AXHfVYbuGwpliJPDAUt0w-s
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6af121d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4trN4h-55o6o6AafmxoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gVLf7rTT2AXHfVYbuGwpliJPDAUt0w-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX33I+BlcYUshB
 sl7hyPmrrfSV5rOGDNhKukInhcCR8ZDFRRut8f5uSylKpnyaF9e3kYqxEQ2sOZMZsW4tu1OSDDb
 LmwPLdh6wSuoiAD8PAmmQvEEgZpIKQbfEJOIydSNN/jPf0VBkAhbHyHvdq0Qnp0BROW3ebVlAdg
 qLAL6Ad36+NaRXH2UdHbml4S96AvrIJdP+r+RBA4y1myYK9eytMhFOkhW7nxOGlF9tVr7o90MOM
 Q3kTeGR830xwq9vfTPzwTndnYxY6jZgCKj3QRD9XZc7I0eFX+aD3GCqtf0ZRbJYBWg2RVNUXavt
 PokWVUyi5IjNmAkEVcDcchjmnQ0T6efC13Hz/z4mNp+NGf/cSTvg4UURR0Wi2ech6hOrMgWHOUq
 BSMiLKdsb3fnYUCkbOcwn2oZvYbNKTldWGD3K1csrfPcDUKLMGb/kur8GOGJKVqu8YLy3gJJOLv
 j2B42HQR3/WV10KzgZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005



On 9/2/2026 5:41 PM, Jie Gan wrote:
> For a tnoc device not on the AMBA bus, atid was set to -EOPNOTSUPP.
> trace_noc_id() returns this value directly to
> coresight_path_assign_trace_id(), which only treats a literal 0
> return as "this device has no ID, keep searching the path" -
> any other value is checked against IS_VALID_CS_TRACE_ID() and
> rejected. A negative atid therefore made path assignment fail with
> -EINVAL instead of falling through to the next device in the path
> that could supply a valid trace ID.
> 
> Use 0, the same sentinel coresight_path_assign_trace_id() already
> recognizes as "not allocated", instead of -EOPNOTSUPP.
> 


Gentle ping


> Fixes: 5799dee92dc2 ("coresight-tnoc: add platform driver to support Interconnect TNOC")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - fixes the issue in TNOC driver instead of in generic framework.
> Link to v1 - https://lore.kernel.org/all/20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com/
> ---
>   drivers/hwtracing/coresight/coresight-tnoc.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 9e8de4323d28..8924b61ad076 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -51,8 +51,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>   {
>   	u32 val;
>   
> -	/* No valid ATID, simply enable the unit */
> -	if (drvdata->atid == -EOPNOTSUPP) {
> +	/* 0 means no ID assignment, simply enable the unit */
> +	if (drvdata->atid == 0) {
>   		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
>   		return;
>   	}
> @@ -130,10 +130,8 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>   {
>   	int atid;
>   
> -	if (!dev_is_amba(drvdata->dev)) {
> -		drvdata->atid = -EOPNOTSUPP;
> +	if (!dev_is_amba(drvdata->dev))
>   		return 0;
> -	}
>   
>   	atid = coresight_trace_id_get_system_id();
>   	if (atid < 0)
> @@ -166,7 +164,7 @@ static umode_t trace_id_is_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
> -	if (attr == &dev_attr_traceid.attr && drvdata->atid < 0)
> +	if (attr == &dev_attr_traceid.attr && drvdata->atid == 0)
>   		return 0;
>   
>   	return attr->mode;
> 
> ---
> base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
> change-id: 20260902-fix-trace-id-error-in-tnoc-driver-eda88ea30662
> 
> Best regards,

