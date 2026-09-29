Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2634E0B91
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717083; cv=pass; b=XsPqkE4M3BATxoW7d/7wZdV6y9vHi7/eFG0LL/Vt4lLqrR038USx7Z0MFIlg0vJyYHx6Aq1nN/sDWVrBZq+5Ld6TP4RNiB4TePZBC+imT5Sgl2N+e547gZ08IJhbv/h27bDYpxkfBK1gzC7JmEjvi5RTvLem9Vunx0aawWZsFLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717083; c=relaxed/simple;
	bh=iLXo43O7JmOuus9Fwsu7TvH61/8erOqVOuqqIrToHow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pdu55oQOaHiaFlzv4FHNhPax2pV5VXGQHSziMQMFiqHo1IxXHiXgwimxQUS7JDiFJuUapbggclZYLJT5YSnU9WavYv+WuxhhoviAj9V4qUJvUeDuczJrXZ3NGaxy8II947NoN+KxZuqvzRAhTrorDXWEneaBWNqVZG3RoeF6pJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=kZ3JRQWR; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="kZ3JRQWR"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66c9995ca60so988295d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790717081; cv=none;
        d=google.com; s=arc-20260327;
        b=Yy8FxjYZMM3zpyJIjtMlgvA4XGl/m0cDU9uFiuc0AFOcuE7EeIZ4g50JgamEfD+onB
         7wKkNbVXFzVonvgcBMHkpHMHF4CxwMVKTg1d8eO84A97TCjh1tEXLUacL3cBHsPP/3SR
         vsXp56vIv23lt55m8mChENtXBtlMyh8/H2urws6WLx30VGfJ3Gf8QR96qjjM6xTsLCEE
         NEqpQ+NNTkKhD2orrTFTKQOvc0D4sMbwx4skw+RpUI04CNAlQJ0kMrl8fE+wqB+0FXCc
         /J2Pu9If/femRalg60WXPqGgbdF0xitc4R4zFVB5fB8X/iUJ/D+MYJ0/RWED/qw/yTgt
         OcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XsxJSbC/0qpT3PgH/uznE1JYs4z7KKK2Tw1kr61c3yI=;
        fh=q26wS7jh9DjCEN3N10xLFcmqnrYRpwLw1BboYJxcCGA=;
        b=crNSyCaUnITmPP5QuXhD8ZiyWs3EXYcQ4XKh3qVOBSdW2gKFxKiGrC144r/iBPD+Fx
         NlB/JFenlQzC9q5YmmnT3RezamWcTnx5VaKWTuupdY05IdG15ASK6L6FpntTE9Q+QOwe
         c7F6NEs9caAUYQOb05chz6OiZ5F+/Y9jFX9GkfCpy1JY0Z/p4h1LKGOwnL0JHDWE1cep
         m4Ay438C/WuHX0+TQA8AyGs7/8cZUmpqIfTE1Uql9hmNo90AWtP/GJ+EE/Nz4hrpXv9+
         bOSstxL4Uty7DWeaO/6Ddll4wvOkwMIMJnguoCeJrcgOE89Qz1awEq5DdWqWl9fOAtG+
         I5OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790717081; x=1791321881; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsxJSbC/0qpT3PgH/uznE1JYs4z7KKK2Tw1kr61c3yI=;
        b=kZ3JRQWRs+OYJ98JSBjxauOL9k9ApdE0uxNiXuDTEPfbt3NU3XdEkY1NQU3NThkjJt
         dY9ikm7H2XNYTv8wX3lxb1fZlI8oIw751GGU7sh6/uX6L+JA3MNAEexGedR9SIeo4A2M
         T1ZT7YlpGdkqPm15ehtFQF9xXNU3VYHcz//mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717081; x=1791321881;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XsxJSbC/0qpT3PgH/uznE1JYs4z7KKK2Tw1kr61c3yI=;
        b=bfOWXTKVHnlGm86gs5fyzNHr+sIIVtcEYGeLE9r326tqCcTUU4oC7QVdIrpxGrKe2O
         X348VQikHWnWih9iecAYWwxtWmRdxj8fqLv/b7sQrnPi/A4u1Wp2od6ydKf8Dfr6NhiP
         +mK7dfGGk9U1Ko7y6xJBRwZlSxQpdsNVpVgzQJXkITGtIFXA69GXW8yi75HaZQ5vDbp5
         st9ZlRcJZtqZe7rsqH+I70xfNtOuViUSAuOog0ewWM/WuVwq8AGZN/o44lxoWmlgckHy
         5PCvGx4cY3bnexU2PBW6Gk0575FPtv9srS5PmX6I2QqqFFmcWsRyuJw0lYIfyWUN4xOs
         Io7A==
