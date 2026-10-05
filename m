Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E915023C516
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205240; cv=pass; b=t/UCaddyD3E7b8wDwUESrBu0WfMsgVomJqPwfhFbqnOJX556dKOw02ryHIFK9TaMsu0VFi6Y3okpX0th76cKbPX9fHWz9bOF5ISVVJ3jLtp0t05a+QbYMhNHbC3gHOj0AEMxzoJvSvSdaBAFA+RBjFdkmLGyNiECd7d1+D/efow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205240; c=relaxed/simple;
	bh=lqu8idoflIEspPp+iCi7QnrMJpBiHC5qMef14ajyfgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+mLLs80Aa6oTpTjqMUfDesafQUrT1rPbpB4syInrZNQRuXYBRP6XIQKamtw0HBpmTmnZN7553l2ZJrJVTA6RCBqzYPmWJPjif5EJq/oyN/i/JRH1VU5ODMp88rEs/8YJZaMZpG3wKLkc1ZOtUxPYDBMcA39+SpcKkpJT1TeGWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeDzqrwR; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeDzqrwR"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6768a9fc0e8so1334086d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791205238; cv=none;
        d=google.com; s=arc-20260327;
        b=r3eDZcg2Q//Pe0iNvwcMB46cgfl0dfZXJ67C1mwRFa9ovzuUrk1zajKENS/CK0osXs
         Ll2tCuOpgf/boGN/OqZ8JAF29y34QLXbds+GvG9O6jflnz5ChyfMeFU3sd55eDUqm8CN
         A66vTW7PbDYS69QGzbWMdgg+KZEIANnESYsp8s9VfbIxvGv6C34xQPN+3vTutVH9kFCs
         CnikYMoaJF+LDjKETAUeJDdeOCNU3hGsOIYOs43hIuU6c1yjRPa7foFP0Zu0agIka9TJ
         7N9H2LQgZPuP4MqTpEF8fSKy2QCql6o8hkxk8zY1K7+wDRPo+2QGdbFVfY8rmkldxoz6
         tkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9TVxNLM2/qd2lTVm5cxBkKudIn7jUEvyNDIL+WtL+J0=;
        fh=xjmOkmzH7b9zKTlHWcQruFVUD3vc+582cNhIl3mMoDM=;
        b=XTcKMeJK6ID+XrPa5EBe08nEAdC39OYa3duD4fN4Selip+38wEOOwlkDryPsuE4j3g
         lQ9rbSijzbV2ldhiAYpTAX+TjMBHjtFTIC8W4drB/W+4xWUv5zEvmzC3T+Igjt9IApxx
         aLOlE9jeFmygSFFIV5QX2py0LZ/DKo23oy6JwKLwfxvvHdxrTeO78Yu5Ynb/ahQU7XGs
         VM/zZ258Z8+EVi/Yke9PaDo8EA0CG9syfLZ76Jwkp8GZ7K791l8w6LBYhhE65cNHuPqv
         tHkSwnzx8dnt5+yo1w6Be4jHmsuqihToYM5+qXZeDjdpWl08WH+CZajEwU1zp0oFgIja
         zRIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205238; x=1791810038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9TVxNLM2/qd2lTVm5cxBkKudIn7jUEvyNDIL+WtL+J0=;
        b=KeDzqrwRpiH3Z2bJKw3/HBTZlZ1hhsev4pkSrjXzsv6aklYZPUdUHtkvBg70oj6z2W
         ogThgoFtqoJvorbe7wppcsdsXuOZQZOgYDVayozTIIaKX4ACc/jd9ijFi132RtDhMBXF
         1omJyo7FVRCOQ0mKTvlexjGPZ8gUQSKlsIHDtuwXMVsQmzg1WCkKEdkW/J29Gn8xzvxl
         0UYv4OVPQansjRznu4+WvCjTc5j762CnSiQZC+AoLpLfxv56NKZkROnEGDgrrRFxPpAx
         Q6XlFpT1To4Jqk8wfLewCf/nPPlVomD5VnEVVpabXbDwWggizV+TbMv0Ruwdv0RnogcZ
         pbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205238; x=1791810038;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TVxNLM2/qd2lTVm5cxBkKudIn7jUEvyNDIL+WtL+J0=;
        b=GCM6lDy/HhKIot/F8QfxBQCpn4TeNavzkuy1WUUtoC93TuhMPDyPyFhkbxjxtMN0S/
         tsZnCNDkaGUQRheABfEWeCScbG0mOXkUZI2CqYdlYYqa8SrGbC+O6jgwQnFOLc3h7DyZ
         tjyw9lhQ5EwXX98fh4TorHhWULLHwvYsLyGZ0siMYPcHy+rK5dbDJJOmjhQF9GWhHpps
         yWwrLHYkL9w2tDSNVX/7j087palSexi6J0taF8VXM7bbrZ9LAxg7L9gLJzaMeWu0ha8v
         YjMTuvbH8TXxe9jE+yFYz1sZ4F42HZ+HxLct6aTNz21bkXWcPqWOThoFjR3wZUgs0uYs
         W+dQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8a/K+18HFgTu4/mvU4N0njk4mGwLU1YKd25R0oDUx2DGqSnwQVWLS3QiqTOEMJNgZVqsCyMmtQA/M1L8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL96Rv38bd+aMHK8tRoEJnj0gnWBCLBVdxf8/vCO6cpNJSQvFQD
	JkZOVH8c1O+Z2ewNvZVcJ5e27AS/ss8r3IfwXwBP+DYjt4010GW88pXuRYKdibav7UJ1sc3XTEK
	F8yyKXtl6yGDMkrm2E2wTJJ0nsQOmZdI=
