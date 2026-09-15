Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635193537CE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512474; cv=pass; b=qDZ8dOQ+IFVJVFFVz4dP8tKKln4Ec/HtNfh3Vty0xqMcPmZorEoGDG3CeJxTm8CEp/MB2fHzEXrwLRMbLnky2H5p0Moy+CzEqnbtZgUvuprWTtbEm5YDxkpaF7OL+roo3sZ+e1KCdUCL8jr77kMxe4UMBpGjSr9NrI7yu8dioSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512474; c=relaxed/simple;
	bh=K/9mED4ZX2KnnXPYApAO89Oc0PE5YcQZLPwaOMSiEjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxP0kpKlNSIdJj9wINoXD6Pq/TOHWp0UrwVBzhsFqxtdBl2YB7OF6wrMDSlPih5v1u3uJadtsJD7dA1/0r1Z6N1cPVKg23Mov2gp9l2B4B15ue0DLC0W1KUvUAbac529E8DwI4X4iDLSoD3/EffK3ragiz/6/BOu4olSit8zm/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dgq/N8BL; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dgq/N8BL"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso48631cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789512471; cv=none;
        d=google.com; s=arc-20260327;
        b=rrXnqNv8nmAnLFJeJzQzMlqtlxzqWWCURuIcMWTQXWt0OQ+V4uzBYR/nzWsJa0BICS
         /QXNniF2So1DCi/VicRE6WxmFewoGuasKhNKdAgKDuEmXj7SDuSDyLDtirvAbgY4A04I
         wZC4YpWBp9LdUZ/4kaybKPpzM55KxJX3dSjY9TzNuuCO5X8uChRtgR9BSt5Lgu4XAeT8
         bz2th5c0rcIK7ViXGkMTIVehB4Cehqkb5OfBhHQg4zk21ZHhh9WLxObhaw4xHZO8Uyoh
         AMcooJIcw8CSjoIQ9zsL0JmdDUFik2d+2jc4zI3ZVAabGyM9mTXCmQvVe6M9eF3hrkFy
         7p7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1kJU972nhxr0oYN7s0pa4Eed7ywOxMHPce+Z/KsbuDY=;
        fh=aXdPfiuIMd1faXdj3t3Vi4ehfglXoh8GygSnzBzUKGk=;
        b=FyurOQe+HVpmnNsTQCUn0JJaGM0P0T1nl/ha6DOR9Hm1rnsQIB7vmYpbNswndmkRep
         jETSb2C7Y0qw7PxGi0enUyM+P0MM6UcYSJ/kTpQuHmPvhscbN5EJ9ukuniE646vOf/1s
         yyCAS6R4T2+yYuo8hjZ9eumKUu1M1SCPh8kE3GojlWiDO1y/ijHbTQ/uIFckhvlPO5HW
         5SiqGD76/dJmSzc0DfBwEhmoomkBRXJfYJdZ48kvsC1I+ZOIH/90i3M+Hx0i4+KQQqE7
         KfL4pgtLrNxAvFExStk+FA6WiSF4j2HwYNxtlDHcXhyF/U1Jd1qotPH9y3ctwSHSlrH4
         6V7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789512471; x=1790117271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1kJU972nhxr0oYN7s0pa4Eed7ywOxMHPce+Z/KsbuDY=;
        b=dgq/N8BLOT8iKnlEs4jkHpj0292vnkjqohCIA8o2rT63/TGtAVjxLttZBU7nS8i+Sf
         dOj+INOFGhSELxbbV2PdzZB+vjtmnhU8jmeN3tWbQx084Bnwd4qE1LNLgVhEw2VI6eiy
         c86zmt0vAxQxJUc+YHtQT/fX7SSMXgI6u8ZJT4zqgBnubqHhSKvDB9LpCgnUEyKHpVO/
         MHos19Y/YKhfHBkb2VMaI6Xq/7NVZ68lizM2GKHtiI5HgMHKxdrOLiw6SNAuqg8MLGhx
         829H4t5hp1HRJ7Je6Ud66kyxg0Gt42O9dyZF4LCQIQdLRTKpgOODaCPeTe5PMQboOrOf
         Ttqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512471; x=1790117271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kJU972nhxr0oYN7s0pa4Eed7ywOxMHPce+Z/KsbuDY=;
        b=z+4ml4HN8R3/9ICjf6/f8vnJM/ROHhT5kA4njL2MNyf8w2XEOwBP1VfaACnwo5ylb8
         HJgPw8dS+29lCfFP9AsAp9e+bs7BJBrLHskhjhg2lWLUODT4M5l+OmuJuBegCOyYoU7d
         dMUSvdfklOHREAexPTNPVwGEdOKU2iWOh9wF3R0AXw8/HoRVlr4GWOt5cRHC4nDd6S4j
         nr73pCrYQtIGO0VNygC2jvKPKuwEBTlVFZZ4iY83xjbleM0ZTb3TrqA9dZnCULpTW71B
         E0wz3gxY0DneHTAUdvGdYDpBgylZ8tJptOA4VnZ/4h1PkfGsb25MjkEmWh3tH+Ni7BKQ
         xRog==
