Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128665;
	b=0OMVT2oxrFmH85wnNuAutIvmHoMzUIHflNy0JZLdHrX8LDZXdJGYVPIFDnipt784l/AO
	 dwoynLTPqiEX26dGfUtUbxsn+XvwDpYk4CPZ8H/LsvKd5BvuQka6rpqA0c9YNCkwj/qw1
	 g+bD6qvqTeJ7oGbgSUh95s1xSc1Dcn7/4XwvsatBXPfDge1uK7t8Xit2q3qeWCRDiMYFD
	 f1rSL/h+eqMakWagAqidZUen4B/WUxnl9iotKn8cA18YiZ+annFicl/ZWShcLNjMeOw0n
	 nYGwLoFFCoFX1eGEAGxybNzFKyHYjO3HownHpZIMkgpndz1R//PI4IVI1oIhgFncTig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128665;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FlYN2KKQqWlT82Z9Z0NBRecFoRzdbkuctfLJfLHCCSg=;
	b=FeRuCKcKWQ3jYZqa1L3h4p7IcYsddmAZmJambUKbrSmV8aquTyqRTvMwNpFvjh77l9vl
	 jTaMY4H9pEpIXL5C9XEyfHnWOTgCVnx245iH36qHDiPQfSFPjo+SQyGWChS05KOD1kk39
	 uZentHG8h6NRokOkDatDsh81to+e0z7p3FBiEadUvKPmgRGHOkjpK6JD7heM4F2oVAeZu
	 qtVj/UAIuhLD/zihIl1uBBN4VaXbpvYC33y4HwE+lVYHBn+PSZn32G8Z7GiH14Rn3+4gR
	 6K0WwmC7ZziL5vuoiPoa53EFyKkjAJyOeA3zDxqop4UcZ6oB+2DLM6aP7/Nys0RPITg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPNak21m;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HK4ext3p;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C35606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPNak21m;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HK4ext3p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793128663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FlYN2KKQqWlT82Z9Z0NBRecFoRzdbkuctfLJfLHCCSg=;
	b=cPNak21mTAWm/6+xxcUCsdlGnyH22YV0stT+dAjFpe4pYwwMQmSaa3ctgip5fw7kzJuWfd
	cv80HElUvR/qU+mi+WtJKk5tnIJVN8rs3WZNKbWkRc0p8QDJUABO57Rq6QLvROPMwnAlk5
	2+GDEKzAEEovEcJ2DYIeMuP1sR8MZfs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-RWZCagzNPlqufqKCfIHdlQ-1; Tue, 27 Oct 2026 15:17:36 -0400
X-MC-Unique: RWZCagzNPlqufqKCfIHdlQ-1
X-Mimecast-MFC-AGG-ID: RWZCagzNPlqufqKCfIHdlQ_1793128655
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so1793835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793128655; x=1793733455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FlYN2KKQqWlT82Z9Z0NBRecFoRzdbkuctfLJfLHCCSg=;
        b=HK4ext3phS8LUzvMwljdzppHRF8MQpSIiAqAu/dgfSqRN5osOqVp6iHhoPNp+la8ib
         fAo/5HDrcHj88X/1+57QkRMnOt3poY1M4Wje5q6oy9Cg3X1EK7Jc3hcBdS0hES2a1IJS
         W1a738hHxWoi6PD4EhmcUT2MMXNDm3jkyVfEoY+ycHi5rLIdEyeeliu1Nf/zDhJx+cMQ
         eg/exfxYnyNyMbTYpx36t3EQqRK+np9d5dfHC3yFvCCniGPYBUeb2NqWb4ghQJBwUlA8
         W5vtHE5BKwu4WHdumfkCQHHYrmbQyFBKueb1dqCsyNU4dsMfmgNQzpuJ6RIsUFhUsm17
         yN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128655; x=1793733455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlYN2KKQqWlT82Z9Z0NBRecFoRzdbkuctfLJfLHCCSg=;
        b=z/enDW1nlkbYCP+WaYiSaPxtiKVAuWHJzsep9A1uTkV5ZnVxEHsAggX/eQSamuydUi
         1MMGuBnzVBKERFdRar0AFV9tUIOlq/e7mUdYhyJBCh8kKfAgK3f/Okm+Gf6GOxTjNDki
         OoLyyR26wzQVCk6fwzQq7ufuXLYK+VzXAdfVg9ACQ9xU37Jfa90F/9/zkMM/D1ZjmvWv
         oFf2Ah0/ajEBNTd4Lyc1SaVZdtHKQ8MHn0rsj/P6RlwcgNUwBDENnxXhF08NBCgCjnGr
         HZgaU5f7uxOkHAFyoZ6E7e7y3xU8mJiLNl1ommdOcLCyhGndGjboX9/4gwZcdI0puPcC
         VtSg==
