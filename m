Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB439CCFA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978566; cv=pass; b=CrqcyXOgFHYd2fpZG+ngCztH3ljO9Ov+GUBb0OIb/lU7PQ0QnpR8AnrgxbWV+fY3fW7D41UwZiKqdP147lgm/u0UgLZgKG7nhF+W88qLmgCmX9cHfUFNFzKcT0xT0+rNxNvqcSmt+ygFnUSlkJE59t14Ijitef6h0MKK57+UobE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978566; c=relaxed/simple;
	bh=O80U+VoanmQGpDG/i4GPzQW2Nc5FZMWWwqpPOFq4e5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6BpVm/n9ri+q6KRFjyn0b8uplQTOY7CqRwzOCjiy6/9LVr4rzBFFlnNyuuVCNjR+tDM/8x55Q1mcOqifdWwhpG+5CxdsWKB8OpAA2qHDYFADi0dpdJNuGipoUaQKz67OAtjV5tFkzaR0FeNz7oMsbY/aMdMZFTBbsVSBcK0GA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lU96vxhI; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lU96vxhI"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso333291cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788978564; cv=none;
        d=google.com; s=arc-20260327;
        b=bJrZPh+Qm7bEFCig3UDcMBsoEOG8mBFq4WY8/8uKif78dwIA/PWnRePhEnOHKbVFFQ
         TfdAEjIHgnTGyfpSrvc3BpQU3D4ZLS7BU6W4y9BFO9KaHeaaxaifJPqpmJoWCElD7R9i
         YiLio0RdHTZ1Rq10jEpt6lL/UFFNujVZjIETO1SeKCkLz1CtUuzfibAnLrBrHArVQiCc
         iszf1/CYKhN25X2+cSxEMx3L3p4FTPbi90M3BQd6XwDnOdP08kbgFsFoV2pBa20bhhx4
         39Hwuo1BVUbdC0GCCRCvDBb9HiskT7UeXZQyKUogQfYgvRFrdKalN2k0oZRgOh4k3uMe
         w++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O80U+VoanmQGpDG/i4GPzQW2Nc5FZMWWwqpPOFq4e5M=;
        fh=pRdkF1NzX9fyYn/FCTIgxmakxlDmdjC2w0Y3K/1meAk=;
        b=hfL1MVhj2wsEZGVItqSs+0V2gyXqR1NE4D9rrMSeP9C+5BZQ16QwODHe/rteewZl7C
         PRaocF9ipRG+K2xg6wSb9riCzEXVh66r1+vwIq3en1nPAWoyecTcNJUwb2KnCUhjSHDw
         SGpCkDZiAq2tga4ggy4KSnQcnFHw++ceERRLlxutluv7v0MteSBnku1uLkoHmmGx0i73
         tA+rXF/HUbsOS+sxGYrR93OSA3X82S/TxfgVWd3o2bJmspcI5fCtICM3N5MFTpqMqDGi
         r1hPZoO12TkiJSdL8Dg1H8gbZCcIO27UNywYYMUaIrjy0uw+NkCLiHxMRinCZBFJ7ybp
         1RFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788978564; x=1789583364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O80U+VoanmQGpDG/i4GPzQW2Nc5FZMWWwqpPOFq4e5M=;
        b=lU96vxhIbvJ9FR1ob5kmNT95aUvqHC3jDDMaXH4T8UPv/ZPI2k6vC5VKhR/GIMlmmI
         C2bObQ9ofC6i0mHtGZH4ResZ4jp8xYkfzqxnNbhiXyuu3AM8kvC3iA4TVhCbF/n1WN8M
         n4CIefXuBEUgbfloOIowmwGdQ5biX1DkqgmmoTyYWWCaMOdCfec0OM6No1sLz3teHDJp
         fZH6H3OONHCd4RMhQ1TnAkVa2woPmDGfMwPBadxi4rwRHL8ZR5CrvSbXUFoiVY1DS+zn
         9Kb8KQ5jPE1fdZncJshzncWOcIN3IFew4HUxhfYCWhYaZ+//gVV2GAgaI8r7RDbdk6qW
         CEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978564; x=1789583364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O80U+VoanmQGpDG/i4GPzQW2Nc5FZMWWwqpPOFq4e5M=;
        b=VDgNQ7XGDPk22gcmvyBC+rDp2BUgdQSaYxIyye4dCASfLDMY5WzMOCHDs02TlOk7hG
         3TTyTHOzYhJzugt07i+SgGgqpSY0E8l6PrcD01jDVSwVpcXMc9P0jyPJRlDOh2z7Buhb
         LI0iGJ+PsAZVq9IZQwnVNdmsBxy2StdpbuSLkGasxHTxBCT9hGXvOS7T+NTonEZy80nY
         WvH+23veCdAUyaPFKsKFQHEHDYEY6S+g10tP1vLSjDfXAgm9h6l2YX64/UEJ2cCQkcwR
         MuPsaxOgIXX03MT54mcJGhrYQnbaqpjLPzvDX/xSvMb6zxBlio2Js5/7YpClg30kYJzx
         HQ5A==
