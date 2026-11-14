Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794617149;
	b=4onA+qFf9jCFsMzHw42BMibq1zNUc4zKEZl85ybvLFfjZ9tKxLT5eQ5JmEVLeZo+FQeb
	 dSFkE9cIk+LLJispfObEXkcpINVsoKwC3IYdbfJuQ7ir7ojNqlymXkauumJ4ijX9MPPbj
	 zgQyT0b7NfVZhEkilaLUjXnNpcuY8osSfN841uSXGpHwcIHEGYxL5XlTH1sggmwZFbp2F
	 n/RyTLDQE4eOAk5AARO0G5LA6OYkSK8VlfiGVjMEeuFfdxzeFjrlKJFfiIsG5v2UejGR6
	 4LxhBq5z8Bz23YP7/08ClDJD+ZHqbkUw63po1/+RtLg3b3XGUwTLH7hhDGbGqdLf0CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RncxFXadV++AJd3yarKiBmLGzKxXKrhpwpqz68JunX0=;
	b=XRQAqZcvHPJsi7bLO+Wy0OxwAun6f0Mr4jJO0wnkR35F6hJbfF72i4I4Q/U2nJzeu/1N
	 ijGGMcLXAljGUrwLnl+G3TNPeSKQ5jkSqBq81HWkwvjfV8Y4SfE6slCLV1uCV5hYnYzvi
	 sYFZluyAaBcyDsPBth1Zk4Ape5oz8bkG14zD21J7pRc4BQpKOwrK83WEB6qSFZeTeIZbF
	 b4/aWgonZk5e3yGXHoYXXbibKXondgQjuS/02RmWMoYRJB4m3zYmMg451BQ8gVHrbnOW3
	 gyVDrUqZdK+t4Toq93snQ2GYC9KgIfp5ftfTd4PNGWLna9nvW1uMM7A+kPPhHo3JEdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lQAYO9Hg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A538606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A538606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lQAYO9Hg
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso2862240a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794617145; cv=none;
        d=google.com; s=arc-20260327;
        b=Nxae33szi0HhgyWgqeeugsXJ/JjsgV1x6A0G770hNZokCTpVHj745n22Q1zNkt9APV
         DWrCmpnsakoofch3BU+Ot5XSC7TkFed2Y8Ol/FVbJvz++bPD9OdRVr8LXg9p+Wzz/Qz2
         oLUTw0zvLG1HeVbsYiigWyM1SyIau8CAEot1aiomeX/ae6RaU/fH9XxkDKQFe8MNM3GJ
         ndBQTwgN92kh29hZIJsKkH15MayVhXt9O6qTxc1+f2Sllm62KPsVkQI3uhSeflfuOhUt
         OzwFfulBGWizFkv6th1EFaJzz1+CdGRxL5FEFk/BbibAHntJET57NHGbWkSj26VZdsQH
         VY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RncxFXadV++AJd3yarKiBmLGzKxXKrhpwpqz68JunX0=;
        fh=qVMTuHrRQF0MBNVHgjU2MIs6zKC5Cp7Uh9VZwGk+9m4=;
        b=S/FIGwkWNYkPhjBHEqFIThV5w5KArQy4GANzJqb4QGdvnmVTuUfgBsKfvzXRv3P/a8
         iZ+9Ie3Dw7LMtk9f8IJCdoEFfSa5swbNFyEEhNlUuiwnYrm1i0vCgiqdsYuc3WkCEsN1
         mJJl/92OFpuQMRv7FtnPkELZ9t5LTwuE6zEXI4Tc8SMxKndM39JKgH3zr5MtzMUlHa/l
         OYxNroJxJvvkGuALS5jhL1XtlFvx5AAXFbh+a8vqlQD+xjFUGusyvsigPO6Q56p/RoRa
         2uJkJnbf7zKyQ5VneEayKRuhX8OnP+9iIt+OoW9fmyRe/1Cka91qHORR7N4O0SG7pPbS
         nuSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794617145; x=1795221945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RncxFXadV++AJd3yarKiBmLGzKxXKrhpwpqz68JunX0=;
        b=lQAYO9HgW+rTGDKMEQ6/0bEURVnvteVYM9OOX2PoBG7krvG2mHIGTr31EpVhv/4AUO
         AHltLzetwCXhzVdbHk7aHBV41fdIGkt6pDoNsjh85g9n9WVGdsnshrAtC0kMikyDtxmW
         UXC+HqhbPirWciUskJ6VwFxO6wd/G1xYkkAAMpn7eBIgnWvz1dmj0p4teEmYRJVf8BZv
         ArGHggwmv+j5y4H/cSwrx77xJUj4AY7v6KgiR+TKaDrVV2Ix2S8zRRm9XuhsVj4ksnw+
         0t7PPQy8ZqWkYOJgW1og8UhfxCAKGMtvo3VrwM+UxcwFWgRt+tlVbAcpuUhz2cc2/nwq
         YN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617145; x=1795221945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RncxFXadV++AJd3yarKiBmLGzKxXKrhpwpqz68JunX0=;
        b=Mk89ZzIOB3b10m/BYvZ3OdVkV/2h9wKxTjWtnW1BHSay2NFVNT35uwk4gmE6VbJxJU
         0ZVM+AfHOn8g1jeUJySeq2VsNYN7J4sc9v3C6l4jMET2zLTC3+ZlaRnf4l/LzGV1yqnS
         83tWIDAnacqINadTjaOJCdtMnLVE73Zg0Od7bISLRWfbwj2WuVBWvbOjc2UDKegURETm
         KRiHpT0sFCmLy51mo1aeYbrntB6dGFh+EDVH3CHIxRYfT/Zj+4XJylSSkUR2ky7prBnO
         QtleAqQBiYbRrMc+AeOqwcU2ZEiqsjBT5j08WBJJKPA4oNRPrBs5Um+Gai+fg1aQ+zBp
         l54w==
