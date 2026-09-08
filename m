Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB231568FDB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886062; cv=pass; b=u9/FkAwX3FO+rBG5t6meLytJNdyLjC9Jqnc7N6F2GKIR/tt/A1mWO9fmLo+qm63XOXoxpEnXYg/KwTWUoplgYTEo4SgeSUKBQb5FfN2skNaziSLgVeTx0sfCf2HtAoE/IwSpaznraL10MlN4uNyELzazf7IlaUWRJ7n+ewrKEOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886062; c=relaxed/simple;
	bh=mwAxvZMzHRoyoS5SlFNnDSEx6Xh8O3uTGsYLqZ4P580=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRa2MgvbQt62rpRLM3LuKPmNpB0UP60e4X2OaoeBgCUeVbCOPX+CDVGmJXUeTLDp+/GQbWPBu/UImKDckDLeeRHUSg9iDEx054lu1r2zf0uDTJCC2OkJgyubwCbB62M2VGiKXu12Q7clT+e1/9MmjyzmWUcPuewK9iXvzZopN0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZeWDij5q; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZeWDij5q"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so27056535e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788886058; cv=none;
        d=google.com; s=arc-20260327;
        b=d2oB+9ZLuXkqKlSl91itb9PcNFcJp6tFWBYrMbG4nr+wQxjEaIhUQWDGOX2/TzqM2S
         vjAhzqXgnq40ycBbvv2hL6QK5MmqNQvLatuanq1XQClnevb+ASZ3xDVR33lnV+cXiWyd
         o0XHRpJ5vznRP59JwPULNkzfPUnMuhkmN+5Ja+pMxX7u9IJLrYBKOaSNIL7j8e/Hfhau
         bZf7+SlwHIXhtaGQwafgo1YeW+ba9yIW8xrrjhckwnDYde/J0SW3r4DdaTjfQvU6ILUf
         /kgrvcdiINg75wN8/LbPr+2XEYY6Igfyfaf6zGrJzafTVGjiALdL70b6wwLYcJ4U4Jac
         8ksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lQTr2U76uYl3nor0tns8i6gi/m+LsiVvyKvG51LqGmw=;
        fh=m664Qk9PI+Bc9s2ey5kczs2DQA5Uh0mXCG5U2oUAXAE=;
        b=fkgo6HiMrTRqFLNH5DegoaV01yae/N25w25kTV67Z2td5QXon3cO0m5POsTz58H9rj
         n5glM0v72qPzsQJomTRSEsxi972c3Vj67zXdAuvy3Dp88a7dv+kkPlABSMGBiiVEQ2Pk
         Rz+1mMsR7wW6LLH93/fhQZA+UQuPZ/DOAxR3yhLW/FJ5KPkaIEUG7GOy7vjm+QFXRoy3
         fV9AZWIVjyHikRp/B0g6fu4YML7Nua1Pv4XYj9d/NT+vsIXnPspVsQMdLgkAQXkWsfqc
         s4V4l8RIFchE1JZir1P1fTLzvTJDyltX+rDK3E1rAC6+gPoLqhiQBUIDPnmwhsAWEx2k
         /qRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788886058; x=1789490858; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQTr2U76uYl3nor0tns8i6gi/m+LsiVvyKvG51LqGmw=;
        b=ZeWDij5qCX58pjNIOWqP5T0WwTbCTYmg9/C3jusLKLwjD09DWYEnX0tdae7ZguME6H
         lhfsqRR1a1twNwVjmiRA+E0Z25HLxcD1pvX4jHJ31YZQGRC/53qQgUw+lJo4NKHkLrRl
         425BHkFkIpOduF245QPbwxdQXdoQCVsk2ydZWdL7imUQtEWxlBpTYbCjPYw5HoDIPFwR
         ZN8SdF1WQAaYoiNp1EhGISVBI/RZ/M1e08APN4/r16Oo98wmnJsQKDSWMv72NL/0O7s2
         HmqaXM808bFk/ir0x0a7IPVbtg5GVCAvwUnHyidWwkWCBDD35wxITvIYgKUSz0wVWUgw
         DuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886058; x=1789490858;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lQTr2U76uYl3nor0tns8i6gi/m+LsiVvyKvG51LqGmw=;
        b=p+hrQozaKGBKfBqq5jhVdVloMeOD3VMwDxAVucUUEI1+UYT6p6sWCzlWjntr3IcFeM
         ZQTR4SwrUROBUpdNAzFQVc5WUp+LlytVqYLvl7Cpaq7D37I78SPGx8Pt4tlbKfacjMQe
         OrUBoddp6uMb0m2to9MDkV/VjRWxsHah0Jqul4JU475GooZN94MG5p4i91/kTuGysZR8
         EoJOqnastWVBbqAlwl77rJBVMAZBPprF1iQzaqfyMF4SFMabYwHSvTAggsjIOHc9Qngb
         faXYvB6QWsG+1STKE3xhlSAW44Ix5ZPcnUYv+jR6KBnstb4a7TkwwrqKCanOGXJ2zCwK
         VJlA==
