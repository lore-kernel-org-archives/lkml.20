Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756962;
	b=4YaPFXDuRuRHdaMTLlj8OcLrOTcVnzeqqZjmdEPjAY7bJF0jHyyUkocuRhBbOpfqVULC
	 0Nd5tZdG/2UD3NwgeHjdzNOCgjEhzAM1dBW8Usu+xQl93YMZfiBRZm0CVxsCm5ST7yC2z
	 i7yJ5d05qspJzENIVyc4KZPt1u+/ptVfeUR5/quwJNWkfw7lwiOcuR3r6unRxMVe8QNeb
	 Qmi1udHc8yd8hluDuSZUtkZiCVlTCl13wFwtWWo2K9/b1La6xGrEVcnZNhm7WovutUPkK
	 TzgAs8QrX60vjcF4mJVc2RJJIV1+eEb36Sge1e+YratG+Yuu0PQ51a5suIjEKDVjnpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2k2Fv+H33Z3TanT3edb6+47JQf2jhy0HXLtLEKD802U=;
	b=z8zLPkPRU8zU66dh5hT/nrolUJO2eWLjF8d4KRmIjxFdz7Sil/WuqpUhLo9BP1SwR7f+
	 EPHvt+8TEZb2r0SrBsFB4/wzdRCOXEM2C6r8KCQvy9tuE6tCrFKSvX34km9o2oJotQL2Y
	 /fn2CnD3J8wxuUeO1w+OzOG9Ra85jYr0Yyx2+i1tP2A1WAPvEZYEaMqSRzXtOGbvFXUcv
	 aUAT4OAr730lmM3H4fTCfybNsAIjuCHoUxXI8MtBIhgNRyCnD/on+eZZt6Ht06nWQPCh0
	 ufNStg8DVeCy3wHWnnFpnwObLX3HqmaZtRBfZuO043tLPjm6+F1X9gJqdeYsQbQ011A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFiPWEYo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T1Deq+dD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC7606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DC7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFiPWEYo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T1Deq+dD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAU5v2164239
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2k2Fv+H33Z3TanT3edb6+47JQf2jhy0HXLtLEKD802U=; b=cFiPWEYonrun0GpX
	ScNCldeFJV5UovpEwTdadde8u4QHE3+T9TV3DTJFss1BEqSLvNszdqaU7BR7V+PP
	o7rd1nyUWDSpCeiIFncS/tE4NzUNSOEzS+yjQ+vIN0ShmGbeepekdTTkm4x6yILv
	tUb7y0RCqJFT9pL5+32YmmsN2++PCfgcOJ7ZCncQYQddpJRgO5+h2B+lKL0FLufR
	rM7Mc3rkgNJwiNFpW6/LJk1UzLyQn7FyLGzf3VolG75HYUWd7K0VL+Ns/ZvYINK+
	oj9dJMlN/0k4vI9rws3cjKwoqloj+eT4Q6Di2uA+LMDJA/htdS3JrUGodDA9ai/Z
	E5Bx5A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahv0ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:02:40 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ffe90b2cfdso286200a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756960; x=1793361760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2k2Fv+H33Z3TanT3edb6+47JQf2jhy0HXLtLEKD802U=;
        b=T1Deq+dD8foWHVU3tVWlMDpiWkFSxyLsm3F5VJQ5zmOBpbu3LOXUZV8EwlF911+K6+
         1vYABSfa4ZenCepsBekOCTBn+QldTqj2hJlWvG9AMo+NnYChkQW48law3DFueJaRNIf1
         jRwB0zR0iYMO81jsny7agFV7hlB9Tg6QSY7dKGdaZ9F8F4vforQjKlQ7ofzj16adYiaD
         P+cGWmxFYI3eMHuWMXCxmM1C3jdFknmlIOYHoTcZvkPT+ne5m2di91ALd0X5k3Z1/9q7
         xNcUnZcuhQr01EL1dRPAT+H2449PMPfPhADIAcRsPNL3xF0tMjgvigf0vOXqiz1HW8WK
         Q0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756960; x=1793361760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2k2Fv+H33Z3TanT3edb6+47JQf2jhy0HXLtLEKD802U=;
        b=en/pxG9go4+rIbwvEQ7YukGU2Dbb2bp6kRoaefLCRToONmr6OE9GNvSlF0pA41nnjT
         RqENYt03XnyfGklGUzjHVj40j4YMLYY9JOFvGRXRDnhYJQ9uXGTTsWMTB32bsQad+DlE
         KTdbZ0cNcZfJi0oz5+44Uyil1q0S7wwzFfPuxyrOS8XQ2figS3HiiPlL/T0PB590qCzp
         3qCzvbOKgXM0tjLqZPre+9mSU0dzaS+sK8GEDX9d7NC3T0HnAMl4hngCU1IwpR93QuPc
         tnuWw6G1kJ/alCHjrmXLTl7LGDOIfcX4Qlc5TULfB0sk6WhbAQC2qlQZSDMELNIA+5vz
         U6Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxqmIcoQUxr2NqTyiDneA7goIa6V5N3XpeTzn5EXUdJaMMgwzLiIBOrP8Bg6ZPDo1qruM9oqhJFSfEk3wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1WpdDkQ/vID2WEcKXglBJLl+ZOEmOM5ea8RDEtwbLh1PhhMlz
	36Xn6MXRKMaztf0b/EPiEcMjDbG29HZxvXIgJ/7SkeUGTqu0WYpOhPQmY0tpseaZAtVzSIIsaYB
	wNyay//3l5yCfHtGaEKVFe4G4wAyDpQqzHH0esbHE/FXtmrcJ5Z03ePOkF50gvoJkXdM=
