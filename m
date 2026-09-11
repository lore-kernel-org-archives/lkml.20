Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C448649E129
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140016; cv=pass; b=ttOyo0ec6kX0TWTF9SeG+ydlJxhl82gs0nypbepqRRoCFfqdCxC31Zy0g5+WLOZCtR7ej2mMJPj+ydmXUjqYcFwjZM18JXjCvMLTCWvqwn6JgqrOq1L3xYEnDG2HkmPuceS0Ts/RF5b5IQydxFkLhFmDgCFupBXSsdioFfodPEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140016; c=relaxed/simple;
	bh=Yk13UDKhHBWrmRCnNILsAJ9pW2ZdOFTsJD8wrftx0/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdOpBa7KEJF9/RLu6hyamLcIOFXokQ+KnutXUs5MwVc/0dP3Gx3Gd2EQXEkIs/cquIZRJVubjf9RSQHNrPjqO/LHW3Sk0hSrvmrMpCxPwLGL96TZ80/WuQ8HIqR0QE+vUHAbyHKY4SwL259jVDtc6jnJsZgMoswQAkRWZbv89JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fBP6UMJz; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fBP6UMJz"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so24481cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140014; cv=none;
        d=google.com; s=arc-20260327;
        b=F3wurjhtt20Vfwwi8Yx1pEyhk09DAIRSl/R7avPUbYTX4XHx6Ih6DYF5EyOTtgi8iW
         Ikk1jcqNYQVJJmRosQsUht+By8Aw95fJBsEN49VgUwLzfi9rTYwenTLnI8nVj/GYqV4n
         Z5TQGZVg/PXXYtxGcZIwjUE0oqvVFc5jzgJj6kJ9YTSWZUw7ksBVWA5YFD/MJ3JkVyjk
         MymmPzEgkYqLcJQgJ5oTiWk3VpyCQFOSQfPS++pP54l5QY058nXU38f+9St6wfibXDEl
         WcnrfRF65LfAWuNkEyftzNU56DAGQfR3JiqILbpUgxTpSoykKSYcN0jRbGB+TXM9Fruc
         t/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yk13UDKhHBWrmRCnNILsAJ9pW2ZdOFTsJD8wrftx0/0=;
        fh=XlJgTGFehI7zIlPJFDY7+l0E56Txg8AsYObBMqih3ok=;
        b=WL7683xs27ANmH1MUcJ7xNdqtbI3uO5opcJnEsTMCluwQTVgDmkoExoIrzw60jSwXk
         Sg4RItshwCfn1xhwsb1AgOluVtIZ48CwarPiWI9OWEiX9GIh0EG6tJVGRajNZzdR4tkz
         R14oJYPmrkCk3eXoOGOzt5NW1F5+y4Jhz401+bpMBIpVnrFwCri9jogog7OxXYg4kNAe
         r+0i7HkF4ded0Gm0vKyVBPWAjdr96qGCDO36QU89UI8nAaI8dwfIXsSMSOZe/M7ey0Vm
         EsBU0fLqQygE9gjRFhK10Q+sh4wdNDemRasoRUeo5WHxalhzWTlbn/F8Q/rClH+ANwLB
         nNAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789140014; x=1789744814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yk13UDKhHBWrmRCnNILsAJ9pW2ZdOFTsJD8wrftx0/0=;
        b=fBP6UMJzPJ0KW/juIyKGox20dnrREJZIML5qBY7yeL/B/DZs5pFuhz0lAEXHBycPBL
         XyM94F/zx2KDpAW85sb0nleo/l+eyI7K2+bfK1LfcF4KAn16DfFF7SBzymDVhwohDA0N
         xZ7YAX9tAQdRFmUVTpB7Z2Z/dRQQrQk5vNjfA0gWLRI3drg3x8ntsurgXtNln+DLHPXF
         O0HK21flAY4PErWVsB+IJjMeUBBeiZsE1C8oAS+igJjSGzUhZ5Wv31s0AT3eBNHFoWPG
         t0yLrMHoJMMxKXicwe68gZgXkK/nTUlTVHTY+ekUZQ7hHI5KyD0w7NI+NpN5yG3EaZqg
         Yylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140014; x=1789744814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yk13UDKhHBWrmRCnNILsAJ9pW2ZdOFTsJD8wrftx0/0=;
        b=Nio071nXVYicOp22xpX2xhq3dZ1Q+QUVXNPoNBdgK6MY/WrmNFyhxk4oEmYNkd7SuO
         yAfKWT8rtwBa8fNvsiWHhTLYptaXmoQmfWGmJw+F8hzXMbuYY8NS+1ObbGUsN/GQ9QuI
         l/GIK34faa+5Ks/ETj+PtPlVKw4p6Swz00X8nWet7GlLfFJdMZ4aRVopKyR07dabN6Vo
         ZOgHhsTEEY9dvc7QNs32YC4RWwZKfTPYA9k4pD8NMD4U0myUNNCmEkZ1CB6OYuFYUS5M
         giEEiUMFgv/iQzlJhUS6AX3yyS95bAnQpu3e5tl+NOWJIE0pieT4PfzrDeQZW4Z22OWM
         BKnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYCp6awgYprrag24miQMh2TMG6Gu2es87jz/aggDdp78MHKJWPAvCBoXOWaYEKdt0QiWZzTq7memL3gm8=@vger.kernel.org
