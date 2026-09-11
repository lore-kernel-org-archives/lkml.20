Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0944AB1D3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154661; cv=pass; b=t5PDqs+HWHNaOUN5bERq3Mo+bq+BTEPXUiM3A0gYTuilWxyBjuDdotBqCbVebXze8hZRs2ZWFDUDWI8MR8K9J8Cvzx+EXfU7M4in5VRjP7yZp50pMLt6rpriXXsEq2rEHEqKDP41qWADl7w5g2+rqLbFindniSu/tXT+GGbbUuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154661; c=relaxed/simple;
	bh=Fdw+r3dysTF3WjqXT9axUm7jMijJrnIOkKcC5AZjbbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TK+mX+mTgxyjluazsURY0oH7o5pq+J46lCjxGXT6vYGdT1bgRBGyAY/p60IKHVgavuyj2ST4GJoLz9Vw2qs2jyAHNC9C5Wz+QLAW43fTEPwRTWIqO5ouXwUpiLkIn/85v5K/Iw8plXOg3ERUyydvKXNFDB5sZqizHI5QNVwd3yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RsYd81pk; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RsYd81pk"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98089686ee7so885040241.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789154656; cv=none;
        d=google.com; s=arc-20260327;
        b=Mvj2aLl4BEy9LQPS71ZP3OlJgyB7aCZTWN/qSvFa25YI7vDZzJ9bKzF7k95YljSr1D
         ulFHqYJkDq+ln7prdoEEIx1vUqjCoTwy9re6/bfGHY7nvc0RBVqnVWUt4CxwyIluP/QI
         F172+8aqOGaSzQAGQZbjCQJnGl6Lv0NGXrDcpDlO00o4mO3UrCuRb1RsL5VYx4T0NRIG
         j8PmaeacAM7PPvJhVLXVSxu9uhkoqgjBAeI17fdJiJ5CJ7bwRpwKsfUBcRgY1pItBgat
         u4KAKy894mff16K6sHIQa4bZzZPmEG9uIeHwW5KTgASuWtwm20pr4ZeYNjTVnndlgdAK
         wBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D9lUlaXsCvPiCPFMAfPhKXQQhy684K2H2SGMPGJQm6U=;
        fh=+chxwKH5qQ2rA8d9KS2YlnsYXOkGpgyTFtwL2Qb9a18=;
        b=LT3JqTrPPTsMxoYSsoGDslP8QO7lNHwT65zQZf5qc+OfeuIvAELvP/f6bnjHaMcTV4
         tarbVZqVhxiQ+VzwcCdYrgbJPOkXepdtaFjuinR35qG8G94LPVhGhxscUOoJjKvafc91
         9+WPDtmY+/1tSnYhkvoZT5ebmdLHJoyvknzOz+6nq6cMR6Y7o5WsETtz/HHxwuIQjPZB
         A+jxosVMtSK/bAlVrS7yVddsFNK2jpUSicCtPR35LEuDttWs5Tlhpf4fSIyfCp45ODtl
         gwkXunIhF+8X/0T0YIR5BFR2tAp3ZTLNHM8hJkfIsg1MF/eo6rasoMz5SROZUNoh2/VP
         AG1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789154656; x=1789759456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D9lUlaXsCvPiCPFMAfPhKXQQhy684K2H2SGMPGJQm6U=;
        b=RsYd81pkaCgYB9Id3gSQZ0G0BvbeNFwBmHC5bVT6QeNO/b5GwQ+eD731lWHQ1L/rpu
         Ic+G7xMgD5bnY+TIsnxmcPEBP3aFwzAC2XYC+okz5B0uI40OT8TjpzHf5P3OlYM3pF30
         zaJDkyUKGF71c26gmTAIZqdL2EMe+Sf1p5IrJzKuA849hOv5gvEtcJfKRqlCz1lmfE3I
         hSFoiKy/Ih69ujiB4RFZysj1XTvMsuWyCbYLA0ei3kqSHUlw25dtk/uYO/6sICj/V7oW
         M/A8BHYbh4gP/ml44cnDsCt3Q6/sd7TtGvhMOwA1auPWwv48kkr3HtsSvGV2IxIRVKyl
         NvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154656; x=1789759456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D9lUlaXsCvPiCPFMAfPhKXQQhy684K2H2SGMPGJQm6U=;
        b=FwZ083GL/39ESqogrUcU/psK9UKI0ma1mQqxkBLRvnZXZmUmG34LvGpog7vD0rEJOy
         Jn4BCvPFb9g14NzagoMLjOO/5RZu88SamAiXnraM8skL1YX1uHHUdWUeD43mP/Xo+OOu
         /BMJeHXgS4FldKQO4INRhLRTWSdnNriM7Bakq1fHysarpiKJX2ykXY+aaZc7dn1j7and
         Z0x19rMyaTQU8ELqCEW2jvGg/ofn90xAebQz/FbhnPEPhOjOk9Ww2vvje2p2VK6csops
         uJZgIlk6YHYxV0mcyXLkSKXPTH1EoJwAwtu/W/WPdRkc+fqro6w4z9qhVcEQmkes3ijP
         5TyA==
