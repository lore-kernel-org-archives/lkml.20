Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E3B4E56C4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409070; cv=none; b=SP6wx0fXkmoHgWYsG8Lm41ss3l1jpyoRRimdaRREaeNQ/OUBjwA9fIuipeRpINBNO3HVprhO6H81rrIlaj0L7QU2vFTiMgPJfphyC9ApypvUbbB8v4/H/cGOUQhYWpM8gOsgu6DBZiXaiQmGS5+rbH2pakpSQH3gvxCIjLcLHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409070; c=relaxed/simple;
	bh=HN1npB6aajDJhKOJqSMG/Xm0XC7KMW/sEoIQg0DS0wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spbdrsJZr0762BKqdCzxpcSsbjKmkDI3o6lnw8Zvihsa94mwDh8WFrEO4brRCTTpkYLNoNhuKR7kP2BjUUerbVblTJYaunVdTsdlBfr9Mv1Pew5o2/e4TSkZ4MFoI7vknmQ+ERkumMvczFs2H08RaAeiQFDm9TgAq3Gc3iXX7rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARLEYZjT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sz3CErvR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARLEYZjT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sz3CErvR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Orn63256604
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=; b=ARLEYZjT8erF5qXs
	saU47ZpIVBTPaXlIliggk5y6VKbsiP3CRIKRK6OcBcmpF4Xo/4xEvJmBgp62Sa2j
	JnxqcsQt6I+kg5DhY2Cg3ztSSq68P2bBd//7ladzsxtmnZ8b//woAzdvqCLcu8ep
	c+2kJk1/P0LZl2lPv+cgGsJ2OD9YjfeTvrUU3yvfKMzb0sVysT+fYHkB7VuBEgGk
	IZwt/mNz75T8IJuSHdiu3etBQlRHXEMvBZrvToXcTS57Bj51G83nT1C00YRe5wUJ
	xYoeh8VftuyVGp1Yz3wOWRPvY9reLHQFsTqv48jmcHbz4jghOPEQd9fXgD81gjF5
	A595Og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8te6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:24:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso2297041cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409066; x=1793013866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=;
        b=Sz3CErvRWbcg0BaPDp2psV1mqhGtY0LpHaTPo9k6NIgW17UrbBhkJTkNHdQoki4XId
         GZlnX4cLUKpi7doXoQ/2D++uIRBHTTplob7Ak22PUWQEuPRwrH1DehKAuJXK/O1Rjhf3
         WjCEkPVbnhduvvk/wo3S2TY24TIYtNuTD0zY7WV/0kY4Ug1YcFDZ04HaWdS/0/6MkQq1
         4ixWJg2dzXf01qYoKUamsDr4Vg2EYQKB+gCQDYzXXbG7LYLV7ECges+kXRPFscYCb59f
         x9lZUINRO1MVdnCh87ME+t8x8uOj/6cR1kuCz4chM7aC+BRyj1be349xXmKU88aCw03C
         uwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409066; x=1793013866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=;
        b=qF3Fv9ryqkQLGZVxNYtpdSq0CB6EYDiyl41+TWhMw1dNdhglLN/IEmt6MJElso67ZJ
         r+uS6C38aa4rquVyve1Tqv2+1lBhb4Xv89WT1RHYVzOLOYGRDMqW0yOl5l+6V1sFo2Ee
         nMt/TypVz3cOcm/efhBs1jUhEa2975/J3MF0VagzsdYZzoqwJc/fsr1iJPXUr4T7hK6X
         BE2WDIW9Cv5hCYs9qHPmnk8jm+cmtW9Qz4GmQzXAJf8nK7vnhJk+WXV8dJ5woGWu/da/
         ooJn9rWAaM1g9nxSB0dP2L0QPLwA1g6LjUDqmd5WkZE8QvtAkTB5MR3dVHzJR3nfVM/2
         hOYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK9AJlmic5OnlNWNHhIOC0/5nn12Jzolef7ajzL7+kgIplR8d7WxlbOl9dxFgezkZYxra+Qs7RjJJcwZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbWytlFaf0QqCZS5vrAknFv6MsGAK8GhkwYL2vA9o69B/3Orhx
	BcP7spoIwcQVNqzHpLzRCp53DHorPN/INZ2lqWwAzQSV1x6Lj4YlybhEC1qL0omj7QUi9ZD3C9e
	bYJMkZcRip7hlaNEeOYqx4AOuz2X4RLlMva0fP2ArjYxIk5Iz7YXz20CJmRrPlmmKptc=
