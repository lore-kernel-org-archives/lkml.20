Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998409;
	b=FssDDXqfWZyL1tLHbKVQkvbOROn0yyobgPritqaaAAitDr/Ea6ADryRJoeR7KQzwI5zm
	 ORduc+ivtrxotAR5/3CRitKuSKBK43Pc5GmI+zHIywH9t//eTTc5bxbQJa/WH3RheeuOR
	 8yprsrS0CbRmQ4ETRsJOGi4Q4VaxLC93HdER0RNu8tHNMxAxOpZx3QH8y2W2OZm1pSUaC
	 H0WDBx5n8dV2rr3bkXUcorhxDdDaeO3A6LVGear51ISMtK2MWSSgZzdyONCGq8YR4Qacs
	 CtHA+7Q+/zrU57XT4ElPBlbMajRpspP/VObw551oiWoMiSWwkTmxtI0MxHgLqmtZRnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LACHu7oKfmE41jF5sp+MfYyJU/SxFmiy1at/NlNWtfU=;
	b=5ZX7rOJbIn3c+BWVRsU8xkligEYmQhQwo3/xzucCyZda4I1Y5jOc5kedS20vjt7qwgmm
	 Uay46eUwuVaG4Cn6WxDfuIryV2C11omgjXHeE9ZklX97Zj06MxzJ5wmOvt88UMfefiUhu
	 Q+YPNYX7GLcHe5OcnrKfRj/Xoc8cx8ci4PdTFpcHFIS5/HKrhB+xe3oUhB8rbeEX7GVXG
	 eiFCIrxYvkl0R4f25h2trUlZwTAZ34EQ5r05HdoaZEyYlJfU50NZV2Mk+hP/3y0rOCXWn
	 5QKqmfSAN/GDBaBTge/pfz1JglnZrqvYUuNsAd2NYmBMqH9iEE6/EKtIwLrJLW444jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPUVN+oy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRLtHE3L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67436606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67436606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPUVN+oy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRLtHE3L
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b51v1340513
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LACHu7oKfmE41jF5sp+MfYyJU/SxFmiy1at/NlNWtfU=; b=LPUVN+oypp41UgYo
	YKB5MUPrcJn4wIXAteNamG2ccCJykFAFgLk79bcBlPFU20WT9AKuKq06fI3FQH8n
	yudGHlKf+G2TrEoGRU1RFXb9IWFJaxd19Wg0uIgytNgKq2Ui5bnFwiF5e+t9pwHi
	OftpA82p68kRtbADY3FzUu4nTpXXq339prUwoUZOTJfLkDhbCZ83+mvsjJdDJymi
	wtjkiL+Xv28eq+dHFgZhX2OwLmJl8tdWrtuENsMHWCR0pBtH8Mforp+o0LEe/XMc
	8JtUKlebd56U/R9ztCMKcFHPwk1JcA//iyFkC2GtiCXVxkRLb/oefHf6DNhoHFBL
	LHzkjw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9w27r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:06:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so2105220a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792998408; x=1793603208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LACHu7oKfmE41jF5sp+MfYyJU/SxFmiy1at/NlNWtfU=;
        b=FRLtHE3L2Zxwd8Z4XG2SP4ueghTHtQuKzh8+o/zg9RRyEjLuokRsZ9aKkthnWjjf8w
         /DohzmvVrJgs/h2UK8sUaJnCFXGECS34Lf+x5GmC7BydlaSiEw16f1iiszD++T4jIvWJ
         se74k+lKyYgI5jmyvonVrKRkq9h3eveB6A+SW4cnu0bg9JIiNYJJmIpghYhkpvCJmh54
         3uHndB7+KK9hHJnISIlkP4bIjyYqtyOd0savar4RoupiUhCTppNEBzXbfOKZRdDOh/4j
         ksuA915ZopquFawtsD2oNXCuUZx3K1cXrNjEefB9nWnw0Od8lehfj6AKF3cYXk4DhJDe
         Iy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792998408; x=1793603208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LACHu7oKfmE41jF5sp+MfYyJU/SxFmiy1at/NlNWtfU=;
        b=ceabGJVNynWQxhph9crMwSetQhOzUWf8uD/3xiTU8xCt/mQoyd3YTl6j3hXFuzgMF7
         HSuSiyIChccvXUPMptBdcMhEsG5HTdY4u/z6bD3bizG3Izca9TPXb8tJbnDqgQ0COQAC
         Ii64KSW/MShW9rI0+alm6abbe1wiIT9iFF7nexawggPnUI0JK5vhViDg0hvwVW2SgdIr
         9plCVTzYGDQxxgPyEr3RmdgOa4KD4VKwh5n/CBhIEYEnJnDBipCKegLB3QH8O4xHSHIt
         bEHa/EVv5NFW2BeuMm3+zFFuu3sknGWZYLtLrknRu9IMdZ/kQBLgXXMMgtZTZhMi4+S9
         O+lA==
