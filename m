Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792425221;
	b=FzApj5JkhPqNEP5cLIE2HNStl+o07nn/8tupSj5VTVPZiMGbG0nR6+L9SAotESymHhWG
	 utK/ykbRiwmHHMPhKxa8HR7dVVCPpt4V1MpUBpRAHlW/A7Rxc/CMLGPKo32y4Jiao7I7k
	 EKhxe5kHN1A4t9ClvSXVnzAPr0BYCxF9/hNonsnY5YV79dqhfOuvL0v81LLoSXRVj/qia
	 a6+pDcGA9WbsiHLiDMOtbsG2VXkr7YQwIwqGIZx2gvLWe9QJI8cE+Ayl51gBLL3Y7Z4km
	 BYDIqe1X/5gjwzR2WfeJS+I67uv0qby+Ak+Mlch9Hsj4SKFA/Gry8HJxhyaT0kZesnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
	b=Mm9EWK61XrGlFZfKJML9BQv7+l9pS+eV/FwIUZZmbsrpiRiXLyJeQ0KqTJHtz546FX+c
	 kekHvr/xHhu4AHUXxwWSSRxrThYDkdUb7H9sRCsk9iCUxJJBoAqUdSrLgUVxBn6mPQArD
	 EWtuu5rlBXq/9FRwBrMgXTXZkgytq9xWdwr8iLd9+sV8ujbVgU99CFA7K+mWHY3vCHooF
	 I5fVlr+LMWttwf60ky8WZqucQ97eOQoXVHq07Eiz7W/xRC8VpDJ9tgJzyysXnthgGmCHQ
	 jxit0yjy0CkrC3qNuG43JaY4GE/UdD0IFj+9CrGDtVVUNmestKPEGhm1aKV7rALiieQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rd412vdY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vpe7kSw1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A422606AAD2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A422606AAD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rd412vdY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vpe7kSw1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFP2kV036254
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=; b=Rd
	412vdYZ6pr+FIF/LqCVeE65wVB2AaKvNCcSUOW3Ygrv2XQ1O8BxNWia0WShOYeFg
	TH5bNmIi5IQe4w/0dWJoYBxI/cnkulrBv3h/HX+thbMY+N1VEEG5tiZ2FeQF1/Rg
	6WJ8nvgBbbetfszsB9KU8lqRAw7RBWjt1ASWAsJGENN3xSqwLjTa5bb6buJA8Tgk
	EmRY2GXxOsaAUjiQp/dFxxBIzcm/IdIxcPh8K7wnAbQCl9kOIXEeT9GA7ckii7i1
	PFuHmlJi7x1qUOiGInfJQzoy0uRP5ovpfqJEpFor3F3LP8AHWXilAeTSowP0M8FW
	FIlrgi2j/xaJ7bNJUT7Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47j1qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:53:35 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4574f1cac98so3671827fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792425214; cv=none;
        d=google.com; s=arc-20260327;
        b=iRKm9P1ntNFqIKiFvnTeweeiexpk0ESuy23AAB3JdNsGGJLRCeZHkKidTOy2mGP1BL
         XAcmzyAqrC1BGPtNYHXqtJ7W5y09C+Gn5eebpuFebzo4EMl/t7vb1C3FmjcVlgaPCd/p
         AeA+0J4eJcM0ek50wDC052aqLCtIX9nEwF2f82CtcR3UtVXwg73E+XQPoDYbp50otHaV
         T61znLbB/izLPIou/5aYaEMwN9gmDIslZG2/j7aLDoUC/WolAkNbsndXgs210pmr/z5n
         CmZ0FMrQHCGeGXj4uH/exysbBo63nK5Bxgywxx5bFB027j3ZVfkMCxRKqj9MMhEQpF9Q
         poaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        fh=kabZNoAIjh99649433BXwwK507dIozaUdQ3sc1ZlUuc=;
        b=mV/mwoZqjw0GnQBueHjjmP6EhcvhOm0sm6pSOsFSQ5Nf7FJ3MDXTEnLwnx52SGoNhG
         xWz+tbEhEtClRd6UCp43/Qn+LNV0MJb4VnxgzeenvgaMckWULuUNgYvNLEieyea8p5yl
         EgD5032RJgXxQ/V9OHNXt+rZNBB/TAFyueFzelkQLrGKRfK4xTsOmLtcUCzmGQW3B3jO
         ReeArj1vOkOLQlMAuLeyI4TZlUFJvJmYOWDAsUcDPwT2EBECrdLqBM+391eCGPoSU8nF
         Q38Fc4KwYexyO7RtlaB80KpSNi7pap2CUYNvgPQWPeM++En8cW4/piU0vEbKjmItAQ/2
         rdZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792425214; x=1793030014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        b=Vpe7kSw1OEX4fUVbDnRcVWIabreoGHjVucRfYXQ1veLVXKPJF02qKA8AaoJw7m84yg
         QftYy7bRxYzMhn9ae1lUdVZ4oHEfSSaQk9f1uw2kpFpB4azNIiThuWIw65cf4e9C+ZE5
         SC/LLyh9tLPr62r9w1LDUS7Bi2ym7qWKgiDHewLGe17KX5QCWm2h2URTQAuzu7vkY3yu
         zx/b3YaB6XYeblTNva3eq+K/ypDVQ0nGHZF2xoIV9kOxFs5MUg5D3p42gLzgfwHkHoQe
         8X2A85SO0FqsAcUtzNOPD4AzWpuZTBe9DIb1TMG7CJvmCZrCLm6SSrSw4zL0FiC6HVnl
         9Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425214; x=1793030014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        b=fxZh/3Lg6F/TYjOCRVh8oOuG9cU/D1+dodLAlj4lsrOIFWhilXkdTNhW3UxvfJONaH
         B391zJit+QwHoLk/Tco2oMllAuo7OkVFK9XJXvvO/oRHULb+nBs+B7drrO0i4vfTIEtb
         2PsQkKR+TGQagkgCuU+mD3OhSJlGqXwxRN/WbQjn3gQNT002J+Ht01EKt6fXtTakpajD
         L6ZFlvuAAg55glNuZRN/b/m/2tNAQsg4u6pUU0QcosYB7SWj23/GNrLZKjghP+RF8Ti5
         m55BC6/QO0Egv01n5vrNpAKya5Ks7NBo8Epa4ke4cUvNIkPM+rCgT8C891H12vqmlfQO
         DgNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDqZajQD8DtjQMxidItBOMhvMAv/uX7+0RZQi3hLN0Jqc3FnIuddI06ZaXK5W+4qO0Kc429JW+VxTBtMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFZLA/RVVLb4HO6AYyB7ssmGI96X4kIrnHU/vvhYlZYrkqPIAY
	b9KkZX2++mburD4BYkimso0/ZhEeoO4Ph4qBHAfE95hElUh9MtAkHi9mlHjN58u/EBS2yBtifBI
	ZGJEFfi49rTnS38O+rjOEJ4f8l8Xp1+7EzmwlvjHT2kdWErCUx0O5RK3PUyo2qJvIEgmH39iYXn
	OPSdduDmWUgBEC37VszMmZYyeid8+ru1OkQhJUP73UWw==
