Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038527;
	b=s7U4ZoPzjwoPBSo6Kn1VKGCbfNztE4AzDAidIFHu0FL9uB8bfN+Y/lEHsMRLrOk57ySL
	 Wko7+spWyfIS4mg6SNHp9PjgOin7MhjIrJqwTRaxam+EWd1BM34s70cuvrrqfkp+kt4cX
	 tipopkfjgHHdv5ju7fG2Ip/9XeVFhgS76LYg11Y9dByTjn/ubt6tXG+LbNXHTEYnn+wmm
	 hxh2Xne1XidmyKVdllTx4VPbtlAVbvGaEBXYNbXHfaQpnA7FzLO4vEmaMHI1Fa68d+C9H
	 LYNYH1RdI7mEO+XuSzTBQJgFAms9wEr7HBJjd2XfgDzyhRE8nntcVJA87iM0xWBboVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
	b=ngOBVDXYCfWvY2LbmITTQOvwLqkdL1cprrFYdboQc3MoGhkEXMOGz1rPF8NMIrRms3O1
	 Bd4oFF13hEh/oiPt7PNwCk2nESZVkVbG9n6VVdDrC4f7RmGoI5Tl19ukrAMskf9gL4yCK
	 6ANJyaWbjx/a6RpSULvpU0cNGRZO7tHBcGSFP0aK/ybt0fPeraG4vrEtczHv6HGO7zf6D
	 FjkZQsVjRfrPqJQtfc+sqDgagvt9aMYqscp/iofIDbcgod8N0gKAGei9C4M6QT1pHwz1V
	 neEVXn0DuKR264QBeFlxO7quwBMU7L1E9BtIVGUyum3/mtVPrTJZqsYgWYLpbz3M9nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A235TU8w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkm89exA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05EC606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F05EC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A235TU8w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkm89exA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QHIDcD2391222
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=; b=A235TU8wtxM5RILd
	h42gaibcHoYge2tpQw2jJ/bgLJagAFeCWSRcvGwgKm1OUpFtr6BzHUpNTHS4+OpA
	I//hJvjRcAvAoE6yvOhDq7FikBAPRwy+MitJJhGIE0nk3y9vVbTOCi4U+8a+Zpvm
	Khhrj00Fy11josRZ++NOgXGeLP5armkjlHIJ0cE0IiZJx4HS8/lh8C/Et+DpZEJS
	stp8WIhiBg6jCCxNEdXfhoYyiexjHAzYxcjEhmrfENVFYmx3q/Ty3/HVgo4eeTh1
	3cykqjXB/APH6WmG4TFimNUwOGd/fP8zqWxH/FXNg2e4L3CNFPCxa04w1hIcwkA7
	RzoZUA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54g7gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6836645eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793038525; x=1793643325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
        b=kkm89exAbYayr9ErDGXZ14B4CfLtCwfZkdtQgr5K+y1yi3EvYOawfyoi4fpH8+HPjD
         UQ9KZb2wx8Sr0EujhVaoO98b/rNoN/w+Tgr8eMCRMa8qqUF5kfdOdW9+03+kQ2SxTC/P
         m9uFmqcwwHxgHssCUcgGDOOfGgnnh4ZFp4CfSDmdBi2wokGtkRx6uFCo/cP3WdtEJEwo
         Ika6K4FfJuFa2seaBozA7iYOv9Q5O/DPM2D/6b2CjstijKG+MOToEFuvnEAtH9Aj0cIV
         KIWnxxnUdlk8BjVJj3UsxiVHnCsihCReOucaHPTtLR/LvqetobwhTNycY4dG+Y+2+OYZ
         TB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038525; x=1793643325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
        b=JKGnmXGFGrAwlawqZIo8fRYJ4yrnLU/8tv6j+fmTbTv/TbVVBTSNQrRYMYcJ+cxsi3
         PAYD/wxSDWmObPliEMoL6ZYZ5bipgPNX7AiKUCnYwZUw+Wb25L0yssfuPvsaeLcdC+KY
         BGgLFjtQmsnwQWVJsApAP1MR7fjSg06Kvj6hTuK5oH14tMOJRDINkuKIcvHbJBXYRJYz
         bl7WrMS9c5M7YLkU/1mw4KxrM7B3Et3gTLZfjHTuKdUhQMZQmExhQwO+eqPGHMKhPjgu
         Sdm+WiEZP834czhkMUoRumCcczYNrX4EI1wAJl0w44JofCx4fV5ykfRvOxlMtEevBcQi
         TIsQ==
