Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704116;
	b=tcsViBxQHt2MH1ZIwVMYy1Ci7QCrD5S+XUxjVkdBG8xRu8V7a0EuROi5a3+5U1kaJFHS
	 XY9T9EMbF1AVLXzz1qLb7EWLOghb+2pSXnf4rCMlodHSAbXXi+E8X3x20rtRLQJ4O50im
	 gTRdyskg/ZtQ19xgiwDmP7f9Bn+IAm+MeLEbFJczkCvdby6C7Sk3I59tdh/k39ud8+ETr
	 4uJhKLQzcDembk0e3DP69gh0AZyrNgiwgvBo9nSkusEZyu0gv08u0gz8/jhim3PZ9mtIx
	 XPcPC7rUOo9pauELgdoBzB/H4vfoHX85BY5MJSG//aNJXMcvG6f/+7FkVRz4vdACXeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=ZbdQtj8aRv8Qaqx0U63gfrGuX304wgT8my2VMv2KCwA=;
	b=x9MGVhIfDm76oXEM4/smyPQaUD0M8auZJdgrt175P8ZRogTAyF9UK6S5rV2DR/A3BuQ5
	 6QSKQSZbeD8aHSG3X/nFWn1gaw+Ss6exSC6rZ7T6VcYjQ38vk+6MQD26V9tzM69oeCNzT
	 PeozZ4GTtzTfsNnEkG14y0h2SwmC6hElfc4YE+/KUEXi3izFJYtAuRtCTJMy/prNmzBVr
	 dglO6BiPbUzgsri/3o0Vme+XWU38XaX6K1i+O9ETC7yLtOq3KxfOCt/m4vbxUM1H4Wt6i
	 X7kWWCbnHRMPGa1RYDB6nc3k9xKaQw3Jj87aLmSwRqgoJd4w05kgAGkJkm1xutm5tng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aJGA3c07;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E195F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aJGA3c07
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-84e513877a3so153104a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792704115; x=1793308915; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZbdQtj8aRv8Qaqx0U63gfrGuX304wgT8my2VMv2KCwA=;
        b=aJGA3c07+qhYxHL87d6kNw98PLl6X3ilVxPOEd3vJI1okWVNoQn14USfUKDaQmLIz8
         7NOI3/JR7/THCvWsEztZDZjTnpAxdT6hEYRG0ckB+G2NeAVVPb2eCz5BfVMJ7nnAca+A
         Va9Fx+XjsaNe/kfcWTr1C8FhKTjIe/QIdJhMb1kEyMur5iaoISGo9oO92/Z3cltMv9A2
         I9DJ2hIVCRmMJpuIfMT6F4ZVhJ75cpc0tM10+losIH2llsnY8d4krf6bh28aZSy/s6VF
         4ae9u/Jzjr3DrHmT8POjOEOjvuwcQRu9P4gT/pu7jbb0inrKaCC0c9MPSMO6jyKJs5c8
         MurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792704115; x=1793308915;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbdQtj8aRv8Qaqx0U63gfrGuX304wgT8my2VMv2KCwA=;
        b=QPzcOZC5HCNlw6p78V09GBs8z+MyfwQIA4pViEaXONgqmfbLYy8Egasz/elLSoyf72
         rDbD2gnWWhQNwXQKZtAHYch6xdLbXfBdpSChxs9KfkvGYzxP1NmnYSX45oSP1gFQPZ0P
         1KAMpKYwe68DVwWxNKyEdF4nqnEi2m4xg+Iy9Ep/qoF77xf9vToOwk/MdysWI76UQyIr
         M9RZmnnUx2RTsFyAzrAdHJZjzapSCWG6ZEf07cLxKs5iQiVCN4lx+C4Sqq8u58aGDltC
         sGKh2nalM3EacWJc1Mu35ABL+wdlFl6XiS4Rzsyc6fyHa+p2BEGl4fIlg7qR7Zq0vVt5
         o8hA==
X-Forwarded-Encrypted: i=1; AKwUvBw9t/zNlLXVvgF/3XvsC8bonIBwkZNbNsuaG6az9iCGtG8JGhEf2jHjHbctXGAStunQ9QMXezhKPIRE9aI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlGse+Twgm7e+MAwJmiv/czatnaZOrfjj3VlynHboQbgMnqZjH
	oDdeAxb8HVMSjsD3iZCVI3jzHew8ZyLddJ7I1gkRV1raKORv3TTgh4qO
X-Gm-Gg: AYBFou1B1KPUQKDEmcZ0XCrrXhImYdMrTCYRGpSAdOJzwhi1j4R6bXBwjg/2AygR44n
	vBOc7I6LIvGQqi7B1lkmQrVjJINnboOMK75hGU3hAp1ph7jkotGyyJS9GdnQ/417sp9a/TF7M3O
	73DPdBdYUGgTuIFrnIMqcEIVcLbcShX/liNiHAHPKlr26yZ0E+QtlbYgX8wsSII2Ei8tFsrvPfA
	Ok5xuZDWoyE9ze6RN47oZZ7Lm3vwliI7E72o8UMvOut0Jy+3X44MbtJzuLAjIJOVMmtsEAoYthn
	5PkQrjLEzASHdwMaPAv1dXqM4SErfKyiYjXn3xX+WLOMpsxKXKt2m1JrIPFxcZ2BMla1ky+wCal
	p8eOMtKat1C6rvn8D2bcbe3CALmtnFnrm94sB+CcsTgua2R3BzWvu4bJXJ571TfNhnLubfhrbJC
	r5z//vCSJC5qZvgMiyDQ3HqczFJCWvi6TxWmOHygb3hMEjlQ87JvDXzJwgEW4U81jrrLp6rkcwR
	+oqR23y1gcGjMem3wCbdfYoBpRGnEjGPx6JuPkc1HTe5u8kpQKAK/9RWdxHhP8R6A==
