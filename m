Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794916083;
	b=JbE6nViSXJhaxJvnowIGtlgnxKy7YhWhWkcZfWj9sNMzevqVuMzJR+V7PU9f5PEBBE4B
	 +ZGgUPE3tqj6fYPUH16Q0hghy5XrGrmUNasWZYq0V3ZKa+04g1lM3J6zj2mWUBK07w920
	 da+9pswUdfgC1eUqa2S3kNaEK25+qfYWNAVupR6JDP2abZFUEG/t0qpLZIDpGMh/K8Lp3
	 WV6jPczuwhD7gFF882kGeE94EDBpRTacAT/97VtZ4Y2ewYXXmxm//NWHTw1RQ2XyEnUUD
	 7yU/vLA6tsIupW64mp2pyum+BcJm0Q/hfe1yi4NEx65ta4GrLwEZnwuwQ9SzY+q51Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZoBhnBiIyTXzTlmuhruzg+59oAFd+etNNJs/77R43ik=;
	b=c9ac+OBV0y86gvRIGFdbPcNgl2aPqbN7yzjF/tZ/wL8nbPZgZ9Npgv3jJMtcQWemC4ru
	 G+z3qiLXQ7Uv5qXsiX4QiBl5BFyiINwp1rYc4CqogNPVg+blOfAPFnFRhCYNSSav/OloD
	 RLxswOBy0GH7wyy4q1mlJoddK/7XI5Yrc9Bl2/YmBHfCSwrv1IhCm6fQnygMqlWjUJwe9
	 Kc3ECp4HSdGAlPqX6VEZOqk9aOxjrN7UmBTzo5lJeloVGHLBjRa5byiDJpMEJjqLXr2/S
	 7LxXnQCOW8+2xnvlshqPllRZ5CZnGg6ARpPlsNTWqJPHeny7zdNU4GxYWubH2yljmZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xtkv6N2F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C179E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C179E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xtkv6N2F
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso5682123c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794916082; cv=none;
        d=google.com; s=arc-20260327;
        b=rpKDU3lPM2zNwz9c7cO0CIsKCF0WRJD6SDhRoTZSuIynv97iX6xVF51ivSD2+IDhtq
         JK21gqiExtHmjoYIhGKvlXMAMPRTtdVqFow3wJbFZF5ZGZ2l2Vqhy44W+GntTONp1whB
         bBHJu2q5MZNE8EXtiPaO9dvO7s/NKsyY4TK1Pd4KS9BO6PCWU3L9TYHhRIVWBm3GpZuX
         oCv7Kraop2EZN0mQcYmzzpPGmrQGTA5I6hxHqIUA+z8JoXdchJOVI2Srrv1Bk4TkIpTP
         A6IGfMUL6IvqrUyiGB+OQK4NCX2r1Lz1AcmbeG+yiWH/1u+SVRyF13dqnRaA44Ps1dCO
         myvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZoBhnBiIyTXzTlmuhruzg+59oAFd+etNNJs/77R43ik=;
        fh=AdQcoVO7lGBjzXj7P4LYCQgxbnV1E33F3oUP+3tci94=;
        b=Ps5JINIygQX2HKvdU8YPoHcX1012tYjkH/4xaWLscs3LYslDWoO/aaj9zH99hDVCiX
         B5ivhg1rqXW5u7pkscgRAFt33eloYZZW30hBgHoXRBsO38OZ9z2lTHj4KHXrLNyY9WNt
         2lf7ZIQ5R8RpIE43Uu344deT9GCX61w7UBID+kPb7Irh/19jSjzSlG7tCiHRgKr1Y3mb
         S1lI9DN7NbJAauYWB0rly1/xzB62KJ5llRCl+2FYSFHotIuYyc3IJnCrnzBh1lkXkVPC
         GFsTr0C17ZZrs/uhxf5QGIM9wwCFxXhkdU0P3ORzzd6+9jFJ2lkRzH+xjt3OWzLcbb/c
         PRTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916082; x=1795520882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZoBhnBiIyTXzTlmuhruzg+59oAFd+etNNJs/77R43ik=;
        b=Xtkv6N2FP8AEhZMOlCVNyEnnt+TsaldjMmlwhyMueZcgQZ3YLGVhn6v3rM4B+bd54X
         hoN2ZQqbpRXAbPpFQVnsSxKiTBL8e0eQxtpkjiDL4/CHBDAWrsdETn4j2nyvS9BH/Stb
         Hah5S+Bv6PnG8SaVN0ID2ig7xjZstKtkjqH6mGla3ow1yH66Ru92FMc+JCtvBmuxdOc6
         LmeZi3MWmLUKQjJzCa/PI/KYnkD72M5efFKKc/GPRgkUpB00ki2+4Qdj4XM8FcuAZfYC
         e4BScxD7LgvEqrKsFTTlrmoSS2kdQeGTxDSHhMiot78JYAICQeK4arn+zknyqPHfktXh
         rqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916082; x=1795520882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoBhnBiIyTXzTlmuhruzg+59oAFd+etNNJs/77R43ik=;
        b=nBtWrDJ0o8gGqU7RItVROzI9LC8+RPJ3Cs9n1m6SytAg//9EkNdcD4z33MjYr2OIQn
         Nis7vk50neQ40gIdRUhZ+J2wOScV83C6ClsCnYmq7f07Ll0e1rnVIKhVi4jiqyWQYO9Z
         N35sMcPxCetIa9uW466w57R1h7zQSoqbEiRZgNj8t4MuGGTF/zptvLGd0XP0M2crd9+P
         8iftfW19MchY6pAPA6t/eXhuXhGUhi23cBPe9z9z4vAVijJQR7G4QiuM+tV8FvZo1yCA
         8xmRFXL0lJyTAIbGZnVUUzYcEttHN4jhWynjCy3GwHDjBgq5XTbSSqlRfYyWPLJIGyfw
         5lWw==
