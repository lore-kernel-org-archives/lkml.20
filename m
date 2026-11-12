Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794507230;
	b=p9kSAaOBuOO6IkADYcpsrU9neel7T8ObDBDiJH8HXQj2w+44xLHaztNHCdmOod8GLf0H
	 lNNSmnXkVruFnckZOA6sZs/NAoJt/uxdYV10y1WDasFXL/q3nkMR3ZdhSu6jLieyTLsGR
	 DZKeLQVMGmJoHcJohE+nSKw05AHXx1Re+JD4/9wMmt+OdYQ1wLhYUVzlWFLgN1tqk73sX
	 3rEXFzZUfLdT78lY2KrVM5i8uHbjJLD3LBaQJyGWRDFWSPBXjenTXt8mZoEt8uvHWQQm6
	 hO/15Srf8BlSmeiAvTdausYUHq/xCbSl0fHA40A+RNXnG29a9m3leZEQq5oXC7bRqNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rZ6GJC7hEGwULDynH0oTCtdmn91ovRHlyRCH+X3ZTes=;
	b=XlBIfzt9+GrC4xucD50twUxf/MCv1BTc1cFzl0Ib+r9Vh3+t7Bk/b7H3U1V4+PGNENhh
	 LuHCgnE0OlOZgspC9abcMq/H/Pw0cMgjQjSJopwgFDOhtPO7ZNzsVFQ76wD+wr/+7rVJj
	 39q/0yCM/lxZmwswjmBUCoNtltZtaDOwl1UdRvzSSC4Ib6L2wYOPps8txTp5gpkIg9FXb
	 9mnSdbMj8gjG3t/w7SjwZu1LdNX4KkA5EyRlPCmAiTFJFfYwb/sOyFFmOX5CPdQsxMOoU
	 ELxsP5xiBATu9mCTcpqlgqA61KspkdZdZ/8gRkTiwjkYf7pJtGnpzlwQZEPOHWkcbbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QAOT/jUa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4583606A890
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4583606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QAOT/jUa
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so11931cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:13:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794507229; cv=none;
        d=google.com; s=arc-20260327;
        b=iW6/EVx7mwRA1xMbJS4mkMkiCc4XW/N3F1xFtS4LRmIRH4uizNEhh8LGMcaDYOsyic
         YaJQleKLhczKvyIqjrcUac5EgRlYIUOTSvYo2qs1gCsJ6wty9kY1K3f3bWVgakRzLeXh
         RBXe0RGYmxnRyiqB8+YLXQePwAdxwAyww/5Km3WTFRN91rL5GvRZ677Ld2joGcWgdMFi
         H92CTLg3JbZUaUmFhsEun/bvddkhPJHL75tmfzBaAnO4iLGm2ZLUdgCpICVSKxAHr6NM
         HdQ5PymAN2HrhJytWGuPC/ONsexoGwWxKk8lQpZaXKygB7UH3hRVvjIik/uDHWBw11t4
         Em5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZ6GJC7hEGwULDynH0oTCtdmn91ovRHlyRCH+X3ZTes=;
        fh=ihqDNMZrLspwU3P9wMiLA8DRy672C4DYCMwPDccfMJA=;
        b=XuIGkHwRLKeKgWWkefyP3MTWxK8P4zNKbALPwd/NcaSC1kEvOE69kLhBECzUD3LCrd
         O6VRdoWk8fhsgAinjM7gSOm+XvaAIKkRSv6cF51C+3uX2fxsOKWpkNKsJ2thOSO1GREM
         J8mgIKZLDNQ9wWwWETZTbumjF6HosWB9haq/y60AhDoaivCMH8kfM/g6/cPLiSCHFTl+
         XibXrT3NNDxpTRnBAMv1Pw4VL4bLcLHAyTNsUNY34oBcll6HlDV+BJ8Ro52MBQOB86Ry
         Mmh/Q0UTjzkDJymZ13CkWvHJ3fdY6bSbwh/smAJEhvgcEvbCbDSIQAAyMLESt3Jh9FK1
         /QjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794507229; x=1795112029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rZ6GJC7hEGwULDynH0oTCtdmn91ovRHlyRCH+X3ZTes=;
        b=QAOT/jUa1ge+FjhwHcidPWqHm+YYo2QRnirCuBNYMGRauQmP4nWTzYMNyQy+u3k+zu
         tKbYvx+UacipiubMSX2t0aNrINRm7JGqNgE4HnDn5ONmnfqtBlekoPiY6RyY8TJZdqB2
         iMPSQi99rEXSAFVRN+O5374t02u1cDpUtC9gCdwxOQi1tDaoYnuxIHmFNDKqKWxTLKbS
         yD/UvRB7ECUE0FZhxd0sv0OzKQeI5b7SSgNPE5jKeoEhoVTsDve8pyILpbnScp/cH0k9
         e0x9cHDKovRAfsJLx0KDxuQYUQ4dTbRAqXvjFi+foSzaKIMiYm0P/fJ4606JrVpwnrVb
         ZQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507229; x=1795112029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZ6GJC7hEGwULDynH0oTCtdmn91ovRHlyRCH+X3ZTes=;
        b=texC0diVB5Fr8m6GizFsGJlf/RzbXxVC4YDYPNy8BZ5Ljz62SAgQeY1Mqy/DpvdSla
         cm7s93c5AkalIdP1KRcYRqcU4t7vaEISJ252zoSbqw3a13AzdlD2K97ZPypKgSi1JarL
         CSxlHGbJO6yAHYeZnzSOX9cjdxrfnBQuKredOmPJ5piW13DLV6Wf304D46M//KeqO75N
         tGuyqS6otlrAyp0hIa1LNsApFcVJcHYjMy0Fo0/Bu4Bj+Gfn+pUddPKnnCdlP16MjW5O
         i27aMs2fwk8CFW5dkhx/ASR0U+0eaH6wHFJja07tQzLXK4NY888XNLMsoTQzoUvqEocU
         RdUQ==
