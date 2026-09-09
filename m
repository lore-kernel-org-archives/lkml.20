Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864936F916
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934809; cv=none; b=WXJRdSvQ4rZtyC6jDbE7fEj2wCz4qaZUXLGpLhMBwN3fxsHLqKSH0iDvHxZwCY3whnoo8kCXeOs4GMYnWEr5slTLzp5rOgX9klibot0KPekFgQ07fex/CBqwxNGOHsyDq3Ob3XNRx3Cyl3UBbraReocagb2OLi1Ff6TtNVEuWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934809; c=relaxed/simple;
	bh=KADqxpkKqeJJ7NhxocaAYgr+D1WmIsbRH2gRDlfAQTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFFlybsbx44WSV1Myzb3Mz7orKULPXNOHsOLK7ySQgpQg146pMLpez3X2fVcQpemYzBJPTJbu7TWiQlZ7QZbR6dswe/BDKoijOK17Tuh56JxssnuBHPRUgSiGpRcujwrOXLi3Ui6WGJPPXlpY1SkwF13JuRdDpLTe9C8zHMQKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gija2mVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vku7I1Jp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gija2mVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vku7I1Jp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896DbC9481952
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjqcZntMXzX9L6jwYgDveF30oGBgFXltEaA43W5//qU=; b=gija2mVMnTYsQWH7
	fgO7ywY02ke4wnAusmZkyaMsW8M2duGikQN56XcSuf2dGiKLgUfTMlOXXxiaYHbX
	isNM5E/eDE8SThIdoaoCQaG2TX94DqYwEWzEx0wsDb6WqrLFu69d0JkvifkqVCje
	+o0VXjERjDF3QOwJPvrfecacE6Z9Q0RUYJsD19kTQqViZbPrRU7hq54cNisfSECD
	vlTD01k1Ua+4DGIT2h6zPW3yogcKE2z3Zduba0W805eQN9d2AT0FSouWVXeKGyKR
	DJZhIBsn/ZFxpNmJa/S5aUs6Vs9qZ/mHiMevANwTuJVjhLomDBTYUnN2VGo42WTX
	JDAwOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqf1jftm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:20:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso65449585ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788934806; x=1789539606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjqcZntMXzX9L6jwYgDveF30oGBgFXltEaA43W5//qU=;
        b=Vku7I1Jpqldm9tQ4UgFeGeOG7Qm87Jm5e2mNdAMJL4F9BTpl1JMh4Mt4RMBc6FX6jZ
         dzuuEr9eB/i3230q9RtCOOjuigAeZiIjSxRFpZppbCRhwk6bB6rWxb7Dr0ETz2ZQLsbo
         su0YSNn5v6511Ge/S5T373o24ZjB8lEDjQ36iTY+QneHiTi/10v7qgxiSJQXmIGur4rf
         DHihX1KW60UDC5fc0IpU2RIh0a8OOl0LtygPDWhfeOg6fuzY0BGMN+pUIhs3uZbE2T0v
         jNgtmkviJZ63nyB6sX5UDyMkprDsfV7YADrHGofdBTcBXIkXY6/wLzSmDRacjg22MH2C
         9XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788934806; x=1789539606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjqcZntMXzX9L6jwYgDveF30oGBgFXltEaA43W5//qU=;
        b=NnvNQkHMyow3qHypRoTdlGCWisSBlyAqyv2ubmwLthLpT1xxtho0eYIXHas0DRIzwj
         YSAyg5q2+ncFu43/lySsLFbe+H1nRlC9j4e/aZYnSlrmFTpe47kFJwT3pw9HCQHclJ/1
         dZfpL69ShTnjnMJMTM9WEVsk8omxwti/Wxx5fyhSMcNn41fpxiuvPmdkdXL9/TFMDrpV
         K/V8awa3QeUv8F+96c8gnM4CEKb9bthgyCyOWjAoAQ/c8/bnZ9bZDYl4vXYMHM9+Z/a9
         sBI1wXh5f3KME6j3Nm6piSMDup/FH7MVN3WkMOU7ww1H8FFz3EnnyXf1ZZOqpF1tKe/a
         gnpQ==
X-Forwarded-Encrypted: i=1; AKwUvBze4I2qGS3+V7QPo6WKZTG+eLVGNbABX+YUP7cPrJnQGKE7k8H9nKwsOu11mL/dMAn28tYbHcF4V0GDmj8=@vger.kernel.org
X-Gm-Message-State: AFuF++nLCpkORCt7qXPs56MtI7TRiyl21oSok6D2a0/2D8OgNzd1TnQ8
	X5PrtzincH9839m+U5/biiH7Ukc24JniGn8FHzgDVP3j/gYme81L9s4Ou5nD3UrWOlPRHX7E8le
	nFTSf7UaIqLNmlRloOwKYDzGEdpzDKJksxUGTdzEhseQRA02MaEujChssx70mbhmyCpQ=
