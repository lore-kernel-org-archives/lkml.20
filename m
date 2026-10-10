Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84C375ADE
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620815; cv=pass; b=sr0kyaqBbsh7Yl7j7bI5a1mHkFH34hqPx/PPeLmPZuvr3yIlaPEk2KaMMpv6vhPMZMTp6bO+AF6RNxtRyOw5An1TmSVvaz+xwQ7H8PvEf9IderGKpE8drJfCInpkoNF+Ol4ykA8a4+yaAe7niFG/QNCjU9Dr9HYv6P3/BNhdkk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620815; c=relaxed/simple;
	bh=yGZl/hG9BKBfhYLh3HnO3WHa8MfR6nQRzFQuvrh40GQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mU0S4WfJd6e5MgvgzimaglLkV1Zrn+6Ih+1zu7m/8hkmXlHxV1MqeJlqKL5H5bMQwp2Gl6ji8JGWYIhpAU9yZ+q84XBFAj1xuG9cC7VK1TngVFOu5p1my5uOA6O+8+mmZ7aW8vwD0VkcNiMkd+ebToAYl58Bs/h6EGgk955SeL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORs8aide; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORs8aide"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-676858d42f8so261158d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791620813; cv=none;
        d=google.com; s=arc-20260327;
        b=BS/cNs/5b0yEKl53y33u7ffeYWGc7n96xopmsUVgoeJewauny/3qmOHtu3KIO2xPcb
         XxqgdJd32lnHWtwAc6F+8cGXY+MQdEOKs+Vn92wcvNd9JVBMI7l1Huk/YmaI9o+dST9p
         Q0J4upfee345w5H5G4KxpoLwcvyOGGhWQWbUokAP1jWbvg9BtNOH+NunQlR/oPmmmSVV
         SvyMxfmzMmaex/NjSPgo6N+ArGguA+BfmCeQ6yI/L4ljIkrQ6EzmKJ0/KB25aURR4bF8
         bP8jQwalOG+1sKO/kqfeHS+2w7Uk2sYo52Dl0739/A8fQN6dfZJyZGejeNab4affGWMO
         MTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4taFzx4ZqDR2SeWluPXbnOCCuhe1kKvXHPzkXYOhyQ=;
        fh=pU+BZVNkCBgpqap905L0QEr/flLedikSdd6vbT4XZoQ=;
        b=kYznnBnG1Tnchn+8pesb2CIK6Q3kBptFdUSgPXEUKuyqUy3Z1NG+tmxmVqmQ9Abjxy
         zWC9alYk5Xv9XiIVYLOXQ0bwtlZfnT7RZP4Suz8/SB6CSlgj5dENXFLjZohW9fIdhchv
         y761SWfdcYIyytwFgj2lclB44ZbgLBhZ0FZbJ+WxLmPRmvMbDbkhghbEYm74HUEWXbo/
         Dsiu7i+tqMcQ0SCWkrpyrUhBXIAJFo8bPaEP4WvC98LV3Jfvsf7JCEay0zpFAlZBkGHl
         9IPJT3QSfxQ2zCmAESyTllhj4kj+WbBE7vJQOLwgEUExzXXoih+FNReu5lX37Rt6EFxz
         HgGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791620813; x=1792225613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4taFzx4ZqDR2SeWluPXbnOCCuhe1kKvXHPzkXYOhyQ=;
        b=ORs8aideBmBB1h38hkdkCylGRgVfxJuy/GiNMkBM0ERFVL095utIXEVQeGP9gYnpmL
         EbnCaj6uFHnpaj/OdBjyF1kB4fWiat2x7SbRTVbFYhe8Qxj+RzoivzDzIIbFK5GqvaRZ
         KU/s94esjxgmAENHJfuQcpjNVtr3BfqXQTD/b/QUB5QaGRj5hg9TQ3WLzKnJpgxdrZr0
         JTNh+Ynfm0xmcUAf34jjNigmimxCq7WnMd0OrpBsrMG6FvlUgOzAsq/rSSXGAN5FaB6S
         dqq3k3ojaOAxjY5XPYPlRYIe0ah0naUyA/s46jvqw0Rt+GffxLidH6G82eSk6Vo+9iJF
         TBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791620813; x=1792225613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4taFzx4ZqDR2SeWluPXbnOCCuhe1kKvXHPzkXYOhyQ=;
        b=dmYbftPA1EKGY1Ij+ls1iOn1B+HWVZYHMtbJ1+xIzuiHdmHn0qVscTCH3a1HahS5YQ
         6aIr6y+5xY0kOzFxDxn4VldoR9iAfhR8L96X+OB2WZmYxU0zA4XKG1Wz7mwOGB2wYz17
         QGivIqF/c9qb6wQB6IkIk8UeYi4shZ/eD4gshComebkYaZbsePPddwEbpc2LMT3xEKXB
         1ijEXwkawviRgn0B1YLREwhlTR7Twvo7yyivbkidVMUfHERxbPsBRD5Gq7ZEsz2fLToT
         ca5gg/wJu2rm7Q9chEXonxg2hiLPQfMmhSLTAY6I91FiukfmIn8gUwz8aDCvtQRB0jOd
         i52w==
