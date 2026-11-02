Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612841;
	b=KCdyv0R81XF+uDxlHDJPiw/OeYqZRZ0EkZOsPYkpRZSe+lTChTzIXydks/6bs5528aaD
	 LS3aLeg8j6Ad3PUK7PSAYCIFCEkYMy5676VE4hg5BEg1mm9aQhW3BkeXqDUxJmM36bpGC
	 WwYVrPfsbZJKumTSClWaCLF31r0kWQdl0PlH+0Ur7nnH58F2EORHcD7rLcb+4oN8EDtkq
	 GmLuXeKIlpk14isHL3HnoBqMjMBE/loUDXalYdPbtgeFaKqj8H9fd2sTp4wKQ5W67NA+b
	 rRXp3zzQPROAwZSS0dvCxB+1Wxux32uOD8DfVVLMhoHKT9elJQ2PRY32+XH4fCqvYww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=;
	b=UCHSblrRIKksDkeo0k36fy0306173iRcwSJmhAjRfacNFVysWGdsKHlFfgAaRE7VPPQT
	 nrnnnk00uTLge3y+XAEMRB7htYWLJKglrCAZONwWrPsnND6nU3ZyQ+zc3NrxLn3kPLYH6
	 qQLk5OiXN9+g+e7hG0ManQhkORy/nbMAnyTQbUrdR2TS6R9G4Uw9JsgYeIWMo0Rs6BuXz
	 YyhQFe5iF7lHqEOxQ5pA8+hGuQXbIVl3VF6mY+j372nDElP9GP52KXVVGUopcaOikXZv5
	 gODqv1dlEhEFh82Pdbj56jLNcMCI+GMTs/RauDz4Hy5iSUAkhP09HNOUdfBOjy2GNkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSnohwWi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4ThyiBE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB0606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBB0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSnohwWi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4ThyiBE
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B2Zi4015097
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=; b=jSnohwWiUBZ9NtOR
	oHh5Cwu3ngWVSgEcNRLn2xJVxoWzJKvbteDYpb14R2Eg0tJZ5IWHEp5j3q2VOx5b
	kKWIN8wgEFGsoHxjzPvqxMGHmmWqSvP4o7CwVGi798X8CEf4jtxPLl9wC05/a0b3
	wLQacHVo5zMf/nvVzW2Ckp2jBa59W7Wv0dmCyDxDwMqN/jHefWCmZ1ySduX9qc80
	G7gPpSFsGI9iCNHPxGmiifj8qfz1tMFduKIQuuVEmUGRBmtWa8/prA7QWai0nR5A
	rvscJ6qnEwgmaV4uOfsRguvcy5eDdTQnuGWJXXmZZ2jPcfk522OyklBvMPZlyJtD
	ji8rTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pdc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:47:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350173dc7aso7576191cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612839; x=1794217639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=;
        b=S4ThyiBEFfAjuY68WREfOJV3RblxoQANX3grOmM2hAr0u1YhH8Cs6btTdggqtY5Kd2
         zg+u0S7cZYJHa73Gwii/jT28w+e1jIzRzxVeQXqs97NTc6gnCyKVcahSqRA/kWO8yaGA
         OuD1qBnQTJojAoe74FrmEchI17NS6DQLGp7dUgUHM6BiRMtMpf/xAKBYcwXNLPElQFwE
         1cEOp2Hf6Z72Dfp9nv727Lem4F3XKVsGIrveOsPxvK9y17pgaQY8JMXvENWVt23tv1uY
         feFxis7w553U/2qT9rUSgnvg48pPTbXc16UFhJSU0G2GvI9t9FImCYps2+QjqfsPxILL
         ukMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612839; x=1794217639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=;
        b=jKWrWJQRAXVOy/OYO27VaD/6T5c1wNaxUF9W/X7TvnnOyzY5oiEElHPgotrIjhRF4U
         FPa3qO2MizsbAVMHwrDSg96HHP87epMA17lmBD50hfNZO4hgy8XyOWwgSHjbDHNVTpMO
         rZF8OxBNMbB9hdaDDrYMelmcXN4t8+qofQ2XfCiZUcM9pecfovjCYw2EMHUEDEmUe6mJ
         YOroCARSky5uLPTOHCEBjSwAkxwl7EuIOeqZyfWyObXx8aWwXRQMXXIQN4npNdAqUgiA
         ZpgRW02jNm+0rjjxZgo6NdWSCdRO2iul/5AAhGIrWu0R/pCFmRntLNDH8b3aO4EFJgz8
         K7OA==
