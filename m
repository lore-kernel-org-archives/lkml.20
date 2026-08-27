Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2562580F3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789494; cv=pass; b=EYC2vR67xQo+f+1OgIgxOfCePPZw0+gg4rajiWs4C0zkfyRX/A5DKFA8fOSOL2QIgTyuHfZBvqFXhzKpdkU2KBsKDo5HEhfpI7QUPwMVQqanfTiyJpPICDDGZz5ZRPmbThCko0cyu4kcXIzQFYPmuu+0o34YrdKrcYIwnLwVcxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789494; c=relaxed/simple;
	bh=U0ZVJdy2xlpPXTTE9DVaFvSQYGlWfk/i2EZPp5O3aR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qymk75/hEEUvRSSZKFPx/DhzGxu1QgqDBiBqHe3hCuZ4tR0U9+IO5EggmDShtuAGj8gxXyTVSCoRj/uquypncUj7O43alGKE1vI/2eSLvaSZg73Cz/LlxdnMLBMMGG7gkrbaqkqA08a1ozoigLp4SH97lZ3E20EqTXJojyHzuNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DQ4RaDox; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DQ4RaDox"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c10ed63c0so62621cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787789492; cv=none;
        d=google.com; s=arc-20260327;
        b=ntKZ9Nq1mFEGSOuNVJLdEfoRZj4xz61W0KEIGf0fxUUFsCYNdtZnpWrwnXVfOyGY1n
         TmBOC8TeWN0r0NUGESNdJw36Zy9USOKoLYqStZM5qqPGm2f24os16luaRIWVVlwGqrPd
         JxExbenYrZo+dRPlyf0mm9+h0TjkGiX1sb/s+dJ9Xdc0bCsisVj8g3l2d5+8mG4WMyyh
         upjcwWgpL4kp38uWJ8TRZz2TkdNI0yBlS23M0nopN1TQr4jyNCJXZSZ3pfRllPiFtBAH
         gVKipmlIf1GkCAR8xsZMHXUhrpAKPgZ2NV7cQt4sNW1YTtOyI0LmnEiiFUFGSx7ms0fb
         3wwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5/sDIPJWVvy4M9xDKoTn87D0a2lykeAfDHJvuULa0K8=;
        fh=eK1ZXod82PfqX9RXhj4NDU93T2+/v8tZXFSr7C1P5TQ=;
        b=pRbX67dg1WI9xs7Hgcg04JhdSFR7+KYk3rewpoPxVedi/V9JjssRhZsvflqMak7LNP
         ufe4kKGFkYkgtiiJo7TMfRp7tAz2BDhdDIc25eqT+aB8BbCArMZ1Cfu9OpFMAZPSvg43
         Zz6W26rW9HPajQCx9OSu+W1m6JO7GMmoSeNtSbZIeIGS2bqorWmNkYotSUdpwrb5M2BQ
         KrcpLDBfBGQpNIBikBns2ZV1/eVEV3dmhmy0fHK1NziVNSby0EpGdC26I8gs7mVi9gFw
         yPJ/m6uEDlP89/ImZdLilK1vfdHRtRq0gT2nGwFGXjg+pc87Wm354/LyIBqvdhO2fuT1
         ozxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787789492; x=1788394292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/sDIPJWVvy4M9xDKoTn87D0a2lykeAfDHJvuULa0K8=;
        b=DQ4RaDoxwPXoleY2/DBK5nA5egrX5/rVO6rCLgHpgLh7OQpjXL1R1BPPMKMSefrtg3
         VZAI3oRnBNh+K45mJN3dzORZ6ac8QCknlVyB0wcX0IMGC0L2MnIbzlmKKPKvD0/phVvK
         +cq5saE9yqb6gzglLrOlrO6zfn+EgzavCDGkhNB2GRbnp0HYz5CCjclJiX3QTIKTLJ5o
         xoBQR7Kve3l5QX39NQhf1chGNzc1o4qEJV7OlRp930P77qHt91by4bn95+soYrmb0pgg
         /oC/vmBsWkCzr5T3nuliA3iI4+Enqy+h+p/7J9In04Uyq3c13ckCmyPBCbiKXb4xBdYq
         ogHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789492; x=1788394292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/sDIPJWVvy4M9xDKoTn87D0a2lykeAfDHJvuULa0K8=;
        b=NUMDnAZFt9p2wEeIg/3CON1KayuzhTk+vMcPRnzdF4sfy8gj91y1FnyxaqVBwtNP9W
         YollJXE/AEIpJtlclmt23u2l0ZK682M98Fq2CNmU/BTjmbFxUdz1xlc04ozKYORYpYwP
         EIvZYDMzbx/NgLodMiYiSHNM4BOX+r3kUVfkpQWTvFLpyrdTqWx3/Z480lPNuF+WYYl8
         eIAKGfVysjAuG31BxOSXTx/4ZAgeqGaZCLmtkqNs4RE5FNkmvrvVic9NPF8TUHcseNVM
         EyJ+8YHbwNZaf0I7BSOo4MuvqEgrU0VBUYKkRtn3XNhMd3+r4lOoBVmhFgPdGqxPjVgJ
         iZKg==
