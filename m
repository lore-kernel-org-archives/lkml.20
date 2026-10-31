Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793467352;
	b=Ac2iC0TOqpNIH1cC5rTHZwilYghpFCcxmR5/DisR4tGV0hOKYxgoG5S4g48BNozsvBas
	 vYmkobSihBrYyCKhPqbrsOLRnUAhwniZ0hZCz/Lzo21h7KMRifdRtI2gwDNTtw2pzxQsY
	 PSqUECVp/1/TiYvq5/JvMWNQvLXBvitGfYiwtJl92XtAvVhS6t9QBFAeL1ZGbdaKgmnFD
	 19wz4mIdtT5rg2jWuPa14zxy7k8iiqELcCKSHA9Weal2JW0OpQ9xFBcD9xlYtl0OZGdsR
	 hfZdU7hUntKysu7/Ra0Q1z9stYeJQfXsCBGZ5aiimSCPoZQ15yUA9+Wm7H7kPxqSarw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793467352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jC8OcSeHRdd3RsVKGpoelDfISX3MVzmR9xKrD5ogJJM=;
	b=ISxFhFUDvwHjzGjrMqBow5dX503MpgIeLWKLyo7l5HVW3moCPP18mSxjbSlMESZ/fpZ/
	 LQdarJv1+FaWMjBRD6adwBBNc1raSBZtAlMqtTr0BdXZXx9vR8C0DC30+XuiWc3H+bpvt
	 wi5AFIzK1/dQwl4d0EV3KGXDuuKeeOyeZHb87EbYSiLOw0fDjxOFUvVKk8tKbdc0ROA0t
	 5fEbzQSxFM4Co99eO8coAXSRJlTfrTdjmnc/DwIhKgAWjXr2m4frCOI6muLT8vD4SSOx+
	 kU3b0vVC5JWskV7MpfWJnix+O+ZF3PLfAXa6zehqeLlHlXWKWwDGPnmNOjtZJB+D7XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNOMowRp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE9E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNOMowRp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so9991145e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793467351; x=1794072151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jC8OcSeHRdd3RsVKGpoelDfISX3MVzmR9xKrD5ogJJM=;
        b=VNOMowRpdd7dZ4omQg/uRfJZqCER0Y9T5v4SO3h5ffrxJCIVO9Ec60GLh8eXGczcir
         7WrSYNchSOHE2w6UMqQrL3feGtET38O4aluFLsz8vQoJHS6PC5R5R6jrgLT/6QILXfmm
         KRGiBrZWIOMOiTWP18jlPO1f4lA7hYSVPYylKQFmQ0NqkqBemk3uDA2AJ/sM60k4Wjpn
         XrGCx0OlrWsgXZv+hr7zsfQZhpd4UsCvPCXkg9GgIZ4b52ktl4BDQMKYX2d2LFs2aO+F
         rNpH6FYNjaJylqQJQz89SaWgjmp1BssY5jV3SsRa4ErDJlZfUvfFHu30FmSxFjRz1sX2
         yNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793467351; x=1794072151;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jC8OcSeHRdd3RsVKGpoelDfISX3MVzmR9xKrD5ogJJM=;
        b=rei57J8C35D5rWf+KfMN6MmjVISG0v750EHPE/kO0igOQD4t0EzZE3V1Tcm+QTm/aF
         MJJjaNkxE36+tz87An1sOEk9EB+1GnOGurj62kIX3gVgi+agbNvnvV6wEopeMRAElYwb
         4gqFqudgKO9GygEX7LF/xy9J1br21S1tpIiiBLAmj6Hib1edOKNAwqsJQxLdmD0zl5th
         BPi+MDmXftrrqeFxyr2io/OoT1XQEKLKaECThJ2lKH4JuOrQY5NviuQdbv+SI7H1DA28
         yaRt3Y+ih9OYeDPj72fdeRs9ngQBiRGmSOU66Z/HwZVAvWnvQA0I8ei/eZBYJGyYH4um
         JTOA==
X-Forwarded-Encrypted: i=1; AKwUvBy7df4qH8KeTCKk0/PPmt1/IqCGwbWDqBvQQyUQZxefI0HfWKg9gUfiC3OO9Kt2I6m8TEPs5x08ud8eR/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf3Hvvrdy5NcJZwQfAz0pFXOVFG2tUtfJUXfU/n2U1zjugjyHl
	LadvOAMqOo8c236v8N8ArM7wkPtGVjadDJ4u5rpCMQUus1NJldf1FidT
