Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5EF397921
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621096; cv=pass; b=XhrcbBMXm2CrtoaOVHqzvGe7BLQLZTbxkqKZZMhfa9WXUbZKef3VzHpidB52JKGy5iiWwpM3Jl9WGU8E7eUJRuiNyPGcbb+EIV6VJLuVumwFX5t96ycd+yF6wjLhOAhrKzmN21NVH1LnsurCky+Y9YgBrYaFzH7a65Z208A9sys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621096; c=relaxed/simple;
	bh=XbAAAKuCIZsrCvYM1W9GX9bz0Evcj+nhL3IrdoI29kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AatOYjjjeOafh0cximXIQMxt+pOnLDpiA9WH2/Q0OxKNqCgNyS4ev1wnPhfPSgQIj/jnwHCr3i6tGleb+tX+bEwDoulTe7FyXpjPTHWbCSDXhNmt3TIT5HfLwuVHYsT7IvjouhTF2ab5AxByo1JUHWXbJhl2AoEL/Zfh/yzalek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YVM2gbMd; arc=pass smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YVM2gbMd"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988bb9d0548so22498241.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790621093; cv=none;
        d=google.com; s=arc-20260327;
        b=NToqXYd2DFIDEzv12tZGncjCtJIlxxhdWzBKuRPrefcZv2+RlhjZlUwYdfkWcPWHeD
         RyvrTdtWm/PQGOEz8ixjCovHjaAUa5fBQP7gy3+x4zSBDzgp5hI2JhPxj8rxhq4YmlSk
         cIfd37Ge++4Apymx5gt/qie+shaxAtt2Tm7Wn4wZF8rZysSc8twBYEnhgG2ZZQVLK2zu
         U0cQqOz6Q4pqfcWqVmFDtlFRsiop28Xr1aw2GUW3tEbFqR3GozgAJ2E7sYuq+9c6wKik
         s1rjepX7qmb2XQOhECBFfFUitaw9CEtS9Xhkt8nW80nzd1K0C+T/fCPrYUIxRRpGe6Pf
         E9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9MUoqVvpT69Aq5ZarehzNgWsu7OePV3YFvLIai8Gmus=;
        fh=/69YCRXMQPjsFzQmJxsSMcu4RuM6Z0KLUlzX7MX7x7o=;
        b=FWX9RR9b0eUJRF3ZnXTUUJ3wWiH52g1eBtGjtyn0xuxfVX5DFpv4EX0m5N/S3AQrjz
         R2sRiMhyVTnVizzwmNfPiQqsolMnVnmy/lg20N4vyYnRzYYyZWYBpXHQeJPmUAbMs+aN
         nYizTa+BxR/mbb5ZNNB7IMYUq0Jnoepfb2Nm1iU/gblpBrMB7Xi9i4W+Z+dTxmdQKlWs
         tsC63tUs88545O2rcOYjgpEcSJ7ttT1vwxWTEy+KBLsuJOZwRWpsHPpDezX2pisI7/kp
         G9C2XyiX27jCgyuZ/cPp1IqqtCF1H39SzbV9/+f91BwX3ZRF79ryM/J3vzDlJXlw6wPi
         mY+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790621093; x=1791225893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MUoqVvpT69Aq5ZarehzNgWsu7OePV3YFvLIai8Gmus=;
        b=YVM2gbMdA2Q47HpupznRjIt+6Fc4f/48cCj/As3vU2RaaIbdRDqLEg75M+w//aMJNi
         kStmG0+tXsAmiI770/XWOBRjgd5JDhdDfalto1XXpI3Gsa5RxnZEpqp51t1Vkc7YYbtK
         Oakttb6L8xZAmjifur3UK4jEM61pzNgrmykW5fKPmqmDTvSnthAoswR/kZ3kAVqmhkW9
         E8E/vKVbRo1TS0kSuurhkO4EWsUMPIpTMuDTY9Ig/VXUl8YWoivMhMiEAgPL4i+Aepi4
         YKiXoWEjDj2qEhh8yQ44yvJGfR29OaspgiSDk3dloURE/v+pvjphKo8Ohz82xv+fv6V7
         oa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621093; x=1791225893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MUoqVvpT69Aq5ZarehzNgWsu7OePV3YFvLIai8Gmus=;
        b=2d6WZBLawISD4/ymZ5yWG2KY4nmWqOOrd3sMTZWuF8/k0URktdJhI8ZklU8XMmvQux
         msDAXqGINNGGwtzXM+UKP7GOvlman100sZHr8AWXlo7dzn2pfn9y/j6GU0V29kgWog+q
         UgRwUqG4SVDD5hESZxeGL/95I34kWwOTeJ3gApCnvt+WBEGIbLilC39oeSmSNZy6NCrd
         KVA2CwLpFyXj8mbR1ZsHanZTOIMK4L3TM5T7L0oQWfMpj1KlTG9yP4bhJ5Py//ofX+X+
         vhPCTwXhlowxN53C8WLkiXah7elZHaRsKw+RXZMyID1Zp5Ieq435llLT83i6Llf/2X5M
         KHVg==