X-Forwarded-Encrypted: i=1; AKwUvBxe148K5J2uOC0o1xcwMKkFApiFQLjvZjy4Lghwvl+0fHrUMIaLctvMNrVOure4zfm3OKu1VYEorLNMf6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4RIOLyJ1IC0pMbJQbaXzQYn5mRO1U+GkDd3BFd7Hr4wpcnx1N
	B7rqfgWzG3grh8gS/EPqnTEO+dHDnsDfzb5gD3nrCksTlSPmau+VE9VXDYIgcgDP0X1Wmnd1JMt
	VrcXYAUb7nRt2ijBswfP4nQUf9/dHPrwBVI0H5MA/5/t4p54pOV06OrhgC5A/xZcyHg==
X-Gm-Gg: AYBFou1O5eO2ZPcXSBDGhXU9d2Giq29eWmJzWbOghDd1+uCJOv7//22TGdJuqg4NSI6
	BTJTl0l7mVUymNSSIhwjtHKrj8L5uXpYVIQWo4L5377EmVZ3KQDnz6PhIeiMg7xXSlTZAYmAUUR
	pl4kxOp5fDbhiNggcKt73HoIFBprWD9p6eCFuOsXB7z3ir6UAZhu8/kMsMzIzZAayS7gbx7K4NV
	9dQSW7hwFkutz7eAIQ1D5gH+2ZHKEBsHgt/NO4Xmbabnn1rxVaBJ6+eZaUvRFZPcswHtsQPTZYs
	j4LRXnWg1Qoe/u+rniCT4oEFab6FE9ADCSee5bCl5N6YX5NG63I/OhJsd6NNj152Fe8=
X-Received: by 2002:a05:600c:3b19:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a35acc7696mr216145715e9.18.1793128654693;
        Tue, 27 Oct 2026 12:17:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3b19:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a35acc7696mr216144975e9.18.1793128654110;
        Tue, 27 Oct 2026 12:17:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930e469b9sm5742605e9.1.2026.10.27.12.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:17:31 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:17:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ruben Hakobyan <hruben@meta.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] virtio_balloon: submit reported pages as
 individual buffers
Message-ID: <20261027151329-mutt-send-email-mst@kernel.org>
References: <20261027083627-mutt-send-email-mst@kernel.org>
 <20261027143957.630549-1-hruben@meta.com>
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
In-Reply-To: <20261027143957.630549-1-hruben@meta.com>

