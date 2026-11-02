Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793630174;
	b=rNAZ1h58mXt5tqvo/30A0A168tj3Fdc9awNNIfN8kwjjN9HuoeIWs+p1+dl95sQ/Um/y
	 xtxY72iZA2v9bfhhGUGsdHsLXqYe+QDf5Vhg3y/KD1TVWUAIRym9F2Za1n1M1eMdrXUlb
	 u7KrfdN0pb0xUHtCaTl79amPQpDpR3l+hpcK/TwLoNofYo1kk45oK6ng6H92NfT2rJLyM
	 z5inpJmf0YEvP1aSrTOP5qW4QajuSSLBFDryEd4hQoyx++ez7nB4CRasOeUkv04HRqdeh
	 eik0F/gPF/YOpzIf2QCFM2kel04flI0bGCSq5WYf9KDKqtS6pY2XRd11WfoEFnH560Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6dfJM6ExctLDjBcZ2yvJdTGWYguXRDvt1VCNcyGbkmA=;
	b=MnJA5niE4nqcLJ3JN4IN7gsxihX0Gr8SZ3yuXyXxz5mGTmfEK5oFHrDUEwaqUbjeF2vw
	 V+NAdf8sp2N8Sn68wHg0jFfMMcV7vhCv5/3vE0qJbKeG8dlHy6Ouz+P7uTvMV+El/HJfQ
	 xzZzIUUjqWoTuuxVGDQwpNCssCf/ldq89hfUReNg0OCPjodNXfMpGn7HwuUn1CvIffJ5U
	 DPgT/v5A3BL3jNKZPs6MVYNY1a/Lt2a/8HxK07tu05CVREvnFT1Rr5+85ATWMQWb5ThS7
	 h/rHfR3i0ehfXLvnQ7egIHpif73tC45JvHv2zmjQxTPh7bJQEcVhvqBrPis+N7fYYMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CBINMe3c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj9Ad3pJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8311260771D6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8311260771D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CBINMe3c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj9Ad3pJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpFE43512241
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=6dfJM6ExctLDjBcZ2yvJdTGWYguXRDvt1VCNcyGbkmA=; b=CB
	INMe3c8uOlrNhX43LITRHcaOovKgxvtVbS7dRMICt5u23ota/C8ZxYfEkwYxDnYI
	2TgQ57dHXJC551g3ztgC4ef8fg3rd8+XToZTnEo6c/qkpB5TZZ9H2ads0AxsDOWY
	C5Ye0MkR5C0zLWq++rCBZtHtiVaHFjzFHzYtT2bFufGCmKA6r51vpdrti1fcZku/
	BT6WZYrTQhXLPF91UWkr4nUhozHyev9oLnwfzZhfwK92cbjaax/hWw2Ymd1kYObY
	+L9SnK46FX8ReHr10BpRlPukwh31cT8M9k122winWjUhaOo2E4QvO47ORblhlsr6
	5zMVEL9VF/2ZrM9KseGg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh9dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:36:12 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8210034ccc0so3841854a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:36:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793630172; cv=none;
        d=google.com; s=arc-20260327;
        b=Rd7rGWvBm8M792XjJIApnaxFdXFRP2GtSqKWyt3mSjAp6LNnte6lk2Mo1U2xWu8u9k
         HhX1+80NkWnMRa98JFgZ10mNlCHbIsBj/19jHJiu8ca8OMX47FdaI+B15+q7E7nkdk3q
         ASsgtoD8/R7KVHsDBfVdGW1Op4HihHUwz9VYlnuMHlkpa/z2H5NPpxC78E4yRILzQD5x
         t+2x5I2ob7GjrDMyMlHdLgsaKjmZ31JbXzgkGcydscW8wpdSj3qT7qBwtxYg3ZiJ/eWT
         LRiX83WewallnZ08dzgiUJ8HSUDeEsgIJV2rTZpGq6XtUQSp94ri5dX7kFl9SbmORJlG
         uMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=6dfJM6ExctLDjBcZ2yvJdTGWYguXRDvt1VCNcyGbkmA=;
        fh=6Ut8+c9jvm8tpoPb3dXuj+55jX++FalOEwhItdDdlBc=;
        b=L97kEZy7xZb+qRG/Jl7gOBFnwVgZDgvnK+GUeKotPam3X0j3rDpz6/DoBJdLxjyH7e
         /3wcfdjYM2jBUTJ4ktef5BUt75s7Yrp761knjeQAWNhB/7/yH1kFdDtfi+GSZW5RdKra
         Jqw4tCJ8GTI4dDtP3guSqJyh1VQpAA6KBZz6mHYevHNuonxQFN0O3k7NLcEVgwapU8wP
         t95HXJDH7ydlwdth6KHdzvTzsvxzTqepWkoWDUoLqiFOG6Gui6RQuxSIh1OlVtNPIN2a
         MPHqEmzBQbcvXBiLoRULH+SbcQoWbeelVJqBlNgQldujpUfPosnW/noEM38rHXu5+qlS
         HD9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630172; x=1794234972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6dfJM6ExctLDjBcZ2yvJdTGWYguXRDvt1VCNcyGbkmA=;
        b=aj9Ad3pJXzLi2HdQ7kYTw+tnZ9KJKn2uOvDUYLPUJ6wiqMwaM/kTUU8NJN/U3H+6gd
         Aq/MbUO5teVuzJur2PXIfPfeCK7K5uOyGpGM5Z/RS1fY08NKdk9+pviYdVyLC5XDV0F6
         XXtemBzegQiClIEDoVbqWuwVRGcGq4n3v3IigrL4RX/X4/DJxVDy28AlvveSwWP5yQi8
         59DwnNIsVEc5GdmXLfzrp3eBZ5LqjQTr3wp4U5LOyfro40T88tW3AbQ/dTXjwT2UFkHN
         ttR3JlbX0dlc3zr63oHLDsBuj2X4MrIb5QghoTOMa2xfkjfuRfg/ZHEsUsSe65ZPpn0A
         tJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630172; x=1794234972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dfJM6ExctLDjBcZ2yvJdTGWYguXRDvt1VCNcyGbkmA=;
        b=lj0aO6+4hPVM6jsYoeKB6MsWR3ExY1kesO9nI68VLQ2R7/k2FKsdEGA9hwO57pxVmk
         6kkkzXxqd3WY1xyT3K3Pm8mpulxG3WdX+pI/gVcol9gHCBxMLYEKmD942nGC693+xGLi
         QS4Mlb8ctNmOD++NPydoa/xNA50QvPgMj+kOEHVLn5fkz0Ga0/M5f8Ase9nQWAbtCrpe
         ygYn89i7rG+dPFzQ9KysXUNhbfKrK7nBe84O/SaN3guD3PA0twgB8ihbN6H/FbaV8lS5
         6effH0scMJya3YZfzn0zF5CrN+MyLu7QLeWbWIS0n5ow5ylRTARS8bYoA/B6lWcObw+b
         Gt1g==
