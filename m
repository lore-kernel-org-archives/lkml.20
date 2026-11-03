Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700019;
	b=mWh1o9dgA4cUx5Lta4t/KbmNOCXB5Znd32W8vEJhoIgRBYHlC8Qb4/pPdYu/RBjKNmrH
	 obnGyxN1G56v/D8P3COjPy5Ge9hGI2MFMx/yfOMnJ5j88yTfSgPif2nPh142LtczY8ld6
	 dLhTX2IHh2ROCEygTdHmMEkNSzxkbA/txj2hn9vYtPC2PsHcRbMwjpit1t82rXVHizjEs
	 SBjGuH15De6hsM844uHNFY64VvIwIX008C2T9Tf6IRzlv3Q6AzRcfbX3tpqn0BP3S6JId
	 EFTBjlbz6PpxO0q6Z3cFQDEW8nedos8bhp546yGsnvt/tJMJEEyHyXJqUFPgzG9IG3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
	b=E4zbJIIJG/zK2ZhygSkwmZA8TGhyL9wt1zB2v4s1+ZWdCxn3MoP6TIAyVb+5qbmzMQyr
	 KmbVNKkDxq+6aCq7bhFrwsZ3VyEQzewMx6doVlYuTTkH+sLJsbaQssPaDZ6rOnv4ZHAz+
	 xou18aXSS1PJ/FTmF4ZAq85wFDycQrLPB2xWyv78Seu46qFkwXnY4+ugwsRn81VhPVdAP
	 gCWFqB2k/iuC2pIfVsP43H1tNMkx52t0QjyV84x0hB0ehMwUKeVoM7/A/xilNA04C22fi
	 as0OotT1NU90WGXlVzzmGI9TV7vX48TgGbHKkvW4UAZM9uDJigJ4DR0NzyEM3uknBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yf0zCZx/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyWAlCnp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D81D606A81C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D81D606A81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yf0zCZx/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyWAlCnp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37u4Un2402966
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=; b=Yf0zCZx/Ypb+hlgh
	oaZfNlIE0bWMGtX/K+RLPUHTz0Wwg/Buyj+nq/CiMKiOLobuqXVPSEKKkgjppctY
	qFvHKLboD8JqKHbUSFywllFzuktxr2yAn2aJ1LS6H0cg5g+JACskUXKgyPeMiwbW
	y1dL2Fleg7n+ikBv7AhgY7haz0RQEBiqkkaURO1CsTS7IWCm/VTgGK9MS1RqAX17
	QcM6/373sgRPWF1I41CQNHKa3K+qK7JbxIMjOr9Plw26WNmDbuqZzc5nxO5jQzw/
	mPygQQVxCxqT1WSHg7xvxIuMUJ2HABq+05dLyER6M9qfGA+sq7Dv7uEL1hDaIKTG
	WQuVzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy2a6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:00:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e941532594so44531985ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793700017; x=1794304817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
        b=MyWAlCnpYAw9UqcQD/MQI3CSOzwgC3scIGGIbE+2mRAV7BoHBkYGuqTfa+i1sA3KHU
         TZMR/n6td6gQKiuWKRare0rWjv19b7ipMxb121SH8JtxdEYgeArR3fYj3WtE6Ce9EKE8
         t+7sq5HtkHrBQfjT3gK2PtIq1YsZUzuxCkqcFSNLeAJHr/kMfhPHLTSKd/XeLjpoD6jF
         Wx1zbdy4jm4PWiYWhx1tOFgn6EfccypdaJ2inOmMQmuDAE/WCMHtXKtCCtXFH8mHdmqi
         aKCOwSi6y4cE+3xAKEhxfZB7FSYLx83BLvyKeZm+jyJqotrJV0OMee7435pyFd3Iy+/R
         /VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700017; x=1794304817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
        b=KmQxiJWMvZTHr4Vw3STYfJ1ZFoOxVnZt4pOtDxLipxiLo7E039uzkXJpfkqnJxzvBR
         tlewb8xiXbur1C4CluuLmgal+bRQP08CA3uoUd0FF7B6sy2nE7ZQf62cAtYm3QVU/zjk
         7t1SliBlKfu2Jf1B3ns0wF34QrzhUZqsVw30t4md1s2hlA+jhz0v+xfNLLl7N3GUZhil
         ROdxfkSrtY+bc/19R6ThO28FubR3kRT76ZDj+ianSMsEW9YnPxZ10bTKDl/TzYRUbKHB
         +GcIvQYAG0erR4exq4I8Afrm5tEXVA7FghQWyaci0AIUZFv4h4JMJncMAXHU07+vnA8E
         qKYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQLRvGSbR1+VU70ST1EpkGHUhteg9xHRNmuvnx5VV5soCmik0kMwArkm+WnxVmwjkRYMIiIVR47lEzjII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fgz64YYU19ZrIs7h906suMpJvoPa8bSCtMFM/wiXx5Ddj/ft2
	vHENzF10raBi22a+3kXFrTyOk916KpgtziNNggro732fZsO8c/ENlPCHCVNNmf/+y/Bea2OPl/r
	JEw2YbT6mwspXteZkTqVofeSWPpxRonv9C5I2kWOVfOKpABFXPL4JW2qiJ9hdHHjvh7k=