X-Forwarded-Encrypted: i=1; AKwUvBx6SqQVr5iS+iExdA6cCJMBfEozQkeOALLV0BtXm8ikrSGxIiCKTHacYoYTMrwA+MiQVWnwGec0sqJkzYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9asEugEYNyqq2F2cNp0etEKDTs3DRDF5+QkUN7hn+j/dWPWRz
	bR8G9ynlVOyPy35maOB3+BDeXEhjd9lN6Il7jbBFx1ZI63EzMq5cCYrS0pX0x5MRSoz6TRAYQZX
	nZZrh00i49l+JB9ghgh7aDBkDkKsH9NpVslGrZXrB9yik3XnPSN1GxjFkreJEIAIwmjJqA3P7lY
	M=
X-Gm-Gg: AYBFou1nWEPpl585jkpo1I+WR5zSmED+oWaZzUbhF9YqZkzF3uycNmtkDxWHg2QWicO
	cY/maeLe13JCFUY01BlD4WJcPUF+gF5atXXX6wFn38Ccb36RwGk3+Kq6FeCvXo7bcYDLp2O7Jr/
	VtCLhUPD7RDal8rNTE455KKYTvXsEilUgGJgEe38myU8aT9mOPdrymZVa/qMzf7Ye9R64KL2HLC
	43d+t+SjdNgoPlGlH5y51Grnyy/y939IqLRx5cPiXwKOzjo7g2k6HSJrdytkO8Xh1K7dAQpwd4f
	b8c48Qb8dcthK6mVwlCKkNIBRa6AE29OJldwu1WS3+RVRZHSz5nQ7evd7zOU9LFMsABIeGQFFlQ
	Kx12bnZ0Kme3xMU+2srUFPxePmXBQ6Kjem+hA923p8u9YYuwD5X2VzKOhS+13CHNGAb1+BJo=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707759785a.0.1793612839301;
        Mon, 02 Nov 2026 01:47:19 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707757985a.0.1793612838806;
        Mon, 02 Nov 2026 01:47:18 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee537sm2987089a12.10.2026.11.02.01.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
Message-ID: <d7a919b1-3a41-415c-9deb-9a0dca8bfa46@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:47:14 +0100
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
Subject: Re: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for
 MDP5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: to5X4lyC6FF-ZjwTddulKKsJ0DqnJIvp
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85c27 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UxUOhlBcqau6VQlabQkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: to5X4lyC6FF-ZjwTddulKKsJ0DqnJIvp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX09YRYscDJTSI
 iQ1Kuoz9Z3XTPOGeDcFWqHa4jptO5n8OCAqmZx3W/YNrttwpKNhQ5Yq8yEsVolBvGzOvZoPpnKc
 wAQV+BOJGqyj92slcRExI0hh92Yg6Dk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXz+QjUTTtyoUz
 vOnqejuaBTgU6ZVbzpFkGmel1moy5abWu8BBMKf300vMPwrpnEQ6CjGqnuVZ/hWpfCQIFoB8RhE
 Fzf+u2mVum4xnjvIW3c2T2HZpkR0azWlcxfoBJg+6Q8lxozmR9xvELas+zKd4HOAO+m/IxSacC4
 MdfmhBleDR/SjGZ8b3iJp/nlgocup+JP2aEME+C9zjczNdQ5I8lBLNFZfT8/CcAKoqR+q83gM6q
 +rU4uSI1sskyZYqkCVdSgf84Vh8alikMFyrp8T7T+cyKJ+qRmkzMhYkWRw0Jm2qzud/VSUzuEJu
 8MYDH9f4Wvu04V9CiriAHn9Cxyxdy6NJn1j2fSfiMCR4VaxoqzAZQmDmVS16jlRvf0zSIjBR14E
 fawYcHeNMdXbr0vhpOrDtCwcYn0sWEjaS5A4x6sFlYfJl7Nwe5W6S6TP48I9dolCsf55NH9mRlK
 rYuFh+niZ0mK4frOoFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

On 10/30/26 11:04 PM, Dmitry Baryshkov wrote:
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
> device is the "qcom,mdp5" node, which is missing from the client list,
> and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
> iommu-dma. On db820c the SoC then resets as soon as the GPU starts.
> 
> Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
> msm8996 an impl with just def_domain_type, keeping the bypass emulation
> out of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