X-Forwarded-Encrypted: i=1; AKwUvBwc9S3/S4ljAMgTEQ2KFoU9uFMZqBGfBxR95HgEvectMsvaYaB7sf9D8+imPLVpNLTc3Y8MCnHSZ8vgEX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLWwFwD1PFLnotZED1IHB8HotPWYjNolWTYrYlAEKftWwvETFq
	r9cdAlMeQlRF48hgXHrbYrzWmxl6YDCLBbakEGRyZFzIzlebXaPKinL2DfM/iTPv58emcsJjwPN
	0oWN4dbPgn46TMWiK3m0N4Cd9GtrEhxUkFmv0mvOohhilHU/jUq58U3FwRDaE33KO3DeIoyrFtB
	QEt3/nztn10dX+rpCsuKCUlqMKa22zFn85jiZjzu6J3w==
X-Gm-Gg: AYBFou0oPb+FFSstpbwpwh6PoaDsf4o0R3qgz35QabN9DP4HcuFSlaw74DSvXpU7h+3
	7Ds3tP27WrDFIBYlTuS1OAc6nCL/yIe5jWyZyIEdE1KBDWZrk/H0d3sO6U4Pl658cWEbfQpFX6y
	r/bVzNiuUTnpCd+01BlQf2d4zbc997IDljpEGOMB0yAuhgRFRFxoNaNpPtZw==
