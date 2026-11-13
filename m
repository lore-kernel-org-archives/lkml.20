Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558991;
	b=xbOwrOVPXTnKoPybI9EfEdkVHm6agrOVy0YUr/FOQrH3OsqWZs4kC3e1BaTE2nEN3eIL
	 QJbjvS42KW0n1ZF9e7hwGM3CL3d2bSE9HhadQ5Xxgsd3EkYrovV/Kf6uLNj5b7QTK17Dj
	 Q2qS9XMmCdym5/D+tiozpi5g02aZ4/jY2+JD18NIRSe88T8OLafHfDTMtJOBeUkYqUZSi
	 NZ1pjdx1NargN7oggJeAnkCoG78Oad42MsoEEKAgnd6NK+zhxhfLqTQnB36pmxBRGAE71
	 OL/Lq5e23xz2Rbxq3vKqHNL0R/5WSqeROuFslpvRKsrQSkSnUwND0f2DULF7Ril1kpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hxmzA0feh91DNcIpNzzQx0/hKehxa0qmErlzD8WJ5a4=;
	b=M9JddwB95kTvxNv1xM9vcAvFRIf6+eIu9SZ44G+GkYuFGtcuwuASabDw8Uv+LWJF824X
	 vnkln2gAFO4MoC83w0IJpluPUdnrWBBQsYWONWJDXtl9dfgC7Ojnm3xKZlI0DJ/xkzfqz
	 yOtvdLH09H00wdArJ7JYfU8+htuZ1Mm9t2iI8kSX9/8AmZpMpDt2BXaVLUtBSNVckaG63
	 vmZJV69y6Lsszvi5yPiF6wvQAZYjUsK2ci/KDzRqI+3zUjNr99lwedJj5q6szzihVLORA
	 PZHrRWdPxR0njS025rvwNAImnFyGJAKaHULBGKwroUFZTGqt6H/Gre3P5OMCOIaysXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sBm/Uac7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50400606B1E6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50400606B1E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBm/Uac7
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so296559e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:36:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558990; cv=none;
        d=google.com; s=arc-20260327;
        b=rvA64FHJD2rgplhdv5befsleZ9SLAvZ1FyHezWboZCPYFEHVVkY4ylEqYZHvU1hIyU
         Qm896DuukTcQEmNU+k0KjWDmZe+r+ME9qMTQfz9F4dkD302BnnRmgBQevkqrh/t9zPq/
         4tZ3INz7MDHZRJVmW8XPPafnUlKYv3znuxt8XExsAo+dX286uB9C5NlgS2bZIRsmKu28
         TIDFwLCheP7iSRCfpO4Ks5/i5dgnavLsWJbd5D2xuYc4JjN4DpUyfmPzmBc/JVIbgFgF
         1eN3PG6BsJV8VkRSjpdz6I6Tb+L2kb/H13uzjdYxHsd2fvuhW5hggfyJE5grVFwJDQ+6
         ktZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hxmzA0feh91DNcIpNzzQx0/hKehxa0qmErlzD8WJ5a4=;
        fh=39Md54U1zx8UoRl+sfpyiePcag8kLgYDBZbT73AQB9Y=;
        b=JZnoyxcPJL7420C7JAXlqoqHxOcNMSWkeZYTa50PjvPYlO609ezle+4NH5RCf2ejb+
         0eD0/RqA4wgbtWfpMGlX7+mNv2VG+e6N3545+WLkogp+4f3VAkmru12w6jwu/jLVY9tk
         tJb+w1kkEMhpxI4uShDNFgiII+7bmpQWZWKZfeIkuzd3z48devt1Cq9hUvFMnohLEfNX
         con1i9rRRu1WuP3zkABvbDeY6vG6Z8RmyuKzOUOUguGb11OeMQeusHheuYyC59zJici/
         jb0MTm0WTHwOGf29XaqMZ226d+ECZGsBOlciRdpL153ndrXpbZ4Q29ODAEgGJGw5SdZ+
         lxVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558990; x=1795163790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hxmzA0feh91DNcIpNzzQx0/hKehxa0qmErlzD8WJ5a4=;
        b=sBm/Uac7Xy9miXA4791/toihhk3ivVTr2fXA7vyOLLTcnGLV64AUiOBUs9v2eyclYK
         BKOVWiHBXDOPob2iemIB78h3nzKegH8nx035uKSM1NfQZ6hzjyNx6fGxSSISysmWy6M1
         NEkifNZH2XZx+tmCSknJgt5Df5U3x8n/kaytyl06nMXw55dSSTGbt9tPirhxdvrflvGr
         bM0HxUUDqmcqtKDXUJ4P8YWWbIb5OrMQILt+wj82f5h26UQlh6N07v472GTQLsdOOKdz
         fAqbHK1BdqMl+fHxz9+nAnBtWL+rholojpZJXOxmzNTKc6OpVCed+gop+5BdCSYHHKnG
         4E0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558990; x=1795163790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxmzA0feh91DNcIpNzzQx0/hKehxa0qmErlzD8WJ5a4=;
        b=xuj5aP6nolplbqu+ez5chD8ccetx/LOijhAaojCvj8wjTndX2xF9mO7D/tK27xGSXk
         zwg8axfP4UpaA/mDgThwEBZuv/VJvH6yHaWGyy6H+mtH4GWqknXlnN8JqQ6GINRZKXQF
         Q8fqIx8HD8asDoHIjiWB8ICyR8SDDkh1MuaSgtCNrH8Xy1BHo/ZR7fkRUNAqMT0UjGbo
         7mlG6r1NrZ2Jwfn5YzH2ABChCitnPpaZY86iaKcNq/5BWHOEngDdAFxd5TzyaIGBeZvd
         NZ8YnCqDmWNAKfTxhVoYX2ACWX72EI2EqESYtsLxlYwfe5LZXSEOB3JM75tDPaU8C6fT
         svHQ==
