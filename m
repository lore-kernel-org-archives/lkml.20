Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417830;
	b=IOAXGi7uhZ89R4z5koz7vwFRGRlDiiF9dkFJTqypW+Bm7BCy3kBQ0oLUzvkVc4yDHtg/
	 emHYKJcpMXA5Kexy2YMULDjT3FAx+Hf0EBgU0oK0YNfBCSXIYqoYc51EifJbqiizc+FHD
	 F+PJybDZR8hnt72wKx6xVUu/sE4ElT+UYf1JHJ7gMYcu722jF0FoGKmdxAJie3Gb31wAd
	 9KDBo4PR+xQwZJz/q5b2NUerbA/nKHzKHZ1GRfjlVyHAu9oHW5NIouNfhYTnc9XU4oUiA
	 iw4qxXz9NJ1R4VCUTw4+U6qYHJlqcxU3QOuW86V1T1mzybmxCIPi2OZNHMta27if+ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mcheYV28FEeG84nrqn2wc0u+T+lt+CzxE83toBxPN9U=;
	b=ojYh+90G0w2PIzgI2EgyIGMn9/UxjKoKSnApQRc04LtmmCYH5BxywPCoBmvrbmB724yT
	 pjzNGWQzKihMzN06NYdt/OmrWgAVeRlYaqZ4mvLtPbZAvy+vEzQC2S583T3REGUDDQWT4
	 vKNa4HfichdtidkwMwyvmxxVUQ9tp6e1MIR7I6saukoz5alFaweraqmDLodt5LC3Fm0kb
	 h8szXO7tSzcEOHM6hC6E+3ql7k2dhyGnVuRQgqgLWFhQoYBxD5SxIn1xx2cBg2dvdHSKL
	 HdGPxq1bK3FNmQ2IVyrNe7y1I928DfpQLBHk2OfL1WPvtpI7SvW7tCbjct5+1U/RMPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqJ8b83f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A5B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqJ8b83f
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so29959955e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:23:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417829; cv=none;
        d=google.com; s=arc-20260327;
        b=iGxUzaablMgwqF/gSUiEs5Qv4c6mVsTTKTUyZiMiaqo5D+7J/WgLk4J0cVdo9haBqO
         3YJ6siO5Gm5ukFp7aG6ih72931+gR5jft1NLJcQIEamsObzO9R0K1wjh4km004q/pVJm
         8VTOCYs1f2Nlou66FYeN4dThFlFMIx5+hWWskRF4TBY5UVHHoUgbXN5q8tRTD2XRm0Vr
         iWmUoRHWbOR+IKzEeAK0BReZ8RUS3DlQQYPLJmsx4LlLCvif7aYRmUcnNBMMDPsdauS/
         6PXxosWcmr+NsjGGYqEk5HKIejDZTS9/gL74mCPGg8J8OY4Oy0CbNKBusWOiHoip6vm9
         lASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mcheYV28FEeG84nrqn2wc0u+T+lt+CzxE83toBxPN9U=;
        fh=OtQDvWAdxSsujL49B7JcNi1S5tcMGmqKCNuWeRidfFY=;
        b=aMGT6AEJuKmzHVkpLiIdQ40mMNwp56WT4tsB/ZEdf4yrgCEDwEl49VulCTXZmlozyu
         LVfwU2UTqQaHrLzu1pvs1nHDOSPvcEGAipQsbZqD7LPFRCBT1/FnZCV6HCRdKcL2clr9
         Fjd8E51l1748eAfBGPEa/6hIIPGvK2lmr8znew7FwsdPeOWWKoYUqNMwptb9sDpRwTtG
         tKROys5PXXbskuOWqfWmTLz8+3qHTneCIMIPUJBzrwMAxiMMAuPywZt0AmvsAMcfJswM
         EI66YCnHv+bK1pw4VmK5NlzLIw/q6p+qXGBKYelRHNBA3roerFK7EOOUj2Dh+ahzDC2N
         7llQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417829; x=1795022629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mcheYV28FEeG84nrqn2wc0u+T+lt+CzxE83toBxPN9U=;
        b=CqJ8b83f1KMpy/K1yhK/Lg784IKw3rLjy38aQV8uidyWbaQqY/2CMytYd82yln6dzC
         Zvk2lXjdLFdsuoNimC38HLn1j83mOXsrremQTF9ukfmBx5WA8WerX87Y+Vb2cJ0/CU2y
         yAkuIdsupRWE0y9nIR4sb8hXfkkCFQfn9dB+ZomPw/2Qr3DpMjnJFAg/8Bl3osDzoFQ+
         jLv0gNdyZ8bMa1HEqzF9QK4KB6/IvMYgz1V4cjp4kUQomLwTQwCZes3R/U+zfeACeLTb
         9ssdT0gtP16VoPUI0UDrNA9xJakm7siXLPEkyCrvECu2eD+yySVnBNQoN2fQRv7iWfgY
         sWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417829; x=1795022629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcheYV28FEeG84nrqn2wc0u+T+lt+CzxE83toBxPN9U=;
        b=zZUOvCPRRQHbSORyVCsAFd7jerA7aCInie11sOhAASLk3vkWhUeoTkO724BtrPKLdm
         UP+W8s8wsIvHx9lPG2BPZo/dQTfrvgqzHK3H5OsdyCDMrfhVFmi1NDO34xjeRjwQa7ul
         YSGgK3LnhfPv27Mz5UedF5NIGz5Gd9Mwwjny0V3gLgxP4fgunujayVvW5ovfMymLb1uG
         LwYQWD0VHCqAJcOq3nio4LphkEm76y3QMyTRCOUvs8ad+nOBPYKJEMYDwRcIkvXEXp+8
         XBQYypOdWWkNuhYqrnmYi0bUfBdJAFs5AprEfEsgoSFAT+KtTjlJVUOycDrCCQDDjxgS
         ROJg==
