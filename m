Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423194F55A8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790031; cv=pass; b=L3eIr9QoXKxAi1kjm5oS/H55AKeRK2CWULVeiEa58GyjYZmB1z8rhDNJg6XgqKssUn3jw01kxuIzPGb53MxdawRQkhc0CEOyvFfij1URDdC63XeAVS02FHPN80YhWkmGdGshEohs72HxLiqzH3L54NXmjxYg+4XPsmTEGUwAANg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790031; c=relaxed/simple;
	bh=HvMD0whYP38ILXbRvW4RQd+DD6z86Cgv8Z7FhShCV6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOrdFNHpNdTdNA5fIggq9hfPWeY/gSWhZZgUEHVJAuV2rJF9vA+HddIZhD56+ZdtIzSVVYNAsTPSSXlqLu+myTxu32tA2NjGu6T/g3ggQQGra/k8PMv0PEZj+vpEKWKx00mmkkzd/dlUynDOKMQbiEuaoHbrUjtRR167q8doTQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aQrlrIzN; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aQrlrIzN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so43264425e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788790024; cv=none;
        d=google.com; s=arc-20260327;
        b=n9XYksqFIETQrmjVMQe/VQz4ii4ZVI3DLwWnE3mFfNOzHG3bC7MwdO+c5MftFNiU5U
         pynU38Xrrf0CjtTUZq3/gDHxGH6L3Yv8haJSOaydBizxWZXuCfqNgJsFOmy7/E6aPQv1
         o/ZF3tGy/BmFK3+nrFQSBSEF/z7W1XYP1/kGwZualR7l7RYUINep6jw1fD+Xjgc+kdJV
         0kCWO2FXL0+X0Z4mIE8akqCNxTvkpQHeo1BiJ5aeMrXi366sG93qG4bFNuMlGJHrKABo
         HL8hN/kyzZVkQCUQHD3qT1qCO5SDsJwY33VHBPJimqiLYGGT5NQaMnK6sPCZlGEonYhv
         bPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vg2AiEFa68ARzliVtiEYWMnugqjIY8Sb5bHhQpyrHpw=;
        fh=9rsUGSASXivrxKq9A2JW6JNYxg7FK8Zb7h5TfOHG7s4=;
        b=FS36bivfhQIL505qgk48F0T7ynyYZVdBWe5P7WGLeLCgIZ2br7dnv/27kR0noGs+xf
         ZyRX8qdtQZofnGhJqJ2rdueWN0m3DVpVdS/M6lp/2D/8a6N65tIFqjh/cJlEG1LBabIj
         6EDKeWE5tE5TXrkKG+zB46DCxjEI2+4fajpprKbOvSvBXwJACZzjY055WM8v7xFwjkGC
         ETiFpOU6tghPjU/mqxjmrdThp+2xj2TzB+2Vq4GgEwAaAiMD0Gz+cfkRFEulzjDyceOW
         +1Txok6SGvii/Gh/ZOe8KVrEtUE7pgfgSPg2RdWOGbW3LJM4IlxZku70Ap7XB3W0n7aq
         enpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788790024; x=1789394824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vg2AiEFa68ARzliVtiEYWMnugqjIY8Sb5bHhQpyrHpw=;
        b=aQrlrIzNQyqSfh0XaP2ut8GCXtY2oAawElTBuV+LQljHX0gNJJseP0Tj8aYK3SD1UD
         DxMjndhj5KDlpdyEjZ79evHFe2IvVI6bUG4QUExTHVt3BfH4WcZMyheKZvC4sbHcvvLy
         0un/LJkrtmw4eV8OnJFyUXGOvuzt1Nq0bP0mxJYJNQa1rJ/gwBypWZznL9EtEsx7+ia5
         JB7V11qwc5rDT4HVc+V8HMuvDEwdwaR8EdRawNbtRFNOCyn6VhGnT9LikoOyRyfJNPF3
         UkypSUwLLWWjBO6uU5u0KVpC7c6gx45KQFXmtTtDxEQ3U7M2FcdxMqL+gLfg0yJ7GO4p
         XuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790024; x=1789394824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vg2AiEFa68ARzliVtiEYWMnugqjIY8Sb5bHhQpyrHpw=;
        b=QY+owboDfhUpNcJOAPdP4X0eOZwORb/rx4725YO60snjPVDgWSizNp3G/zjdU9GjwE
         ZudnORfJrkOPdDcBZT8626LPp36LEtljxD9RrPRLISzOWCw4t1iWBECXHfu2j8KIK0dz
         WSLq++c51L4GXjR6A8e6qQ8jw7rEHj52bvkziFhTVDWQoiKgOQBBpScJQKsgZS35VdLh
         +Vg1jqXn/T7691B24n1QmoHzFGSu8oQ00KMU5idt1d3E+3bWIRshCbQX/lpmQrmfWEiC
         dyuOhODSyamFwQMUDVAaaJzfq3AztKVlFQOn/wdV/eWcZ6p04Dv5RVW9r1FVyMLfQHFd
         MOcA==
