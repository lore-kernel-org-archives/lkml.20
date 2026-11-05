Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793917012;
	b=mxBAVOeFGtig7zdXSrYng4STKu9r4tLZTyi068wrlI1jcoe4D0wj2XQdscgY8sQz6v4h
	 ep91MWOO17vUxfrEv5UcjMkRdg6YxgLRa4IQB9IxdZQroid7xEzCzUpPyQVs7cMmQMBBt
	 8+RTq6OAtLq5aDJMPXeVYNuOq2ed18RloIa4Rl6yIMPpa4ld5aca/Uz0c6mtPFFrV9qRY
	 Z8T3C9XDrNs6THzYD6JkrloGU7uJSRNGpS6tA3NiZQegZq1PSLxpGslGCdYxcJxj2wxLt
	 B+luWhoAFjABVU7yYRzvXO0aCRp8ZaU0CALfgwflAbFfGbngm3vjyqa3bpkOEm3w+ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YdY2Yydwpq3i9bcvlxMcQCy5kCBYOaA+wcZKGjqCwqo=;
	b=2klLQOq5IDt0BfBYnbCP2ZIqDLgqvWuqCiuG2IctkQfTvK8zGrJiXDqHDpsQ+3848A6j
	 xZhAQ697eU9qooJGcJRY1kbl4wgjYTYPztzC83j+FG41W3JYXo3gNRmrQ1AoVOvmp9+CI
	 ZckTMEzJGdsPBw8lGt4e0kvqrh8JW1OtxTwL46oKU+c+6m4W0gseGn7EZqMp2CoPkgDjY
	 haItpc1uUcUtv3vJqdAl5rSQK3dU3MT2yWRWEumm8U0lp5vfHnyk8YxwCCBa/zD2ncMiE
	 atHD364Wdj9OQO4G3fAGnqAEEpMNqiCB+RFBcE/bGUagk3yBdLVKbwy2GAwWSLrLQoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iP9BgBAa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3F6606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A3F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iP9BgBAa
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso14174985ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:16:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793917011; cv=none;
        d=google.com; s=arc-20260327;
        b=SiN2SdRYRiTg1xBTiuRPX27KiXFlWFkjdE5Bqs6EEZ1K6R2UVXoa0KUrpOpE8gAvkA
         zzgZ8tNVfQLJVPV9Jxk6kz/mRrSGa/5qXaIoBZpPtVeeDA+U8FB8Wl0A+9QxBCIWqaye
         gVYqIhxCr5JdFyCwoTmwmd4+z0rQaFiefHC93OCZM52NXY40uj7jjquPkmqIOYMLSkEB
         IG+2XIczsc8RmXZpFKX40STYVS0E1qJPYTGql2g3LgMslBUvAKzQ4FycQUXrxEEq2qgW
         QVGV4+rBUeAuCtLrgOpw3r/XwZ627klPfv0m6SOz3m6oUOh5tTeaH5lM9hVye+lUMkT6
         bv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YdY2Yydwpq3i9bcvlxMcQCy5kCBYOaA+wcZKGjqCwqo=;
        fh=9DDuxfmrQxmf0lxQYY/GKK9XpCRQ9C2Z9kXu9lr5BwE=;
        b=UGTdZxvnv1wkHxgIu9VsQuz0yKeVeypAoAwTbccOy1WMaLZJKBAZHhx1/hLpBK4RC6
         J9YUrdZnl/QXZPdrWETa36SVS/iRDF3wZNl+j3+5o27j/abDOQZDgEfn4PJDmewFwNnG
         +7KgYNSkteGgtzFIpDWp/Zg4xsVrWA/Rwfots4IdQfsSmaLmqiNfiw1e1S7UdLuAp7Gn
         b5wqgwS8nDrKE8yQ4F07xbh4mW5pKezgUwNVjc1+6nbAURrYJHm3GcrmwMMe6m4rwTz3
         3p3+F+EArJsVu36YD+2obysFQt0BHmH2w2voG+P6/u6vSz/6hpKbQOVmhP/NhbQLp2Qx
         /K6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917011; x=1794521811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YdY2Yydwpq3i9bcvlxMcQCy5kCBYOaA+wcZKGjqCwqo=;
        b=iP9BgBAaZ+4A+3RimSD9ZonOApr8s4gWmYWTaABf/aDdyfTq8bRD2jcxwy7ugyBGhj
         KiltjQF+2poLmDHsSb98LsTJA2j25xqN/YKk8wL5KNfTpCuwsuUCXvsw5XVRCINuSS87
         9Fe/uVAtkXQWuxBGlwUR7w5pOKMvt6sUtwZ0/XTEZH4RXCvj1eaGVWk6nVdOQISu8eAs
         a3qUFOlDzQ32mSsKtYeSLRebVLyGj5dYoTFgvRqT71GMNu/pvBWVp1ufljtIfOxyhAvY
         D6w9HDHlVw2G2SbkTjq5/jHBgHtc1aFqrZrAUwWg/9N7QCTa6tfm8piShp6wY/d4n3D0
         MMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917011; x=1794521811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdY2Yydwpq3i9bcvlxMcQCy5kCBYOaA+wcZKGjqCwqo=;
        b=qiyBs4AKL8DjsCC8U61UTT/W4gwRZfJ7vH1uGpk0rH6Zxe79SNto5KncNlUY/OO+XW
         UBUs1/ZnvJVj6KJb6PhNwD72Phj3D2FL6VKrcSxbxtDLodRJDM4uPSDSNaAixgMqZP2B
         lMf1h5RBkfSB9Y17vxhZnqEe5wwDAbrFu8znf0u5Pvn4z/sJ59idZORQiWLs1Jr5BZv4
         3gfeuYeR/g2GaSWhkmBwQ5L43m7gJNZ6rTkeCsKLU3o1qYjZPY+8sJ9ybqz7VcYqDQc9
         J+Bu8f6xSidMlI67R90DQyMfml12fTmc08t9mi9dxj6oqAaz5OnMYYleX3OzBzblfd1z
         dRKg==
