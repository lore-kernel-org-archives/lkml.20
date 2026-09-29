Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2BD4F052E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674019; cv=none; b=eB6qyVr9TCjB10a3+HjkjrodiOsJ2dG7vuntqlfeQTtHSMfOEjK8omqngXCjpDypspch7b+SWpeGfUYKlFSEOJMIZoMeMsUSPhMBC5gBGqazpdCFSQK+8MTXlCIUxtbYTU4w/2jjCcE/9dYEz6tm6JY6HBSYPNu6hR6HDyaKGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674019; c=relaxed/simple;
	bh=givJ33BNOtM+J0wL94/jJ/fGolDipRI6WMK1BGzv3AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHgV/Dg9bb3L4/DL45Q7GC7iO8IFtuy0mBQZ6mAfX88piDCg8DnLRVrA6m5iwijxVQm8rcbpxPSYceX/it3+P3i1eZRlhx+XYeK3LRwtpp0AW9OxPuCbeodEXLJ66oIQn8UYQX7fFpzs3m7I4QjpHe2/rfGd6PVtytpFdmz5h+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EW9/NG/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIU8m5w/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW9/NG/9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIU8m5w/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tceo760564
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3b/ztHMtQJ23eJdc28nu0kxz5IQrerAmBtUuXpHPzM=; b=EW9/NG/98ekB9yc7
	vL3dlgyGjRuvN/954K5yHi3qbF+jUwVaPRRKmkFgx/YDXb4stNFTD3ofcvnLiCar
	VUAW+dcvf7190HGRRyP7fYeaKExoKjnM+hFs3skEjRDGWoVtTykldvn0byX9xZEq
	Qvy0+lmqYtTvBWiU950nK6zO1QLIqj98fAvwB7aPiBxmvcBQK0/l5H9d6AyzeQOl
	LwtLIdqu7dBrcNzK5E5OnaLTB0viAcngKzf/zQiiTVVniVCAWtkFEfmOFT2YrBB5
	8fExxRxrQl3EIf5T1CJO0o/nLLNGWEeuxazy/Z0foQM2zfQBFuFZO8XlNIULib8Y
	N3rGfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03k8qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:26:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3343198a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790674010; x=1791278810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3b/ztHMtQJ23eJdc28nu0kxz5IQrerAmBtUuXpHPzM=;
        b=RIU8m5w/6Lz3PD8F1LjKQfgVjm3Ji7i38A+wDoC2yjeBlf0P1l26I0US8jHa2RNmLp
         d30FKMUH2pqk72bJvNgYhnjkUdIkPv7TBS+Ni0CqYSe3kD9y3xlatfbeS8jC/SgXUDiD
         Oz/11Nw9Rzq4k79eh1DLxwxAUEUEuRVo9INkGEZAlEVYLxLs4wN5PpurSQlWj7jwp+7b
         cttd4uq44WVwYrqGYW14TkRymLHO5e55ygG0QVT05lnxcagpL992nVx2KnF+5ElMFLPL
         2tQABzjXmk3a4uigPrnOwg+H1rohZLii/aQPP1R9epRAVQ9XVObYCACp+i8462TOWbF1
         +5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674010; x=1791278810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3b/ztHMtQJ23eJdc28nu0kxz5IQrerAmBtUuXpHPzM=;
        b=dMZxwnmVALmd8OS7zgGF5moGMJlQvTS3BRz4G4N52hQ74mEvUHzp1yOcxvKElUvkcJ
         1886oDjAZq6LxviirpwQE8XmNIL4hymyv/bdMv06Br+2+uaEimABiv49S2ew+uG0xhxa
         hHu9sqM6sczHKqfn387jYLrdg3jgcPEM8cbYPM47vdORAqFetRZPvNmqyLaS7YcUmTfw
         eF+jrWbICCZsM/qKJVuyGXjxuKxMMUpYE/kukMQWUNH9f5obh5+L8ndZJCGtZIZyqNXv
         VXH8qEXS6OJSxVUNZcZlhkjGIaShInabnEvVUhdlDOLwZo/NoO9GyR5cjlUiUIbB9oR5
         FNtg==
X-Forwarded-Encrypted: i=1; AKwUvBym9/dvOkopSffCde15mc51j+YZ/0udKMVn+d2ARq0a+CoUQFbmgqwvBL3nHzn8/YOxIftXjrip6rcHf8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzlusnB3TGqnkJOR3O53e6t0anJ4ljV/Ps90Pi/nHtXbT+0lka
	dXwD/z8SMK1pMB+5StlNrVNLeAkFN6H7Ppxhprv3DtZi+EHMShCVm3tLhjufMlOOAK6adDRSO3j
	tSYhbMaS2n4BV9ROJK1eO8p2JU9vCcyeVDQQSLBkFa9WDzNl6L+WsIAXCNaXoYTXYRj+Kvq4x5u
	g=
