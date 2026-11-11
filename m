Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794395646;
	b=QzXunpm9559+BvYJru2TZk1dzn8rPX14nxTjKlJEEbzfcl2hzOLAn+G3ajKINuSa+R67
	 RVWeLp0cyVq+3KNaVIADlLcznl1oU6fpjXQVI/SGBNjn0McDdy38dzkSVaTtrFUlD+1mO
	 fVP4/ZDjDlpQbwsek2AESQ7PugZEGVTKKTooeUsQn6WpQ18t8+VRhY4EjSz2/w//O0umL
	 TPy1Vjnt8X7mAd0TCY+8hzR2/e0Gdx8jRDwJZRuFqo5sppHcIL3rye2nPtcrXWc0o33vM
	 F2+pyfAPsnaE7rjB+Vs2hp/ky2d8uZU2JhJD/gZ0WQ/4RZcrmw0QIsFHHwrN7Tdp3Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mHOHqKo8QZ8tygoF/waZBGgitEd88pKcDs+2m4qmZs8=;
	b=hwL+vvoCZFDbllmcnKekwEeCY+l00BhMy0u8E4b2HrXMb0GLosYkK2JiTyTEs41vmgck
	 yEmKG0IkC93nCBzhUgtm7aYqEFuLyRZO3dhj967eSoLxre8TDH4ls0LWPL34duF1NiPap
	 +x9GbX2s8wUY3AN9FUADBOzl+s7laPqinMLg1DOlJ1jb3pX8Ui9tXY7A/KucroX8soXZV
	 FRRf3IJBklqQSOwsRwXkFSSuU58JpAnBWXY1lXLKPps/R+EUZr/wbXn4tavikbU3o1wl2
	 dK5BjOT9Pv2jnaEqFx565yFl1eAX81T4q8H6b+9XxvDUQhaqtLCoLA2t/4S9F8/Hxrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zcGZHvhY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E91F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E91F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zcGZHvhY
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be1e468a8so2316622d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395645; cv=none;
        d=google.com; s=arc-20260327;
        b=eso2dPVvWQR56t2E43b8+NMVv5NoxEcZMNfbfgp6quNwxKL+ZRJbvNeKaMmuYReYjH
         zraF1MgNUVjoTRvYL47qSXA8rOX407dCXBMLz0GIbsABOjETUE1/YJ0yspXkgv0q13bf
         TUaukAiVDwBROrVF6h79tIzTxuC7IPjfKkUPTEY5XJsazuE+AdwezAU33FANE5DIuoDn
         cKkT6qibHknW5RYkylIyi2Isqa6F6M77j8dDz5Oxl9d6XQu4A9NZcm5cSRC9VaNOo1Hj
         uohBI55667ROXbsRAGVEy+P+3pSwSv0H45dkj1P+NO7SOaJUL5BjcCrro0zB+QUwk3Kx
         hxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mHOHqKo8QZ8tygoF/waZBGgitEd88pKcDs+2m4qmZs8=;
        fh=Piw4tdtMliNM59cMdR0+okx4bQVKoEbqLNltvJ6OibA=;
        b=eo0aO1MKkJ9fLrnaatXIbNe+WLKA0PKeYMB68AtC2TvQljtaZa8ipcV/T5kZpJfeYb
         2xxzwB51PXJy1uLvxqxS3HCT8sFniryitx3kTMdDYHGrfZVKXr3QXTgFaFaWL7bz9TmH
         7Yy5xyVrPMmyn9gAdlX7bMMtYx3OLaCdeSDdG58mAV77BSMDSZiEyJ9WJlxvjnTcjB0y
         PATz2E8/A7kf37Cn5FblCtOZcnuuo8fi1kLHtd/LxxDbXOwyl+ZmW8jzwlxi8WEnPQZ8
         Nec4+7vtTvRgQuPU8aK9s9iZWrwZg4J6z++VcDtIt2yeFkySMOmL2zVTdRmmcTlYrnbw
         oeJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395645; x=1795000445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHOHqKo8QZ8tygoF/waZBGgitEd88pKcDs+2m4qmZs8=;
        b=zcGZHvhYqd0xVv4jlHB4fAUJEGZtKbq+0BHSZ1nM+wl0Wkm37hk1VXkb+VtGKk04Cs
         TBImeO09SCFQO63wnFEc34DQHZ84XNizGGGxDTFlRryN468HajSFRQzV3JdXIPdG2VE2
         8mRvP4wzHZXVmLdLbghPV4XK2cL8BA3ZJqed5v0Njyr5ug8+2bibuO9HAbhVM35zKkt6
         B4B2RHoEt6trB0xo3Yzbd7cuT3/3tDEfNiy1inN90Sc1559H6dCEhbAa72OLtINyJwuq
         +6VOb1iVLZGE4QNYuKrqPdYsVn7WWpFvgThSj77Yh4zUOV2YdNpBdpHwCmWlEu4Bk02t
         B9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395645; x=1795000445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHOHqKo8QZ8tygoF/waZBGgitEd88pKcDs+2m4qmZs8=;
        b=YZqRUYBm46kuSVGqkpU2UsebgrPuM4AG1GKep7Tu16EYDrK784Zgoie21qfsozDtLI
         1AZgECHgDS3r2/O4JcugVsiJt7EYL9eGIeuUF/dhgnabmC4coGR92pv7L7J13gN7CpMM
         /7dGa6Sx6vWUfimBKBoWVEMM0nTIQqqLJ7e8CWJYzDHj1ORbXiIhY84DJf3DGVvmQH2M
         rOIdV/aGZYvTTQkVwiUnaSliAo3V6Clomj6C5cLKzqXCi2veQeANkwq2gI73LL/n/Pnz
         5Se9IzVRjU9+tOVGM33ID/aQ/6Tg23JYgRGpoOWY0a0CtRT8I9JDDIORy14HAMksig3w
         WI1g==