X-Forwarded-Encrypted: i=1; AKwUvBzv0EX3c7XS6NvnoId0fkU/BJwP7XoKKF2ZJNHidgRpHsh8ZILwsEzMjKChCri0k88l5b7PqFab3HEm4cI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VkLFyuUmmFWhoCodPd5hmlh5B2HpZqUmxU62sqkbV5yKirjvB
	zdUN6RjHAdl2+lf/g77Q078ILfdY2wfS1FcTw0yGMuUACTeC2tKimb/FVU5HFyv9vWHYrqWlMCC
	OZWVCVfIVNwpYnUAoRB5vRVCzWBPwrq8=
X-Gm-Gg: AYBFou0WF44+NOy8svK+8VPYDgxZV2/se9XaPIe7o/1gtdlwBsuvGnh8vl2fAh+/wz4
	WT6hRhfokLPviVJWtf+g6yS3mLjhfbh7D4Pn56ZDYlf9VxJlXr0hJpjAzcTsyq7O3eJNXON9mwY
	zQ7C+58jduEXmiUx22DIhpEK5qkdESuDwwD1dcX4Cfr3rysOOit7mzJOwTMcrtq/1GnyfiG+5+u
	wI+TYsGh+qdupvYly8IcJHBDLrW/s7Az0LIIMex+ARTh7dZ2NKkVlCKyEr8+flPY08b6xMxhALJ
	YnXFnxZ41PMyl4HLJaaVDc3iI56eDnmvBg7RGlicGqkFqefwLVTwSVYkW/QNk23S8nw4vylqjWI
	wP+Wfi6bjh1b52B+HBkUW8n77dl3JQSab7nyMbnBct0gFKxGB1U0ssxMSAAikvn4YkfnpII9Moj
	waHvN3WZoowltsvFrMl+W2AP9qNzP8yYMIXQ==
X-Received: by 2002:a17:902:f605:b0:2e9:a090:dd69 with SMTP id
 d9443c01a7336-2ed40dbd792mr10719095ad.39.1793917011326; Thu, 05 Nov 2026
 14:16:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101103221.51534-1-dennylin0707@gmail.com> <20261101103221.51534-2-dennylin0707@gmail.com>
