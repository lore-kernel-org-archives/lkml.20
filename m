Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBCC4B487E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056353; cv=pass; b=pwrco82M+nHaj8XeQpoGQXBf96Y2l0EG2BpcsJUiTK7+DaJqEVcYzub6QhndpLtAgp2HYCOyrFgKSquBbkBfnoa/YZj3lBTd7hXYEH1adaSxvIeQINTBebRzjOYa3PU1r3WxWF2EBfqXBeiczr6A9wJv7LCeqzA7CGajqFPZGls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056353; c=relaxed/simple;
	bh=4kcA1rVWhFCb6bHJIR5W/uz5wDQtM1654lmOyYLDrm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVewhgF66PYI2ty1wa8o7eleGdVV7aDR+ZFgGLn28OIdXSbsnXrUQik7GOF8nbbc0z4EEKf4qEqCnJWm7hjCw62BkskZQ/scBKk03GSb3tZo+UMJp78CsiHZAztcuYoRq9du8wT8Vfaxeh/Z2nL0QJYt3GpHnbl1ialXTwf+1P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eW0DNZd9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdckG5c5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eW0DNZd9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdckG5c5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4V6J1848524
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1sUllQwZR0DIHyG2YQmMoUKs4IfVi2xBX8/Va7BBPQ8=; b=eW0DNZd9KQZ1yCXa
	k8E/g1mNM3X1wOnFx8ZQaqWVnxpNSJfTjvfHYv00DujR90MCLe4TtKq1jGV79sUN
	8FjEtbBW/8R9F0c/t4yjdynh1ClQ/3NEAtzQ9aFuVwDdgFv8Y8JlhUs/6MWveJfj
	V6nY/9RHNq0KrwbPSs0NYgn4wI+cg9vPgXZJVfKFHFYoowT9RLSSNbAlhbdVi4qu
	vsLnzLtoRHKKIs0yNO/oiorLbu1WxYX056NTIqzvsWa7rmXdqT6jFEPHzW5YdREx
	pQ8fgQl6tOGzap65S9UutOU56xDYQ3TSldvn12dIwzIePH+hEdeXMbR+di2zM7vX
	+r3BCA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvtdcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db22383e8fso20524555ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056350; cv=none;
        d=google.com; s=arc-20260327;
        b=MvB/XU3OtvEqF8njX4w+V/SK6WBkzmtb8E/ZfbApbbo5sbd4thzK0RwyKr4IxfHyZ3
         MD7yLOOsQ0sVQoWITZcr8wBnztm3j8e2KcH1x+ZLb/dXoWh27IofjLHUyZVzxLHXWyoD
         hKEARIATyylAp663SObLjXHGqpDKoeKznF2W+4r74ssaXTV4ZGDd9jw8LnItJZ9O8ZWW
         84Sw1Lj+KcUTMTgGNqaur1oo4ZXnA6gIOm9yCIrzwvT+elUKDQsFMsSZT2BSac8P9QEJ
         1SwAd1wjkvRDbWJuAmNaVCIbUtVoOqyD4ml+Kt2b8KfCa0CWu9hedZUKWzEYkpGANOU1
         DwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1sUllQwZR0DIHyG2YQmMoUKs4IfVi2xBX8/Va7BBPQ8=;
        fh=Ke4XZ80mQK311QEwUFDchuUuArykJLNPV5INvEH/wTY=;
        b=DiwPOea/H8m8Lps8Wrx6rr2GYKnl3m5WjVGczXNTZUdfHcO56PRb/FtJVZpEfwsrfI
         0Xk2Y2txOBGUf44oH0Ks9Qsw+fEiUEhVM1iC1/YM1uYjcRWr3eRQiddIFuQu6zJYwrUl
         E2WdMQPXd1J78hd21Ae7ABU65VuTviOBxM26WiTGr6jp3H5IP5/5uO/TaYllHiRfSWsQ
         mrRUt0L7xl6daZEPRgeOEd3g5MAH/6a5ZaxBzc7oxJAKqsGOFQ/Xty7QPrcwSgkD6Sj8
         57LSVZwY8IWojpJTOGn7Z7eYWsabTnqxKapQ3cFwY92SwSBiaP7ZnmymiaX2tpP5og8F
         v+5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789056350; x=1789661150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1sUllQwZR0DIHyG2YQmMoUKs4IfVi2xBX8/Va7BBPQ8=;
        b=fdckG5c5B9pI0RrHPbdZkX/R0BIrJiT6LN5xWYZ7HusA59qw7PTc5gpPW0tSvwqCtd
         xfWqPZUyaKE6uQGnpT88ZajhmQIn9423Y1UjYYYjiK9xmo7wQJNPAsK5CzcSFAQposBM
         OJlEaDMnv3pEjqMeC66CAmj0I5Pb5NzIDo6FN0DoetM2s7WNIMKXja2e1yx6cWEb4tMC
         A4NnI7uhbnFwdFbqXIVHjLgODQ0S8aq13Sidy9iczJtcP6EQvgol//OCQ1OO6jfp5Onx
         nm9eOgm9VoZk6Bt9qXQtmhLw/HKpQJU68F5RRXwJh4cMeV9hHgshz7cnssiDyVRZp7xf
         +77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056350; x=1789661150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sUllQwZR0DIHyG2YQmMoUKs4IfVi2xBX8/Va7BBPQ8=;
        b=G47Td9bLHblUrkiXFAESkTdC6R+FPqV4EaRAK33AB/v791kBJYf1AyOzo/9bRzSEb3
         xBnG8JYJ2gWTjONT3grCIrACWFzPTmtimJGRsZJhwqw/vvEJVT47PEsIyueiH7pRWXF6
         g6cAJJkzqI6TxpvnyOn0kXQiNsl4VtgMUyZPRLUT2tj0AcDhIFqHYiV4RJ5O+8BnFwhM
         H4ow5Qtkf3RwJgDgPb17nAMihu0p+8tDfsRwVPVlNeKWCcKAumZXL4gEbX+pzUhWnW6N
         7gpknkZ/9YNrLwZPbLuMsNCUfKXaKeew/gKAIorlTC1GhZGwfV+xyi5XZ6cpPOCSWtaI
         cYQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCOm3aJvwjveq3GVA9NGxg8+awtJRh64jCWFW2erO0AYFmhpUjpKXFzrOBu47oiklpWPkp2L5miBP1Rss=@vger.kernel.org