X-Gm-Gg: AYBFou1RI1j7XwXRLOVnCcGSH7nYWfc5TEBY+ne7jC/ZMMf+bEtvtQCDTibIla83BN4
	BPlGsiTd7953mL+m8/LAkmpLKmXFXwA3sgQ84BARXgBEFkrW7MR6UAht3eqkT83PeJuwliXCfgG
	33xwRL7EJ5BejD2VtgaID6INjR91l5KyFSz1A71TQh4FalKTPSipaG3j4Um8Su2ibH+qtHSGJUx
	19CmNjZaJcFuSkFWNqLlyFwK98IMArKHqSBVCcoZ6yEQX63sof04heMExvCf8iYMPaR9bQDCXS4
	ZrCha4oe/g/U5pwB3vMkLU7qogxg6OkSKiIXJdqL7PyjHM8rNSC3QcpKV64p5+A7Sm2GoEcptjm
	uP/jIi+lAzXn3q5FUIYBpFp6p+f8HfjHoD+UiDbeVM3HS9yT3T8/UfYrZOJ6sv1L95G1cZKPKP0
	vTOrqql4psmfE48gVb
X-Received: by 2002:a05:6a21:a97:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3da39b437d9mr51701745637.6.1788934805712;
        Tue, 08 Sep 2026 23:20:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:a97:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3da39b437d9mr51701659637.6.1788934805166;
        Tue, 08 Sep 2026 23:20:05 -0700 (PDT)
Received: from [10.79.116.118] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm46793290eec.1.2026.09.08.23.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 23:20:04 -0700 (PDT)
Message-ID: <7527e6c7-82ad-48f1-8329-5b9222c347e4@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:50:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908155039.1203344-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260908155039.1203344-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2OSBTYWx0ZWRfX1KYxIgeINUXm
 Dr8KQEIHxpcpimy7fRRpvOfDMKOA/+Qs2pPBKKovNDrX7Uk7V1QILiohuEU3Z/fF+WnFUwCfOsv
 NTMRa1my3N0rEun65NVMnnFdI1cgjIofsSDySpGfg0eBEfYdJ58Iv/w4jM1fuMWf1eq2UPNrREV
 08zv12fejDKqudkQWM581xITcFbZphxd+wNHhpxxCy0HcnH8oW3Od+edvni21KSFT6h8rvC7eTO
 0Qr13Y4cyv3Ly0z6RPX3+H3q/xinfJrcue+tVnqTQK/Y85TwU+2PCDENWE+AVJi5FoasChe7DHm
 tERisjL/YPM+XT67VZEMyNJlQX3Oe2YPhAjfQrZP3XXu85yU/c1L3DUrSZOeI5Bq38FSdrEbZ/7
 jguFEdlJfGCqFuY/jnFFzogjGXu0yh5l9mulTf4WPfO4i8bAjaRPIhlYTZuL0v5QzhOBrDIBpIL
 WC3YZjF0lpufYIpU84Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2OSBTYWx0ZWRfX8bUrh3c1/C+3
 lzyNtLhjbCDgJZjn3k692BzK4Zk8RiHegjrlblS2sUNKGpBb+GG8ogoTJ7MZ+vpXG8xq3ma0PbZ
 12Tzye5HRh8l//sWcjGwN05N8LAjcbs=
X-Proofpoint-GUID: 7gWSCsxPrs6qIplQCzjX8m_adCSI-2lZ
X-Authority-Analysis: v=2.4 cv=JY2Ma0KV c=1 sm=1 tr=0 ts=6aa0fa96 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wY5xiLK02p6FFHcKSBAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 7gWSCsxPrs6qIplQCzjX8m_adCSI-2lZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090069


On 9/8/2026 9:20 PM, Sivansh Gupta wrote:
> Mailbox hardware registers are 64 bit but the interrupt handler
> currently reads only 32 bits with readl(). Use readq() to read
> the complete register value and pass it to the mailbox client.


Can you please add more details to the commit message? It doesn't describe
how switching to 64 bit would help mailbox or it's clients at the moment.

-Sibi

>
> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---
>   drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> index 7ffc40acea9b..f56a05149281 100644
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