X-Forwarded-Encrypted: i=1; AHgh+RrST9zeozLEPZcJkRzsgq2KlwNgyCCitrlv9ZmzRDUhYq7bpJwUX1hG+a9MLPMAesQsS9bkJWmgBAxEC+g=@vger.kernel.org
X-Gm-Message-State: AFuF++m0jnOICCh3u0w9GY0VMQSpyJnyLRewhhdLGKrFbK6P16ha2Bz+
	/nlxf3WJQ4/j1sCqOaQ4EkzIk5gf9VK6JLmUAQLfrwYvPDnmfOGsT4Vk5M70ptyZMR4HSK8JSwC
	hSNNYGR1g24AAcO6xB7n8inRb4lw1MfVJWJM+KWFd
X-Gm-Gg: AR+sD12aq8a5RLHXIQ6Nm0uicuWoAssb1+ACgnusvpDlfdxhJZVjudBK2kAoVSkfJdU
	oe8P+sxm6FcOZla4l8saGwM1qxIeNPKLT1IB/rbqR/eKI5qMRChAvAb0M38R0SZoaYYs7wxOxPT
	1E+X7/dWsorOOvnQ5J+OWmyqKCqcrThzbwnMHdKrnnWRewE7AVQzNQTgfczDqjuXJc/rWjrqf21
	OkX+AAq4SRV7kqaU8Rq5kRF1gpwwIZhXnrZFilurAD4TiFeRib/u+0iVr0DzSyrW83kjTsahHBf
	fHbbq7aUeiemxiWaYCFJqJeFabx5r7W4ShQbHvh16ag=
X-Received: by 2002:a05:622a:155:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-52fa36b4dedmr7284201cf.14.1787789491416; Wed, 26 Aug 2026
 17:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824014736.35026-1-hao.ge@linux.dev> <cd6b372d-cc68-445d-bcae-6cfc83d9e4db@suse.com>
In-Reply-To: <cd6b372d-cc68-445d-bcae-6cfc83d9e4db@suse.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 26 Aug 2026 17:11:19 -0700
X-Gm-Features: AcwNN1VDomkisfTnAtHt4KtA-jTwfLuIMQLzObQetyS450qtuGh4E69anVaRXCw
Message-ID: <CAJuCfpEzkuYBY2dBtUrR0pquajr_2LV3N=Ti6xTZB6MqhqAx8g@mail.gmail.com>
Subject: Re: [PATCH] module: fix lost error code from codetag_load_module()
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Hao Ge <hao.ge@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 2:24=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 8/24/26 3:47 AM, Hao Ge wrote:
> > If codetag_load_module() fails, err is never set and load_module()
> > returns 0 after the module has been torn down.
> >
> > Fixes: 044d2aee6c57 ("alloc_tag: handle module codetag load errors as m=
odule load failures")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  kernel/module/main.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index 46dd8d25a605..afb810f0154c 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -3568,7 +3568,8 @@ static int load_module(struct load_info *info, co=
nst char __user *uargs,
> >                       goto sysfs_cleanup;
> >       }
> >
> > -     if (codetag_load_module(mod))
> > +     err =3D codetag_load_module(mod);
> > +     if (err)
> >               goto sysfs_cleanup;
> >
> >       /* Get rid of temporary copy. */
>
> This looks ok to me but there appears another bug related to this code
> that would be good to fix at the same time. If the module is
> a livepatch, the preceding call to copy_module_elf() allocates
> mod->klp_info. However, if codetag_load_module() fails, the code doesn't
> free it.

Ah, I see. Nice catch!

>
> I think we want something like this (not tested):

Yep, that looks like the right fix to me. Thanks!

>
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index d0e1e0bd2ad0..c1b34dc1e89a 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -3581,8 +3581,9 @@ static int load_module(struct load_info *info, cons=
t char __user *uargs,
>                         goto sysfs_cleanup;
>         }
>
> -       if (codetag_load_module(mod))
> -               goto sysfs_cleanup;
> +       err =3D codetag_load_module(mod);
> +       if (err)
> +               goto livepatch_cleanup;
>
>         /* Get rid of temporary copy. */
>         free_copy(info, flags);
> @@ -3592,6 +3593,9 @@ static int load_module(struct load_info *info, cons=
t char __user *uargs,
>
>         return do_init_module(mod);
>
> + livepatch_cleanup:
> +       if (is_livepatch_module(mod))
> +               free_module_elf(mod);
>   sysfs_cleanup:
>         mod_sysfs_teardown(mod);
>   coming_cleanup:
>
> --
> Thanks,
> Petr