X-Received: by 2002:a05:6871:2b26:b0:4a6:f484:e880 with SMTP id 586e51a60fabf-4a906c77708mr6209101fac.0.1793630171633;
        Mon, 02 Nov 2026 06:36:11 -0800 (PST)
X-Received: by 2002:a05:6871:2b26:b0:4a6:f484:e880 with SMTP id
 586e51a60fabf-4a906c77708mr6209058fac.0.1793630171045; Mon, 02 Nov 2026
 06:36:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101175553.53746-1-nicoangelodelacruz@gmail.com> <20261101180508.66598-2-nicoangelodelacruz@gmail.com>
In-Reply-To: <20261101180508.66598-2-nicoangelodelacruz@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 06:35:59 -0800
X-Gm-Features: AclHuK9gfrDGQ5PLQCt-XA9GyuDskdynBG1Pwp73OvlDTnKYRXDLZaDVIm7EHOk
Message-ID: <CACSVV03TBrktnuhphsTPxJPKrvtiAtngYGx4yGo7hL-Q6TCybQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm: serialize devcoredump reads of the crash state
To: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae89fdc cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=gB-Dnt9bVocfTiBQhWAA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: tWXMd5oBV8e5Qxo6F7_Tg7OIyUCAOh9R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX9kyhENV82Kn0
 0+ytv1JPenCDda7xmO7/RGlJHWmZlL9C8oztmN6SHSnH+0ytwYKBW1nwjIS7ymZpv36uVCqiqLK
 2wzjVs7v8DL84sYWLBFhfa3MsxGBmK8=
X-Proofpoint-ORIG-GUID: tWXMd5oBV8e5Qxo6F7_Tg7OIyUCAOh9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX/eDFz9xfx6xf
 Z19WVEqTVOKM/r48RUTobndkaxFbfCRPXM/uALtNcZzInAVexwDbd5dwkltZZIcKhhUgOKmDSVr
 ldKH7yetYjhOSFbQoLQ65EGO5ok4gbEXRen7jZtP0AX5bR+LlMu4mKPkkgg8RZKjo1GkTQAXCNJ
 87RCZTw/PV4FiID2+I4qVp2jeCaPv0uGHjbNaqyWqmlPO0Kyb5A9Oxbeh+4eTt8a4g9uXHCogt6
 atY0vbvJgXofk6mhLxbFG5ttFwDw1KEWxiWtCC+kguWa5w2/EnMsMJPiWpXKBGoqjUCIWyE9gOV
 paEdfwG+Wf0YQXWzmC/qAd6Pr9VZmuA7vsvpbo2shgstLfbQU4P/PujzrEzhzpHwa6o2v17JQVO
 dfcI32k0nagKVd9dUkt825E7FiamskQPUZF8T7HNOUY4ENh9bvLvFVSeDkrrS4Qh6yIj3sl1Dlo
 QeLg/bdBIOdgYTonMvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020058

