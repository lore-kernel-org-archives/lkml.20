Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792591973;
	b=tnkinbGve5gWpDERG53Ic3DeC0+bGIqcUL416OKazjUOm8hksieFs7pKF2P6fOwMYyQZ
	 xA+4XZn33UESmvyi+3JE19F16ZjdoP6ljgzrHa49NUNADCT4UswZWGZINJ+vo6jC9cF+m
	 aIx0EmcahokjZn8TyGfXj4uwycLMjIs7EUYHvhuJL3MQorI58tCwvCdw0eya/b++U91iB
	 7Ly6einvzo/+nUonfIm4LI4Kgg2Z/MXxLXPdfR4znZ57mgep9bjiuqraCktkWYkOvxDAb
	 5BQPUGaDlgwxBH0H5dl6ozVUkLwAX/dRgZ1mEOkCL2yI96v9WiGMRUZSKXncqijsTkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qQoWmb/HxHac52NQWhLiq+3ibthAyPMRZsuipu+rdAs=;
	b=A3NrpcFhOA/TX0aF9s0LEbuRUNpWp7Rv73G9MldrJqG7x06bw8Qi9XOU5GnxXx29q7T+
	 Es96QqTv6zc+ZUZlxT7+XTdxLhL9+4tWk66tK2qIWqMmqlocROqEF0DAUjJgmEgkUsy1x
	 GTSBpdNyFRXRo8133N5Zh7tr+zv1aa+q2j4Mw+VcIxstIUQPrnOr/m03AtJgOgZ6p3UNM
	 vSkPJYtERTsH5KnZXdEscvo+nXGkJ1YyX0K/UO8QZkQo462nTbr2nGGO9IuOeU/E7DxUl
	 IKFgPo+dPQfftlImYkQlQPbt8ltmkGngdHaac8QxCIVZihdj7Im5f7N1hdicaVcqwSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S2zL1F5L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B14A606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B14A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S2zL1F5L
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc18f754f1so50097137.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792591972; cv=none;
        d=google.com; s=arc-20260327;
        b=YO1i9yI/60osB6RrreEPlDNdV/mu7jLWFA1MgeOiGWNqsXHkKhfBevRXdHdN+lVF11
         ztKbEOg4dbcBjXxzlFEURU5sH3h7s+WgqmP2fRe2MAOU7fMfQI/UkdzKr8JR1YqZpXxL
         /+m4TY5Iq6XCTB57Uh4yWi9KM9glOMdYEM+LEjuhgltRdvl/xQV7TRGDx1hRyy3MawXg
         Z0rlWcXiphntnW0mp5PXQ+4Qr7cS2JiRZ9IB58U7JxPKNNLLiuYTXU5A+Dj1o9YjaJHr
         m/V4EG6gA+jboS4h5qho4k8NjOwqrnmh4uEgi55uQIi/gT2q+hA7bKOu9Yju1/HlriR0
         WlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qQoWmb/HxHac52NQWhLiq+3ibthAyPMRZsuipu+rdAs=;
        fh=hh1GrVfhVB1ucSNCSx1170yG/przg3u/9h+bwTUJPmc=;
        b=oD6q+Jl32UD9sJ+coQjJikqiGVzEqOUXl6fyeyoeo9DKrdWjkgXA7fUm3HQBG6J9ip
         V3VaRRmvVOU/uCuHOEkQgzI0NxDhPduD6nqGw3dTQ/SuRLodW3x6p+cHuMYhuwk30l/m
         zGrBCRrl3abQwa5FfhdD2MPN+vst8CGNNtmmicC02a5VNJZ8GjkG1BNOC8aGSOSvosIZ
         fBVKY9wfmkKUoI5yCdRGa1z6DAMEpZ2rUojwLrC4MqdOL6/j6BKiqev8vejEiSHzjKJp
         cNMcPvWdInENaNn8cd5Qzer3qgbA/yxyxyQPs9qZ4crPXVSfZbIIzccURfdtwRKEp6CG
         h5pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792591972; x=1793196772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qQoWmb/HxHac52NQWhLiq+3ibthAyPMRZsuipu+rdAs=;
        b=S2zL1F5LQnUit/cyEmepiGwr2nMGoeBLpFRTIMumo6GlaOpJHibSVVDa2x+n81QhDT
         9UuE+gZHdc++qmjOMZ638o3Bp5IkStzOf7HDugPBe2qGokRq16HS473NZQyBooGhlBS8
         IggO/Kj8r1kaZl/0YEcGN4HW3ShI+ZfVedKkzTvJnV7kznYS1SUHGHp+1UOgaK7ZhCc8
         sne99Ez4/vKYCenr7vfaSnIx65MKdbMiMnx7o/9k9JUQuNf6tytLE7G99PX9dvQ3oG+O
         3ylEtpnpuR/i5pF3wKTz2m2pcshrhwAwcFK07gZPOrdBuMwZKZiyfc+GxdyDIW2dwpaf
         Movg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591972; x=1793196772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQoWmb/HxHac52NQWhLiq+3ibthAyPMRZsuipu+rdAs=;
        b=AXJXEzSrhvdbP2e8FBeJSNjZnDeCeZ38d6+AZ+gYoVJfjTJmW7LFReSqCqwd0xIxug
         BNRkhP+hzo1V8ZcAug+WOulM+1Np0ne9TZdENLmm9aPLyUz3W4T9WSN+Kse9Ou31Srkn
         d5fI+40urrPJUQr8WlTFisqpZuDRWICKDgz/SMORH+ZAUnbIzWMviOwfF8deza1IHvuf
         xPiE6dzFjmPfC/DYa6igxcMfY9qmlE23qgT0k04dY0pjV+GKqd6gaclUh4Zz8bqJZSXW
         0U8knHPvGAEvk1MSbsiB3en21zPt8dtVIrrfYvqP6rbtRjFFUrgD/pQjnyck+dZYvbgD
         uW3w==