X-Forwarded-Encrypted: i=1; AKwUvBzIE3loclP1o2Zhftdqga1tEAGv6p1cHnMVRn0kkBw8iCFImSKc6tHM96BUE2+S7v4DAymBRh21FvDKwyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx7vqbghwg/brSuVFdjcs5JNBRQLsXDpQj6B39jq76QT3/dW/Z
	xrJefwtLEI9TcRKcNCDD3vsR/eIfwh3fchkg2naIIdc9jy6o5nx7P+9NbCj7lVQHjZIGYdv8h3I
	dovl4iJcTVSSRgIAbfuN22woSvMCkvYk=
X-Gm-Gg: AYBFou2Y3CeVtKASJlpiKDtFtTVCM3Bw623SKaxNTuYowb+/ykatZEIIYGYV7k/eClT
	8kwI6uRyb+Snx3M4805Z4IXKZF45FtnVcuXzzPgZWXrmnetp/CnE2oYGp2D9KvuplWNRYOIl/mB
	4SdfHFL2CU3ShTmCirmc1LF70GDE+CipU4BR/1RPS1UZ81PRcAovN3ZivuI/Uk8o5sOWnweA303
	P4LISWR2QkBMKLRuc2gGUUVt58gr9Qu6L6sTt+MgeBhu6+vsXUAfs3O6irv3tlWPsys7gHNFax+
	RnHqQmX1QschPeGe9rxYHZjzkXSsGKhxcja67iSPqH0l42wcHHXZ0k+zkDuj4tqnDsst9nMlPAv
	PpQILNKwf2Q==
X-Received: by 2002:a05:690e:4006:b0:677:cb98:35b7 with SMTP id
 956f58d0204a3-679362b7d1fmr1253901d50.131.1791620812785; Sat, 10 Oct 2026
 01:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010074435.1415234-1-chenyuan_fl@163.com>
In-Reply-To: <20261010074435.1415234-1-chenyuan_fl@163.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sat, 10 Oct 2026 16:26:15 +0800
X-Gm-Features: AclHuK8LRVqGX5xgGPuub-kHsmJVaM2UaUqdcVwN-6BAA3YlW_5CH8aqwEhPU-c
Message-ID: <CALOAHbD8v=d-QwtjbyJ7DEBCiUZxhUDsrkdfehyUchHzAzsyyg@mail.gmail.com>
Subject: Re: [PATCH] bpftool: Fix out-of-bounds read in kprobe_multi link info dump
To: chenyuan_fl@163.com
Cc: bpf@vger.kernel.org, qmo@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 3:45=E2=80=AFPM <chenyuan_fl@163.com> wrote:
>
> From: Yuan Chen <chenyuan@kylinos.cn>
>
> show_kprobe_multi_{plain,json}() walk the sorted kallsyms array against
> the sorted addr/cookie array with j as a cursor into the latter. The
> loop terminating condition is checked after the cursor has already been
> used to access the array:
>
>     if (j++ =3D=3D info->kprobe_multi.count)
>             break;
>
> After all count entries have been printed, j has been bumped to count,
> but the loop keeps running and dereferences data[count] -- one element
> past the end of the calloc(count, sizeof(*data)) allocation -- while
> comparing every remaining kallsyms symbol. If the out-of-bounds value
> happens to match a symbol address, a bogus entry with a garbage
> addr/cookie pair is printed to boot.
>
> Fix the off-by-one by advancing the cursor before the comparison, so the
> loop terminates as soon as the last entry has been printed.
>
> Verified with an ASAN build of bpftool against a live kprobe_multi link
> of 3 symbols:
>
>   before: ERROR: AddressSanitizer: heap-buffer-overflow READ of size 8
>           at link.c:860 (show_kprobe_multi_plain) and link.c:352
>           (show_kprobe_multi_json), 0 bytes after the 48-byte
>           get_addr_cookie_array() allocation
>   after:  clean output, no ASAN report
>
> Fixes: edd7f49bb884 ("bpftool: Show kprobe_multi link info")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>

Nice catch!

Acked-by: Yafang Shao <laoar.shao@gmail.com>

> ---
>  tools/bpf/bpftool/link.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/bpf/bpftool/link.c b/tools/bpf/bpftool/link.c
> index 088d1d206065..5cffa2d283b4 100644
> --- a/tools/bpf/bpftool/link.c
> +++ b/tools/bpf/bpftool/link.c
> @@ -364,7 +364,7 @@ show_kprobe_multi_json(struct bpf_link_info *info, js=
on_writer_t *wtr)
>                 }
>                 jsonw_uint_field(json_wtr, "cookie", data[j].cookie);
>                 jsonw_end_object(json_wtr);
> -               if (j++ =3D=3D info->kprobe_multi.count)
> +               if (++j =3D=3D info->kprobe_multi.count)
>                         break;
>         }
>         jsonw_end_array(json_wtr);
> @@ -867,7 +867,7 @@ static void show_kprobe_multi_plain(struct bpf_link_i=
nfo *info)
>                 else
>                         printf("  ");
>
> -               if (j++ =3D=3D info->kprobe_multi.count)
> +               if (++j =3D=3D info->kprobe_multi.count)
>                         break;
>         }
>  error:
> --
> 2.54.0
>


--=20
Regards
Yafang
