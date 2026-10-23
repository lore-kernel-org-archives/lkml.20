Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741542;
	b=VztX2p2RjjDIRmFNFKrv2cuNZXhesOy2hgP7hnHjNeRMCV1Utxg+hT4LzoCOMK0Y95w/
	 9gdI2Di/LYH/aivM25lrmq755e4mfe+GRliMCdJt2NyoLRf32EBx2uGqumOZc5+65owaq
	 uwolW1+OFhfbTXSBXC/X4+aYKLfxLr/C6MKTK4uRB3KB9V29W+46DnKRdTGh4d6vedgEm
	 K4702aMDciJ+ZCPxwLEr6/Dy61tfRqjEeyD/q723W8b1GszMMOZhY/6aO+unfOYtAXr+k
	 IIQW+0aY28gdmtC4OCB08Ze29p4UAqXJAbDR7SqToI9OU4g7b4VtA7d/uNNBX+gDQpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IEyRBF8vnbm1/HQ6cJJHHKiX1zU4rFzUPX8p8n7sqjI=;
	b=x9d8ruTCSIk8ZHwWDsUQr+IqcJWjbyI62MaSx7Uegpu/OSdAQSI4s9DuYJweO3A8iRm0
	 4+xCa4+FEPjcuetQMlXkRUbjGAGtrr1/XRw+z2q598d3R/EuNclh1ZzowCQPXfMc1P2m2
	 qMIvu0vWWHYmJNYVLsZa9EfPLVQn0N6mf0uxW78u/k7yweskn1r7o1G4fhz6EXjshgdPF
	 fi4g40lXjskrIAJq7UNyKfxpR+lmm4QhkbGpVmk3c53euqxiUCTansRlhB079lhqfYKbQ
	 8lOjqnRKO1Gbn++jG5KKy0zj3pWK/Aqy83cWTfxwvUZ9ct8FeUMaJU8S29YFXCUN95A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEXLeA+4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LswKgGdD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C22606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEXLeA+4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LswKgGdD
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FN3Z2572534
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IEyRBF8vnbm1/HQ6cJJHHKiX1zU4rFzUPX8p8n7sqjI=; b=TEXLeA+4HFpXpAk6
	6rglDtWweoCysV8dXNKA16v1pE6XMKCS3cdS/6WjmTWWF+V15FXAU0/QCmuEhuCF
	JpN9D5eI3wHoosaWB0RB/rc+7bv6UomnSUCZL6X88RA2AiMeVlUA27evPW+vruDo
	AtzgGVW6LK62uovC4vH51RaEYZlyxgt9i7KLr6QbXrME6xQTzo4cE7OErdK8EDg0
	P1HeE5uC1PR2gFkOM+o3kacgJ7I6jVnxFMhE4ia7KgbZwNb9BQUQVY9tg3LOLMtt
	L0cdmX46eGSo2J8TmJqNgnKsxLF94sxf9SYTOi0vJuEsE0q0E/HUmVKi5iU+4D7M
	V4Tryg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0k3rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:45:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso1510851cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792741540; x=1793346340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEyRBF8vnbm1/HQ6cJJHHKiX1zU4rFzUPX8p8n7sqjI=;
        b=LswKgGdDU4Wh63hLYjQM9pRpZNtdiouDxKtpMCvDbYlYuwRB3C6cXmSnyVbKDSUJP1
         5LJ5HKYTo6wot1wCIplwUOiP9iGkaIcU/E7fOpuKP0q7ku8xavDEa6rfTjfMD9ma9/qJ
         7mH/n4yjvixlcQSeSBTxGRPlUvZtaBNukPOj4mG8t+Hos3E/JzxJyG8vliiO7L6UV6sh
         BS4B/6ThdJdnxRQM34bLdXhNip9tC7jRCwSrHwvBdiMb/07OJggEG4j9CofO4ObT9PV5
         Eg+aJF1PiwUfvTvgqpFgn5juTfS1vLeAY1dNZVG5BfmEl4HK5e1/IYLdcVjheuM4AyfZ
         oKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741540; x=1793346340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEyRBF8vnbm1/HQ6cJJHHKiX1zU4rFzUPX8p8n7sqjI=;
        b=XRXER4sh1Iw9oWeaq6llrBW+5ESSWVhvtZsH+m3DQeWIv/pljGleaiyAIQdX3+hp7Z
         O/z6wB0y6bBvs6byx6U2maSzxg8RZd+W6VqJ5y6ym6KcM+e4lji2+uOm8rT9GtK5quL5
         TtXyN0EIeDSfUUxmfcIK98JOsLQGmtt2IpMtnaPFM3JidcXqUSiPYik4SSqGw27rJuH3
         9E/FoRYDgMif67HVOzx26+QpQ11he5iJW4JWzkA3on+bVxwFWjS0u5RQ0rfpxjHNkZLk
         AjZ1CmMY5Y35RKr5SxwtpP1VRveIXN7eIUJN1ijzBJoRMZWvA9vUX7e5VcRnuB+C7ZtL
         +WFQ==
