Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793138878;
	b=GWnF/x3nVjWSFK6K/PP7tkwfRuVgvX3Gr7Q9gABCIWZ2hYxt4x2V9bHsZSwnLab4qZp+
	 Q3ASHtFk0DGWe+VBUpb0P9kcdhyOhky1KJtvNp2FS2nZSNlunkciIheiXWzxP81x0bOCf
	 HUOOksLkbFalEZ21p8DiE06b840B8WoZmPQuTuFjwf8tcfFlPrONNRAC2mXS6Ba4Dv/qf
	 F/xsyRt7+dAUMFCLABV3yWxK174OgcRrn3Vv6X5mFDkarcr+WLbaMlUImtnNd588XP1rh
	 lsU3gKIG7rhUQPjE47aCH2W8R6nyAyTa8Cqx5KgelwaA9xWhx2GY5dQ61K4wVT/0vyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
	b=Cly0InYduKOou9ZudcCkQOEjqoPi8XifYWVaVnnVFko1v+UWQ4gfcPdPIgwQC9hIHmmJ
	 wTWeT6dxDGOliRow18TWfHBGApZFT75S76hUljbGWo8kjAHN4+j2S13sEEhfvo58wdmH2
	 SdmsOqKJI9tL7YMoNkduYXTTFLwwivpdG6/r92AdPeLv78I4yWsVwySYQ//vGQtIG6ihc
	 nUqCEQFRXU5NBW3yE1atSZHm7P7yRyMKWC/KeXTkE4BjHwJbcfZjxzx5+YFYP4WyUaVEX
	 cN6QJnQmPuX6pqCQbtfWT/Bv+k15QRXzaJUm+cWw3iuYvbW/ra9p0e69u0Fjyy3hoDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JndHwKJi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B5C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JndHwKJi
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e30c26a4so231786266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793138876; cv=none;
        d=google.com; s=arc-20260327;
        b=dF+FThyu5h23+SPGu3MFNX544N3MBSw08Ho+rhn9wHr9bfPgo3rwI8HCI1N9Ejn6Oa
         bJxtZzqUvsW3424mzFGOfe/WIFUaluCNqsfXQzsM15yllTmkmt3gAjtSl3HRmTOlpHQG
         GTk6n6aTPMduiJqPumIkyiv81riWffmPElgI74ASy+dzAhfdwG9IuCbLjodvav2KKo4D
         hl1MZgfvgk+NGDKgnMm9tbvbgvtQ+PuQ9j/SOlHCNhykp859l5Z9Yk5YkM6MSNyuuln+
         pNlTl8hG0YZU3abBmaI8HlSZTBtbiTqg+F3vqVuckHV6iFbdg8P39E8pIJUPrdTLojKH
         eaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        fh=Ub4+/ZiW2uztVUXnhxr0CZlzycR+7XW6BJx8EpyQDLY=;
        b=rfHXhEqNuyAQjSkdytxjfAV3nKQH4HGWEIYR8GVlFKNqq0iZUCyVza0M3ZFMWv1ZBc
         G9t1axvFODMzZbGhwx0X5/9mJXLKewFwEeHXINj0EwpTr2bwXwv/UkxZ6gxmE8ndJzjj
         Xwc0PqRgVKTAYyvUNbzcNtPUJBL7GCx/LwTkwWTioBEcHu1O/TEvtBSlNKNhvpLFGz5+
         o6gXwje4w8dMewaOvt0C/MCPLrcgaOH5Et4leRt3TqXS1GzXiCQSbzolhRYHUCx2PQpZ
         FX40mPccdiplTlG5i9kGK4Jwjufyd3NyKHo0O+ak9D1E39h+aVzimkLepCEltn4QopIw
         Y2jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793138876; x=1793743676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        b=JndHwKJiqoQdimfnFC/tOH0NOP9CxQKxSiHFIN7R0ytrfsF1otC25j8OT21ypOBaw0
         SeH274c5gs94bjO0YMSWpQNXnGDmaTecGn12SItZKlKn2t20O71XSnnuJyjslHTVxzrE
         aAuZ1VDMdN0s8JEith1PGtfJvP5bQ3t6fw0A06t14GU6kC17bHFf55OjmQW375eIxizr
         i2JTJ5g1ClaP/isCuqEeFHpCWCC9L8W2JDWntColXyJVJbpXJhsN0FnMsx/BvsZ43C79
         9prCEcfErHTtXqtmR20XD7L0Eg4tfpbIY/LNsw94YqE/9dDt2m4t1kDcuTu9qRDguQ/g
         fS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138876; x=1793743676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        b=15Knma4rIpNSelz/OLKWC1XL+V8HPyPMCTPMwjMkfHkKpBJGa+hMNr4NNGbFL+Bhtg
         FWNSyEYSZ0P/jh2SEL4Xy7pcB4Whua66WY4tgZcFR/MtXPuKX4f+ToSTDvggr92DYVsi
         051H/aqIf6KgLiOiT0N3dbJmrzzKU3vO1JgUVpLiDgvClXFHKewtpJlJMezFuKoByHu8
         ZsmmgFODeSXCuVwHmgOvQiVhSjlHbsR3xBEc8zcD4q6MCBSGNU1X3HQkmwPfOugjZMPl
         9P/fKbD6lRxgQtkSXXvbxwEk7KVyif7PcikrHCE/Q/b+arAaqIF4tmSV4Uor9tTbPWR5
         WdUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcjjAyonzKeWBA1P3ijN4eOIYXzgxx1FTRuup4IjyHAGbzrcD18ZGiqXG10r9YsDLC24VBmseBKi1hMiA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV9WvHqraAJHN/9DByBmTCgZsIgZeQo2Zl6wN9Yu1VoxxVeFnf
	kUD9i2zwBKq2E6dTQlaBNce+oHLf6Eod4wk+l3CKB0CwKtb3t70qiWLKatdGLm20dD0kpPKur6i
	Dyn4U0GyZ0lpMAawL1TNvEdGWTZabNexug46GyXEz
