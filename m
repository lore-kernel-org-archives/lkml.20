Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573851;
	b=Zzy19Oij4kp1z4oN3KhIxW4K1NYaVEgaS2E8tP5Kn+2gT1p72RAPpCJHYG7A/YMjilCj
	 koCF5BBtQVBaB6OKZuVhstHpnhaQeigum2l9Nikdjlv1xCexPvwOMVEYR1Ko0WjzkGQew
	 gTOk+eC9ixtE3rbVP9t2aR52CUxe47U56LZEJt0xJI3Zw3BJY3ujcp+bAiGiZ8gKslt9Q
	 md4ouPP5wT0HSKKyHmipZmNLEnuG4l3/aqaRcc2648x47O1TaVviAka6rAorUrTZwoWgI
	 AO/SWEoSZhZRb4+jio/Eligx5+FcOr1NrYdkL/WLaSTeM3JOelmINCvNslNxAtAcvPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
	b=J8UvbefcoYHT57YsNTeVzM0DSwtJt2ezgt6JpHuoxetdeyVvUAb0EYA/JSZWf0rb8vVR
	 rD057fKhMFm27Wc9b4yt48gsayDBOkTxPJMfUbaKJTElN4rdAO9w0SUfZGzMs72Hp3fz1
	 BIfEe1NDwfbsXqB5HY6NbsR3mn1fT8QX5q9whIB/34+J8ydcOuoXwvSgwoUep/28Gix4I
	 fd++vUHeUbwXT4+GmTJd+M0M2uhPM74xIIDehqTDI1JSpU7h0jwADBGchQvIMMnGQDclu
	 Iel6ZLjW5jA0VQE4GUsDONq+HZqKnIk59OMcm1yIEjRaMXA95unaPAZ+VXAr68mFEDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiF2H0On;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDMCEaBs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48559606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48559606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiF2H0On;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDMCEaBs
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6CS793354
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y6puuBI2ATZ/1hU0RMS24Pbs
	5fMXMv853wpEmKEbFSI=; b=OiF2H0OnLtVMFT2JYGZ0lp+VhxtsdXfI0ZS2tpNO
	6pxEI/ocEWQKgUj9DItROwzCGDh9+pxp8Hd7A15K/JVV7lxme7Zpqpq/rhwOhSei
	HFW/eBOkZpyRzblEK5s4haxyyABfXvVw3bScOsGsMtkZsdaOqpeT+8rIatNfQ2xE
	LAIY6oUfylQJYY8ocz5DVTmHG+Crcbwpg+sxZe2nmk2OUA8U5BG8qkOWaPtUqJSY
	L9PfZ6rh0vsVs+EYHojDG2B1DpxpGwOoZM0+Qey8WAf7RiOEAvhGnIGySKZHs/Gi
	OYtTCIZYz1mgUo7N57Ih9Ye9i4u4A7/kfmIhwt0LPjUCuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk6uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so116978985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573846; x=1793178646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
        b=hDMCEaBsk/BPKodV8aRmU2pM9uvzXW5Jz0WeYWVUFVIyzBqS+WJWcf72dicW4LNkKm
         cSxPVN1EV0tjP5V5stCGXYXQkThxn5DoirohAu/gvxcXiTJUpRE6FA2zYY8Jy89RB49N
         L0C+R+wRxUVUr02Cn7MmflYY8QBq3JwUvNlYxjNY498wLKS+DrzHpTQoF8APdSn/cEA9
         1RuXWCARfG33d50vAAKt3bGoBPRYX4ZEPoOpdw3rsIduv4SeHdm+4kiV5rG3pa4Zalw6
         w2Itc7U6NSTRT8ZD5Q2eVvOWzIkh5M/v0soQ2HMdgc97KTI0cJYrRZRh5ehwwMDsNnr9
         VSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573846; x=1793178646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
        b=XGgn2ogy2kFS249F+yiJ9aeLXVP1tjg/xgyp7jaUWlq9G0Wwg7nRlGPaTcDvE9R0nx
         TGdgaWo+ANRF68WlSjhDrg3YoAhr4BSz5IJRUwHCzmK688GAvVvAzJ5dKeQaYKMJbiYW
         aZm9xlAQ/xR7Ec5dnjq4H9l697vCz4LgZLwfXDJfEtwWOd/bjXcG1OnZ1djMElQ0lvk7
         8T3lKh0m5NnlbYOTrbRiLeNO0STBTrUvVHGu8mLc586A91hj9+7dB1K/U69Y219mHxjG
         BFxwil1HJVmqFuuJVlQh6wBIDPcem1iHxr1GUINpKzlm/o6QeY8otoEUsceQt+6hauck
         Bp7w==
