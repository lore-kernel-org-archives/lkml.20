Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629647;
	b=FOxgwKCIygDi2VZ0pyyLxttMkdfO8ANsieJ5CudS00wihNxqoTKMFrXTmsdRT0lXse2u
	 FL0/Ql+GU+E9UG1QntZo2iYy7+I2fq8vYJe1ENHCQ7hzG7YJvaGauNJnc4gx1bd5zfjL5
	 RJwIOC+FlZPbcHDr/63FZ8yyZKr+bxsOGXuvnYVLYyj4ehpI+I+dCbwoy3TC4f/5/w8SR
	 5BsQUrYq9lsTN0hiziwDRZlArgWk8xtcgfQXxOJMtUYRS/szc9iy2nhiAf19eDX9oGK9U
	 Qzklc4xlgq6/TcP6tCVTQ+qAByoSMGWDa4h1ovgNex9OHZQ9EEhQlAUyE+Riu5QiVqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sJIKUA27TouNgOY6Bz1h90nZcilG5A1+OjspnFYoXZs=;
	b=zJrt050VgQKPrmUYfQOBEDiEYHSGQRSJi9IeqSaSaRuZVF04qpbhFKalOoiZsWzYHxSJ
	 AtKWDg685g/cAEsJi/TRni2pU8ybFiLT7t3rlT8eEdiTgBvCjhXGxVQt1f1kjXTjkoC3H
	 uyeM9zVYkT2nptoykSLc6qBMvHAj7g04fMElXyXPjBZVgr7FPrMyZ+3NKqWgTH+AWAThO
	 GAWWIZFj3cwYEqECawtO+t+aHkko61JH4r2nrDRo40XAfUQ1PsBT4LyyYl2qrAuRQeRxO
	 gzvKwtQSc/FQo79wNfcnyYZrpjKYYrYmXk9AIw22ukLu4RZLZFZr8al4uYCAS7Idy7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wq5Hqjbc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDAGpBWX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929A9607BDE1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929A9607BDE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wq5Hqjbc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDAGpBWX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpX4C4062797
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJIKUA27TouNgOY6Bz1h90nZcilG5A1+OjspnFYoXZs=; b=Wq5HqjbcSdreyUoI
	mPDDIwtGu1jpKnptdHHNPnkCOzRR1uZ+INo9GAn/VDOLTMrvQCZVZ/0jOcOUlwOc
	QdWwulBxyHm91jO7VyjaG355CmpdDTBWHq1Y0vm/yZITo4ldmaAyATAFov9oAnuy
	Bs0+X8Lx25IzyAZbLNDJk9yF1dTRV3paNg9jC+rXmU4KUYHf7Snzn3raFeGOeUUx
	qKQpenn+181puX2m0/Bh3WAoJ7HsRpJjhjR5Ue5ksI9ENfTv7fJgFyezW9SjP7M+
	+8kR4QyVzWUzF3PuYYlh4sv5XauLgpZlLFroyM03DOlhmKPtBfcSol3Ce6NkexMI
	Ne0HTg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesq03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:27:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso69232e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629645; x=1794234445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJIKUA27TouNgOY6Bz1h90nZcilG5A1+OjspnFYoXZs=;
        b=hDAGpBWX+0BGLdwjvVYYONNWlFcHl9Nnb8MBoyyWqrjBg336MTpLL6klXHzgNc5kMN
         A+757y0KKpgl4G4rE8fgVlEMSid/YKkzrJyayUFJvyJ5cKrLgpV6kND4pacopf4N+Xzk
         S9Ad0QmLqWVWk83gtUaWeG+cg9l6kiAUEy44FQbEYLbmHhJL1deKgRN/zcKGwTQ2Xj1j
         pkCgGlgFTeQQVQrdFm92UPH1JZhITbAVQQVOSxw143eqwfsOTEHswupAmGG9vD/VZIvy
         2IiVCd4gz9XIXbpa38Z7xSwu3l7gKtxppsOYhS8TbQuBufK3AXRLJWX1jWUzRTrs2zzb
         dWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629645; x=1794234445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJIKUA27TouNgOY6Bz1h90nZcilG5A1+OjspnFYoXZs=;
        b=FnOcIoUrR4zl4iUng33f1vZFIfRyWEu53aX+EgZIAmJIYKXG76k7vgPK+01EKizhOl
         0NThp6kspao+0ppQvl5xIMnDx2kc/byxCzNOjNc0Xj1zP7xp+GOvKtqDUsXqVWXeDnwZ
         PgdBl5k3Y2s85GnWUE80PoljDsv//WQ9TqQCxuw4sM34NhUtlCT6bGJ1dLJitjJkGzP2
         9TvQNgp4P4V+yznfukOrW1JviqTfTpdkcZ124pYv4z08CJYGHzGqs+srOtw0+7X129MZ
         GThjPpcX7wIzptrNQk0eOUj4mWqmRBl1FdKw3nOmJEdZZgqyVBz44sOF9jYLdVjn0Km6
         dApg==