X-Forwarded-Encrypted: i=1; AL+hErGUo4XExfEw4Yaqh2ZCUjviMlrcohpcaA5RgXVa5voYEdgoG8Nr2v6DsIC5MhYsX6+RjC/VGmthUUtcK14=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lgZYFPDrN2ZIovaxfvhi4z4nxZybY550ihHHGgoe+E8zhVRnN
	kZz2vYqdPAl4wFTbCRSHxrrY2FHjsK9joKCf+7fFxJcvTqlKtS6i4Ly3Jk5lC0aBCC7izkDcmfz
	Y+2XUczD17r02WZhrZpGBhL3Zqqe8hvWVGY2+jIps
X-Gm-Gg: AYBFou0U7EL2pT9XV/uEloq9zQzIS/DVDPDx6xI20WpGKoM6FnBbeaLG5pWz5bAUS+e
	gWac+BDc21d6wNwNiZWXpmKMSxxMUXqiKFxfMGS6DDJ3eoiR/Zb7TggM32BdJYJGA7erKdS8ZaQ
	QQnitTziJgxn6+iQ0m+dshTw4xQCcbyUek9dR9FG8+xqrxubT7+xzFClnxxro0v41SmKGmdZhqZ
	DREnOTTXlEnhVJ4QYMpL4oiWA5i+f0hTZSXnetlxZkMi0qc2N4Do8cvgDj5ckbbNIsF68P3luke
	h34tR6jdmpfWdeqkBVf8/MAhm4TEpQQLdzFTgxdasd67s9AE0fZSX9MbOCDDF/BlOAuWrVQJqNP
	+BVGSWgo81N46X4WIpdxuY7bBVQDahzOpohAf3ViERn/awfjoYWIsfl5y5gMNs3FCR4gQug==
X-Received: by 2002:a17:907:eccc:b0:c31:5bb8:4b3b with SMTP id
 a640c23a62f3a-c509611127dmr374609166b.2.1794617144927; Fri, 13 Nov 2026
 16:45:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111115911.1142000-1-david.laight.linux@gmail.com> <20261111115911.1142000-9-david.laight.linux@gmail.com>
