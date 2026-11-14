Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794678404;
	b=g1iq+v4nNENflEAgQBdKfJvC8XzEn/uTT/vcAAGR9Ub5f+6fqF10aqoKGfO3KVHVSEqB
	 ncUzFJL5dyE30TcBb+1j5ZiaFlgR63/o8zfd8XvA12owox7+vRTXk046gJdervVNRdmuW
	 FKbzhtYomIXoMaK96WgPIJzIyIALa+VF8knJqCoq1UJ4un8xaIUfU3GDmXyWb70uQyCmM
	 1KKs/0RmqfjuTLCRBedHmApLeQtTNPyQPrNgcEpQNQwF1ywA/d7hR1nffpLKsdMAodvqA
	 K+RCPiaqkfXc4T8zQZ7WFBszFyTkG4g3UJPlVtMiYPyMOzzf3cZ1SEsM9r5jtZxJapg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pYqZh4XlswEo3j+2ZthYHRt3Pfc8EeD6RAuf8AYBUIc=;
	b=HScOyTDPvjM0GjOlIkbpfB+w0vtnZGO922HsPu3r7f8CEQVqiuectQJG0tvSpIt+3ePg
	 26MMxiCA2IXXzoAFnwFuvlG2P4x8bYEuoRqgv/WjUTBhWPvRJkECFb8xUYvAPJnl5D5+I
	 BjUuzLEq6ByUNTUskbMTCovkt+8VlmAKiUgIwCo1UkBmWHl2YPxxPJ5WO0ZD05y0+rMYH
	 mQiQxypa94hhCuS4+1L1LObe0hEZlz2QeItGU8LdIduqM5T2K4WtE/rXzll6ua/B8EEN8
	 W5ObTD4dTLNuShtOlvxrbynEd8odlD+gIO2/zl7B46nHZgd8AjlmjIJ+OutuJqnf1KA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8AESTwR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6209F606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6209F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8AESTwR
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3362077a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794678403; cv=none;
        d=google.com; s=arc-20260327;
        b=WoljusfhUeI0ZGc3KXzGkenSCzwqTaXvalSzgmSVP+SUT6V3CkJCTL5tJaylGPRAlb
         q2BPvjC9jmdvq3pcXS55xqb88YOH0qSTmcOtjGmRecGkM6n7XxkzRVPr+vwxVloYjr8p
         gPpDf4vlcn/q1XT6ONm8FMpKXeXfgfMxolHWRbxlxvC1vTzQuaVp3U0qhWaw/WvYG+R4
         H0lhAgI0QxRFF2AbXoob6Pa5NnVDRLgVO1luzofICR9Pq8GsZynpbzbO7Aofb5kaIhVp
         O0YlOdfWpU8ebpbGO+MtQcgJlXWHzH9ZC9k6sqFOMzhoMGWavT6rE977WD0ILzHBBR8X
         DW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pYqZh4XlswEo3j+2ZthYHRt3Pfc8EeD6RAuf8AYBUIc=;
        fh=YRizTr8ze8uik5WKSAUzyur0LzXOPijBRvNGfbPAUGg=;
        b=hoEcSscTBndiNFQbB+9Vy2elME2L3JAxmby0mKUjA2/IznWHuj6Ow2CrlVKA18MgdQ
         EE5hNbIwu3ijj5MsJBw+lVHkxzSs93c7yhdOtpLS/nDmGVQtuv1ixSF0r6gY8wJMI6GM
         dSgyDim+OG9rJjipTI1+0F5IetHl9HZVn4LnOd3D5H5jhLvQ/Css4czHRqEnjSsPykUN
         xFS1A3C1OJB72QRxRhB77yjr7b1brSOld4du4XbawYM/zyQTid5Pjbuf9ewITm7qi6NS
         AA06cIjWKr94I50a3YJOIwyy/byCsXYc3nldluFa9bI1zf6ySbH6TiOShkQcyHN60pxm
         HrnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678403; x=1795283203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYqZh4XlswEo3j+2ZthYHRt3Pfc8EeD6RAuf8AYBUIc=;
        b=T8AESTwRSBK4+s5Y1XiUDYreObOu9Sg26aZfY0inbg0QZTuP1DIYuqbw9iSECjZK0Q
         t4PO4P66xOEyHQBO6S8KvBCAbny/2vO/bjQc8W1zBgkUD0Gi8CsBuLheNZKVBkriXp5V
         awxQ3k/2MLtrmFc/un7VHYTL7u090Ze77kdGK0peZap+aQgFPG4cvQaWv9iycB6naqRU
         VNZmD7nQMw5i4FJUBVAHJtYXP1TL+cWGOr8+9sIhGx6WtQoqH5RSAh6ByXqJ/9cPBSb7
         ydhBXwt+MgLQqzK80C6iSLUsz4cQCJ6DfjiBAC2iR8Fe+77Ze+21NO1MiRSC/VtzVUAQ
         odNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678403; x=1795283203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYqZh4XlswEo3j+2ZthYHRt3Pfc8EeD6RAuf8AYBUIc=;
        b=K7AD9n8gLOxtQVqQoVfpzWVhtjNkkzwpVUBcpnw/n2DCx187W2yQs5AfPtJHFQtubz
         eLVMlQB//8NB/+FQkuHL7mbb21nSUucVUHfoEeIPUfJe6BY1xsY/9Q4RonjKaB9D6LYd
         9XTog33cHXpArDKl47xwjDWDkrYN+yxg6Gsklp+UEJYJFazmaimXy1+9L3he6x9bNHxx
         IEmNtPGoiB+pbtwvg4Q4bDboYhWdz23nGYrHJnjiJLoBxGJOWhSTh7rQ5WW1QviF2GmF
         oxkyvNPDWOMFU4jC3zg003cdSqWCagSjuoJeSSz+82eHUFuRvrfauFubgs1vVlWQe6OM
         L4mw==