X-Forwarded-Encrypted: i=1; AL+hErHAUlvYZzuPqB12iLT+bRA2TcT9e5KZPMNvqedAW+TJe1ZwHe233HTjq0iP3AclwEBoA4MklGp7TbrNjHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xcZ83xEbtEumiuFPV9eSZxrvedcy2r+hyoyvOLXjyxfMjVvxC
	uARnYQjwB9anLWF2hV5Tj1q5zb61HTKZlrmprHoLMHExVq8NUcAKYG1xwQPjqm6BNnh3kq/vR7Q
	jTxXgahcPL+1aTmaU85+UaZfHyeXT8LU=
X-Gm-Gg: AYBFou1B/K418tZaCo5oyCP5dcoLLf0AeuRCF6ziJbbDDld9kK4hK5MAUb0BfiikzOF
	uKvO0+AhV4GGJnUW67rEpK72+KyWMLuLmkijnXEGXzuvYEL/83f/adIyHKGDNVfEqng0A5kNOMk
	yhsksuo3PtLGOLr6PYptp68Ofvs8T28VcGvIRXzXdBY4wYJiekmv7egope9saXxO/Tj/qvI2Gcu
	RETimMzbiVWuyVdQo7uDXuFiA4UljLyZL4GcZ6g8y00A7VOFqXkIu4GNG4Zsp36zQdthmb0SzF+
	4IOA/vEN7h9k0dnWOuiOW7QgAhO5ndJ3dPy4ZFsXEYNRCdJagDyTk+yKG8pdJjnG8rujHL8K6eB
	DWeFehmrD9lezeZfvziBdRmf1T1sPqYlSkFz4IA==
X-Received: by 2002:a05:690e:4805:b0:67c:199a:5553 with SMTP id
 956f58d0204a3-67c67f1cfd1mr971848d50.37.1794395645145; Wed, 11 Nov 2026
 03:14:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110164046.454431-9-a.s.protopopov@gmail.com> <36f85a8b94e7329f1afbb7d5eef1eb2e4dd197b1fe5e46e1cb2f7ce7fb8b4912@mail.kernel.org>
In-Reply-To: <36f85a8b94e7329f1afbb7d5eef1eb2e4dd197b1fe5e46e1cb2f7ce7fb8b4912@mail.kernel.org>
From: Anton Protopopov <a.s.protopopov@gmail.com>
Date: Wed, 11 Nov 2026 12:13:52 +0100
X-Gm-Features: AclHuK9lt2mPP3Sai2X5X2QJizHmVBUPmEjH5jotVJ4cWUCwsV3ahxZEolFiyJE
Message-ID: <CAGn_ityCVUSj+omgfbTeug2rPOyLX_+Ci1CY1NJh1OK3Awonkw@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 08/18] bpf: Add the bpf_scan_ir LLVM plugin
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, almagui@kernel.org, john.fastabend@gmail.com, 
	qmo@kernel.org, brauner@kernel.org, kpsingh@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, sashal@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:21=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > bpf: Add the bpf_scan_ir LLVM plugin
>
> TL;DR: Nit only: with the plugin enabled, link-vmlinux.sh adds --emit-rel=
ocs
> to the .tmp_vmlinux1 link, so two existing comments (top-level Makefile,
> vmlinux_link()) now say the opposite; they should be updated.

yes, updated

> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index d5710e900bd4..f39e2d1f1400 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
>
> [ ... ]
>
> > @@ -89,6 +89,13 @@ vmlinux_link()
> >               ldlibs=3D
> >       fi
> >
> > +     if is_enabled CONFIG_CLANG_PLUGIN_BPF_SCAN_IR; then
> > +             if [ "${output}" =3D ".tmp_vmlinux1" ]; then
> > +                     ldflags=3D"${ldflags} ${wl}--emit-relocs"
>
> This isn't a bug, but two existing comments now say the opposite of what
> happens here.
>
> The top-level Makefile says:
>
>     # --emit-relocs is added by scripts/link-vmlinux.sh, for the final li=
nk only.
>
> and a few lines below this block, vmlinux_link() says:
>
>     # Only the final link actually requires the relocations.
>
> With the plugin enabled, the .tmp_vmlinux1 link also gets --emit-relocs, =
and
> on arm64 it gets it without --discard-none.
>
> Could both comments be updated to mention the .tmp_vmlinux1 case?
>
> > +             else
> > +                     ldflags=3D"${ldflags} ${wl}--script=3D${srctree}/=
scripts/bpf/fmodret.lds"
> > +             fi
> > +     fi
> >       ldflags=3D"${ldflags} ${wl}--script=3D${objtree}/${KBUILD_LDS}"
> >
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/429818=
85558