X-Gm-Gg: AYBFou1TQy7XslO2ehthi4oLkjO7dDXDAoC97eZFN8HsYT/AZthRkn8E6xsFsEqmMQ+
	9/zIAyw/89Xj7WRjokOx9DMzme0FvHnZuXhEBoX+HLXf8YPW6o4+SZ3U2vOO8KBEMLRR6wK0xsQ
	87wkLg4eKUkmobq794TZpe9DXu+9wDUslbKekNKnl2Z2EQnagBVHxj7Rc38792cfmSTVbaizd9Y
	QB1SccpdSvPKR4XamwDZzphKLKKS9gK79WeEq6Z+dzWUdx3fXAhm0uw2LVQD/8CwBVEZO/FY/B5
	ARleXLl31OOHBKUAWkaKNF3pZFSF/wrjbLwwU5u3hmJS1JwbtKMhHtBPvg==
X-Received: by 2002:a53:ac89:0:b0:677:db69:cbd4 with SMTP id
 956f58d0204a3-677db69d93fmr750927d50.34.1791205237305; Mon, 05 Oct 2026
 06:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005102152.368-1-yogeshgaur.83@gmail.com> <7697abef-5a5b-4b8e-b0e9-7e58c60e6180@suse.com>
In-Reply-To: <7697abef-5a5b-4b8e-b0e9-7e58c60e6180@suse.com>
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Mon, 5 Oct 2026 18:30:27 +0530
X-Gm-Features: AclHuK-R0aZOLxh5q4bY_s7RHF4fakDjS8KjJJYk-acAFYuXRYJLyV3ne55zR84
Message-ID: <CAG6enPwtZpUh4eky8q-S5Nr-QKEzx+E+4L=S-UizF_NsKvozzQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mtrr: allocate the cache map before taking mtrr_mutex
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	syzbot+342762971f666337474e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 5:55=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
>
> On 05.10.26 12:21, Yogesh Gaur wrote:
> > mtrr_copy_map() does a GFP_KERNEL allocation with mtrr_mutex held.
> > It runs once at boot from mtrr_init_finalize(), but lockdep keeps
> > the mtrr_mutex -> fs_reclaim dependency it records there for the
> > life of the system. Once another path gives lockdep the rest of a
> > cycle back to a lock held around mtrr_mutex, the next MTRR ioctl
> > reports a circular dependency. syzbot found this through nbd, which
> > takes cpu_hotplug_lock (via sk_set_memalloc() -> static_key_slow_inc())
> > under its tx_lock, while mtrr_del_page() takes mtrr_mutex under
> > cpu_hotplug_lock:
> >
> >    WARNING: possible circular locking dependency detected
> >    syz.9.5848/21744 is trying to acquire lock:
> >     (mtrr_mutex), at: mtrr_del_page arch/x86/kernel/cpu/mtrr/mtrr.c:408
> >    but task is already holding lock:
> >     (cpu_hotplug_lock), at: mtrr_del_page arch/x86/kernel/cpu/mtrr/mtrr=
.c:407
> >    -> #1 (fs_reclaim):
> >           fs_reclaim_acquire
> >           might_alloc
> >           slab_pre_alloc_hook
> >           __kmalloc_noprof
> >           mtrr_copy_map arch/x86/kernel/cpu/mtrr/generic.c:413
> >           mtrr_init_finalize arch/x86/kernel/cpu/mtrr/mtrr.c:618
> >    Chain exists of:
> >      mtrr_mutex --> &nsock->tx_lock --> cpu_hotplug_lock
> >
> > The allocation does not need the mutex; only publishing the new map
> > does. Allocate first and take mtrr_mutex just to copy the boot-time
> > entries and switch cache_map over. On allocation failure cache_map is
> > now set to NULL explicitly rather than by the failed assignment, so
> > the behaviour is unchanged and cache_map still never points at the
> > __initdata array after init.
> >
> > Fixes: 061b984aab58 ("x86/mtrr: Construct a memory map with cache modes=
")
> > Reported-by: syzbot+342762971f666337474e@syzkaller.appspotmail.com
> > Assisted-by: LLM
> > Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
> > ---
> > Built with W=3D1 only. syzbot has no reproducer for this report, so the
> > fix has not been runtime-tested.
> >
> >   arch/x86/kernel/cpu/mtrr/generic.c | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/m=
trr/generic.c
> > index 67cf69f24b00..430bc9dd6f20 100644
> > --- a/arch/x86/kernel/cpu/mtrr/generic.c
> > +++ b/arch/x86/kernel/cpu/mtrr/generic.c
> > @@ -402,20 +402,25 @@ void __init mtrr_build_map(void)
> >   void __init mtrr_copy_map(void)
> >   {
> >       unsigned int new_size =3D get_cache_map_size();
> > +     struct cache_map *new_map;
> >
> >       if (!mtrr_state.enabled || !new_size) {
> >               cache_map =3D NULL;
> >               return;
> >       }
> >
> > +     /* Allocate before taking mtrr_mutex, the allocation may reclaim.=
 */
> > +     new_map =3D kzalloc_objs(*new_map, new_size);
> > +
> >       mutex_lock(&mtrr_mutex);
> >
> > -     cache_map =3D kzalloc_objs(*cache_map, new_size);
>
> Having here:
>
> +       cache_map =3D new_map;
>
> would avoid all the code churn below.
>
Thanks for review. Would remove in v2.

Regards
Yogesh

> > -     if (cache_map) {
> > -             memmove(cache_map, init_cache_map,
> > -                     cache_map_n * sizeof(*cache_map));
> > +     if (new_map) {
> > +             memmove(new_map, init_cache_map,
> > +                     cache_map_n * sizeof(*new_map));
> > +             cache_map =3D new_map;
> >               cache_map_size =3D new_size;
> >       } else {
> > +             cache_map =3D NULL;
> >               mtrr_state.enabled =3D 0;
> >               pr_err("MTRRs disabled due to allocation failure for look=
up map.\n");
> >       }
>
>
> Juergen
