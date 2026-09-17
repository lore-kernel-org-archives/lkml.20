Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872074D9558
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650614; cv=pass; b=r7Rhggv3oYLIqoQFC7oYwh1nZFk5QLHP7OH5hiWn9MOPN8Zr77HVsQB4JEh8UGB4TD8zqplwHMOmjqqhTdDR3eJOYCRXEscENVplvCMwR5B2mv0zlGPFPg+Lhxe1IxMjSNZ0ZHbNnVGr1x/xCtnkVQU1gBCRIBtDF1y5pC44iw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650614; c=relaxed/simple;
	bh=dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbM+OE36PTThENQ7/D9B0eqE87ccqhsdh/DNP3WStS+gMIyk9+pJBk2hLrrs2WN541AxgMDC1mLWvjQ4iIotggf1/+WbTyuu/3EX83/boptjaWtKMY5C8zmAVyjti3D75t+C3hTmzz5ZbPcWrFrz+9SWV8JKwSwVNkVySZ1ZxKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5LO6BYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijyCWsoi; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5LO6BYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijyCWsoi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HBowkE2013663
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=; b=h5LO6BYpTXAH5nwx
	VwuBSfEzIGBVZY+9K99uOxxLNxaGkJyTt4VyrwOZoNAcIhfJeVVSAZ0eCaIQaJvS
	nDVEOCFYHSRyevvYxRN1OWXFxpvJz3jbojOzibn8tN8m54CTzFz6Ac9mjN6JA+dq
	pjPJ2KGX4qfNJTznoMF9junvBNjI2gDnqyYGB7Mb2+jxCxx9Lc0W50NkZSoQnd15
	WvZyMJQ8f6ojh0k3aD687Sdon0RPTgkQ0kO/g0rU/8BaMDwpAT7IT08qPc95tjEJ
	Mj+NIYVuL5xZvvLVQ/0eLmGn3p6czFlPjWYh9vvJHXu6UEqYdabOfzVt5bKjiKMR
	XbgxQw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppg9cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:10:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso1486637a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789650608; cv=none;
        d=google.com; s=arc-20260327;
        b=oundVJr/QuamjjA/mgxhZ7t1CdPb24bWg+wo72wCna1uzqStdLRptEIo+Jai5hRgHs
         m0ebv0r26UeZ1z/aYSA9WHdHYJTi9dr1Kin85EYv7xVGq2tfDSBXaNCDEBc2/aUZmRXK
         1PlnvQ/7sT/H3Ufg9Gxx6+0oQ+iozuT39nx/O8nC/5SSVEWngvgiIsJupaisyOh50kXE
         Z0JdZfIQHfFYf3lLkBGFeo47vblf0v04GhuP3lsRDXnERLWiZXZrhi9I/0AKZLJih8gy
         WV20Uf8yMwQYaRzT7Z6OL9+tPuq7g+PBt6tF0izpn72aJRA92HSnCO4VWXs3WRtKl+kU
         GOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=;
        fh=MGQpBsJk4gO1YhThc5c6kKaG5XEKc/M9gOi8cZspMno=;
        b=hgQrct2yZnrkMXGULG2m671P+ja1SoADhClmgSFAxFBe5+skBpFuTTZ8F8MqqgutxR
         nmkDU2Dzm9MD3i0ughgytYNoBiFtzgaoCjHsJfGq8ngIa+6Rn9LsLLraV8jBM76e7yGC
         Q81qL1H+WZ7wAxjz2gdUDdAuDVI50pqs88krOLAGchUf9f6iui/fEB1IeaxPV79gqrOB
         YtuF5kgklFX56TGaf8c0BWN45yWIsxeXPK+qNGpcTWkNud1tFNsDybqAZeDW/O5VDW9C
         JG85hCuiQv485rhQUsGs0z1YUy/8h3HsctbGeKCaEWGeZnFVMPg2H8lIZ7gpbUiXuntg
         UpVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789650608; x=1790255408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=;
        b=ijyCWsoit4oqsavP6utjnmAj9dlRZGniBMbrAKl9nel08X72/JFlWBwLpB/bwW4fY8
         A03WrJ+gtgkijRIKhJHOhe9gX581DWw8oKemynMVTUIsR9TsThcXFcYsceOjwuOc2yda
         bIMTavfmFlO3xP2UXZkwRNWW8oP0pGZ8RlLTCtOotKxQNZvzoRXWySlfDtdVEJhVT4Md
         LT6jQ1BdGKg+arXMC3JlI422C4/EL/q/c5ke8czKiK1f8lqaynOYzz9GfGUtdhzO1d4O
         i2rPIsvSZUPOyg2MiTjOSJDVba6oAqFEL9ofhAYcjiVv8hCvMmQe5OQ+ow41aNNGI7yG
         eRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650608; x=1790255408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSn/lYCGf47xluUTvALJXGbm/i/dzTFyyRRAL+e7HRw=;
        b=h76gxI52u8mbqGrRDr/FnqFNCnIPSjKEx3hwbhjWiwf/CmMEMMPB+yOG2gcdtvnB/w
         MLAGTO/UpS8/Plm9fLEVxZeKoOlg0RumUXlSI4WyxjYYyLpf2rtGcfnuxQwRa4d+VF3B
         vx1k7O/XcuPERangAhmMjwdHI2UOqJ2PQQB8695YKxbSyRzbafkc+SEANPStlDYCBvnq
         NagG5IwUOaul+Ow+SEfJ65kR5DY537ykH+zHuuDSWjv1iTNxIAMwD9VPwkQIyS1yrL25
         f6sgKggfrvSpftIXg3+ghmKzGy7BxL0KUnkMhbMPJyHnOUnlVfj+eaHKd1E3nrYAycqh
         nILA==
