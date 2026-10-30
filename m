Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793363766;
	b=iXPCXCLE+cDDsLS6ER5gP59JfK9fbrpM2ioCdy4CAeiPDIK6VQ1Q1xB71snO+WJLyLAF
	 B+1F84vxDygPWdhzbYt73gYwoOco/0QbDMEqFm3keDBrypJSKZL7I/Cso5GjJWxDmFLrS
	 ZQs8ldMfVOnTA+7Lzr50bYWw1faIz+7ic1qyzwEWDHhfJUMZdF4pUaFNwZUvSwGD+Rkkb
	 /Z1UevxmrJFL2bzHxATAUWXJcLBhOmMDCt50jMpmTESTcuoW2dyfoIF7J3WXK+834XVKq
	 dEme1Pq8+BPd3YT6PXUb359e2mc/KYXm4uP//RgxA5Be5DVYet/daUfpE/l/RhL8DEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
	b=sCWzxfa+jN/wlBRpPJptD88hpUusOl34oJ+1jlm0lR1rnQNXjiSxbbXEpj6RuQeKLa3T
	 h2CTrC03jzsK5pKtbCtmgbmHkcU4VehdpWyh4/yCcAr07/kT6nZSOQisFeN2gYkXkGUGf
	 /4ekLZ+K6A+kf6zqYC1X0vl2G3eO0nVoP9s8oFNa/hbp8nhEWBjsgSFFyx9yykkLgLZne
	 BsAdBtND6woqhy/aTKTF4zlEfB2uIiiZrVCpy+Epa53rpTe50HN6ZFI98qqqzRbc2wW7G
	 KI37avWWMH6QmaNrRm30dygejGR4xSlttxKmzer2WrMwtE4lOhns6t8MkI9D4cnLs7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3IE4qwQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIVHSkLm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C05606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C05606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3IE4qwQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIVHSkLm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGEoO2784155
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=; b=e3
	IE4qwQOFgqK0bbRwjOQxAeUpHNDVsU5XPnIuBzxao7roUq7aP0qACrqYYEVkp5zG
	5oBydsI7dWtfmDdsNKVJ/XGKezJ11vkTTn39WTOWlRHhWm7XQ8U9O2seE4HDrPBc
	DEv6nU5H26xRc2yeFh2BfA7Mcv8yOzRNBRQR5yYqnWo0kZHGUQ/+JkU7xqUL+5m4
	Aj9VCtCaFuyFrHEZbPmTrPz5nJsZ/plqhFvb+pccGa5pJYSRrMwK3UMt7cH1a3ZK
	zSnTShpr58u6PKFXAWaz8ZZf4tJUfxIYGD44MirKKJCFnHtvV2H8k5ZzNQZjtU04
	YYA6jaOZIxkcMdNblQsQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk196-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:36:04 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4574f1cac98so681367fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793363764; cv=none;
        d=google.com; s=arc-20260327;
        b=JHjfdapViAT/kHOWYOzPmGR1gIduWQPVZequ0phM166zAZRwfCw2M5chdkN27Yh5RK
         t0Q0g4WpuCF6oPZp3SDg3rTOJ5EW5OXiig5D6hXtAMuiy4801kpBg9RT2y+AdRJPigvY
         wHyzwzMZzQhm1r2JZdE2Lf8XQuwXMSZlBRwYyI8elFGo1ks/flFP7Ib9S9Gx+KFhnfLu
         0/d5209cxtuCR62qPpE4vNs3IyQOvS7UHq+T5mfp9zqGrcnZgATLw24/Ao+XwSCRl8aM
         0ljsf8AvsQkv9HKgfjTVxNXObXDXjd3V8mwivLUPGgfcTWj8liaUhEqCNs1Ss9Vk7FNm
         /5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        fh=aGpX8NkT+tw7rhWIpm+crVrXoCA+xxIdsp+USq5c+po=;
        b=csqD1dxHUyHx6MSYzjWZUus8wVHTE3WsvXKxEB8SViP+bQGw/rBYDxftvMjyUF5AZ8
         bBBKtfFwm64p5lK0hNrGwuMDN8MkMWj7T73ZodNYlWTH114+oPR6BnU/x6J29pUOPMcW
         qS3FoJGKQ4nwgCYSSzYra3CjYnqzkU7szxUAW3WFJteVmgAjs9Lz5vYX8f9anJPJc9Aw
         TaruKXp7TeWO3rwEoePRtGyUrjz4KWd5IyoxDUFudAaAczznyBmfH1+KYs9I2mFW+9i2
         Q2xB7g3Aym4HahR3dgrX9J/K/KIdXhR5Ebcta16MkQECz+SBin1pW3gwtBnxZj4E8g5V
         UDzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363764; x=1793968564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        b=JIVHSkLmdFHFvLL4PwNnBjMznwcrJoOOUUsqLDTtB1uB5P+rJKsP6Uj1I2La2aSkWE
         +6n6jrHaocIPmz+dDJOkLGo6kEFDlwBN5OK6npvsV8Kezitryu9Hv58Y1S5jRvo1KPXW
         W7xwHbM9GdRoo0KvWrfGCI09FEAiq6WnNTq9UmDAmLXvD+4MKSPAtDRqxrsXLsNVb1Dj
         I3yYMwPmAPda1+4+P/ro1tXtOJlyYfGA7HDfu9KDVGIIfRRzOiuPuvKNcqjJrvAQ8K0H
         UJnjv8ntou9UdAjE8eMlS/aB7WJz1qJe06tToYmbZFNpeMPoYB0uL3u85IsvwqZFHubV
         KYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363764; x=1793968564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        b=C2k7OfFJPv+62rHeEdodci68OP1za0rMrxiXyL06YQ2JXPfY5gUng1etrTOqMxFsAi
         y9HJXgdb25wY0xgKbtIw4kge0V197i3iG4Stejlk9UoGOxbWA4MZQlxN/CLqGZlmkYec
         oLX/hqGlI2+7xHPcvpITilMkkBDAqHfjzil67lPVzbOG9StCyufM77KoIrToinehDVZ9
         dO+RuLpOMGsLuYEGRFoIWBChrKy1tueZxvGB73+pUR5EcyiRx8erkN3CBy6P5NIqHuLx
         XrX87AqPFItGNsfimGULO/V365n5pQZYzFqiH5jjPGrSiExK5XxH+i0NXoU7WE+NATUz
         JBBg==
