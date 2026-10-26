Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007852;
	b=FPoFbJ04flzuL39bOPfmSzq8o65lCwCqDlbv47I3hYJKd1XHUa8xGgi9KSrPOAst7TSJ
	 BgrNx7RRV4nb61BK6RyclM2/wV/3F+f2Eti9KGNEPCfbIsOSiUP3KTK+vnvCBLkpAz8g9
	 A9nfxD1TMhj8WyduY7PcV83TjRgf8tRUA7avC/DhmywFpx+wqYfALymmES+7dYNgqbMNF
	 +nggrzm9lPUpfF7PfScxqIxBPWd5Nx5T+wgI9IrXIfEk53IUwPP72kyrnuyqCwU5LI/60
	 IHPqFQEmITQLt7rRwWtL8BKg390dIi/Lxo4ct0z+hmzeN5LGJ5erF4N/Zbb6RnhbYtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mhl0TRrPmEw3OGZE76My/tb+55cAaHaJ5x+X7Z5JALU=;
	b=MXvkwqdl0eyqDtlQ3nDXNFSaDlxhXr9aygzrhYyp+bDQtvzyvLqGutsF1RzSpB33k4N0
	 WlHlDDIuHqF2KXyBICSox8oDOFunwZ06h/xb49SAwSnNnJcQvhPPI3rku0YXHCSTlCx4z
	 HsyTbLVCKOfZd4wpl5uP4w51lDB//1jsYVQiN0GOlxdjOElJkbTiu1ZWQBctFoCPS0C4b
	 Gt8/4vIhJfNa+PazAo0WuTs491PVonmE4QJ4kSLF2j0WDbB/41zQ8SHK8vAaMxfwHLA7z
	 Ix4FZQc2jwK+XoPub4stNqSBfzp+nnn/cHc+eWdpg6IQQs7WYsasfpG03dsSLsRPkMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMOhonFV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Zz9nVuR/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D73606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMOhonFV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zz9nVuR/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4av4I2727100
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhl0TRrPmEw3OGZE76My/tb+55cAaHaJ5x+X7Z5JALU=; b=XMOhonFVX7ScY582
	xjnv0tMljWEL1QoQPCYubLs7jtwXz34/1RaHk38yw0W50a/qZ+a45yqXeeHHIQyQ
	YQTBkJbCTmnvldsM+3kZhICnglxghiTPSOOyh1ACpL3ofk1RBF7HeuR1F248lZOy
	LeBWB+cQgLMWx87ob+4gie8CIWoybncMIm+9azR52JOIzxMfGgXpsWpSoMxm9e5L
	iraXlyxkJFjd8zxnEQ8QF6e2opa8/K07rqKB/WxPwiIgcSZyCQ/MX7PxwGOHOvQy
	hUJdnQ/DXFQaixUsJQkdcXpsi5WQEjb06AFOixm6mlPdz+1GfQySxi/1QLoAMJn7
	2fvqWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nvu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:44:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso20287285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007850; x=1793612650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhl0TRrPmEw3OGZE76My/tb+55cAaHaJ5x+X7Z5JALU=;
        b=Zz9nVuR/HZ5/ydEzXtWXkjWMUPC2GiNEnpn8r3Wp602nZNoQ7YzT4aCH4r1u0kTvL+
         FfbWf4H3ITZmU7l804afFnE4y9ZeLeDix3s7hK9XTRz0sl037P0+lwie7dVbPKQ5peRj
         MWXMGFZSOLmQYkdYOApl4jV1U+1Lxa8rzuDNEsucsOPBYMt2q5YgDPFd0Fs8BdFpmYS7
         XBV94bLm2oyDMa26IcDcihasrGvLwM7BnYPpIKVtYxGNjRTL8FmEWvwz95LUaFJkv92X
         fB+JtsswTfdB+IKb2ugY6MYNfAXw0/nu8K+G51MQaQX0BLejVd9KLkJvAZAztipAb2Ra
         XaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007850; x=1793612650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhl0TRrPmEw3OGZE76My/tb+55cAaHaJ5x+X7Z5JALU=;
        b=H7UleIheNh38PHYHUZpfEkFqxkjifesIkVYqRLcgLDBQrshwtDZVHlJimVR88fBmLE
         um4HVjzUKyslDygqxrebVLExaVTrjEtUf5D0sLWl9LQhWCbki8qeupSXsfyIV2jhuJvu
         hXT9+9ofkxs8fmZTsivD0rVYsKpW274aIwci6leKPGooJnMLyvGnPJILT8JKPy6ec0Aj
         VxgbeQmCmiMCGNqH6EQKxgk7MlvDSAjOLPCOVRABpFDKqZgV960qStJ8bwDztDwkLIIr
         ER3e1UahPxjIK7e3l+A4ZQZKeasvJ4dZRy1GXJzx4KfFno9Vs+ilNM5WXJfHSP5M2UIn
         2ZSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMg8WgChJLkeesNBq8FnT/Rug1zJnYNEcJSFMrJr3iW4p0V5VRuWg4XVRq3IrAcg9B2DaA3xLgYYSYju8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfMIdMjSg8wyn5tvJ+0qizL8LVBOIKE4ew5CB2TuICfSuZLzg0
	6I6s6IccfOzlG5/EEj2wLd6rkiHxZro2NStDkN6F3o7tf/8GzXqqqUJbl7fmeyG7qWPBmfxeA4A
	BgsQv/p46I/vganUzfv4Avu3BBn2R7X2Fow5REotPfyW4rgo2CblU89GUnRBOhI+2W24=