X-Forwarded-Encrypted: i=1; AL+hErFuJunQH/Ce/MPjGNlJC3if5CmgDc0HSpsiCZYdCvz9vYtLfRJlfVnJ19iplTzqKTnukNLa/Y4Dca062I8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ti/sjcwSoObF/oqECHzf0z+zx1Z/19TAelaWhzkQ+4O1xkA2Z
	cbWC4ZuDHGB32x2EieW2ogjaImoH4sC/mKjpsuhXJs4oVTlo5ZC8C4j9EORYFLj8CPvooZlGPKz
	m8S4Wj6AzXu/6i7layI6Gau3vfmYNdTB9brDBAjKM
X-Gm-Gg: AYBFou3atgm+ZY3kcg/kLbXUvNQ3zT8NRZkbItJLN/NTo44pIIpLKUKkt9WXz7jwKz6
	r+owZ6Pb0ldvjvvIqjSt0cGLJM9Ft67lItc+ErnmVT+8ONL9+F7QPbArWZwoDeJy3ZTWamevTED
	Pdi+pRn2qtCGkjMKxCvKKfq/0APuaYOexvxRLp+33V8up9EVzpR/muA9ehGZ7ncZMK6aQ1QpBPo
	abqANK27XiMCklMHU8FP9i1kDmdjwPmHC+IbQv74ycW5fU5FY2LP2WdZCSlhkf+t/Ydpq64C/hm
	sFYK0kcjN2zDEFCdlR9BukMv0lO0QKd+fRneRDmslbTem5ev+O7fKcPl7eygyF93TK3IPWvn6Rv
	saAcECMwagOdkeo+R0E89vg06bZNVyG9cK9NV/xv2uic5cx4vhflg1PgcMlfb09KTVUQ=
X-Received: by 2002:ac8:5c84:0:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-5598d505571mr21838081cf.9.1794507227881; Thu, 12 Nov 2026
 10:13:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104043006.1199857-2-irogers@google.com> <d94520950f855a1d5ac4b51975988b70185ba7da61836aa84b044b69e8104bbc@mail.kernel.org>
In-Reply-To: <d94520950f855a1d5ac4b51975988b70185ba7da61836aa84b044b69e8104bbc@mail.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Nov 2026 10:13:35 -0800
X-Gm-Features: AclHuK_VHOAaoYtWAecnECui2dC3TEgW3VbUrZGpnHMy0F3WB50lMjG2hgO8I_c
Message-ID: <CAP-5=fWekVEnxS_eSGsrCPM2XzoY=Z5fkYYK_dD6MGgxX3N2gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] tools build: Add explicitly sequenced -lzstd to
 libbfd feature fallback