X-Forwarded-Encrypted: i=1; AL+hErHoCYVvOtYeErhabQwAftSTPtI5/MFeJcKWV9zBOKtSZAlRDsAxU/czD5PDjjkoc6D0CNbea4kaazNvfM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EGy8QxB5wRGpEjkBxdTCKC5YiYW1ZQ+/Vs1iTlkXPN5LlF+ho
	mR7XDhRphAfbosi346Yrv0PnN9l68N8/eXqNk45ZUsQUM8PO91+siV+y6B0DjUFSVDfPBV7igKE
	rb8IL/NwdNOr6Uc55li+Usi0BFkMnAe4=
X-Gm-Gg: AYBFou04M7eeW72LLGWxKW4jdlN+qR/857uZ9RQva8KZf06ETy2mCxHyNd5mxGSIaeh
	hMe494LEIVvCYMcEKSaZk7VlX70w9jjOnpSefNIPsLCa3WNi+1NOJQnkvMq06i510/rDbbQWWU0
	carBisGspGqdIHGewxvKiJAEyTaGfP1v0VcwgTKdIaHuj4pxGQxD04FAQK9RZKfKaV+JW/r++ui
	Ii2gjkzcp7iOpHwg5fYcFw8OF2sylCBL2dbAGG/n2zcyjA1bHlCcrndq9shHoeL5XNA6s4vyQuw
	oQO7CgULt24xuZOiwxuY8Npnem0zpp9SiS2UcIZb1nw7JFTpFkkehEMGCs55+p2b7yf+Ost92Yr
	QyeUA/6Q32lkS4+4ttekfFWCor0AYOFvRvx5TMzBGn2uzzFDHJdD+96S8l5KRQ6TSlpGoZErbkz
	bdDFSbUewTpBMiUFBiN98SJhU=