X-Forwarded-Encrypted: i=1; AKwUvByLlGbooqqxvELuupZhEZYcr+h2MRxe3KLASswC+FfO/yMRoDm5bvLUlj5PNprg9NW1qqUPLqHg45vjIn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Pof5c8DH+KekOMmwS2JeEyoPit/xMeN5bMCfVXUO/qFSzr3p
	ztMBpWKlWMY3T2XeksouznYv+tPLvCFRyigcfBhNiPMnZUNVevDXFtcAfntC42U34kStxcj2Pej
	TDuIdiT2GFeSCyouYfomxyhQ458bj5JT51ZINZUeM+Lp4q0h78jYN8Gr2TipIfzptCoo=
X-Gm-Gg: AYBFou2NlV1Fb5NIrB8tN9UWXwo4DoygQ6DTPc7WKK2ZdT5gXoFiSFKGXmn2WE1s/lC
	RVx2Tz4d+FwYDGjjl03qGfwj5rW5v2eQOtQM+0wk1j/JQK7QwJ5ZIzn76V5ava+LBQdkdHd+GbJ
	gzf8IHb7O2t5dvsBc1XKnepj5BppJGs6UPSIRsBo4A2a6JYri+XgkEZ0/vT4r2L4AkBKx3LeVHE
	TPPtJsoyANwfLY8HmZ9mei/ckJuvuaD0JzB2EJuLxj9R6TaWMbvlXbory0MG2qz/62z2ARVVAQE
	MNcHKWgLKuqU1z2bfnVRhFKc3Aru4ZBjJlRDMsy2P2+NwaT+zp86n0Q1WmHOkys8zRENVvMLGFD
	DC/KuGjC9i+oWIYNQb+Uf+Xm1FwVYIfda
X-Received: by 2002:a05:7022:7f12:b0:195:1a77:85cb with SMTP id a92af1059eb24-199290fe446mr9782931c88.1.1793038524363;
        Mon, 26 Oct 2026 11:15:24 -0700 (PDT)
X-Received: by 2002:a05:7022:7f12:b0:195:1a77:85cb with SMTP id a92af1059eb24-199290fe446mr9782902c88.1.1793038523606;
        Mon, 26 Oct 2026 11:15:23 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm29204742c88.9.2026.10.26.11.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:15:23 -0700 (PDT)
Message-ID: <91fa12ce-93ec-4a39-b0e2-ed5e79e03ccc@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 23:45:17 +0530
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
Subject: Re: [PATCH] media: iris: add cyclic intra refresh on AR50LT encoder
To: Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3MiBTYWx0ZWRfX56rMHmrq30NX
 UbWlzVYyC0vGtWvcrjIPK9AoKK0y5b8NWl+YE3MYHarGFdwAsXh4/rHYGa1Z9qvmxzZISOxxyCQ
 CsMiJ8on7HthOb5UBi0MmNkQMn0Pcdk=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6adf98bd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=H7Zjl3+OYEgA4r5vDjEDjA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=m_4LuSJA5yVraRB4MqYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: b5lu82u7bKBr7ZhXWd1-4e7tFuF5_FjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MiBTYWx0ZWRfX7Gp/wqYm8vjK
 +law8saA9w+HjsqtmqTwcBIcEUz0oQHFE8yo3CykCU1GM/AelbZO0P+A+S2gCyxiEsnimMy7LDy
 X+urHJBt8O0CB53MWrkdJC+OJg+kFEOi8z0pnpY0eA9EpciQp1tBne/fKgsVO2t7dzeYADmQP+E
 FMLEM7AKUmOfpjjni+AW+1UJkKP3ytXnHPy9UMjVSJvVyhXl2hcs0WwRg3pgyp/DTPD4geRwqYE
 Ij4OELtn2l+qRPgRiYlfC1aHUQHFOGhYJSQYdYVSAk/Z9yLmKFFkTR7AWeqtF0f6tmrSDEmX5Kk
 IFfuZc+o2BLpOtlAimNYeA4e1rSCtQpUA7ol/F9LdPhUY8r9Pr6DD4mxmBqCGq3qyJxP/qfiGIt
 +2T7wR02t1MrdJFvi/p8uVQvW5vTnCc63hoHEexYG08lNOWXFOplD1Xy5HA5ZcfqH7n5/K3gval
 A4iG/5tK/+qliDff7dQ==
X-Proofpoint-GUID: b5lu82u7bKBr7ZhXWd1-4e7tFuF5_FjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260072


On 10/23/2026 8:46 AM, Gourav Kumar wrote:
> The Gen2 AR50LT encoder capability table advertises only the RANDOM
> intra refresh type, so V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE
> exposes a single menu entry and userspace cannot select CYCLIC.
> 
> Advertise CYCLIC alongside RANDOM in the AR50LT encoder capabilities so
> that userspace can choose between the two intra refresh types. RANDOM
> remains the default, so existing behaviour is unchanged.
> 
> Signed-off-by: Gourav Kumar<gourav.kumar@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

