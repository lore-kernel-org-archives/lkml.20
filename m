Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67413DD85F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789448005; cv=none; b=OhFb+Bg0JPGj/aqVLWscRGSPBKo2/IXOnDvJN/RjYABBxctefIUAzfBBNr+TV2ZFe4VDmXMGbxtJtTA0opARLA2rLm8b8Gj0p//AjUSEfquTh8ETYm+zw463czCH7X+ivbf1bCXdkHUodNx9iWAib85qwdVVpk8AYCiWcFgsI80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789448005; c=relaxed/simple;
	bh=rEY5l0iVfrsuPam470fa6kHhUaPkw3/kKcg6uXvE1yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3JcCJv1zr3p/q9hM/hUs32QTPWQbJDCHQjgBU8XbWDu6Y5u/Hu51R4aa94oFH7vDKOKpLCDcK6QiWZRuvICd2ICWdCkMUW/9oDab7zKYx0xXt2FMxThoHtHxU8yvUlj0QD8USiVDAR4qh6mzQvM/p6MeWYaOGIxUTNsp+EggcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0LNsfCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nkvb7+2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0LNsfCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nkvb7+2q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nWvi2623335
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpZr2026EGm/eLzB8Zb79A6jAwwpRMzfhRw5jUZ8oS4=; b=N0LNsfCvGJsh0nhX
	gInT4SvYULBoRKC0rghmUzBUgaSbjPoqQzT0EFONCW9CsZlWgxs7BWzAQi3FXDMM
	6bfHlpiqpzBAJmDbYqyLXVKUQPYGO1la7s703AIF4qoqeB8gqzmW4MO2JRPbOpGH
	vpybwAECFL1ApyXuHK96SVKxsv8Lk1aQC+TRi8VQZZ4xIr/V8QWdawkZQIWgCo+W
	YgWaX4+Vl3Rgwe0DdIVzs8mo4VoJpuLAO1pGr8/vun4mAFsKv8yYzxObnYGYS6+F
	Y/k1mcXFbWSnX1M7tf+yfdAjgSliS4OBtTSzkEVOJg+CjNYFRLe/5395UDKEAF8F
	0M7hOA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9tdbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:53:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e0dd08f4so2966996a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789448002; x=1790052802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpZr2026EGm/eLzB8Zb79A6jAwwpRMzfhRw5jUZ8oS4=;
        b=Nkvb7+2qfBCu80k206Cllj9PQrcaozneZiXCzwFcudu7KwYPitN17xsbD5C3JJ8s+P
         Wn5G4d+oKRgpl0Bx0Ju70wF1QvsG7DLw9NpEkpf8mJNhkaCSxgtak0LGrHmnZ3QoXjSo
         OpEhPkbSy1J/zpSI5QqanjPD9m8MjYoyO6RqwaEPY9pckwyEkR16NG72FJyK3xftA9q5
         Mi1TkzKvJYOhwXdhhfMZJ2nPyu/E5buXwHfpzeOhX8vzJf5mznT+I0M+pd/xXAfEIhsk
         qS2yCa9nZVI/PMQ6qpIGay0NDErg/C11caxlOxP88wWNIDaeIvbRQnl35d0A3m1qYIpT
         u6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789448002; x=1790052802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpZr2026EGm/eLzB8Zb79A6jAwwpRMzfhRw5jUZ8oS4=;
        b=QoiK6IxQ+XpLHbR+4RlzBFxGZsOTNvBnAERY+g3LwtKH6c1DSCNLHnq3NuROxMEHUN
         7cUerYezSIidryoxWeEGLPzz+LujFuGEB5jQ7WUPtr7/42+/OPKqXLrmE+SMQ6JpDEsK
         Sidmdx09zDqHWksIZy5Y03nDxHBxNzeTx65tLboVBHvYjG/t6RGsEa4CPnOzb0sj43B0
         ra5Lbx8Wv5Z5XvL0Fr3m8Jp+hs1XUluw2mYCmVfZI8Pk4oBsGEMFDVXTu6atl1qzYklM
         HYn22Z3wGFg6+uq1OMC3qBce2qngA4j74j2GvKxYfn3YJ8xl3DxKvBKNhV02370k7Dhw
         FwAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNOZq4RUHVpFXAlzQGmsbGyhU3N5mTiEOg9KygteI5c+9oq7HnozCILi/lvulz8G4mh5xyjhM3UMur/RA=@vger.kernel.org