X-Gm-Gg: AYBFou0WQVcr5OdXHIpkyARt9bdiBbRhiwg5iM594q0Y6dnEwd1by1i/Y6NE7vAuNO9
	8K7t8722U+d9XgumTBkc4+pjTxXryULnxAZnnD7poRJf2Ke9rsZuFYe4vNZCDpP0Cj4o310wyAY
	4m6AZbkHSGTVeuk/7zvgJxQtDZG894ARPd8QSFjhf3PSNt6sFGd8n1bhSOiAufm5EJpuC81Xp5d
	WBEE+7DTjsBd/wSrOo1JiGc9JyA1kTRY+Fv0JQmQ3HdCm9dLemSZ6ORRwhOPhCgxo9d+bkJLHZj
	sPCjToLpJ/NaUOvZMmEcipf4O2LANQ153sBqImb18d7YxUCWTo56bHuGUXfLLCyCdV2NBh0K6Nf
	EYBk0ZcQT0wXW5dknRoGGrg==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr129062981cf.5.1792409065490;
        Mon, 19 Oct 2026 04:24:25 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr129062381cf.5.1792409065011;
        Mon, 19 Oct 2026 04:24:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf100sm338414066b.15.2026.10.19.04.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:24:24 -0700 (PDT)
Message-ID: <c75046e2-5d33-41c1-b032-3c16e630030d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:24:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AL2HwdqSLYazbnMeJd0Ol0cU0sV60Wmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX8Jg46mvk+BPx
 IqBmIeoHD5b/h0ENspZu9rVMRXYzr6BnGIF3b6786aLrhTXL+digCalHGlpjMcCYnT0l2NJ2CqC
 O07I+VRihX9Cx5DK5cEPJJG4g9bb3V0GSDfS5X3jiycUY/riGAmJgfDHoJjWzJLUUuZERJcJ+N7
 2CTYb2Yg9ek2+sMoatauY445bhQjv2Wc2b5J4o74Lanrx1CvQE4io/b5+rEbgDIyDcCmJaOLyo5
 N04DUpZg4l8HAgBXrawLOMmjTMzNUwCb3uIHp2H/m4kL00QDNXs4ew8NICZFFX0APIaWX2jiG2M
 z51Js5ywuL+E9bil1XaVa9qeXDMUsyLJp86AsqL/2/3Rlpcs2zLF8cJ48vcW9iN7g44oIQ6Izs+
 NrsOG0C7WnGIFC1rOcLOd/qQMsSUyoN3ZIUb7soG+D3OzrM+/S+ADD5A2h99SWPYKKdm2N+1BIm
 RAek5NAEMsVoieWAhmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX2lEZS/uXYAjg
 6gdp28IONYJg79smWHYwyam6cK3a7CzxViQixFzCDaupYD3H8+Q/+Nh34sQar0ycr3qdaVrN9uM
 VB5+GIk0pDHjqO1iVOuV7K/+Sq8VhCE=
X-Proofpoint-GUID: AL2HwdqSLYazbnMeJd0Ol0cU0sV60Wmb
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5fdea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OE6UjuR3gYnAVEq_z8YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190045

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.
> 
> Such implementation earlier introduced a hard probe dependency between MPM
> irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
> probe before PSCI power domains are probed.
> 
> The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
> psci: Fix support for probe deferral by dropping the faux device") / [1].
> However, it makes sense to remodel the RPM notification in MPM irqchip due
> to general consistency.
> 
> MPM is not really a power domain provider, all it needs is a notification
> when CPU cluster is going to power collapse to carry out the RPM
> notification. We can register for CPU_PM notifications for that purpose.
> This way we can avoid such unrelated dependencies.
> 
> We cannot register MPM under CPU cluster power domain and rely on
> GENPD notifications here, since that way cluster low power modes will be
> blocked whenever some consumer of MPM, and in turn MPM itself, are
> runtime active. This will add another unnecessary dependency for CPU
> cluster low power modes.
> 
> For now as first step, register with cpu_pm as a fallback to manage RPM
> notification. Trigger the RPM notification when the last CPU in CPU cluster
> goes to power collapse.

IIUC since we no longer need a dt-bindings addition, after this series
lands, we'll be able to strip out the powerdomain provider path, right?

Konrad