X-Forwarded-Encrypted: i=1; AKwUvByOAor19IhNc24T2z4G9WUxXAEc8q1Lo7e0sFoN46czh4oT5MhGHzcaIRI9suWwTq0txfA5SpzsrF0WYUM=@vger.kernel.org
X-Gm-Message-State: AFuF++kDYpRHU+JHVd6LHOASjN5f3c+DnIijSPgiLRza2csGcT8YSz6f
	Q3xuE9KlVj63t7P5Ivh3TsnjUoU/zWCjZtk3O9ewHJ4tBoncQFwWjgu6XyvlwJW73dbbTB7dd/o
	BRhQXS+6fe2dtXYoWzLi9ixS0ixLcW7lV6ccMDISiTy8HFnY22kx/FoUgAU4kW4qrIgEqXT1U1W
	mkt9DYHrkN3UnfKOxMNNo6DHsFhRm62OVpvVY73g4KRQ==
X-Gm-Gg: AYBFou03ZlJTDOgz5ty0geQBvkHQ5u2J/cGNHxSH/gwdwJAkQVA3vyBLjRtTG+VA+SB
	csfrs5UFRXmLw6BD7sG+QNXQkuyr85/BFBiaSbqtA5mjBLFNVqys3rU5ju0IUqcuce+VPBtICYE
	2SajoJFNipJN+hVDP/fd1L6aAfIboFqwQVSLa4RFZs6aHs/VLsQ3tPLwbfVA==
X-Received: by 2002:a17:903:40cc:b0:2dd:7979:246 with SMTP id d9443c01a7336-2dd8e633921mr148273425ad.16.1789650607504;
        Thu, 17 Sep 2026 06:10:07 -0700 (PDT)
X-Received: by 2002:a17:903:40cc:b0:2dd:7979:246 with SMTP id
 d9443c01a7336-2dd8e633921mr148272805ad.16.1789650606942; Thu, 17 Sep 2026
 06:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
 <20260915132052.273212-3-ulf.hansson@oss.qualcomm.com> <aqpIl5NWCFiuKy9b@hovoldconsulting.com>
 <CAPx+jO86Sy+of41dw3Gi5CNfyc5+iOyDU4CZypz4YGzG27QW0A@mail.gmail.com>
 <aqpovla0rTDnmwRh@hovoldconsulting.com> <CAPx+jO8WS3MqzS3txy1B3FnQ9OzRjDGzxMLLZ+Mys-jqego3_w@mail.gmail.com>
 <aqudoCAtZTgq_31Y@hovoldconsulting.com>
In-Reply-To: <aqudoCAtZTgq_31Y@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:09:56 +0200
X-Gm-Features: AcwNN1XmCRz3ewGD_qaDz6B9arOOIwfnzlm8ZiND-YnUnSWbnYkPL_h4vprGqQc
Message-ID: <CAPx+jO8ETnyiZ8i2AJKa03HZ-iOryjf3Y8DPOqqvu-W_9ThZFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Turn mmc_alloc|free_host() into static functions
To: Johan Hovold <johan@kernel.org>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 0HwIprw5i5YHRXHNEdC8cXMtbEZfnLdw
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabe6b0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=ODYK8XF4EdztDUzRPCIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 0HwIprw5i5YHRXHNEdC8cXMtbEZfnLdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NSBTYWx0ZWRfXyxK5aWvZxyvU
 bUe26J6k2HTnPZInzVeQWQlf3NM5HmORj23lcOWbSawr+D4aXXbmMrYlW7wHouCYhzhUPz/DzyD
 zQFTT8/VVGJDkfmOrOUNPorbxsai5tMTYVMZSDAVumADNHRm4EDrnTmWzWqFXu2lwVRKQMS+/mc
 Gs6tk9q+GPnwkHxHBqOWMP/27KBjsl0S+MeXpQwGi/mWglGpDnw8HwAxP7PKu3oSn3UOsbZJGnd
 1cKuUTEyRv3L1Aj9I9E1NxHTogFglo6SWApDLXpTwZHQkzLrwGOWqbyNaTigBVHpxM1tWND3Y4g
 vWpxYzeefncLIOu6CXFxuQ7pvTuHG0KLq/1G2zMbN2UzrhZ7+Ls71b/qVQogn4A9OxYWFoS3vQ7
 MUc7mFdi//ItuNxi5qieM2XMA5vARoDD+MX6z+IpzztNfL2xYrxPFs6DaJb9O0oNFRloXl+CNSZ
 jdzJy0dsWuY7kkenKbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NSBTYWx0ZWRfX/SEmA0wcO5w0
 jOHqGKQqUuCVUXwQoXTUKxQdJwrl9SZXUqxTgTT+EefdpWIx0bpjKRn45V5Z3Mbbzl3ODwMt0B4
 I9HqDl+q1jitnfj+pNKBiyHG16gm8Y8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170185

