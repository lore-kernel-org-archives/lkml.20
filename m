Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793211180;
	b=iUWgxv57oOdDO2y1wZGAUP31sXG9IlE1eTjr0Djpc7y2eWI8CMaJ0nxX/ghglgoSrRje
	 e/vMMDGApA+DqnP3D9OH5Kn3jmrJQgJuBfZUv5LzbHnPlfXdIcD6/HGNmoPIeAZeWZPol
	 1/tD5cl34rOatzUIiLdxx/RtBK0Cg4NagXF9HfhnqY4ILkZv3L5HZIjnP4fUgNhsL8O5t
	 dNbC1GME5Cd6L6Tgu+3mLKx4nBPzR4GrZmD3lcWVTdHwjFQydzQCFa95iy3NMvMbvFTLH
	 nrVNT3oC+6qU8irsQKfGcZf2UtwY5j/8YwM5RoZ3j01HIJ9lIYWDlX4P1DRpdmoIr6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ARyFxRSvqAD+wB2pvv1XS401e8GE7i3ocZP4rplHOIw=;
	b=kvAfejOAsgzXBI6rllV6WkH6+1Tb7g9BYVIBbxp/IL684vc15IKVA1aSAcPYzy2vyCMN
	 BHKtSos4P2CduCkHarFbmZv/3Kdwm86WNLw9cKPJghsJ7FgWn/t8xSbuimz6JY7lgKpG2
	 99mbuJG4TEJaxXvHutqcjy0Vu8Bzljnh7B5MeGhZgw3XQj6MA6Ml9d9ozA2tCvE+KV5Gs
	 l4UVtTDCZmMIRGQjM7mKQegpAr0gRDozxAAI898+d+VjN3I2bIcQ/cfey+kf9H4mtYaWM
	 sX+FMAYSCWOq/IYJB7PBc7lTzD9FXzZ7OhsTOfzZgQ1SAXF88av3BFUwmGa2zzqTJZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HIBoTpnA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56FF60A3828
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56FF60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HIBoTpnA
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8565d77c277so12062227b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793211179; cv=none;
        d=google.com; s=arc-20260327;
        b=FHbYv/T5bqVgxbzqYLY55L7BjlB/x5B6ZnxJ0nkMF9teBVHakzBYyhuzBXvB6d4Vpl
         WDlugiAJn9vi9hBg2OkwmbtztjuXsL7DHASh3aYtK2GwBvRa6FyoQXC26Cace4m5vi6m
         KXW0fkCgcailoNl0xJanh0sNJegBuvKxmDUX7wFfb069vjCXaCtvP+S8ZkMXInMDzLKO
         gSEgATDCQq7jmvDH7jk5gG3L4qoMTXNkUfXs9zn/OPNjCX9x7y+Sbze1DNx1MP5WMIFK
         04tQQqNhs2f8yJJsR87c/5EWz4+4sPcWMhJ7k/ua3f0QTiodpAgiCO7cUYVORfXEX4F9
         m7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ARyFxRSvqAD+wB2pvv1XS401e8GE7i3ocZP4rplHOIw=;
        fh=kTz/SrE6qyc3UVAom7KVg1YLEAPQyWt/VmN3T+jRBzA=;
        b=dJQ76zxKJBtXn5A3QEtNHUtvc/7DLlyzD6AyzfdglVp40FSJpfDI/nIgedKHrMa+rg
         WBHHqAMdQyvAvHwB3LfaXRC5coGRvloJwNaODnfEu2ANCwt5lzgfDl4bKjur2dEoGOfO
         aE8R2Y9NclOLriHgQNLtTyUFzI0ik1Po7HI/jgc/VZ0zl8TqltnkRPbOzPb/6JXsm30/
         bHtEL5qOqQ7MfdNniVxYNZPwF5aEXctxDBTjTwRRUUlAPUxMVFQ0zlD5GymJnnp5eCfu
         Po5BvBLmGk2jeAWYJMscG3G7/uN7sienX4PTXicZw4SvK5ziegAvLgqS5lmiFjEvg4jR
         uWxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793211179; x=1793815979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARyFxRSvqAD+wB2pvv1XS401e8GE7i3ocZP4rplHOIw=;
        b=HIBoTpnAvU9mMFCmmSFVKRCFAd659KMsW7tTEnDrrCYuk9Kk2KrpYcvGJMXBp5yYJ3
         FG32/WC1xU0d8/1XEk3ICK8C+q5UqKQoqN5wi38+6NCQdz3qVZN5PjVRED3lJIE2PLg9
         OwAdptAebOFSdCg6RQF/8JpmdTTGs522Iy3kLNSc4QblZphhsOVaQzZABe9BbMr3O7Dg
         hgoALtjUth0N9I/4QptPdUJtpEPLTLEEREzfobo0x76M2nuTycjZfBg3tq0V7bu5Dwz3
         cIxP31Rg81WI0ALjRpZyg2iz6jlWK/028Hh8lNFFQjtnaSPPJ9u92lFtc3c7swQaDpJc
         fbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211179; x=1793815979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARyFxRSvqAD+wB2pvv1XS401e8GE7i3ocZP4rplHOIw=;
        b=Vlhy2uZxoUkgtQ3IssODliqAmJMYPfkj4gYJ90ReGRMyIJFOeZRPc+MmTfN7KoKdRj
         AdwGHkmLUoMhZYzJL+NsuTQ8j/HzylqHlHN6q4kloSVmmJhu+IA9xPUUq5rV5Tavpy37
         mc/WrA3xbSCanXGFPFbtQI9qYwehonEpn2iuP7kAor5UmDFldukfMGpG1WNYFp1V37zv
         BdweDOmaMqfjd5q1voXcwMb8z8MdOfPjY4psZcrryGlKPq7EURMjCc6sRjienHlC6l5h
         kjeCEFefP5tpKvQSrY2m0u7LESN6OULKputv0/vT+xsmMY6/tyMhapXLvpYrXc5Lols4
         v6Mw==
