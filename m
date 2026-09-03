Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0597E3F661D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425393; cv=pass; b=SeQp13/1aB+SL9VTXT16vnl015tGgGVlLkN5GMlmpV55HMD1VIhcPOlZu5fhPV8tnXtfs1gKRtBcPupvIVT8hyWPn4F145mteAbOf/AdZt3tsMNnQG6rN2qfgJwy9o+leGHINvCJp9SkQT54SVbtXqzSdGCZYZPAa7YTKgIq0mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425393; c=relaxed/simple;
	bh=4xFBYRVlD8TkT/agYfvie0rzFIuWbVqQuTIjgw8eAwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6LuL1RNRK7jsQqI51fzO3nTRV+iNfXHSukOG3JZ28tECxKbkXWEzMOsN6eRXgMU7brjiQOBR9Bwwkwqb8SnzVgozR7DpwLj6JkGnlICgIdCHWPWnyCxn3yclp/2AkavhNX/S9uNF5N23tnQND/qQLjnrVhwvC23lEqwWzzMoMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HeH52Ugz; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HeH52Ugz"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so1853479e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788425385; cv=none;
        d=google.com; s=arc-20260327;
        b=R/p43QEEmSHvl0dnDNIakMw3Z48mRMlZTHOxwvCZbbBlj00kWMJkB9BpeiLck9v9c6
         djAciBB00mCyfABm/BLrVdfq1xdbswE0Qekwm+pQp320jEn72+gjjSIsR3IPNLItRNqF
         QqQbOYK/uSwAPXqx+1jcu73d8g4OY6vuqQaSzfg4Npewq2SbmW2xSlnJdI3GWmV8OYxz
         n/tIaIYf1mafs5sMtDVQzZgfvu15RG7Tx0+k1sWITm0LQr9QPEsTb//yltsWyMLzSv8V
         op+Ph1s5HC2KV4DfydPFtkOaAarFLv7utvclzvbkN3S2puSg5ZqwILAmdCY35FsutLP9
         Hy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8qupEJ+Oj3t/z5MM1UFl4HO0bzmR1UIRo0/61ehsCh8=;
        fh=RxJgW8j3h286IjXV9akOsAl+6ItX2cwQZT+aVrYZIeE=;
        b=XlAv8vLe6KIHt1Hjixjg8y/96pl23KLjb9f231FnX24AVPkFEV+c4PmMK4Z+SpSbg6
         em4y63+GKRiA4KIj6t6tR3BNjcNajqSjv6hRMeOy5X8eRDaoxOI+8Ket3uLAChoSml0P
         UxJPCmo4vggSqPRTqkV5oxS3eFALc++YUUVj8jdWeSeKv69174rqxYznRUOuRCrw8qWR
         oC7EEFvQRIZr+6BHloa7oa2gUkAkpvManOLnTVyTJLGwRZjnkQpPbiFQoeOh9d62h0q3
         lv9Wc3o3w1Ii/aW03R2ciN1Un69Web0z4JH/zjpgofZEhn0bP/nhO88FDeLuTQrQmIrJ
         wJ8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788425385; x=1789030185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qupEJ+Oj3t/z5MM1UFl4HO0bzmR1UIRo0/61ehsCh8=;
        b=HeH52UgzwLWhbVOZ+m4QoglqC0KFmb2H2zGxavEXCCroHhwk4cElC28HdC+z3wGeEM
         fCBjHp7sfOYjDcOScwM8JDDL23nbhCJS6+zMplLIsHmqL+wvUDaf8PaWK2+mlEJ2Sg6T
         +MuwzncNLcjiGK/gT6R99GgM2dzoo4zYuUB3I4jZZSQ+ZgBNyKMbLo0M6iG/gemHzZLg
         eSM7jwMxNCZ91khW49J4Od4jatRH1AQncXuQ1qADwTPYj7UtGMYz3tGLANH3erXXEDS7
         9C7Lw1Nv2xPZCAFoRY4e8pHzogVLCRqPqyLESaT4jI0eIOHMrQkn2aZm7+g3vE89XyGH
         ilyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425385; x=1789030185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qupEJ+Oj3t/z5MM1UFl4HO0bzmR1UIRo0/61ehsCh8=;
        b=TJomsd2CmlM+M5bAuRqUnvlI7q0n6NaY8zKyLtHzOJOoVW744N6YMeahih2XfYCuyP
         2fdgWazZLTQSqZGkJThjDg8t8pygnuxj0jZeTmxtBK7ClZtgJB+DC5lAqsahU8b0j+S+
         ve4xx5VdvumyQJVRFGEA7eaBeVKAFKFe3p6bz4n6UHg0LRuJtqR8QUMb7ezhMjhVA5P+
         U2G30d5B6xOw4fkooW0P4OBBmmejPVgGZBVZtqLyyUhfl/9m3HDThtBVLP98juqYx5F5
         Y0nLuWeEUXv4euLxRnrwhMvR1Nj7EfYmrxBkQ1L5T7Qc5RBFqm/bhPW3NNIbp1TOuLzZ
         kmZg==