X-Gm-Message-State: AFuF++kvfKGS4AfORuVewfyFGYIF5SY17x9gtvzy1HR7bh6Zps/AyXM/
	GCfwgwMZTn17QBJw7joMheQdvN5mTVLpHfu7MDBgSpR/YdqTpLvZTGyYhVN8fQZrSQq0PDjzW51
	VtF5uck1YsZHvD+6mL6vJlZFFn5olZtR/lLKLdzhI
X-Gm-Gg: AYBFou01tOvYd7Cr1RbvFBrHdYhhHsKcAXABpMuuf+EVP0WAC2OjRfRD1q2YectT+5k
	XN9NQIsu8YhuFDAioZkaF3oADFTBuMCRJTAR23UYnk0X6G6YwbFmBhONZP6G7ZDWbSxLNarJAd7
	3SMQkEKK7jAa5at7PvCvoWC1E9mCvOwfXOBg+wvs/dSnB5WU+i3oKPugH213aByeBD3YQuqSg+V
	1OZWyeHX4kgajhoNLfa7qpnOT4tVk8DpFMV7WUJs/ugqHUVRMLgWrRGIC4KOZ72+oFfkS7S6H5Z
	AAEBawYqGAaq+RRriV9d71zjkfGMhoM5wKZo30obvP8Na7EdpmfMj8fd21IKPR0yjF9YYhe6ewp
	JE++/Ml0=
X-Received: by 2002:ac8:5d11:0:b0:530:39d7:ef48 with SMTP id
 d75a77b69052e-530cb49695fmr15549621cf.3.1789140012704; Fri, 11 Sep 2026
 08:20:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-2-surenb@google.com>
 <008dcaa3-2068-46e5-9e58-afb590d90584@kernel.org> <CAJuCfpF5CBrCxZWm+Luopf2gq_hHxsbw0QptNhfRT=+KjyWbJQ@mail.gmail.com>
 <88838d36-ea5b-4c76-b785-cf2bb71e34a5@kernel.org>
In-Reply-To: <88838d36-ea5b-4c76-b785-cf2bb71e34a5@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 15:20:01 +0000
X-Gm-Features: AcwNN1Xk5ADz_rJe0NJkhhPYuxax2hrdjw3AnJOLY-8G8UUIe8p-ZF3eb2mA0Kc
Message-ID: <CAJuCfpEvyfR1K2ZjM2-AnrfQtVwHiD7zDvHLqfcSCUyfteYzkg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] proc/task_mmu: remove unnecessary helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 2:58=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/11/26 16:28, Suren Baghdasaryan wrote:
> > On Fri, Sep 11, 2026 at 3:52=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 9/11/26 01:47, Suren Baghdasaryan wrote:
> >>> When per-vma locks were behind a config option, a number of helper
> >>> functions were needed to simplify the locking code. Now that these
> >>> locks are universally available, we can do a little cleanup.
> >>> Remove lock_vma_range(), unlock_vma_range(), query_vma_setup(),
> >>> query_vma_teardown() helpers.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >>> Reviewed-by: Liam R. Howlett (Oracle) <liam@infradead.org>
> >>> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >>> Acked-by: Usama Arif <usama.arif@linux.dev>
> >>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> >>> ---
> >>
> >> I think you CCed me only on this mail correctly (the other ones went t=
o my old
> >> RH address, I thought that one would bounce)
> >
> > Oh, man! I used an old list of recipients :/
> > Should I resend to avoid bounces? So far I haven't seen any bounces
> > even from the previous version which also used the RH address.
>
> Odd, I thought it bounced for a while (maybe it has a new proud owner, wh=
o
> knows, haha).
>
> I changed Monday my mail filters to not catch to/bc to the RH address whe=
n also
> CCing a mailing list ... assuming everybody got annoyed of the bounces.
>
> I just reverted that change, so I'll just fish the mails out of the maili=
ng list
> folder and should also get replies to the other mails into my inbox.

Sorry about that. I updated all my old recipient lists now. I thought
I did that before but apparently only for Lorenzo :)

>
> --
> Cheers,
>
> David
