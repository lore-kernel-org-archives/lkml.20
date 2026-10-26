Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006167;
	b=P4uvfbRlEieTNEY6Yd6GmWKiskAUoM+TV8NbxCRRyUkH7dUR7IjIESSkYJBQ89grYUCj
	 R09CCFNXuFX3oeANPD8pz1eFbl0f0g5FeMCncaKtYEKpYLpzYYZr3A8JLztJl90aSCN9f
	 xkwTYwyZdKCLGUV8GZAjG9f9Rfhjt6qV15jHCrzNGfqaFdaiuaqPa8nHDavm9XI5E+SJR
	 jWQeFuYQuTSeWfeB6R5NaeXHv0rGQOg7tWiiHZJFf7j0xD8Vl6CbgSjoZSceutWEAae7Y
	 NJOG2f0F/uyTCHcRcTgZIx9cv/e5NTapelvuhvcGXB02KjlZiO9j9VUCx56NPs5iNwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uaZlVt/ieNnTy4lKgdgeePVaxkhdWiw1YPAbOzp690s=;
	b=xyqP/1erT2qywMcfIMEvd5I0SNJ2jXeIAagKwtViH49K21iZ8rXfOCkF6wnI4tpTb5DK
	 hf+tECTgo/sIlHMhtNrHL+5470dCerRkMuaU8VI5K+FpZ3kMwPAYBbE/LcGXmVZVyrOoq
	 L/ofZ1ppOnC3fiFPXp5DWezBfmZwxRZtCPsdPNYWe1N5jQO/0FugeVGF/Hsro0Qsgggn0
	 s2MXLoknZP53K5tLCvh3gbtzEydKMLns/Oy5fuW+Voj7iwJRCEtU1H1DiPATrk6/JKFc6
	 wsDwwXa6noj5ERhW9PE9VJpNwP5g1kKiIAVUG6TxBN1dddtvw3x0tdKI0GwSE45r8PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LP/truvF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5nv1C9m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771F4606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 771F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LP/truvF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5nv1C9m
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b89a1908041
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uaZlVt/ieNnTy4lKgdgeePVaxkhdWiw1YPAbOzp690s=; b=LP/truvFDk/rQffz
	yVuRh62lx8QD5jnKtVRVhVoai8OxoYkoaC8QH5jMbnmGV+1JP3SDgwMqR3PNY52T
	Bo7hEBO+s+sVhxb9fRgxbMiLYFfOzyjyu/Mcputw7abLiT9A0udkFXaoh7qBBCiQ
	DFPVLVYR1jYXDeWwH3aFya5CB+RXVUz0lWY/hZZEXx+1Pf9ckkNyXBHIcFXKZFiu
	+Z80vH9u7ebRvGr+8TPl9Gt6+RCu4LcypuUooY6/x/iRphdNbIDdAMK/KCZ73iMR
	t3p75X0UntWaCt0jWXbOm7OBdYF1phf/xTzk3/5B/9gHa26L5a2ppEH/2gtkEjol
	kJo+/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gnqhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:16:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so35306985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006166; x=1793610966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaZlVt/ieNnTy4lKgdgeePVaxkhdWiw1YPAbOzp690s=;
        b=j5nv1C9mKoF/o6/CAt1El6yHCm///EDlkYHwSHX+2WXZzww1IfA1MHRkDPPduBN3On
         qpw5otKui6/U7madn9Op1qOgHJMFCRdsioBme0Bqe7q22Wr9ce+/0y0HUhTwalim+91D
         htDZ8sX92Cegr0qUQ/A7MFRFssGTJgc7XuX/g8b6rci7f9+pqHUa4KwzBgDJiaoyPFrO
         obvDPTIV5YbQHeKZ/i+6s4+Ls6vEGqGAolueD2fqcHdoU9Bg8fKdHaTQ8hyaBcQ+215O
         X3rKheUQLRjYr3cHYvUHiJeXQbzIWCVpbgpK2pUqlRyLuWdRYqTaGPWig+xOZSeMuJz1
         MLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006166; x=1793610966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaZlVt/ieNnTy4lKgdgeePVaxkhdWiw1YPAbOzp690s=;
        b=nRAlY7CHz9vP62cgSuz1K2evvYjLqRNGU3fkyzLzmTDCgB1r8JghlyhMvivJ5KV4Kk
         n/8jv33ocb2H7hJ6HoRR2zis/B5NlHncArCiCHHibHdImXFk4gKUBRdNA9msFP2imwM8
         pPW98Gl2rImNt9WregHVLIh1VHqJlG6C4iiHGRzuGL/bXrahf24JS2xndhuhDPYXeO1+
         h5CjPKTz/tzsHAmGJUSAhBFWM18kWyEBM69pKwfxvzbH9Rf3VAw5F6MHs93xaeJ5D/qr
         NLMnxoMw+n1Dwc3iXWwq5p7gdgljszugYjrZXXlje4ogkYfE8J5dOpvnL5jrt+bgLcy4
         Un5A==