X-Gm-Gg: AYBFou3gjWAajpmrp0Lz+m74AlkGmi+KDXjt+Sd9sLMF6eO87tMr8HqtNLUwMF19wju
	sf9WvFfY1NQ28RavffczrPuc2nS+dgRYbDhVk4VADSzTBoPejMHbVjrSA8NhktGXe+2/5SGav8S
	KjwcLdbpxhqAapGV4py9ZIy9GoYUk9QXhhAeWs4J0lm+LYvT+hc0hTyZGCJek3Q3adMZ4kjpJQg
	MsbdQ3ZjoQO1kaOFpIbMkXvlqEpvzNn/MDXnXYxK8zYg1An1Gb4swjvwDbJiR0U2XB9440rTZwY
	c13sGGaYbwNTHDCI5HLen90D/fUviz8gJPYRonSXgbp7QStk/Mv5J/9pFxubkMFF/eTGgEggKSx
	M8zbPj8Dlm0RWgwc5f23+1Mm7IFsCrn8TPrcFfK31uBAseIJCowk8BFeX782p9kP5YNSV5AFvPj
	5l
X-Received: by 2002:a17:90b:5347:b0:3a2:b038:c931 with SMTP id 98e67ed59e1d1-3a2b038d62dmr3130775a91.40.1790674009584;
        Tue, 29 Sep 2026 02:26:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5347:b0:3a2:b038:c931 with SMTP id 98e67ed59e1d1-3a2b038d62dmr3130761a91.40.1790674009078;
        Tue, 29 Sep 2026 02:26:49 -0700 (PDT)
Received: from [10.149.57.96] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497f2073bsm4511679a91.8.2026.09.29.02.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:26:48 -0700 (PDT)
Message-ID: <138bbe2f-2871-4541-80c9-c7867e1b1481@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:55:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNyBTYWx0ZWRfX1aHc+748RvqL
 V8GnS9yfcFY+Ry+Biz/tsA4+2oJxTCY19nwqbeV1Bf+dhDyxnZQZALwhkJSJkQUBebA1Hdz7vDU
 LuER5YCXThdw8s1+AgGKh8nlQAgE32M=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb845a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dvwXRZ08jinNhRNPmSsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNyBTYWx0ZWRfX5sur6/vWt8mX
 gCjThq7YnIXktAmRFxY//I69zOdTchfBP/gGt4hUoccTKHFi71mt5OZPTUw99CXYDgd0oxqZFru
 ejkZEh+tQDj97Jbg3ScMoDb2BcUX6Q7o08l46TWIE6N+sT8P4OS7+fz5k5L7q35YwogZSDIOSPy
 CiD+AiJZAWEHc7z9M28AFI76MwbyoXbYJpQKdWNEC9TOI6rsfaK8kJpVMMer5r7VwA6caFUvwt6
 9lP+aU5NGMR16Z6nUvyWhmvQtUcvNHZMwvq8L/uEACnfKXzKzRePxqVXVLXJ00CvxXz0yyP2Ukc
 QDhnFrPPHGqI5eJnz/EEV2/EVlUK5O7O4EW4sEksjGNn4BE4JZDqh5h7GnROyS7lu/7ahbMqNkT
 hLooGy5HbX/50131J+nBo+Mf3ZCwFQb/ZjP/CiQ8RVnlbAibx6vXJPCX4mIo29v5LBLtHt7wigI
 Ab46l8fve1IM2ruKLZQ==
X-Proofpoint-GUID: jLceyAKDJw7AUxlDEuPrCcifkkcWoEPD
X-Proofpoint-ORIG-GUID: jLceyAKDJw7AUxlDEuPrCcifkkcWoEPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290037



On 9/28/26 10:59, Sivansh Gupta wrote:
> Mailbox hardware registers are 64 bit wide, but the interrupt handler
> currently reads only 32 bits with readl() at offset 0x4 (upper 32
> bits). This returns an incorrect value, while reading using readq()
> returns the expected value.
> 
> Use readq() to access the 64 bit register and pass the expected value
> to the mailbox client.

Mailbox hardware registers are 64 bit wide, but the interrupt handler
currently reads only 32 bits with readl() at offset 0x4 (upper 32
bits). This results in a masked out value being passed on to the mailbox
clients.

Fix this by using readq instead and pass on the correct value to the
mailbox clients.

^^ seems more appropriate with these minor nits fixed.

Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

> 
> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---
> v3:
> - Removed references to an out of tree driver to focus on the incorrect
>    value returned by readl()
>    https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
> 
> v2:
> - Expanded the commit message to explain why this change is required.
> 
>   drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> index 862e45e8fbd5..0b584d9aad6c 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>   	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>   
>   	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
>   		struct mbox_chan *chan = &cpucp->chans[i];
>   		unsigned long flags;
>   