X-Forwarded-Encrypted: i=1; AKwUvBysK4r5lI5a92u1wz1m9SSn7aplF7/i9DLcyJOFzW9vEi7C9dhJ3InrdLQm1UzhTFP36o90xnrnhr9xN+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGaeLFVlvpAd7WvU7iDCKRAEV2QHowkBRodC3Z+ttPx3gfjGzM
	OOoooUUkgnEf1meQDBWr7akOU0dy8+e+UVh926Snjpb8NeyFDokFMLkX0iZakNjsbDe07T9fjOz
	Xl9EDOrw1B/e6SWmUseYO2+kzATs16lqHfMhwcLDECGi5sbu+DjmtbqdzVxwIFYtyZcM=
X-Gm-Gg: AYBFou19AgADMMO2T9cP8BQz4VQ5GJBH4Ealja11bSiThpjqL5k1Iw0KzQe7Psld6LK
	/rQpxxtaBhj3mIg0aETzeHmQtYVm7GFpIOZ8Vhnz8SUqYoWCmJ7yOpfcxw1qugEKJ05c17WiNuy
	QvCWmXwcflsJbmOXbLpWradU6ALs+JMZHCEOMT/dLPA9vft6909+OCjzyBhArxJ9E/amf3LDRWJ
	gMi4hZTYAfyKl1x+51B5Hjujz0qrYQQo5Vu7O+KZcNcas3zqpOWHthBHvALHE0pA1KzDn6DGXCU
	s0ShWjfwm2VFS4QzWnedLkxcDPpnr1YN6z9+kfYwph/B4tY0G9z7XAfmXP4G5YyaNMOAv+HF0h3
	k0qjqb2dRZ96LPDwX60r+yA==
X-Received: by 2002:a05:620a:a997:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f6f8da8f7mr285887785a.3.1792741539982;
        Fri, 23 Oct 2026 00:45:39 -0700 (PDT)
X-Received: by 2002:a05:620a:a997:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f6f8da8f7mr285884885a.3.1792741539484;
        Fri, 23 Oct 2026 00:45:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4ced7sm70249066b.13.2026.10.23.00.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:45:38 -0700 (PDT)
Message-ID: <a3298437-21c9-4b91-94f0-417d92045afc@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 09:45:31 +0200
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
Subject: Re: [PATCH] scsi: ufs: qcom: Reprogram ESI after a host controller
 reset
To: Joonhoe Kim <26rote@gmail.com>, mani@kernel.org, mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com, bvanassche@acm.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022165006.1275-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022165006.1275-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YyTJnGi9dc8yS8PvsRJ2T-Ward5dto0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfXyp+JxUFM2zOK
 CBx4nLh235XdbftvRIZX5Ptp7ITeocx083PAvpn9/zqdOGKo8NnEHPaUIfD/ru5+DmC9f0qRkqC
 y1R/wvFtZBp7ymc1dUn6XaGPVH2wUeo7MUQ7/QvlBCEfzYsmsYdHQvZ0B9V5PHUUrK8lm82RU7i
 IOWvVkNF0xf1Kq6SaBCgN9+OWc0fWW2Ruf80/YP/0ZfIz4NDAEbdM9jsWyPNshANqb8fMx29H6X
 fk4NzeNlV1nIxfMF+km1Nasq7UXdeUqldSbAlIlCk5ypIifEjC9wHKR23RfqDwoq+cL3og7qe3Q
 QYZ/sdNDZxCPNzY59vR2Z7cLt7b1CCqounBcpnVQDJevZ/sl9LC0pWlowGwpm94hFOhUVShr7o0
 P/K57AV1CpifeXLj0LrybO4yz+wHHuW/JSd5hnrlvmPSj9Mhpl4bnCyHea1slDvWIGAcCzNwUuS
 jL+Nn4J3o2sNb9olrOQ==
X-Proofpoint-GUID: YyTJnGi9dc8yS8PvsRJ2T-Ward5dto0T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfX6032+fpdS/SN
 b48VveLHJLvQ1s0F23YJ0zj64h/nddQMPN/2bRrI5jRGzQI+rqLkOEye0gbYancQGDthfixXDxZ
 W4c+s0KkoY0bOnufGem3kl4xAN9TPcY=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb10a4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=PeIWiMRIC7RC5FwImpMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230030

On 10/22/26 6:50 PM, Joonhoe Kim wrote:
> ufs_qcom_config_esi() returns early once the ESI interrupts are set up.
> ufshcd_config_mcq() also calls it after every host controller reset,
> which clears the ESI base address, the vector mask and ESI enable. After
> the error handler has reset the controller, the completions then arrive
> only on the legacy interrupt while mcq_esi_enabled stays set.
> 
> Allocate the MSIs and request their interrupts only once, but program
> the ESI registers on every call. The MSI message is not cached for
> platform MSIs, so keep the one written at allocation.
> 
> Fixes: 519b6274a777 ("scsi: ufs: qcom: Add MCQ ESI config vendor specific ops")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

I'm not sure it's related, but with this change, do you still need

https://lore.kernel.org/linux-arm-msm/20261007143716.2161-1-26rote@gmail.com/

?

Konrad