X-Forwarded-Encrypted: i=1; AKwUvBzkeND+KPa54J9pYU+80NIJlPy+g1DXVjMFK38a0iAvxd9pWlFFQodNj7ENuA3WAGVtKihp6j20bwXn5c0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVpcE3RaWsCTOBwWr+mPYAz4w9g2NzmIcm1IAkl8wXw8nKhx7E
	6pTBxJXvwctwaaymZglCZybyKO4iJdzf7i5dUlFrnriRV23NSEfIREnOT4G8zManCOCblkjtU0t
	4ERGPup5mojKrcVDfbytIc2vXO6jP8fbispMszhnjN0sqksyZIGzOWEQwlBjDiVCo/eY=
X-Gm-Gg: AYBFou0EkruQDuWZne55gpwFyQjjANjx7321VTl3RMZ/0elElkaIhb4siwEzfTL1mHI
	yWaWa6hKBfPJqzJBQRe+FC5JOz5HLp3n0VfYuk8OqJhUw1H+E7eB2kR37dntDHM3x0vn77w/Cqg
	ycAEgunmnLrRqSqlf3ISiU+IxxdZ6neeoXwbBWvwZB4Bh3w7t6pUS7bYXV3NVU8qtOLPfbjmAsN
	EBXuZu8JI5CKwNpQ+s5WiTJ25OLO1t4BSzzm2+pYVB81v69j3tlliYjotpyCRaMRTIydyuJXqXu
	clDoLJuRkNAcopc5ySQ9+AlL8h4LxPUVrl3R98o5fdNxJYqvgq0d81dkASEIAy4d0vfv8RoqnAm
	yA/bTo1WvM+IUOcLQLa9GIA==
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890595785a.2.1793006165618;
        Mon, 26 Oct 2026 02:16:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890592185a.2.1793006164980;
        Mon, 26 Oct 2026 02:16:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459711d2sm3285541a12.17.2026.10.26.02.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:16:03 -0700 (PDT)
Message-ID: <b5848cd4-bd3f-44b7-ba8c-5646f16670a4@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:15:59 +0100
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
Subject: Re: [PATCH v5 07/10] drm/msm/dpu: clear the DSPP pointer when no DSPP
 is assigned
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
 <20261024-fd-kms-fix-smmu-v5-7-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-7-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cbVl7vKpr61sISwOboc7-TGlmArXdNIr
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adf1a56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=r9vTSbpwzgrkPjDRepAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cbVl7vKpr61sISwOboc7-TGlmArXdNIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX+8zz0A5veRlr
 ccK8wBomkZAz3rRJSHAFomGM0FmJfQsIbOcTEkPPAe4zk/VA89zLaWptAn6rUVK0vaeZ1QUkcCO
 Kj6CEZFFsqWdRx0uNdw7w+CXHubLFk3Dpl8b4/ti5DrERJW1FwPafuh6+g99Jaqdm5cX0qVahCD
 E3bTiIVszvDx91iGHVDw1RIDpu/oiIEHG1/XHZ/9lBSNybSGnY/QB1l7Us3AD0F5jsQtAL2uaf+
 aarYh99G2h8LnpYvTkMvAMmHRVQq8V+OVrd7eqlHLxTDYqt/gNfJ7wfZRDfGrx6xPTgqnFiqM/C
 eAeasavdUYcQ01T+aCM44hlgWrDd9e2SKB/VKqXK9rrP9IyGlJjLUWmyE7ETM0T8et+vtYL3T0l
 N9jrEB+DGXCN5dvGNR8Vj4pPUNtMqIElGz/5XVlr/FAq8I4qu6OR7OY+p/AUrcBfeTISuVXhbZk
 HieD0Bqupl9MZEYnqCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXxFF4KUaZKuHU
 b3F3ZTcPjRAeUV/OItaanpdhSHIeDW1c/oBblr7/+zJ6/0+gRM6ftdb63rpLgn1evyMf08RZYmM
 GmGoQhV7ZqL2qIVCOi0kaSKTpi7rMlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> dpu_crtc_assign_resources() only stores mixers[i].hw_dspp when the new
> topology has a DSPP for that mixer, and dpu_crtc_duplicate_state() copies
> the state with kmemdup(), so a crtc which once used a DSPP keeps a pointer
> to it for the rest of its life -- across reservations which no longer own
> that block.
> 
> Assign NULL when there is no DSPP for the mixer.
> 
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