X-Forwarded-Encrypted: i=1; AKwUvBysbtjHJnd7Hh3SeEqY8Mneg9l899+X6MK5I/3wyx/TLl2254om7krVe8IZsMBFcTeSt5eAKiCYf8lr7cE=@vger.kernel.org
X-Gm-Message-State: AFuF++ldnvyxUusGCVb9qS+7RJDVRWB1BRtwYyk3ufZdAbnGYBX2yx/q
	aNlykZxi8e0maPKb+ymxhDLqTeYG+mQINhpgE8fLP3s6le6DsljOZs44LTz6ce7q9pIWJfO8EOn
	t0ogvRpglcSGhLeihUYtRfbV3dSv94lUZbwlN5vUC
X-Gm-Gg: AYBFou2FU5ZXZxgm+hU5Oy5x5vUaCBmSlYpAn9QGKZOv4LpjTITQHkz23T3qoU0WP5q
	5HdXNDRikCFFx5EjELvss907ZWPBPXYRZ7xGBKVN4FibCycZ3biM0hS0R2UZS9FRXMVwzOJjuBV
	U0SvkUDYCpAtwoN9zHhrtRsC0fXdeepoKeCHTWosHFpqH8L4oF43QxVxGTusrXuE/QWCAtkhhwh
	C8WbKXHMIE1QNbJK649o29gQ0COTihMxJxB6TH5P3vc6XJdW+xf5MsNNmS0fD91CDITn0/DbM2z
	ZU0Go4D4a3csBYvGzOZ7dITMh8nDXKBPZnH4NeBwy3XdWCwLrBJ1rv5oU63wIdUBnikgWz9xxSF
	lpDBcjCfWn6ZUHh5lsrH48qkOaBSHWKk=
X-Received: by 2002:a05:600c:620e:b0:49c:fc6c:be19 with SMTP id
 5b1f17b1804b1-49cff2078b8mr196871015e9.31.1788790023400; Mon, 07 Sep 2026
 07:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net> <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
 <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set> <2dpwVpJS3VbfQ7CmE3HeY4IJSSMXTP_O9sSP3HHHUD7Z29RNEG4Hc0m8f94jKWjFlekcTXvIBA-QdGYrf8w1sw==@protonmail.internalid>
 <CAH5fLgjEfZO9DwcUxaKCWd_hFUrXU+cxiwmRg1UnM2pKD6gPvg@mail.gmail.com> <87zextw4c4.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87zextw4c4.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Sep 2026 16:06:50 +0200
X-Gm-Features: AcwNN1U77QgBa8sE7Mjd0WimH4SDjDY5r-Et6lPB5NUv3A9JgqpUTtiAXpyWSl8
Message-ID: <CAH5fLgjYmvp1Ph3dYXnTKkAvWgNpgCAPeq_7PZhRai6pCNmVmw@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:58=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Mon, Sep 7, 2026 at 2:38=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Alice Ryhl <aliceryhl@google.com> writes:
> >>
> >> > On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> w=
rote:
> >> >>
> >> >> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> >> >> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wrote:
> >> >> >> +        // SAFETY: We just successfully allocated a page, so we=
 now have ownership of the newly
