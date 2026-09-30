Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58415503BDA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786555; cv=pass; b=Wsakf4AlagcELmjfEZNTPCgAxMu9ycWXKcgFzaNF0+Mm40rYLGb47dP8mZT5qidD5Alx8T5EzKsuXvEf+9rcLMZJH1LLRF0d7PPg5bm8LsnXtRRNZaVRjOsxb/+Pt1N2zBmBkc36Z+aaY6UQEGF2q0Crmi6UeXFcKADfGC9rlvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786555; c=relaxed/simple;
	bh=gTj7bX3vYf16RXzawtYiO2NasAUyGzbiOsZs1/XlKb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NiFiLd1WlY57O9dygvd8mVT1k12UajE6hH1lAhSQ02PS4hExOkgvTCYZmKFb3OR+fuZyhEsdHMahomcdJVeJcX1r9Gj1skLQ/up7/2VXO40drHA5RpMYNVn0gdefd5Sb+iu91QBhKTADFItKFT4gQ4GzP1FoPhvhkGBQE4Nk+eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBU0+pAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMegx9i5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBU0+pAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMegx9i5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE03DV2405928
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=; b=pBU0+pANHB87dG77
	A3fm8IveP+Ag7UyWUl9XemM+27sK/70uPWCCammhgyIHxwpqWO2cMKmk9cYNz3LI
	IyUtvE5QN/EmzT0TJpn3rVjXoKqKq+jvjPe7qGyMGPoOSEbkbRh+Pjalzb45Q7hp
	dcgmoLdWDthQNv1aYqGBWhDfojNuWuvWY1+8SAyYKpdGZ0YcFoPUz2zWT5uyivvu
	14zuD3dUeEXCzu1oOqnN6XqZ2TrJ8VYQ//wWqYsN4ORiuN/mrfyCHdr9ej4Vb4j1
	OkqcF3X6TxyZidapwVOcUkdrCAwjhNtYlBbS8Fs7whk4wSP17hFy3DJFa7RO8LbG
	dXP0rQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2e35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:42:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1871351a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790786553; cv=none;
        d=google.com; s=arc-20260327;
        b=nlnKM9zh8QWP12pL+mBtn+ptqgS53UWpovGG9B45maoeGxooIGfsd4Z7epOt/ycyBc
         gasTNrYqudBB7dosv376WQc6lvk2b1rJ2IR0pog7flivcDnJI6B4BjdQPWOnzhjDgGxq
         FAlprTPlLNRf7thV0i48Aa0G9MIwt4LCTj17ogQ84IFsJbXI0O5BPonr67BSsGylql21
         Ew29hSrQk8QHcQEa2K2CDQfTclteWrB32FTYxv2yHaUoA0LGFF35xIHMnXP0mm4JDP40
         XZ5ruJQGxr2RjjD7/gmAk3rTLyaCMD0R/qr89b3g8k9pvH3ew6xBvhZ27Weugga8t/+9
         AyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        fh=gAjFgRR9wSEHUo5Fw5GYwtx2nnLDvjMSsF6tRQ3I2fs=;
        b=iT7VpP2LHfii5eU7ppPDtocHB3lcO5QpDTKnxBwaXjkWndXmVoA+fgmjGA36mshL/+
         u9FtyjDTy0pFysjUny/p0yMIr1jKjZu/G88NyLERP0GH+oyIymZENENWsyiyGo1aZN13
         sb7qnnXuY2FQxlaNH0r75z0YsmawXOPilngdrFXcI1Wj2/6y33AaKutoYIHEYBDE2APh
         Tk1WCDI6oMJVaIM6aX/cCO4Cd/JMlC9waTPx6FX4nJ6m75+97p9wwSr/L+rKgwpckCFk
         j+X13yGE2p1dqLc3cnISG8HXG3KswAmw7UToHOkGmEBpO3dJKLNz8jYFnPcBaKi7JDRd
         4cAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790786553; x=1791391353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        b=gMegx9i5sCVOnYzNFag0LPOJvzX/fiCBs251aRvWVfmItmP7MHzDax6bk4xkwbTdx5
         NOIuNvTR5ayShmpKBsyub19+SEkGJ0SE31z3f5P/w0tbyE4WLKJtzQuQp1LfVQmeDqyW
         oPov4Q1YnizqRgRVHe2YNEY+sLHJCMaVyKkjowDJM9OW0zv12T7oIA20M2jl8ZCbF2gP
         Jz+rJFoQzAPYQgQMdZhFJhG94tVNfO/QFroYYWL8AFaCtAodyzXyy9vah1zhkrt7ck5w
         T6qCpEUrAprS0d8EPSF/5+YPQnscyKrTK4dYNX13dFfZuwNlWxRqfvkgk708aNxkGySt
         /Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786553; x=1791391353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        b=beabTcayKwu91rGOFyODi7b9YlRs1ZeuWmpumgnH6CHO62/4ZDwbckRJMyaRzIYJlt
         b1F4puzyEtJwNeTaTbIm7AECGRKIQ7d+i5V9XHY5/u+jih8oKNpUPladVE6Qe01S2vZW
         2/m7Jr+7gYCtAz7HraJar0zE/niUQDfqE4toJx5oV5ypkcNR4mpnuCo3lz6A9OVbop0a
         0Z8EIqajxHRuwHV+qz+XRhNvR+RquGbs3/3nfN3k8gqS0LyuMkZGfC3xuAwlZYOujutD
         fPBkrfTp5IxWCrAKyLyDCKRyzEm8t9L+bZtPaBEsLwSfymbX+R47x89nRDr3E5DpDpA8
         FvnA==
