Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A713A16AC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442283; cv=none; b=mIR2FFQJOjxZnQNIH1lmX1HRtBc/4h2Id/ZJOnc6V83z5taYiDXm+lKkET6XpB8jNp7OzdOeUVecxDmdR8mcrV4Qr7yUoOrex6e1slp7cE89fVuNwkQ9Etpw9XPu4VsrppWoZ237781AE1ol5Qi5JcMx0A5+pwHwwnq8ldi/2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442283; c=relaxed/simple;
	bh=n+Bu6/5/Tih3aPITjcNZVRzD01yYPYtaiTg9nfU3hgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snDBybtgJ0UUZCUHInD9Gn8O0aFcGVnWr4Pz+cxZ9iaGFhu26pyYpTv0zJecgcEk+G1X1V2R3e5EpiJj+7XG3mvNQlmVpdyKgaXLe8xILJaEiM81Xvsiks8OOwn2YqN6s5wLsFYRvlMkm2GvP3yrIWtbEb1I+TxLB7Rgjdru03k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWM5Cfl2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWM5Cfl2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716021F00ACF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788442268;
	bh=hCmY/J0gqYQ7Ycc4TXHwfaeI120KcyF9adJuR9ZmWuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dWM5Cfl2FUwhgvlMA6GiVioPrBYRJrW9Ff0J5wen4cVSdmVAM20qHj/WuyNdjNi2w
	 i9VxG5nH/Wvot1e/oV5XQyNhXr36x0hPGcy4nxxWFZvx+7ppXuWSxETHcqIp8qIJq4
	 NsVkth9UI+ffrqwxs5W5qb/XIJoPYAIU4VsWAkNTxHS8mLmxhW9xkFw/Qp+T0qzlOZ
	 WQAvhHVcfyWL1NwkqXcI60Ptz5BMrn8Ovp7sINhT+0o+MCiw3t4W03qMGB6Ane54Zk
	 h42/mq4jPwZ9stZSJbJ7iiOIk3UJPZcEwB427EYbpi3wscdxTqUMXA1OZ1J/tRsLJy
	 Jd2Fki/3UXp5g==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c255c58156bso403556366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:31:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwOKUuuKIYx67kSab8/VYnE1Tu9sp5OlESqKwdblAG7HPHOifXnYgqz+SkINCqExmxvU2HGfvcPGClz4w=@vger.kernel.org
X-Gm-Message-State: AFuF++kLRiagRwn6Jrz3ibmOftU5df6Ri3Bu1oeq2Qt/MnAeXc5b4hLL
	G2pDdifqYxs4ObmY13Qzb3FUYSvdhLBFYoHddT56hfZL76I+w6YlDgwenC9AVh2hCiGvdhsa+4y
	icHjXUHbLv0N5/N5uStNoGPjEcIRJCPU=
X-Received: by 2002:a17:906:ef0a:b0:c25:9102:ee with SMTP id
 a640c23a62f3a-c25d5450105mr674029766b.3.1788442267343; Thu, 03 Sep 2026
 06:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-page_alloc-unmapped-v3-0-6f5729aa9832@google.com>
 <20260726-page_alloc-unmapped-v3-13-6f5729aa9832@google.com>
 <anJmOMqCVugycC9x@google.com> <DKOLND2TRB15.2Y8DKB3ZKEYAY@linux.dev>
 <aoOomzh1ErtSeKFb@google.com> <76dd87e0-cd34-4ce2-9586-d7ff019b1fb9@kernel.org>
In-Reply-To: <76dd87e0-cd34-4ce2-9586-d7ff019b1fb9@kernel.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 3 Sep 2026 06:30:55 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPpAbU76yM7TFW+vFugk6H+J5PwW5iM+qef-D3Oa7mkYw@mail.gmail.com>
X-Gm-Features: AcwNN1WFofe8gNX465KLduO3JcgRtjh_frBLWrk3HB7XJCz-hoj8Ik5N4ZEitco
Message-ID: <CAO9r8zPpAbU76yM7TFW+vFugk6H+J5PwW5iM+qef-D3Oa7mkYw@mail.gmail.com>
Subject: Re: [PATCH v3 13/26] mm: introduce freetype_t
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>, Brendan Jackman <jackmanb@google.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Will Deacon <will@kernel.org>, rientjes@google.com, 
	patrick.roy@linux.dev, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	Andy Lutomirski <luto@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Thomas Gleixner <tglx@kernel.org>, Patrick Bellasi <derkling@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 1:00=E2=80=AFAM Vlastimil Babka (SUSE) <vbabka@kerne=
l.org> wrote:
>
> On 8/18/26 02:35, Yosry Ahmed wrote:
> >> >> +static inline
> >> >> +struct list_head *free_area_list(struct free_area *area, freetype_=
t type)
> >> >> +{
> >> >> + int idx =3D freetype_idx(type);
> >> >> +
> >> >> + VM_WARN_ON(idx < 0);
> >> >> + return &area->free_list[idx];
> >> >
> >> > Should we return NULL here if idx < 0 instead of an out of bounds
> >> > access?
> >>
> >> TBH my descending order of preference is:
> >>
> >> 1.
> >>
> >> BUG_ON(idx < 0);
> >> return &area->free_list[idx];
> >>
> >> 2.
> >>
> >> if (WARN_ON(idx < 0)) // OR VM_WARN_ON
> >>   return NULL;
> >> return &area->free_list[idx];
> >>
> >> 3.
> >>
> >> VM_WARN_ON(idx < 0);
> >> return &area->free_list[idx];
> >>
> >> 4.
> >>
> >> return &area->free_list[idx];
> >>
> >> But I suspect[0] Vlastimil (and Linus) would order it the exact opposi=
te
> >> way.
> >>
> >> [0]: https://lore.kernel.org/all/bd36e972-8900-4476-a66b-4dc218b21a4d@=
kernel.org/
> >>
> >> And I care more about making Vlastimil (and Linus) happy than this tin=
y
> >> detail of the code, so I'll defer to him. The current style is a
> >> compromise, but maybe it's just a compromise that makes nobody happy.
> >
> > I think I prefer #2 (regardless of whether it's WARN_ON() or
> > VM_WARN_ON()), let's see if anyone disagrees.
>
> #2 can't work with VM_WARN_ON as it returns void. Otherwise if it evaluat=
ed
> the cond with DEBUG_VM and hardcoded false otherwise, it would be ideal. =
I
> don't remember why it's not.
>
> Do the callers all handle NULL safely? In that case #2 has some merit (ma=
ybe
> with WARN_ON_ONCE()) otherwise #3

I don't think callers handle NULL safely, so I guess I'll keep it as-is (#3=
).