X-Forwarded-Encrypted: i=1; AL+hErF7Kf/tc5NoNZfBgTVqFYoZ4U+rRAzsrU6n623RyBGl6VwcLXa+MxvqyntVjj9EUko/pj/z4788Rts/a2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XN5CcZTCu0hifvSu4KgtHRaYr2jBKBHA68sAz2+/lhPnp4RkG
	4BbtP1wfpqrEXi1EQmjmSsNSML5+AI2XWEskKOA+k5f8bBgMJGFoGldZXVvbwbprg02gHqge7Kg
	YATTDBj/l4hNGs24h+DwqrDhN0/W9lEA=
X-Gm-Gg: AYBFou35MjaO2/jdH4P4jm+nTQ/DH8rfhZAUB1medcY1nMeUu6vXrVaYdhmW4ihNOnJ
	0MLWs3k1LHb284ci7Nhu+FFSy2vP+KVh6P5/z7vbUUWIYkbt1oKGFy22REzwKOXOagMcSCjrIPj
	3GhPEd6rxTWU9tfCzht5LbP2ls0GgIhf1p3m8X1rRm49rrSsXopGHIZ1ORudHWATM5h2HoFjizU
	YqHcdK/Q4zaeGTeZPzt/U0C8jpfMk7NBJabVTUfia1268mSFJLolhwEkmQzL+lmmCk3ClpiPVql
	F8P6f7ab3uNOzgy37eZER0i71aVEcuXDG1XcGR4kpMmTEkOTNJbz6Ri0pLQTyRQm87nLG0fGsR7
	uU6faYYMFHd0LAuafL3nsI+wtMtffxl09Bs0+nJhs4SKCiKRFqHy/ijQ=
X-Received: by 2002:a05:7022:5f07:b0:1b2:558a:d781 with SMTP id
 a92af1059eb24-1b50302f22bmr13388536c88.5.1794916081803; Tue, 17 Nov 2026
 03:48:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112155822.1336713-1-islituo@gmail.com> <avunXOrG8wfAI2cR@dell-wzy>
In-Reply-To: <avunXOrG8wfAI2cR@dell-wzy>
From: Tuo Li <islituo@gmail.com>
Date: Tue, 17 Nov 2026 19:47:45 +0800
X-Gm-Features: AclHuK8I452A33r3exp9zhLHF3StFZ_XwPZhDpycWCYlYlcLh7BzXZoh5rdTs10
Message-ID: <CADm8Tem-kCYD5XO_fznRoM8oNcv8EkxizEYDpBDb4X9Z20vw1g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix NULL pointer dereference in slot switch
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: zhi.wang.linux@gmail.com, jani.nikula@linux.intel.com, 
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net, 
	airlied@gmail.com, simona@ffwll.ch, ankit.k.nautiyal@intel.com, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 9:01=E2=80=AFAM Zhenyu Wang <zhenyuw.linux@gmail.co=
m> wrote:
>
> On Thu, Nov 12, 2026 at 11:58:22PM +0800, Tuo Li wrote:
> > The running slot is updated to the pending slot before updating the run=
ning
> > context. However, the condition checks the old running context instead =
of
> > the newly assigned running slot.
> >
> > When no pending slot exists, running_slot becomes NULL. If the previous
> > running_context is non-NULL, the code attempts to access
> > running_slot->ctx[0], resulting in a NULL pointer dereference.
> >
> > To fix this possible NULL pointer dereference, check running_slot inste=
ad
> > to ensure that running_context is updated only when a valid slot is
> > available.
>
> Well, just AI generated static check but without any runtime analysis,
> again...and can't even show kernel oops of this, as it simply can't happe=
n..
>
> >
> > Fixes: 8453d674ae7e ("drm/i915/gvt: vGPU execlist virtualization")
> > Signed-off-by: Tuo Li <islituo@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/execlist.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915=
/gvt/execlist.c
> > index 29147a9f162e..763c310f2aaf 100644
> > --- a/drivers/gpu/drm/i915/gvt/execlist.c
> > +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> > @@ -73,7 +73,7 @@ static void switch_virtual_execlist_slot(struct intel=
_vgpu_execlist *execlist)
> >
> >       execlist->running_slot =3D execlist->pending_slot;
> >       execlist->pending_slot =3D NULL;
> > -     execlist->running_context =3D execlist->running_context ?
> > +     execlist->running_context =3D execlist->running_slot ?
> >               &execlist->running_slot->ctx[0] : NULL;
> >
>
> Current code calls this switch in case whenever running_slot is
> available, so it won't have null ptr reference. But code looks a
> little weird, as current code tried to assign running_context in other
> place e.g when new request happened, or even it might seem to miss
> when enter execlist idle state...but it is still valid in switch
> call. So I think this is just harmless. If you'd like for further
> cleanup, that needs testing result for sure.

Thanks for the clarification. I will drop this patch. Sorry for the noise.

Sincerely,
Tuo Li
