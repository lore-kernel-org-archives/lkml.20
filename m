Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75263BCD3B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286396; cv=none; b=W2oSSpylnrsgSsCokqf2edQOXKWLra2m56Bt6Axk0yRs+IZss3tVs1AC3b/xIYz/C1MNMLmRWjCVZuz+EnbYSZBVTKyd/hcJv7tHlHnOcKKBDI17TfPu0cvNO5HLNyZOBHjsqdfe1/WeoTcxZKYZ1/tCfOCxQIUfMlKX9tN9FNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286396; c=relaxed/simple;
	bh=NxQRZiY+1Hcu3WiCd9qT3XUs8DuDoZysC2wtJAyYpzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bj1czIs6GDqPGiqze2OQ+9ZGW83LUKaLqKD8jLYn4gpMga84CvGYQ5OUMwT7aFtd1X/ShZ1zikMjZVki8kHFUGR3axLy5iVFdqr+R5B98bdhEcq9Sk+c6EsB8WYdNVIwsbaniMZ3Hcn69eETECCFXuFWk35GAiNiE+Cvf1Kbg7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbgczoBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCKmxcH4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbgczoBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCKmxcH4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPOp9088455
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJGeYwDt+tbcDelb918UexBGjhd7JLFFcooX7vZX/Mo=; b=kbgczoBqgM2c1xaA
	5NzId0+jgOHZeE9jYcrLrPj4qV26KqBsmTiEJg9bKmJ71jUu/9YWoDYOpqk3paLN
	8wHfxOoFQ0kuyJbZg8h/jaPxV04GM1iFhRJmawVzIuS5Za7vYQ3A/QWNtOaJ5Ack
	YfYZ9bk4aIvCJ72gzVnussBnyQI1KLeZOCjSR5+1ZSC4aZ5oAUtpRhrUqIFmFUIs
	4600B6r2BQrTzgttNi2SMz37SFghlBBrrsfXDHrNDc0QMRpo4VB9RAHYTUci1LqL
	lVQh7iTkgpOjxryb6YpeUVdQaopFMhEfDmD5WTRVueX4ZHL2cSd6FBkK9ET4CYl8
	lPyPnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xf7rcqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:33:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so4402120a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286393; x=1791891193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJGeYwDt+tbcDelb918UexBGjhd7JLFFcooX7vZX/Mo=;
        b=VCKmxcH4GWZ+7XNiEoM+nhJ8MQMQ9lHzQfKR63GqfBliCbAUk5U2fCPsqyvZhbMczT
         77SQm5lFEJtGsNCc3ZUNhNNAxJQFJu/as2RrhoCwGV+L3H48uOnm8fn6oOF2Mj+5SkXJ
         nAuhiUI8iI9DpkJ4W1+dJGQ5/4hNJVvQ5jhl5OkGAmcobBM37EOfhRVARlKokbyB7XWU
         bVUdxLI8Mr/jJuXxBO+CDIigAGqiDgy33Do7dS3brpeWa96MxSEa0f/xiTmCacQOCQYx
         /BlGwl/z/7l7y+jCqxt+6p+h4h8OWp/MHVItH27GqTeKMpshwfYUMCYla35jd1oF27EM
         GS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286393; x=1791891193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJGeYwDt+tbcDelb918UexBGjhd7JLFFcooX7vZX/Mo=;
        b=mjCBzOKFNa/dtHBHf7dKutjaQESpzhSOsLapmMpiql0ZCGiI+oBBXazrNjVc1g5TXW
         fQVj9mq0eegBy+bdCQoPZXtPHAkl7o7WYGIhTGVYTU8c2qCnXhgnhPb1Jic9VvroqByN
         gFoqnRcRLX+eNF2wGBqZQ6EVHrHFWUbat9jEBOImTJxECn8t7q6eW4aZ++LUMCHXsFOP
         REQTShSVct5KAXmboGRrX3opQRVDzXJwlpEVcBVUYJFddP2LfQkhBMU90QWKgxJQXwRE
         5YL78Pcf95d5vchGzfGaUcdNXWsI0qQQ/GgV/znV0T8fApW9ddtdh79cwL4P45Ts0o2H
         0XMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7wcpBt5Vs+4lih7YZKrjLuSYvrM9z7BPDm0a+jEtV1T8BBxTvEmM1ezWYwE6yGNtFEiLKUJKm+3J//08=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYb0x66BTXHdiw2RgEfB3BuUQI5z2op176usAUv6xERJYMFw4e
	OLin2WDntjJZZ8B9KuwBMUlEcdz/a6laSgyw2qzH9mmG5uWyc9Y3EWkg74ZXKK9I52ZISZCND8k
	EOZ33nmwodVJnVOMyffZ0lIcHNt65tpImLJ+63rKemlkrdQ+b0qrtXjghLL+nQPqXd6c=
X-Gm-Gg: AYBFou0Mq4Tupt68a2mwRJ//rt1sCIVWxhBK+47CDO4ezKW4Dl/2/N16l68kemcQPMa
	5J3NLvJPi4+/jJ3usjv6giSZsU6ly9EfVlUzvBXRKmucN+Ouhyz03a4kJGxjjm4t0x6pyToElVS
	E+tcPLJWIIKViAWZDYDQmHdDp4Kfgjv7cEsVtJ8X6+TLJ6OcnBisT6qiiFlFqhMnjotx2jfg8x+
	BCDVYDRwlc5zkUupGOCoQQxctDmD37/aDxR2QNf8R1dq/IfhTCNESkiOoF1IxDNI7G6URQ/pQfJ
	fLHkt1q1hMmNiav4/OheLF48QBlAGA4CgbjjNfjf4ELu43guUsdhwy5fvUAr49FzDKxDU3If5yC
	2A0/VL7ir9HitPzLQnHamwEtTn6E5gg==
