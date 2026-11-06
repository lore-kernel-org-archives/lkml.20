Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793975838;
	b=CmCGgOKYkQepq+Pj37la9kcjDco/rlT/kmw/MFDjt/ynTR7ZWbHycE0lZi2+/Tfr3Ywt
	 l2KmBAE0vZAb/ZHRCWsaGVKZDsU5xxJjL1Earacaptgig3n2IQiEEibWZRCNlEa/8Fpl1
	 LfegVAXvnY4AS1vCnC+nmqcPzkhLBBLXUYBfY057KQpoI+dyrq+hC7MW6B9KMpylx5R1U
	 Utxj1Kb03dp2rk9r6XiH5jhRU/Lco3TEsqXB50KwCgGbWdrVadmEsa7uyBoWmTriqjlm3
	 JhZ0CjFTw+pUPmk1pHHuEX9hYJYrtU3CWBCc/Il4skC1lH/V/3vrI7ajA9htOLnSTkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
	b=EvpWuI6X17EpSr2RM6v/bT5wcw+pA/n4azkUgow9eys9kq8d+SlT8DIRyx6D4vOlc10B
	 JXfcfRjkeYceLq6+JAccwlEc/NPKJtcAwTzGDf2Fjk8vnxJzA5O6TFF5+qfAtxn66UDas
	 4xRYio2Wfhru1O/qgEHyxw9G8I+hXoojIaoYUHv051j6Vma9Ci5Ka1qFb08xBH6gNgI3M
	 QCedLMVUG8Wnct2sKY4T8CXLbIQ9IAgjIuGregUkDs1MUf6rmiZBm9QvPeurjpdIXLvwR
	 QL8FerTZ3itVncuBiPtc8LX41AKaC+bXMZI9SO+SiLHtkNIhPyBuVnQfk1CULHUgjtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDzUxncx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UVifpZnG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9A606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B9A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDzUxncx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UVifpZnG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ2f3963837
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 14:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=; b=oD
	zUxncxZqM9j4vcCOndXBF3iIc4/WR1NvKSLy+dBwaYOm4erSCtt7mQL+KFrwYI3z
	70bIWvfQbCccOyYxOcCoKpXLXqaVtbZ8+XgQBGNdyrGdw1450R4r7383q+QOGIR0
	kzNMuT7bcO7muQGmD59w4tTETIoglXoIE98yc4zvFoWh7vohmFc9NGopOXqNOAyA
	XHpkS/ORTc4ycLhJDjiatf4u19cSTI41hyx+6UzGHCreR0moT69Gfqp2yFA2JJuO
	kjGt/kQGHbViURKEabcJ8k8BA6JOzdNjtQ6ZkaD82H6uwGWijD/hVFqq5m6FSZMr
	0whNfEAoKReAM0Fjhgmg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u7p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:37:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25dc2aa8bso1493779c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975836; cv=none;
        d=google.com; s=arc-20260327;
        b=gDy9So901fAS8Sfy6PLX/yNVUWndTauX3GCWUpQOCNSQKPoVVxWpN/9fCFRc2S2Cj3
         P9ApOGqByuKslMHHgs/YCb0JR7tBCbZ3GzIR8c8dnnWao/FccGaRCT2DB86qtwIVlJ+t
         liQ4IH11g0lujNlyitGX5+BqtP39Ij3g4ilWEqjsAK7T2NsNSJ4cS24hq0N1k+qYLWMe
         WYtsVRgL2u8VXQCIpXwraol8uJ59rvtsDZ4p1Pqf9ktxRvAK+vExrR0IiWv/S9+BWIfd
         HWPMFUcP4SlFiDJ6JNUImTpNgm/f7CFezugUuWPUVcD1ArIkWsYyZn/ss1TmP+o0tM67
         sdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        fh=9Mbji5nd8RsBEG0URDwF1PScxoX9NbxsezcYFp6A6OY=;
        b=bPMBqtM9S0tvX4iAcfZP3/iTK/hFddedFzkZrgtHkiQ47RaA1tmIafDkJ9rB6PZdpx
         Ke0ImmTwlaHQjWIm5iLXlk/N6O/4wXU4cPXPAS0HiqFRi17+6Fss8S360RsuVHSliPbc
         Jjt112sxtotmW6c1qWEmkjubQlZDLf8NM8w2WBpVioh8x7xAxZ/3tQs4cO5kkxtsdF97
         bESxbfVVCRQw7+/DxBOyyWj1DyBQPqd/jE1HlO1j7/qd5SD629jgb6O3bX8Swi3AMda+
         6t+U7vAosps2zjGOE1c1iwgfRDhJbU79OVr0E9BoPLSB7pa+gOpn0olUJYd49Xlacga7
         GHUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975836; x=1794580636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        b=UVifpZnGmtn+CUp3hm9K6takq0A13pq7TaZGNjGIJgThvdw0/HdTqjYTGPtnrJi6wk
         tsSCHn5IiHqqsTSoMy+GQA/5nn7eYjdwKoVDBOfwIJRgE238v+cZwfvSlzILthvBJIK1
         v++sNmehgSf4nEsCqnwn3zv/+F/E0lYA3+NLV5z0tFv0hRyrVgskA/K+w9jyLY4o2Zkg
         1h4YGMxBOMhdWHDW9Zvc0w1xwzY/e/OPpiWGx6X+YQGtB45vtinfrRjvIWN79gQ2ARaw
         P4BFWgbgUFLsGC2l1Ys++QSI30aLcYBZ7VBnBp4VG64/Y2z0+HqocJJpuJM+/sVFDYNH
         A0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975836; x=1794580636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        b=uIvKILn4QYd+6vfYU7c4j1fUlhlEu9bv6KnOqWLz42uF0azCQdC8iboRAteEXviCmS
         JbZs7cT2NIMs/PGcdnSrKRfkJgaC9u67Jaw9aq4B637lUBNjVCJpuSJRdsMM6sDvEWRs
         mXPTsO3vmRkVlUwIWiSNA71f0cmln+pxtnvyOZBehTSjm03+/kW6T46j18A66tHSE/yH
         YM7TsRHVflcne7oyrwqn3y9DmtbsmtreeVCJgvBR6kE7/rI6KaLzJGEDRhC8m/zzDesd
         wVU8yzc1Ikh6vu8Ce5tgbSLHF6LraoHocjkd2IYQSg4xKlTGmk+zdipxm7MUrWKnS045
         4V0g==