> >> >> >> +        // allocated page. We transfer that ownership to the ne=
w `Owned<Page>` object.
> >> >> >> +        // Since `Page` is transparent, we can cast the pointer=
 directly.
> >> >> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >> >> >
> >> >> > This doesn't satisfy the safety requirements of Owned::from_raw()
> >> >> > because the page may be used with vm_insert_page(), which increme=
nts its
> >> >> > refcount and causes it to be shared the vma system, and this occu=
rs
> >> >> > before Page::release() is called.
> >> >>
> >> >> I suppose the existing vm_insert_page() abstraction we have is alre=
ady
> >> >> problematic, because it uses `&Page`?
> >> >>
> >> >> Maybe we want to change the API to use `ARef<Page>` so it already h=
as to be
> >> >> shared? Conceptually it takes a reference count from a `&Page`, whi=
ch isn't
> >> >> possible because `Page` is not `AlwaysRefCounted`, so it needs a `&=
ARef<Page>`
> >> >> to be able to do that op.
> >> >
> >> > Honestly, the problem is the safety requirements of Owned::from_raw(=
).
> >> > Pages have a "special" main reference, and free_page() does more tha=
n
> >> > put_page(). It even does something when the refcount does not hit
> >> > zero.
> >> >
> >> > The correct behavior for Page is to allow the user to hold one
> >> > Owned<Page> whose drop calls free_page(), *plus* any number of
> >> > ARef<Page> references that invoke put_page() on drop. This way, the
> >> > owned page controls the special drop codepath.
> >>
> >> This does not mesh well with the model of `Owned` behaving like
> >> `UniqueArc` to `ARef` behaving like an `Arc`.
> >
> > It's a different case, I agree.
> >
> >> Please help me understand; with page having a main ref and an auxiliar=
y
> >> refcount, if we model that with a single `Owned<Page>` and a number of
> >> `ARef<Page>`, what would happen in the case where the main ref (`Owned=
`)
> >> is dropped first? Is this legal?
> >
> > Yes, it's legal.
> >
> >> My intuition here would be to follow Garry's suggestion and have
> >> `vm_insert_page` take an `ARef<Page>`. Can you elaborate why this is n=
ot
> >> an option?
> >
> > That would be the wrong ownership semantics. The C side increments the
> > refcount rather than take ownership of a passed-in refcount, so the
> > correct argument type is &Page.
>
> Or `&ARef<Page>`? Because with `Page` being `Ownable` it would not be
> OK to increment the refcount from just a `&Page`.

That's just a limitation in your traits. There is no problem with
creating a refcount from just a &Page.

> > Now, for the use-case in Binder I believe we could switch to
> > put_page(), as we don't need the extra stuff from free_page(), in
> > which case we only want ARef<Page> and do not require Owned support.
> > But as long as we are calling free_page(), it needs to not be
> > clonable.
>
> You are calling `__free_page` directly in binder? I could not find this
> with grep except in the C binder. Is this code you are calling into from
> Rust binder?

Via the Drop of Page, not directly of course.

> From `__free_pages()` kernel-doc (`mm/page_alloc.c`):
>
> > If the last reference to this page is speculative, it will be
> > released by put_page() which only frees the first page of a
> > non-compound allocation. [...] **If you want to use the page's
> > reference count to decide when to free the allocation, you should
> > allocate a compound page, and use put_page() instead of
> > __free_pages().**
>
> I guess this is what you are referring to? We could change `Page` to
> this style as well and all would be fine I think?
>
> At any rate, today I learned about Pfn walkers, compaction,
> memory-failure, etc. that take transient refcounts
> pages. With that in mind we need to reformulate the invariant of
> `Ownable` to exclude optimistic transient references.

Yes we can switch Rust Binder to use put_page() and have Page not
implement Ownable at all. That would be okay, because Binder's pages
are not higher order. But this case still does highlight that
Ownable<_> currently does not address the use-case where the
Ownable<T> is a special reference there can only be one of, rather
than a completely unique reference.

For instance, the GPUVM abstraction would be another case where
Ownable<_> could be used if we have this other model where Ownable<_>
and ARef<_> are legal at the same time. Currently GPUVM uses a special
UniqueRefGpuVm type to solve this problem.

Alice