X-Gm-Gg: AYBFou1LyDZWXZsIExkIIqWV/3ynNcJYRLIHjd5UJTkUAbyS87Uur0HC9M1X0pWgZfU
	qSG15+8LFVzSp7omo/bgJIrlaovJaFCp8C0fuWbsWLaDCY+uxhzeVuH7i2mr8id2FlxCzpz6b4P
	DR6P2wJE8xxf171bG/26NIq1NKFWvkiZiVTNsOftwDe1m8pZqZRljEvFO4wvsC8xdqfJFa56OQV
	MeR0jut3pQboi/oHN1Jh7qXFT2CfQLwTDxqfVpj8IHlkzTFINOPXkND3UmgKPtxrF3TRGhlX2b3
	6ciImxJx3SHx0BSav3uHTAXloLugctWmXAoI3u8u55HmNYDIKXNOeeimMDYOr81HCeuFNQBz8zi
	4ETnVP9F2bY6N33V84i7Fqzos13Ae5E+C4vViYuxEqrOVhXAUqULjt8QNbZDtEkNHDyg6BTgd9O
	acMxLpKZEsjfjbo9kM4xzX7O0/3Bqrr0s38hoAiLwKj3FNYt6wlSucqrsn5/+C+QvPdB9HsyGB3
	swjdCRujPMQw6md1Zarv4Tm7vBse/rZeB6z3BJ/zSI0IozBEUC+A1JXvikjjNLc+tw7hRyDOzxS
	8Uryv+q78zcamTW1eePa7J7mgAwbtKtRU/5H7Vtmsf7bYgHqWOdtHuXAqjMokDr/s1xZyAedfU9
	mRRbrLCWs43E=
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr127595645e9.15.1793467350501;
        Sat, 31 Oct 2026 10:22:30 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1114sm153311235e9.7.2026.10.31.10.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:22:30 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:22:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Alireza Haghdoost <haghdoost@uber.com>, acme@kernel.org,
 namhyung@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org,
 jolsa@kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Subject: Re: [PATCH v2 00/18] perf symbol: Reference counting, sorted
 arrays, and memory shrinking
Message-ID: <20261031172229.0d178d73@pumpkin>
In-Reply-To: <CAP-5=fUJy=fZg3t0z7L=uKVVRjg8OQtCL3KxFR8Mrv-yVCtuzA@mail.gmail.com>
References: <20260928075237.3055101-1-irogers@google.com>
	<20261027231513.816148-1-irogers@google.com>
	<CAP-5=fUpji7seZpsxh0BN05oAA6nMUyM-bNdHBg4YfkeNAT00A@mail.gmail.com>
	<CA+w=M=TEYScc9rDyzthN75Ym41ATXoNLNu8_yj0dsjymb+m7jA@mail.gmail.com>
	<CAP-5=fX211V8=NCWyr9btd7=hbBB=oiMDETxCDdVr49idP13Fw@mail.gmail.com>
	<CAP-5=fUJy=fZg3t0z7L=uKVVRjg8OQtCL3KxFR8Mrv-yVCtuzA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Oct 2026 10:57:27 -0700
Ian Rogers <irogers@google.com> wrote:

> To: Alireza Haghdoost <haghdoost@uber.com>
> Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com,   jame=
s.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org,   linux=
-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
> Subject: Re: [PATCH v2 00/18] perf symbol: Reference counting, sorted arr=
ays,  and memory shrinking
> Date: Fri, 30 Oct 2026 10:57:27 -0700
>=20
> On Fri, Oct 30, 2026 at 9:10=E2=80=AFAM Ian Rogers <irogers@google.com> w=
rote:
> >
> > On Fri, Oct 30, 2026 at 7:02=E2=80=AFAM Alireza Haghdoost <haghdoost@ub=
er.com> wrote: =20
> > >
> > > Hi Ian,
> > >
> > > I applied v2 on perf-tools-next e74880764bf9 with the ELF_C_READ_MMAP
> > > fix and your three fixes, and compared it with the same tree without
> > > the 18 patches. I posted comments are on the individual patches; this=
 is the
> > > summary.
> > >
> > > On a profile of a large C++ service, about 1M symbols, perf script an=
d perf r
> > > eport output is byte-identical and roughly 22-32% faster:
> > >
> > > Execution time and peak RSS before and after:
> > > perf script                                3.3s 334 MiB vs 2.25s 332 =
MiB
> > > perf report --sort dso,sym       3.0s 389 MiB vs 2.25s 386 MiB
> > > perf report --children -g caller 4.6s 706 MiB vs 3.60s 703 MiB
> > >
> > > Peak RSS barely moves. sizeof(struct symbol) goes from 48 to 32 bytes,
> > > but the address array adds a pointer per symbol back, so the net is
> > > about 8 bytes per symbol before malloc rounding. That is under 1%
> > > here. =20
> >
> > Thanks for your work and running the numbers! I think we should aim to
> > land your lazy loading patches ahead of these patches. The merge
> > conflicts don't look like they'll be too terrible, wdyt?
> >
> > Since the merge window for Linux v7.4 is currently open, I don't see
> > anything landing before November 1st. So I can do a v3 incorporating
> > your suggestions and rebase it on top of your patches when they land.
> > I'll work on pulling out the fixes (you highlighted some you thought
> > were particularly worthwhile) to mail for v7.4 for now. =20
>=20
> Chatting with Namhyung he mentions having the arrays in the DSOs be a
> `struct symbol[]` rather than a `struct symbol *[]`, because the
> number of symbols could be known for a DSO when we load the symbols.
> Currently this isn't possible because of things like the
> annotated_symbol that this series turns into a side table. I'm not
> sure it is possible in general to use an array of symbols, as JIT code
> may need the symbols array to be realloc-ed and the realloc would
> potentially invalidate any `symbol *` that had been given out. Maybe
> we can treat that as a special case. In this scenario, the symbol's
> lifetime would tie to the DSO's lifetime, allowing us to use the DSO
> reference count instead of needing one per symbol. It would still be
> nice to add functions like session__malloc so that we can reduce the
> memory footprint of a session when memory allocations fail. I still
> think this is work to land on top of your series.

Could you have two tables, one 'struct symbol []' containing the fixed
symbols and a second smaller 'struct symbol *[]' containing any extra
symbols?
Lookup would require checking both tables - but won't cost much more.

David

>=20
> Thanks,
> Ian
