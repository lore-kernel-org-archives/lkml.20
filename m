Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104810;
	b=EDO4F+XF5J5v6cDZwtkBFgRIIkUEK2RcP4RIi+TQTho7PBRtMMapaFmWSxEURnzMf78C
	 dhq39+0uXJ+UjlmBXdA52Xz9JbgYwcmT9BxKbF+p6XN5ZFNFIweqK0jE3Z8LrLIIYVj4/
	 h26u4wmRMnbBENQ8ZQ8DUdV4FKf8CCZhxEW7/0X1wfqEFH47ozqC2J5huuiDwn7UUiQJB
	 CWrTGXMPPhMjyRS2S8mTPH58MhHihGG7eITFhI6BhOI6d4Fq9ejOeLm/0urxwvsOGjzEJ
	 qX+W2nwO7YzLuJadyR17U7gO8p8tyx+Zk8NmYDvYXxrFAN7clihUAJ/2spHzP8vC+ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104810;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Mi9hiqxsLrpMoS8pdP+ccDuuJgKT+wlBtqA3CohVCQw=;
	b=dBoQ++gej6VPKkaq4GVQ1ywATBpO+pcOAVXVcglAaLBX3ulqQzIvBfx/9ton8KNGOgME
	 LMkgy4FCoo799ps/iAoVUUh/TKfcNOybhISLCvZnY6AVypV4Hb+Ya+44/460krsjp1lbG
	 7BbR8+bKHwJhK+r3ym/xS7px2aCFjbu6du3YnV6f0VvJDCJ8CDKM0GOpi7htbXhoU/feg
	 xQ6IvhjcNrO4IHp7Mwttr5Iqhp4jvi29sdeHMqyb1L9V9uZ2CSKOPk0Cdhb+VHoXT4s+2
	 pIiX459mmCoU3OOIncAUZ/8XgXNuIjvtwyx6tDKEB9FkRXFOg8agMDpdmR7vi+D99eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EqKl6TI2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rrl2bfO2;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E8606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282E8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EqKl6TI2;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rrl2bfO2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793104808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mi9hiqxsLrpMoS8pdP+ccDuuJgKT+wlBtqA3CohVCQw=;
	b=EqKl6TI22NFKEQHMiythpPnsY1hPYzuvTko8/xSgXtKNxKXgWs54PgVbDB71/pLl15jieB
	lwwrxVzePFwbBCNU3iVuuA3qmfxFz4LjshkpoEoe6Wsv/rl4Zxd0KVomasr/H7spr2taVg
	UKnvYxcTR0l+W4dnQXPgX3qMcXPbKWE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-E8eWqNf5PRO8lETgVLXV-g-1; Tue, 27 Oct 2026 08:40:07 -0400
X-MC-Unique: E8eWqNf5PRO8lETgVLXV-g-1
X-Mimecast-MFC-AGG-ID: E8eWqNf5PRO8lETgVLXV-g_1793104806
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so1974752f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793104806; x=1793709606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mi9hiqxsLrpMoS8pdP+ccDuuJgKT+wlBtqA3CohVCQw=;
        b=rrl2bfO2/Ofk2U86YG/wYYL1Eiqqp6TYMBjTyuYt60+yc7C9At6GCwGrOhKsN8OR0/
         9gXB441Ea8JYAGWSMFEyfVHhBAEKQWon2n1viHo+X0ETlOxzgPcE0MSIMXKVlzMMcVP7
         aC2hm3cSgp0TpVUuMK8smszPyWntD0yfMK4nJDWC5CW48M15SYT6gAJ8QS0Elyyz07YZ
         iyJbKg/pIq/3Coi+E1hYrFm/lHtGlh6DpT4wYh1ettIAJWrUpiAFLooPvIQQksjyty/i
         HTZIqHzMfncbKkl6oHmAM/oBbrHZaoxKa1kdwNT4hVKZGaAhQq/0emQVcR/3Z4guZo1w
         k+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104806; x=1793709606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mi9hiqxsLrpMoS8pdP+ccDuuJgKT+wlBtqA3CohVCQw=;
        b=w7wdyYabu9eBLJCeHX1Nj2htTen7JitXhBeurGef4SUfIlG39o71vEAxULWKvWXfxB
         zPzLIS1yBCKIWzK3LM7eP0kk9OkQPVCnGwM0YxzR7BqRNNQjnoJQJ8yZckzx5vzq3ZIY
         HSIx2RkY424SSwxDLBAcQmBBr+lrg58OfXDvMa4ckojaMyvW6ty95/EbHhlG+jkp8wsG
         95HFwFHVTPfm+6kCef4ik4ApiqZQT1U8RfEn+7NBGJF8PHGfvlCO2akXramTJSWR2IDA
         nzBwLteCRcb6C47MYz2sQPjzr/t3+NZQl8auKD1PoMZwj868t4ihlVGPgww7GWd5+t8Z
         sZnA==
X-Forwarded-Encrypted: i=1; AKwUvByOsawHiBeg/L3lAKHjih/0l+keN9H3ge4gY3tkh2weI046f64q04z+WZwDhYNKsGFLeBMFdUWnjNlY+SQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLnleSKmF+ttWC4IfO3Ernn54P3ebyS4UaHJw5iL1h8cOdsz8K
	r1BV5AJqqRWrTSeXZ/kmPnQtkvF858CRRFpxoLfpXzjlMtq0kTZt9xwCzN/YL+rOcsnl+2old1s
	LOWjiQeSIrCOc1RuGCzEcXxqFquY8IlPA0/664SJ1XpV0rWLh9hRu9CX5talMTyzKVQ==
