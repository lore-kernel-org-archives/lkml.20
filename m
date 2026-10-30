Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370835;
	b=kjPPUyiUcRyxMoE9oYTFsruahEEjWu55D60mLFh/k9CinVe6dgQvkmpdm3YojuAJWuI1
	 +bE24tr31fksrClyhoEClyUXG7TE44Z3Oozamaeu7DT7lo9gpSYpbmaYyrbiM4zhlknos
	 8DFp38atuwsgcWMp/hiCoABBGIpE1u4+ogznD7gY+Euitf85qm3Nu1oHB8hcAlhw4Axa1
	 +VpIE7x6r2jU2PwmgmOH2Wh5yicmEZiscqLTko9CwH5dFIrSbx/3uY5ivCjpkQICNTT8H
	 lfCp8qr22zy2LJCAaxdQ4LJ2FlopM3E9QhPeTrMFo25oldoRm9hXm3FKLLvQRddhh3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370835;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4JFYFF+XVqmPJXdW9AOcrcS6NT5ie/xJlSuvhelbXCs=;
	b=tLlUnv7YK1h15GPbafUPuzKldstW1eEdGcGdqeuH2mvjYeVa8Bs23OQrpYNQG/7vaVGP
	 S2ldomcacdSJ4b4ULS9BmrEn3NkM7O9v/0gqcKIuIhY93EIHNrmQaZox76XuykFMbg/rB
	 5Hb7dCweyIypUAbwKtsdatWs/31xqFrbIxU51CWBRjtNnDScfn5ec3LsNH/r/DUy6HTlm
	 ROQYOhsMBtaO5vzUVja5EWGDNMjzSsW6K1gES/ltIgx5a5LsSO1KbcbqVKehBRj51BBAL
	 j+7jtcxur2FEo/YkEyqBMsCNEciYEtQK019Cvh38tug8JV/Yi4lA6ZRvG5lUd+Bhhdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJXR4YGe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F24A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJXR4YGe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E3E1F000C1;
	Fri, 30 Oct 2026 14:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793370834;
	bh=4JFYFF+XVqmPJXdW9AOcrcS6NT5ie/xJlSuvhelbXCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JJXR4YGeMIsV8u/Etct0mCvf4yMo7V6OVh7Ci1ML8Bg3oxb2WuWNHhHpLkR4ZyoKp
	 qS9ynCkTW2BAJGEBM4upnkFvoYiw3ZwkIwYXV2G9s57/vWCu7LAmnqdHPx0+5sy7LX
	 4MsZbYhquDQfvSz74E6k24KF5pW/vZ10wa+3sPWyj8yiA3vKUHQ08NyUFBJUaI37sc
	 ZBVz9A8zEc1C8I4Ff0wtJP0QFAHuOMXxMUcK4aJvb6A4sKevlDkrwe/92xNfLl1r54
	 BY62xoFCo9MQ7YYizD/5FdtuBXKofnRVB7VjTzs7OU03Oi0adZI80mFS2B7tN0T14k
	 PWOvrQL+AzBIQ==
Date: Fri, 30 Oct 2026 14:33:48 +0000
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <auSqzHVKRktkrtQC@willie-the-truck>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
 <aplP1oUjx96O_I69@willie-the-truck>
 <78638e8a-4919-4c2b-b6d8-dadc7a981709@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78638e8a-4919-4c2b-b6d8-dadc7a981709@arm.com>

Hi Ryan,

Sorry for the slow reply here.

On Fri, Sep 04, 2026 at 11:56:25AM +0100, Ryan Roberts wrote:
> On 03/09/2026 11:45, Will Deacon wrote:
> > On Wed, Sep 02, 2026 at 08:16:36PM +0530, Dev Jain wrote:
> >> The transition happening here is:
> >>
> >> old_prot+cont -> zero -> new_prot+cont ... (i)
> >> and then TLB flush.
> >>
> >> Arm Arm rule R_JQQTC says:
> >> "For a TLB lookup in a contiguous region mapped by translation table entries
> >> that have consistent values for the Contiguous bit, but have the OA, attributes,
> >> or permissions misprogrammed, that TLB lookup is permitted to produce an OA,
> >> access permissions, and memory attributes that are consistent with any one
> >> of the programmed translation table values."
> >>
> >> This implies that a live update like
> >> old_prot+cont -> new_prot+cont then TLB flush ... (ii)
> >>
> >> is safe. Which should also imply that the transition (i) is safe,
> >> since the configurations the PE can observe for (ii) is the same
> >> for (i), except that in (ii) the PE can fault too, which is fine.
> > 
> > I'm not sure I agree. As written, the text above says that if the
> > permissions are misprogrammed (which they are in this case) then the TLB
> > can produce an OA consistent with any of the entries. Hopefully it just
> > needs some further clarification.
> 
> I'm not sure I understand your concern here. Is your concern that the OA could
> be pulled from one of the invalid entries? The intent is that any entry that
> does not have the VALID bit set is not considered an "entry" within the
> "contiguous range" for the purposes of this. (because it is invalid).

Not invalid, no, but from the old_prot+cont. There hasn't been an
invalidation, so that could still be reachable.

> That's implied (if you squint) from:
> 
> IPGVGZ: The Contiguous bit is present only in valid Block and Page translation
> table descriptors, and therefore neither of the following configurations are
> considered as misprogramming of the Contiguous bit:
>   - A contiguous range of descriptors that are each either invalid, or valid
>     with Contiguous set to 1.
>   - A contiguous range of descriptors that are each either invalid, or valid
>     with Contiguous set to 0.
> 
> In general I am of the opinion that the rules around contiguous mappings are not
> as clear as they could be and the VMSA architect has indicated that he hopes to
> clean them up over time. Bit I don't quite see your concern in this case.

I'm happy to review any proposed cleanups to the wording, fwiw.

> > There are probably also cases where we're changing the attributes and the
> > permissions at the same time, so it's not clear to me that it's safe to
> > allow those to be inconsistent (e.g. tagged/guarded vs read/write). If
> > I was going from untagged read/write -> tagged read-only then I presumably
> > wouldn't expect to see a tag check fault on a write?
> 
> Again, I'm not sure I follow, but I'll take a stab. I think you're implying that
> a write permission fault should take precedence over a tag check fault? (I have
> no idea off the top of my head). And you're further implying that with this
> transition the HW might see an intermediate "tagged read/write" entry, and if it
> does then it will raise a tag check fault, not a write fault for an attempted
> write. But I don't see how R_JQQTC permits that because it says "consistent with
> any one of the programmed translation table values" so the HW can't pick
> attributes from one entry and permissions from another. It will either see the
> old "untagged read/write" or the new "tagged read-only".

ah, I think that's where we read it differently. You're interpreting "ANY
any one of the programmed translation table values" as "EXACTLY one of the
programmed translation table value"; i.e. OA, perms and attrs are read
atomically from the same pte. Maybe (hopefully!) that's the intention,
but it's not how I read it. Now that I see how you're reading it, I can
convince myself either way!

Will