X-Forwarded-Encrypted: i=1; AKwUvBxTVdBS6SRaqoQw/ELqJC1dlH16cRcfVX09wDKL6ZzL6p3S6ANDhcnuiU2ybdCjlR1aOstTmBNsx3JiFjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wmqYKzLwpcHZCmGZzDf5G+tN31D93z0dXefL2Cm90z5Uqw2g4
	TK4LceLLfSo9lPBuSSJb6Xc+phD0TdstWjK7WRBu1K7ijMVOhWsodInczGPPhCqMNwp1whR00NQ
	DpT/6FUvK98SR1HLBVTzkTQWxHmW8DJXcsouJz2KI1lF1JWsB0kff3FOwr8h3oArhgWlu5VBj/C
	ir0ZmP4BjpLRW7RRB2ezj6SXfw8UyDcoGbtwg+xC/b/A==
X-Gm-Gg: AYBFou2BlxfRsYxPg7LjRMaSyvSY5tdXA4rOVJ7Ff8KR75bb6sgaKucP4isyDJMWtZn
	vOIzxYJyZ0AEd1zAX91sioAgbgQ0zzE1ieu/XCtVY2bJg7yl7APaaQ7TJeg0yKFb6JcU8iTEait
	SLXpxkLWLunvLcQlUy1oUQUb1+EE0dITaVqrJEJfW681Lmsz+UcgP3D0P2vbLPqqdMRnJqXYhYh
	A6xzM3ldSLxxqlytVaBbg==
X-Received: by 2002:a05:7022:1201:b0:144:fb42:52 with SMTP id a92af1059eb24-1b25d31e166mr2771672c88.28.1793975836162;
        Fri, 06 Nov 2026 06:37:16 -0800 (PST)
X-Received: by 2002:a05:7022:1201:b0:144:fb42:52 with SMTP id
 a92af1059eb24-1b25d31e166mr2771610c88.28.1793975835251; Fri, 06 Nov 2026
 06:37:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com> <20261106-ubwc-format-docs-v2-2-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-2-82949f88f030@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 06:37:03 -0800
X-Gm-Features: AclHuK-nYIdYytSxiDZGvmJ75_P0qcwPygnczJxVB0uKsMZiJo7oTk6OLzODjmg
Message-ID: <CACSVV01xGvudO4yjFeWzp8zk6wtOaHsEj=sJ=0E_7=wvKfhcdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/msm: separate compressed P010 and P030 (TP10)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfX+tO7cIdUEBSG
 u+Cz6+zkcr9bF2Q/JMkDnbNvfnrgl7CtfqjKMkyXGnWYRK0hre9cI0FvoJnGVeSpDBLNFl0ZBoJ
 GwlLQDJwtBoZGDNeq2nfEW3iC3gxP4k=
X-Proofpoint-GUID: BqkQO3rL1BfUTUs9RUauIfb7ig4WYVGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfXx/Hzok77w4ND
 NJ65TGTykMOJH13Xa9xzDijpORzw24xAfiR7VGSMksajTkDhO4Df9sA7/wEwSYC/oEzmBxLlMsS
 4EhPh8f7hqZo/Sv5VwbFckzxguY7yoKiWqRIjJP/D3N4xz19cAf/ZCqxMPyrjvLf3vQSGMx3CYZ
 9aun8J9nE5Qv0Tgxpb3cVtUBGB++VynJXKrpXwqVZ/nOTvySfnq8JuhBnLreOkYOqf762zErib4
 ItZkP0qmc7lARsK4dFkygkytjMz8/U2OB4YD20/LMzf6RHyXzRjjHcAp3FWlaC+LAf+vKPXK2Uz
 gya+y3OsY/hMeoR0GhFcYBE5N4hPfnFCIzR8r+7lgt02GV3/IpV34vUbObBdQlS2yepjqmjabhq
 KxIvgenQ3iKyjsKmgDqE6oDyHUZese0ysps7hU6OgyjVoNfVLVuBkd6LlmYny5y/A8TaVs+Bfw/
 Mede8WXyTFuEirBR2Cw==