X-Forwarded-Encrypted: i=1; AKwUvBzrpgtlh9WW2GrZn6IX+EyoWvdcpDXTa/UAzwST55+oP/EQ7tQcsKlvYfyMJyiFpjIqWNdPohv/255aEP4=@vger.kernel.org
X-Gm-Message-State: AFuF++k0fwBIw2uGYyg0KB/r2IiwDexRG6Ytrozp/25wckN1g47r3ZXH
	hxsldBZkjtguOkjSPgn9+d6CI00VfcF0bkC9n9wGyGSEhOIDDWwOqhCgC7oSyHzY6GrApT6QA7z
	10zcDMxU2Ns3si6UrUO2RcmxWvMYtaY6iCVNtszg=
X-Gm-Gg: AYBFou3/IxUAkAAUmyGAtJkECSemaePbQSt6s45WNrf86Iw3D6GLLQ8BEbGyVYvxSWI
	+KAgojVdHGSUfw0n8DtOf3BneAmVo49IBzpciwfZsuxkinaX0VkfmTGbkcF2+DJI63Tz76baedl
	gm/1mPvKAW1W5MkjshsDl46XjvZq8D15hYivEHly8ULHcDAApcT50y58nLbctd+2vK0g7b2EOcn
	xgoxwBcqJ9R38TwbrS1Ij/Q9xRZ8L8Z47hXj0AJLkmChGruBW+LtfCf5ZuxRwf6rLf+htnSCL7F
	Mgleq43naqn+TrUBHdBvqFAmnvC8X3DuTeVTnEXU5YseWXnhL9qBqsuS6EnPTAgXQpNEyMpELok
	M92nOo7k3CsxgI+7q5n4D
X-Received: by 2002:a05:6102:55d3:b0:785:eb33:87aa with SMTP id
 ada2fe7eead31-792a7c0cf6dmr6291546137.5.1789154650910; Fri, 11 Sep 2026
 12:24:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-deftig-geprahlt-gesehen-16310bdf51f5@brauner> <20260911-zyklisch-stuhl-zweit-d61b18a17838@brauner>
In-Reply-To: <20260911-zyklisch-stuhl-zweit-d61b18a17838@brauner>
From: Bill Wendling <morbo@google.com>
Date: Fri, 11 Sep 2026 12:23:54 -0700
X-Gm-Features: AcwNN1XCuxA56YE74BOrs6AnS18Rv8BxhySba1P_h50I4QrnUiuUdff7p6DrTHg
Message-ID: <CAGG=3QUiRinW3B+-zOd2sPdHbu9=Kt+QdE0mQHcK4t06qC6ckA@mail.gmail.com>
Subject: Re: [PATCH 2/2] userns: declare the KUnit-visible helpers whenever
 KUnit is enabled
To: Christian Brauner <brauner@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Anand Moon <linux.amoon@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	kernel test robot <lkp@intel.com>, codemender-patching+linux@google.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:59=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> VISIBLE_IF_KUNIT drops the static qualifier whenever CONFIG_KUNIT is
> enabled but the prototypes for the two helpers it exposes are only
> declared when CONFIG_USER_NS_MAP_KUNIT_TEST is set.
>
>   kernel/user_namespace.c:787:22: warning: no previous prototype for 'ins=
ert_extent' [-Wmissing-prototypes]
>   kernel/user_namespace.c:860:22: warning: no previous prototype for 'sor=
t_idmaps' [-Wmissing-prototypes]
>
> Guard the declarations on CONFIG_KUNIT so they match the definitions.
>
> Fixes: f6f1a2496ba5 ("userns: Add KUnit test suite for uid_gid_map")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609111048.yhHILE11-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202609111305.ta3EOA2x-lkp@i=
ntel.com/
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Feel free to add:

Reviewed-by: Bill Wendling <morbo@google.com>

-bw

> ---
>  include/linux/user_namespace.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/user_namespace.h b/include/linux/user_namespac=
e.h
> index 637cd7e91a45..91232053775d 100644
> --- a/include/linux/user_namespace.h
> +++ b/include/linux/user_namespace.h
> @@ -208,11 +208,11 @@ extern bool in_userns(const struct user_namespace *=
ancestor,
>  extern bool current_in_userns(const struct user_namespace *target_ns);
>  struct ns_common *ns_get_owner(struct ns_common *ns);
>
> -#if IS_ENABLED(CONFIG_USER_NS_MAP_KUNIT_TEST)
> +#if IS_ENABLED(CONFIG_KUNIT)
>  extern int uid_gid_map_insert_extent(struct uid_gid_map *map,
>                                      struct uid_gid_extent *extent);
>  extern int uid_gid_map_sort(struct uid_gid_map *map);
> -#endif /* CONFIG_USER_NS_MAP_KUNIT_TEST */
> +#endif /* CONFIG_KUNIT */
>
>  #else
>
> --
> 2.53.0
>