X-Gm-Message-State: AFuF++niV4MzVxZIUPN6GELetSeOr9tnzzvFhobZtoeOCr9bQyGu62Lv
	TwcH8/D9ZZJ22mwlu5N99zQwroO+uWzlNmvrT7BBuhHgouFJZGEZJmjlwuU+jyYfHC0v/nx5xch
	HoBnpj+nvL1wKi86HM+f97s0LTOXQr3eGI1VdAgY0I/tdCJc5sHoIIGt5mGywM+38Xeo=
X-Gm-Gg: AYBFou11wWZ8S7PKvCJjgSP7Cz0w0YSk2XiDLQ5X4CvWeeJ9LwPEwbIcgyRUYoORhcl
	RHh7Aq4YRIziwri629df6/Fxe1lcw5vcQwUpggLMBjQeQ74AefkjChFc5wIJstLob5Xo10Owk09
	+CD7hi4jugwVrPGTFN/JEw1B0yStLcgTC5kyEoDAkC6IwBa6BvvDINKwc9MwNB4V9JSOSa9di8C
	yzRl62UXR83K9Pv2ekxrx5XkQ0CUkglVOMoOuJG5Az96IcVNDojwD1ZGLFcqkP2eKyZ0opty9ra
	enRuEpIIfz1aPiseYPzM6ju0hECfReqX5E8OToxUujDLSLgtdiSztDmirVCr4Amz8MOXm9x98gM
	KtDq+1IKWjlsUS+vf1gWZeyO89VPFzkSr8dWs/teavHY4HCZ/sbuFMQ2UtHqBA1cMrCv3
X-Received: by 2002:a05:6a21:2d43:b0:3cc:f0c7:5999 with SMTP id adf61e73a8af0-3db40622c8emr13064043637.16.1789448001611;
        Mon, 14 Sep 2026 21:53:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d43:b0:3cc:f0c7:5999 with SMTP id adf61e73a8af0-3db40622c8emr13063997637.16.1789448001168;
        Mon, 14 Sep 2026 21:53:21 -0700 (PDT)