In-Reply-To: <20261111115911.1142000-9-david.laight.linux@gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 13 Nov 2026 16:45:33 -0800
X-Gm-Features: AclHuK9LmaXz8sX43Vv-rLxGQgDvv5qT26IFoen_6Yi7-ag8usId7Ni6mm3ot-8
Message-ID: <CAG2KctqLmjL1EZgc8GoLZ_FU9xvqYam_xabvT2q=Ofm91CW38g@mail.gmail.com>
Subject: Re: [PATCH v3 next 08/13] kallsyms: Optimise symbol name search
To: David Laight <david.laight.linux@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
	Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 3:59=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> Change the alphabetically ordered lookup table (kallsyms_seqs_of_names)
> to one that indexes the table of compressed names rather than the
> array of symbol values.
> This removes all the linear scans during the binary search for the symbol
> name.
> Once the name has been found a second binary search of the 'markers' arra=
y
> followed by a linear scan for the symbols address gives the symbol value.
>
> This linear scan is done once for each address returned, whereas the old
> code did the scan for each of the ~17 comparisons in the binary search
> (and the binary search was done twice for a symbol that appears once).
>
> For normal kernels the index table stays at 24 bits per symbol (now host
> ordered), but a 32 bit table is used if necessary (probably only for
> allyesconfig builds - which needs 26 bits on x86-64).
>
> Use the low bit of the index table value to indicate that the symbol has
> the same name as the previous one.
> Use this to avoid the second lookup to find if the name is unique, speed
> up the search for the first symbol with a given name, and simplify
> kallsyms_on_each_match_symbol().
>
> Speeds up lookup by name by a factor of about 12, and makes a massive
> difference to the time taken to lookup symbols that occur 100s or
> 1000s (or maybe 10000s) of times.
>
> The slowest 'lookup by name' changes being a symbol that is duplicated a =
lot
> to one that is very long.
>
> Build for BE kernels correctly flips the byte order in the index table.
>
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>
> v3:
> - Use a discrimant union for the name table instead of weak symbols.
>   Undefined weak symbols can't be guaranteed to be zero and a build
>   mismatch left both undefined.
> - Patch the kallsyms_off_size_24 static key from an initcall,
>   the first name lookup might not be allowed to sleep.
>   Leave a conditional in the 32bit offset case, it is unlikely
>   to be needed for a real kernel.
> - Merge in the following patch that optimised the scan for duplicates.
>
>  kernel/kallsyms.c          | 162 ++++++++++++++++++++++++-------------
>  kernel/kallsyms_internal.h |   7 +-
>  scripts/kallsyms.c         |  49 +++++++----
>  3 files changed, 148 insertions(+), 70 deletions(-)
>
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index d18d78e626db..fd42a1a8ed3e 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -177,6 +177,36 @@ static unsigned int get_symbol_offset(unsigned long =
pos)
>         return name - kallsyms_names;
>  }
>
> +/*
> + * Find the value of a symbol given the offset in the compressed stream.
> + */
> +static unsigned long get_name_address(unsigned int name_offset)
> +{
> +       unsigned int low, pos, high;
> +
> +       low =3D 0;
> +       high =3D ((kallsyms_num_syms - 1) >> 8) + 1;
> +
> +       while (high - low > 1) {
> +               pos =3D low + (high - low) / 2;
> +               if (name_offset >=3D kallsyms_markers[pos])
> +                       low =3D pos;
> +               else
> +                       high =3D pos;
> +       }
> +
> +       pos =3D kallsyms_markers[low];
> +       for (low <<=3D 8; pos < name_offset; low++) {
> +               unsigned int len =3D kallsyms_names[pos];
> +               if (len & 0x80)
> +                       len +=3D (kallsyms_names[pos + 1] << 7) - 0x7f;
> +               pos +=3D 1 + len;
> +       }

Is this just get_symbol_data() from previous patch? If so, that would
make it more readable.

> +
> +       return kallsyms_sym_address(low);
> +}
> +
> +
>  unsigned long kallsyms_sym_address(int idx)
>  {
>         /* non-relocatable 32-bit kernels just embed the value directly *=
/
> @@ -185,66 +215,87 @@ unsigned long kallsyms_sym_address(int idx)
>         return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
>  }
>
> -static unsigned int get_symbol_seq(int index)
> -{
> -       unsigned int i, seq =3D 0;
> +static DEFINE_STATIC_KEY_FALSE(kallsyms_off_size_24);
>
> -       for (i =3D 0; i < 3; i++)
> -               seq =3D (seq << 8) | kallsyms_seqs_of_names[3 * index + i=
];
> +/*
> + * Get the offset into the compressed list of names for the n'th
> + * symbol in the 'sorted by name' list.
> + * Returns 'offset << 1 | is_duplicate_name'.
> + * To save memory (the array can have 200k+ entries) the values are usua=
lly
> + * 24 bit (host ordered) but will be 32 bit if necessary.
> + */
> +static inline unsigned int get_symbol_name_offset(unsigned long index)
> +{
> +       if (static_branch_likely(&kallsyms_off_size_24) ||
> +           unlikely(kallsyms_offs_of_names.size =3D=3D 24)) {
> +               u8 *off =3D kallsyms_offs_of_names.offs + index * 3;
> +#if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
> +               return ((struct {unsigned int v:24 __packed; } __packed *=
)off)->v;
> +#else
> +#if defined(__BIG_ENDIAN)
> +               return (*(u32 *)(off - 1)) & 0xffffff;
> +#else
> +               return (*(u32 *)(off - 1)) >> 8;
> +#endif
> +#endif
> +       }
>
> -       return seq;
> +       return ((u32 *)&kallsyms_offs_of_names.offs)[index];
>  }
>
> -static int kallsyms_lookup_names(const char *name,
> -                                unsigned int *start,
> -                                unsigned int *end)
> +static int kallsyms_set_kallsyms_off_size(void)
>  {
> +       if (kallsyms_offs_of_names.size =3D=3D 24)
> +               static_branch_enable(&kallsyms_off_size_24);
> +
> +       return 0;
> +}
> +early_initcall(kallsyms_set_kallsyms_off_size);
> +
> +static int kallsyms_lookup_names(const char *name, unsigned int *start)
> +{
> +       unsigned int mid, off;
> +       int low, high;
>         int ret;
> -       int low, mid, high;

nit: any issue with mixing signed and unsigned here? Simpler to keep
them the same type if possible.

> -       unsigned int seq, off;
>         low =3D 0;
>         high =3D kallsyms_num_syms - 1;
>
> -       while (low <=3D high) {
> +       for (;;) {
> +               if (low > high)
> +                       return -1;
>                 mid =3D low + (high - low) / 2;
> -               seq =3D get_symbol_seq(mid);
> -               off =3D get_symbol_offset(seq);
> -               ret =3D kallsyms_strcmp_symbol(off, name);
> -               if (ret > 0)
> +               off =3D get_symbol_name_offset(mid);
> +               ret =3D kallsyms_strcmp_symbol(off >> 1, name);
> +               if (ret > 0) {
>                         low =3D mid + 1;
> -               else if (ret < 0)
> -                       high =3D mid - 1;
> -               else
> -                       break;
> -       }
> -
> -       if (low > high)
> -               return -ESRCH;
> -
> -       low =3D mid;
> -       while (low) {
> -               seq =3D get_symbol_seq(low - 1);
> -               off =3D get_symbol_offset(seq);
> -               if (kallsyms_strcmp_symbol(off, name) !=3D 0)
> -                       break;
> -               low--;
> -       }
> -       *start =3D low;
> -
> -       if (end) {
> -               high =3D mid;
> -               while (high < kallsyms_num_syms - 1) {
> -                       seq =3D get_symbol_seq(high + 1);
> -                       off =3D get_symbol_offset(seq);
> -                       if (kallsyms_strcmp_symbol(off, name) !=3D 0)
> +                       continue;
> +               }
> +               if (!ret) {
> +                       /*
> +                        * Found a match, but need the first one.
> +                        * Most symbols (and all exported/global ones) on=
ly occur
> +                        * once, most of the others only occur a small nu=
mber of
> +                        * times so it is worth doing a linear scan that =
avoids the
> +                        * kallsyms_strcmp_symbol() call.
> +                        * However some symbols occur a large number of t=
imes
> +                        * (_sub_D_65535_0 is repeated 24610 times in an =
x86-64
> +                        * allyesconfig, __func__.0 442 in a more normal =
kernel).
> +                        * Avoid a long linear scan by returning to the b=
inary
> +                        * search if a short linear search is fruitless.
> +                        */
> +                       unsigned int scan =3D 16;
> +                       while ((off & 1) && scan--)
> +                               off =3D get_symbol_name_offset(--mid);
> +                       if (!(off & 1))

Curious if you have numbers comparing with and without this linear
scan. Did a quick check on my desktop and phone, and ~99% of symbols
are unique already; of the ~1% that are repeated, they're generally
compiler generated local variables which I think are rare targets for
symbolization (AFAIK).

Just a vanilla lower_bound() would halve the line count of this function. :=
)

>                                 break;
> -                       high++;
>                 }
> -               *end =3D high;
> +               high =3D mid - 1;
>         }
>
> -       return 0;
> +       *start =3D mid;
> +
> +       return off;
>  }
>
>  /* Lookup the address for this symbol. Returns 0 if not found. */
> @@ -257,9 +308,9 @@ unsigned long kallsyms_lookup_name(const char *name)
>         if (!*name)
>                 return 0;
>
> -       ret =3D kallsyms_lookup_names(name, &i, NULL);
> -       if (!ret)
> -               return kallsyms_sym_address(get_symbol_seq(i));
> +       ret =3D kallsyms_lookup_names(name, &i);
> +       if (ret >=3D 0)
> +               return get_name_address(ret >> 1);
>
>         return module_kallsyms_lookup_name(name);
>  }
> @@ -289,17 +340,20 @@ int kallsyms_on_each_symbol(int (*fn)(void *, const=
 char *, unsigned long),
>  int kallsyms_on_each_match_symbol(int (*fn)(void *, unsigned long),
>                                   const char *name, void *data)
>  {
> -       int ret;
> -       unsigned int i, start, end;
> +       int name_offset, ret;
> +       unsigned int sym_number;
>
> -       ret =3D kallsyms_lookup_names(name, &start, &end);
> -       if (ret)
> +       name_offset =3D kallsyms_lookup_names(name, &sym_number);
> +       if (name_offset < 0)
>                 return 0;
>
> -       for (i =3D start; !ret && i <=3D end; i++) {
> -               ret =3D fn(data, kallsyms_sym_address(get_symbol_seq(i)))=
;
> +       do {
> +               ret =3D fn(data, get_name_address(name_offset >> 1));
> +               if (ret)
> +                       break;
>                 cond_resched();
> -       }
> +               name_offset =3D get_symbol_name_offset(++sym_number);
> +       } while (name_offset & 1);
>
>         return ret;
>  }
> diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
> index 81a867dbe57d..11fb0de92ede 100644
> --- a/kernel/kallsyms_internal.h
> +++ b/kernel/kallsyms_internal.h
> @@ -13,6 +13,11 @@ extern const char kallsyms_token_table[];
>  extern const u16 kallsyms_token_index[];
>
>  extern const unsigned int kallsyms_markers[];
> -extern const u8 kallsyms_seqs_of_names[];
> +
> +/* Although constant, size is volatile for better code generation. */
> +extern struct {
> +       volatile unsigned int size;     /* 24 or 32 */
> +       unsigned char offs[];           /* int:24[] or int:32[] */
> +} kallsyms_offs_of_names;
>
>  #endif // LINUX_KALLSYMS_INTERNAL_H_
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 74db751600b4..930ec27a53c0 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -403,7 +403,7 @@ static void sort_symbols_by_name(void)
>
>  static void write_src(void)
>  {
> -       unsigned int i, k, len, off, seq;
> +       unsigned int i, k, len, off, off_size, table_size;
>         unsigned int best_idx[256];
>         unsigned int *markers, markers_cnt;
>         unsigned long bin_offset =3D 0;
> @@ -453,7 +453,7 @@ static void write_src(void)
>                 unsigned char len[2];
>
>                 se =3D table[i];
> -               se->seq =3D i;
> +               se->seq =3D off;
>
>                 /* The length must be less than that of the original symb=
ol. */
>                 if (!se->len || se->len > KSYM_NAME_LEN)
> @@ -485,7 +485,7 @@ static void write_src(void)
>                         if ((i & 0xFF) =3D=3D 0)
>                                 markers[i >> 8] =3D off;
>
> -                       printf("\t.byte\t%u", len[0]);
> +                       printf("\t/* n:%u */\t.byte\t%u", off, len[0]);
>                         if (len_len =3D=3D 2)
>                                 printf(",%u", len[1]);
>
> @@ -500,6 +500,7 @@ static void write_src(void)
>                 memcpy(se->sym, buf, se_len + 1);
>         }
>         write_incbin(&bin_offset, off);
> +       table_size =3D off;
>         printf(".size kallsyms_names, . - kallsyms_names\n");
>         printf("\n");
>
> @@ -560,7 +561,7 @@ static void write_src(void)
>                                out_bin_file ? '\n' : '\t');
>                 }
>                 if (!out_bin_file)
> -                       printf("/* %c %s */\n", table[i]->sym[0], table[i=
]->sym + 1);
> +                       printf("/* n:%u %c %s */\n", table[i]->seq, table=
[i]->sym[0], table[i]->sym + 1);
>         }
>         printf(".size kallsyms_offsets, . - kallsyms_offsets\n");
>         printf("\n");
> @@ -570,23 +571,41 @@ static void write_src(void)
>         sort_symbols_by_name();
>         stamp("sort by name");
>
> -       output_label("kallsyms_seqs_of_names");
> -       write_incbin_header("seq_of_names", &bin_offset);
> +       off_size =3D table_size < (1u << 23) ? 24 : 32;
> +       output_label("kallsyms_offs_of_names");
> +       printf("\t.long\t%u\n", off_size);
> +       write_incbin_header("offs_of_names", &bin_offset);
>         for (i =3D 0; i < table_cnt; i++) {
>                 se =3D table[i];
> -               seq =3D se->seq;
> +               off =3D se->seq << 1;
> +               if (i && se->len =3D=3D table[i - 1]->len &&
> +                   !memcmp(se->sym + 1, table[i - 1]->sym + 1, se->len -=
 1))
> +                       /* Mark that this is a duplicate of the previous =
symbol */
> +                       off |=3D 1;
>                 if (out_bin_file) {
> -                       unsigned int seq_be =3D htobe32(seq);
> -                       fwrite((char *)&seq_be + 1, 1, 3, out_bin_file);
> +                       unsigned int off_te =3D big_endian ? htobe32(off)=
 >> (32 - off_size): htole32(off);
> +                       fwrite(&off_te, 1, off_size / 8 , out_bin_file);
>                 } else {
> -                       /* The three spaces before the tab line up the co=
mments */
> -                       printf("\t.byte\t%u,%u,%u   \t/* %8d %c %s */\n",
> -                               seq >> 16, (seq >> 8) & 0xff, seq & 0xff,
> -                               seq, se->sym[0], se->sym + 1);
> +                       if (off_size =3D=3D 32) {
> +                               printf("\t.long\t%#4x", off);
> +                       } else {
> +                               if (big_endian)
> +                                       off =3D __builtin_bswap32(off) >>=
 8;
> +                               /* The trailing three spaces line up the =
comments */
> +                               printf("\t.byte\t%u,%u,%u   ",
> +                                       off & 0xff, (off >> 8) & 0xff, of=
f >> 16);
> +                       }
> +                       printf("\t/* n:%-8d %c %s */\n",
> +                               se->seq, se->sym[0], se->sym + 1);
>                 }
>         }
> -       write_incbin(&bin_offset, table_cnt * 3);
> -       printf(".size kallsyms_seqs_of_names, . - kallsyms_seqs_of_names\=
n");
> +       write_incbin(&bin_offset, table_cnt * (off_size / 8));
> +       /* Add a terminator without the 'duplicate' flag. */
> +       if (off_size =3D=3D 24)
> +               printf("\t.byte\t0,0,0\n");
> +       else
> +               printf("\t.long\t0\n");
> +       printf(".size kallsyms_offs_of_names, . - kallsyms_offs_of_names\=
n");
>
>         stamp("write name index");
>
> --
> 2.39.5
>
