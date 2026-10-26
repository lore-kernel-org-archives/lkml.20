Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007018;
	b=NvwKJG6opHkmbz2NNzzsavZK7x6no/Xl1cPn39i9UrfFtPfpXGlvptBzWpkoawa4NTvZ
	 DCBHBVXjGoVqsJqwpYF/tl63K10BJzpSko69pdccezKVGt/jz52QgZyukRUuCPFef73oU
	 acb8VuXvbAHI2RXMC2XJh6ayqvK9Il/3bVfV7v5rCWeDHBFgTUtcapb2eDmzhemLaCXno
	 sfZcP1Ijx9d9nR9pbqM6jZkkSgMzUgKuqWuFFGyCMlxu7tDdfCo99QIpXogpJM273szFL
	 qu1jQYzNV1ha9djcubSKLNHtltKv+51XHO1CGe+oUaQ1zPiBQEIXTz3MdcJaKVbDPMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mIZQSiSpM/e7488u2Fdp6mOIGOxn9HRZ2vmfwI5LSlk=;
	b=bIsn7fbY7E40Vgxl3NqTxC/H+A3Z24OipKO8UErZth5MWHR7dx4bijG3Cjjcqh/2uIy2
	 4EebEqb6I9kkVosMZqO7CdPIO5aYgNOjbnz5Fxj4sRKFFP36r5iO9cAXnJOCW9sLR4uRu
	 +SJ/TF12UupN8s+cdA1LdPvulueLzDtw+5KRVu4UK+sKYx4i8rJRbPd3t5F7u7Dl0571C
	 tNgBa+z2DRd8ldgMBMu2lFk4V8vSDzKu9SKJVGwXcLPVvyNCwV5xkrSgudiMRxt2nuv7F
	 Z3Frb1sA08cR7jUIK8Iw7bU8GD7qvGxJiq+9c24nJk4IrlntY6Ix5NCxnoZfjyjkp+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMuC6mMG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9pQbz2C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AFF606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AFF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMuC6mMG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9pQbz2C
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xFDS1911554
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIZQSiSpM/e7488u2Fdp6mOIGOxn9HRZ2vmfwI5LSlk=; b=OMuC6mMGZ/5wxg4a
	iTRvasDq9tw2WzKpZwL8FKWExYiDgDrxkkB1QTQkiym0z/u3voPeDBVyU+pBgG9v
	1hLEMhrgG64Z6Qvif2hf2FxYkm7TYEbb8ezRZBABF9ax9y1ZZ+i+LCfuChBdmmcI
	UyG0OL+Zmf6SXBlOzeflnUWLkWN3Ca18v+ylo4htEA2zes65XwLwMUaBa0onnT1y
	iPbzbLNg5Vev2XTe68GuDNt+UfRJZTKgmT0gbMlsHF76wTLUqntzoOEuHQ/mJsyL
	jm/rMStB4JlyYH7JTP4rmlDhY4i5t9WDg+4o+XXoA/KI7VnGVHIOMhFqK3muLOkZ
	Ustdxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u603jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso42582285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007016; x=1793611816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIZQSiSpM/e7488u2Fdp6mOIGOxn9HRZ2vmfwI5LSlk=;
        b=b9pQbz2CRhEjCDMGFVw7i1MEx29g423bXRpJFNYA4J+jclhRWCFgM6lkOkNZZRMNYx
         KjTZu5wFzsTSQ1F2hugTCq+TmxDNg62WPscnvMsHuDN7kHCZAvcw8qUDxgqa9Tvz1gfR
         3NFiTX60SDlDnx+W+T1IrYCH6CWIWk61z4mJVUHhju+6ed77ut8BM7DtPlE1BOq6wevg
         DFHQTkrPn1nCjIyGKEtofDZDgdZsXGHiFG4RGu6R7EuMCQxawkRfPTomuKDxLnYodW8/
         HFj85TDAimTkvwwBv3rnbZQ2Qn0V6qsZBf24FmQqX7oLjfbG2JGFi4iejoJWHyqYy8aG
         Fmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007016; x=1793611816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIZQSiSpM/e7488u2Fdp6mOIGOxn9HRZ2vmfwI5LSlk=;
        b=UsayOGahOHVqR9rNZgPeLyYrKX+lK3b+aXPB0aj6U/GvxA4J638chn5cTxMCIwE4m/
         +ab7Ew4D8F+Cfq6FmXu9RrmWeXCw8YOadIHw1/vz7o9rgcLku/Jw8+grY/o7aXegz0xF
         oSnhbp6PGYLv7gxMDieFTXHKXdqKDdkL9ooWYYNPiCChixcjSAEeovLFIdm2dqePR5Cw
         2MxGUmV5jikLNnTwlPAOGllNDMRo6YHcYtWu2DhL75e0+7I6IlY9MoNWITTttV+IiN2u
         9tY5+DNF5NGS7/gpGkRQmF3YV5ZDYjVpSqAveJm20XbcTODudWLxJyMz4I6rGHo4Re04
         azNA==