To: bot+bpf-ci@kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
	qmo@kernel.org, jpoimboe@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, james.clark@linaro.org, leo.yan@arm.com, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ast@kernel.org, martin.lau@kernel.org, 
	mason@kernel.org, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:03=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > tools build: Add explicitly sequenced -lzstd to libbfd feature fallback
>
> TL;DR: Possible build break at this commit: the libbfd -lzstd fallback is
> removed but no consumer uses the new feature test yet, so perf may fail t=
o
> link and bpftool may lose JIT disassembly.
>
> > diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefil=
e
> > --- a/tools/build/feature/Makefile
> > +++ b/tools/build/feature/Makefile
>
> [ ... ]
>
> > @@ -249,18 +250,21 @@ $(OUTPUT)test-python-module.bin:
> >       $(BUILD) $(FLAGS_PYTHON_EMBED)
> >
> >  $(OUTPUT)test-libbfd.bin:
> > -     $(BUILD_BFD) || $(BUILD_BFD) -lzstd
> > +     $(BUILD_BFD)
> >
> >  $(OUTPUT)test-libbfd-threadsafe.bin:
> > -     $(BUILD_BFD) || $(BUILD_BFD) -lzstd || $(BUILD_BFD) -liberty || $=
(BUILD_BFD) -liberty -lz
> > +     $(BUILD_BFD) || $(BUILD_BFD) -liberty || $(BUILD_BFD) -liberty -l=
z || \
> > +     $(BUILD_BFD) -liberty -lz -lzstd
>
> Can this leave perf and bpftool unable to link libbfd at this commit?

So the concern is that at this commit, not later in the series, a
feature test for a libbfd built with zstd that previously failed to
link in this feature test will now succeed, but the parent Makefile
will not pass the -zstd flag and so break the build. This issue is
fixed later in the series by adding the -lzstd. Will this impact
anything? It will turn one broken build into a different kind of
broken build. I can reengineer the series to maintain bisectability
but this seems like a low priority issue to address.

Thanks,
Ian

> Nothing here reads the new libbfd-liberty-z-zstd result.  Neither
> tools/perf/Makefile.config nor tools/bpf/bpftool/Makefile calls
> feature_check for it or has a branch that uses it.
>
> On a system where "-lbfd -ldl" fails but "-lbfd -ldl -lzstd" links, the
> parent commit gave feature-libbfd=3D1 through the removed fallback.  Here
> feature-libbfd, feature-libbfd-liberty and feature-libbfd-liberty-z are
> all 0, while feature-libbfd-threadsafe is 1 through the new
> "-liberty -lz -lzstd" fallback.
>
> With BUILD_NONDISTRO=3D1, perf's Makefile.config then passes the threadsa=
fe
> check but takes none of the EXTLIBS branches:
>
>   ifeq ($(feature-libbfd), 1)
>     EXTLIBS +=3D -lbfd -lopcodes
>   else ifeq ($(feature-libbfd-liberty), 1)
>     EXTLIBS +=3D -lbfd -lopcodes -liberty
>   else ifeq ($(feature-libbfd-liberty-z), 1)
>     EXTLIBS +=3D -lbfd -lopcodes -liberty -lz
>   endif
>
>   CFLAGS +=3D -DHAVE_LIBBFD_SUPPORT
>
> util/libbfd.o is still built, so the perf link can fail with undefined
> references to bfd_openr(), bfd_check_format() and disassembler().  bpftoo=
l
> goes down the same chain, silently drops -lbfd and -DHAVE_LIBBFD_SUPPORT,
> and loses JIT disassembly.
>
> The consumers are added later in the series:
>
>   6eb66acc776f ("perf build: Add explicitly sequenced -lzstd to libbfd
>   feature fallback")
>   155513d3a59d ("bpftool: Add explicitly sequenced -lzstd to libbfd
>   feature fallback")
>
> Would it be better to keep the old -lzstd fallback until those consumers
> land, or to reorder or squash so that each commit remains buildable?
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/417749=
22004
