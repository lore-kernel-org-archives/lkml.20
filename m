Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9124A688B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994755; cv=pass; b=s2D2jn5pxaHqXmWcXwzJauO6fbMRKrb9/kJvDki1BYDBNLA2gG2htA1FZnkrDRJK2kWkUL2vXBAhZYtYx9OXiK1T2AwrVCjmLxJR7a3Ci2F4X2CmdEuJMXktyaOicJ7BjQUt3f5a0DfVoA9kdpqQSDzprHI5TuQ7UtopO75MPYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994755; c=relaxed/simple;
	bh=YPar0ShThsM4Q1BDllzdHh7vLirwTr2RgYkhOXfVWaQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsgyqWR4AKtoyCN3+kVa/3E+9JYsJ/5plcSBfTg63gtH0B5DE3YJfJTPgWLB0JXOcHikuHLXrrTsjZxIiDI+A8/NhYDKcBL/HUG28J/TW7mzEqhZvvca+M6VQ2mWiZJLnqd2F7LSyvY6AviTK8W3XKqkQwWZ3YeDqsfEbzyP1vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YBxkolYd; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YBxkolYd"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90cc64570deso4471136d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788994747; cv=none;
        d=google.com; s=arc-20260327;
        b=ChTIB85CavDltVfAcx6Y1coSxhb2cu8As0brp6ZQp+Bl4PQ8O6MmiAn1bSP0pXWenj
         vpPfyhmYsfaQm/OCdi7FMWguNhxcKd3+yJf5ofv4RorbxTUZrmLaznGrXf1Yjp7zsGe9
         euytll4fqnlAUEKrYHxXYi5i2nk/GPsIXhJqQMak6DhdYJMjThI0nkd8dEWRxJ0p+Gca
         Ij73T5ntHUiMm7DrLEWCqqhO1t5/9H3ITyzzQ01Srd69tCGDAuayE1mEihkomb/LP6Lf
         xj2JZymUBS3+d79WmYMdALn3brBa4J1qsk5JQ6hSs3ZTjLiKfAMN8nvCBnzyb2Wh2nUd
         gWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Vw1OtfwMpNDQ32I6eviEJFWmodV7bi1grLL7dzsITvw=;
        fh=XzOHoaFpctVb4RN4VMqesywSxUhS9eWAFKjfElcrPzE=;
        b=kf9nVUoHswF2rf2PsWf0+DRFYFhUXwO/318KXcaXUHK2WZE3BQRDheEYOQ6Yywqtf3
         jeWxfIko72EFNkCHSnkb4inHMOPvgqvJQxw2Zpdepn90Uzk2FjNidg54T/RUya4Ql1aq
         gIL7Wvyr8EunJaglUuJwdawu3Fkem8gFJ66i1IIeUviSzvHIb2KFxdRgRFnf1k34fybq
         BpbE0KM5zYIPX56vdm8Tt8pjTH9pJPtsO+m472KqozpjftZuTinwv94y/Hvm1gv9KRib
         H+bKiWWYXqkOylIZw48bTN2/Z+pGrFU8wj4FKPspwfBk/HTpSY6VCR+dk3FA5zurZOyh
         uyWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788994747; x=1789599547; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vw1OtfwMpNDQ32I6eviEJFWmodV7bi1grLL7dzsITvw=;
        b=YBxkolYd5LJFyn3mordy/6VYhHmRZuxtFq0eCaSUlbBpwC+NsfuRNAlLzwR01UuzRh
         uJz5IiV9oGBIGrZe00rY4Znj35F2UOkN/qsIXj18RJYqnSid5RsXusEXyGjP4trIubDz
         Gl5ZwQPoqtgFXX4vE3+Ars4E6ztqyEa/TpjU6PSDDsmu2KkYW1aPOWu+S4luzBlEVTTJ
         JZhAUr2nt+MmzRT8lJ09YrgSmSLzS0+XoamfeO8OTdUeFbn1BY67+hbwta5xQPoWS+o8
         enz29BdweOS7aBbPlciP7b2C09omsVzXzdeMKfpP/15jJ8KBWF5pFp/w87Z686EZxWzT
         hWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994747; x=1789599547;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vw1OtfwMpNDQ32I6eviEJFWmodV7bi1grLL7dzsITvw=;
        b=ey21sas13jdu2UYJUy8NRZdUQjeCCHRcJkcLPuP9KfjHi+ARwEJQF2FGxvgwGMmq6Y
         rJM2VGozR0wo8wR7JgOjUOmEP10xPIeCJsfxFTd+LlazXx4pBK/wJWa5gbOz3MX75N8L
         fD/Es6KDWoz0kSxhuceycIXo1rlE7ehn+MHvM7IyPcNZk33H1nwEeohIYydBve4bVatQ
         ry+JqXLNd/TEdXo6iSdbf6eV58WDywesvdmh1b1JoBQi35iKxLMP4/XF6ww5TQDUgXjk
         NojJ1kkwZyENsHsKAS4voM6REw+UZ4GPg4C5Ssk89z/A9+aHwAs6YwvNB/sr/xqljXSh
         diaA==
