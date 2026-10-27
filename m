Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108100;
	b=Qg+M8NgaopYkurvqFGmzsHwY1TUVm/g3mfnGs33dEVixPiNoEdLcsoKu7hnAZW4+k3XP
	 FxBjtZzp/rBmcYwhMhLmtZEHh9Ued27sCXftDmjWlP4PWnRbGgwwwDVALYs+lceWbzCiu
	 VXyFhqTwYSMT2v97XVUIydUi1cFQ8CMo7ml47dxdTS5EHYakNXj1D2UW+Q0OVh8Q/mGV+
	 UGATqhOdYBsEQFyBpP24CFZLl8FJbMRG16gKpTzYrcyjyXXEcEcZo1rW+odz5C3RhWGPL
	 iNiRts5s0VDAiVCR49Jw/Ky3l0k297v47cnt9VEuCgSrvHRtpp0r5USatKGJ6IYcHrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
	b=XeEQ4wUvWeqCxnN+GZjclnU9hivif6pS2T9zwQQDWS3NUXis+W12G0+9A4eWVRmtI6M3
	 jdfKFmanm6uEJi9/5VjDjHU1w2I70BqHrueauUF5Jv0FQCZBg7KOH5/xy/05N4vXTyNxy
	 U6RmsC/Ob1WiwP3SHZcQ89SY574RkPygS6w5tV0OiCr90789WbY6JXcNjJi3KQoy4M59C
	 ZuMQwoG3rW2OhBQtn0l8kYPvokrEhSjAkmX1BaQ6NhEkjgbLoxmwNuuFITGcH8W27lDo/
	 zsZbO3WGLLwn7/oM5lDFYOu+zZ1NfK20tR0ioErrkLNeujya2Z57IwOEAthwEYWKV5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZc1ObIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKgtLxn0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0423D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZc1ObIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKgtLxn0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0tX1921832
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=; b=VZc1ObIq3VYML8eh
	tRUqcPH7SLsFquAM1/bjN6JN0kOjqUOrYN1f7uZJfTkqBvUrK5bDlwBaLh6xKsvI
	wpwpF2me1hy9+cKf4i8IWqp8GQFKUNRz9HrEzOG1Atw4xQjon9+RWgsqHzfvmCAK
	1C1ZPuc3XNVCOMPr18aOeVQaPElik7kOQCnq3Seaqyx5hlRF5TEsMtI+xD6HQWaM
	7rCxBIg9Z4KDz701Wg+H8j/nlWMGp3P9rkEUPQnhCki2Qt+LvNQFi2ct0WBvt3xn
	QYB6tQJ9yWGltPT27H3/z44lskLhwuH2e6U4gEAcph3HI6N8L+XGPCG9Ik+R4jce
	sEFXwQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq693sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:34:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so1122302c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108095; x=1793712895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
        b=kKgtLxn0gyFEUGNKsxvLyDDqTSPC5z7sFnBKKR9r6iMMsJVz8ZvVaXr85XUZdmmsM7
         kB9P8yV3q7jINgcjjz0d6SyW7Q/UNlR9vlNMoPYWWEq/jD8+4wgHeGd1JSPkeGc9pO6C
         6wVCvhqjeARyCD5ZIaqWkU8nB+n4s8ScuR8OwnbnBA3iiyZx0yXJdGwPKxKv+w62Lwq0
         LzJwD6AAe+Wx45ZeUfeZSE4W6y5xQ2mXcJGflzIL04CwEYpe0olMqvmlMtVf/bvjIZh4
         eo+lc47Ql6QDtx2YIhhh2qYTm6+o8KH+E0U38r/dP6B+FDDfFvj4siinR6JTiacybEh6
         /9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108095; x=1793712895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=humybFG+4U6oD9aPKeirurXab/GZiJOO+gMWAoyWycQ=;
        b=POcd8BqecxJZbrw/GE1vTeLYIP1bBIDU2Hu8WtFGUgTyXPq0TqMQpSBS3YeaOMx2Rm
         g/jYP/iwFULwqWPnun7VSg7X+PSWsW6ouu59DAMALHaAK/fzUBxYTSl6E4VeQLmCQns7
         S2HkKYk4/YCsaVErCv3jZZZlppYKxBBbgBJ/+86Z/TSrODdpRmZZq9O756w3u6uq+ehJ
         hp1VRyvkzZMfOfw1IV5C7krmIgEniMNqntf9ReH8wruuEFiyPdJh557Hl1p4mY+RjyWu
         HQl7u7XDJyARwpgkDxj4S0eHQuiUIxluLOPvlpvL/GHNI61UJICa2wHH5RT7iwSfSzvM
         w/Pg==