On Tue, Oct 27, 2026 at 07:39:57AM -0700, Ruben Hakobyan wrote:
> On Tue, Oct 27, 2026 at 12:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Tue, Oct 27, 2026 at 05:32:04AM -0700, Ruben Hakobyan wrote:
> > > On Tue, Oct 27, 2026 at 10:35 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Tue, Oct 27, 2026 at 02:26:33AM -0700, Ruben Hakobyan wrote:
> > > > > On Mon, Oct 26, 2026 at 11:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > The virtio_balloon driver reports a scatter-gather list of free pages
> > > > > > to the VMM so it may discard unused pages.
> > > > > >
> > > > > > For an arm64 kernel with 64 KiB pages, the default reporting and
> > > > > > allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> > > > > > report contains a sufficient number of large entries, we will end up
> > > > > > with a descriptor chain that represents over 4 GiB of memory. This
> > > > > > violates virtio spec, which says:
> > > > > >         Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
> > > > > >
> > > > > > Specifically, submitting $2^{32}$ or more breaks Rust-VMM.
> > > > > >
> > > > > > Submit each reported page as a separate virtqueue buffer instead of one
> > > > > > buffer with an sg list of all pages.  This also avoids indirect
> > > > > > descriptor allocation (kmalloc in the reporting path).
> > > > > >
> > > > > > To avoid multiple buffers causing interrupt storms, keep callbacks
> > > > > > disabled while we wait for an event.
> > > > > >
> > > > > > TODO: as an alternative, keep using virtqueue_enable_cb_delayed
> > > > > > but add buffers after there's space in the ring.
> > > > > >
> > > > > > Note: if the virtqueue is broken, wait_event on
> > > > > > virtqueue_get_buf hangs.  This is a pre-existing issue:
> > > > > > the old single-buffer code had the same hang.
> > > > > >
> > > > > > Reported-by: Ruben Hakobyan <hruben@meta.com>
> > > > > > Cc: Ruben Hakobyan <hruben@meta.com>
> > > > > > Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
> > > > > > Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > ---
> > > > > >
> > > > > > Notes (changelog):
> > > > > >     changes since v1:
> > > > > >         keep callbacks disabled while draining: get_buf re-arms the used
> > > > > >         event for the next buffer, reintroducing an interrupt per page.
> > > > > >         Disable the reporting vq callbacks at probe, and only arm the
> > > > > >         delayed callback to wait.
> > > > > >
> > > > >
> > > > > Thanks for the patches! I think sashiko-bot found some issues on broken
> > > > > queues in the first patch that are worth looking into for correctness.
> > > >
> > > > Surprise removal of the balloon? Nope, it's a pre-existing issue that
> > > > it's broken.  Besides it's not really practical, no one removes
> > > > the balloon - no need.
> > >
> > > Fair point about that. But I meant the broken queue check.
> > > In virtqueue_enable_cb_delayed() there is:
> > > ```
> > > /*
> > >  * When the device is broken there is no point in polling used->idx,
> > >  * the backend will never update it. Return true to let callers
> > >  * exit their cleanup loops instead of spinning forever.
> > >  */
> > > if (unlikely(vq->broken))
> > >     return true;
> > > ```
> > >
> > > But virtqueue_enable_cb_delayed_max() doesn't have this. So I was just
> > > thinking the same reasoning should apply here?
> >
> > It's broken there, too.  E.g. what is the "cleanup loop" in balloon?
> 
> The loop in virtballoon_free_page_report():
> ```
> wait_event(vb->acked, ({
>     for (;;) {
>         virtqueue_disable_cb(vq);
>         while (virtqueue_get_buf(vq, &unused))
>             i++;
> 
>         /* Stop waiting if device used all that we added. */
>         if (i >= nents)
>             break;
> 
>         if (virtqueue_enable_cb_delayed_max(vq))
>             break;
>     }
>     i >= nents;
> }));
> ```
> 
> For a broken queue, you could exit the for loop early and avoid busy looping.
> It still hangs, but I think it can sleep rather than busy loop?
> 
> Anyway, I'm not sure how practical a broken queue is, so I don't have a
> strong opinion.

Maybe add the broken queue check explicitly then, then it does
not need to hang:

if (virtqueue_is_broken(vq))
	i = nents;


but the issue is what if queue gets broken while we are waiting.


> >
> > > >
> > > > > Other than that, I tested the "normal path" on QEMU and Cloud Hypervisor,
> > > > > both on 4 KiB and 64 KiB guests, and this works correctly.
> > > >
> > > > Thanks a lot! Can you pls confirm whether the performance is about the
> > > > same/better/worse?
> > >
> > > >From my tests on QEMU, CPU time was about the same as my original patch
> > > and unmodified Linux.
> > >
> > > To bring a concrete example, with these patches it took ~437 ms of CPU to
> > > reclaim a whole 8 GiB with 4 KiB pages (vs ~434 ms on unmodified Linux).
> >
> > OK so that's just noise, there's no difference.
> >
> > >
> > > With 64 KiB pages, it averaged 121 ms CPU (vs ~112 ms with my original
> > > patch).
> >
> > Is this measurable, or also noise?
> >
> > >
> > > (I tested this on Nvidia Grace)
> >
> >
> > Thanks!
> 
> Thanks, yeah I agree and my point was that performance looks on par.
> I just wanted to share some concrete numbers of what I've tested.

Thanks a lot!

> >
> > > >
> > > > --
> > > > MST
> > > >
> >

