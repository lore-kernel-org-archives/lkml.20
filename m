Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559975;
	b=cGpCJYxMTCjjDFo7oQqB9HiCDu+bG7sQMIdthVRDtuVENBVbAfAGPc3/PytshCUYXnl4
	 rgL6jbhG5unoRTD6gZg/tw7llhcQpYvIS49nZOi2UyHWYRNaa1O7Feec/vya7iEKq3V2k
	 sfFmHO4HovFdrv5DTptpVXhmOukHVjTyw7UdlBa/b5v0Rh6I2HrWhJsSEU75lG+965xcq
	 i7+hfuBwG4ZdUEsIL3MNDfdEiGOZn/DDBaj1C771NH+4a2Y8c/sKceuU0cc0fHNroS29A
	 ZJlUhjBI/pMpNuKindrZFZ9ZPkk0WScgZc8Z96O1cuYTDbNW8MZypDeUN1NT5+qlB1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
	b=RQs5MXCTENr+Qj3SSoDwMRvAGOWFVtxNlnBLtjo5ucQYYDMf7AiSOip5DTIQAO7VkdJE
	 Aj46jM4tIsMBulEinhYGRXAutO1d/hwZy74RfSUV2YPQQH8/PkPVkg3kbgb6k8xLu5isj
	 VIGaA4y4EGQsON50lnC5/ji/NC7cRgQ8TkhV5nuOMSx2OfQtvp0NnAEjFC2DOXQ/MnL6t
	 XUjs4V+yNUfngLHC5n2Q24bWkdYaFR4W0XpXM89ahZIToppMeJeVjPe5m5Dcinqz2kwXb
	 67Q2X6PlTAUg+R00FwoErdep0RN59Uzf+JX7FSlFjnDvuNHdpoVvcuKmRcNg1If+mug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMRKsmdC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFr9r6gi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F90606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F90606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMRKsmdC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFr9r6gi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HPvE41443480
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 19:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=; b=EMRKsmdC5woX7Uxv
	jv57183TZNgH9vN0WFV4bnXr5Lmg49w54lRk8ykXQx/Zjw4gAxQT1EWaIgqM/P3D
	G+7uHDZvRj7auKNKo36OIXN4cXjtNNLH6mgSG4wprpXrRuztiKLel4VbJS5ZfNzB
	MRROH2ai+wG8cj49u0REDHUD44jB2YRmkPJAzJhYaqtQ58sQwaULNfs+ocp3qMRF
	qD3SMortdMPufwuzEmmSBWNvofAV0t3U0uKdWVxIAEgRcdPrz5Xj1C5PTHVRWEIR
	D9fp/K3dh08G8cBrICIFFobK2KX9wIsS7iCZbyn4lm2+lfE14fLjaMw2tImJByds
	Wy5t5g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8duc06e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:06:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99064f8c7efso1258168241.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559973; x=1794164773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
        b=JFr9r6gi2riSRIxDhhic/9hICwhKLS8MmpV+HZkmK8pRWr9ylADOzWp9sIlYgPJL/M
         1PhrRib6Jm0jE9VorFV/YBJxVd6RIJwRqWoEUks7pJMihu5J7Aqee8cw2zCZe4M16SUx
         MqmO7CdOI6JuFfa3hy/GwjLjyCcHTd95NMj1xMPUjFmMp7MPf5JtJY5db+A7hnz7dAg4
         +SxBJqhD/l6VOru0sOi1f+NeilU67YBNAgk1DZ/7THKJ5NolF3UNZ8dbq1FRjDi0u+sb
         AyZItlAcBtuDw29V/cpCU4GLDYPp8jz9a5+UTvLkmM3awKauLh3aLY+vnzoVJ6uOD172
         exew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559973; x=1794164773;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
        b=hqVauPVIwdL6ORXxyOhiXucPdYkt2yjKnQLtajgrS6Ysw5JYPBj/eQRjWdBAyuTrvM
         NYCTfgENPZwuOMDs1PU/z+DIcCcW8pVNzpIvmIyX2QJUje2ua0wjdEkPFtcuGOmE7ulN
         N55KJZcdRHJ5/XphxE17RhwfoRA7MfZ/GRrgQPW+d1LE7Vv6hbE1gLleU/Db4HafNo3d
         oFOJ188MIThwheIKoEgmv4jBdvK8mLSD0JxwyLtQArsoekxV+dPUlISfVeR1RbDEi6RX
         MPDmmG2x+5/sc95t2N9glk2BKcTUistqEk+u2LchIYw5+ZFfvGglhHrLKoahRGwNOBjQ
         0xAw==