X-Gm-Gg: AYBFou3OYsPibzyPhL6I/9v8/VzCl5xV542htOLSGwAA/B7ynP+kygzNx+2A1AnRKCy
	uXz2Wj/56jh0eB9f17U1GbliSV2GJLfNLNzAbFi9+bAAUv2erU4CxmTOIMeUUr6ZJKTz7ETF1zL
	U6/2yZ7WjBRKaSagzwpRPh3GCm/cuKtPSjqP4vSkMdNuaAs3FfFrs1hscL/FnkJQSa4HKqGox2Y
	u7W/vGhBUZqwqIHtgYWVmscL4tluBCWxNV/aH8oogH5nTlnKX8NSv2amdx0uQoCdlF68ZG56490
	FcmFItqn7S9iIcx/n5qNAzsjzd3JDiFkg9HPpyVGhMaiXwY52qqW0n8Ur4PjKhHY25LPWSN44Zb
	cDvOLznBPYaRsicV77A9yxp7/4J2gXiywSNj/EtEY4vEzxTTYik0ckw+8V3tPwzrqkpg56OYbz2
	WeYTbk
X-Received: by 2002:a17:903:190:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2eb36401dcemr127984715ad.1.1793700017373;
        Tue, 03 Nov 2026 02:00:17 -0800 (PST)
X-Received: by 2002:a17:903:190:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2eb36401dcemr127984395ad.1.1793700016823;
        Tue, 03 Nov 2026 02:00:16 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eced9d14c5sm7467525ad.74.2026.11.03.02.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:00:16 -0800 (PST)
Message-ID: <08bb4de0-dc94-4c4f-8d1a-ad3a4fce86bb@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:30:12 +0530
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
Subject: Re: [PATCH v4 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-1-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-1-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IVD8n04-B66u-ngeydj0PTMaywUgI5Js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX6+ioO9AvX3mx
 66iunQD+turJKm0+2p7fBQVkqmVS8Uvo/p8Mm8UnSai4hK5zh39rKqDhSf6sX7q8HOMsuiibA18
 4rO6DskfIjCtiJScOnMTVqcH1E6FdgB+lOSobtFQU58LB5Xm14lpyvLyl2DWd+21WToDmBa/fIH
 EYCLlIbJT+5GUW1BPkZCIQUNcYaSbMASFN8wDzIidyMioRJodr/OLQV8lbPSNVwV45ibhK6gWDV
 TQ4UbgrOOFDwS2eyimmCJY31LtPx0RnzmNlvryQ7hOdA6+Itc1Z3YRjcnV8QB81uaQrmWONxtdQ
 fkR6XlIRqFeiqi7t8x4orJxHTPA0Xu26SqhRZRpfTeRo2ltkTJBqpsN5Dcmp37KLkHbXO6OCh7M
 tDAfnGYJZLFLyX288DRmTZmB01dk41pRb125wfnPrbkSYFTsPWT5kqxyKQZHPCz0PKH2Ok5m/Xr
 T905eEKJ2stg8DMnWeQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9b0b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ue_Pd434T0zeNjF84AEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: IVD8n04-B66u-ngeydj0PTMaywUgI5Js
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX3jQnP2peK64D
 nGSZ57OP/Qrz2X/j49xKOHVbTD5cBsrM8El3C6IysHh2/K0E8kXpAdX8YqZj51Jm0WAeQWlXHN+
 H6lLm4gwO9Y+Bwo0B6L0KdIxe2xpZQo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
> stuck I2C bus, but the GPI DMA driver has no way to emit these
> zero-payload control commands, so an I2C controller using GPI DMA
> cannot recover the bus.
> 
> Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
> request them through gpi_i2c_config.op. Handle them in
> gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
> followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
> matching number of ring entries in gpi_prep_slave_sg().
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
