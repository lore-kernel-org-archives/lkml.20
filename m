Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008497;
	b=GXaCV1KpzsmYa9iuhXoElgY3I1YKyije4F7zHwWKRXQ5STZJm8hTaHPqWsrt1/XpTv/8
	 oBKYF0ZBD3Q4tGjqB4dUouZ+WGyLzkK17emz7FpU/q4mCxn4W4PO47hTDmuZzejqRWTXf
	 qLBrLBwdN2IMfp2A/NTJRQec9ltMCVIZ4B3zh6APX5NYaQT01PQNVklWoGG9SSyYULxBk
	 lEjXzY7KX9qg97L6kn3CUZpx+rxUgXxzAta1pO8hMZGiOWnNdLp3nAo9eRUxHEbz83yzX
	 uX5BTAXkPhJsKpvZ1g+87ly9XZLzb82Fn5BbB+UvG8nnRm3jS86nHJ+xy4ZJEq0Wgsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4lGKfZVXFhhfUcscOMxly8EEWx0e5wo0QpCfadLOD5M=;
	b=NjXp3gM6ynflick4JA1f1JZvc4nOh5cKL+Gg6A6RKx7Bvk2IoFwUC4ZX0X7IYc2+E2h2
	 mo18yU4uPLINEF5PtN3gxGO82niEAIOmKqop/WZKZkgPdyaPijb39rJds3UkauTp0/dpS
	 Azwm1rg9duKg1MA2o4JE3dxMyEU2GOMlNlYf3LKOd+8f7H9fkYy1hRic8JDTVRawE+NoZ
	 ohqUYGhOqM8u1RzFQGV1VuVbMe0DKFe6rCxKMYzjsrTDAwqQG0fM03BZrtvQelW3+yS7W
	 cYZaaheyIBdiYMoJv/03kV6IA4t+Hn4kRx4vVvUcJbvIqi4MWBU8lHV9BiQ35VqHWAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5W8DIl9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVSrMAkv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ACD606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97ACD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5W8DIl9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVSrMAkv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xZw01912229
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lGKfZVXFhhfUcscOMxly8EEWx0e5wo0QpCfadLOD5M=; b=N5W8DIl905zdUdEn
	qMbz2L9XzB/oJuADjsf4cZE/bvkhvRd6uu0G+9TTTul28/E1lSfrBHA8Z6IMaFil
	NQA+jkFNNyZOQrnEw+gHIPcOlukQCh+GN60GQt+X+9wcnO5qtqtYN1SxTfYyj6eL
	vh8RD/RSU6vuoMIPqtDyQH1IRWH6cSeb9fsSDvZ8nW28e7fQ0bGnrS4XFjh+D2kQ
	AbVS4p2bpszlELjTh01WbWgrM6/UJCEMTdZH+TGVA7lkr4Eeh13R+s/bUlXeyKwB
	Lak2AUheOJNar1ZjP1ZDuJbRv3RZsjx/vyW3+K3bf6bPqDYONHlpzpowFz0jfipj
	MiDRig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u606jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso11976391cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008495; x=1793613295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lGKfZVXFhhfUcscOMxly8EEWx0e5wo0QpCfadLOD5M=;
        b=QVSrMAkvf7zD6FdUXuGrkU+gg8uraVME65VPCjIlhE1FmmVZCW1VO+AzeqkCpPiT1q
         /UY0Q8jb+g1i0L6/b7GMsHQWn5kwbi5dk0xJpkMXZ77upo/pIMNKncZohHRnv3OtDtQl
         tQG46oNcqI5U7bGYjHvcomgWepBtJVx1teRydIuhtZwc6r7ImMacWrSp8PH20jXabIjv
         eg3oOZrDGXCPzPk5ouqb4MQo1loewCq0OOSRvZBqEhfT/J3AXtU4PDAy42+UsaAj2B0N
         XlEwoA9WBPgEcU5Flxf/PBvnLHbU/AlFaj8aPoR7g7ToFxGzWcJN8nnGCkK4yU+ozccz
         9h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008495; x=1793613295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lGKfZVXFhhfUcscOMxly8EEWx0e5wo0QpCfadLOD5M=;
        b=igXzGsstgcoD5qhLa2p9UX6yxGh3gDfP8XTEZBpd1zkXM2mdj9QEqOWhTc+k28Kude
         uBbp5nTqg30+B9QOCrwTm/5wdDyYxcYPziJUwMGcYQPwP5Yw9igDAkhP02urGW2Dm9f9
         o0evut19zC754f6ghHyjWHCQRQ/wGbr/cMYQeG1GgbG2B9NvMlkQh8a89htw3MkZ+O71
         Zmmr0mtrLK1xfqBFY5AsCBaNbRdNNiKOw1X5R0pjmArz2DRlZczC6Tbd5pnOmraUOs2k
         NO3ursBK8H/FPu2AJTP89yzMOUgiBOJM1nz/3xN2jnIuEhwa/GKIskxdUrvRw1Zgje4i
         t4Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxBxQUON4UDejF/rr0J8AS2+G21EtYcCVYQiKZYgjolJekpONsvYKK58eWTdyVNZw8PffnGV2OuF7f7kxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOYtWsMUsoihGWr5FqNwR2fqhZjdZeIESudl49I96xgt16iIFu
	wOatKCqMUB6y8Cf4QEp+OXqgcCCDAU7Gg9dbuqKlwwSokydNCQtyEi+vlLE1Ck824TrQrxOuduW
	aQV5Jn80+vnJ7E4vD2Cm3J9XWEmYV1xzC7jvkI7bqfgSADBWiQ179Epf82Haw1Lk0Gco=