X-Forwarded-Encrypted: i=1; AKwUvBzHzZQrOpLjaMlqQb2zkA6BreXhUrWluwRvY94BcnO9e1K3xOKuwsoKuLZJ6GqgXASGLu9jfD3prs/zkoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m1oZ3RVXjL8Or4Mf16VVPMSVpq7B6tHcNu1wmrwjfiJ6FYzhAz
	v3d7VL/Vle9wng4it2CsnOSbnXdAgS5C0MsMRbDbHWJAC7wgdpXmuMbpIr5eO/Dqc89hIFsi4Ow
	T55Uml3GwwRQROgueoSdDXODQcN6x/12SPCkgDsBV
X-Gm-Gg: AYBFou0jcO/OFO5rGgCsJ+uno8UvpMKL8eLo5T+aeLKTfn74Lw7up+TbCGe/akoPcM3
	XrXDAj4AJtvmqvIHx5V4HVm50AAIPkTHANfsK/ZY881TgPPPpF2Djb1fGPhyxoMFwlhlcCjhpdm
	D+bnDBgnqjaw26dgENpXbGvKfl36ZfWz1oURg35gTwXa+3HWIKcyOgsXOaUb3n+dsqe+J0bDupF
	HFgFlUFNpL6NYSr1OaYtos4z7emCenExRV7Qec1aNgsMLjqxIdP7w1iPMdEr1MdaUXkXS9f+3iL
	CbzvS1zTSZ50wlzFlStlveOeQKCHCnbvpEsJVL+XCK/E3dkl6vKGlOLHSA==
X-Received: by 2002:a05:622a:250d:b0:52b:4ec6:52ba with SMTP id
 d75a77b69052e-530b48fd11fmr591111cf.6.1788978563357; Wed, 09 Sep 2026
 11:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-2-surenb@google.com>
 <1d5011f8-26a1-41e1-bb9d-8d72c08b8fe9@kernel.org> <CAJuCfpH25ML1+hdhTtZUoSjgrNcGv9HbQD8o5UErmAdW-7C8Bg@mail.gmail.com>
 <855cb221-cd57-4226-9c98-6a66454d3e62@kernel.org>
In-Reply-To: <855cb221-cd57-4226-9c98-6a66454d3e62@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 9 Sep 2026 11:29:12 -0700
X-Gm-Features: AcwNN1VQzVaIrt4CsqSl4wbBcmo6cgneSWi70hN4qsyBG-j4NAiE3BNAF6eDoQo
Message-ID: <CAJuCfpGFYjs7pAstoRhPOWFbi5PdiX10mqBzOBpuJ8qQN_zsQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] proc/task_mmu: remove unnecessary helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:17=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/9/26 19:13, Suren Baghdasaryan wrote:
> > On Wed, Sep 9, 2026 at 10:06=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 9/7/26 08:39, Suren Baghdasaryan wrote:
> >>> When per-vma locks were behind a config option, a number of helper
> >>> functions were needed to simplify the locking code. Now that these
> >>> locks are universally available, we can do a little cleanup.
> >>> Remove lock_vma_range(), unlock_vma_range(), query_vma_setup(),
> >>> query_vma_teardown() helpers.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >>> ---
> >>
> >> As Usama says, this could get picked up early independent of the rest =
(maybe
> >> even as part of the other patch set)
> >
> > I can post the 3 cleanup patches separately from the one that switches
> > to using per-VMA locks if that's preferable. One downside: I'll have
> > to wait until the cleanups are picked up before posting the last
> > patch, as it depends on these cleanups. Please let me know if I should
> > split them anyway; otherwise, will keep v3 as a single patchset.
>
> Let's keep it as is. We can reconsider if we realize that the other patch=
es get
> stuck.

Ack. Thanks!

>
> --
> Cheers,
>
> David
