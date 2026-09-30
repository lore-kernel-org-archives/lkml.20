Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374943C10A2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762150; cv=none; b=MfJwB2LxL85BP74argTCf1yVwGdP2qt+OpLWo531AF24L03WvuKG63uDagBZN4zDvISy5930AgL55zarusTrejWN6HB+2W1Xf0P9iSmLGw6OKxDz/co9OqF0E2z/ODy0+OiGt3IYOvDXUvPkNGwt4/5RyTvfjM06Ln4VnoaiMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762150; c=relaxed/simple;
	bh=jrBevaeHBPratLs/gGnIcwLwfSVAIVm3pFEdnDTe5po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTdM9oRqdBk9r74fEp/4B+MyL9JxE6hIKcncyK0zwRMVjL0yMohj48XRmEWnjegqr0j6ZB53Q6MQymjg7UTgZNFVk7c//TrSBsnQ14nnkG2TNvrpYTWLUt/KCTlzQeQK0s90FeV+k5ACiIwm2BiGX2kN4k/XxXn+rL8FHIaPSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENWMyR1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSwrFvSz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENWMyR1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSwrFvSz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dRuN2666858
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/UovM8U61lixyz44kABwbvznPPj9gWwm6N7SWf/v6A=; b=ENWMyR1V0wYRBha3
	7Q3z9aGULf56S+9ecMkNDU7bo1PKu/giAtNrfmWvaZrmquEppl/E2TnKWtD4kvfo
	gUsm8BQaTQ7Ex/OFegpV/b6EeY0qBnFGX/vwzIQlFedRoXOI75AKJN65WuWiVcMI
	dX1+usVGfHmAZdd34tH8NV4Xfiu0KVkRa0AfRgRKecPFdpQ3QUtVIrAQ+No4xbjM
	ShpIMV9iCOunS3I3gjMi5abzyjK40qAmi8l93FYb5ZLr64g3fbgVlsk5Ze999F7Y
	XhZs15joj5oB3J9yPD7gE9/LvO4Xe8LkIQ9tJKQpx1AlSog2ELkUbVmNSYvEZXi5
	NLLelQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27gp2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:55:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso101968185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790762146; x=1791366946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/UovM8U61lixyz44kABwbvznPPj9gWwm6N7SWf/v6A=;
        b=MSwrFvSztLTfsY4DvOCmeRN6+ouN4gFl9tCaMePOWru7lJGTlyxF8EzS8pQhWWBB5J
         sGbYKw6JQzo+lzAsmUAehIfyVYhHWlk+wBcVPuwT2KRvXB+fl2Wz2mTk6L+lF1XTL9qu
         8fmhbnrxqETk+jn0D2axYYn5X2D4DOWFLmCuuOlOjjZd8RYo6SeteFd7H/Ad/bARrVa2
         YYVrSjKSWqDp/5q8noAb02wkCfVF73JwbuK94dgES1licJp2XyUrKxWmOtpWiqF8DQ+G
         RqQdocg0EXz2YGAm/rESSUTwjbUvV4NhaQNz5LhL4pdOSYbSPRj7cqsUEIUSSF4WTb9g
         /wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762146; x=1791366946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/UovM8U61lixyz44kABwbvznPPj9gWwm6N7SWf/v6A=;
        b=vu4/mCUfL3+N+RADM6p8WQkj+K2O9tJ1ADoXOmHzQijX03ON3bR2SJ0+Dl5Ht3hx48
         e4XYSltKcjlT3zN1lN9fAMoDvmEVXZIdhDr8XT3Dqu8AM0rcwWdDLg5Kzlik/jMlkDI4
         fqYnW9LJqx0CIM1GtVffOftc2vcBjJcYQfu6s4Yn79CrIaMZ/YG6QEwCMXxd0z1Tfjdm
         snI2uCfuUU5+8kNOTaLDsJ8SyO8jqLi/r/+O8r7g/6ffSQhkIjbPFffZRQn6/677vE0K
         UE+3phtZQb8KkCL0A3uQj5TOAHf921w48E8Uwvxyh5B7LtU8C/i/OA86Vv5aF3hq9O0/
         FJ8w==