X-Forwarded-Encrypted: i=1; AKwUvBz0Tdm/4OF6ajApisH8r6Lc4cFDMk2RITh0Gvsk1cLdnLs8qL4VVWeSm5/Apj7pEgJOfJo/4h4RSoiVW6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XR2MGQETqtyTLxOz71FGtM//V71fD+jlEkD1TGRtIP172MSUj
	6+KaPwamndrblOsCOU2WxAFUC+0q2mu219JdzpJ4S3orupn3xZDSljEbRxiDoUeoEzuicMRPBoP
	xFPSV82SgKb9dOmimoJsJjchp90u0My55EwLnYxF1Qpsl2AzzO2LpXxa4u117Sz49ja0=
X-Gm-Gg: AYBFou0gjtT++A8k4kUQefjHUqg04XrzOdf9kesDRjl58oi+cyOaL3YEyeD/lux80Qa
	Uu91zEhpgZ87UksrwQ3KQJqnvICySw7pT9zbd4WuG3nnH1L2xlrf+elIL6xI5G0ZNMsKnVltEO2
	k6X1RzJ95wWakCY6yK3q69xaJp/egXlsG7iIgwtLRSQw0et3pIp1pu5eBExMC0QMOm+/6hisIPx
	lxJWvv4/iz31JF6n1ypV89GGGZrM87srrdO6vOeOoCMIIDrd9QchqM1PDil+dDb5exkZ+0pPmxp
	L3/wK4ib0eYEcZmVzrpi8zOGYDhIRw9c5ltru/4Fu7krpdoqGJyVdJhh3I8xRBZ3jV8EDi9Uc2z
	CBh1Eis4tAlMkeDCvOQmvbVq4qicNpz6ax9apoCIg9J2KNEL2QmOvhoCU70n6kIXC/jQTal2X03
	keMhY0gGtCxnuEoaRKlLsoIMoBxN6Onw==
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id 71dfb90a1353d-5ec6883359amr4193636e0c.3.1793629644733;
        Mon, 02 Nov 2026 06:27:24 -0800 (PST)
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id 71dfb90a1353d-5ec6883359amr4193582e0c.3.1793629644026;
        Mon, 02 Nov 2026 06:27:24 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd260sm394744766b.22.2026.11.02.06.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:27:23 -0800 (PST)
Message-ID: <5fc68a91-720e-4c65-be31-8909bdfe6135@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:27:21 +0100
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
Subject: Re: [PATCH v2 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain
 on removal
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae89dcd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JYKc2Lh7GAscUsD6JlwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX4KAYuq9RX5XW
 gLrU+m/I1NGVCwKUbkqyCWu5vmjpPqFNYvbV3kNLrsEv5DKaKIUENDp1e7xI7WI9+1TWw0awHSs
 IGpqme7c8nyBqJVTLLpTio6605WRrde3C310ZORnsgMFNhoU1ARBb4pEIIooBIzN7DwXgs3oMDU
 rqrMhZo0RIAPbApVlcUfJ00GOghaxRQ5h+MoxYm9DIpR5+drYGSIeOQ1Y4z3GUH/7uDxSsPU7Kd
 nnKrIeqAj3QA9EJAM/s6zhtuxiNaV7jPiuqCVWjUo8tPkTYT6rjERB+6kOU3/FOApY3omqY1EfI
 2JOCPEgcVjHA+2w0Zf70mT0sUK/dhjr+XtMpOOqr8WHgTFW6mGOV7yUn5IgWMbxGM10NULjWfw1
 mbBHF8mKozdm66hIMMuy/xa3RraxF419hGNAIUIKSJpT0Rx6/7YhheYGiJL9ABVXea6Oe6Zr8i4
 dSOMwhkCuwqvFLtSTqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX/0aS/1k2d0AE
 RZAxc9CYNa8hgUVxFMj9J+2G5MZV42PsbMlQFu+jVvJMQbiMbsWJoZmNg8V4V8aorMY8qIsNNNw
 Qjbb8GPw7IIEaGnumsFRILSpYeDObX8=
X-Proofpoint-ORIG-GUID: cDohrkq2_GXFswDuIVHM-ru_ocO42dJm
X-Proofpoint-GUID: cDohrkq2_GXFswDuIVHM-ru_ocO42dJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020057

On 11/2/26 2:35 PM, Krzysztof Kozlowski wrote:
> The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
> is freed only after qcom_smp2p_remove() returns or, in the probe error
> path, after probe returns.   Both paths, however, explicitly remove the
> inbound irq domains, unregister outbound SMEM states and free the
> mailbox channel before that.
> 
> If the interrupt is triggered in this window, the interrupt handler
> would use previously freed data.  Mixing manual probe() cleanup
> and resource-managed devm leads to such races, thus just convert
> as much as possible to devm to fix the issue and make code simpler.
> 
> Note that for_each_available_child_of_node_scoped() loop, before
> registering qcom_smp2p_unwind_interfaces_action() cleanup action, still
> uses manual unwind, because it allocates the "entry" memory which is
> used by the action itself.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-02cea59a-8c4a-460c-aeed-69002ab3e72d
> Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
