Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702681;
	b=TiR/KTM2McNc4UVfeByw+t3JgmgYB8qaN/iJ2apWJCg/6/TI6vwmWvwN1SAQYlPx/W6K
	 0+rmh65f2IGAEXROUFZJvAizT+bY6yCGglJDulG8fQhrMY/r7++fGhaMOgcjq0+NdiNQ5
	 3sXj7A3d4dY4P/I+NDYNojpktroAeX70INfw+ZLD1mQgcqHqexDRDXR6x4jBfdh+DONM8
	 Rp08Lu6tMAm1X85OzRYWhvP1oA/6Tbwp/08iQ9AwD65FKiPNaGpbAzaSds4NqzaaSId/O
	 CNgiZUAxgBSaACZTEcRoEeESYX9rZWOq2PeTMRZFxCMYZ6oNQZbNRqPNbCagSGQSsBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
	b=RZ127FeOt4kjzwbyGYC+r+1sAb9lM++xeDJqE+M16+shBryqC8YT1MoqwplrS5yA34UG
	 fBeSShfo2en5Q5n6alxTFFoA2glcZr47JOzEw3e+WmAiu7gJcqGydgnYYsnMJwfcjYka6
	 N/x/ITV9nBd15jf0O74LetLCN6CKNkTHuLidrO1zV35/ibEw+5sMx86uTx5apo1ayrZND
	 /yS895WSoD6q/SexdtvYXHE7J9mVeS93U887Hx8vRaCki1qFVFxTyRTPfq8Fvlt46jjyu
	 HavZJvqryF85ZuqzEGVw5sYkltcxBkdihGBrGTX4Nc1AZalfNxfWH+RTZZsWm6tSn5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dv+1M6Y8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZhsBkh9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F337606C582
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F337606C582
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dv+1M6Y8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZhsBkh9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AATTK1594169
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=; b=Dv+1M6Y8oPnp7pGN
	xv3vplmWBRqQZoDov8Gmv2RcoelY6YFKXuIQxjoWRLHxQRybtILGIRPc+TDLzPo9
	YSMSmuBamhxMjvRv1vKDlgpZ9nrfE/X2yvp5+iGFXNl/K/etC+Yu+Rl5FaEQc0Lo
	WV/Ksj/5fDSwIL1boFCAc1jMP7JdmtHzO5Z9pYdz/Gq7b7s7VXF04zaFXLCNJ21j
	euEuz74Gi0UYeH2Lu5V1F3mFLh4mtS7Qq/XjpgZdx6n15FEiVnAmZMc2y5kx2hXi
	9Ex4s7e6uPtpOqwjZ8TMpXbb3/5LhhFlRIsQAHFnCr6hl7eI3kily02PSEvrpHTN
	A2Kg0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081uasy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:44:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso4267436a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702679; x=1794307479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
        b=eZhsBkh9pZcqiCmMX9B0WtgvFwwrhbXfZBU6W3cpqriBZ6tLVpPSkmOIVSO+5x5w/2
         rEAOEfMAu1vObsDVgXv8h8QZuBcYLq3U799TUROlLQufMEf4ang7fgVc2OzHXBg6d2/q
         XFWAe8Bmcp1edRP5EnoWmWIPDzZ1Pt2hiz0hjLOnD7+tKHrZxoOFf9pgd/p8DbvHQ8wb
         Iy3iunDJBcC0UNK4fmlT5uLB1O121YVAhFvwelnhFOTgbbieXQ3fiM1vs2yqNEmvYJXF
         Gv7ztZ6xGZq7Z61RCMEFU8uNXKZ4tkEChKNZFdjhcaaRSVTyqIsMr2gqrsNJv0juJmK9
         as5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702679; x=1794307479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
        b=ZvZ/i+kYDUqVdPmERMiEU0Ox22mdd12pbkRAgUj/AKgd3AdoeRxuBpJg+iDM2xg4Yy
         CdHGYA8BBBBk5QwqpRcmetysuQ7PCLOJh94TciRbGysgKq/TbvxlP7PJLKVuQZCeHZYd
         S3IEB+yV4ZHWW1x+5OAvmv7gpQJKqt2vCETZYujBF7i4cMmNG4+V2G5YwkDoG0WwGhs9
         zVGg4udiEVdXfSuPrvJK92Me4WRxsKUP5uZgUh7/r4xnsxvlmd1RWmkTNHYxFRY5MVYb
         oHHpO10l9z7PQhJV7DsZL8pTicPz1r8/fSXFt5CvabpBbpdAlkdniQqsudKcuxFBZ+VP
         e6JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrBIYXcN8+sTk2vvHyOAcjKsLbI3PWtZxZjGjQszJ9Lj+25EYucviJFozahaFwj1/7wYW3mfEEWjLPPcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xrnB7g0YkeJ7YHjJyc3UCP9Y2VV/T3efStykFd6y+oWbbzh5J
	SLDzkgk/ss4q3V5aRhx52GS4W/w+eeukUgd3ESIq60+ES4eP397HKZB2rdTC4TROI3KxKAUGMQY
	IEDOTaQhWOnOrrAMt2GbYj/FU54oXkoqPcB7q0CXTtMbNsMT6j1zuCw600zBegzGbhQVfVZJsiB
	c=