X-Forwarded-Encrypted: i=1; AKwUvBwLe7ZMF9JJoBmajHR6W91wAF4kfdW6kC98lQ48RMfESyv3Wwim6y0btb/7p2+sR1kfd9MUjNGronTcWbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxYBm8YWqr86d4ta42E/klMb8vSjP/970LKGuhFfqhXuo9eiVK
	HYdpgwh4XVGOSAiXyBTLLPgwjt5/rC7eM/MH+UIdFupOi78rqc38SejsfothAh4u7dBukZ8atQv
	jBN2KLBGM6ida7SjNUQdpVC5grMI7zCPqm84IRTKHW2+AD4NJgwYPpgWTkxbT/A/m5bV+wBhznn
	wn1um3wrRtlpG2KFB9t3kzezU6V7coegwNzmyYQkoraA==
X-Gm-Gg: AYBFou1k/vMJ3nUfNFw/RqBuSQ+OTKvQYQ54YPfJeBfb7Tly+1LFXzyBnL/rfqLphYf
	o7mcQ9an2DN1C47HthnkDsxayncyXdvlrzcvKgNE/YOR294+U0ScGW1P9XOmYP2Iz6H1Jqb56W/
	OK5FDQp2KD5+XAcECKT/fhYQOaBp+eQ7L0QojYUTouGQ3u6gWlCx5s7mjceP1uiA8rxmhrzbFk2
	tOzqqeLLY0odLwt0A==
X-Received: by 2002:a17:90b:3c82:b0:3a4:9462:5a69 with SMTP id 98e67ed59e1d1-3a4f3512faamr135068a91.21.1790786552648;
        Wed, 30 Sep 2026 09:42:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3c82:b0:3a4:9462:5a69 with SMTP id
 98e67ed59e1d1-3a4f3512faamr135035a91.21.1790786552126; Wed, 30 Sep 2026
 09:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com> <CE261C82D3A29A3C+1dca40d8-c022-4120-a3a3-a812a34cffef@linux.spacemit.com>
In-Reply-To: <CE261C82D3A29A3C+1dca40d8-c022-4120-a3a3-a812a34cffef@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:12:20 +0530
X-Gm-Features: AclHuK8WzaQHu8Kb1U17BIo3W2WEuj4Y3xTSWnhwaShvCMytjWvQEe1KjMXTQoA
Message-ID: <CAHuiULBK9wawyubGsqJPSjDdtP2=qDG6RU9_asB_6VX=r=-5zw@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NiBTYWx0ZWRfX6WSH1Qod+fHW
 1N/b6Rv1OMSMadF070MvUzEhS8n4ciXOmRO77gXzMaMiRuqic6lHUAXVD2dwzpvf6f+CyjlyZ7J
 KAFGxkeX916q4WRf08xA2CKXiqA7uZk=