X-Forwarded-Encrypted: i=1; AKwUvBzEDcMmHod3yUFlekklCu9JslEEKq7eIcnsx7cmEBzFyrX21ZXtOwYAC6xtkKicLraG68/zkt0kXuFVRrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXiatDrPHm4ZLJyEVaNyhP8lpmF6ts3+vUmkDbbdip4ymyDrDC
	mQZ9348cjzOnbvRbgGO4g7WAifeo6OPe2Ae4npeBuJTEAIY/vribDZv3K5Kn7YIAsa/wO3o8OEo
	orPSQIpEXbzfIJyh5qxI/Iqal3Xrwx1NW67M2oOh8/p3kGRn++TdgW1PCq9oHyk4eakg=
X-Gm-Gg: AYBFou3AUJJJvMqeUXLRxznaAH4TTMqNHr66LIPdBTIfu4djPayxRDB6Gs1uqxI1RBB
	mkxkuFiVORZs+ghmH4kYWTYTX53/4SokwOdVvIZyRixOtb7MljPEYWl5hJ8iNztFPChF4+DEQVE
	qGG92oQXgVn7JPd/gxrFKFjEkFRkv4YcGKlJ361psSctMwS+DqOkkTgxV5mqIARnngs7v0wXJ8q
	bD1MNU7BhbICnorAa0Iv1WiXQoNqa+Chk8XPQhuGu7KCJYV2HkHxBdlSXK7AnSx1SVlRktS/15H
	4oAx91OO5tmal8QJq7OJLJC1r5IbTaEO0tAqovfHLuAz57mj1rjF2DnjAZbYpkjB1WYu2mLFK7r
	HKyOBjIQm3zDUqvTFHZK//I1SR+UwTA==
X-Received: by 2002:a17:90a:e7c8:b0:3ad:77fd:c3d8 with SMTP id 98e67ed59e1d1-3ade9a3644dmr5600103a91.1.1792998407636;
        Mon, 26 Oct 2026 00:06:47 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c8:b0:3ad:77fd:c3d8 with SMTP id 98e67ed59e1d1-3ade9a3644dmr5600067a91.1.1792998406269;
        Mon, 26 Oct 2026 00:06:46 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0718esm6949365a91.11.2026.10.26.00.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:06:45 -0700 (PDT)