X-Gm-Gg: AYBFou2GknfDTBpHCSoe8MxZP7MaEFpmyiRtkdp+ilbPlSLEu0bMeLPFJtOB2Qc7DFT
	xkW8ChiGeObziNd6Rs/k18PzCdfsnWKSjJ8/uNDfywpQnlKlgynBDhlmMqjHJ3LYK5I1/zJduhe
	LQqiqaOXMX5nL0PzU6mz3ZCCCjcQ2V4cWRDI2bQwky53JYMKP1scv8uoug/Q==
X-Received: by 2002:a05:6871:2ea5:b0:492:d8bd:949d with SMTP id 586e51a60fabf-4a7575b6d76mr5836598fac.2.1792425214097;
        Mon, 19 Oct 2026 08:53:34 -0700 (PDT)
X-Received: by 2002:a05:6871:2ea5:b0:492:d8bd:949d with SMTP id
 586e51a60fabf-4a7575b6d76mr5836575fac.2.1792425213472; Mon, 19 Oct 2026
 08:53:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ar_AuRr1eaZzOfw9@baldur> <179096320161.1973.2852858792260211089@gmail.com>
 <c3c4d140-07ec-4402-a18b-389520df188e@leemhuis.info>
In-Reply-To: <c3c4d140-07ec-4402-a18b-389520df188e@leemhuis.info>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 08:53:21 -0700
X-Gm-Features: AclHuK8lwhBc9o-AjMwe7IooeXr_cgpIgGqUVsN4bF6VjxH_2L_fx0Hz7Wqdu8M
Message-ID: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 32Zz9k2IQ2YlrshjD5CicYLEjNR7oHi5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfX1GaqHxjZzIsO
 SyvktTLBnZlpnkL/V09CgkwNhkhiiEHdseNhjzAz/c4GhK1RKTSgFsWa/RLcNN1YFw+HXRzjVne
 kAKT05jSDCBfIVe6AlFjGtXdJzqtkupB8DObxUyZiFjRgu8+QiJC+Np6vO+vG8JM6qgruyA6Lv7
 Y24LtZWOs082bNhbMA38JQZy0CJwa0R5jo4aE1vmLwIA26b0frgmUaTcVdW5ga/3Q1J8285VYZh
 xjGfNG828EFi369lrjwLQQ9MEpy6Do6H+tmctpXgyADhXDLv1tvIWes2dzdmGSH66O8KfOuBDhr
 3YdEF2DS/4s/QXRq/UbySwTVm+1g3yQcPFj/pY+4Df0q6E+WaJqAXBxeBtb24bfdZiEhw6ayYOw
 6Dvg8KvyD3oTzE+2898s8LYiZ3E+3b2Lkf6/Har7N0vvjc7SZSP7izG6Kh5Ul1eTj7yutCIMTMt
 C32WLtFMA0485yhLTXA==
