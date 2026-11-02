Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612805;
	b=0RIRLSTC88/GLIAeAa/KWK2B141OJiz4DEp1pg2wSmWrSn9TeddbOl+otZ8qaptlVjsk
	 I5ThXMFXBnPa2pdjEw2vJ876CDNOryS9rB3eFUXbVb+JTH0xN7mH4qSCEft89dJN8+rk1
	 T7WQEw+Nox7fXmRmGIACj61EXW8pS6Cw2p/8lpXlg/oK2OEXl7AZq1dDkLjvHIgd6XMbA
	 /puE8JSJW8pvgyVlsYMNbjlBB/Oc/p3wmyvk93ezFIQHirZzf/fNvGxuICKblswP2wvK5
	 Dr1q4NlMyre81GPWsm46yHKaRcvJaYWFE/dSynuWv7RR3LYnHHnO0Fzj813gii0SYxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=;
	b=QnswtpW68sbT3FXV4gKsFUJ1HBCKQ2YwFWDkhDgRcNYTW9MTw9xnrjcNXa2oeIJu6lqU
	 nIJ/JoR/b4qmb0G4iBaP3ycQ+vAyAoR2DKBfRvWRUF/myElYUypOxn8TC9mS4zS9dtPzG
	 LFdDIuZMU2I0J051mH8DQBWoEGMijCa3zEp6up9ZYR9+BgDVuA9o15g55vLRR37WjjAy+
	 tkz2EBK+W1ucvmBe5u/BkwodkxnqGPnOUiw9f7ZJ2RkGYVwEO1fD0WneYBzYzxKBXwRTr
	 htYT4WMEnjouDStczvm/MT6wVSTZ4qgISGiSb51Jy1PYBueGwDLNc0FRPeRL8heR/ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiFHV0BW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b6NvPEuB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6051606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6051606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiFHV0BW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b6NvPEuB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AAKL4039376
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=; b=XiFHV0BWymHOnOSJ
	L5CIiFfEbbxeMZBbp+OurSVw3H4tFAEof8W0HtHYt1nN5zxF34dTDqLRM7aMFmOV
	659auF767JgzjXGYfmiXAwi7lN3VtajsSGb2ImUWD5MBsdZCZaODoaGEjevdw/LP
	BGWG7J+ce3rNewtPacFuxeiM64M7UZRgo5qMKgOCFqCf1/DDJzxrGR6e4oHGZD7g
	7sIMJLyUMJe0n5zHxMLhRdrY+rI+/Y14Sy00686LO6KFWTy0n4s6ckiweooPWR+k
	vFyNt4dALNRT/wg2HxZymuCklN9DJaGdKoL8bVPM/ND4P4P8THW1/OLFiiKLaDfB
	uviAHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18g7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:46:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350173dc7aso7575291cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612803; x=1794217603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=;
        b=b6NvPEuBrEhLCXkQQRmrtqrPxQ9m8RCN7Nll6AcVhcMNPa3G4OBiKLV5MolXXmsgHx
         VhwNrJh+hA5XFnU2sP/gSNrro1KyCYFZ4BPMX6hDY9a/zZs4R1laykiK+wdhJjHGwMFL
         8reUw8x9CRKYgimz7R45xjvqKSVA6vpK9Xh43PR1ULEsBaN6d45FpHZofdm8QTP8MWHr
         2JGOk0ImoT/80xMiDisKcpoQ9E9D/ukbsMpLYAHMuT8GFhMk5t3zpCwjKjRR06bjzaDP
         74oagh4HKBXFY7RtFZBjQVrAjlAddfiJnQqfOgwIw6u87Dux+gzSeEFY5VjelqgyTOvG
         /OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612803; x=1794217603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=;
        b=h9bSxtmPMVuouFiIIkM6edmk9QbEi27CHiotaq+DQbZBsgZ/X/Px0rycw0Emt0UEFw
         h48CSMWOHo+tAcML1H1ERuzAOIL/cnLSjb8haj6fnIZ8giVJ+iS9G+/p5GY67CAKnBgF
         ZPWXpkKHPwr+R5wg9skbDeAQt7lgF+LJWD6kooD3uJ1RL9tbd8zNy5rdT8/SwOvvDzHX
         XxbiFfrcyD3kATpIYH+fvohqHbDlBB+I9uNkSbA0HYb7WlL5M+g5hC3MA524QCr7Y8s6
         c0HjNCHimN/m4cB6izknYX8vNcYHBW8LTlybqFCq7ZCVU7rqrL3KbCCkjuIJuhwKcxgp
         fqPA==
