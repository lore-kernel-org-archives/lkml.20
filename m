Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9730322C88
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791228813; cv=pass; b=HqQXMt3V6SIh/6X2s6z9b8nCj4BH4GgfXeyjcQ0nOnltBeaiX1Xjo+IJNuubUQ99/1gqHpI+FKODiB5EIdtwNc+PschDHl4StWJ3U8muKv5cZ2u6TUrW93AVKVJOx/eR594idCFUrv6qPWN26l/+sYcJRXVpO/dhMzFEjKj2EmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791228813; c=relaxed/simple;
	bh=jsLpsyC+KaNvNvqB9CLckEKnWKLK5lRXm5n/C+GqoYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1b5TZaBoVJKbE/0Wv5CT7+smzRnYePVdaeMvbZ+S+PojmQesQTVraVMeiZ9E1jkuQHEW8KJLAROeZsIxLvjcPqCv3dAmZa9r7JqtTXgX+UoNlGBSU3rtQAiZqBA5aBGAqdNvAkR170wilHBndsG5AWEeVzRsR+BBJVjks2klIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dUtjYobt; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dUtjYobt"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so397699241.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791228811; cv=none;
        d=google.com; s=arc-20260327;
        b=az8ePhCGI6BteUvVif/UX2A6+IcNSmTbhrsU4dXNvUpIrzW5UGM4mRUAWrU9DtHRHW
         kwo+i9QhJnMa7bbwkBCiGUSuBE557CZHcTcomfm0JA2M01E9P7RDZ13oTVcHW7hO0ket
         VNZOqwSQWdXdmx1ipEeycstCUIZMc+xyPB7r6v3YepBFYM7Q00/eL1/iaB6mX2E/BFAr
         SBNAw2ug4eQg1eZUUcJQknIFdXnmuT4kOmSX6BMLYUwNn4CqFwAOQgDhQ1js4fRzpz7+
         sgcGY7pmboII53mbKgnMe2nOuBCJZLdQVjNm2w5QEMVZi51wGBDMsldwdDkhtC2JqxNs
         rFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+lWtKVXMW2++bit7wvkgTZ38ocIpzbCdiXdguzjZOQY=;
        fh=docFYwtxryq8hYv3Iw/BCm8WDzqoDPTcEFRHWFmdLaw=;
        b=dAJp2lEl79qOiN3f5QxFg+39NYT45JiEc1wa/qBUOlAW/YUM6isHN4m5jTwnodZY+Q
         RPwCZjkEcqpIZhGelXdXsNOFNTDYryoWU1k4bTrjGy0HO6/bUODaH1MuYYfa/XnMw8GV
         KEgBZXHCswociVJOOZKz0lo/UxlxAimaM4cEFSRyLgQs1s1kFi3mKNVe7TBuXfixXpky
         38rrdyfKcN1pKaLq7y44aPl/zCR70wPteO7eKdmjiZG0PkaWpfFXM0VuWqeLsPl2smz9
         OAMHsIZmcHH0AqYrWbvpkQM0TZOIZ+j5LpapqCRLXAbBEYYdBQrw+hIvOA+dtM6hCr31
         9FiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791228811; x=1791833611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+lWtKVXMW2++bit7wvkgTZ38ocIpzbCdiXdguzjZOQY=;
        b=dUtjYobtufLPMhmG2rDtmGsQPayGA+L1glKWeIwFTLtufv0wO00MBuc7bT6ZlVg81t
         0wWnEe5TLaduRNYup36ugDEwSeOSTfLYHAWmMK5cRq8fJlCgq9U6dDGpx4EKh6Ubgbnn
         FS7VzromC13+fsPtSd4Bxztbx3e4/sUyJ1I9SSoRag9QRGX0zQlxjcn3MQAskjoHGBq5
         hm9pUAid4CPuzKm29jFl1HwoXEKqzjO7V7mCra6spWpdta1hNg789VMY1IXWzuoosQ08
         vZNDBzD4YkvNsN7H3OiGOxyDMkwDVJkiHD8yVGjhP/elrVE5epljq39C5xZCxBHkQ2F3
         /pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791228811; x=1791833611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lWtKVXMW2++bit7wvkgTZ38ocIpzbCdiXdguzjZOQY=;
        b=PeRh9gUQLvKuY1JKXnd8DbDe2hoiDHpQlW3a1LRLmf2tLvdR1iihLmonWFgF52wnO2
         0rnWmKvh+8xl7Ah5XueivduGihj4xQBZ8zTZs4x3xrEBhEF2DCW25wGUTFErWSF+PyKk
         nhQtmBFRiOYUGUFm3h40Tyl0CJc7ms5k1K/VLhf7EU4DC7DSxoXTt5bQWKYcxT8p1EhH
         WQCLmvFISuOyFQtYtSqkGjnUuoSK6tUf2cvpscilayOllHTdJ2NBDaRxcurMA1LtHdsZ
         RlwP06O4VR4OZVKujKomGmSGLDlI5HRTwqFL03I5JRaLMg7MeiEpoeQjAHgHT3QW5YeQ
         3jrw==
X-Forwarded-Encrypted: i=1; AKwUvByJHPPCfgeDf0PPsvl2+J70tz4IYG6dgFDT2wqACJLxGZ+zQKTwC8FxvALtfNKuASAmnWu5JEwNRluO2zA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZib4GoktbhafUOKmEDIOgkXlZ8MNHz5bd/3kk9LHj/vxAirie
	Wvb09PrbftevxVb3/hj/OvjWsZA+/wuNYpU7GUKB9RE68C0CI64F+TVMk7XfVWIDMabat29XvAt
	bXOxyhnOWIWtXLyenMq22AWL2JFdDYpQFZYgs/eI=