X-Forwarded-Encrypted: i=1; AL+hErFAvOPDqb0oCFh3Ri35WLw25S+oUVOpki7XI42XyGgRbrxRI6TTdd/3hhEu124Unof4sOIjGHAePV8aLaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mW1rZPw6k16cOyPbHZE2u9bZguAnDdm4F2Pdtk0UIZC5Ev2Ja
	DzQNrI3XywUqP8MRxyj6U4tIOTQvrc4eAblsPvVjox8VjUgSXEZNxMk89/eSVSw7C5cU5psp2kv
	BbVywGJeJ15HtNXBw2DsFwKKjE5P2i1A=
X-Gm-Gg: AYBFou2fBeXsz1Ni48h1GX7nQfr2/Wi9WIbUzvRWyAqdnkMoVhJAmzgBONwU71vMgIS
	4gI8pmWUpvXT5D7R76IzT4fiIZCyp2zH59XBQXdKIy7553RyNWK4dnTSirKoNxNoeIAkVu70kRB
	2IUIYZ/0zLhH0PSF9RTiDxndp3Kk//mwTVsIF7At6mR2ZxHFdqDIAO58NJfp86wfndxF7cWdHQ6
	MTMXZxMN/Xgn3wpcEz1dz8w2GRUp13+wfi6ZAsV8snp9TVPRCiraDifKQ4M4Eey8bjSs/WIV6k7
	awF3FVOAFm/b7Q9AAoEy9lpPriddtDAW+W5zKAGUN1oib8+FC4ommVY+C9S22GEPEK026LERkdF
	Er9Q8mDk0k4K0WjjZ5Gy6R5TPMtHDWdxJxyXgIwVdQ8Ea0Fmd4ME6OJfPJ8lEiGm65s9RWy9CQU
	0n2tA7axvOTQUNYNBjAfUJVIlYKCswOI9hODWdsJQipogW+z1PiRv/4k9p02f30txtoUBToauAG
	lGLzQXHv+PPBa69vjeU9XcW/PrBIgp4uv+kN+XKIJpEQ1zoqd6888ptOUzJ0e46ICw1P1fj
