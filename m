Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432943;
	b=ttYs3m+DkcOYNfo9Yl0ul6gFmv3hsBpElSZzMHgT9cjdeelP33/BpC/Qc0NzrU4LwKTf
	 is32t0Ut63r5oRazzqnfQyJPgXcGN9a6QCvXU8YiymEsjpyYFz3g/Wkbobytg7cJAZfXG
	 p3PJeXU4kYSK7zKy8qqEilq0s0q+exmWtBVkaIjh9Lz17bFTbFp0SDJ9SEp0ZN5VCCsHg
	 AphpNW7uPakEJ1WaTrCfuLQvToIMxGkOAfL7hXm8VXdYQPEcrfuPWNpdBUnuq0F14qOJo
	 1B8fIw5J2VW2VRBQ0IoVjsfHtitnEQqfF1kjr/BBwTqtACvMLLRJ8bM7Ey6N2QhqvNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432943;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=GiLrJsK0i/ckXgWaDlbef6TGeEOzJ1BPFASM5Mf1Dm0=;
	b=iBb5WwNwqiJNVwWDQK1FnrCs1o0yfIgCs5rUBXLr4NAPyCsHl1sVgJowbmsqJKhOnHyV
	 zkc2DfmTDwL6GVkjYje4zmFuQw5ZSU8q9ZoWXMBqp0vwbhDkTuAm5Kz3x0nOWVmzwXfmQ
	 NwVIjPpKhFiOjpn49xCA4mMv3uztfvqTG0YFbN+nX4ppisHlRjTSVTWJ8Uou31vrk3WgN
	 PoJxqnAWxwr2Jj8RBX4D44wwg6AX4G+1o7VMCrQUA6wIgyU+/rAiGi0Ki0zlVwElaCXhF
	 tYKP+VNOY7Mj6XzyJlWEyL7n53KQ3VtdDpGOVOYYOAHzsiQsQblD7kYhQv7sewVRdpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQyowssI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BDF606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQyowssI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5761F00A05;
	Wed, 11 Nov 2026 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794432943;
	bh=GiLrJsK0i/ckXgWaDlbef6TGeEOzJ1BPFASM5Mf1Dm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TQyowssIWW+ldhbXHt3ypnihvJY5A2V8A1ANyggKEptG/EKnniGrg0vMcNbDWRxpM
	 i/K1Jqbjg0PKNkaMzI9cYXiqL60QROS9FkYFDVY/AOGa7uqFqrQi05tzQDAh5By8V1
	 fvr3qr2TkFfEx6gIKUJbXu7bXksFRI11IHQgncEMfvVgMck+Me5vklonxrkX3WqKDx
	 IibRBU/J5lj9H63TRIzC/wPCdGWNFLgCEGIjDN6zFndiUvXRA4DltB5+eQ1RfClMiT
	 45GyZ85VVFDJeQ9h+N02CT2I1yfVLT59Ohc0PNkK/j5NInFd0ple3lV86gx7130wWi
	 CpzhVNiOBej3A==
Message-ID: <72f286d5-3f1d-4350-b463-09f7b320cacf@kernel.org>
Date: Wed, 11 Nov 2026 22:35:34 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Tal Zussman <tz2294@columbia.edu>,
 n3rd <18670333770@163.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ljs@kernel.org" <ljs@kernel.org>, "ziy@nvidia.com" <ziy@nvidia.com>,
 Mike Rapoport <rppt@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>,
 "security@kernel.org" <security@kernel.org>,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
References: <606cae9e.bbec5.1a1c54f4f9f.Coremail.18670333770@163.com>
 <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org>
 <44abb8ef-7711-4ad0-be9f-ca47206892a3@columbia.edu>
 <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org>
 <avS5QcRj85yAm9ll@thinkstation>
 <71e24630-4c71-4518-a9b7-68cf3597ce80@kernel.org>
 <CAHk-=wh=cVrn+xs3fZiPW=kJbFQLwf_C+c-YBCR2K9s9aNE_1Q@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAHk-=wh=cVrn+xs3fZiPW=kJbFQLwf_C+c-YBCR2K9s9aNE_1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 21:55, Linus Torvalds wrote:
> On Wed, 11 Nov 2026 at 12:20, David Hildenbrand (Arm) <david@kernel.org> wrote:
>>
>> It would be a lot more consistent if we'd just add marker support. Or is there a
>> good reason why that is explicitly not wanted?
> 
> Let's not help people do things that won't work on older kernels for
> no real gain.

Uffd folks usually indicate such things through new uffd features.

> 
> Is there an actual real-life user that would care and be enormously
> helped by such a thing and it would increase performance or something?
> That sounds very unlikely, since presumably re-faulting never happens
> in practice, so just tracking it in user space is "free".
> 
> In the absence of some real load with a real argument for it, please
> let's just document existing behavior to the fact that you need to
> simply see the re-faulting of these things..
Just to express why I would even dare proposing to implement something in
userfaultfd: in Kiryl's series we abstracted the uffd-wp PTE bit to a uffd PTE
bit, which made things more generic.

Abstracting uffd-wp markers to uffd markers would similarly make things more
generic.

A quick codex prompt tells me: 90 insertions, 95 deletions.

But most changes are documentation either way, so that doesn't reflect reality.

Now let's ignore what I wrote above, I just polished another uffd fix and most
fixes I looked at throughout the last days were uffd related, which is starting
to get annoying.

So yes, no new uffd features.

-- 
Cheers,

David