On Sun, Nov 1, 2026 at 10:05=E2=80=AFAM Nico Angelo Dela Cruz
<nicoangelodelacruz@gmail.com> wrote:
>
> adreno_show_object() converts each captured buffer to ascii85 the
> first time the crash state is shown, in place: it checks *encoded,
> replaces *ptr with the encoded copy and kvfree()s the raw buffer.
> msm_gpu_devcoredump_read() only takes gpu->lock around the reference
> get, and every read() of the devcoredump renders the whole state
> again, so two processes reading the same devcoredump at once can both
> see *encoded =3D=3D false and both free the same buffer, or print a
> buffer the other one just freed:
>
>   WARNING: mm/slub.c:6733 at free_large_kmalloc+0xb0/0xf8
>    kvfree+0x44/0x60
>    adreno_show_object+0x190/0x240
>    adreno_show+0x1d0/0x438
>    a6xx_show+0x68/0xbd0
>    msm_gpu_devcoredump_read+0x144/0x1f8
>    devcd_data_read+0x34/0x48
>   page dumped because: Not a kmalloc allocation
>
> The dump also changes length between reads, so a reader can get a
> short copy that ends at a page boundary.
>
> Seen on an Adreno 830 with IGT's msm_recovery reading the devcoredump
> while a udev helper copied it out: 16 such warnings in one boot, none
> with this patch.

Probably also something that igt should cover..

> Add a mutex to struct msm_gpu and hold it while the state is
> rendered. Only one crash state exists at a time, so a per-GPU lock is
> enough. gpu->lock isn't used because a devcoredump reader would then
> hold up recovery and fault capture for as long as it takes to render
> the dump. The new lock is taken after msm_gpu_crashstate_get() and
> dropped before msm_gpu_crashstate_put(), so it never nests with
> gpu->lock, and it is taken interruptibly so a reader waiting behind
> a slow render can be killed.

You could have a 2nd state snapshot live with the debugfs path, fwiw.
Note that I'm working on some IFPC fixes in that area[1], originally
part of the a8xx state snapshot support.

BR,
-R

[1] https://patchwork.freedesktop.org/series/177370/

> Fixes: 1df4289d5b23 ("drm/msm: Optimize adreno_show_object()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 10 ++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h |  8 ++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index fded78fdb..428dc9666 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -191,11 +191,18 @@ static ssize_t msm_gpu_devcoredump_read(char *buffe=
r, loff_t offset,
>         struct drm_print_iterator iter;
>         struct drm_printer p;
>         struct msm_gpu_state *state;
> +       int ret;
>
>         state =3D msm_gpu_crashstate_get(gpu);
>         if (!state)
>                 return 0;
>
> +       ret =3D mutex_lock_interruptible(&gpu->crashstate_show_lock);
> +       if (ret) {
> +               msm_gpu_crashstate_put(gpu);
> +               return ret;
> +       }
> +
>         iter.data =3D buffer;
>         iter.offset =3D 0;
>         iter.start =3D offset;
> @@ -214,6 +221,8 @@ static ssize_t msm_gpu_devcoredump_read(char *buffer,=
 loff_t offset,
>
>         gpu->funcs->show(gpu, state, &p);
>
> +       mutex_unlock(&gpu->crashstate_show_lock);
> +
>         msm_gpu_crashstate_put(gpu);
>
>         return count - iter.remain;
> @@ -914,6 +923,7 @@ int msm_gpu_init(struct drm_device *drm, struct platf=
orm_device *pdev,
>         gpu->funcs =3D funcs;
>         gpu->name =3D name;
>         INIT_WORK(&gpu->crashstate_free_work, msm_gpu_crashstate_free_wor=
ker);
> +       mutex_init(&gpu->crashstate_show_lock);
>
>         gpu->worker =3D kthread_run_worker(0, "gpu-worker");
>         if (IS_ERR(gpu->worker)) {
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index db9e11e7f..9b683973b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -264,6 +264,14 @@ struct msm_gpu {
>          */
>         struct work_struct crashstate_free_work;
>
> +       /**
> +        * @crashstate_show_lock: serializes rendering of @crashstate for=
 the
> +        * devcoredump.  The show functions convert captured buffers to a=
scii85
> +        * in place on first use (see adreno_show_object()), so concurren=
t
> +        * readers of the same dump must not render it at the same time.
> +        */
> +       struct mutex crashstate_show_lock;
> +
>         /**
>          * @recovery_in_progress: true while recover_worker() holds @lock=
, so
>          * that fault capture and GMU waits don't wait on a fault devcore=
dump
> --
> 2.53.0
>