X-Received: by 2002:a05:6402:42c6:b0:6b5:76be:be54 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fac2mr5086521a12.35.1794678402519; Sat, 14 Nov 2026
 09:46:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114094826.1282965-1-linmag7@gmail.com> <20261114094826.1282965-2-linmag7@gmail.com>
 <CAEdQ38FMuOzdFkU4RQFhZJkSiczzVLu-eBiZmjwpiUUahDvjCQ@mail.gmail.com>
In-Reply-To: <CAEdQ38FMuOzdFkU4RQFhZJkSiczzVLu-eBiZmjwpiUUahDvjCQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 14 Nov 2026 18:46:30 +0100
X-Gm-Features: AclHuK_W6ympXicZilhjs-sdGjEUv0-83IxfodgP5fKhvBWmh_RZR9-nRq4qQUw
Message-ID: <CA+=Fv5QzBe_+k9C6ThbVV+Ou4My6Kr9qjFMsf2c+Bkex5_D+3g@mail.gmail.com>
Subject: Re: [PATCH v3] alpha: Add support for HAVE_ARCH_JUMP_LABEL
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Nov 14, 2026 at 5:54=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Nov 14, 2026 at 4:48=E2=80=AFAM Magnus Lindholm <linmag7@gmail.co=
m> wrote:
> > diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
> > index 850f1265cc55..4088cd56866e 100644
> > --- a/arch/alpha/kernel/Makefile
> > +++ b/arch/alpha/kernel/Makefile
> > @@ -92,3 +92,5 @@ obj-$(CONFIG_ALPHA_TITAN)   +=3D err_ev6.o err_titan.=
o
> >  obj-$(CONFIG_ALPHA_TSUNAMI)  +=3D err_ev6.o err_tsunami.o
> >
> >  endif # GENERIC
> > +
> > +obj-$(CONFIG_JUMP_LABEL) +=3D jump_label.o
>
> Nit: this would read better up with the other unconditional obj-
> lines near the top of the file rather than trailing the GENERIC
> block.
>
> > +#include <linux/jump_label.h>
> > +#include <linux/kernel.h>
> > +#include <asm/cacheflush.h>
>
> Nit: checkpatch --strict suggests <linux/cacheflush.h> here.
>
> > +     if (WARN_ON_ONCE(disp < -(1L << 20) || disp > ((1L << 20) - 1)))
> > +             return false;
>
> Thanks. The target is always within the same function and Alpha gcc
> doesn't do hot/cold partitioning, so I don't expect this to fire, but
> it's a cheap safety net.
>
> > +static inline void alpha_patch_text(u32 *site, u32 insn)
> > +{
> > +     WRITE_ONCE(*site, insn);
> > +     /*
> > +      * Alpha needs an I-cache sync after patching executable text.
> > +      */
> > +     flush_icache_range((unsigned long)site, (unsigned long)site + siz=
eof(*site));
> > +}
>
> On SMP this is smp_imb(), so every key flip IPIs all CPUs once per
> site. That's correct, and fine as a starting point; batching via
> arch_jump_label_transform_queue()/_apply() would be the natural
> follow-up you mention in the cover letter.
>
> I applied this on 0b4cadbe7c39 and cross-built an SMP defconfig with
> JUMP_LABEL and STATIC_KEYS_SELFTEST at W=3D1 with no new warnings. The
> patch sites in vmlinux are the expected 0x47ff041f nops with nearby
> targets.
>
> The diffstat in the cover letter is stale (63/146 vs. 65/148 in the
> patch), but that doesn't matter for applying.
>
> None of the above needs a respin from my side.
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>

Thanks for reviewing and build-testing this. I'll fix the Makefile
placement and cacheflush include when applying it, and refresh the
cover-letter diffstat. Batching can remain a follow-up.

The boot selftest and 30 module load/unload cycles also passed on
my three-CPU ES40, including cross-module static keys.

Thanks,
Magnus