Received: from [10.73.212.239] ([106.192.34.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm6002715a12.21.2026.09.14.21.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 21:53:20 -0700 (PDT)
Message-ID: <78ed75a1-6f74-4707-86bf-5ebaddc8cbd6@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:23:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: ncm: validate the NDP chain before parsing
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org
References: <20260915041111.2429236-1-qwe.aldo@gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260915041111.2429236-1-qwe.aldo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8cf42 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ebQaAufLtzKgtO4u2lSP0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=HSZgmaD_RsK9m5tnku4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA2NiBTYWx0ZWRfXwx9ihQwx0q68
 I8BxertkAbzjc0MwVL0q8mQSCMp6oY98ArhDCZbBILx/0bqSK16v3Zxmez20JA0v8ZybpFstK8z
 118V7lF6hFxCG9oXix8N3ttText2ACl8eEX3um/Wkuc3ssBGx2mIP5I/9ZM38W2Pyc9Dil1kh3e
 7ebKtq9Mq5B2Xp3bfIsR4+Rzz8MiWg7GX1zCvkyly/foKi9rVmd6rQ5kcXySt88tb/pDNhXIhTP
 G2m6kCNyLz+t8Tvw5dPrJtNnUZCGaG2oAmZSJTCHjguHkCoceWWC+7tfogb95vtrk1+q8N5w37m
 07ICa1KMRp7BohmOUdUncjbU9WX2yTYeyx4x3UBfCh0hwGJe6H4jbozAUdCiXHdLC3GjFYknmUH
 nlFtUVPswkabO/rsT/922PljLNhqUL5Zx0/ZWeAoUMqYwZ9S7jphTfvCCoWu9RFS+HzvPB/H82a
 RH3XK2orubN8c8bhdrg==
X-Proofpoint-GUID: pc7X0NRSIIrf9cF__zZ6EsKl0XJVk2P3
X-Proofpoint-ORIG-GUID: pc7X0NRSIIrf9cF__zZ6EsKl0XJVk2P3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA2NiBTYWx0ZWRfX9FbFdmgDOB4U
 UGdlMLRjKRwptfU0pTHrOrwU09g9NQNMCJLQ3UvuLimptRbX1/PIORZC6zaAR3ofHzPHihSNRmJ
 3co23G8QUOfeU8YXqtuJ3n1TMA7tAyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150066



On 9/15/2026 9:41 AM, Aldo Ariel Panzardo wrote:
> The next-NDP pointers form a chain supplied by the USB host.  A cyclic
> chain therefore makes the receive path loop indefinitely and repeatedly
> allocate datagram skbs.
> 

Is this an issue with NTB creation on host side ? (seems like it). If 
so, can you update commit message with an example packet details 
indicating the same (or a walkthrough of a packet with such headers 
indicating a cyclic chain).

Regards,
Krishna,

> Prewalk the chain using only bounded header reads before parsing any
> NDP.  NDP offsets must be four-byte aligned, so following more than
> block_len / 4 valid offsets proves that the chain contains a cycle.
> This terminates cyclic chains without imposing an arbitrary limit on
> valid NTBs or allocating skbs before the chain is known to terminate.
> 
> Fixes: 370af734dfaf ("usb: gadget: NCM: RX function support multiple NDPs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---
>   drivers/usb/gadget/function/f_ncm.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index 64eabda2f5..085aea142f 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1175,6 +1175,7 @@ static int ncm_unwrap_ntb(struct gether *port,
>   	unsigned	dg_len, dg_len2;
>   	unsigned	ndp_len;
>   	unsigned	block_len;
> +	unsigned int	ndp_count, next_ndp_index;
>   	struct sk_buff	*skb2;
>   	int		ret = -EINVAL;
>   	unsigned	ntb_max = le32_to_cpu(ntb_parameters.dwNtbOutMaxSize);
> @@ -1224,6 +1225,30 @@ static int ncm_unwrap_ntb(struct gether *port,
>   	}
>   
>   	ndp_index = get_ncm(&tmp, opts->ndp_index);
> +	next_ndp_index = ndp_index;
> +	ndp_count = 0;
> +
> +	/* Validate the NDP chain before allocating datagram skbs. */
> +	while (next_ndp_index) {
> +		if (next_ndp_index % 4 ||
> +		    next_ndp_index < opts->nth_size ||
> +		    next_ndp_index > block_len - opts->ndp_size) {
> +			INFO(port->func.config->cdev, "Bad index: %#X\n",
> +			     next_ndp_index);
> +			goto err;
> +		}
> +
> +		/* More aligned offsets than fit in the NTB imply a cycle. */
> +		if (++ndp_count > block_len / 4) {
> +			INFO(port->func.config->cdev, "NDP chain cycle\n");
> +			goto err;
> +		}
> +
> +		tmp = (__le16 *)(ntb_ptr + next_ndp_index);
> +		tmp += 3; /* skip the signature and length */
> +		tmp += opts->reserved1;
> +		next_ndp_index = get_ncm(&tmp, opts->next_ndp_index);
> +	}
>   
>   	/* Run through all the NDP's in the NTB */
>   	do {

