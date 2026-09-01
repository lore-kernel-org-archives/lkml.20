Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C60439015
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232793; cv=pass; b=mhUS0k+noc7k0ilChOHf5EQNGnINtF+nbTV/TPPNlukenVJCdy0oTcw+baI3OvBDX6Pv71pFZHIe+Z6ecmsXvKrn74Axgg6iD4TmplIgIacprSU9iJRVwDbLMMtTixA9CTFY13awl2J85ktcgYXNOwluR6acHrZEsKgZTfEzhXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232793; c=relaxed/simple;
	bh=Tw92wCgtX64w4RYTjVLKytcgWHeN5opE2HHm0QpdkRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVu9xRBg3MBOC2rJv8ep8bbeQFp6ZMI8oDQRUdd3ZwI4I5heWYU//Dg12Uc2XfKJOplhttMQoK+StgH82xfiWufahmBQngDbgZkpfSQPfrJ/3iRIFlYW07fiIGp5AmHNtmTUBGLtzBOeDmQ92vOOM495o7zl6/p0XacyZ9aH6uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPB2EHR+; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPB2EHR+"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66e63c2c9e1so692703d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788232791; cv=none;
        d=google.com; s=arc-20260327;
        b=mwtoWtqL8ybai6njquesv/xa/DlzkLQsiyMj8obW7EX/1Dkqw1OpzhljsBqIEIWP/P
         5PLJqMHlwWV0NHCOo/tW+8WmVEWwt/Ysc7Vt5t3rn8gr4aWQ8HhK2lR6rjCpbOUYdBWL
         wWr9EYDX5B+suVa0E8440yhoRb0mwz+liZy4LudkVQ4Rp8t/klavsSo5feTFtX7Pb1Ns
         8a4Rx8gC95+fiSe0lFBviHy4yPTSorMnPwtc9zRHobt9hUQ3FlwLHrRZn+XavZihmXpn
         LEuTn80dDTGyWKego79/b+rfUoIh6PPwKHiI91qfaMJi0n4tyJo4nMZpQ7GzyEOJ/3hX
         9pAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxfDC7P3hjzDwZfMMU4ZVm/zbG7/WqTWINl4wOrB0SA=;
        fh=zGY0nCl+3v1dIGtRN0QupsDHTEMn5WhWNIHY+9mok80=;
        b=Nw3+32t8hoX6uRPXpEnWJLKBfS/qoYlIV5CEl1lNFZ4P4hCsP0uzIXaAmc7siksUO+
         hL6vrmoPzsuXZvYdpkMx5B1C9KwjlBKqU6Uw9gk2UKfZYHQny/u8QtBA4QR/qN8u7cfm
         qpzmp+y+K/rCrYV3i3GqoVbOsDzWQALSxlfFl0xrp/ejYjMkmfsQalHmhLX8kKgOD4dc
         12ryGCZGHEtTD/CYYP4Y6h+ffkPBPEMTlOPmeJivGxEMz+a/m9p40sZlK+ps/HHz1c6y
         KHQb0PxF1E1C4M93R8uqKn5pA2jeKhfqZX40vwdFODdFkniZbfM8sgPL/KmmO4B7WMVj
         6/UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788232791; x=1788837591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uxfDC7P3hjzDwZfMMU4ZVm/zbG7/WqTWINl4wOrB0SA=;
        b=lPB2EHR+6igVUVdCc+ca0JhuA+VEPlYznluHBt0xJL+bvXkmja7ZXtt/XstECP/MHP
         1Ghu/9LSqj650L50NVqs8Gx7Bx4EkPw+8zLNKniSQ63QrlVchaglBkHNC4CHCMBTgy6D
         OmfkiSxAvSWIMzF3r5NLVanLlv2NVZGtq4uywe8USDaP6DRh4OM/hpuT0XybtI72p1Hs
         EUJWGqmmWuuSIc+F/WfmltcKxzr3WKeqzq/kqyRFeoiT1oZzvFafm1zqjyGn+HGmP+ML
         T6m1I72hjvSbmVs5+VSv1VFXDV+sfthcB1/0aKkiygCqtQgp+t/xe+2nQcHFI4Of/Pwz
         MlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788232791; x=1788837591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxfDC7P3hjzDwZfMMU4ZVm/zbG7/WqTWINl4wOrB0SA=;
        b=fm9hlyLbxY4vPyHZRX+JDDmbFyIGDacyc7T9BvItrpDbPL3LoHVifjfJWglR5soBLd
         51ml9lhRqfMKD1Bu8zPwpxPQcm1s+acndEmGYfCBPv5SQZAyS/e4ePTyzbYgQiyZ3fP5
         6yfWD8cPIe5go6pbD8EvMMmMT+kr6IW2YUZ5+F+RKTh9DAVNbWkOm0RWi9V7PkSLVVsp
         d+0fpZieB5hq+1zham0PleL0bx9jSl2vbXUz7+dUIY//DeHZ+Qs8fwAwf579yisRcr/G
         eJQxTSc7eVmlf2pf+wlBStxQhMPaLCl1vVl9+7xG7J+AybqCGKXGlc5SNrKDw9IoxmK6
         uQ1w==
