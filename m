Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793782822;
	b=1T3GJDc0zMlqZvGfs524cdXcvvuFadl4JkmBPzYyZI/5xHiN9j610Yi3AFQpB2x4f/Yl
	 TScmc2nlWFvPEPHSGsgkIHki8zxQocflMuqENjZuUeEPWqytuL/hxrnePTdTBl4vC/48c
	 avdNq93cBR992qAnSxuRzIfIpJaaO0d20djB+gtdrQpNCz9AD29gla3viwE2Mme7Pe2Cu
	 8RaoQwZbyBVy8yXIbA2vcgkQc+1zVtC0rx3BXDjhra9vt+2zJ0hWCWR9Rzj7bnYO4lmYN
	 NEcJ0Vl34BagmzqNUmVGZB9V4kILbE5wCS93+P1FlHBq/uORxJOKHR/DRRxlabA3UkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
	b=i16VfXN1rZB9HMDqGAqDNCakm2Ali3ZChnakwFsdjrtlgX+nkckqO9N9717KgLfgJwSU
	 mSFGo8YjALC+fSCOEqTv8tHrmOzC/CixoLRTLGwDXayv2BoL7ZFwWcmsdxFHnXiN7esh6
	 AlUA+j9wS5/qjFWzBXPrVVQRRKUBQZn/hAFXLVeETXUhsq9Wk7ffR/e/oj0jS7crm4fpM
	 c55pMyVQYfHcLHMroMjJ5QdTurgLfFjrGixpOs/o8lfgFaXx0CGmlnDMZHxIvyY+GMe5P
	 /+m5FKV6zsr7Q991UIV+uawld54WdM34q8lnmWEOMireWQXtjWs6Y/71wyTNx57GFow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3ivZqyW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18064606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18064606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3ivZqyW
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b315dd057bso1272477b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793782821; cv=none;
        d=google.com; s=arc-20260327;
        b=W4L9sLwbOo9TOAfR7TI8itzU5qCSxDc5AeT78G0TBG+5ki7Dpdsm6LQW/YLb3KaaTc
         hD2EcGZXx4Bv5N8PqrSDd0+qFKg2bJMqJODv4JPqBD1hhi9SM3wkvfj/+cSiaAQncBR2
         iPxc6PYRZlUEjJx64sBX6u39YDDZFG+GMIimCdVI/BlYY5WxPhrbTfr0jK9HFnG7ttPp
         BBl+n9qEKyCjAsgMHXSGH2+EAa5vr1CVqrA/FUJ5r3dsX3D49TJLVfEWGMIS5wlNJBIx
         EBuJaQQ/tmXm2Ud+cTrzqG/uWe4D9ky+dFXwvqq8CZR6Mqf6MAG8gstGifbucX3JP65w
         9t3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
        fh=+5maUoN3mmonHqBKiVMeXUtFYBPyxkAAiOjiZWxe6Hs=;
        b=mM4inAsLFpaBYnXpCabxJqTEFWatenc/bGfIptVEjRVohs6wM7IqH/E4jqa/XoiqKz
         lilrE/mMXOVHTq7xzFfT3quNQVtf+mQUFlxpG1TFtR5LsgvVKt0uxAV4jW/AnaNU1Xg0
         GpGtXY4g+0qAo02n5xNaSgdkXgvtuBEW/BlvBdBjkXgudej9gA8Rc84cE4FPfw2CJqYc
         TxgwhdkMkWqu4mhiBcq4/rANmT9x4ua9jyA4J1r1rzaYTNb90zSiqviRv25LnEFQcG5W
         dCpeHtCH8zLvWS7z9JuxRUv0qx0RDLBhzwkoNAcCPyrgDL5kFQ8iqTfTHec7QTaR6OeJ
         qydw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782821; x=1794387621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
        b=k3ivZqyW/i5hsCfSRegBwCk6+sTwnMRe7s8pzYECupWJ8doY2l0NM6dGujR8WERmtz
         Xx8CRdRoPq1VTSAfQ5LZv5eygZustD9uJ2aH41pwzYJ1VN5Y6LBmSXfijcKkJMdEkld3
         NEuh6+e22bGZzRiW1upH4Xj+cmgHIz+zmzx8rItCOxgKE/GKjX7mLA9TVMr2xUTCVkB5
         CMifmp38Yrb5Cr0mrZhReHJdZmrk3G10CtLHe80OUMLuolhPV59MYRlSgcchjf7rlPQb
         LN9LF0W0cFfhhFpd9LlvtmPjEogpw2WfQjzBI2Dl901e0efdGQCQ+RPMLwblaQeApa0y
         c0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782821; x=1794387621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
        b=KHLGJt9Pp3Mxa/p6N5ikcJjluuKpTaR9uxMB7k4ZfRQlZ6NdxWfpeuJaFxdXQYI7E1
         JnqWcP/KY9Lovigj4ydQXRz2AFl5Wu5vGvOyi/PcZDaOOjyqFXHWFyRxvLqrXfH2Moiw
         ERx+4haASgbQgH8IoMTMQIj/HLEwXLYW7Em/n+grPrSIUHoyzQ5hReWNyoqsWrc068fK
         67nD2gaMFhT3efPb/vIttqoKjYOFDsqDXidz60nk0TuwAc80GH+kVZYK2K9LrpL7P1+W
         XlhrQKTWFW0pzLTl3QCcaOjQT3DvdxQZL6RqtqOoL8uV6raeosYHGfnNlnK7LDbck7Kx
         jRTA==