X-Gm-Gg: AYBFou2j7pb9dJrxpf12+ZX7ioPUsAYasWeC9NeAtIFz3g76Z9gCpkjDvvJvZ95ViYn
	el+lJgkWzepnWYdRFCqESPvBuwmUSNxrujQfjBEdOUdXIMPtt/W7uok+vpJEIGOYgDYY1gRNB0l
	ek1l56lA1/ccc44leszPlRf+KxbLlFoOl8uQ2VK0xGGgALihwqAjGq837jeCMeBoBdHWmsA54Zf
	ArCwI1HyUJXbLI6Rhsn9UcodslFsYWO60Eo0E5jFlgYG8XD78k6D4nfFCvNhPzQxp0m67OQe3lB
	MyU5TN4kGMqtNb7DLo9VQOG5N4jAIe2FNKFUczO47qbu/2I9jnlm5XBlEJCIGK3f+MX4VeGc+Q/
	BcG8U7dh7HmWLxxV+mZiHKw==
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr1004499085a.6.1793007849807;
        Mon, 26 Oct 2026 02:44:09 -0700 (PDT)
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr1004496885a.6.1793007849219;
        Mon, 26 Oct 2026 02:44:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984b61sm3532927a12.25.2026.10.26.02.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:44:08 -0700 (PDT)
Message-ID: <fa95ecee-e6e3-46da-abc3-a9e0e6be24dc@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:44:05 +0100
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
Subject: Re: [PATCH v3 12/14] drm/msm/dpu: unwind a failed dpu_kms_hw_init()
 step by step
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
 <20261024-msm-kms-destroy-fixes-v3-12-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-12-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M4m4v4x6EizKm6KgFEqy2HbTydU0dl9z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX1Z/3dc/uWuvw
 +abwrwraTyz/lkt3yFWvvuNHwnKx54SYyvWFOMsnO3unk72tA6tQHSzikNVNY7eHFM/Ty4QqT6/
 tb/VQ+SAUsTqGPRJKul/Bh4AfqMi4IE=
X-Proofpoint-GUID: M4m4v4x6EizKm6KgFEqy2HbTydU0dl9z
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf20ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=f5Fz61LfwqCCiFe2G2kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX6pG6Why8a5Fw
 PQ/x3yunPjybzX4NCB/aGoaRWye4SbfRd+KdOO4QCH5bCLKBRVvMlB9Zr6mwS8y3WwdM2gy/aUI
 GaW1865rCG69S//LiKLfbUa5yZJiIvRWUr6vnLXRSC7kwsSUCh5YObuR5h75eKRpxv4WUk66tRu
 hHXtYtqenDEKE+vXmvHqR2T9UGOtYp0f0z50qPQBLVWx6m3DJsekIYx8e9V3btKWQR485B7nZSx
 pgDb6VXoXK+fz7Qbyz9VhW/up9kvlPQGPYFtgEN/eLDIlsL1SWzjtPkyVck2HSQ/YYRj3V9CBQC
 5HPr16m1vkZfhV7kAkxyHzJjSW9QLCmNpywNbqX7NqGLIc0k5aPVj66QctB9k4QpBWHpKwUMzC9
 HPF40JGWPBu6AfAmWRkrj6Fe9IpoRZEHd+NgGvRlRWRPrrtIb82NoDlNfYZJj+21pqDSgLPiK7p
 DXfyZkGNGUu5S9XK4Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy(), the teardown
> of a fully initialised KMS, whatever step it failed at.
> 
> Undo only the steps which have completed, in the reverse order, as the
> kernel convention wants.
> 
> The hw_mdp, hw_vbif and hw_intr blocks are allocated with drmm and go
> away with the DRM device, while dpu_kms stays around for the next bind
> attempt, so clear the pointers to them as _dpu_kms_hw_destroy() did.
> Otherwise dpu_runtime_resume() of the next bind attempt passes the stale
> hw_vbif to dpu_vbif_init_memtypes() before dpu_kms_hw_init() sets it.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

LLM is slightly curious about not clearing dpu_kms->catalog but
I think it's fine

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