X-Gm-Gg: AYBFou3N7nu7VXz2Hd6Jryo+6km24Vg+tgRP6GelppFdPPrF7l21WoMFXVkJAuSHING
	AcmguiTJA0L11k5WOg+4UUXRXUlt19nCu3qrV4TrjQ3DQSTE6KR17jdyA5HB3IGc4MJuBwUD+Dw
	dzPR0Zy1+Piemwi9S8KrW4oStKPi8Z4LOcCMXq3oF9l4Ijb9eiaJvaJouabKO0pMeFtidNolESx
	0/7C4kU+a4l7H+dzPCUNoWTzkKEkDkBWiScRFON+l/7vZsEYTtW6HHh5V9Rc4kL34+bJ5i4BTyh
	TMm85RvFa8fLlBeJnRB+RZSgF9NwBbvelPIQeKvxBSvuvSbH/MdedLPcSr5aKQ4MDWw+OS49fAG
	POLP1tyZNb5Tfb6V1ByFaCA==
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr925540085a.0.1793008494850;
        Mon, 26 Oct 2026 02:54:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr925538585a.0.1793008494426;
        Mon, 26 Oct 2026 02:54:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd524271sm309870266b.35.2026.10.26.02.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:54:53 -0700 (PDT)
Message-ID: <370ec92a-2c33-42c0-8579-495e8bb4ae8c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:54:50 +0100
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
Subject: Re: [PATCH 7/8] drm/msm/a6xx: Request CLX enable from secure world
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-7-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-7-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BP7qJMd_vzsq12Wl3bgmXdYr0qRlnJa_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX5yom3T6KsLbr
 66ojTTOnBHnPqUoCv955AIodj4nuOSqDWJa0hZlkCZfA9yzMGLTwAGGnptFjLWW06VzUpKPytR3
 eufketKtPB2l24Dz1RJuSbX9V+syTtCGo2TC0/U2mTtAuXx+gxPO0hVl81BVY7G/63LoGJ4vHDq
 dv/NT8/IixhYzUaFGB+GTmoP5PEhTOTLZbDNV3VgO+FCeiinOq9z+l5TiDfNEpHF5HfVZHvo40s
 lA7YgoFw0AZvke7z6iwfyu2+W6NWIuoEKBm2p3IMzrbn9uS3DWn94CDVqJbCST2iFIGG3sel6j0
 HkpRNn7rUDeR8AAOQUhCnZaX7GgLebEE8/6SyGb2jzONfYnQjvOECXfz7h//e75nV5yKMtjpK+d
 NbWVLflckKMgFP2X5fyZAypwkoGBpAywYVWoBvee8RNJIUPHNdpvHQPlpISJznEoFFoI4Q7DerD
 OGMUAcMPWuDS2cvCupQ==
X-Proofpoint-ORIG-GUID: BP7qJMd_vzsq12Wl3bgmXdYr0qRlnJa_
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf236f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UCowTn2RA8sYE9T27pYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXytQkwVxES0Q5
 KL57Opdfl6ykd1SyPRYkPKVyh1phc6GA7lkNLC2MokaWd31tYtIhMoO9ziDmEDePVh1JVAFY6sZ
 JeWprcla70XnZG7yW9IbzwItxL5+O6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> The CLX (Current Limit Extension) feature also requires the secure
> world to enable it via the GPU init regs SCM call. Without the
> QCOM_SCM_GPU_CLX_EN_REQ flag, the CLX tables sent to the GMU over HFI
> are not effective.
> 
> Set QCOM_SCM_GPU_CLX_EN_REQ in the SCM request on GPUs that have a CLX
> table in their catalog entry.
> 
> Fixes: 967e62fbeecc ("drm/msm/a6xx: Add HFI support for CLX feature")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 991db3c9cd96..a1561ca41a5b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1247,8 +1247,12 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
>  			goto done;
>  		}
>  
> -		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
> -					     QCOM_SCM_GPU_TSENSE_EN_REQ);
> +		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;

Preferably any local variables would be defined at the beginning of
the scope

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