X-Forwarded-Encrypted: i=1; AL+hErFZdyqs2hgeXeNihBFlUp1Z7tWeAe5w/Ri2hysxQh6AIsatb27iGN0Pi5Q12xK59Mo+smMF69qVldQ/evs=@vger.kernel.org
X-Gm-Message-State: APuU4Z89b8l3qnq8BPc8JDqbZnfkV3KVeTwaR94w9IVbI6GuTMQdgTpU
	4JbVmfGPMqItY+2RW/v60Fmwi6u832lRToZqPtRrEqRA1FCejq20jtyC2mnymQp3yCFz7H8NW4C
	ntsdmp9FkFN1reBs0am8OVMhBvOSW4Ic=
X-Gm-Gg: AYBFou3cNm00De5Fgh2M6Ldo7TTTaW8wwjJhnbJ1KgAdD6YmVhroANJacLEk3ZlBGXU
	2pC3lg76IUTirJcmvn/8u6LTh6Y6MzSbjDuritdbnNbS6p7551MEOp12RpvWPRr189I7HpoPx8+
	pj+SMzC/J8yqIq0BeJE8Ye/WNqr6j5gTyQI8IWSzEPi5W5Am36ZXoUKj6Vo0dUwWikoGTECdHC7
	w9gfwlD0/WIWZNy/Mu10oqBHgW6EUhMCAr1zqxJWws618t4ylhHVybIMUSNEDxfYjWVEqsOGLko
	9JvuOxNlbMRgzBW0iMTcj/y95cjjbM4IAd5Rdn1cYpIm6FYe48g+GJ+CPLJdxsnNCDTIu/3slMn
	1aEB/KV9xFX61Z4ZKySfUjdEn6/PK2qdiOYufcZTOCdkN
X-Received: by 2002:a05:600c:c11c:b0:4ba:4395:56d3 with SMTP id
 5b1f17b1804b1-4ba43956399mr35681085e9.7.1794417828858; Wed, 11 Nov 2026
 09:23:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026080329.140244-1-hao.ge@linux.dev> <20261026080329.140244-5-hao.ge@linux.dev>
 <e1cfd568-8fdf-4aa1-a8c5-961bb8d7efba@arm.com> <5b0f90a4-c7d2-4f12-9d95-95c7149c49c7@linux.dev>
 <CAJuCfpHOZPKKd-bGWavBmBf5cmR-PEZO7a_jxXMZVS8tsgG5PA@mail.gmail.com>
In-Reply-To: <CAJuCfpHOZPKKd-bGWavBmBf5cmR-PEZO7a_jxXMZVS8tsgG5PA@mail.gmail.com>
From: Uladzislau Rezki <urezki@gmail.com>
Date: Wed, 11 Nov 2026 18:23:37 +0100
X-Gm-Features: AclHuK9kTkE7tX3_RqNj8eIIBWW_zm-niQDFwkMhLI9nwK05oSQZyNed3nD4i4g
Message-ID: <CA+KHdyWZ6F1=xY1zrJ65TBwJad5k8gkuKmws_hOHVuGtj9q-JQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] mm/vmalloc: propagate errors in vmap_pages_p*d_range()
To: Hao Ge <hao.ge@linux.dev>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 5:00=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Fri, Oct 30, 2026 at 2:16=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Dev
> >
> > Thanks for your review.
> >
> > On 2026/10/30 15:29, Dev Jain wrote:
> > >
> > >
> > > On 26/10/26 1:33 pm, Hao Ge wrote:
> > >> vmap_pages_pmd_range(), vmap_pages_pud_range() and
> > >> vmap_pages_p4d_range() return -ENOMEM whenever the level below them
> > >> fails.  But vmap_pages_pte_range() can also return -EINVAL for a
> > >> page without a valid pfn and -EBUSY for a pte that is already
> > >> mapped.  Pass the error up as-is instead, like the vmap_p*d_range()
> > >> helpers for vmap_page_range() do.
> > >>
> > >> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > >> ---
> > >
> > > Fixes?
> > >
> >
> > Sorry, I missed that.
> >
> > > Reviewed-by: Dev Jain <dev.jain@arm.com>
> >
> > Thanks! If you have some time, I'd also appreciate a review of the
> > remaining patches in the series -- or Suren and Uladzislau, if they
> > get a chance. No rush, I know everyone is busy.
>
> Yep, it's in my review queue.
>
I see v4, so i will have a look!

--=20
Uladzislau Rezki