On Thu, Sep 17, 2026 at 9:58=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Wed, Sep 16, 2026 at 04:12:10PM +0200, Ulf Hansson wrote:
> > On Wed, Sep 16, 2026 at 12:00=E2=80=AFPM Johan Hovold <johan@kernel.org=
> wrote:
>
> > > Devres generally only works when all resources are device managed.
> > > Therefore you should always provide the underlying non-devres manages
> > > interface as well so that you don't force devres on drivers where it
> > > could cause trouble.
> > >
> > > > > Especially with the work cancellations present in mmc_free_host()=
 (which
> > > > > I have pointed out elsewhere should not be there), a driver may n=
eed to
> > > > > free the host before tearing down other non-devres managed resour=
ces
> > > > > during unbind.
> > > >
> > > > Can you please point me to such an example so I can try to understa=
nd better?
> > >
> > > We just discussed the renesas driver which can schedule rescan work
> > > before registering the host controller. [1]
> >
> > That isn't a problem, but it's not the right thing to do as
> > host->rescan_disable is set.
>
> Ok, good, I see now that you also cancel the rescan work when the host
> is stopped so that seems fine even if the second cancel when freeing the
> host is unexpected and bit misleading (as it was added to work around a
> driver doing something it should not have).
>
> > > If such a driver also has non-devres managed resources that are freed
> > > before the work is cancelled you have a use-after-free.
> >
> > If you are referring to the mmc rescan work; mmc_rescan() will just
> > bail out as host->rescan_disable has been set as soon as
> > mmc_remove_host() is called (see mmc_stop_host()). In other words, I
> > don't see how a use-after-free would be possible in this regard.
>
> Looks like you also recently fixed a related issue with sdio interrupt
> work which also wasn't stopped (see commit 6feadbecdae6 ("mmc: core:
> Cancel SDIO IRQ work before freeing host")).
>
> So I was referring to all work which may still be running after
> mmc_remove_host() and potentially call back into the driver being
> unbound.

Okay, I see and understand your concern.

Although, if things work as they *should*, the mmc core must not call
back into the host driver when mmc_remove_host() has returned.

*If* that would be the case, then there is a bug in the mmc core that
needs to be fixed.

>
> A quick look at a driver using sdio_signal_irq() indicates that this may
> still be racy. In dw_mci_remove() the host is removed and clocks
> disabled before freeing the host and cancelling the sdio work. A racing
> interrupt could have scheduled work that may result in MMIO accesses
> with clocks disabled.

In this case, mmc_remove_host() also removes the corresponding SDIO
functional devices that correspond to the SDIO card, see
mmc_sdio_remove().

This leads to the SDIO functional driver's ->remove() callback being
called and from there it's expected that the SDIO irqs gets released
(see sdio_card_irq_put()), which must be done with the mmc host
claimed. If this isn't happening, it's a bug in the SDIO functional
driver.

Yes, there may still be an sdio_irq_work scheduled beyond this, but
when it runs and claims the host in sdio_run_irqs(), it sees that
there is no SDIO irqs enabled anymore and just returns. So, there
should be no calls back into the host beyond mmc_remove_host().

>
> > > I only pointed at greybus as an example of a driver which has non-dev=
res
> > > managed resources. If there is (rescan) work still scheduled after
> > > probe() or remove() returns, there's a potential use-after-free.
> >
> > See above. This should not be an issue, at least it has nothing to do
> > whether we are using managed resources or not.
>
> Sure, if mmc core guarantees that no callbacks are made despite the work
> being left running it should be fine. But that does not seem to be the
> case with sdio interrupts currently.

See above. SDIO irqs should work perfectly fine too.

>
> But regardless of any potential races in mmc core, my devres comment is
> a more general one: subsystems should not force devres on anyone.

I understand your point, but I don't agree, at least for mmc.

Instead my take is; come with a use case where devres doesn't work and
I am perfectly fine to bring back the non-devres helpers.

Kind regards
Uffe