X-Gm-Gg: AYBFou2bBhcD7w2gtmFrsyUQUikRp/Twsmu1iGKnBEabmGeJN3qLc/WdL45vUGVWXmZ
	YHzhFDRznTsb+E053nHS1DSx40OIExPPGkWD1cHyHXoprdUydtMlkZjZVezwhgfTofBkR1OQXbF
	hPzy8u67ldNvLPVF0OrAFpuTsN6FXvlteavv8KrTw3wS77x1TWls3sAyGP1HaqFXf1h09foOdK1
	FKbF9tQHyj3Ei4OHshSmm5d7SV0tu4+jhjPoxB+doX/lguA8/4sqrKPRQ+Q518Xy3xVklzM1N8C
	I47fhmccfWo/AldCbK9GT+RrT/jJAMgYxRCe8fMOsbKTlunertlqvZsjm8/KChXuCIY=
X-Received: by 2002:a05:6000:2884:b0:48d:ec3c:3247 with SMTP id ffacd0b85a97d-48e3ebb18bamr16997757f8f.44.1793104806152;
        Tue, 27 Oct 2026 05:40:06 -0700 (PDT)
X-Received: by 2002:a05:6000:2884:b0:48d:ec3c:3247 with SMTP id ffacd0b85a97d-48e3ebb18bamr16997676f8f.44.1793104805593;
        Tue, 27 Oct 2026 05:40:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm22687863f8f.17.2026.10.27.05.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:40:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:40:01 -0400
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
Message-ID: <20261027083627-mutt-send-email-mst@kernel.org>
References: <20261027063247-mutt-send-email-mst@kernel.org>
 <20261027123204.2671561-1-hruben@meta.com>
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
In-Reply-To: <20261027123204.2671561-1-hruben@meta.com>

On Tue, Oct 27, 2026 at 05:32:04AM -0700, Ruben Hakobyan wrote:
> On Tue, Oct 27, 2026 at 10:35 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Tue, Oct 27, 2026 at 02:26:33AM -0700, Ruben Hakobyan wrote:
> > > On Mon, Oct 26, 2026 at 11:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > The virtio_balloon driver reports a scatter-gather list of free pages
> > > > to the VMM so it may discard unused pages.
> > > >
> > > > For an arm64 kernel with 64 KiB pages, the default reporting and
> > > > allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> > > > report contains a sufficient number of large entries, we will end up
> > > > with a descriptor chain that represents over 4 GiB of memory. This
> > > > violates virtio spec, which says:
> > > >         Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
> > > >
> > > > Specifically, submitting $2^{32}$ or more breaks Rust-VMM.
> > > >
> > > > Submit each reported page as a separate virtqueue buffer instead of one
> > > > buffer with an sg list of all pages.  This also avoids indirect
> > > > descriptor allocation (kmalloc in the reporting path).
> > > >
> > > > To avoid multiple buffers causing interrupt storms, keep callbacks
> > > > disabled while we wait for an event.
> > > >
> > > > TODO: as an alternative, keep using virtqueue_enable_cb_delayed
> > > > but add buffers after there's space in the ring.
> > > >
> > > > Note: if the virtqueue is broken, wait_event on
> > > > virtqueue_get_buf hangs.  This is a pre-existing issue:
> > > > the old single-buffer code had the same hang.
> > > >
> > > > Reported-by: Ruben Hakobyan <hruben@meta.com>
> > > > Cc: Ruben Hakobyan <hruben@meta.com>
> > > > Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
> > > > Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >
> > > > Notes (changelog):
> > > >     changes since v1:
> > > >         keep callbacks disabled while draining: get_buf re-arms the used
> > > >         event for the next buffer, reintroducing an interrupt per page.
> > > >         Disable the reporting vq callbacks at probe, and only arm the
> > > >         delayed callback to wait.
> > > >
> > >
> > > Thanks for the patches! I think sashiko-bot found some issues on broken
> > > queues in the first patch that are worth looking into for correctness.
> >
> > Surprise removal of the balloon? Nope, it's a pre-existing issue that
> > it's broken.  Besides it's not really practical, no one removes
> > the balloon - no need.
> 
> Fair point about that. But I meant the broken queue check.
> In virtqueue_enable_cb_delayed() there is:
> ```
> /*
>  * When the device is broken there is no point in polling used->idx,
>  * the backend will never update it. Return true to let callers
>  * exit their cleanup loops instead of spinning forever.
>  */
> if (unlikely(vq->broken))
>     return true;
> ```
> 
> But virtqueue_enable_cb_delayed_max() doesn't have this. So I was just
> thinking the same reasoning should apply here?

It's broken there, too.  E.g. what is the "cleanup loop" in balloon?

> >
> > > Other than that, I tested the "normal path" on QEMU and Cloud Hypervisor,
> > > both on 4 KiB and 64 KiB guests, and this works correctly.
> >
> > Thanks a lot! Can you pls confirm whether the performance is about the
> > same/better/worse?
> 
> >From my tests on QEMU, CPU time was about the same as my original patch
> and unmodified Linux.
> 
> To bring a concrete example, with these patches it took ~437 ms of CPU to
> reclaim a whole 8 GiB with 4 KiB pages (vs ~434 ms on unmodified Linux).

OK so that's just noise, there's no difference.

> 
> With 64 KiB pages, it averaged 121 ms CPU (vs ~112 ms with my original
> patch).

Is this measurable, or also noise?

> 
> (I tested this on Nvidia Grace)


Thanks!

> >
> > --
> > MST
> >