X-Forwarded-Encrypted: i=1; AKwUvBw0xnrIlDBZ4Bfc/4eXO97BMp249maKYuCkg7U0K+F9lHqMTHPwDn1+kR9dj5EytuxIBQIxANOJftO/eQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ0N2ZtDACeA+irdCrxb/7+ZSisOF/6VoxFf9qHucrPwbuogl5
	4f/OxiBtCtdQRdsZKy2rqBfOqanvy3gXOw3xb1/1Fn9bUacxMEGAwhsxhDAzivdK1QpTL5KEFa0
	4McM4djLi3RO9s0B3v4u9fUZEwyvsbXkjCRwesyOWR4fiqi8qbEXK+jTpNBx3baKX4ZI=
X-Gm-Gg: AYBFou3aghHzcvOQUVIGY/Rr9mJokg6jfRLI9Z21exxTfJU/+mzyrEU8MD2uj2cM6wp
	/yu5IZWYLyDh5JM3cheICey+2o4neF3nQKR/NCwC5rosYKEUr2b6KuMswvUKKASmLEe/LWV7fKy
	FpyJbL+4QtGHoJQ4G0gRKVhjsb4ADkw+GQP+r2v9kL6OleXKQGBrUK/aZD52DGwqhD5/iB9lUDo
	L2kO8bRIjR2pXZdex+P9LKHErG21OW/Cf/mL6VvQFM5Mi/CPLW9MOTnESrPBkdEotQ1B4aHdAjB
	bxTRWtaRP08P8sy1QQ0Xol3QZLGApvD3tkeoXRQsGZm5G1U0u2K+9mz5Q77B6B/lIO67Bv9St8b
	TLU6Tt+KaIBPd6uOssz9qky72geDQllYcT95tm7hoEFpbWM66qrG7K5GJov9vLr8may29fAU=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707618285a.0.1793612802989;
        Mon, 02 Nov 2026 01:46:42 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707613985a.0.1793612802474;
        Mon, 02 Nov 2026 01:46:42 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm362069166b.64.2026.11.02.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:46:41 -0800 (PST)
Message-ID: <798f1e79-1771-49b8-9d4d-705b013255e4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:46:39 +0100
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
Subject: Re: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Th12IqmNYOFZ5BOS4d2je0pMUq9QKtQd
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae85c03 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=d7qithtI8vA-lzetqicA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Th12IqmNYOFZ5BOS4d2je0pMUq9QKtQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX4eDuVkRlqoNz
 H7GCw/gLzPy42rB7OHt83c/wfpjSbpYLtZR2Yr6VmS+EEfzLfzV+5s52v21DAy28zQhHrGPQEDn
 4E/O3jQuo76w7b31AdEOhzB841I7DJFKIalOpLbG25YOOtRR9eacm9jQNPby8Lx7VOP4gLriTxf
 wtdREj647occc+rbnBjamhdWJQlA6++0B6Zn9hgU7b8MKG8TGoocaMzYPbZhzX376Z7ib51+OFe
 AD0PO5yo6VaNY1/HHejIPat0b2gkl13R4+MfQ6MDQJot+Jc94ImeZIgXAozoCjId0kFJJ30FmPr
 tJH2i+naK1zarvvFmvCQGuDaFk1ESaJQgURhsBQwBM4ayw27o7S63x5TO/RUv0KhXhlX72nbX0m
 s9HnNWpU1XSs9njy3+X5MEBBqwLMNgSbo0u43KHH0Thmv/SLWTtJDYm11+3dN1LgxGd/EqAe9gN
 Ewqv1q75hBZM8PnMqdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX+PphapaOGwZL
 fRmHtT1kYuRF1se1odmTPtRU4u1cHssnV8hYKd/lqpYJyK7JxCnGxR6UxxyG7uj30CbaVl6Cc5h
 Nls2WFhWjZ7r8uhxMKG27cWSHx9ly1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

On 10/30/26 11:04 PM, Dmitry Baryshkov wrote:
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. qcom_iommu has no
> def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
> buffers end up mapped at IOVAs of the unused default domain and the
> db410c GPU fails to start.
> 
> Use identity default domains for these devices, as arm-smmu-qcom does.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