X-Forwarded-Encrypted: i=1; AKwUvByFi7avSUHGMOCZ0RrjJT1zfm5ualnagTzoheojo/Cuhq/PwdIRFlYqeNPEDsZ2pg8kDhcopxRo9YFhm2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/TqYmH+7WWqzlML2bTnMeZvykIW8ivUn4fJVpZQqpxtOqRNvz
	gqAETFe0pwUxJwbgtE073y03nYWI+aRbVTUgpliHKPQK5QY4JGO0UDVmTY0bEaSHzQKcXYsu/rw
	Hl5U4wet2VVMb3Ok/FX0HVG5At5xLYJs/q0sNXFvmiAqMKDUicXenuRab3LtweDcvJZM=
X-Gm-Gg: AYBFou2hZz9VDYBqHmCXoPjT3TqTUUg46zFx2J1K7X40ftXuBO3gvStMkabT09nXPME
	6xRW+eDKOWqjg6rsRH/UlgxgX6JUHWdgMSWRTgrmi3Uk1PU6qWa76XhSPjOTLFTkCls0h27f2/u
	ZsLuGXl5jF0naz/AlCEucZ7urJj/6+AJ2vGC0o7ZOXZEIsJVsqP9K4NdctCw6vWiLJ/YOLQB+D+
	GLMFAnfMc0gvg7yik4NkP/9IhJWf4QKK14yVlIGMvst8KJ+vipnMG6sLZva81IkQ0tFaSHOEAnV
	KNV4feY0uioOz3zbh8u6AvlMYOVqNvlYpAuYEsyEoprh+m3vIMYfIE8vsvBNFo2CSI2JYdk/t5v
	kC0W+h//ddxlOXe0Nn7Pzwg==
X-Received: by 2002:a05:620a:3a46:b0:939:8bc:8826 with SMTP id af79cd13be357-940ef81ea60mr928439885a.2.1793007016413;
        Mon, 26 Oct 2026 02:30:16 -0700 (PDT)
X-Received: by 2002:a05:620a:3a46:b0:939:8bc:8826 with SMTP id af79cd13be357-940ef81ea60mr928437485a.2.1793007015951;
        Mon, 26 Oct 2026 02:30:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4998f79fcfsm40784166b.39.2026.10.26.02.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:30:14 -0700 (PDT)
Message-ID: <b3a3e3fc-1cfd-46e5-8474-e74b9b331075@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:30:12 +0100
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
Subject: Re: [PATCH v3 05/14] drm/msm: clean up after a failed msm_kms_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-5-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-5-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gkj9tfsv2p6Q9x5emArw6ehSXjpfQcI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX1nzjOwyOdfIq
 XpSZkg0rIea69UkRIYqJqZZyJgdjt9uoQT8QNLPTptiMytl11ngY84YAkv0N+BYjqELzXfhqxQ9
 nqgQG28QvFKDiMRP7CLYJcOlIdlGJSWfEN75CzP+MJ/fZPZJ96tWwsn4tX3T0yPDSxeg/THxzRh
 Tl/Cb2ua8i3Ni4k0oyzkUCPfdzawAp+5szAD2GCJcLE7MR2ueTlX+T4fwN7LmE025MrgHbC+Bgo
 VyZJ/wxMKknBcxFR4yR02z3ubNXKxikHcLP/Ydr6VzsJXEE5PcZi6ayL4j554OhZyIuwHJfYmfb
 AokykqJT6J7eXRdiW/MFMTBVAPX8eZix3ZvHCglhzzh7+fm/udLJwK7naGyaymvCCyNsjCBxYRF
 lw/+CBFWeh+MpRerXJ4SR2AcvGVsshI1XVTdfAqWB4pdl9BPhJNjutyEC2QPBV3/mDfCT2RZo73
 kMxdKh8lxsbWFc58Zpw==
X-Proofpoint-ORIG-GUID: gkj9tfsv2p6Q9x5emArw6ehSXjpfQcI8
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf1da9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aNtMi0Rn-IhE4xeoyWcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX4Obz9m8a6NkQ
 AaeIkGzEvjt5KWZSwHp/rL75ywzq5CH0AAKGMByxw3YYGa2qRZZUHW86VumDctwKnjgKmjqXQ2m
 Vxh8PYnyOeDtg6BSgVx+HKzd93owKBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> msm_kms_init() returns early when it fails to allocate its workqueue or
> to create one of the pending timer workers, leaving behind whatever it
> has already set up. The kms drivers' ->destroy() callbacks still run in
> that case and reach msm_kms_destroy(), which passes a workqueue that was
> never allocated straight to destroy_workqueue().
> 
> Tear down the timers and the workqueue created so far when
> msm_kms_init() fails. Until every kms driver has stopped relying on
> ->destroy() to clean up a failed init, let msm_kms_destroy() skip what
> has already been destroyed.
> 
> Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