X-Received: by 2002:a05:6122:489c:b0:5c9:a60d:3276 with SMTP id
 71dfb90a1353d-5ee34a5865fmr541373e0c.10.1794558990121; Fri, 13 Nov 2026
 00:36:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794333957.git.edumucelli@gmail.com> <cover.1794337724.git.edumucelli@gmail.com>
 <undine-1794536932799279555-f9c303a1aba9ec59@undined.local>
In-Reply-To: <undine-1794536932799279555-f9c303a1aba9ec59@undined.local>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Fri, 13 Nov 2026 09:35:54 +0100
X-Gm-Features: AclHuK8K0CTjwHiI5SVtOzSff1K3qWkjs_5Yb1Q03kRVurlcRWeppGiFjFExasw
Message-ID: <CAK0NWSON7B00NfsGO09preBcQXSWtAjkvpM_Cd8vJTao0QLQiA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] bootconfig: Preserve values and key paths during
 parsing and output
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: akpm@linux-foundation.org, rostedt@goodmis.org, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masami,

I do not know the jargon in the Kernel workflow, but I imagine that
"checker" is the flow I use?

* Custom Python reproducers and bootconfig tests
* GCC AddressSanitizer and UBSan for the runtime errors

Best,

On Fri, Nov 13, 2026 at 3:28=E2=80=AFAM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> On Tue, 10 Nov 2026 20:08:44 +0100, Eduardo Mucelli Rezende Oliveira <edu=
mucelli@gmail.com> wrote:
> > Hi Masami,
> >
> > Thanks again for reviewing the earlier fixes. This v2 addresses the
> > issue Sashiko reported in the first patch.
> >
> > The parent array in v1 assumed that the parser always enforced
> > XBC_DEPTH_MAX. I reproduced the reported overflow with AddressSanitizer
> > using a 20-component chain where each parent also has a value. The
> > existing verifier skips the subkeys in that case, so the parser accepts
> > a deeper tree than the formatter's array can hold.
> >
> > Patch 1 now checks the key children to determine whether a node opened
> > braces, using the same conditions as the forward walk. It no longer
> > keeps a depth-indexed array. The existing verifier gap is a separate
> > issue; this revision removes the formatter's dependency on that check.
> >
> > Changes in v2:
> > - Patch 1: derive brace ownership from the key children.
> > - Patches 2 and 3: unchanged.
> >
> > I tested this on my Ubuntu machine. All 137 focused checks pass for the
> > combined series, and the full bootconfig suite passes after each patch
> > (86 passed, zero failed for the complete series). I also checked the
> > revised first patch and the combined series with AddressSanitizer and
> > UBSan using value-bearing chains up to 95 components.
> >
> > Review: https://lore.kernel.org/all/sashiko-outbox-207566@kernel.org/
> > V1: https://lore.kernel.org/all/cover.1794333957.git.edumucelli@gmail.c=
om/
>
> These looks good to me too.
>
> BTW, what checker did you use?
>
> Thanks,
>
> >
> > Feedback is welcome.
> >
> > Thanks,
> > Eduardo
> >
> > Eduardo Mucelli Rezende Oliveira (3):
> >   tools/bootconfig: Close only opened braces in compact output
> >   bootconfig: Trim unquoted values at end of file
> >   tools/bootconfig: Preserve values containing both types of quotes
> >
> >  lib/bootconfig.c                              |  5 ++-
> >  tools/bootconfig/main.c                       | 43 +++++++++++++------
> >  .../samples/exp-good-mixed-kv1.bconf          |  5 +++
> >  tools/bootconfig/samples/good-mixed-kv1.bconf |  5 +++
> >  tools/bootconfig/test-bootconfig.sh           | 29 +++++++++++++
> >  5 files changed, 72 insertions(+), 15 deletions(-)
> >
> >
> > base-commit: 677f83795fdfc25ddc51b665a9111f5ff199f7ca
> > --
> > 2.53.0
> >
> >
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>



--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
