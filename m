Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA244D2ED2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679494; cv=pass; b=QScV+otejUYTLnL9GMyFcN6+TcOkMuC0pbSrbnRyfhziK+U1r+iNYjBk12SW97tsnwmYSRxjnhgyiIdoF1w3r8Se0jGyWyKdsGGyJKM2z+dyEyI5d88z8eHANcOl8dBsuajw4eZxGvCsJ2mnCQzCx/gooUpc3wVjAZlxcNwc2l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679494; c=relaxed/simple;
	bh=r0iDdiaq+ZyYSfXbDb7+z6i7X/8eMmWTcFQEHtOWypE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODRn6GuarG7hvvAIcx3vRQBfYXkAlOtO3PLI8C69knizZdahqy0qrkOid5Uht+XEfkrG5upYXTq/Jz7QtJqk1fzUmf7ZcAZ3BrBT/m4CwXL4ZA6tvlsObINlhA6/SjCMQkBWy5rAft+ZcEYNUqIyCS4lnkEBNvUhLSb8jU3oOfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fvM4YFwZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQBjEiIG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvM4YFwZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQBjEiIG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAijbD3561145
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTu5GuGQkO3QNfFTOWgaKMH1xO659EwhYW2I+BxJgks=; b=fvM4YFwZdYvO/Nns
	3XCqK37QDI3P5E71YPnc/3nTKyPMr9Iy0kTCEzAWxeopvGT78mhmTb2LJvlPVIm2
	f+gBExaJu6bRNnc6VBfGtWEG4Ya+yQ5itf5FJhXLtnDevy7SlILJSmEZI23/BncS
	64TsAc3I9bAaNRSnrmeX9B9+LUcPgOGMr+kOxYrGX6Ljdc0MaGkta0LzdJY+RbF8
	bq9vHtSmHHiykBw4sPHk02KO3n9bYycc+Ajhg7vRhfnkOygph3H5x2xHix+pCEpX
	xhQnzCf8SjwWpERxX9zjPFHh0rXOyWRK5Gw2zhSEyrg0K+7R/TkUertRoZeDY33J
	CzhAnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v89n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:58:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a0bcf8b74cso4229853a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790679483; cv=none;
        d=google.com; s=arc-20260327;
        b=Z1GzstY/DXjZHVK3+2aYN0nx0B2Qc58xEZH75KPB5EllKQACknMPXjNW4er3iDboal
         OZqW+SB+jd0utGR08NStD8qmt7Az9d5WdaaRNEetmz8XZNzkyzyEUUBO2AmRX3bj137H
         CGfuweJt4sYTr8ghJleU+yAz/lrhLoMxo5qtMnhOja2t4temk4D2gcLtZ9F2qvXm6bgJ
         qM4uvzWP9GsCtq7bEEBhZ0GIML1vTzKwLlBpcQWATpYV+NMyXh+MdMMso1f8ee52hegl
         oRWh29pgaP9cj6Xo4oDj/rktlKr9rzi+k6MRgWTZDUAAM9xiFOtGd+funARpSIR/Swfe
         zymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTu5GuGQkO3QNfFTOWgaKMH1xO659EwhYW2I+BxJgks=;
        fh=wQPAbWkV1tgyLoP3ealofckjbEzzZZ+d48LpfAhePOg=;
        b=Fe8YWjNCkYM2tbm8/ZQPzBVMP/ygcvKOPpinMOnl0bVNBTwVzTfxXR2+lIJIdXDKi4
         47z1NUmspWChGHlDu14ovHTImuTG+4raiMzvl6R8dri61YPebT6GXEnmBTO0heZfyZEc
         ZCq1z75HpixhnP8scT8WCfR52AzS9ghfgWzzTjd69l0kCFp4Ykw1EDzalCf5tdWcq1c1
         O00ThdCqVYnvUz6lOPiK0XhuSI4TE/u5V8xuT1Ms8i+kuNN71Kc1Ouums1gQVvOsZaYX
         H50xgtqzjZ6lzQBt4tRVK7SGaVFrNcNkjY30WRR33Edh2mrXEdMRXZVeY0Oi3oCFVyqt
         FXeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790679483; x=1791284283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTu5GuGQkO3QNfFTOWgaKMH1xO659EwhYW2I+BxJgks=;
        b=eQBjEiIGW86ux9EvP4LB3VrFGqJ7942QvCTNQuKgSecBjdp0PdWgSO302ZPdhxWvpv
         cQlcsEw55WfZJgBGLyv0zUhVEx9R4xQJysJJSwkx+ySkiE0B7G/3dpYF8ZEsjKSK54l5
         yCZAeHMeRW5v8ZhEvZRVvL2y8fC4RTgXGmsPzu48bqDKM4Mx1GK8uJmwLaFMpUMVz7O7
         OxQ0YQCZMZuHtKuTdAkXxI3XIQkis5QrnUKOJ/ztIXpeukL9us+2l1DGzoYfHADaQx8X
         HdNCBp/+ztXCrBxepebuVsKyRRdEnOlclIRIE+h4apGNIig95mi6ErqAXYcOhOQVg7es
         azqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679483; x=1791284283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTu5GuGQkO3QNfFTOWgaKMH1xO659EwhYW2I+BxJgks=;
        b=TCc23yiai1EmSLF9KfS3iTrShr1PA/fyVTqgbXLB28e9EJ8mrK3IGxPwof5+Xy+5Qn
         QYtvCCz3eNDYqCbExwj2CWcg6BQ+euqN2AJxnZq9/a4YIILfq9+5JzJpBj+9juMZWwDH
         xfN0H+jsbV7QBaS3el5HcnKsmD78z3HgXKbxERPgjNqiJtcnxflUkZWwbz037I8orlwN
         VU4J5wXZLtH+INx3Ftz2SCCdl9LwKzyojTFOZD6+4N23yC8yJhCsTSg/8X5lhJZjFK5X
         pVFihH/0casEdpSmNNLQ+2TfSkIlLHardpaSDpnCXzr/lITMSHKq/k9JqeXTfAA6plo2
         o1EA==