In-Reply-To: <20261101103221.51534-2-dennylin0707@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:16:39 -0800
X-Gm-Features: AclHuK8Q4YahT7MssTrhujdgEAS5UbVDPCCKhtVvtn_dsDLqpOo6lwdZkjFPtNA
Message-ID: <CAEf4Bza9Q5AyzdybDwdQzAJKUJujAb_c7jtSAg=dpOPVWXo_uw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] libbpf: Normalize enum values according
 to signedness
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, qmo@kernel.org, 
	daniel@iogearbox.net, yonghong.song@linux.dev, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:32=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> BTF_KIND_ENUM stores enumerators in a signed 32-bit field even for
> unsigned enums. btf_dump_enum_data() compares unsigned data against that
> signed field, so values with bit 31 set fail to match their names.
> get_map_field_long() also sign-extends the field: for example,
> __ulong(map_extra, 0x80000000) becomes 0xffffffff80000000 instead of the
> requested arena mapping address.
>
> Add btf_enum_value() to extend an enumerator according to kflag and use
> it in both places.
>
> For data dumps, keep the original comparison as well. Older BTF producers
> did not record enum signedness; an eight-byte BTF_KIND_ENUM can contain
> signed data such as -1 with kflag clear. Using only the helper would lose
> an existing name match. This compatibility comparison does not truncate
> the data value or change the numeric fallback.
>
> For an eight-byte BTF_KIND_ENUM with kflag clear, a negative stored
> enumerator can therefore match both its sign- and zero-extended values.
> The record cannot distinguish legacy signed metadata from unsigned
> metadata with the same bits.
>
> Fixes: d90ec262b35b ("libbpf: Add enum64 support for btf_dump")
> Fixes: d147357e2e59 ("libbpf: Allow specifying 64-bit integers in map BTF=
.")
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Link: https://lore.kernel.org/bpf/DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com/
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  tools/lib/bpf/btf.h      | 6 ++++++
>  tools/lib/bpf/btf_dump.c | 3 ++-
>  tools/lib/bpf/libbpf.c   | 2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/tools/lib/bpf/btf.h b/tools/lib/bpf/btf.h
> index 57f12630c5d1..eeb4984d6c57 100644
> --- a/tools/lib/bpf/btf.h
> +++ b/tools/lib/bpf/btf.h
> @@ -636,6 +636,12 @@ static inline struct btf_enum *btf_enum(const struct=
 btf_type *t)
>         return (struct btf_enum *)(t + 1);
>  }
>
> +/* btf_enum->val is signed even for unsigned enums; kflag records the si=
gn. */
> +static inline __s64 btf_enum_value(const struct btf_type *t, const struc=
t btf_enum *e)

btf_enum64_value() return __u64, why not make btf_enum_value() return
__u64 for consistency, and then cast to s64 in callers if kflag=3D1?

pw-bot: cr

> +{
> +       return btf_kflag(t) ? (__s64)e->val : (__u32)e->val;
> +}
> +
>  struct btf_enum64;
>
>  static inline struct btf_enum64 *btf_enum64(const struct btf_type *t)
> diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
> index ea9a34db4c00..b636dc4185a0 100644
> --- a/tools/lib/bpf/btf_dump.c
> +++ b/tools/lib/bpf/btf_dump.c
> @@ -2373,7 +2373,8 @@ static int btf_dump_enum_data(struct btf_dump *d,
>                 const struct btf_enum *e;
>
>                 for (i =3D 0, e =3D btf_enum(t); i < btf_vlen(t); i++, e+=
+) {
> -                       if (value !=3D e->val)
> +                       /* Keep names from legacy signed enums without kf=
lag. */
> +                       if (value !=3D e->val && value !=3D btf_enum_valu=
e(t, e))
>                                 continue;
>                         btf_dump_type_values(d, "%s", btf_name_of(d, e->n=
ame_off));
>                         return 0;
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 02e75b183ed0..cecd6b5f27de 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -2627,7 +2627,7 @@ static bool get_map_field_long(const char *map_name=
, const struct btf *btf,
>         if (btf_is_enum(t)) {
>                 const struct btf_enum *e =3D btf_enum(t);
>
> -               *res =3D e->val;
> +               *res =3D btf_enum_value(t, e);
>         } else {
>                 const struct btf_enum64 *e =3D btf_enum64(t);
>
> --
> 2.43.0
>
