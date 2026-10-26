Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006218;
	b=QXnWc5f0SyqoM9vb3Rzh3q/fcCj6pBaONS8BdxnlPvRc5U4ZV1AwJ0KivcG4GLZIDKRn
	 c+rCptSistw+B4maFMPQmXmgisCbh7+/la4M18Cso68tv2zy6M+9u0YK6JOOVqap2bvC9
	 qDEMn6q8BL3mnfpn5VrEI77spUUBlRuWfj+N32Xb2r65N26bPGOa0tfgRlDTUXoJ704at
	 SWeLqhnYjWZuKo0odNJNWKB+iL/Jv8SQipcaDKXmFFqK7T2VhZVgpv7624fAmxqb/kMiv
	 vaaN/FPbFdK5nlPFoA2YV9DpXyKV3t2BJ7R+LPQJ9TKDG1OjwufMVVxwFSO3bJ9K2lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S/R1V8jcwmGSYG2QsWGibA1eheKnvmEoWMpRIpkWm5Q=;
	b=ccupRFfLFDfHSeUKh6fL1BFe6IbnlsZIkXr4NIcO65644Y07k60hQY1M1zSZujCymB27
	 DhbniFA39BBuAbHbITRmtCjryPZUxf/Ektyh/QfW9BTztAys8/VOowcQvU+qUYOl+uFHG
	 3BVc5jhWJbACqDgh/I5Dlnf7x+jAA9C/EHY6ybRy22RYjDvG02otr85cCLMEmjf0LH1Vw
	 FGkkGjgGKyi3HI6cQ6cI0yY1ge86FtvSGdsjMJ13RT6ZmzG3TdyRXi7G3dDC07U4wItkA
	 3NnBL0P8OWZ60rhxCN6ZNq9Buf8nv5JCg/QVXUb/Uf0dms0Xl5lDvASkE97e1ifB1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5aIRmgb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kToPlAIx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5aIRmgb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kToPlAIx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xZp41912229
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/R1V8jcwmGSYG2QsWGibA1eheKnvmEoWMpRIpkWm5Q=; b=J5aIRmgb268pn19z
	DSO+mrBdgpsEyVvl6Rz7K/UO+z4ZD0c3wMI7EQE+cCpUAtNzXdmz2OKqMF54n9FI
	GmvDPOCtNZikgBawjr+e1vzEBxuWucEh6GGZPAPHgnAtfDe/Ek1Yodk0BPbi+Y+n
	UvD5JmMMgh5AcUY7Xs4fk7YqNaoLvUmXcVbkV4d3uEeEvU2C7zmNZmOgWB7StjAV
	Z03/v60mrkfZZ65MRj1MTJiWbUQ1eRKEBCk9r/eA2tKUVfPSGRPzSORodJY4eSPc
	BCv6WwYZZFDDGjthK+DoOeiTnm1T6dHDo9D7c95tf/efqHEBPWIOeAWROvTFrMTT
	/TkNeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60233-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:16:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so35318185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006216; x=1793611016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/R1V8jcwmGSYG2QsWGibA1eheKnvmEoWMpRIpkWm5Q=;
        b=kToPlAIx/2Fd8+2Pyp+SLOXJEO14Iy1DwxWmGi4X4A3RcCXnAsJN0uoeVyQ+6U6O4T
         1OLcFhWmkM9Ew5TpXrivuMFB9veeqjQxp18Di7+e9QYaTttkS2BdHyw+Gn4fD2hvFIO0
         +EsVHtzQv/DO6TOL9z5JeDuwhEfn0yDdEelLKu7kZOZFtU9fLEiU4g+duGXYlC7v/NiJ
         WWyz8IgLsRu6lkVAcI4MJKwEooKIaaj7Cal3oikMdFRDj73Fv1GihNHRRnfn45zMr3Z/
         UVojVpMnxikTyI3QqgVyaQRilrHCD7kfsrykXw8tJE9f3SyIlNgR6+yXT+tm1zQBnR9W
         5z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006216; x=1793611016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/R1V8jcwmGSYG2QsWGibA1eheKnvmEoWMpRIpkWm5Q=;
        b=yFw8Ck/0z9gYIqIidSxCsaS6ElECc+nFORfxp8P6V9NecGCfgDE9Nt1KetyxilvJ1q
         qlVSJjAImbbisQqHpxIHn602zPrOkXy51oGOwMwZ7v3+YMftkhnAEJhiWcgrq3MMV1db
         A3VKXutavnewtM0kDJ5ctXwjz1+4Bf2Qg385ap8riif5FEupnYJrjOnx8adNOgt+c9Mo
         i15KmjWJNVhlBs+aoaeJ3o951UCfJM0QvjnIQSH4VMDSARCKntku+LUnOLFlRtlH7DXU
         roMtpHkxiFGQCLkpypZLxFD/pDEwXijkvp/2shj371Mo5vx6ciQrMa+VzIfSMdWDWWw3
         Datg==