X-Forwarded-Encrypted: i=1; AKwUvBz1FTkvltIOAO7EJqbwrsVhKUOOI7gnVw9s4yqRKwcrW85nxN+UnMSDqXxVqZhAdmrdcSBKUbsb71g33Ic=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnoRJ6uwPGdN1VaFTtboUWikYc0a7AJmO2a25fr7Mulbw3waTv
	RG30iG2LQ9tB2BptX1oZ8QjHXWXcdp5GmkJsVvs6wnts73EnfRsrok+9KBK4US8X1XX4uSHWUGk
	K8k3RrwIdalByKmQyjuY8qrUaJn4z7Cc=
X-Gm-Gg: AYBFou3NJbhEiHJTCY7swuRLat0lqD9ZMRvOn6fmqoDtt8B0LGY59Y63RELMhGD5myF
	ohJ/RA92xoxc4Qq11rNo7qhRdqQYQhw3r1fdnAl+ZJHihvuPFhOgr95HQn6thvrSGcKaBT/bdPH
	8J14494orWtj2vr+bfJXp5Coo+BD2wmOlXK8eG0yQA8YoVq0aGMBikMqmVfKPkhx1hDCwkdWpOV
	0DoKKbRizWR7imtJgf5XaqSprKwKGEmz6PLoq/8ZnVoIkmbNyEjSzOrx7zsmR/ZjNOs6g7Tdzzw
	TpjkpVK+nPmgV+Nxu5DHfg/eqTj7Ba02/jKSbAmioT4JzUfe5a/4v4n4CfuqsTfLNQXe2JFeHmb
	2BwiUfAKxk13aml7LoceG2izhqEFn18LZ1+i43wpgCAggo7opl3B0H7PxUCtl1Nh65zvKSwLT5T
	Ib9626WvS769UnRsFSRvZqMmY=
X-Received: by 2002:a05:6102:4194:b0:7c8:3b8c:82ae with SMTP id
 ada2fe7eead31-7cc926171f6mr628639137.2.1792591972231; Wed, 21 Oct 2026
 07:12:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021114122.94008-1-mptagliari@gmail.com> <8c60afb2-cb0b-4aec-9237-2ea3404d2793@amd.com>