X-Gm-Message-State: AFuF++kAGgKIsnFS96wLlb5DrU0u2z46oagGgxwixAUUUijglGPkN7+P
	JGDIqfDetfYJHuDPOVSjDrgYTOdaybk6htlepNWM2EGjpV2YwUxE3/wowdmRnYXcETgAQ0gGfEh
	p4LJkrOcK7pM3mmdHyvtKadEL8xfVJpWNnT1+uwZ9axgUmrnO/wL0apLLfiVz2U7GP4P0SIjMST
	2Puy60PFjPGW14vAxtC0iLE+X+3rkF6rnE9s5705K0pA==
X-Gm-Gg: AYBFou2eAs9b+UiRC0zrF4jycuzJqHyb8D3sct9eZBPZQPaupszIo6k9M1kaaxkKGKm
	i1hQqGhI0jnnqroDqqPH5qVtqOg6jwhtFmUi17gRNtuQeHWrGvjJNj47ANbSVPEhpftYRuN6thY
	vCuxt1bat0ADQ41O3Fx8ls34FLf6bXrYSuvbETeTGciMYSUo3ON9Pp6DdkDw==
X-Received: by 2002:a17:903:388c:b0:2d9:14e8:bcb7 with SMTP id d9443c01a7336-2dd0e8a213dmr60112305ad.3.1789056349484;
        Thu, 10 Sep 2026 09:05:49 -0700 (PDT)
X-Received: by 2002:a17:903:388c:b0:2d9:14e8:bcb7 with SMTP id
 d9443c01a7336-2dd0e8a213dmr60111795ad.3.1789056348932; Thu, 10 Sep 2026
 09:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1787817486-137277-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1787817486-137277-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:05:34 +0200
X-Gm-Features: AcwNN1Xzb-LRWPnhBSD2IGRooGlTH9_SP_t3vhw96kEFsd6BKI0KRfWnh7VQ644
Message-ID: <CAPx+jO-J2BxoPbDGoJnuPKe-R7GRzc78fJwvDowhTDgQz5g8ww@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: dw_mmc: replace three fallback timers with a
 single watchdog
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2d55e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=s8YR1HE3AAAA:8 a=GDpu9P8s0nNUkheikvgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX6TxEQ45wAofl
 AxY0j0fkMTFa0Rm4vUyB+ul7UwOnS1gciDC1XqRg7pJPJP2kNJHq/7bMdVl6w4KueyqobRvwKED
 QDzLNdZgGWtAhpo2e44c527UBxO38J1C5IdeSIsC5/TAhFiQzFnH4hqG9RoncRmSnt2KNeqx4Py
 ziRAgHS1wcVqq3rCNdo53FVEpPOHtfHM8nK1/AvD4ju/pY8I3Ji9ptMI4TftEkTr8yMUq2+tF1/
 TNOHFMUOk3Bf4qixLStzJftUWl/Jl6JOkJbyHstCtBRlGWWuxNkxTaCkkhnv0zW9Nqf2FdM47fq
 QN4aigr/FsGJaqniWAFb9BHgLIoDRhs4AnAKdBdpsmCiOZtL5TFgG4eNNZQP2MnTFwY9sjAZBYJ
 JC3EOkHKdQ+BQEf8TE8lpiKuMeWRqBeKU5XSd6fYUSEEul6yoc0svhRAj/YrBXjdJNoOw3e/xGs
 m7Z/2XoMMkz89xX0Meg==