X-Proofpoint-ORIG-GUID: BqkQO3rL1BfUTUs9RUauIfb7ig4WYVGi
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aede61d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=PWnpOtEoW80h80myw98A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060058

On Fri, Nov 6, 2026 at 5:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The UBWC entry for DRM_FORMAT_P010 is set up for P030 (TP10), three
> 10-bit samples in each 32-bit word, the layout the video decoders
> produce for QC10C. It doesn't match P010: compressed P010, as the GPU
> writes it, keeps 16-bit samples and is scanned out as garbage.
>
> Use DRM_FORMAT_P030 for that entry, compressed only, as the SSPP can't
> fetch linear P030, and give P010 its own UBWC entry with 16-bit samples.
>
> This changes what compressed P010 means. Nothing is known to depend on
> the old meaning: Mesa and minigbm never allocate it, the vendor stack
> uses its own modifier bits, and the only user found is a draft
> GStreamer merge request.
>
> Fixes: f07c9946cc1a ("drm/msm/dpu: Add support for P010 format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

This one, in particular, we should pick for -fixes

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  4 +++-
>  drivers/gpu/drm/msm/disp/mdp_format.c          | 13 +++++++++----
>  3 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 107150a8553f..f755c0d57abe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -173,6 +173,7 @@ static const uint32_t plane_formats_yuv[] =3D {
>         DRM_FORMAT_BGRX4444,
>
>         DRM_FORMAT_P010,
> +       DRM_FORMAT_P030,
>         DRM_FORMAT_NV12,
>         DRM_FORMAT_NV21,
>         DRM_FORMAT_NV16,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 1a471cdf767b..09146023d13e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -68,6 +68,7 @@ static const uint32_t qcom_compressed_supported_formats=
[] =3D {
>
>         DRM_FORMAT_NV12,
>         DRM_FORMAT_P010,
> +       DRM_FORMAT_P030,
>  };
>
>  /*
> @@ -1779,8 +1780,9 @@ static bool dpu_plane_format_mod_supported(struct d=
rm_plane *plane,
>         struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
>         bool has_no_ubwc =3D (dpu_kms->mdss->ubwc_enc_version =3D=3D 0);
>
> +       /* the SSPP can only fetch P030 compressed */
>         if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
> -               return true;
> +               return format !=3D DRM_FORMAT_P030;
>
>         if (modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED && !has_no_ubw=
c)
>                 return dpu_find_format(format, qcom_compressed_supported_=
formats,
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/=
disp/mdp_format.c
> index 33da569eae5e..2712a73e5783 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -298,8 +298,7 @@ static struct csc_cfg csc_convert[CSC_MAX] =3D {
>         .unpack_count =3D 2,                                             =
   \
>         .bpp =3D 2,                                                      =
   \
>         .fetch_mode =3D MDP_FETCH_UBWC,                                  =
   \
> -       .flags =3D MSM_FORMAT_FLAG_UNPACK_TIGHT |                        =
   \
> -                MSM_FORMAT_FLAG_YUV |                                   =
 \
> +       .flags =3D MSM_FORMAT_FLAG_YUV |                                 =
   \
>                  MSM_FORMAT_FLAG_COMPRESSED | flg,                       =
 \
>         .num_planes =3D 4,                                               =
   \
>         .tile_height =3D th                                              =
   \
> @@ -606,13 +605,19 @@ static const struct msm_format mdp_formats_ubwc[] =
=3D {
>         PSEUDO_YUV_FMT_TILED(NV12,
>                 BPC8, BPC8, BPC8,
>                 C1_B_Cb, C2_R_Cr,
> -               CHROMA_420, 0,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_TIGHT,
>                 MDP_TILE_HEIGHT_NV12),
>
> +       PSEUDO_YUV_FMT_TILED(P030,
> +               BPC8, BPC8, BPC8,
> +               C1_B_Cb, C2_R_Cr,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_TIGHT | MSM_FORMAT_FLA=
G_DX,
> +               MDP_TILE_HEIGHT_UBWC),
> +
>         PSEUDO_YUV_FMT_TILED(P010,
>                 BPC8, BPC8, BPC8,
>                 C1_B_Cb, C2_R_Cr,
> -               CHROMA_420, MSM_FORMAT_FLAG_DX,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | MSM_FORMAT=
_FLAG_DX,
>                 MDP_TILE_HEIGHT_UBWC),
>  };
>
>
> --
> 2.47.3
>
