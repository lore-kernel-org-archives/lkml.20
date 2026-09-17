Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABA94A7CB7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636869; cv=none; b=eDl83MYgeU1IC0SDoV4O3ENXAUqmNHdpH6/+DyDyWZ4UoKHQ34ZpaSvjBpbJIYU6ZBsrHGeQpCb9gpSm4fx8l/J3lvgRHhQJDrYGhVAH3PDeID9hQeouM1m39TsdvdzdD/1ZXrIBJiAMtksgakxoo0zHYmFR0RfT7wGgcfF8Dgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636869; c=relaxed/simple;
	bh=pvn36+XXZpJr7eAoHajzJKU9VMVhCfPlLrRkjgzD1Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsbKUSl65DXMeSXN9SibP2Rsqu5ENdmhJnLMUlW1mpZqB8Y8GWbIGIYf9h3VlrjlzGnXVH4QlRKPDctVQ62oGc1tGQB/6z4wT+xc3stInYgxe5p4zdPG3d18PXVx7Im3T7a6vO+sJDKUWDlrgWJsdV9QMzlQK2lzs8m8Q70m3Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaDevk3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ic/DWuLt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaDevk3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ic/DWuLt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9E9gh2361649
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Le01rs0iRpad6L4RJJ6k/czKaJtw7aW6TV2m18hNtWQ=; b=oaDevk3WVknLNqu0
	UaolTJeWNngVYB4vGcC0f3U6DEDqrr4jzoQTlfBi1zhhNvWEw0iqyr3AjhihyaxU
	3HuK6kkuLvvlsw9+R9i/xbQFkYe0Sgc+CwYiQ9InnvzRCwVs/eZGbE2vGhHlyKeO
	SLr8pKPqXOXvIO5szeNf12J7tlZOTtWR7ES5HC+06wPKs2Zu/LSKWECLGEcI03yE
	JDFLuTvKJvfSOtWCw0J88oACiGT/1S1GdhXxKOrigcgVbTPJ+CQMH1r3h1mLAN6D
	eI6sitNHjRShdlH1qDZ803HTvwAR641ItZhWkb6FUomfIezcKEANI5SEnQ1OcYGW
	BajCxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6g10t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:21:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d04ab694so1709571cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789636866; x=1790241666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Le01rs0iRpad6L4RJJ6k/czKaJtw7aW6TV2m18hNtWQ=;
        b=ic/DWuLtcZXv/d8V4qb6/Qks7Ktcqp4pEA2GxWvgbFNPTUx67XnVhqaFTZVE5eYGpi
         OQFla88z7WSonwpQGyEoSsZzgWGcPyRC5Vey513laJsKUpSYVydZENUlFZIuGsj4yw5G
         H2RR4BP89ZQxqOoWXBL1Fvqvk+kMvLh4dqu8u9nnaHVTSWWX347xkbiH4Vbac6yKU64M
         KFVngfgj+5KOUDxz7m/rSIuJbgWaqbs8UDwCQHtbjvNhi7W7Zf18m7TT2Wq3oL55rSUc
         XiTWO6py2kYgkFaVBW6jCTm0TpTRj7iSWqgGU5691UG/m77DmPFUE3oNoTj9LHFwFxom
         ij4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636866; x=1790241666;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Le01rs0iRpad6L4RJJ6k/czKaJtw7aW6TV2m18hNtWQ=;
        b=kdq/SxDlzk0gScXSYdYmvMPvHV8+G394sBtvDUJTmvE9quBV4ezCfiht24sLpgWIzq
         Vqg89aJLuXyt86v4yg7YBQPs8O/Z+8ZBDpbXbv0gZU5QpgkMHtBBhCaZUJ9zxGJNRxmG
         oAYymQ/inKHyvJF7nWiRTJabWZ8/OQSjyY+r7eHWkDo5FnEA9b800CHPCPC19/tfbv3w
         XapEpxmRFdKlXz2uMkGC8/sXKxhVGXzmUWvcgq8Ceuc/eSnMJvY6vHXwY5xhEvPWcvCe
         SzNLNaoCrnhpH1tFRmV2frGgp4djwXuaGlBpy4Vv0xUpnaVv2bZnhgZRwtrW0EKMeeJe
         ImBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSzi5zEBFUM9bvd7Z+xwbL0vinYx9rZKZ652IN7a2gorNbtm1q8xLAJgHf68XwQLdg12hY8TnRhDgJY/w=@vger.kernel.org
X-Gm-Message-State: AFuF++kO0VWmEHcBdejOnZgpYQPQfX+vd5m665x1IoGtYSRJADIVHTjY
	a0BsUl/oyr0kYiDt40eQcrcC5m31pSIxW5kveb0Qw7xqZhQHUCGxDSJaevx6S3b2nUCIX6i8CVS
	9gYn14k7sgN4JzO1Ux4pi9anKlBtPx/o8HLPt2QaiLt9bCCUW/b8NMqQaGI7SdARy4SQ=
