Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344362;
	b=Qg7ysdOhwGsiU7vfPdnkc25AC4aPSzVqLgSyoVJQwHV/NRfjHeKqE53d3/tPZ/2rHOaB
	 Cbs0AqHsnWyjOGGcb+FndFeqCyi9LiGm/jMPU3N5KOWQTd1FOAVZxBiiirkFzNAGIHsWL
	 4dRE5Enu3RZ0Ko0fXvQ5Sqq6MBuV3qgxhHLGg4FJoD+aiCgQ2odwPdanYqPlYM6jrZiv/
	 X+fobSruwPailLxRSlKhCTeXiOS0YMHb6u2/0t8mB0DRnLnCc3QMLiJG0krD3igmhYytm
	 EFADSWZUnwKJ54dxwvBiNzgCcmH/KkAKg0n77Gy2DCD96GieonD9fQy6m7DWxULyqTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nTOSTzpDd6DYXlGIMr6Wyyl34ouDeSuy6M7YMcar9Os=;
	b=KAFLnuDrYFNk9c44dAYejgcn+gK6GKzDlfnGVTodZfVEuYmVocSWNA91KanW1hHqad49
	 5XdZdaXghg8Gg2QnO6/KPvhTB5H856UYbwrMbw88dY/RUcApr/RcIz/O2TjZEC0lROkJH
	 KY1PUllSyOmQFNmoMHD1dNEOgtP8KNY1o7WhtnmKeIcEUOiuB0o2aau/9R1qCLzekHy0f
	 NXeTTMaRSqeRxTnKc4dSgkyTzvaXtuLdKNPl+lzyBJAX5MJVxuTK0+NeiYnzIN3n+VdiJ
	 LNWEnWocE2wNk3lgMLrX5ihN8L7aD4ozW5iOJS1Ekqm1R3wLB1/nipDRr2geHYm4jiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LLrbqAYX;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3A8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B3A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LLrbqAYX
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so3304955a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794344360; x=1794949160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTOSTzpDd6DYXlGIMr6Wyyl34ouDeSuy6M7YMcar9Os=;
        b=LLrbqAYXV5l3qZehWXP03Hq+boT4H7MopSGsgngJ9+bPt4HwAI61WW/pE4ygkSHkf4
         7mKLY1zBawfYKYskYctxMuEKf0Q+zpNtFW+8evVP5Ptu8RbGg1zVsn4EQ72NyVlZh6ZD
         F5/268AB/Oq3U0WlyzulZyt+YU8O5nZqJRMpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344360; x=1794949160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nTOSTzpDd6DYXlGIMr6Wyyl34ouDeSuy6M7YMcar9Os=;
        b=I3AGe9NIlhQySyVDpfo2KiM56flrnycUwgrqP1v9E6NgGfvuCbLIQJojAOexQS3Q1a
         jleq+UUH8Xlcl2xz2jR7ThDSrlAA3Cn9tQL3yab4AAR6YXPM5GciuMNbmFuqyCNRnX+B
         wu0yGiX/A5uy1CEMh5eBX5+d6Hb4dgNdU8wbFxA6b7wJ/TQYnWV4Rqq/oFPOYrTh69pe
         kMgcoudeqJYynoPUE7NE6M5gCms0Za2YfF/t5ZzRnlEbvk5OgdzQoqQ5s9/q6q5H5n0s
         hohBvyrbPxXJvqLYmmVwSom+/Qlx/6/oTgb1yzReIpvQouXSnbZCkTHJz5m82clvdj/t
         Di6g==
X-Forwarded-Encrypted: i=1; AL+hErGqGSh4k0vOiSJb79lksvc/DmcWUGYwXqlCA8DVsEINfMFTr36BRGolAtDBcsp9hSKmI586Mgff9K6BHH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GQ64VX9b14yEPsqkBj1qyjYm8wxsOSl9lq33XkzTmGaGyU1R9
	1doAPXt14I4iGSBgqwqqKk0ZZHWj1uMt0+zKMFWu5ea+c/BTy+qyOeQ4UXW5A/l7YPG6LnDImVz
	YB36S392b1A==
