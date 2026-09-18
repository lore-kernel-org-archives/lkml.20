Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3933B14AE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696749; cv=pass; b=uMDORglJORF2hDMwMUvfALbM/rQSBnibc9W1s1tNCRp2ts3AxNiesPfp33UVjTY2VW32P6o7lQs70bL2CH6Icw1aCRRnX00t0aGZR9V3rfEryOtYl3Swna9LNG8GP1uQ5VWaQodYPqK2z5FcMq79hsUrCkhdhHihWG7lHbwSuJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696749; c=relaxed/simple;
	bh=vlOPFWvLXaXAks3q8MUSQObP6zdHEcQsjUabDnzdjCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+O/cVMzWiu3yvWyhlCfte7siUL1Bw/hGeQXKgZ4pK07vXn1nNb0zYxt9gVLKVvl8aQneazDLOMehBu4t/HtQ6rcLYidlU3dyZDDzdpzdTTuwLNxTzcsFXA/oEi3shCqD1Fu6NkDEdKovhJCbOrQTGHVWuX5FLussbdohPwCpZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvRMnZZC; arc=pass smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvRMnZZC"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-804e42309a5so58374a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789696743; cv=none;
        d=google.com; s=arc-20260327;
        b=Kbm8EQKpDy1v4YZH/NYDQREGZrhpcnQ6TNSCz6W/ecRaU0gexpFDWtdq0u1b0q13wq
         8UCimbZsOSkZMFrYzwhLzBmikCV9gPVv3OLMLZGhMx+bSCfGC7zMRB4I1uGEbYWN43FD
         lDpM2Eg2NxygsnnmVek16ZQby03WZHm/0bgqWwBHMJVb1m3upntFtFDdpVxF6/b3Sh1i
         +uaxbQHlZ+h7TH9BGB+0zKV7+8GlRTxCZg9Xl4jtXbcxlzBwatZ1bMqfbXPgcTqCBHMG
         QqHj8S5QDoG6+7omfadobVo6g9ITOhl/Bf0kHpWSwuruPRXZJGn/DjMCr5YbqZ429UX8
         knfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qx5BVfvWrGBV4tqbhaO/qriu+mVTHdn10qv6BXQhZFM=;
        fh=95fd6i3+zoVQa4ifXYDgsXtLZLw7jQquQUeDcsioLT4=;
        b=PPMtq70BlgKncMMeE2Bbu9bpW0889OsZeUIJZz52yh5CIfTvJikXubm/0LSz77j1DM
         fRu5yqj7hG+smqU/Ru1sFifm8uFu1aCeL/OWcfNDd9RsLcouLdUUyRHrwb86YMkylWmP
         x3/gIfr4SbQSQxKvoOj1L7e2htKqs18T3UYQEQN+RrkkegfcjcFItE4mXlkUFjZG4sfz
         uhHpMD4C20XcaXMlBDOlPAWYw+2ro/GSbGhzywMFN3JgPuV1VieO5NA7kDtBILR9m7g/
         AGtTJdoiuelgpFBeAaHsumVJ4E/qFs0lT//nPlAVZ7dDYUmf1URzZJbWvO5diFBLHzM6
         g7Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789696743; x=1790301543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qx5BVfvWrGBV4tqbhaO/qriu+mVTHdn10qv6BXQhZFM=;
        b=fvRMnZZCwJkadLU5nhmSgiS38zftm/m0wZiW3QDmJC5SGVSQnVsETyN4aCwiX+y6gJ
         Rj3igNOVxQbDCam9Ggk6M0JH3KNtGEfEtVHwtfqoQOmbtdiPBgo0RFDVSgc6EM2rFDJb
         zG1XVzW3NQ+EYEmMItvxL9N7BIP31/MQTpZyuiUIVXrbYgJ963Gh5mPjWfJDXorpGO8R
         7SsB6eEZQ0r97iIxpPw4BaIX8vLNjuQOZyqxsDtAyQ0H1NNn/G19jpI4a6hH/pD4lTNt
         XW7TuLqa9/zNcnxBw17G9BuADEgOqCaPLHwR0uAu1n28jBndIZ+V5SxAoJ+7t0UPGt/K
         1a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696743; x=1790301543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qx5BVfvWrGBV4tqbhaO/qriu+mVTHdn10qv6BXQhZFM=;
        b=R45QmyxNzaTgbWbMBg55q/MlmaaBJDGmssV1gICe/WJ136NeTHJaHym+ylGskvgnWP
         qhDtqMILILxiHM+qEK1BEhB398C+34/059azKeNlIsnEM/sGpd3si2KvlHPnMWvyr6xk
         B+nR63rNHr0++sDVVUGodekHE4ALf3kXTN1YcPQ7ViauHcFy3Jj22+VLkM4xu7ZfYVzI
         hsdbg21fQe6U0qXNbU6FivHtPPHGiEv1w5nO1DmH3IAKleRYjJ7dAs0Nt2+LhgR96IB7
         MuaScdkx/zbSIw1gym/d25w9TL6l26PZFUua/gjCv7DTifmtew+YhLNOJgLZ2W3Yr3y7
         f4aw==