X-Forwarded-Encrypted: i=1; AKwUvBwY+X9Chggx8P0SD2Z+7YHnrg3kpp01ZfrZLP6RILj4TGGPvK0pzj8p62QKxVXnal1gRSuDr8W0NU6lW0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYInkHhaDvG/KpTwfvaRWAoaKiXNNt4OwWf/ICtQ350ndEMt2mBl
	1Ok5565I+RhJW42TPo9ZY3v1w8oBvrNuHhraPJXap/8qA045fX43vQfnyJL4AeaPTzBGX33Su3B
	iTU/zT1Tn3WOrY1v+2DYvvJVULYwrn/2XyRAItY4=
X-Gm-Gg: AYBFou3YuuIDhs/9PnwB9e/GPvUK4TZ5LhOmG9iVY+w82Jx1VhBY4/pseKuxlZYWeue
	H+I5oQNn323JzbN4GITA/Ykm2jko/I0wu8XgIi4uGMdtXmkDaajk4d2NRtRrSClcZJxAHy2RNOu
	guDO09A9l6M8qkvo3DebFmMeX+g5aLx1KHBa/DHtdH+YxBqaoIyiGwU/kQ9pXhU1N9TyFdOGPnn
	dtgZh3EhbkZ3uEstIuy4178VjrCmoFTgmMA/ewytuvl9J7ZpxvdOXgHqRfz3bmWW9KGhzZL/z6o
	9Gk5Qb7B+EKRFnYvsnlD437FFwa3HPdNzcDilVuIoR60ktEYWHansYASHPknLMQXki6/tRmclyV
	Fx7IORA==
X-Received: by 2002:a05:6102:549e:b0:7b3:3b4e:e4 with SMTP id
 ada2fe7eead31-7b33b4e251emr2377156137.2.1790621092753; Mon, 28 Sep 2026
 11:44:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925204423.80661-1-morbo@google.com> <605221ed-a1b5-4179-be8d-b206c79487d7@intel.com>
In-Reply-To: <605221ed-a1b5-4179-be8d-b206c79487d7@intel.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Sep 2026 11:44:36 -0700
X-Gm-Features: AclHuK9vzOTIpe5NYpVAFSvvrNTDuflNtvpsUCuDxpjVBNqxintxAyJXqYTQDl8
Message-ID: <CAGG=3QWoa0sK1P2VEAW+76EkFsjzXEZ9ucJg4iiOv29i8Sgzxw@mail.gmail.com>
Subject: Re: [PATCH] gpu/buddy: add __counted_by_ptr attribute to roots
To: Matthew Auld <matthew.auld@intel.com>
Cc: Arun Pravin <arunpravin.paneerselvam@amd.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:20=E2=80=AFAM Matthew Auld <matthew.auld@intel.co=
m> wrote:
>
> On 25/09/2026 21:44, Bill Wendling wrote:
> > In 'struct gpu_buddy', the 'roots' field points to an array of pointers
> > to 'struct gpu_buddy_block'. The number of allocated roots is tracked
> > by the 'n_roots' field.
> >
> > Annotate the 'roots' pointer with the '__counted_by_ptr' attribute
> > referencing 'n_roots' to enable compile-time and runtime bounds-checkin=
g
> > via KASAN and '__builtin_dynamic_object_size'.
> >
> > In 'gpu_buddy_init', 'mm->n_roots' is initialized first, and 'mm->roots=
' is
> > subsequently allocated with 'kmalloc_objs(struct gpu_buddy_block *,
> > mm->n_roots)'.
> >
> > Since the bounds associated with 'roots' ('n_roots') are fully set prio=
r
> > to any array allocation or access and remain invariant, this annotation
> > will not cause runtime panics or false-positive bounds checks.
> >
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> Would it make sense to also do this for *_scoreboard and free_tree, if
> we add a new field n_orders?
>
Sure! There's already a 'max_order'. I assume that 'n_orders' would be
more dynamic?

-bw

> > ---
> >   include/linux/gpu_buddy.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
> > index 2c36124bb696..d7249e500ab6 100644
> > --- a/include/linux/gpu_buddy.h
> > +++ b/include/linux/gpu_buddy.h
> > @@ -172,7 +172,7 @@ struct gpu_buddy {
> >        * a power of two, with each root being the largest power-of-two
> >        * that fits in the remaining space.
> >        */
> > -     struct gpu_buddy_block **roots;
> > +     struct gpu_buddy_block **roots __counted_by_ptr(n_roots);
> >       /*
> >        * Per-order free block scoreboard: free_scoreboard[order] holds =
the
> >        * number of blocks of that order currently in the free state.
>
