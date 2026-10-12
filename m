Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A748947D956
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807718; cv=none; b=Bhr8zg2ShdqblciVhJ+x2TYPg1wN59rWGpJbVwY9ssZzRBpF/CQbX3rZZipINUOhv8zM1vIhLhj/gDn/Q2sWyGRKbkDE27oKSgkQVZfg8uEbSaBctw6yxlAY7d7ajlvfeh5doyOp+5D+a/4rjrbMhbzOp+n7P3L08peqmhRDiIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807718; c=relaxed/simple;
	bh=LS2H8An6BD6yHicfe6t23knXw1qMewVBK12mLMJ6z2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtvHBaRL7s0oEKP2VewEeyjvGQZEvt3a6v0Rzq9tbWUiqM9NGNOMHI0L2kK0lEiDEEo0a7kkL9rZjECw9vUjNTGplddVV0eMID2HvDy5+4o1pNBms+6QMuK/wZORrMcYwc0WQOAJ9w82CVe3K3ZxnHzqPN5AUm+TJXYyMbL73B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbZ1q9nu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ogs9C0T9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbZ1q9nu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ogs9C0T9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0CVh1686429
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hECoQTtFgcbzntzMlESUYXkqjFtu05/x0Nrt7fkTe8E=; b=IbZ1q9nuM/uTauEk
	r7fMu0btngo/AKavyz3ACWH8s6lpHplhRlzRmqOqbXf6ddkoQHCLLOIucyLxUCU6
	6NZT54czZXKtaifAD2QlmPFmzTDbzPnqIRIe0UB2xxWtQLDvfNAAMsMwYKRZTajK
	Qks7gRYtYZatVUYwxuMqlDj2IwLM3keaGyjH+xPyzzJTBmBCQNNG8gvGpjZjtOI4
	+VVsPFNEOcjxUS013SeWd20jLwmGzGv0QENLRTBIymZzRo2Qg4bLRpmlKKqV0/Nm
	4invtMb+Hyb4tkJ/18xKxhTMRdCpJg35qnDnLj5ZMyoZw4VGfmb8r7BKJHQhUyRe
	CzRimg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0q53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:21:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a04d1cb2so5991746d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807716; x=1792412516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hECoQTtFgcbzntzMlESUYXkqjFtu05/x0Nrt7fkTe8E=;
        b=Ogs9C0T9WuC+A4dG/W/4r9T0C0lEslN/G1AS9zRBKondRrDlryiSu7AtD3dKT78tRB
         NZWeMNVXCrchalFRqTQA6HsrdwAft/0qT3ioARvGdBab1mDBq5493r+S2ihclQNcRG/H
         eKDeIuW9R3G8kji6F+rXyfFByW6LSCLFgc0atg4zmz561+2XY5GIb9iXr4PWnu1iRiVm
         vOEPpyOaP1kc6PadVfeCFph0IjluGdeRKVGcA4uyHfIlS77kB4zr3KJkjAxTyGNUVxcY
         vm/34gaBAM4eizgQsLalaWRbXZOkpNgGdeQmAtiZL+yN03cAzKztIhohlaztJPxc5Fso
         sjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807716; x=1792412516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hECoQTtFgcbzntzMlESUYXkqjFtu05/x0Nrt7fkTe8E=;
        b=ooHwhtBH6J56SVBkcufzPHv0WOZBZiogfgVC9D0v3Y6EIgFKSFLZC8fFPYA2tj68ef
         M7U+jD7rEIfv07nvZs4y/qy9KdREjg0TRNlAnoEDLqScESCCJcIwGU73rHTHbpaturmv
         HsnZg4AC6bt8TZWMSfh9gRGZHiJfyOUYCx7Vm4zrNrdVLg3R8HQw1bxkum1m8D36fm2i
         yt32IPQakG6pecDoAW6FZZv9DZP2wzE8IqPXG61ti8XLzcRwr+M4CRhGKiwAFIX++qwp
         wQMv3xcwOedhjofGo80bZI9IKekjtOGZG5POb08oBdDnrbv9q27a2tKTkvEIbxYPhL2C
         qaEg==