X-Forwarded-Encrypted: i=1; AKwUvBwrorE76W0NMd8XjLqBqGcKuP7XyxA8Yo4PeLxNPX35FeWhaiMfrtAHJfyIGXxTZV1DIQjWN4MR3ckXcpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k+Pi7cwyOyrd3LT+OFcZClViF9Daq86yIkxCG061LUsYGLBNSx
	JETLVh2Rgl5HwVhz+o+ncUOfyuA8EFg/uZ4PMo2paJ+Y0pbfNdRqnpzy9I8vvdSD6fuSgElIK4l
	WKcIgi5h8rgnus845NzST9/1frm+/a9gfqILQiZjH9x8ltk8sDMEgX6EhxSM=
X-Gm-Gg: AYBFou2jp+Qa5j3bLOZLMXCnHo89fJqPOwC+jFGKqH6m/pihS0URSZh9J6c2md2azsm
	KKb/zvIQLPzqsguuAc5lESUB30hEgyaJyjYHgvMOIatKqlUw2L8jV+Pbf9+IW8TnwL1JVZ7h32Y
	1OUw2A58iXrg8L2+QnI89lzZS7MV4NRjCXg/cCKl28Xwa/+DrADSZCHwclMLxGbe49A//ubFgGy
	iEwN32cq/73XwxB6OuuKnzPjEIAEgTxhrEeUg3tZNhzVuckiE1jzbyLtsh7aKhRMT+sMwR4k1Fz
	AIPhvvT4AFnj4+6+XtHbizLmEDv+WZre3WjfhoGQwUtXUNwn6wn8xIWHaruWqHb4bf6rcDBq/fo
	7XM7B92yA7P6NOp0rqwJNLhtbgeNmOEcC4vd6ftZu1w==
X-Received: by 2002:a05:6214:4992:b0:910:3923:cc73 with SMTP id
 6a1803df08f44-912029a7735mr22957386d6.28.1788994746438; Wed, 09 Sep 2026
 15:59:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 15:59:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 15:59:05 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <daa3875e-420d-4de5-9a1f-8c4138a1dbd8@kernel.org>
References: <20260904004342.3162959-1-seanjc@google.com> <20260904004342.3162959-2-seanjc@google.com>
 <daa3875e-420d-4de5-9a1f-8c4138a1dbd8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 15:59:05 -0700
X-Gm-Features: AcwNN1UaHhYdKckV1NwaFmURD33h2SSWZ23mfYpB8hlAgaooFjI5AU1EE7X-JOY
Message-ID: <CAEvNRgF6EsMc4iLSM_VZP-5fGGwKv1YJxf-D7Z+DVANTJhxiYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] KVM: guest_memfd: Gracefully handle xarray errors
 when binding a memslot
To: "David Hildenbrand (Arm)" <david@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

>
> [...snip...]
>
>> -	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>> +	xar = xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>> +
>> +	r = xa_is_err(xar) ? xa_err(xar) : 0;
>
>
> r = xa_err(xar);
>
> Should be sufficient, right?
>
> mm/memremap.c:pagemap_range() uses that and just avoids the intermediate xar
> value completely.
>
> r = xa_err(xa_store_range(...);
>
>> +	if (r) {
>> +		xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
>> +		slot->gmem.file = NULL;
>> +		slot->gmem.pgoff = 0;
>> +		slot->flags &= ~KVM_MEMSLOT_GMEM_ONLY;

Was wondering if the changelog should explain why not move
xa_store_range() before setting up these 3 fields that need undoing.

IIUC the reason is that other parts of gmem code expect any slots in
bindings to have a non-NULL gmem.file?

>> +	}
>>  	filemap_invalidate_unlock(inode->i_mapping);
>
> Apart from that
>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
>

+1 on using xa_err() directly.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> --
> Cheers,
>
> David