X-Gm-Gg: AYBFou17sd6eoKYbrwMNInJLLjJ4OgpN8MbLShzlT4gAepeGLT8/k+40mPaZTROXDkJ
	HQfbKulkKiLaCU2yFEbrihMjUXTOMkRCGmiMFtVUpxI18/yzSwqSShPQhL43wyZJuniy6h6AD7U
	P10yX1EIpeKUTmvR9fSORHWf+WZWZ98MMUdigz2wcfE5DSmQKGy87pWS847W+DX3he18wiCZP34
	To5tozBOXcLQMgGTn8xcL1rmHXO/qncuPKzKAlWQWfn2MPk6Ii671FUTljfTEqA5X18V3Wk/Gg8
	IIi2trZfpjrPBko3IZy2tZeS2/0Z2Wf32cDPBg6Eiovfn0Rsmz+BD+UnKzOPTUIOOsBIdbkvyjt
	1dmxnAcMa0o4+lmOJ96Q6GgoTcQgR5n5K6u7Bx+woG1UcF2TqWJ1FVvLRF6fhnjNIISPG/YjPfm
	Y6JYN0Vg==
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr10616879a91.56.1793702678730;
        Tue, 03 Nov 2026 02:44:38 -0800 (PST)
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr10616857a91.56.1793702678102;
        Tue, 03 Nov 2026 02:44:38 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm3905297a91.7.2026.11.03.02.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:44:37 -0800 (PST)
Message-ID: <2ed54730-75bf-4368-9391-5452d0a31fa9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:14:32 +0530
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
Subject: Re: [PATCH v4 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX9rr3Sh6RLv82
 t+xIMAYl5n2alF2EdS8W5/kuO1CD6CQ3Qwa7daOc+WpMdY4M3czhCoRSwYCH1x5gl51rpCQeIxH
 sCrTMab7+hBAdtTWnvNuqtSggodA4Ys=
X-Proofpoint-ORIG-GUID: OLhpW6pWgVdkIHJewbLQR-6AOZK2njsy
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9bb17 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ljc_7vWThQ_RCqSD0EwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: OLhpW6pWgVdkIHJewbLQR-6AOZK2njsy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX6h10Cmrtd7lH
 OrdXAybe0BNcNdzrj0qsCQNg+heoNoqHLvo0LTtpPIta7zT8jCHD6DeD2XKJQFfX0sSY+fN0vK4
 aHnRtyyFahrsEgYHhDR6sjnlBP+gToQdLDfccGfgG/cXSNYL4PghZAhKI+rIp/JwckH1ebs3mqZ
 sBwB8IVk50jZ8EOzAnozl1GtkJfailzdcXY4li9LOqxe3BsgQa7tzeHkboY6tcAVRsE1j5ZDMfU
 4XAL9WO8rz8Op0X7IKb1gC2l9lknYwgyJs7eWz93IRUkenawBQ6fwghAhO6ifm1AhOKphsuzol4
 L+vd12F/zGFDvJAqW1z2VVnCwYMoDpa6bxBFEexzUqWAdzjoTB+Wd6LT/TB5qfMYyebmZNh8YwO
 AMY2Yi3xlqOLgRlr63RZARdpLMY10bec+xtLG6hCeXU210rp0M/vXzAr4N8igxcxLf7zQzkXZ7L
 hR1idUv8SeChRj2RgXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
> SDA low, leaving the bus stuck and preventing subsequent transactions.
> The GPI completion callback reports a NACK and a genuine bus error
> alike as -EIO, and the existing recovery path switches the SE to FIFO
> mode which is not valid in GPI DMA mode.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
> trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
> SDA and SCL are already released. Extend the recovery callback to dispatch
> through the GPI DMA path when gi2c->gpi_mode is set.
> 
> Use the adapter timeout for GPI recovery commands, and preserve the DMA
> configuration error code when GPI setup fails.
> 
> Stop recovery on a GPI command timeout and report DMA termination
> failures. Do not issue another command or override the timeout with a
> bus-idle result, since DMA cleanup may not have completed successfully.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 107 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 94 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c

[...]

> @@ -1356,10 +1439,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> -	if (!gi2c->gpi_mode) {
> -		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
> -		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
> -	}
> +	gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
> +	gi2c->adap.bus_recovery_info = &gi2c->rinfo;

I guess one more time this. Why patch 2 is adding and patch 3 is 
removing the change ? keep it clean way.
>   
>   	ret = i2c_add_adapter(&gi2c->adap);
>   	if (ret) {
> 