X-Forwarded-Encrypted: i=1; AKwUvBzawrYmQZbWMYi7U5lvPVhsI2ysnaBHoVwsWIw744jJLOWf+YT/I6e2gVGiJGKzHcsfs1J1S3Fq6OAVekE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJggoh1NdjOcRMFybUb3E+wpmDzfZFhQZtaNTmGm8mXYqR7Sot/
	d+GlvWabjYYL07wA+rtaPakcFp7y+NeDT41J7Nie3zocffi214Pko0JyBbrOZsrua+/+K0wHtrw
	zHO0t4QFGDLOPktAIBMdPAoyaZeKDIEiWE5vE6CLaBGRhsRmL8Cuc/buS35Ere8Yb/UxLpF/9Ti
	+YYrtV1XyICR9X+1hsFSiaUt1Hrk6niPg/aoeHlRhcdQ==
X-Gm-Gg: AYBFou3knlJHsE3QUqtQLAByB+prPIhMeETGKLPc91dG9mv19gw0d45QdJ7dmsPFZ5O
	UXrhJANI+Q8cbOMvtCjZV3E0XT2fx9sVsFRPY6EnhBGZN8EGawVf/MG3mReXaVVfrhMg7A8GzOH
	KsQKBcMTVTOHG7ouMxz0weWp3kohogWrWWQtlMkNYVXa4ETmugfmhVrPD2AA==
X-Received: by 2002:a17:90b:3842:b0:3a0:aed7:7b39 with SMTP id 98e67ed59e1d1-3a0aed81503mr12381413a91.24.1790679483421;
        Tue, 29 Sep 2026 03:58:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3842:b0:3a0:aed7:7b39 with SMTP id
 98e67ed59e1d1-3a0aed81503mr12381383a91.24.1790679482906; Tue, 29 Sep 2026
 03:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919100408.113979-1-ngocthang2710.1999@gmail.com> <CAPx+jO-JBBLNCUrnB0UaMSPu7ajwsrEQMPJ1SfH2PccCR5VnCA@mail.gmail.com>