X-Forwarded-Encrypted: i=1; AKwUvByI/ouSctSkbUIvFPY3npnF+tmxtHwnXAaVIqihe1BQ/BSeDl3N0Ur14tpazfaKpgBd1VvMaClsGBp37uw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr/LRCsdx7BlZOJ0vEPMki2YMk4PXor+XZOmotZ9ekERg7S/Uj
	ZXTMBdTPZLgtfyl4gGPOSQ4HcyazyZzzS+Zj9kCum9HLSxP3qt/iZNH/SFZqcawu8DH+KTCvrpx
	Fvq1qK7F4dwiZlkf+uRVsEMLgvCNOB1JXJvbBpiT2
X-Gm-Gg: AYBFou08HALSAxLCphrykFC9qwU93wSR7+Tsay7H6d75XWuayNN/oFxSnbjmA3vYeo9
	d4LK+jYlH6dXANnNDSP0lYQPcM9PHOnl3rRMtWv/ngO4W39AamRX/yDvF9mZ3Hi2J6rPF+0fiIE
	X7NBdOXCuN++/Tz8uRdCrRiueEE5OLCPCMAv38tGiULUYzz6t3cnvhds0loQ5BV90lfBgzu2+Qk
	C2sWZxj7snQSwPF5QJP48F4lsuwqe5B2zlWuFGDTrTeShSsMFvcsfSRNK7mhMd5VHwMexQpXJhF
	5bwcU+LW+L10Cws97r9SUhXEGqNjcx3iqntwagE8RDwgr5PVrb7YiYtDL004dT50U2Dv4CDAQG0
	TYFTvvZipz5e9mNAIhpBHZp9MuQiCQl09DpJ70yLj1J9iqQZmhO2/Zdn6Bt6z0TDv/G0=
X-Received: by 2002:a05:690c:f86:b0:8ab:436f:6e7b with SMTP id
 00721157ae682-8b1b5e93e9amr21228787b3.63.1793211178194; Wed, 28 Oct 2026
 11:12:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com> <279a92da-772c-422b-8047-ad37dbae211f@kernel.org>
In-Reply-To: <279a92da-772c-422b-8047-ad37dbae211f@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 11:12:47 -0700
X-Gm-Features: AclHuK87kmeri51i0i8SscXVJiPFVq3oTJZMZ4FP6A_jqbPgcyRklPs7gnicX7s
Message-ID: <CAGdbjmJ8qk7FCbGU85u9+db5_RtcrK2y_7TfNH+iuz+OJxebow@mail.gmail.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>, virtualization@lists.linux.dev, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sidharth Telang <sidtelang@google.com>, 
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jacky Li <jackyli@google.com>, 
	Steve Rutherford <srutherford@google.com>, David Skidmore <davidskidmore@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:01=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/27/26 03:56, Kevin Loughlin wrote:
> >
> [...]
>
> >  mm/page_alloc.c                               | 248 ++++++++++++-----
>
> This diff stat should give you a good indication why this series is not a=
cceptable.

Got it. I will keep that in mind going forward, especially if I end up
attempting a v2 that simplifies things.

On that note, I believe the majority of the bloat in mm/page_alloc.c
comes from...
1. supporting the legacy inflate/deflate option
2. introducing support for various page sizes to be unaccepted

(1) I can get rid of by dropping the inflate/deflate option, which I
think makes sense given free page reporting should be sufficient to
enable dynamic guest downsizing in cooperative scenarios.

(2) becomes simpler in part just by doing (1). For further
simplification, we could potentially restrict free page reporting for
CoCo guests to the current 4 MB MAX_PAGE_ORDER instead of supporting
any order 2 MB and up. There's a trade-off here for reporting
effectiveness under fragmentation, but perhaps support for 4 MB only
(and its relative simplicity) could be acceptable? Especially since we
would then maintain the invariant that all pages on the unaccepted
list are MAX_PAGE_ORDER?

If I can sufficiently simplify the changes (especially in mm/), do you
potentially see a path forward purely for the free page reporting
aspect of this (dropping inflate/deflate)?

Thank you for taking the time to review, David!