X-Forwarded-Encrypted: i=1; AKwUvByZYi/e7uhC2JNpZrt5DWoKjqkP72S7B2xbAfjk6G8bS6HtuQ3s+D12dZ9KjAhfye61vi2ASjjCupxKJg8=@vger.kernel.org
X-Gm-Message-State: AFuF++ljAYRUfaC0Hnelxkeu2u8Dz97jnIkzJZ8kNf2MQYj6YvpeMjug
	dO37PhfoLzIzkfsqFfkHitbt8WiH+aFBCRimjosWICZ+belQsbwIO34DT7JCWmD4b98SlKVSH1W
	n/qFtzQKSshZWQhurTMcug3ttKKhziss=
X-Gm-Gg: AYBFou04vkiwgd6rrA3wyol98tmXcTIPKM/EYB+UWgoAG1fTNUSsuP1yhQvC7q2V7A4
	6utrDuZW0sCF1baMDuj3wtffd58BFqzCApUN/RQasOVytBdxnPUd39oyUtztJCP0lPo7XJ2ELyg
	AJ0yrjqiAvsHDq0bDrMDqUqWtqVfAMTSAnaNE9y7u3Jp7Mrsx16nU94X3nS9mMeYie7E4+HrNLy
	pK51cLZVWW9gLFs206vcH2kGzMSb6ZAEUbOSFeHFgcw2D0uoZq43kcr2IZzz+AMKyb/Ghi+G4b9
	PlbSORE74sRTl//rgeitWdUePJQlXvuPPcswhf2/a8AlR5RDFPEegdUEnYIkG36BicNyLYWHInQ
	SL2B3Izwy7M5HHml3hofhz//gRBnr0PYaZw==
X-Received: by 2002:a05:690e:419c:b0:668:43b7:acd with SMTP id
 956f58d0204a3-66f8a41a3c0mr853872d50.8.1788232790590; Mon, 31 Aug 2026
 20:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831092305.42062-1-tasos.papagiannnis@gmail.com> <20260831092305.42062-4-tasos.papagiannnis@gmail.com>
In-Reply-To: <20260831092305.42062-4-tasos.papagiannnis@gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 1 Sep 2026 11:19:45 +0800
X-Gm-Features: AcwNN1UzotP2OBEays5eiLg4A4d5qM5oPgXZ3iL75O9H0DWfs8MThC678FLuhRo
Message-ID: <CABFUUZFToRDtvewhqHOWjE1h+7o-cmb1D-z3Pe4oXTVXzt6Z_A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/7] exec: Clear bprm->mm before dropping its reference
To: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	kpsingh@kernel.org, matt@bobrowski.net, song@kernel.org, 
	utilityemal77@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:52=E2=80=AFPM Anastasios Papagiannis
<tasos.papagiannnis@gmail.com> wrote:
>
> Once mmput() drops the final reference to bprm->mm, the pointer must no
> longer remain accessible through struct linux_binprm.
>
> The successful exec path and the bprm initialization error path already
> clear bprm->mm when ownership is transferred or released. Do the same in
> free_bprm() before calling mmput().
>
> This is required for eBPF kfuncs where bprm->mm is either NULL or points
> to a live mm_struct to ensure safe access.
>
> Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
> ---
>  fs/exec.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/fs/exec.c b/fs/exec.c
> index a14f28b15607..4b4d8f0627a7 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -1453,9 +1453,12 @@ void bprm_drop_loader(struct linux_binprm *bprm)
>
>  static void free_bprm(struct linux_binprm *bprm)
>  {
> -       if (bprm->mm) {
> +       struct mm_struct *mm =3D bprm->mm;
> +
> +       if (mm) {
>                 acct_arg_size(bprm, 0);
> -               mmput(bprm->mm);
> +               bprm->mm =3D NULL;
> +               mmput(mm);
>         }
>         if (bprm->user_ns)
>                 put_user_ns(bprm->user_ns);
> --
> 2.55.0
>
>
Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>