X-Forwarded-Encrypted: i=1; AKwUvBzm4f9nEq4yUvFRwK8FRso29BcjyWTtmXXHpf6utpFKm8fr0evE83xX6JHikhZkaB4eo3pWzJSlMCsI7us=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pH5kHewXRHCn0Ua5gvhst+YREwcB9EJocVwqQXsZ86xt/AJf3
	r6iQdGcs/JW5Ertgvn0DeXfDdUUW+N2Lx+3thVF8qT7dC8niPwwukJC19iH8vrfA66uJEC0EMuL
	b9us3nYpc+sk7Qb/WFDmhJj76Qchaktk4xL4PjMVhPhGaRLf2NUahmMam0/cAq6pmXpc=
X-Gm-Gg: AYBFou0Wr0TcK76ZFWJWLjoXCpl3R3MhBEbpjOeZtPrOVG4loMTXZ4XC9ER+7wTyPRg
	Ac8Y95x5vWyFLL3YL+fbWsA6QMYJY8YB4TMtPHbQUZtRkAp002AxE6cIckhvOq1C18qILOvOFRh
	hWFA8K9U/xz7Vtpr2N3fqtXen73sfOVlr9l8hui97Uch6aM79J6GvpXJTyaISXmItioAb6cVDfp
	+pHDu9qp2O+D5y5omR6/MSK+xY2Vi5yvU6zynDWq5WYdeleyx2xiChXVa+NGK6VlysoCmMuwNVW
	P28o9GV47yZkfB3nhdmRSWIqIrkpBJghQrod6DWvoYBBJIOi0XihUY6VEt5C4sftDWe74Mdujnj
	Zcq1T+0ZVd+rKC2T0mXDVbXd7onlrtgKKtBUdT2I/DT39sRO2xOx5P5g88LjfTQd0OoI2YNJ8sg
	==
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr3652902137.27.1793559972752;
        Sun, 01 Nov 2026 11:06:12 -0800 (PST)
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr3652895137.27.1793559972307;
        Sun, 01 Nov 2026 11:06:12 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm15616335f8f.20.2026.11.01.11.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:06:10 -0800 (PST)
Message-ID: <07cf366c-4efe-4a80-a094-5ee93a683720@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 20:06:08 +0100
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
Subject: Re: [PATCH] soc: qcom: apr: Reject packets with header size larger
 than packet size
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Mark Brown <broonie@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae78da5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5t2Un5gMkzPXvGO7pNEA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: J1h_UMYhU0nbw4v6hbhug6Hpxpl_4A2f
X-Proofpoint-GUID: J1h_UMYhU0nbw4v6hbhug6Hpxpl_4A2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX7xG9w0yk+1RS
 9PLjjRIoIeNefOzVl2JsxB1lgNZS4i3Fk8hEG+7zBmZsLjkTtBy+Dy5xR/2bHwqzuGPUpMAM/gP
 ycVqwIns3yKQfNSkH6qkkWgJvX/bXhq3wv6AxrIq0HV8CrGC7A936CGNitIm0w1id5l9DuytzE8
 GjwY7Laa3M/9I72WWIWgnWs2WoE9t83zxj1NSpsp/JcmtzyNiLQLMyVrnBSXwBQZyU7I0uxlqrQ
 HZ3dUBo9DT8+RUctaWHPQ0YaPTHGxayd2OZ0qtHyKoWextGcjBwlqXckEhF72A0nbWrDPlMYneC
 tkS+miJ/4yeYGgKh94Dq25i5IIivVlAnA0ZGZfQsplMJOE830lIr6ES49SXaCiPzti/9lSSJ8W/
 B1Fh9R6CtnZn3JAvfn2J+KBo1XGVc8XEURCqxq64XbSRAB/havq9DvjnFXmJgLkyRe0haaAMk47
 gpjBFjJRTRiAipow47A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX2IwwTikS829V
 1oXgeSjgnlQ+uMKnOmgIiaYNNFKI2Hk2U9rXiYXfK6MCCaAgXovEEId9ffpcYtjJyWNmBVJYZ8A
 qFINiDOp2B3VEhv/+qAZu8EM+x3fcso=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010076

On 01/11/2026 18:54, Krzysztof Kozlowski wrote:
> apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
> and the packet size separately, but never check that the header fits
> within the packet.  Both sizes are u16, so with a malformed packet where
> the header size exceeds the packet size, the subtraction computing
> resp.payload_size gets promoted to int and becomes negative.
> 
> Further check "resp.payload_size > 0" would fail, leading to
> resp.payload left uninitialized (stack value).  Reject such packets as
> having a wrong packet size, although unlikely that firmware would
> produce such packets.
> 
> Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Valid Sashiko review.

Best regards,
Krzysztof