X-Forwarded-Encrypted: i=1; AKwUvBxdgIzkAJNS230ZNrQ7oY1UU6Vt3j+V2w9Rrc6YZOtKfWQjQGtFlCFR49zk5E33i+NwyoFVS2f+r3XHN7k=@vger.kernel.org
X-Gm-Message-State: AFuF++ljXGf/DKS8yb2dKD+QJVCetgi8oKpI00gSl83LXX64Dk54eA8n
	E1cLLYbL4aj8nVt4I27zSFGfWKOtno8MHGVl+KKaC+rUxr3vkTUkIWeWqK/t2GoSqgsVoUwj7Nq
	XKDQcM7zHRw1E1IOnJHqOcm6LmWudm3P4SZ1XBIxB
X-Gm-Gg: AYBFou3boB6WEa/V4agDCnWNFKTnaQ201IlIeVjrPVgteHFUr12cLhmzPt7CM7ZL7tR
	nJGd/YU4b9duTnpnfG+iltMq46NAVM0QxSYQsyf14FVm8e1O7ScXoWjgn+p857/2nEZ+S99Pnr5
	km6SKINYVcYJFpyyg/VCkcWOLrN/Y4OtSIs4FsxTJo9vA3oXuJXwaNXSt5qJyVuhBFQy2f+OqJl
	nB5WPh41JJS8pWHpr0yLqNlN2ZeHIjMJUyo4iDKANvTraiJuAwzB/UjOjj9Wa3ijJBM6hEKqi9x
	XHat5x9sxoE50TwIRNV0885+lZmTsHRlFeJIyS1+ItQIKWJBCzNE4E5R+0SfsUtn7AUL3bqozYV
	d0IGPpIiiOdM=
X-Received: by 2002:ac8:5c89:0:b0:530:4182:5a95 with SMTP id
 d75a77b69052e-5327ed7f4d6mr2342311cf.2.1789512470852; Tue, 15 Sep 2026
 15:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423103530.3938202-1-frankljpliu@gmail.com> <CAHirt9hJ5tTnWhYFZM6TvaTyDxGcRa=zeta8iv0DqqxgfKUQFA@mail.gmail.com>