X-Forwarded-Encrypted: i=1; AKwUvBxFeZMGc/aFqAnrormUn9dfn57TF/Rd+O0NkGDCZOKcREhpmr4er/9OSIeYDujeoUnNlnhZ4Mk44mSaR7k=@vger.kernel.org
X-Gm-Message-State: AFuF++mLEYeDKnaa8ZcvMcZT9tIwopXOeNgjedzmjCZYP2tSpfQggVNJ
	cgf8Tk3aqaBYT3KV0Bj8IV/lyW5ZbOFYZZaaPv7fGaG5DIGXSDDb7eNL8o4sYpDXtDtgoePJdLQ
	xZnC5RDi5fI/xzpcehRoe4J85xqIPJQ7GqE1GJTceDAKvzjaLVRIyYlP5DsKKcd1KO7c=
X-Gm-Gg: AYBFou00crhLGhXeMaiR8bpBQKVMpg1AQzyWNliBcFCTpLe7pYmHMbLlyjaJQhB9THP
	W8yJ6i8Mv3GxbdBUxXq5kOQLf9svjK7L60nYspejpxSt9egB5EnmwVWP3DUn8odoWQwse/DAvNe
	ROaLWP9YXdXQgU7o94hC9TT/quetCY1eqtcLWHlOMf4OOYal3CmuEcE2JvNudkrPgqhCSxnop5E
	C4xBD4fhPxXCtaMcTp5TtRvMJhNAxRI5PFL1IxDQ0f4HXgYYIJ23B7CKBiHf5X8rGBax0PRjPWJ
	y9A/DwgUy8WOwh9HGkFu+Ot0fENeDKP2AnFSEVkP2C6qrqu32NfnzJF5VVZoK29eeMcZAG/kafJ
	8x5Fk00p3id/20svh27MuQA==
X-Received: by 2002:a05:620a:4116:b0:939:5924:e319 with SMTP id af79cd13be357-93ca934902fmr115958885a.0.1790762146254;
        Wed, 30 Sep 2026 02:55:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4116:b0:939:5924:e319 with SMTP id af79cd13be357-93ca934902fmr115957185a.0.1790762145806;
        Wed, 30 Sep 2026 02:55:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f61b18sm40618066b.35.2026.09.30.02.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:55:45 -0700 (PDT)
Message-ID: <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:55:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfXx2aohMt+nD6y
 qCSESbQ288N/LTXjntPHZW+nUNfSk/pKaS/X+K3yBqWYz5eO6Vt9/uyHx670AAl5ArJd9VTSSaJ
 O/zt+pQOPmP+oqbUJ8AeZ54yfHtvaf0=
X-Proofpoint-GUID: XE3v5V-mRL-_LNUyRpwaKl6kdCpeZH_1
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abcdca2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OKysoguTPNU6ormpymcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX6Gw1YYode5py
 1v3ZxHj3I+IqzSPy44jogV4gvTalrVWcflyg3aBS+iKZy0zf6/1lybg65Tzwh0fi594LZrRzydy
 O1NN4Yg199jnWiHSRpHB20RwuQFcvN3F7XTlv3B0NguE05nEs15ebqlCZ7ZVAi0Zfp3CDmDwGUJ
 G934Xk1oOK/oNru94BoDs1GpFERsTSLC8hn2ZA58/OtaBPooiy6r6TBQOqTMzawH4wsIFAuMI+8
 ctniuGSB2OGaTKcSiVF4+glTAIoijXia5oXOIVQRQ/OZXvDTTk4Bay8LYRJ4VLZnt1exr3W+Rc3
 xYBk6D1FOAJA5VmvX/0CgZwes7kejnHY9gxjyglgu7qjh7mRWvMn2dMSxpKx1rFJXrK0zAjYzyh
 O8ksLiReAXIwuAbzeLm8RtqVLgzMFHS6t2tNR71vm73nlX58yVf3CrS8NXfQdlr2SXwg1iuYTLH
 BZLc1Q9fiXRc+qBzSUg==
X-Proofpoint-ORIG-GUID: XE3v5V-mRL-_LNUyRpwaKl6kdCpeZH_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300039

On 9/28/26 7:29 AM, Sivansh Gupta wrote:
> Mailbox hardware registers are 64 bit wide, but the interrupt handler
> currently reads only 32 bits with readl() at offset 0x4 (upper 32
> bits). This returns an incorrect value, while reading using readq()
> returns the expected value.
> 
> Use readq() to access the 64 bit register and pass the expected value
> to the mailbox client.
> 
> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---
> v3:
> - Removed references to an out of tree driver to focus on the incorrect
>   value returned by readl()
>   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
> 
> v2:
> - Expanded the commit message to explain why this change is required.
> 
>  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> index 862e45e8fbd5..0b584d9aad6c 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>  
>  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);

This still retains the writel() later on

> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));

This will alter the indices of the mailbox channels, but it's ""fine""
because it's always zero for the existing platforms..

Konrad
