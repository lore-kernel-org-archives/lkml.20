Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739842F6577
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231123; cv=none; b=ptHlpwzdbuJ48W9J5cXF4l95qiRFnwkUx2hcXyCmdAawzgTTMudgQheZOXldvaaOw01ZcwHVP46Wq7w5kOkrzatKY4/RhNA6TAme3td35IB+vs/wo57rqFnmnpdm8oDi+xNxr4gd2LqOhELH2coWvwfWLouhfLfr7IalfKt5juU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231123; c=relaxed/simple;
	bh=TpEdy4DCcdsagqlBe35r4ZMR6HgNJhGBruP8PXLo8fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsaCTbmAVRB1b9A5C7TyQlkKSDrkq8kiWc2byflJUaYoh/ofjortTHBXBQCdAGVJu9tdATuU3LuAAVt5fwdRXy+f6TP5W2hBiTWZGBMkYXC7hj36239FubP0Scidh3SVicmA68tc/7tQy4Q6CbReGdl3WRQfqekyQFPjCE48zvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5Pt8+sj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5Pt8+sj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4A41F0089C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791231122;
	bh=07TxSlYygyGizwu2KJq+nLfuTWfbhdZOQVcdtdrnwls=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c5Pt8+sj+g+xAgirRed94Gdw/2uljCk2ktu7r2MyCBmrici9L0mvH8wA9ncKxI6MZ
	 UGDc7UnwBhD4L09R9tr8ToiiYMO/GhXN00+kEysVl2Clym2VHn33SOXVyHsCuMYmzv
	 Joj4CvdL8dgi9j2+XMfzHWSK3h5CU9T/XKkeqRvlomc7WP7jApvfVh6y8VoFRYalgF
	 FOKP6SYY0AdMU6r2ae9kDCk+AihKmTPgp7bu91G+xMm/ZNOAqivGlIdkr3dbdInvSK
	 f4upYFl7G8RphV9CtcvN2JzdUk8pBJ1F5bvALdA2FyW8AW7cHSVr0l4mmUoPE3BtQI
	 +8q902OxzQYzw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso301365266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:12:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByHW+Hk202SfG1gAE5DNoEh+0SnAPkI3QmQhkXoqdrIsLWbr+sd7L0RRvvp+yNNCH+Vb1ZRfIqYKKAStco=@vger.kernel.org
X-Gm-Message-State: AFuF++mtUIPWlB2IchnbnMbDflwAKf5u+LFWTRhQNIuYWzr1xK6jILtO
	ZIfr6mOiKyMzUAOX0yMH23LK1iLlQ2AYhV1t9GrSnoVYbx2k+iShgjDFaoMcb30Wrfzhzql3Vcl
	rm1VZ+vOEO6FlVlgH5gEx7hrDS85VBJw=
X-Received: by 2002:a17:907:c011:b0:c29:d33e:9ba3 with SMTP id
 a640c23a62f3a-c2e6e9ca0e8mr731438166b.6.1791231120621; Mon, 05 Oct 2026
 13:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO9r8zNJ3mSRf5YyRQYYW-eM2eiFvQMXW4Rh0cT=31jsKZpuSQ@mail.gmail.com>
 <20260903072625.62694-2-itazur@amazon.com> <CAO9r8zMxdg2BTFguwcRQn8n-2CPaEJJfg+T8dWcgO2eV4uNaHQ@mail.gmail.com>
 <aqlpxa61SrzhWF1O@gourry-fedora-PF4VCD3F>
In-Reply-To: <aqlpxa61SrzhWF1O@gourry-fedora-PF4VCD3F>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 5 Oct 2026 13:11:48 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNjeUz1sjOo5VVKefRXkFHF_=H7rAyCghJ4zGSp8Mupsw@mail.gmail.com>
X-Gm-Features: AclHuK9_Dkkt3de2FR8OeLNm291y3_bXQtNm-SuLQJP9zgu2zzwzjIBMyyyGpc0
Message-ID: <CAO9r8zNjeUz1sjOo5VVKefRXkFHF_=H7rAyCghJ4zGSp8Mupsw@mail.gmail.com>
Subject: Re: [PATCH v3 03/26] mm: introduce AS_NO_DIRECT_MAP
To: Gregory Price <gourry@gourry.net>
Cc: Takahiro Itazuri <itazur@amazon.com>, Sean Christopherson <seanjc@google.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Will Deacon <will@kernel.org>, rientjes@google.com, 
	Roy Patrick <patrick.roy@linux.dev>, Andy Lutomirski <luto@kernel.org>, 
	David Kaplan <david.kaplan@amd.com>, Thomas Gleixner <tglx@kernel.org>, 
	Patrick Bellasi <derkling@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Nikita Kalyazin <nikita.kalyazin@linux.dev>, Ackerley Tng <ackerleytng@google.com>, 
	Takahiro Itazuri <zulinx86@gmail.com>, cc-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:01=E2=80=AFAM Gregory Price <gourry@gourry.net> w=
rote:
>
> On Thu, Sep 03, 2026 at 07:06:02AM -0700, Yosry Ahmed wrote:
> > > As far as I know, Brendan is no longer at Google.  I do not know whet=
her
> > > he plans to continue the ALLOC_UNMAPPED / mermap work, or whether som=
eone
> > > else at Google has taken it over.
> >
> > I am currently working on a new version of the ALLOC_UNMAPPED series,
> > I am hoping to send something out soon.
> >
>
> Hi Yosry,
>
> I've been trying to pull just the alloc_flags extensions (bulk and folio
> allocator API extensions) out of this set and my private-node work.
>
> I was taking another browse to make sure I didn't miss anything.
> I just saw this, and noticed i should have probably been cc'ing you
> here instead of Brendan:
>
> https://lore.kernel.org/linux-mm/20260914155115.439742-1-gourry@gourry.ne=
t/
>
> Do you have any concerns with me trying to pull this plumbing out ahead?
> Trying my best not to cause annoying conflicts.

Not at all. I have been poking at ALLOC_UNMAPPED to post v4, but I
have run into several issues (which is why I haven't posted anything
yet). So please feel free to pull out whatever you want, do not block
on this :)