X-Forwarded-Encrypted: i=1; AKwUvBxqbjV2JYHseNMF6U2NHayToX6Ckll4GxjIoNTiQopy95yA4AhC8f7/nEW6tfM7ZoYdyD0X/dlexRB5UNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxpqrMoXWDqvD2c8AeMlf2lJiqQtQgSPXWjSVZHSgh9Y2JdT1n
	4ZLlhHP1ncGHCGhO2ucaczsHdD/wLk2gXgphZxNDADECt4iEYG62VtrtOTjoSbY0DQPClCfVYOM
	K6GxRgIW35/293s4XlzZDLN3PJo5yCMK0VINAynvIdPinfGYfKZVkq2lT5FRHQQFlXQE=
X-Gm-Gg: AYBFou1Qo90U1DtTyZyylFuu8drNVyZRaB9qGCMA8DfZnwxp2iZ8Ew5oDwAOZlPhyhC
	EVgISMrfHTcNfibhNv+t9FLNlEt0twIhSqDzW6OgFKOekC2QZ91NV7PMghM+3b9tJRPkooynnFy
	kzswzDVVJd0Pb1Cut+ufi3bOl0WY8wxmi1uDFL998bOSZcKIZyCGjkP0PY6yOSgN68hQ8f5z5Il
	vzjufWOnX5CxraeUqlQRtz/cJaWuBcRwb78kPHha72/D+yhSdaxPXMiGzB0gBQ6Z6SFjmPEtnPd
	X/CGX+WaU1LgAZTFlhy+SnMLBZZI7u8vCCyM/OrkcJ42ZpOhXyOxH2IpBh7+yjY9OKB2r3vmvCo
	UVwkTHXx0+2ki3lYt
X-Received: by 2002:a05:620a:17a2:b0:93f:2658:7e54 with SMTP id af79cd13be357-93f57f06332mr317713685a.3.1792573846372;
        Wed, 21 Oct 2026 02:10:46 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:2658:7e54 with SMTP id af79cd13be357-93f57f06332mr317710585a.3.1792573845821;
        Wed, 21 Oct 2026 02:10:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm4195689f8f.59.2026.10.21.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:10:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/5] arm64: dts: qcom: nord: Add gpr node
Message-ID: <3j6nufnupwtmqsf6jwbwgcpdyklw4yja4jdxsbz5eitjgooclb@rpngddb3zcvy>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX0eaAwD7MPMkU
 bcW2ClMehttkFFjRvyd0uZXB7CI+YrPQhoFon7HgDw5aqEIfJgdo/bDDkH5kfKFdeC6AtRmkulf
 OrZvMRgxu9dIM/pBePvwd1vTEKFD3tk=
X-Proofpoint-ORIG-GUID: 1BjEtOFUm7PlOyxeMA9b7xGpKYMYRUhh
X-Proofpoint-GUID: 1BjEtOFUm7PlOyxeMA9b7xGpKYMYRUhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX3uPbozdi3o8K
 heG/QZbcYfnRj5Wj1cE0oburhiMIzDWv6F0bhjTsLz6/jFoo63ui5ZYToLraKmELOEYrZBrNbLa
 A5kEe1tyOAQLBtGK3qIH3NEBGEbC3Te0Txq8LParjApWxQkjom1zM/j5NtdxWbIgRzX6Eb85jfD
 dxf5Lq2Ez8CUjBc+UcWA6xBASPp3x+So0xsSjOdQCc+q/n8xNjH+3o1JUv02ipNvLE0KqjALVG3
 /fx716C8TpF3LqnwxP7uKYzi2beSNjkpLoBhwfFOfaW2jqlvywJmurbjy/w1hvI7l3HxmhZkl1D
 U87qalMf653DR9jT8z6a76qpi6m7jS5LNSrE64F3nXof755JNjeJ7DwvzqeY/bRLplzz68RXbWR
 ohfYJfk11TQQEQYPwQUUPRFpglhxjNuazLCRlJhRpujV25uLjbgTEAt/ym1NMhdFmlOhkZCBv7d
 v2xhlMLt8Ix9EJlTRhA==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad8819a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_V8OVpiSj6jlPu8_cr8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210036

On 26-10-21 15:36:30, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the GPR (Generic Packet Router) node to the nord SoC DTSI along

Nord 

> with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> audio services. These nodes are required by the Q6APM audio stack to
> route audio packets between the application processor and the DSP.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

With the comment above fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