X-Gm-Gg: AYBFou2pLOqThQXCkNWmt6N4CHxQuhDQa5Nnz05L1R+QGrLMRKbR2LtSrgrQUuZ/gId
	BMr3VMh2+mL1bwQbNyan3eRqmFR84BDE1ZGsAYKeDWSyGTeE5Zg3LwmZlsK7W09RCSAKB6Bl1k4
	Li2RojkgO0/TT68g9l+Q6ejbge6443Phic39mkxM0CNT5KdUxufiiNN2c62mLOcLzXV3xfgokKT
	M5JzRl4l0Wv2GPyzvkONEiINd4m2Xlji78CGdHnM1YEVePIuqBCww8qSlKjweCaR7pOLeCmAFia
	qlwUweiViM77oHv6u4pz/ranQ9rECZ74sT2yql0eWhRrMWxXvCzmhJAICarDGzuFDEUFuR863y3
	mHE1GrwjZJ/PEHzmdpgUwLlwwZMlQQrxKXU8REQ8e+INro3P9qq3x
X-Received: by 2002:a05:6102:4494:b0:7c3:7ce9:4382 with SMTP id
 ada2fe7eead31-7c37ce9454dmr1299257137.23.1791228809910; Mon, 05 Oct 2026
 12:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925204423.80661-1-morbo@google.com> <605221ed-a1b5-4179-be8d-b206c79487d7@intel.com>
 <CAGG=3QWoa0sK1P2VEAW+76EkFsjzXEZ9ucJg4iiOv29i8Sgzxw@mail.gmail.com> <8093ecff-842a-4063-bb29-4eb4903f7f73@intel.com>
In-Reply-To: <8093ecff-842a-4063-bb29-4eb4903f7f73@intel.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 5 Oct 2026 12:33:13 -0700
X-Gm-Features: AclHuK-08Gp8lXrK0ezKgiJftqCSrSRzq-iRMR2siWd-Z9YgizK2rcJ2TL6POD4
Message-ID: <CAGG=3QVooPkjbNi10D7MwN7WHgyhHderziJzdmEet5ne6dPQSA@mail.gmail.com>
Subject: Re: [PATCH] gpu/buddy: add __counted_by_ptr attribute to roots
To: Matthew Auld <matthew.auld@intel.com>
Cc: Arun Pravin <arunpravin.paneerselvam@amd.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 1:36=E2=80=AFAM Matthew Auld <matthew.auld@intel.co=
m> wrote:
> On 28/09/2026 19:44, Bill Wendling wrote:
> > On Mon, Sep 28, 2026 at 5:20=E2=80=AFAM Matthew Auld <matthew.auld@inte=
l.com> wrote:
> >>
> >> On 25/09/2026 21:44, Bill Wendling wrote:
> >>> In 'struct gpu_buddy', the 'roots' field points to an array of pointe=
rs
> >>> to 'struct gpu_buddy_block'. The number of allocated roots is tracked
> >>> by the 'n_roots' field.
> >>>
> >>> Annotate the 'roots' pointer with the '__counted_by_ptr' attribute
> >>> referencing 'n_roots' to enable compile-time and runtime bounds-check=
ing
> >>> via KASAN and '__builtin_dynamic_object_size'.
> >>>
> >>> In 'gpu_buddy_init', 'mm->n_roots' is initialized first, and 'mm->roo=
ts' is
> >>> subsequently allocated with 'kmalloc_objs(struct gpu_buddy_block *,
> >>> mm->n_roots)'.
> >>>
> >>> Since the bounds associated with 'roots' ('n_roots') are fully set pr=
ior
> >>> to any array allocation or access and remain invariant, this annotati=
on
> >>> will not cause runtime panics or false-positive bounds checks.
> >>>
> >>> Cc: codemender-patching+linux@google.com
> >>> Assisted-by: LLM
> >>> Signed-off-by: Bill Wendling <morbo@google.com>
> >>
> >> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >>
> >> Would it make sense to also do this for *_scoreboard and free_tree, if
> >> we add a new field n_orders?
> >>
> > Sure! There's already a 'max_order'. I assume that 'n_orders' would be
> > more dynamic?
>
> Yeah, I think just mm.n_orders =3D max_order + 1. I assume the
> __counted_by_ptr() only works with a field?
>
Well, yes*.

* The original Clang design of __counted_by (and associated)
attributes accepted context-free expressions. However, GCC isn't able
to handle expressions and we weren't able to agree on a syntax that
was acceptable to both compiler teams. Thus, we won't be supporting
expressions in these attributes, unless something miraculous happens.

-bw

> >
> > -bw
> >
> >>> ---
> >>>    include/linux/gpu_buddy.h | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
> >>> index 2c36124bb696..d7249e500ab6 100644
> >>> --- a/include/linux/gpu_buddy.h
> >>> +++ b/include/linux/gpu_buddy.h
> >>> @@ -172,7 +172,7 @@ struct gpu_buddy {
> >>>         * a power of two, with each root being the largest power-of-t=
wo
> >>>         * that fits in the remaining space.
> >>>         */
> >>> -     struct gpu_buddy_block **roots;
> >>> +     struct gpu_buddy_block **roots __counted_by_ptr(n_roots);
> >>>        /*
> >>>         * Per-order free block scoreboard: free_scoreboard[order] hol=
ds the
> >>>         * number of blocks of that order currently in the free state.
> >>
>