X-Forwarded-Encrypted: i=1; AKwUvBy2sEpHQ01ks1lu57CUH7CaYZ5cMo9FHQejNcZjRcBhOaZs8YuRYHNIYDsesXPgt/sEPrkNsVGbIfL9dMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zqNVsLOC5l7laMXtN2woEfxA5gMBwJY4NP1TbT4FYFwiMP1LP
	9oakmflHBzuf+UmhHqdb3zZnNy6ykA+2YzJmFeqi0e0B8xtdI+lX8lIOun9boP/uJtmJQd9339m
	FpMbyucIlSDkcp8znVHs1LGoDQJs0WwY=
X-Gm-Gg: AYBFou2iOz19YWVMRb5thnVRyRVz6fkeGf8eG3NfxPFMmn7O3wYI3naDg+2WKfvdNK0
	N2q7KQedXbAsCKBCoo/ii/oUbuf2KkKd2w8yGCL9FpmbVSa8WZ+7/i61PWEF7c6VALPUGVx5nik
	3tcjskNFbGutDk7vbiv9/+SpkhjBd1vRIj5DoJc8qr7o1St6An9z0YUJiPg1secT973B4qUTI/h
	caofjFui6r5XM8gyvP0AJbxaviDRvXP62Uu7XUEtNlKr1gqj/FlhhDxgLM//hH5enXDdpvlw8Gt
	qWUhcjrA7/6sNlwz3d1RDa0i0W79PkqWjfSS9QNyN6msh7+37tFQ40KzMrZXCtaZ3GnurHVJM43
	40anJPdlXF3kBjpp0EIYDYZsqJfqy08cauMJ3pu3laBTQEvtR8by4vWcoAB2bkE3hqmtC
X-Received: by 2002:a05:690c:f05:b0:8a1:781f:4aa0 with SMTP id
 00721157ae682-8b2b67f1889mr109610237b3.56.1793782820885; Wed, 04 Nov 2026
 01:00:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com> <20261102130145.GU158991@black.igk.intel.com>
In-Reply-To: <20261102130145.GU158991@black.igk.intel.com>
From: Diego C N <diego.sure@gmail.com>
Date: Wed, 4 Nov 2026 10:00:08 +0100
X-Gm-Features: AclHuK-KTLDrGi9C8ZMZKwzhArkycX_ZxWgS8iSAY08wiND5eYgccYF5_KZeB0A
Message-ID: <CACPnnOZHhdwOSDhsnG22SyPD1JsrcgM4Y26QYORd=xoUzhXuVw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/dp_tunnel: Allow BWA when the DP IN adapter does
 not advertise it
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org, 
	Uma Shankar <uma.shankar@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mika Westerberg <westeri@kernel.org>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika,

Oh, I see. Well, thanks anyway for taking time to check this patch and
for answering it.
I'll keep it as my personal patch since it's been working very well
for the past weeks.

On Mon, Nov 2, 2026 at 2:02=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Sat, Oct 31, 2026 at 01:18:18AM +0100, Diego Nogu=C3=AAs via B4 Relay =
wrote:
> > From: Diego Nogu=C3=AAs <diego.sure@gmail.com>
> >
> > On an Alder Lake host (i7-1265U) with a Thunderbolt 4 dock (Dell WD22TB=
4,
> > Goshen Ridge) driving two 4K@60 monitors through two DP tunnels, the
> > monitor whose tunnel is created second is limited to 4K@30. Which monit=
or
> > is affected depends only on the order in which they are powered on.
> >
> > The thunderbolt driver enables the BW allocation mode (BWA) on both DP =
IN
> > adapters: it sets the CM BWA support (DP_USB4_DRIVER_BW_CAPABILITY), a
> > group ID and the estimated BW. The DP IN adapter, however, never sets
> > DP_IN_BW_ALLOCATION_MODE_SUPPORT in DP_TUNNELING_CAPABILITIES (0xe000d
> > reads 0x01), so tunnel_regs_are_valid() rejects the tunnel with:
>
> Alder Lake firmware really does not support this and by forcing it to be
> enabled you may end up in untested code paths and interesting behavior :)
> BWA was only officially supported starting from Meteor Lake.



--=20
Diego C. N.