X-Forwarded-Encrypted: i=1; AKwUvBxlorOhV351EwLPPeOul1YRBS6FqG+giJTd8O+8IYCGzNs9JSClI+0j4x1aWjrdTmDIfq3zb4NecWUba6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4jp7H7rvzDW5TAFupiaoo1hpEptgjXqKvptifHba18Q9ZImCu
	AsNduEzJFe9d2W8MIiXdAY4mRtSgB2n5QcjX7zi4WH3JSyuxzDzvBTZJNuTyAlkL70mBG0c6dJi
	Nos4vL7Hiqlpl1Te4f52APp51ticb/uNKtYreqQ7MA8r3b5rKGJ2pJhDa+Hqbh0tDvXw1sflvXj
	vMFw1t+a3Nvd6LuZm0sq+b4ri9C3srtOgHuy5FPZUs5Q==
X-Gm-Gg: AYBFou0H5Ut92/hTxF9vEKj2OHRQJ1M0UHLGitqSrZSBYy55iisdiBsUP+v4So6zHUV
	6ifIVY+94lfHU8N/QqY53EBUNtdIBDVcgxE0U0aahWoRaiZj8KpySxHfBOfGgf/uTzqoHPKflle
	wH11GoTFDCOg/wGnd0ysq6qJg/by52eyd+a2LNIi5iU60ax5/IrBq6w0G/sQ==
X-Received: by 2002:a05:6870:a104:b0:475:e066:7714 with SMTP id 586e51a60fabf-4a9076f5d71mr1257355fac.27.1793363764164;
        Fri, 30 Oct 2026 05:36:04 -0700 (PDT)
X-Received: by 2002:a05:6870:a104:b0:475:e066:7714 with SMTP id
 586e51a60fabf-4a9076f5d71mr1257338fac.27.1793363763749; Fri, 30 Oct 2026
 05:36:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-2-robin.clark@oss.qualcomm.com> <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
In-Reply-To: <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 05:35:52 -0700
X-Gm-Features: AclHuK_Kxv6J1o1Nk4jiUTeYgcQUlfsMkvo2Oyu2LlP58eHKHYlhfwHqpLn5bVY
Message-ID: <CACSVV00wrjhBHtKE6iJ=yvdPVaZ0RreJm27JQ9KaKy50-FSA1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae48f34 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=RaxNTMYahNmlKwi_CG8A:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: fpkN0IlWEc8qKIY4vk01pOQgy0teAJHM
X-Proofpoint-GUID: fpkN0IlWEc8qKIY4vk01pOQgy0teAJHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX0aBNmeOnpHn9
 DVfsDmmyQXU9CLpN8GZhDWFnTN3yPga4+uZX71xxuWLdE6pTyvOxdlDRhe1A9TLhRQJia2evXvX
 FiBUqMh0+D2Gl68N40qWroMsOt6M2m7uk6vGmXHRoCQA+aYhVaIf741abWnEXF1XhdINdVwfym+
 Y1aRgba+Y6kVvktbeUHC8pwEjFEyN0N8HT7cw42gUmvIt/XbOjwiERi0KfAdnFGq2kDrn9dfUPr
 +kJPJiG+2xQ5R+LzxqB+DeV8tq+WgMzLazv3IVsaxi7nPpYmDIyKcrsW7Zp5BqlXRlGklNK/eha
 rzyGa6H8OT0wD2SHsqOI4GDat/yVIzj3ZQmuR9fp1tGGMpb4G1ZvhjUY+z8wKFlW78Uw6NOyKi5
 mWe5uohWyo7jlV1OiEtLH0FxShi8sSzs1Mr6yrqxzGAg4dWUF2EA6FxOXGeRf4Nh5ogCtofSGG2
 87xJS5U+150JjVrecpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX2Otd0oeps6PU
 RZS9E8Y13+nVFeLJlzRUuW7iHoY/HsZQbbbWiWqMv+ZfFzEBJmZ7Mgts2mOyrq02V/8hbcTDW9R
 X7U+T3t2g1Ll++qjLVP8Su7M4d7aLsA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300050

On Fri, Oct 30, 2026 at 1:35=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/29/26 10:23 PM, Rob Clark wrote:
> > Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices t=
o
> > select direct mapping") for arm-smmu-qcom, match GPU and display compat
> > strings to pick identity domain time.
> >
> > The drm/msm driver attaches it's own domain, which it manages directly,
> > so we don't want an iommu managed domain interfering.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> fwiw I'm not sure we have any devices with this driver and mdp4
> but anyway

probably true of arm-smmu-qcom as well ;-)

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