X-Forwarded-Encrypted: i=1; AKwUvByxEexIo+L5V55WPl0NZ/fKUyaDdwHVQfU9adC+Le2Os7+I2gdj3LB64wCILcO3xlplY3KC+B1z4ONkWtY=@vger.kernel.org
X-Gm-Message-State: AFuF++nrWdltAQNpJ2XYxFc4wL6PJE31/YnNNch0Ge1rjdATBMGtWvp1
	HiiMTwxHvD4AmUTug9F0gPLxDyPP93XwYDx69EjUzzqqC/diC7QlI8wOhFZLd/1+dMePWycDvy0
	P9Lzrj/YJ+Fbwk6DkrRXKf7FqNikUeVc=
X-Gm-Gg: AYBFou2U7lcW6YalPLyMCyUh3L7oNW3/kZ/8dP0rX5NExzNTM3XTG5BvvKpuZ99W0Fe
	2j7AuqsElYQUCra6LIrRn5IJsTq2u4HW0YnLRoLCi+G66VytK6g7dxf+74NoUvQD0l6pCxqd/mu
	S2/IDpN/w/NyD5ehUWMjoN06xFNQ6RxS/FkoURf3jsnArQVrAfo5YWxxLjwVJO2nAGLeuZkpqGa
	r7WE8g6NEzA3OcR+4LhOYno5u2rbITs2KmbWhbejNJrdvVqhmxi4E+sEKKe2s/BLuggvkMY0/0K
	h0RX4fptZtTNsoFWopZor34GGgMeTn1oJbxzINFk+4FHAAqPGHI3QEY/yw==
X-Received: by 2002:a05:6830:6a99:b0:80d:7045:ec38 with SMTP id
 46e09a7af769-80de035af5bmr1358143a34.7.1789696743283; Thu, 17 Sep 2026
 18:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com> <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com>
In-Reply-To: <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Fri, 18 Sep 2026 09:58:52 +0800
X-Gm-Features: AcwNN1V7r9agV3RFgkiJtTWQ8Vj99zTBMZbHcrx3v52XQj6k_uPLO6nyI_We1jQ
Message-ID: <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Mathias Nyman <mathias.nyman@linux.intel.com> =E6=96=BC 2026=E5=B9=B49=E6=
=9C=8816=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:18=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 9/16/26 04:33, Kuangyi Chiang wrote:
> > Hi,
> >
> > Thanks for the review.
> >
> > Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=88=
14=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:09=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >>
> >> On Mon, 14 Sep 2026 09:30:33 +0800, Kuangyi Chiang wrote:
> >>> Control transfers to the HIK 1080P Camera (2bdf:0280) can time out wh=
en
> >>> the device is connected through an Etron xHCI host:
> >>>
> >>> [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf=
:0280)
> >>> [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp.=
 26).
> >>> [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -1=
10 (exp. 26).
> >>> [   58.592967] uvcvideo: Failed to initialize the device (-5).
> >>>
> >>> Testing shows that at least 125 us between control transfers is requi=
red
> >>> to avoid the timeout. Limit the workaround to the affected Etron host=
 and
> >>> USB device combination to avoid changing control-transfer timing for =
other
> >>> devices.
> >>
> >> Any idea why it happens or why the delay helps?
> >
> > We don't know the root cause yet, but we did some more testing.
> >
> > We tested delays of 50us, 125us, and 200us. The issue was still
> > reproducible with 50us, while 125us and 200us passed our test.
> >
> > Our pass criterion is 30 successful plug/unplug cycles on each port.
> > So 125us is the minimum delay we tested that consistently works.
> >
>
> Are there issues with the control transfers already during enumeration
> of the device, when reading descriptors etc, or are these issues only
> visible after uvc driver is controlling the device?
>
>
> > We also tried USB_QUIRK_DELAY_CTRL_MSG, but its 200ms delay is too
> > long and causes UVC initialization to fail.
> >
>
> Does it help if you as a hack set udev->quirks |=3D USB_QUIRK_DELAY_CTRL_=
MSG
> _after_ enumeration and uvc initialization?
>
> >> How many other HCs did you test this camera with?
> >
> > The camera works with the EHCI host we tested without any delay.
> > We can also reproduce a similar issue with an ASMedia ASM1142 xHCI
> > host (1b21:1242). This patch, however, is limited to the Etron/HIK
> > combination.
>
> I think we should avoid usb device specific quirks in the xhci driver,
> especially now that we know it's not really tied to a specific xHC vendor=
.
>
> If this is only an issue with the control transfers sent by uvc driver
> then I think this device specific quirk should be in there.
>

Thanks for the suggestions.

We'll do some more testing based on your suggestions, including
enabling USB_QUIRK_DELAY_CTRL_MSG after UVC initialization.

We'll report back once we have the results.

Thanks,
Kuangyi
