Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6FD50AC0C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059148; cv=none; b=Bz6iQSHJOwFhvv6zLXo/1QM9uKUxpopETb6Bn+V2GpoSCYkfBWVRKnVInWk+AgxSd5kVVkA+6DY/iAWDjkcGeI0Aj6NV4QSuJlxhngeGZCwZGUK10aG9XsD1yrFvsP60XIVit2u4BKw3lqKkvSpTirlAe3WqMjG1FCoLYnqYyco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059148; c=relaxed/simple;
	bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVc02KQh3Vz2EtlWI/62QdD6gEhtxIxtgVyz2kK8QTos+hNyOM+Dz/lU1jbn/TzwqvsptPny9hRPSxUP+P1BTrd15WAlOqt7I4IJ5BAulw+j/9FSzsoOURevqy17/pjT6dJiCeaorsMfjYpw31jtzWwy6ALN/BJinsvojz0Ouc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S64fWGTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcG0ibSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S64fWGTZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcG0ibSJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jnd23408857
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=; b=S64fWGTZhKkuUcdF
	l55dEcT7II9eUe9EARbFSFHRFhqii+pPfEOQ1OLKXQ6zBEiZfdwAIHUxsUecpYIf
	ujgGbvusM34UgNNOztN5xoYpBC5SpDhqQ8weyaMmoZznPGafbn/EvFrdWRA4gH47
	lTz39aCbJ5j5Sljy1GJ+O3V23UR3i7JnK6SBFymVlDyuhbfHoqAIcgf3gYmFCPIM
	rMTxMrwv1G+oJDKQD/XmbVfXJWnmKmj2XyBgAqNJsEc4gYi06jvmJTv6lmhWImee
	H6FyRNbyz9USEpAIOlquAX9dTi0IDhwD2XCDmGXvVFrMHZuA912ohYN8SZz381F7
	II0wTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn27gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:12:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f12bb489aso4949485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059144; x=1792663944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
        b=UcG0ibSJCLc8w4Radz2Z8glSkrf+BSKWh/P6wCN0Xk0PuSAqAH5Vv+ocUzFqpPW9bF
         bzn2TmBZ3F/8Q2+o+AguEj4or9vk+Qg/mJ3V9SoBgBUWJuQsMOWbgJTex+cTxw+KKZtC
         FLX5zbm5asV8rz0q1rvLbOu8ChmLdxv65qtvYRKgmYJHaYV3i8r/ElmusJP/rB1sg0FG
         sl216ei2PKZCV+viGOePzmTRcj1FzTFp4RVyHdXiFZkKF9RdS+r7RP3KHPCxXGSglNxN
         rNBbVjM0CrPBwCxj0VXO7bWKStuq+jXoEO7UzmVmXr3+y3+ANergFkNvn1tbksoVdmyB
         FjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059144; x=1792663944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Dm8N6179ZavdtMJN65nS5aknxXYjzZDwiWAsbOQwI=;
        b=0O6PjcU9XzN+echoF0sD7xYBD1po460HJhArhQ5/DwUOCCZxIRuoCn+frZlTCVWstn
         CY6OBdyYVPkc5XbfcBMJHYEjBCA/S7NdA2bjGIbTgN5b1a0KPJ8PfyxKMje6dYN8c0KT
         cctLqTFxpql+EwpNBVEg3Y5qooQyIwaUTBBYGs45qlF5NhZy2aiTbB1y50Z/bGFNBlQQ
         KEGCW7S5zVqbEU9+ZJzccl685Al+DycYoRncAyii/9Vl3+FBPHK1nxLzWmBhzSV6cQID
         fFpPSqCeRwOaTF8qf++wzJ6E5+XtbdsVUP0N3N52T5TALVZq8RqPL55WoWUxy1XzGRke
         FX7g==