X-Forwarded-Encrypted: i=1; AKwUvByhWePKB97HIONw2WPXkpJwKjuAOTLunlyPnVir5IAwuujuxYCKzngBR62ZQwo8e3e2a/DWQKzubfDzddg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTAooref9R+ZYn/WDKhhkzMMtXP4+liXZ7F68w6Y5B8k/5VubN
	eXOEG0Ow56339j29EvPKrzvzN7mez5oTMQHGI1e9935gYEnJ4lnbrhFC6dWMfmA9VwKdUlmwlbI
	2LakXc28fe3jzhzdP7pIGquwTXpR1lAPmJemr5dtH9lc2T636Fe26bNxE6oqOpJjXKLw=
X-Gm-Gg: AYBFou086+BN70jDJXP4YGoOYHbgB5554fhsikT8rAxzfrjYm3Q/odkfUwd7E+Pzx6I
	ZzdLnS12ZpDcooFyMiuYiC0Rj71bk1xp/Rdd6QYZEeJYn95EE0dvGbE1tiL+JIPXA+Q6qzdg3tG
	hiQ4Pu/9RAdecR0VITfL/F4WsK7nwFsQEjC72lXSksl9wRdxiA/ajXpUFEELj1wyeIQIiU9ER0B
	kH2Y+GnqsPzT4WRw7icXNCOsiyZtA0rX0LVZy2Gw3Z5ao51lkcxC6pIjuJ4lX7TGWlJ8inCRy9S
	AzYU2TPZSlcst/52OxF8sSmtiIz+/Ki9CzAaw8tpYYsgRXIe7KcUF5eV8Z77UC698cj5GGT9nrX
	2CfPtXnJSNyjUzd4b9jl69g==
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890801185a.2.1793006216187;
        Mon, 26 Oct 2026 02:16:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890798685a.2.1793006215661;
        Mon, 26 Oct 2026 02:16:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e25fsm3373276a12.7.2026.10.26.02.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:16:54 -0700 (PDT)
Message-ID: <a1f0d3da-fe38-4ee9-b876-1884ee14d74a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:16:51 +0100
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
Subject: Re: [PATCH v5 08/10] drm/msm/dpu: clear the DSC blocks left by a
 previous reservation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-8-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-8-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CTdJxQdkAz8SN420VPBkyq8uaQCQfm_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX26x+Jtf5Deej
 UYr7pdm9o2Dz0LU0RlMdU1akmSCAvGD4TZ4N60zvf10ow5nY50MLF2mG2xLTjReFXVYvZEqoPv3
 Vs7b2QgCPMfisM+tjJSGw4c4JCUC3NhkumpjQ+GUjz92G+df/uKJOayazaviKjgdz6yEhLtmjkO
 t+RNleRMfFgLnpoRPYaoldsVSTyISuTBYuF2cqNsRQphud6dTz6pDtguizBYgcsGksD7Wv1C8QY
 sxozAzpnRVkUimFVxEckOCQFu2tQbYwg5UgvzOmgw1H/W2qRnRwUzcLiy7zAvD1/2K1r8gfc5JH
 q3jTdDBYuekWUiqwPv3RNcIw6R67a6i/hLRu0JJ+2Oo79/p4qg4m6AFC/dsoys2mo3onmHPgWos
 SE1Yqa0O1Mjv1eLn4+aqwebnfftw4wcF8WnfSjZnTjOEgyBMZTD3m6BriColV0Srzc/Kb79NMdi
 kp8M5sqciwgM8VCMIBw==
X-Proofpoint-ORIG-GUID: CTdJxQdkAz8SN420VPBkyq8uaQCQfm_G
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf1a89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=201-j9D5Wx46gDUpQiAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX4vW7U/aYZcDt
 TrSIpddMOJgr+DglF+7vVakZe12vt4Ripwj3hhxpQ/Ajr6oIF3fPD+dcoZswbC1TKJQuPTUsnla
 pTvh2lMUM/ey3wb1ESAdyrP/itkwURQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> dpu_encoder_virt_atomic_mode_set() fills dpu_enc->hw_dsc[] with the DSC
> blocks of the new reservation, but only the first num_dsc entries.  The
> array is never cleared, so an encoder which once drove two DSC blocks
> keeps pointing at the second one after it has been given a topology with
> a single DSC.
> 
> dpu_encoder_use_dsc_merge() counts the non-NULL entries of the whole
> array and compares them against the number of interfaces, so the leftover
> pointer makes it report DSC merge for a topology which has none, and
> dpu_encoder_prep_dsc() then programs DSC_MODE_MULTIPLEX into the only DSC
> block that is really used.
> 
> Assign NULL when the new reservation has no block for the slot.
> 
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