X-Forwarded-Encrypted: i=1; AKwUvBy26purVFT0sLfSzYHjY61QembwBHQw16/LXdyEt6GYvvLwQWAF9X4nWBTtxcenSnj+k6GIy9NIjpNCQ0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL30flGil+h9o3OI2qq/PZcsx1oyd2BCpNl8P9cxq7C+y+0+K3M
	RVvjO9Ka+zSTGejkXhI/yfKJRujDITt72ygFbLQ+Q9PBGiJ4U29OQ77Nty+31eLOIOSkzSIXJAa
	MbJbHVDn+tMfZjL1KS8n9FgJ4eMcG33nP+Eiyf6knBhZeCJqKbGz1t/EiUsPzYOzXTRA=
X-Gm-Gg: AYBFou1DAnWdmK6HxrPOlmRN2Zz5z849bj6hEd6Pp7LADxV9XJnbj1HuhYYGAsIpOGy
	PRevaYaKcBMcntNHhNso86fZLXhjR1riD5P44GwVzb9jCT0D+/rZACmVKyZpk70ySYky9qfMbGJ
	cywTnR+pHMAUUE1Gx6kxi1IuaY31ypDExRATFAy/nWzEFNqWUbMg5NW0wF4PnA9fTwBPUiNYt//
	fnx1Po9biUmdCFH7qNdAgpciPH90p1q4ok/7R2rbqg6FfM3KpARudy35VT9vZuRvaNWJpNHRvoA
	AvYDhzGOByspesAeGlksHqNjYeFrvRzqh7/fKuUQUxy6bXb8MeQFrCEoqDbpdPx3sIpB94zXDyG
	gPRxszHnLH4AsAH68o0wgrhacFhXHeUvpaA==
X-Received: by 2002:a05:7022:f8c:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1a3cbd717e6mr5335382c88.23.1793108094444;
        Tue, 27 Oct 2026 06:34:54 -0700 (PDT)
X-Received: by 2002:a05:7022:f8c:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1a3cbd717e6mr5335328c88.23.1793108093680;
        Tue, 27 Oct 2026 06:34:53 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm39957140c88.6.2026.10.27.06.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:34:51 -0700 (PDT)
Message-ID: <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:04:47 +0530
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
Subject: Re: [PATCH v3 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0a882 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=lV1k8KV2Q4sVphKZFiYA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: h_7GxQI2_0aa_TuXKKRXxmFkLetBOvAr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX4/VJZFrIyBDV
 Jnpy9BL9uSDEGQ2lZ9EvbRLy/a6RrjTFcYTUOnrzV7xGzl2rwpJFAqP8oXddUufocTIh1zo4YeK
 3xd+BhhHRnxu6PEQhRZGTNDWFzYnzm8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX42PCooNEFyh9
 mtKHzHXljU+GbyRAZTEr9H3FfK7JmY5seH+TTB570ZdIIQj0H/UfaknxGoTXXQvysSLRyIgTYh1
 aYz0Dc0UN904wJ3HYJldZ8IM4tXNm3nQ5ZXQg/aggm/Vrx7ofACWDzXIRGFXV04hb3x73LYGWk9
 B40xtNnMgcYzYM8YNXxlp7TCrAaDlIwxMtZKxQw1igEFWjDvnbOZNyPKeHXOnm5s0H/6glFDfSX
 lmNYIjynP57qAWJko+gi2jrEytMkgey8lp3z2DOtX8irWPkQUoiK5Vea8V2i1sZcG05i6YA2w+U
 uR14jSpHDXoUbK4oIEJ/bm/jsVs7fZhZS8bdfEszwjvC/QQ7tTCSND2bxmvQkC2VvN9ld6wdj0R
 cJ6alx6o3eHMJV9t5NVbe+uuYs8FnfsnBj0IDVJKf28iFzDI3f5N/KoAnMFTrN5ao4rmU2MoFXu
 qALMun7/reosMkaIgUw==
X-Proofpoint-ORIG-GUID: h_7GxQI2_0aa_TuXKKRXxmFkLetBOvAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index c41bfac65ddf..394e7287f6e9 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[...]

> @@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>   	}
>   
> +log_tre:
>   	for (i = 0; i < tre_idx; i++)
>   		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>   			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
> @@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   		nr_tre = 2;
>   	if (direction == DMA_DEV_TO_MEM) /* rx */
>   		nr_tre = 1;
> +	/*
> +	 * Recovery opcodes do not require DMA data TREs, only CONFIG
> +	 * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
> +	 * shared with SPI, verify the channel is I2C before accessing
> +	 * the configuration data.
I think i have mentioned earlier also. gpi_prep_slave_sg() Not only 
shared with spi but rather say, is a common function for all protocols.> 
+	 */
> +	if (gchan->protocol == QCOM_GPI_I2C) {
> +		struct gpi_i2c_config *i2c = gchan->config;
> +
> +		if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
> +			nr_tre = set_config ? 2 : 1;
> +	}
>   
>   	/* calculate # of elements required & available */
>   	nr = gpi_ring_num_elements_avail(ch_ring);
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
[...]