X-Proofpoint-GUID: 32Zz9k2IQ2YlrshjD5CicYLEjNR7oHi5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfX6mkPCxEpzMJw
 JWn8V3NpkD6FEggQ09/qVlnnfMtVF2230f178HctwrxDML8/8h1HzRt1r8xxUC67AVOxdt5HYVJ
 EvX1mGNetI0yGyByzXaXkLgmzHE4KUU=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad63cff cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=lAgNKBcoAAAA:8 a=7w3WoVYdraEV06504AMA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190063

On Mon, Oct 19, 2026 at 6:47=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/2/26 19:47, Oleg Keri wrote:
> >> This patch landed in next-20261001 and while it works on my Glymur CRD
> >> (COB), on the Asus Zenbook A14 I see the following failure during boot=
:
> >
> > Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
> > firmware v5.2.38:
> >
> > [    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interru=
pt] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for=
 response
> > [    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Tim=
eout waiting for GMU OOB set GPU_SET: 0x4
> > [    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu=
] *ERROR* gpu hw init failed: -110
> > [    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU =
firmware initialization timed out
> > [    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu=
] *ERROR* Couldn't power up the GPU: -110
> >
> > Compositor fails on the first start and works on the second.
> >
> > Reverting this patch fixes it here as well.
> What's the status here? Was this fixed meanwhile? Or is this regression
> how heading towards mainline now that the merge window is open?

AFAIU this is still open.. but seems to be contained to a non-typical
config (modules + fw built-in).  It seems to be caused by trying to
initialize the GPU (and send the CLX tables to the GMU) before
_something_ else is ready.  Tracking down what that _something_ is is
still ongoing.

OTOH not having CLX could lead to problems exceeding hw current
limits, which itself is a problem.  And why I did not revert CLX.

BR,
-R