Message-ID: <57158d21-44ca-4776-8fcf-313d583b340a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:36:41 +0530
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
Subject: Re: [PATCH] serial: qcom-geni: Add tracepoints for SE reg dump
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20261019-add-tracepoints-for-se-reg-dump-uart-v1-1-1fb47b1605b9@oss.qualcomm.com>
 <2876c850-e2d0-4ee4-9d8f-50710c371a49@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2876c850-e2d0-4ee4-9d8f-50710c371a49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nJ82UIEhSP5GWGO0hqtu2pRqYPSwAtj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOCBTYWx0ZWRfX6m+QUKK2J67W
 wvFgVAjbA1R/464y8HzjOyLmEXBGZTEBVgFjQQz/iNNW0QNuFuQ1c1oIjyAbr9c3ez37YEKh0dw
 fXCymD38q+6je63KO1L9CWuzKUnLIshIOqj6aO+DiFUYbU2H8Jq/KvZmCP5LxQKSD9q0psugWMW
 suKX2/xompNtaWcjY5U7nXuKDbcrhc9sIzwkL3fHLntfn9XjYBnF77roZxAmb7LQJS82t/8k42c
 3C3/9k+p6MOOdobFzhJpW4nqko/Zo/0B2OaQWquKg/8T/afU4ErpM++CCux5l4TuHGy03NSAAqQ
 ylfU90v4GSv70Guodk9DOkPrVZq5ZfVXKQx3AES+E6DOMSxLC7LQPnvLexlV0DVH1CXIoT+NCBR
 sIcqb+31KmcPLCXScrvjtlVyJbnB8fJVIBOtJA2KGn2pi2kbdnme8asU8s039mw6iPv6M9mXhgo
 ASPE3asYzWe8xFEviDA==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adefc08 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zCML_R-7N-o1qndpGR8A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: nJ82UIEhSP5GWGO0hqtu2pRqYPSwAtj8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOCBTYWx0ZWRfX/3aAfLalDtoJ
 TQu3fp29oCngiFqunJewnfhngO7VGW3G1HGr5UupgRzmggp1zCdjxMf5MQKPpQLJO7D4OOkWV+2
 YUW48t6OHiFpQkk9oP3v/CxgNxWNTzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260028

Hi Konrad,

On 23-10-2026 17:32, Konrad Dybcio wrote:
> On 10/19/26 5:32 AM, Praveen Talari wrote:
>> The GENI serial driver reports various transfer failures such as
>> M_CMD abort/cancel timeouts, DMA TX/RX FSM reset timeouts, RX FIFO
>> write errors, illegal command interrupts, and DMA parity errors.
>> However, diagnosing the root cause of these failures is difficult as
>> the hardware state is not captured when the error occurs.
>>
>> Add trace_geni_se_regs() calls at critical serial error handling paths
>> to automatically capture GENI serial engine debug registers when
>> failures are detected. This includes:
>>
>> - M_CMD abort/cancel timeout
>> - DMA TX/RX FSM reset timeout
>> - Unexpected zero-byte RX DMA completion
>> - RX FIFO write error and illegal command interrupt status
>> - RX DMA parity error
>>
>> Dumping the SE debug registers at the time of failure provides
>> additional hardware context and significantly improves post-mortem
>> analysis of serial transfer issues without affecting normal
>> operation.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> The commit message should mention the additional logging changes
> too
Sure, will update in next patch.
>
> [...]
>
>> -	if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
>> +	if (m_irq_status & M_ILLEGAL_CMD_EN) {
> if (WARN_ON(m_irq...))
Sure, will update in next patch.
>
> Konrad
>
>> +		trace_geni_se_regs(&port->se);
>> +		WARN_ON(1);
>>   		goto handle_rx;
>> +	}
>>   
>>   	if (dma) {
>>   		if (dma_tx_status & TX_DMA_DONE) {
>> @@ -1270,6 +1285,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>>   			if (dma_rx_status & RX_DMA_PARITY_ERR) {
>>   				uport->icount.parity++;
>>   				drop_rx = true;
>> +				trace_geni_se_regs(&port->se);
>>   			}
>>   
>>   			if (dma_rx_status & RX_DMA_BREAK)
>>
>> ---
>> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
>> change-id: 20260927-add-tracepoints-for-se-reg-dump-uart-30d93639447a
>>
>> Best regards,
>> --
>> Praveen Talari <praveen.talari@oss.qualcomm.com>
