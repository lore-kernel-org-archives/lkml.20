Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41533B995D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476510; cv=none; b=iFd9OgQiEoBNSkeM50SH21N161qh7G+k/fMt/+mApPQsmG1JvuCI0abSLPvOuGr7ixLuS7MrOazT0FXzvDTKlJ9Ma5eVPCJGm7Lsbj1TQLQUUCR+oZF1HpeoKtyLms/g644CRo9Opd2z0v/rCGiKSs7uLqKA4JHSYm+dc+RSHrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476510; c=relaxed/simple;
	bh=L9wFPHnM5M00CRBpaXfsBmIyoXPBno+DoIC0CemBM7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVXxjabJleoTT8fJTsnvp1TKwfMtqm/YiYBIwOio82cezZdwflDBkjIDsXqdwL3xwS37ok6Z4vvbkrfIQhjDJFT+DaNia9Nu95ZXC9M/vnwwDeuiek3bJ/5h/vWrKTLa4oP9fLcdr0w7XfDIORlQBg4N6HaBbEoPDlS4ggeNLVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RK2t1VxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chZAiQGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RK2t1VxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chZAiQGl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hP4g3742096
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vti70O1HWYPyeAOByJaVa98Y
	XH/bifp1FDhwGKlYkI4=; b=RK2t1VxSvyYbOF4AJaiGsZysh8Lw/Cn7ef5HmtBD
	qbxLsnPjfCXKHJP0K2pEjtyqesfC7GEXQtqHf5fcQaBO79LiwkWCx+Z1+w4LU5us
	/avnM67J9a8yfjaT492WqctzxLX4KhI2Jf52f3ZxtrkCDPv+mnUpzoVzBq2+lsIm
	gx7ld60mJsjiV/LSoJ+bbkdvDgWI1K9AMvnwK6YQDuxnN5EAsTr3SW3hjlKzOetJ
	aqmm8PE0Wcah9dkZufpYNqL32jcLgeFvGw/UhL/o9vM/pw73a6GrMZltZd8I2HIX
	OIACXgBxOUeB+eCm5rnrbBu5A+62k8nUqj0R2wMQ5ZUfyA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux1tak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:48:27 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c6725e7891so1925545e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476507; x=1790081307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vti70O1HWYPyeAOByJaVa98YXH/bifp1FDhwGKlYkI4=;
        b=chZAiQGlUgzVqSEJqqY71K+BVT8A/kDAe1UwmDtSE7IfBGQ1baD6nz1jUZHj7ygfsR
         RaPsqSQeYuQ6Df3Sv5BRrC3tfQ5Xvj2OZJdAD9yPsjePsSMit5m00J4lKNIJN1b5oh3O
         XNTR4kwUEnXAfpUJVV+qrqThnkeZmWfYHCHG/o3FrNRRr/aAPgYqkzr6tc3BTbfLs0hq
         Hb/ejk0oMmDK7ZlpySrMtisNy5bF9JoWsOQGRm4aOtvzJsE05rvFvx7fuy2AmTxCwFvO
         P7MufKhEwNCzjtUQEHAvG18On3a61Dr3dbTnK7HBctWDEYln9O3+vs8mou/RwtTSmB1q
         D7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476507; x=1790081307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vti70O1HWYPyeAOByJaVa98YXH/bifp1FDhwGKlYkI4=;
        b=k5JZ1q+czBlyvCHQkjdMXlOznEiwrdNvfLFwsskUSS1K+d6jtOqNrExGwqRyRbIAR3
         QEkGlL2wikbzIGm4C+vlpYIdJiUClsyvyxjaYFxC3EHaNfDorFgioSYmF5rLN6Jtfk9g
         31zF3q5aSmTkMTrnb0tdthnMep3EwQgZMgg0k/wev7K15Mf+/XeXnRILZbwWL+ySJmgi
         8PmuIlzNSQuBfCs0mpEReiyx39tFYQM5IFAsE4HY4WPt8/+abPqSShTYr5lYB4QyxFZT
         q0abkR8BMLvcTu8uPoySIx8ex7FmhxjGn9rvis+nUJKuE/FWZt+bKijnyWL+dKhuJCdG
         8Ipw==
X-Gm-Message-State: AFuF++mGox60gm6Mo+uKnIBClPy2k8O6so1FcyTkwxCutKIIAY5/5iWf
	p83wcnWc5I6qqAUXglL7jKVE7x28JoeaXs/VJKVeJZ6TUVLn2GlQ+yMhZTg/JU7v+tWOYd712Qq
	zUitBRnnRLO7SpXQ7O1o4OzC21n8qj/ZpWsHdrdNUsd1bGITq1KtWj+EsPxPWsMTmYgM=