X-Proofpoint-ORIG-GUID: o8tQRRRXOxtYHqzuWGMo1q5LAMLtHOoj
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd3bf9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=lv0vYI88AAAA:8 a=HrkiEsUUJrMWRHDLxzcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: o8tQRRRXOxtYHqzuWGMo1q5LAMLtHOoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NiBTYWx0ZWRfX23caiQH1eenm
 Gl6Jc28eitgTCmq0FjNVsbMXTamgLg9TZc9v8ghTTCLgB75ZRYmq52WmRvf+3kR/K3jGA6jz28z
 WoYhvn49xNbvoJybE4l9A8fwhcP6ImBXAzE3baYo1Kbt4OJ6pcgcpcugmiFFPN5hF/Qw7OlqQ2Y
 HmWyBvfUFTa0e4a5K0pSxtjjSTrv9oBJXdyA+LYBx4ij/JgKa+fvhPj6UCGS8Dv5rdz3CURzvHT
 ao+dA3i8QfKrHEwbcWmGphq/RIUaI9+C3m6U38+OLMb7aP+wJ25PHo7edWdFOEFPVNYMcyoTTZV
 nHvxfJFcSlOf9JOcx6RD/mdvy43EKBn8OOJmq50wDfyebj3TNm98CFg4kRjqMPd/LZRcG28pE5V
 aUQ52rDROxm2sjHOoG7a0L6XAfJ/AMlT6+wPGrKZRUwkZb5xbemNRMoPVXwGMG1ucH4vofJogBU
 +BlVMFOJGA6mfsc+fBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300066

Hi Zane,

On Wed, Sep 23, 2026 at 7:10=E2=80=AFAM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
>
> On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> > +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> > +                                  struct rvtrace_ramsink_priv *priv)
> > +{
> > +     struct device *pdev =3D comp->pdata->dev;
> > +     u64 start_min, limit_max, end;
> > +     u32 low, high;
> > +     int ret;
> > +
> > +     /* Probe min and max values for start and limit registers */
> > +     gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF=
);
> > +     start_min =3D (u64)(high) << 32 | low;
> > +
> > +     gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_=
OFF);
> > +     gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH=
_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF=
);
> > +     limit_max =3D (u64)(high) << 32 | low;
> > +
> > +     /* Set DMA mask based on the maximum allowed limit address */
> > +     ret =3D dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_=
max)));
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->va =3D dma_alloc_coherent(pdev, priv->size, &priv->start, G=
FP_KERNEL);
> > +     if (!priv->va)
> > +             return -ENOMEM;
> > +
> > +     priv->end =3D priv->start + priv->size;
> > +     priv->prev_wp =3D priv->start;
> > +     if (priv->end <=3D start_min || priv->start >=3D limit_max) {
> > +             dma_free_coherent(pdev, priv->size, priv->va, priv->start=
);
> > +             dev_err(&comp->dev, "DMA memory not addressable by device=
\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Setup ram sink start addresses */
> > +     if (priv->start < start_min) {
> > +             dev_warn(&comp->dev, "Ramsink start address updated from =
%pad to %pad\n",
> > +                      &priv->start, &start_min);
> > +             priv->va +=3D start_min - priv->start;
> > +             priv->start =3D start_min;
> > +     }
> > +
> > +     gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_R=
AMSINK_STARTLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_R=
AMSINK_STARTHIGH_OFF);
> > +     gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_R=
AMSINK_WPLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_R=
AMSINK_WPHIGH_OFF);
> > +     /* Setup ram sink limit addresses */
> > +     if (priv->end > limit_max) {
> > +             dev_warn(&comp->dev, "Ramsink limit address updated from =
%pad to %pad\n",
> > +                      &priv->end, &limit_max);
> > +             priv->end =3D limit_max;
> > +             priv->size =3D priv->end - priv->start;
> > +     }
> > +
> > +     /* Limit address needs to be set to end - mem_access_width to avo=
id overflow */
> > +     end =3D priv->end - priv->mem_acc_width;
> > +     gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_L=
IMITLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_L=
IMITHIGH_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF=
);
> > +     end =3D (u64)(high) << 32 | low;
>
>
> Suggest introducing gtrace_read_pair/gtrace_write_pair/gtrace_relaxed_rea=
d_pair/gtrace_relaxed_write_pair API,
There aren't many pair registers in the spec outside ramsink so I can
add these APIS for ramsink only.

>
> They should be used frequently.
>
> > +     if (end !=3D (priv->end - 4)) {
> > +             dev_warn(&comp->dev, "Ramsink limit address updated from =
%pad to %pad\n",
> > +                      &priv->end, &end);
> > +             priv->end =3D end;
> > +             priv->size =3D priv->end - priv->start;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