X-Gm-Gg: AYBFou2sxcTtBRa1b4kpkyUFoLi+bzMclW7x4cWiaMKdtWOIhWelFo4hmWepEV1zoWh
	JvcE9JWlvc/0aEe4FTC/MbBFLktVbntXaWo4w4cXVFAsIYu+9JjOg4+5/yt9SEEZA3y10afAZnq
	H7IazYkGINttSOL/hAv3Ccl7nzoSIMWa+L6ORvL0ki3zJRepev6j7SW/AOfSNg0KkxByodqGLdG
	q2kdzAO15Nn9dmt7e08TWORr3VKxDIVTxLMPg4ulU1KLhP894CTTD+3AOgqarRFSovdptHvz9lx
	KASpChsL/xi4yx7aTLNrKs5NAj+s5wW5FLwQWN0aVc0puBCHIf0p3EeDc/9vSrLZuF2UarkWo7z
	xLBnpvWBxHK6qK+TrP5dMwL5GNxRDJ8iuvaiQm8rU+aEnubjwZDD1qTX3bFN72igkwlSzFyFaa2
	iFOQSNA7q3HLtS
X-Received: by 2002:a17:907:97d5:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c49bd9e20e9mr50496066b.0.1793138875790; Tue, 27 Oct 2026
 15:07:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-12-wusamuel@google.com>
 <at8dNNb4vwovNZcZ@krava>
In-Reply-To: <at8dNNb4vwovNZcZ@krava>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 15:07:44 -0700
X-Gm-Features: AclHuK_4ySi3E2heiJLIOqDTOIX20dmWcYWcaizjPHfB4zOsCZlZ7RMy9jhhzuA
Message-ID: <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
>
> SNIP
>
> > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > +{
> > +     struct kallsyms_query q;
> > +     struct extern_desc *ext;
> > +     int err =3D 0;
> > +     int fd;
> > +     int i;
> > +
> > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > +     if (fd < 0)
> > +             return -errno;
> > +
> > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > +             ext =3D &obj->externs[i];
> > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > +                     continue;
> > +
> > +             q =3D (struct kallsyms_query){
> > +                     .size =3D sizeof(q),
> > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > +             };
> > +
> > +                     err =3D -errno;
> > +                     if (err =3D=3D -ENOENT) {
> > +                             err =3D 0;
> > +                             continue;
> > +                     }
> > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > +                             pr_warn("extern (ksym) '%s': resolution i=
s ambiguous\n",
> > +                                     ext->name);
> > +                     break;
> > +             }
> > +             ext->is_set =3D true;
> > +             ext->ksym.addr =3D q.sym_addr;
> > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%ll=
x\n",
> > +                      ext->name, ext->ksym.addr);
> > +     }
> > +     close(fd);
> > +     return err;
> > +}
> > +
> > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
> >  {
> > +     int err;
> > +
> > +     err =3D bpf_object__query_ksyms(obj);
>
> hi,
> we could also add similar support for libbpf_available_kallsyms_parse and
> probably in some other places like bpf_get_ksyms.. which makes me think i=
t
> could be useful to have KALLSYMS_QUERY support for multiple symbols
>
> thanks,
> jirka
>

Thanks for lookiing over this Jiri!

Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
number of tracefs symbols, and n is lines in kallsyms, with n >> m.
But AFAICT, libbpf_available_kallsyms_parse() would only be called in
pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
functions with addresses in available_filter_functions_addrs); so this
ioctl could never be called.

And regarding bpf_get_ksyms(), it loads all traceable functions and
needs the full syms table, so a /proc/kallsyms should fits better.

I did profile a slightly different form of querying multiple symbols
at once [1], but didn't see much benefit. struct kallsyms_query is
extensible via size and query_flags, so we can update in the future as
needed.

[1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ=
1wSm7sJ1w@mail.gmail.com/

[...]