In-Reply-To: <8c60afb2-cb0b-4aec-9237-2ea3404d2793@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Oct 2026 10:12:39 -0400
X-Gm-Features: AclHuK-Mw9BGZVWGR9q1KrhBrhnJKuPSqN4NUM_n9lJDGuHjZIzRA7A2WIY6Swg
Message-ID: <CADnq5_N-9O7Ba_o-mbPQU98Fr=LnRoGeJG5TtguSeK9wRM2kwA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/radeon: fix VCE1 encoding on SI by handling the
 VCE interrupt
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:10=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> [Adding Timur on CC]
>
> On 10/21/26 13:41, Matheus Tagliari wrote:
> > Hardware H.264 encoding with the VCE block on SI GPUs (radeon driver)
> > hangs the GPU after a few dozen frames.  I hit it with the KDE Plasma
> > RDP server, which encodes through VAAPI, and reproduced it with a
> > plain "ffmpeg -vaapi_device ... -c:v h264_vaapi" test on a Radeon HD
> > 8870M (Cape Verde).
> >
> > The VCE1 code never enables the VCE trap interrupt and the SI (and
> > Trinity) interrupt handlers do not process it, unlike the CIK code and
> > amdgpu.  Patch 1 adds the handlers, patch 2 enables the interrupt.
>
> Oh, I do remember that I intentionally never enabled interrupts for VCE o=
n radeon. But I honestly absolutely doesn't remember why (that was ~12-13 y=
ears ago!).
>
> Timur hammered out most (all?) of the UVD/VCE bugs on SI, CIK and partial=
ly Polaris hardware as well for amdgpu and we are strongly considering just=
 dropping SI/CIK support for radeon.
>
> The fence handling on radeon should work completely without interrupts si=
nce those have been rather flaky on really old HW.
>
> So no idea why that actually crashes for you if the interrupt is not enab=
led, my educated guess is that enabling interrupts actually doesn't fix the=
 crash but makes it less likely because of timing change.
>
> Would it be possible to just switch over to amdgpu instead? Or is there a=
ny support still missing there?

VCE1 was also on some older APUs that are radeon only.

Alex

>
> Regards,
> Christian.
>
> >
> > Results on Debian 6.12.113 (see patch 2 for numbers): hang before,
> > none after, and 34 fps instead of ~4 fps for the workaround that avoids
> > the hang.  The KDE RDP server (KRDP) itself, driven by a local FreeRDP
> > client, now encodes on the VCE ring for several minutes (about 40
> > fences per second on ring 6 in the radeon_fence_emit tracepoint) with a
> > clean kernel log.
> >
> > Two caveats:
> >
> >  - I have not worked out why the missing interrupt turns into ring
> >    lockups instead of only added latency.  What I know is that the
> >    hang needs the VCE ring to wait on a hardware semaphore (disabling
> >    only the waiting side, or both sides, of radeon_vce_semaphore_emit()
> >    avoids it) and that handling the interrupt makes it go away with
> >    the semaphores left enabled.  If someone knows why, I would be glad
> >    to improve the commit message.
> >  - The Trinity/Richland change is compile tested only.
> >
> > The series was developed and tested on Debian's 6.12.113 with the
> > radeon module built out of tree.  It applies cleanly on drm-next
> > (fad06cf), where drivers/gpu/drm/radeon builds without warnings (W=3D1,
> > allmodconfig) both after patch 1 and with the whole series.
> >
> > Matheus Tagliari (2):
> >   drm/radeon: process the VCE interrupt on SI and Trinity
> >   drm/radeon/vce1: enable the VCE trap interrupt
> >
> >  drivers/gpu/drm/radeon/evergreen.c | 14 ++++++++++++++
> >  drivers/gpu/drm/radeon/si.c        | 14 ++++++++++++++
> >  drivers/gpu/drm/radeon/sid.h       |  2 ++
> >  drivers/gpu/drm/radeon/vce_v1_0.c  |  4 ++++
> >  4 files changed, 34 insertions(+)
> >
> >
> > base-commit: fad06cfaf385787b9ffa2f73f049d42dbe1de57f
> > --
> > 2.47.3
> >
>