X-Gm-Gg: AYBFou2wdt90GXxqNDTc6uJQnfLTHC/+3QiYA8SXQG1nQTrCPqGOv7hjRfHAKsKcaHC
	BobkjVz8YIGVhwkngX3d1Phwwh7fqlBW6Mn8i70+bxZKN9arK1WJU9kVwB4IRnJiBSegwtkBdO2
	V6TjL6OUbzR7CEy+E7O7ZBFKZHSmji8q1VaxQw146taYxz4yhtrmDxYT6kR3rTMN4yi6hQc2ilN
	EQnsLijHPS4hthXNqWLFVVBaFN+nlWcbpl/Cs7OyG3oK3mD8GNPold+SWMTaQAM5VqS0v4hk69R
	0vFvyk1+GDy6aYKNDfaLZ+aLjaJIqLh8OffzypepouhMf8YRu31QOma9HkVJJAvdkyfFHD7FVG/
	l5p5KR8jZGTxSIQ==
X-Received: by 2002:a05:6123:82:b0:5c8:4831:1539 with SMTP id 71dfb90a1353d-5c981d86a39mr950438e0c.5.1789476506907;
        Tue, 15 Sep 2026 05:48:26 -0700 (PDT)
X-Received: by 2002:a05:6123:82:b0:5c8:4831:1539 with SMTP id 71dfb90a1353d-5c981d86a39mr950389e0c.5.1789476506393;
        Tue, 15 Sep 2026 05:48:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm36484827f8f.23.2026.09.15.05.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:48:25 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:48:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] Revert "interconnect: qcom: x1e80100: enable QoS
 configuration"
Message-ID: <qasmlx6tcqz7ou2zkl7kfbz7ni3pu5iwtjms3xu6lzuwffdthv@vb4dxrpvxnza>
References: <20260915123703.3228329-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915123703.3228329-1-maz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfX71LcX6e6qneF
 jpTj4PPfDNkkGqleH69LQpuUchjk06o2wKdU6qNDt7H71sxBlGF3fYd5VekP10rg1XuPlpOQZI4
 9E3h/YSKD3q/fat4xIzHaj8Kj+svqN0Ik4Hvrrba3hxRafvubn0Vqa8EowwQtuUsufbKhsgMwaC
 xi1MIEmr80GHKwVoyUISu8rA8QVWjLNj16sNpuD/YOskeL0v33hW67HRWXBJs62Dc3rKJ3UI8Ro
 Ab7R4NXTl2EQSnP2jbMMtmxnaXsiQpXBylvJRhhhz6s37SInFa3sDupeE9LyE5cLAJCevvsHaph
 zegucfRJYYgstFSpqoPBEfzjDeciZ8odaYYyel2HaznVyfkvuhbpXUdAwihuj1jNSDW+QRglgO4
 VcFYUKhS0dZVYGvL+4YlmK0iPS0Yu9z8/DN13xYGf6+MrB2SH17pSRLXGmRiGDbg7DDXG3WjHOA
 Zr/+iIxofb1hBxyhCJg==
X-Proofpoint-ORIG-GUID: 9tcqc8qB4Z6JSU03xXsoYBU0EpE3ItW0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfXzC1W0nSPpYjS
 qk2CvhRYXqbEPUXb8BngPrIzKCw654D2tD/FcsaBPU3naWY72ZI91gF8ZFyJ5AqJYjNE4u+xvE4
 78pwEiaowQaARomr6yUXpNfXyS8m1Ow=
X-Proofpoint-GUID: 9tcqc8qB4Z6JSU03xXsoYBU0EpE3ItW0
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa93e9b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=lAgNKBcoAAAA:8
 a=3rLakIzlw2t6kR_yyQkA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150185

On 26-09-15 13:37:03, Marc Zyngier wrote:
> This reverts commit 5a8b2cc36e796d595c9d97eab23c2be22805cc1c.
> 
> Since the introduction of this QoS change, X1 machines based on the
> Purwa SoC (such as the Lenovo Mini X) take a hard reset at boot time.
> 
> Other machines based on Hamoa (such as the X1E001DE Snapdragon Devkit)
> end-up with a similar hard reset while under load, most likely due to
> the PCIe ports being starved of traffic.
> 
> Revert the whole thing until someone figures out what magic parameters
> allow QoS to work in a sensible manner, as a usable machine is somehow
> preferable to one that crashes efficiently.
> 
> Link: https://lore.kernel.org/all/apgeBNSiP01YfNcs@google.com
> Link: https://lore.kernel.org/all/86ld9d4h4n.wl-maz@kernel.org
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mostafa Saleh <smostafa@google.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>

Sent mine here:

https://lore.kernel.org/all/20260915-icc-qcom-x1e80100-revert-qos-enabling-v1-1-cc4ba943bd9d@oss.qualcomm.com/

But yours looks good, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