X-Forwarded-Encrypted: i=1; AKwUvBxayHlKRr+zYk1UUNiY3Db52Qq+TDSsHD6NwWK/cezIr5y000aE5/Ge2bG4UMfpxTEqWveqW/GTM7zoLkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyW+7L9SdN2IYXEWaqUa2CozcjX9B0/dPkOrGa+yvymGT8Fo3d
	emJ2uzXI5LNZObysjOlz7VVRiBed15zyTtiPsYMcqYXm00BUSAnlgAafBlLbriGJ5HVOSQZMuvp
	cNkNJglW9VmoUzSgU0I7e6UN3Hu5dLrWwLRf2Ub5Vi5fqwu/i2Fw7x8TV9/PzbGBQ4s4=
X-Gm-Gg: AYBFou2LH6Pxgo+DncquSEc47idF2MyDsdjPaYaCNJ1PdbUCf7KICum9foHTtVxCQ3U
	IOVkOepWR+gTwFxj5YxOrYjqd8KQ5zA/DVG7YFErVXULMC6tRO4H6w0tpPUOUOLcNFfPHdQxQWF
	3Yaxy4Jw/4JyOYoA/X0n/vyZ3amSEFG/KnEAfi9hH3x+OuZSy9+ohgm1735a5YTu1SwLOKOWhuh
	at89zAe5GGCxeobgc4MgytpZH4pE384A4G/gGhX5aU9Lgy601EmArzs4270k2eMzV4f93pLhaAo
	NXsiaMh2a/m/lkQmWvdeXhYafbKSHKLpob+tLNvIcQ+ccMGuFDkPLmbHibbd85M6lDwmfINi9n2
	TIVLGq2uZ/t4I6UdOXEltHA==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr693426585a.1.1792059143970;
        Thu, 15 Oct 2026 03:12:23 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr693423485a.1.1792059143491;
        Thu, 15 Oct 2026 03:12:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e0dbsm105680366b.23.2026.10.15.03.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:12:21 -0700 (PDT)
Message-ID: <8a31549e-63f5-45ab-9dfb-59ef49cefe5b@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:12:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] remoteproc: qcom: pas: Decide early_boot attach at
 probe time
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
 <20261015013827.716465-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015013827.716465-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfX1KDV7UrJ1rYK
 7QExVIt9c7ayh4Mv1GOXbscG9RU/d2eQOtDRpoW2iXUfAHRQ0e/HTWTqMIF2wasMrhZTR43CHDD
 qyAl0MMwihinTCjWKHpUWHotszuz3oeJKqSK7mxemGBb7ZaqbmLLsZBKxnemXmioWpqGTkwRuIn
 5XxX14EfdFcBnHvkyYiI8rZDO+iRMLdSY1T6MdKXZLhvAMnNbvtPXTzxUPh+30G5YpNyQmgvIYX
 Kv4ztxfT6b275C99Kht9ISzB3MIFbqLleJkmxdAk2B8lScRUzaLZnLvePeUsZZVnampiLbInnVz
 wkjSTtsspdg4XfmNf9frX+EHeerJb0GI13R9WOdkf3/ByLOQvZhAD2sObBDtoDQlYqyBLPZULUx
 2li6mS3U8zOG+KyGQx8aj9nwmLmwqSeJxGHuTZX6qtEVw2x6F2naTSd46DKtaTIM/zl9Mt9m9BM
 2Mmwkq+jfVKESJCmrxg==
X-Proofpoint-GUID: 5KW0gqos9inWSWdnY5rP_Nb_NG68ba_g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfX3d5MsbTSX2tM
 ZtLlOcCgKyhkwRSft3Pa+QYA9oEq+BRV7My8+nAA3MTJDTEUpyUY7ItdlOt8Rg8CM6Mkb9n1iNi
 dje19eXBPnEJOpusC4LW+5yv1CndPVc=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a708 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KhYryj7Us4LvWG6v_dsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5KW0gqos9inWSWdnY5rP_Nb_NG68ba_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150040

On 10/15/26 3:38 AM, Shawn Guo wrote:
> For early_boot subsystems, probe unconditionally marks the rproc
> RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> bootloader actually started the remote. If it did not, attach sets the
> state back to RPROC_OFFLINE and fails, expecting the core to boot the
> firmware instead. The core does not do that: rproc_boot() treats the
> attach failure as fatal and the remote is never started.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