X-Proofpoint-ORIG-GUID: Imq1bIqthzrq8KXsWVL2gbl4nCGEKjbS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX6G/ZhI1FHanv
 rQTHM/jeqfSBXfVrGbBD6lh6cKJfdyoUd101BdCmOIit2AfA5z3UHx9wk/912ywznmHZi8b//y5
 NxRCfyPBDgrZyf5n9TtDkVc2N733+uM=
X-Proofpoint-GUID: Imq1bIqthzrq8KXsWVL2gbl4nCGEKjbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100195

On Thu, Aug 27, 2026 at 9:58=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
>
> The driver carries three fallback timers (cmd11_timer, cto_timer,
> dto_timer) added piecemeal after the hardware failed in the field.
> dto_timer exists because Synopsys confirmed that the DTO interrupt can
> be lost entirely, leaving no hardware fallback and blocking the request
> forever without software help (57e104864bc4); cto_timer came later,
> when Rockchip's reworked sample circuit was root-caused to swallow both
> CMD_DONE and response-timeout interrupts across their whole dwmmc
> family (03de19212ea3); cmd11_timer papered over voltage-switch hangs
> that reproduced reliably when ejecting/inserting UHS cards on rk3288
> (5c935165da79).
>
> Because each callback races against the very interrupt it supplements,
> all three grew the same copy-pasted defenses: re-read MINTSTS in case
> the interrupt is merely late, check whether pending_events has been set
> meanwhile, validate host->state against the leg being guarded, and only
> then synthesize the missed event -- with timer_delete_sync() calls from
> softirq context eventually needed just to contain them.  Meanwhile the
> special cases keep piling up: the EXTENDED_TMOUT quirk makes the DTO
> story differ per platform, fault injection can post DATA_ERROR ahead of
> any real completion, and every future change has to reason about up to
> three timers at once.
>
> The observation enabling the cleanup is that command, data and
> voltage-switch legs run strictly serially within a request, so a single
> hrtimer suffices.  Under irq_lock it records which pending_events bits
> are awaited along with a snapshot of host->state (dw_mci_wd_arm()),
> and producers clear that awaited mask instead of deleting any timer
> (dw_mci_wd_deliver()).  On expiry the one callback classifies what
> expired by comparing the awaited set against the named
> DW_MCI_WD_{CMD,DATA}_EVENTS masks, keeps the old MINTSTS latency check
> but re-arms instead of going passive so an interrupt lost for good
> can no longer wedge the request forever, and only then synthesizes
> exactly what its predecessor would have (RTO + command complete, or
> DRTO + data error/complete).  The per-leg deadlines -- CTO formula,
> DRTO formula, 500ms CMD11 budget -- are carried over unchanged.
>
> Apart from three behavioral deltas called out in the individual commit
> messages as well -- a single surviving watch during voltage switch
> instead of two timers racing, a stuck CMD11 aborting after exactly
> 500ms instead of racing min(cto_ms, 500ms) with -ETIMEDOUT unchanged,
> and bounded recovery from interrupt-latency peaks instead of an
> unbounded hang -- no functional change is intended.
>
> Tested on Rockchip platforms with SD card and eMMC (rv1126/rk3568/
> rk3576 boards): normal IO, suspend/resume and card removal during
> transfer.  Compile tested on every variant consuming dw_mmc.h.
>
> Next steps: first split dw_mci_work_func() into per-state handlers to
> make the transitions explicit, then go further in the sdhci direction:
> shrink the eight-state machine, drop the redundant completed_events
> bookkeeping, and end up where other host drivers already are: one state
> machine, one timer, no separate event flags.
>
>
>
> Shawn Lin (4):
>   mmc: dw_mmc: add central watchdog and convert CTO onto it
>   mmc: dw_mmc: convert DTO onto the central watchdog
>   mmc: dw_mmc: absorb CMD11 timeout into the central watchdog
>   mmc: dw_mmc: expose the watchdog state in debugfs
>
>  drivers/mmc/host/dw_mmc.c | 316 +++++++++++++++++++++++-----------------=
------
>  drivers/mmc/host/dw_mmc.h |  15 ++-
>  2 files changed, 165 insertions(+), 166 deletions(-)
>
> --
> 2.7.4
>

The series applied for next, thanks!

Kind regards
Uffe