In-Reply-To: <CAPx+jO-JBBLNCUrnB0UaMSPu7ajwsrEQMPJ1SfH2PccCR5VnCA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:57:50 +0200
X-Gm-Features: AclHuK82roEHJrweTwio7mtf04vdHQh9G4MQuD-caqh9KRrj_nsX38Q0GfQxQhA
Message-ID: <CAPx+jO9iva6YnKba8aEuOHURiZKjh2+wvhfC97bZ22UjGsXgNw@mail.gmail.com>
Subject: Re: [PATCH] memstick: core: reclaim the request before freeing a
 timed-out card
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DlHkxTCS32sCyO9onJwDqLuUjxu5yveM
X-Proofpoint-GUID: DlHkxTCS32sCyO9onJwDqLuUjxu5yveM
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abb99bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=edf1wS77AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=hSkVLCK3AAAA:8 a=Zq5GaAOXB1qV3tOyoOkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfXwNY7dNnudPfE
 Ya3upWXrI9V3n+Gq2xxfb/6Q5wn5zVMG1KvbohGUoPVK7pYuR58/26aJobQBo3T1CZt66ubcz0Z
 k2jMga8Oj/VVVPPry9Fy6HqUTKz7G2spcaMsn2bUij1eI9mu3QxIytCoWYwbay2WZ06URmXd8Ga
 KR00QpnWjVh2tmlsdhUzfzAvLkbkece3NYyZ0CDS7GjYVEK9U6ZZ7eJ08XqfZ57m+khriE+5Ezd
 6IF08Tj7s0Y6jSjUDEDtegs2+oaUQ/IpBQw/uOitjtk9NMgnYTwge6tqDc7PpDjMQ/YPAS/iGCq
 GaPSBGHCqAdZBC373Q9evyTyVUFupq+txH5Svg6V6uAboYZtiwpSxi9s2pGMOkrfaGL/Ro1g4Z0
 8ZYCIHjhC/7BfPlZlrzSw539gSU4OFyhp1vCj6F655mvgBiNBtFOJu68VSP8iZh58ohhknkuPes
 963mYDsnvSj8pywMIHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfX7BjXfBoTdjFi
 tS04l+PZE+wwSzhtQ0TWC9zujH2ZO9fTOGUbSRFsG4KiCm2wvS8oex0uEg+QhisXW3nwu9iX9hg
 V45/6hjn9etbgoo1+KZZYpf/FMGySaA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290043

On Tue, Sep 29, 2026 at 12:24=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Sat, Sep 19, 2026 at 12:06=E2=80=AFPM Nguyen Ngoc Thang
> <ngocthang2710.1999@gmail.com> wrote:
> >
> > memstick_alloc_card() hands card->current_mrq to the host and waits 500=
 ms
> > for it. If the host is still busy, the wait times out, the card is free=
d,
> > but the host keeps its pointer to the freed request.
> >
> > rtsx_usb_ms hits this easily: its handle_req work can block in USB
> > transfers for seconds. When it returns, it reads and writes the freed
> > request, including the retry path in memstick_next_req():
> >
> >   BUG: KASAN: slab-use-after-free in rtsx_usb_ms_handle_req+0x17ff/0x1a=
00
> >   Read of size 1 by task kworker/1:3
> >   Workqueue: events rtsx_usb_ms_handle_req
> >   Allocated by task 1656:
> >    memstick_alloc_card
> >    memstick_check
> >   Freed by task 1656:
> >    memstick_alloc_card
> >    memstick_check
> >
> > Add an optional host->cancel() hook that stops the host from using the
> > current request, and call it from a common wait helper on timeout, befo=
re
> > the request's owner can go away. rtsx_usb_ms implements it by draining =
its
> > work item. The helper also covers memstick_set_rw_addr() and both waits=
 in
> > memstick_alloc_card().
> >
> > Reported-by: syzbot+3ee5da0319ca17ef1f4e@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D3ee5da0319ca17ef1f4e
> > Fixes: 99451dceeb5f ("memstick: Add realtek USB memstick host driver")
> > Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> > ---
> > Testing: no hardware. A raw-gadget emulation of an RTS5129 (0bda:0129) =
on
> > dummy_hcd delays every bulk-IN reply by 550 ms (above the core's 500 ms=
 wait,
> > below the driver's 600 ms USB timeout). On a KASAN kernel the unpatched=
 tree
> > reproduces the report (same offset and alloc/free stacks); the patched =
tree
> > takes the timeout+cancel path (~0.6 s) with no KASAN.
> >
> > I first considered a second unbounded wait_for_completion() instead of =
a hook,
> > but rtsx_usb_ms_request() skips scheduling once host->eject is set and
> > memstick_remove_host() flushes the workqueue, so that can deadlock.
> >
> > Known limit: cancel waits for the worker's remaining retries (a few sec=
onds
> > with a device that never answers) while memstick_check() holds host->lo=
ck.
> > Other hosts leave ->cancel NULL, so their behaviour is unchanged.
> >
> >  drivers/memstick/core/memstick.c    | 22 ++++++++++++++++------
> >  drivers/memstick/host/rtsx_usb_ms.c |  8 ++++++++
> >  include/linux/memstick.h            |  2 ++
> >  3 files changed, 26 insertions(+), 6 deletions(-)
>
> May I suggest that you split this into separate patches. For the core
> and for the rtsx_usb driver. Other than that, this seems reasonable to
> me.
>
> In fact, we should probably have something similar for mmc, as
> currently it's the mmc host driver responsibility to manage this
> timeout itself.

Reviewing another patch [1] for the same issue, indicates the memstick
host drivers are already managing the timeout themselves. So, even if
your approach seems reasonable, I decided to go with the other
solution for now.

[...]

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20260924204142.607-1-rajojha047@gmail.com/