X-Gm-Gg: AYBFou0dYFE+Q8mrFFzLZX2TmEw5SL+70nBcUrPQVzKzvRuUQgTazvu7luxESykRMLq
	8Rnx9tZc9sipw1EeSZiopCqqEmTDu5NlksbrLLQA05yMJOJVe1+HFsYR4O6VPUXuX3LV/4+0Lzb
	VqnKMaLdtqtBHaYiy8D6wy9PlvkX1i7vCKVuYOCMfW/PQap0mJpxtgE0nbfuShn0sPbT/4g3Efj
	i1k4o+3UOJeKO7rd84Gu1uXPNaDE/1LwBbejR3TjCPo2ZiASXOoqOmnIrZf9H6l/fOqNT3NroiI
	LaMlDczGi2teq4g0MQ2qEt3fi6vJgFzEgkZzBZ0Jmh97fljapE6yurHTgiie/heqRy6z+YUAh7A
	rLnGr9SJL7yhKF64C9wJ50Q==
X-Received: by 2002:ad4:4e0a:0:b0:912:4680:c97f with SMTP id 6a1803df08f44-9124680cdabmr40817166d6.4.1789636865984;
        Thu, 17 Sep 2026 02:21:05 -0700 (PDT)
X-Received: by 2002:ad4:4e0a:0:b0:912:4680:c97f with SMTP id 6a1803df08f44-9124680cdabmr40816856d6.4.1789636865539;
        Thu, 17 Sep 2026 02:21:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48759dsm272768266b.28.2026.09.17.02.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:21:04 -0700 (PDT)
Message-ID: <0c4ee857-d8b7-4bd1-a74b-6618b45d4be2@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:21:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: geni-se: ignore invalid PROG_RAM_DEPTH when
 checking for firmware size
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-topic-sm8x50-i2c-hub-fw-ram-v1-1-f49286d8c8db@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-topic-sm8x50-i2c-hub-fw-ram-v1-1-f49286d8c8db@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DpXPIKoV7C_9sV87FZw39KFNyZCAUfLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX2K10D1mjIzVu
 AdijwfphqjhDAkYQjzfNxLsVPAqHXCwn07pFT8PiM4MF/uXhh2/GMwNDIfikMIhGYgjhOa9Rq1N
 WH0VlU9dtrIE0UuVxQHoHu2f55TYXxjSBv1s7tZK8G40LNetMiS8tN6OcabAj7wq6y+hW8QVjJr
 Hur80Tl++Z5VDgmO68ssVEcT/8TMloXLL76Of32aC+5FtI9S5wDMWxIsmka9FkTsoNvLc1ehj1p
 tvWsAj0pLLGtB0v5v5Nx0hc2WDqsZ7xfePjfhhvENOvEWgPXRO501t9n7dJTwivEMMCfTYaVOTb
 dRuZhqQRnRiaQaycDhNkDCrRNg4OSE/tsNNpJqlfMemVeSJ8Tojva4xQXz/jT32NRIN0u4vfmov
 /g7LP9Q8YZNDvLfbHMiXANIRIvTbhtc3jrBs+xTR1ulW22HdqiZbCrs9XRnQvHPE0QqwmVPdE9X
 +gZZinPimpMQdK0P/eA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX006qF21orhwe
 beRxoxYi45sJZC64y2XxRAiUVEgNYO/snvAfkBTB9GICJ3Pv5PBVKF8lvr4vDHRib1lsHGkiAXP
 pLOZyPyvlToViCy1jAmV/YtzxjNx7jI=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabb103 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=JNZNzMbJgxaTlkcejfIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DpXPIKoV7C_9sV87FZw39KFNyZCAUfLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170127

On 9/17/26 11:07 AM, Neil Armstrong wrote:
> The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
> is in the DMA register space doesn't exist for those instances.
> 
> Simply ignore the ram depth if it return 0.
> 
> Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 873bfbd6b2b7..e75349f2c15d 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1308,7 +1308,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
>  
>  		prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
>  					   readl_relaxed(se->base + SE_HW_PARAM_2));
> -		if (fw_size >= prog_ram_depth) {
> +		if (prog_ram_depth && fw_size >= prog_ram_depth) {
>  			dev_err(dev, "Firmware size (%u) exceeds RAM size (%u)\n",
>  				fw_size, prog_ram_depth);

The RAM size on 8650's i2c master hub SEs is 1020 registers (correct,
not 1024) - Viken, would that be true for all implementations?

Konrad