X-Gm-Gg: AYBFou3Wc7lC13ajQCdC63Pgtabez/71BPgm8jPcp+YGyqPJtMXq/TcwCgVhaRukgd9
	Ve0oprBe4gfA4Ut/eg1nzm99Uz4zaZD0nL2JqMqGDwhDLAV9bVa7YuouNO0RUtZZZ7hx4GgWuLh
	SiAQWywQq20+DYNyIW8q/HuKGVGUg9dKZkV+YLaSvIKlzbVxlMsEiiuf35JTMPUUMWKZ0In0fc0
	i3G49SgA3edU3paM5jCiJ0HptyHZVBvd9GRUZfmX0HHWU5SiWvHfDK1GPnrblXyo83trBibTKNx
	aqx8YPqhMsPaEqS/kcj3McqC7TDRp+ZyVypAqO9RvD3HJCdIT15WI6bC25qrpB5PRqZtpbKAuYx
	Cp/dIluArjUCex7qGN18OdCDIT6o3cdeH8lgDXpavGSFGS4FJ1rPBYqhUJ2Q40LrU38Ens/UsAR
	DZmMU2o9QJZ79O1/hlHXO7oPRNOQA7+8XIq5OXDl9xP64IETzLfbIJtwUdArvm0g5YfBq5q+ry1
	6gDl3Vmpa9GbXie2+M+H5KM7JqfIhJ/yhuGqYCBQ9zDx1rJaEY0gYkLeDYgbRJv+2FxjJbs00qG
	52OkY6QOEPvHrL79we+8GA8ntUBIBbtj/xMVZkvuAX0kxHcxyx5MJsHYnQNUhsKw4YpoP/uUU2W
	cDVY=
X-Received: by 2002:a05:6402:5004:b0:6b7:7785:e390 with SMTP id 4fb4d7f45d1cf-6b77785e9a4mr358777a12.39.1794344359653;
        Tue, 10 Nov 2026 12:59:19 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578f062dsm1640311a12.27.2026.11.10.12.59.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 12:59:19 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b750e40ce2so2056537a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:59:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHVv3iOX4PurSCeStbuBJU6Wl8e2BHZ7ZNFwA9IOeJvLJJamk1r5yoRwLvWxOFsmlbwiFx08wzWw2YGJUE=@vger.kernel.org
X-Received: by 2002:a05:6402:15:b0:6b6:4dcd:968c with SMTP id
 4fb4d7f45d1cf-6b7773f4923mr272940a12.16.1794344358604; Tue, 10 Nov 2026
 12:59:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104222806.1826508-1-usama.arif@linux.dev>
 <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com> <719584E3-A730-474D-9061-BFF35EA4B02B@zytor.com>
In-Reply-To: <719584E3-A730-474D-9061-BFF35EA4B02B@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 10 Nov 2026 12:59:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjXc16n7ppqhuCDXj3WZMiACupW63+BQh0x0OQFTBpf-A@mail.gmail.com>
X-Gm-Features: AclHuK8AR7PiXXdephnj3JZk1X28I0xJsdLMZGKhS3tXiXzvFtP8szDn-7QDsQE
Message-ID: <CAHk-=wjXc16n7ppqhuCDXj3WZMiACupW63+BQh0x0OQFTBpf-A@mail.gmail.com>
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Usama Arif <usama.arif@linux.dev>, david.laight.linux@gmail.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, dsterba@suse.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org, 
	kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 12:18, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On November 10, 2026 9:53:07 AM PST, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >Let's not do that.
> >
> >Putting magic things like RET in alternatives is just a bad bad idea.
> >
> >               Linus
>
> Why is that, *given that it is in assembly*?

It's assembly, but it's assembly that potentially gets rewritten.
objtool already knows about __x86_return_thunk being special (although
I think it's the _target_, not the call site, it cares about).

I would like to not have magic in stuff that is in the alternatives
section. We've had issues with relocations etc before.

That said, grepping a bit for this, it turns out we already seem to be
doing that in memmove_64.S, although it was hidden from my first grep:

  #define CHECK_LEN     cmp $0x20, %rdx; jb 1f
  #define MEMMOVE_BYTES movq %rdx, %rcx; rep movsb; RET
  .Lmemmove_begin_forward:
        ALTERNATIVE_2 __stringify(CHECK_LEN), \
                      __stringify(CHECK_LEN; MEMMOVE_BYTES), X86_FEATURE_ERMS, \
                      __stringify(MEMMOVE_BYTES), X86_FEATURE_FSRM

which is pretty disgusting. But I guess that train has passed..

           Linus