X-Forwarded-Encrypted: i=1; AKwUvBzhvDWxv6PyZXIFZqpgVQ3rprVoJfsqlO7EHNSWi/xUquSaTQX/Ne6rZKyZFWdWesD3zzCHnAHjA5UR9ls=@vger.kernel.org
X-Gm-Message-State: AFuF++mlzPyUbxR+GKyf5OoOc5scq5i8sYkwZ3UysTkO9IfQDnTP5kSh
	Gsoy1I8NtRlO/Ftri81nvAva9bwznoIRVExeB+ML/0QhovZ/p4ocrpmYWsEyqeUnFAirRYnaO8f
	cyRZCLDCBfx7kzjQ1s/GHLkgjGDTzpl7jCeRw+R8nrA==
X-Gm-Gg: AYBFou3xL12HsQ/YhlRUrM7FegOkL+30MItruq1aL9bnAm5JT+UdvqpQ61zTWRxhu9E
	KXWPFQI+W7b2hP3J+uA1xMj0r3y4cK+kpfiVwTMlycKe2QpEIcgqIV8Hj+hU77nt+E3yeOELkiA
	d2D7vc7fOUG2dXlRetrNUx7xowCt6FFGUgbJ6AjX2CzQl+FmoaNKhctac45kPHYFkNZzY8e5YzS
	x0rNSLVGq95ax5mNTZi9pB/JmDz5irgVdJxUhgc+hkdKZvu+6/LxahZSs8sDdFwpzjb65rVjEb5
	IvxvTD6T/yt9pivDz4q8ztV5J4NbigLJP2fjRWYkI6+RQQuPFA9WF+OyawqryXlT0wUBhsajRaI
	QmtpscYpCTSshO+NP3pqaSWJOc1x7KCbxhULF81p8Zw==
X-Received: by 2002:a05:600c:138e:b0:49d:daa:af6e with SMTP id
 5b1f17b1804b1-49d1c7b732amr46339715e9.16.1788886058021; Tue, 08 Sep 2026
 09:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513085340.3673127-1-neelx@suse.com> <20260513085340.3673127-10-neelx@suse.com>
 <20260602025436.GF2295@sol>
In-Reply-To: <20260602025436.GF2295@sol>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 8 Sep 2026 18:47:27 +0200
X-Gm-Features: AcwNN1WHoSNszmavv4wORasY461K9gsH-mc9zR1O6zdN1S5pOlfHSeHNoKmuOnY
Message-ID: <CAPjX3Fd-YEgnzhMryAJi44tZNs_YsHRAAwsxaKbO_jpgvp=qQg@mail.gmail.com>
Subject: Re: [PATCH v7 09/43] btrfs: add infrastructure for safe em freeing
To: Eric Biggers <ebiggers@kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>, 
	linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boris Burkov <boris@bur.io>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 04:56, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, May 13, 2026 at 10:52:43AM +0200, Daniel Vacek wrote:
> > +/*
> > + * Drop a ref for the extent map in the given tree.
> > + *
> > + * @tree:    tree that the em is a part of.
> > + * @em:              the em to drop the reference to.
> > + *
> > + * Drop the reference count on @em by one, if the reference count hits 0 and
> > + * there is an object on the em that can't be safely freed in the current
> > + * context (if we are holding the extent_map_tree->lock for example), then add
> > + * it to the freed_extents list on the extent_map_tree for later processing.
> > + *
> > + * This must be followed by a btrfs_free_pending_extent_maps() to clear
> > + * the pending frees.
> > + */
> > +void btrfs_free_extent_map_safe(struct extent_map_tree *tree,
> > +                             struct extent_map *em)
>
> The "unsafe" btrfs_free_extent_map() still exists.  Assuming both
> variants will continue to be needed, shouldn't the comment above the
> "unsafe" variant be updated to document the preconditions for using it?

Actually this could be cleaned up and unified into a single function
with optional argument.

> > diff --git a/fs/btrfs/extent_map.h b/fs/btrfs/extent_map.h
> > index 6f685f3c9327..a962012be1c3 100644
> > --- a/fs/btrfs/extent_map.h
> > +++ b/fs/btrfs/extent_map.h
> > @@ -97,11 +97,18 @@ struct extent_map {
> >       u32 flags;
> >       refcount_t refs;
> >       struct list_head list;
> > +     struct list_head free_list;
> > +};
>
> The comment above this struct says "Keep this structure as compact as
> possible, as we can have really large amounts of allocated extent maps
> at any time."  Is there any way to avoid adding a whole list_head?

Good catch. In fact we can reuse the old list member. No need for a new one.

--nX

> - Eric