X-Received: by 2002:a17:90a:d650:b0:3a4:e9e4:37f9 with SMTP id 98e67ed59e1d1-3a7873ac0fcmr9545888a91.31.1791286392874;
        Tue, 06 Oct 2026 04:33:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d650:b0:3a4:e9e4:37f9 with SMTP id 98e67ed59e1d1-3a7873ac0fcmr9545868a91.31.1791286392430;
        Tue, 06 Oct 2026 04:33:12 -0700 (PDT)
Received: from [10.218.5.9] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd1142cdsm11315570a91.2.2026.10.06.04.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 04:33:11 -0700 (PDT)
Message-ID: <4fb39acb-51c8-4abe-ad5f-bb5aeb180c55@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:03:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: arm_mhu_db: Remove redundant
 mbox_controller_unregister() on probe failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei
 <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
 <20261006-b4-mbox_double_unregister_fix-v1-2-9011ca208d36@oss.qualcomm.com>
 <20261006093014.mak7ctqf37c22l4o@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
In-Reply-To: <20261006093014.mak7ctqf37c22l4o@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX3vpWOBr3HWYm
 7ioaMtF8w9PPuvEzepEFSymP/L27TI1dqLA6E4spL6oEbk/tZzoVEXA+siTL5HdL7031ooPewpU
 zcCZNyst+JysRUg9o3iFMj5JeTP/A8A=
X-Authority-Analysis: v=2.4 cv=FpSQbGrq c=1 sm=1 tr=0 ts=6ac4dc79 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_l5KBuIKG0LRRNRTd_MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX9tT9fYY+rd+s
 mLPYXXMT+NI8TxChaXxXI3iGoXipsWIpszTYlgGXfezKF38aYz/cKh05P8ipmj7tMgsdHM1ScXi
 ReoJcJRR6mKqoE6u17fHkaWftmzflQqZ/l2XqoIIGNR/XD226rzkt4DyPMDnWhDyhdTXiOSqZnY
 fF3UxpR5GW0h5DOlqHTAgCJ+isaiZDCvciH39vAk8yc7s/CIxscgWO1e+cfCtjhK8sG/gA5SS9x
 pssSd2a2sOKA8oksT3bqRkLgpIJs23Yb4IgznqbVx/NKd2zSh//tCZxYUBnoRqBD2mFrFOXVXLd
 eDVxn5ZLz4UdML1+37NKJ3IOxzA09jg/d4Y8eSlbnkyUf84HOFamcNSIjuAbX1pQMkqw3F71lKh
 BdEc8qdQ/4u1If5atyZVSJ4zRnNT1c7wibC77WGHEr/YB2fvA5UL0PbtHyJdNpe4eyAwplSWV/A
 vC+oJUMh+UMjL6WXfMQ==
X-Proofpoint-ORIG-GUID: x9hHZDGascPxXa9upITm8pSQB1M68o4k
X-Proofpoint-GUID: x9hHZDGascPxXa9upITm8pSQB1M68o4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045


On 10/6/2026 3:00 PM, Mukesh Ojha wrote:
> On Tue, Oct 06, 2026 at 02:44:15PM +0530, Anup Vishwakarma wrote:
>> mhu_db_probe() registers the mailbox controller via
>> devm_mbox_controller_register(), which automatically calls
>> mbox_controller_unregister() through devres when the device is removed
>> or probe fails. If devm_request_threaded_irq() subsequently fails in
>> the channel setup loop, the error path also manually calls
>> mbox_controller_unregister(), resulting in a double call that corrupts
>> the global mailbox controller list and causes a kernel panic.
>>
>> Remove the redundant manual call and rely on devres for cleanup.
>>
>> Fixes: 7002ca237b21 ("mailbox: arm_mhu: Add ARM MHU doorbell driver")
>> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>> ---
>>   drivers/mailbox/arm_mhu_db.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
>> index a39239e38a47..9668dfdedc78 100644
>> --- a/drivers/mailbox/arm_mhu_db.c
>> +++ b/drivers/mailbox/arm_mhu_db.c
>> @@ -315,12 +315,10 @@ static int mhu_db_probe(struct amba_device *adev, const struct amba_id *id)
>>   		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
>>   
>>   		err = devm_request_threaded_irq(dev, irq, NULL,
>> -						mhu_db_mbox_rx_handler,
>> -						IRQF_ONESHOT, "mhu_db_link", mhu);
>> -		if (err) {
>> -			mbox_controller_unregister(&mhu->mbox);
>> +					mhu_db_mbox_rx_handler,
>> +					IRQF_ONESHOT, "mhu_db_link", mhu);
> It looks like alignment/indentation is unnecessary changing.
>
>> +		if (err)
>>   			return err;
>> -		}
>>   	}
> with the above fix.
>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Thanks for the review, Mukesh. Addressed both comments in v2: - Removed 
the now-empty err_req_irq: label in qcom-ipcc.c - Restored original 
alignment of devm_request_threaded_irq() arguments in arm_mhu_db.c

Best Regards, Anup Vishwakarma