X-Forwarded-Encrypted: i=1; AKwUvByqsBQ6V2hAw+UnZvlS6aL1mDw5GxoIbwUMb7f5nKvAd50qOFQ8DapS7kJ4RCGAmaBJKT2GveVUUmvM0eE=@vger.kernel.org
X-Gm-Message-State: AFuF++mjNMHcSFJsWNcCvfmF+rNCu6kaWfJNFXd4j/58JhJZzm738TUr
	PVMOlYVI6O2xWmB2usVQYkdZc059eaApb4KqFDyPEYHO7sAGkc2oMMOlrV3VbY9HLhAjtrO1a1c
	rYAEUB7du6VN3wQ35MQTksSWcymfo+dVHqxthhMCSPg==
X-Gm-Gg: AYBFou3g9ykXBX6HQ/j6NHF4usgebvy95UXNYBqjrgVpB+otcRwo9iMWDijIr8JNWBP
	wVEc91LjkGVgUso7IsFdYWvQa1/fUUdfpmwh4qQdQdBhblWKdTym0JsyDUY+18u43aB4S4WXjjr
	xXE2Yfv1DKO64h67wgN4KeHCYAEycoj3ItMboDYC7WhnwpIPwpcfxuTnXjXTTKgCmCKdaG+JAcG
	TXTfMLVcvyn0eZdpDBtZvimxwzH7I+pxQpv5saJZCyrYFUOJFo4rCb0CWlHCbrGrTzN6eiDyae7
	K3+QJRitSlSE76f3jppQr79EANHcCd2X5asaB/+5bDCvcL97IOHnQPni2mVRo/gy6o8QkSytFK3
	w/jlJjuejWWY=
X-Received: by 2002:a53:d019:0:b0:675:300c:3938 with SMTP id
 956f58d0204a3-67560b590aamr1239328d50.14.1790717080747; Tue, 29 Sep 2026
 14:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <CA+w=M=R7vMK9-YZufh1ZW7efsVh=vCVkeh2_4rPSAsN=SH8MuQ@mail.gmail.com>
 <CAP-5=fUFWGxNSS+TW4iHqeWu+24-R2rq63oBX19VxkTXnqo+4A@mail.gmail.com>
 <arrhc_7jvX_W2uXS@google.com> <CAP-5=fUuwXTN6kjDrSqygN-Dy3OFuWMH705_tsCXX=dbG747QA@mail.gmail.com>
 <CA+w=M=S3USeLyFNaHSjHL+cmzssWk2Bygahetzr0dNU55TZEMw@mail.gmail.com> <arv-9NWWZ14TG5Te@google.com>
In-Reply-To: <arv-9NWWZ14TG5Te@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Tue, 29 Sep 2026 14:24:24 -0700
X-Gm-Features: AclHuK9U0_hOZFiXzRILk-R0tWVBa5apQWlupDVVHBlduv0A77qNXQe3k2lPckk
Message-ID: <CA+w=M=TFNBOr9Bxca0WmvAH3gSnr3Yc73jsubus=s4WSL-n1eQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf symbol: Reference counting, flat array
 storage, and LRU shrinking
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > That is close to what patch 5/6 of my v3 does. Its index is a sorted
> > array of fixed-size entries:
> >
> >    struct sym_idx {
> >            u64     start;
> >            u64     end;
> >            u32     name_off;
> >            u8      binding;
> >            u8      type;
> >            u8      flags;
> >    };
> >
> > That is 24 bytes per symbol. The name is read from the string table
> > and demangled only when a sample lands in the symbol. The difference
> > from your description is that v3 then creates a regular struct symbol
> > for the hit and inserts it in the rb-tree, because the rest of perf
> > holds struct symbol pointers. If the entry itself were the symbol,
> > with the name as a pointer/offset union, that extra step would go
> > away. Ian's patch 1 would help: once every name access goes through
> > symbol__name(), that accessor is the only place that has to resolve
> > an offset.
>
> I'm curious if name_off would work well for PLT symbols which come from
> the dynamic symbol table.  Probably you need to handle them differently.
>

Hi Namhyung,

Yes, synthesized PLT symbols need separate handling, but current
upstream already has that path and my v3 series keeps it.

For a regular ELF symbol, name_off is its st_name: a byte offset into
.strtab for .symtab, or .dynstr for .dynsym. So the same index format
works for both tables. v3 uses .dynsym when a DSO has no .symtab.

An @plt symbol is synthesized rather than read directly from either
symbol table. Upstream's dso__synthesize_plt_symbols() gets its address
from the .plt layout, finds its base name through .rela.plt and
.dynsym, and appends "@plt". The existing code also handles .plt.got
and .plt.sec this way.

Since name_off only identifies the base string, it cannot represent
the added "@plt" suffix by itself. I think we should keep synthesizing
these as regular symbols, as upstream does now. v3 only makes the byte
cap apply to them and, in lazy mode, clips the index at .plt so a
preceding zero-size symbol cannot overlap the PLT entries. With the cap
disabled, which is the default, PLT synthesis is unchanged.

There aren't many of them. On the sample fixture, has 381
.rela.plt entries against about 319,000 .symtab symbols, and the other
binary has 100 against about 637,000. Therefore, I think keeping the existing
upstream path has little memory cost compared with the main symbol table.

Thanks,
Alireza