X-Gm-Gg: AYBFou18GY+/6TxGwUaYh/K2EirVa0xaQKrfUMIRblQg8mOt4CvbgKJJnt12WGPAZ/h
	5JbKej/YwwduLfunu15GZgvDnz89yIe2EEJUGTeekfNqZPmyWvhjSjue7Ah8RDqOeey6s/S9xoT
	oZyGv142h/V0Ga+5jlPSX9I8G12/m1OzYgjdqwuLzlvy3tySRDF5yI15jkT8XbzQv6kacY3rW5g
	0Bi1Gif/FG3yG+/bNcGn44cf6hSg0P0ihbrIfj6EXkVR4fmLzSwrrIkamaWbLDtYlogqepZbdNl
	3c13TFwNZ2BdF+7A2P+8SOYb1Ud0s9P5g8Y0VpW/UBc47f7JzqzGL8dbmq5JPbXcCaWCoUOuhOS
	+G+BVwXQGBMVmU6cQio3MpQ==
X-Received: by 2002:a05:6820:c3c9:b0:6d8:cdc8:4217 with SMTP id 006d021491bc7-70b889762b0mr1530292eaf.1.1792756960377;
        Fri, 23 Oct 2026 05:02:40 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c9:b0:6d8:cdc8:4217 with SMTP id 006d021491bc7-70b889762b0mr1530261eaf.1.1792756959999;
        Fri, 23 Oct 2026 05:02:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4dcd1sm95221066b.21.2026.10.23.05.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:02:39 -0700 (PDT)
Message-ID: <2876c850-e2d0-4ee4-9d8f-50710c371a49@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:02:36 +0200
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
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20261019-add-tracepoints-for-se-reg-dump-uart-v1-1-1fb47b1605b9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-add-tracepoints-for-se-reg-dump-uart-v1-1-1fb47b1605b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX/RjRF67ZZ5lW
 APQLIzqnmTCkC1NYYzgz7xX25CbTD3Lc/BXPSCjpBLe+z3Tla+AC9O/zkNqa3TM1ZtEQXRCdOdB
 GwmtKoE/EHYZ19CpfC7LXaiDLDFAaTs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX53IDsQJWNRuP
 hG5cOjCUQg3O7DRwX0PpbHjkPT7haQ31z8ihGvQXt6RFL5sOlpsGJ+LROcHcYs2lpTvXiYkobct
 q+Mut/8hRB0cnQUxiOHfBYgPMx+6bSiK9GjFkFsxcqjwu3w570aL4q3+1Jlli/wjChE5T6ZMx9F
 QuTVovsTaUsbQBhwp6hj2W6BgpwB4oAj1UqziR9KphAg2qbH6sA42av38u2OiogFYJZkKwkPu8z
 geCItBag5TG7i9pM9eZfoE0Sd/W9QxBxVL16/9C/TZo3tVdtoum39TZS9DNjyJvImtfpMzNDoFc
 i6VHP0fOSiwiNdaDeCx2+WXWecoAlzONzQmi3SINK4mm3xoA0h0xMJDFIX+rwQh8ulqA+XhVoGH
 RJrrbqx5GUmfCSqI37kBQgIPqTSB/AsBV0VZRIx4A5e5oHDuQOOXcoO5o0G1Yqhrg2np6Kxjogz
 gYBr2yEjPkc1TmPApBQ==
X-Proofpoint-GUID: mYmVs1Rn_OapM0xwK8aI7wUl6cbaaG8y
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb4ce1 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SW_1XP4-vD_1iUIoWgwA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: mYmVs1Rn_OapM0xwK8aI7wUl6cbaaG8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

On 10/19/26 5:32 AM, Praveen Talari wrote:
> The GENI serial driver reports various transfer failures such as
> M_CMD abort/cancel timeouts, DMA TX/RX FSM reset timeouts, RX FIFO
> write errors, illegal command interrupts, and DMA parity errors.
> However, diagnosing the root cause of these failures is difficult as
> the hardware state is not captured when the error occurs.
> 
> Add trace_geni_se_regs() calls at critical serial error handling paths
> to automatically capture GENI serial engine debug registers when
> failures are detected. This includes:
> 
> - M_CMD abort/cancel timeout
> - DMA TX/RX FSM reset timeout
> - Unexpected zero-byte RX DMA completion
> - RX FIFO write error and illegal command interrupt status
> - RX DMA parity error
> 
> Dumping the SE debug registers at the time of failure provides
> additional hardware context and significantly improves post-mortem
> analysis of serial transfer issues without affecting normal
> operation.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

The commit message should mention the additional logging changes
too

[...]

> -	if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
> +	if (m_irq_status & M_ILLEGAL_CMD_EN) {

if (WARN_ON(m_irq...))

Konrad

> +		trace_geni_se_regs(&port->se);
> +		WARN_ON(1);
>  		goto handle_rx;
> +	}
>  
>  	if (dma) {
>  		if (dma_tx_status & TX_DMA_DONE) {
> @@ -1270,6 +1285,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>  			if (dma_rx_status & RX_DMA_PARITY_ERR) {
>  				uport->icount.parity++;
>  				drop_rx = true;
> +				trace_geni_se_regs(&port->se);
>  			}
>  
>  			if (dma_rx_status & RX_DMA_BREAK)
> 
> ---
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> change-id: 20260927-add-tracepoints-for-se-reg-dump-uart-30d93639447a
> 
> Best regards,
> --  
> Praveen Talari <praveen.talari@oss.qualcomm.com>