X-Received: by 2002:a9d:640f:0:b0:846:6f06:33d9 with SMTP id 46e09a7af769-84e345f009dmr1665705a34.31.1792704114689;
        Thu, 22 Oct 2026 14:21:54 -0700 (PDT)
Received: from timur-max.localnet ([2806:105e:c:c9fd:4410:7a5:8e46:9c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbea6667bsm197377a34.24.2026.10.22.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:21:53 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Matheus Tagliari <mptagliari@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 0/2] drm/radeon: fix VCE1 encoding on SI by handling the VCE
 interrupt
Date: Thu, 22 Oct 2026 15:21:52 -0600
Message-ID: <9yQu5OqOSQiEjRU6vUeH3Q@gmail.com>
In-Reply-To: <3c11368b-06a3-4f25-8dc3-f57596b4f627@amd.com>
References:
 <8c60afb2-cb0b-4aec-9237-2ea3404d2793@amd.com>
 <20261021153346.124285-1-mptagliari@gmail.com>
 <3c11368b-06a3-4f25-8dc3-f57596b4f627@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On 2026. okt=C3=B3ber 22., cs=C3=BCt=C3=B6rt=C3=B6k 4:00:53 k=C3=B6z=C3=A9p=
s=C5=91 =C3=A1llamokbeli z=C3=B3naid=C5=91 Christian=20
K=C3=B6nig wrote:
> On 10/21/26 17:33, Matheus Tagliari wrote:
> > On Wed, Oct 21, 2026 at 04:10:04PM +0200, Christian K=C3=B6nig wrote:
> >> The fence handling on radeon should work completely without interrupts
> >> since those have been rather flaky on really old HW.
> >>=20
> >> So no idea why that actually crashes for you if the interrupt is not
> >> enabled, my educated guess is that enabling interrupts actually doesn't
> >> fix the crash but makes it less likely because of timing change.
> >>=20
> >> Would it be possible to just switch over to amdgpu instead? Or is there
> >> any support still missing there?
> >=20
> > Thanks for taking a look.
> >=20
> > On the interrupt: I agree I have not shown why the hang happens, and a
> >=20
> > timing change is entirely possible.  What I can say is limited to this:
> >  - stock radeon: every encode hung within about 100 frames (many runs);
> >  - with the VCE ring semaphores disabled: no hang, but fences are only
> > =20
> >    noticed by the wait timeout, about 4 fps (~256 ms per frame);
> > =20
> >  - with the interrupt enabled and handled, semaphores left on: no hang
> > =20
> >    in roughly ten minutes of total encode time (up to 1080p, plus
> >    several minutes of KDE's RDP server).
> >=20
> > That is correlation, not a root cause.  If it helps I can test enabling
> > VCE_SYS_INT_EN without processing the fences from the handler, and run a
> > long soak test with two concurrent encodes.
> >=20
> > One difference that may be relevant: on CIK radeon does enable and
> > process the VCE interrupt (vce_v2_0_resume() sets VCE_SYS_INT_EN and
> > cik_irq_process() handles src_id 167).  Only VCE1 (SI and Trinity)
> > never did.
> >=20
> > On amdgpu: it works for me, I found nothing missing for this use.  I
> > tested it on 7.2.9 and on Debian's 6.12.113 with the amdgpu VCE1 series
> > backported: h264_vaapi encodes up to 1080p with DPM and runtime PM
> > enabled, no hangs.
> >=20
> > The reason I looked at radeon at all is the distribution situation.
> > Debian 13 stable ships 6.12, where SI is driven by radeon by default
> > and amdgpu has no VCE1 support (that needs a newer kernel, which Debian
> > only offers through backports).  So anyone on the stable kernel who
> > uses VAAPI encoding on an SI card, here through KDE's RDP server, ends
> > up with a wedged GPU.
> >=20
> > Since you are considering dropping SI/CIK from radeon, I do not want to
> > push a change you don't want.  If radeon keeps SI for the 6.x kernels,
> > what would you prefer?
> >=20
> >  a) this series;
> >  b) disable the VCE semaphores like uvd_v1_0 did in 013ead48a843 (works
> > =20
> >     here, but slow);
> > =20
> >  c) leave radeon alone and just document VCE encoding on SI with radeon
> > =20
> >     as a known issue that amdgpu's VCE1 support in newer kernels
> >     supersedes (even a one-line warning pointing to amdgpu.si_support=
=3D1
> >     would help people on 6.x).
> >=20
> > I am fine with any of them, and if it is (c) please feel free to ignore
> > the series.  A v2 of patch 2 that fixes the CIK register issue found by
> > the automated review is ready in case you want (a).
>=20
> Yeah as Alex pointed out trinity is not supported by amdgpu and never wil=
l.
>=20
> On the other hand that APU was the first one with VCE and I widely rememb=
er
> how buggy that HW was. So it is probably a wonder that this works in the
> first place.
>=20
> I would say we take the patch and see. If anybody starts screaming we will
> probably just revert it immediately.
>=20
> Problem is more than I have no time at all to wrap my head around that co=
de
> again. @Timur can you do me a favor and take a look?

Hi,

I skimmed the series and it looks OK to me, though I don't have the energy =
to=20
actually test the radeon KMD. My 20 cents say we should apply the series an=
d=20
see what happens. It won't impact any users who are already using amdgpu, b=
ut=20
hopefully if we backport the series it will help users who are stuck on old=
=20
distros like Matheus says, or old pre-GCN APUs.

Best regards,
Timur