X-Forwarded-Encrypted: i=1; AKwUvBwmFMKTjOzb4K4WSuIEEw0T9BKAzYqDolZ46hM0uX7qYH9oXC49Ou9F1lnrfUDAVoovgw/3k0jnYLWPTJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nD9fjQ8I4CNwNS+4WKJ9lb19heNztDkqXaUDp8xTd6hi5VVgp3
	2/28AVGQWvWZsahzMq/rF26+TnwHCba6CSRXbxeKyS/DXIxwaG4qWIHC9RRwZf1p1cc1x/gXHaC
	+6D7pyUr0/htNtFxD/G2+xc5jwUFwS995fQVORc1fTQ==
X-Gm-Gg: AYBFou0/KHmJ7pECbMK5lyC5whjGhjJz2/8Q1ZktIb/trHwn5HkfYtDZvNNTiTQA4cs
	yS6BxhEQTGf4L3oXXazye3aEA2bvlh3HZQsphwYMG6nu4ZEqFuRzUf4zcINpw5/VuFP2295kkJP
	FWRjWHKut7ehBu25NhnNxA2eiwK9zNiUcsVNwPVUXwS2qcBei5NAiC3fO2UoMyvHkiER7XqMv7k
	nwfCxU6cwrEZ3elLZs6fc6cj9alU81pOqC+WuEsbehKjaEaIPhm6dtzwVvxgTQ1GOnGcxsT0EoU
	EUFwqypPauP65ppXOVhYytATK+t4wpUESkPWW0yJ9yAZ7b/1xTl1tYiLfDfWeF81PgcStjyskfz
	rVw==
X-Received: by 2002:a05:6512:3052:b0:5b6:4b1:f8be with SMTP id
 2adb3069b0e04-5b6087ec2b0mr2784218e87.31.1788425385396; Thu, 03 Sep 2026
 01:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903041320.179965-1-atomlin@atomlin.com> <20260903041320.179965-3-atomlin@atomlin.com>
In-Reply-To: <20260903041320.179965-3-atomlin@atomlin.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 3 Sep 2026 10:49:34 +0200
X-Gm-Features: AcwNN1VGaaX3VQtIld06ROEx1uBk0jP3N4jeV01F_iY1UtWlPEZVGnuL3VgEq_U
Message-ID: <CAAofZF7rNbEZuiGJXyjn+wwtdF0Y9vDEo2hGhJak6CCkP8YB-g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tony.luck@intel.com, bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	frederic@kernel.org, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaron,

On Thu, Sep 3, 2026 at 6:13=E2=80=AFAM Aaron Tomlin <atomlin@atomlin.com> w=
rote:
>
> +++ b/arch/x86/kernel/cpu/mce/intel.c
> @@ -229,16 +229,17 @@ static u64 cmci_pick_threshold(u64 val, int *bios_z=
ero_thresh)
>   */
>  static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int=
 *bios_wrong_thresh)
>  {
> -       struct mca_storm_desc *storm =3D this_cpu_ptr(&storm_desc);
> -
>         val |=3D MCI_CTL2_CMCI_EN;
>         wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
>         rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
>
> -       /* If the enable bit did not stick, this bank should be polled. *=
/
> +       /*
> +        * If the enable bit did not stick, this bank does not support CM=
CI
> +        * and no corrected or UCNA errors will be reported on this bank
> +        * (SDM Vol 3B 18.5). No polling is needed.
> +        */
>         if (!(val & MCI_CTL2_CMCI_EN)) {
> -               WARN_ON(!test_bit(bank, this_cpu_ptr(mce_poll_banks)));
> -               storm->banks[bank].poll_only =3D true;
> +               __clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>                 return;
>         }

Not sure Sashiko's review it makes sense but to me it could make sense [1].
In short:

> cmci_storm_begin()
>    __set_bit(bank, this_cpu_ptr(mce_poll_banks));
> cmci_storm_end()
>    __clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>
> Since __clear_bit() and __set_bit() are non-atomic read-modify-write oper=
ations
> and softirqs run with hardirqs enabled, will the hardirq's modification b=
e
> overwritten and lost when the softirq resumes and writes back its value?

Sashiko's suggestion is to use the atomic versions, "clear_bit()" and
"set_bit()".

Thanks!

- [1] https://sashiko.dev/#/patchset/20260903041320.179965-1-atomlin%40atom=
lin.com

--=20

Marco Crivellari

SUSE Labs