In-Reply-To: <CAHirt9hJ5tTnWhYFZM6TvaTyDxGcRa=zeta8iv0DqqxgfKUQFA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 15:47:38 -0700
X-Gm-Features: AcwNN1UUaeX8wx9i-c2Bki3XqdKF-GsNI44_GPYYRpAwt8QP5egO4H1Zo-q5DQw
Message-ID: <CAP-5=fX37WjSviuitD8vintyY+EERwB-GMPpitarBqPFk49A3Q@mail.gmail.com>
Subject: Re: [PATCH v2] perf annotate: Fix NULL pointer dereference in loongarch_call__parse
To: WANG Rui <wangrui@loongson.cn>
Cc: Jianping Liu <frankljpliu@gmail.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, wangming01@loongson.cn, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jianping Liu <frankjpliu@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 8:53=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> On Thu, Apr 23, 2026 at 6:35=E2=80=AFPM Jianping Liu <frankljpliu@gmail.c=
om> wrote:
> >
> > From: Jianping Liu <frankjpliu@tencent.com>
> >
> > loongarch_call__parse() dereferences the return value of strchr()
> > without NULL check:
> >
> >   name =3D strchr(endptr, '<');
> >   name++;
> >
> > When objdump output for a 'bl' (branch-and-link) instruction does not
> > contain a symbol name delimited by '<' and '>' (e.g., when the call
> > target has no associated symbol), strchr() returns NULL, and the
> > subsequent name++ produces a wild pointer (0x1). This leads to a
> > segmentation fault when strchr() is later called with this invalid
> > pointer:
> >
> >   #0  __strchr_lasx () from /lib64/libc.so.6
> >   #1  loongarch_call__parse () at arch/loongarch/annotate/instructions.=
c:29
> >   #2  disasm_line__init_ins () at util/annotate.c:1205
> >   ...
> >
> > The objdump line triggering the crash looks like:
> >
> >   bl              98824   # 0x9000000000641ea0
> >
> > Note the absence of "<function_name>" after the address.
> >
> > Rather than aborting parse with -1 (which would clear dl->ins.ops and
> > lose the is_call attribute, preventing the TUI from drawing branch
> > arrows and navigating the call), follow the same pattern as the generic
> > call__parse() in util/disasm.c: when the symbol name is absent, jump to
> > the address-based symbol lookup so that ops->target.sym can still be
> > resolved via maps__find_ams() using the already-parsed target address.
> > This preserves is_call semantics and keeps TUI navigation working.
> >
> > ---
> > Changes from v1:
> > - Instead of returning -1 when the '<sym>' token is absent jump to the
> >   address-based symbol lookup so that maps__find_ams() can still resolv=
e
> >   ops->target.sym from the already parsed target address.
> >
> > - Link to v1: https://lore.kernel.org/all/20260423053102.3717015-1-fran=
kljpliu@gmail.com/
> > ---
> >
> > Fixes: 4ca0d340ce20 ("perf annotate: Fix instruction association and pa=
rsing for LoongArch")
> > Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
> > Reviewed-by: Ming Wang <wangming01@loongson.cn>
>
> Tested-by: WANG Rui <wangrui@loongson.cn>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Thanks,
> Rui
>
> > ---
> >  tools/perf/util/annotate-arch/annotate-loongarch.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tools/perf/util/annotate-arch/annotate-loongarch.c b/tools=
/perf/util/annotate-arch/annotate-loongarch.c
> > index c2addca77320..a949b4392dd4 100644
> > --- a/tools/perf/util/annotate-arch/annotate-loongarch.c
> > +++ b/tools/perf/util/annotate-arch/annotate-loongarch.c
> > @@ -29,6 +29,9 @@ static int loongarch_call__parse(const struct arch *a=
rch, struct ins_operands *o
> >         ops->target.addr =3D strtoull(c, &endptr, 16);
> >
> >         name =3D strchr(endptr, '<');
> > +       if (name =3D=3D NULL)
> > +               goto find_target;
> > +
> >         name++;
> >
> >         if (arch->objdump.skip_functions_char &&
> > @@ -46,6 +49,7 @@ static int loongarch_call__parse(const struct arch *a=
rch, struct ins_operands *o
> >         if (ops->target.name =3D=3D NULL)
> >                 return -1;
> >
> > +find_target:
> >         target =3D (struct addr_map_symbol) {
> >                 .ms =3D { .map =3D map__get(map), },
> >                 .addr =3D map__objdump_2mem(map, ops->target.addr),
> > --
> > 2.43.7
>
>