X-Forwarded-Encrypted: i=1; AKwUvBz6sQas6Jb9IVgLOZA3q1dwqjTRb5gJG2hij7VIkHN2mOgx7Zxzbf6aqNEIYbYUU7dYbtRPM3ZqN4TGra4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmR337D+lBFmoesKs3HLHsFfa3+C0KRV60XtJN07kdL3Q85GDw
	uu/ZvHLJjP6Os1IDpgK/0ozQrlJO11RW7at+A0A/kc0hfAnGcpaIrUR9mTZS4dRoBby9IaTE/M1
	JFlQwhwkxWUTMOBWIPuV0toh5/1JQtijL5qw3RHC4r/X22XW2YSRYyjHGK3STdOJQB34=
X-Gm-Gg: AYBFou2grClphCB2yYkpuzRoZ9MOdED+Zr2Ms0Ai/f84pdbt7pj2MSuXbyz7rsVL3Ab
	N1ZmF7pubmYFaO8+ZOEyh79xAunvsXRVo3gQMchyW8eQ+0Tcx5DkcRkVhcMLsAKJKG++pynS6UG
	7FsP+r6qjFQRI8t3zloDPnrU0pxREAuTrKnmdKV6hUdIk0t6ji1W6+sviG0TSmzL9n6P7ILHu8p
	m6MNxNcsqfZr1vRKDA1oiDdnQIDT3mUyk3eNoxH4nK03ds8ceEPiBo2mUjDMOV90gQDJ+2rhlDR
	MQmEXl+zs9gY9qgvo5yMHDipua/nQ+tUHQliYxaDisIxNYXoqFswniEtI0VujMbm1H4+2yfgm1A
	Ss0Gut4xZZQSIQcQrxG7ZSw==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr1762718685a.6.1791807715519;
        Mon, 12 Oct 2026 05:21:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr1762712285a.6.1791807714903;
        Mon, 12 Oct 2026 05:21:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa8511sm457033166b.59.2026.10.12.05.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 05:21:54 -0700 (PDT)
Message-ID: <0fe6b4f6-e510-4fcc-b1a8-785438fac3e4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:21:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX+NHYI91Z6eja
 4JDAT/WYMuY+kP26vU9n8PCQjv4PrREo3YTy7vk26jIgs37NILjItgzF9dqjwEyvr1Q/hMHeVTA
 +OvrffsF8My4sfSJlWOh7MVdySZhZgU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXxq0/H5glt2tU
 vn4CgzMjami2hI8Rl+Sg+9X16ri9CBTxvubEGHQw9Hm0PcDu4YnXzdxXJDx8TcVkx8diAc3RwMs
 hTvz3p4ZBrYDc0Y6756VG9ZQU/+gvm8aHKvkI19puj764n60eZ833/bOP8F8fBMzlp9/9YXL59B
 a6Gxklf3fBfn0wTi6nA28XFOALPwz/5ljl1imwil4UBs51UQfTXjuQBx0YE5k/4AUlDLP8of9sT
 +LJzkaC8Is5qCVhob83kJgH7vC9U3z73uwRM9Axpi3cB/MXYKyFkmjlyCEMEHn9ig9Pzoh+0qlS
 4CGRGmWe9wDoZpKP+8EVtLI/hBJSShdsw9A6oGev9i9MkFVeybyhHXRQIAdSWySKUyYlkhAnp/C
 QT3748waOyzpL0kshPIhYlH3U/pl0sIiIoscyqhi8FrIk0txdBm1q+5XIa5R42ivzwdaEtrcw/r
 PMNqydc3sBuDl2McqgQ==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accd0e4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pu-9y4Hw9t6J8xIMaM0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: MiaiDEelBFmTj0lSnPCZIKpih0vq8TFs
X-Proofpoint-GUID: MiaiDEelBFmTj0lSnPCZIKpih0vq8TFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On 10/8/26 11:06 PM, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
> the A7xx Gen3 family. It is derived from A750 and shares the same
> IP-level configuration: protected registers, pwrup/IFPC register lists,
> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
> record size. The differences visible to the KMD are the chip id
> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
> firmware.
> 
> The Nord primary GPU is the same as A750 but has a different chip id,
> so it needs its own catalog entry. Add a new catalog entry for this
> GPU and an adreno_is_a753() helper. HW clock gating is not working at
> the moment, so it is kept disabled for now.

Do we know the reason? It seems that no other platform has this issue

Konrad
