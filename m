Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4A4E5338
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608673; cv=none; b=Phgg6sjACtVaOl7QD/aKUpxhkEqPam5DtNQ34kmwBptpylXjWf5e5joF+M0mfhHhHhspYeRhc+00mghgNXyxkXr8+NjhY0nDtz2GNBbxWmnGQRNv9L6stgP/C3fnQ/oexS4VFm61SFLB1/LOLWyJQNaQc4ZzZG4r9hYUXbHZJ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608673; c=relaxed/simple;
	bh=MoQp/jgMtWtqRzOkADRju/3eEnGawtzKyzwHaFmhq6M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MvyznZ+FQIng0/ifC5utwUeov05U6YYmnLCD8pfqcBCeWdSFsCSKbOoOY0I3k+x3t2tQW127jwG4Fomg27JNxa+FwhyZrA3y3vrCUoP3PK4OnaHmjMF9v96rKWMUBuarPxVZqz2l1YV9EC+7JD8nxGE/WbWIE6jvxSg+dZICuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzAwhJrY; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzAwhJrY"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so39385851cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608667; x=1791213467; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZV1VjMg9qIgs6SKBKtPynhg7qw1pn60aw3c/594G53U=;
        b=mzAwhJrY/IOSVy6pIUpd9UGJyf0c3Yhdguu96XKS3iRqHgH1/GHiiQY49kQsIvc9UR
         JezkTZFrz4QCgRmupc6bEZenURFxhi0vHd1QSkMsDcwcM86mAwvpajsguvYlN13VIn2U
         pqyRzSiL8LVPAsoZG8LsQxIPdfWfYO40HYoZ7pJklhmoKfscCtV8hguCfbSj5N+KAVKF
         jwMQge4Jo5RRUexWNrhSxcBV+0xMNhmgoT1giQgEtlKk+5TY0EEY6sstwNK80VGoiTz4
         U5GJLArPa6/r7v1c+cJmCMJbQrl6ij9vHEbeSPtpv4cnZKmtp4ZoUK714MYrJJCVy+xv
         sG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608667; x=1791213467;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZV1VjMg9qIgs6SKBKtPynhg7qw1pn60aw3c/594G53U=;
        b=h6ABskGOXm9NGYbuDdt8LulsdBBG2v/mXR5m3PoigK7qO6EIMbbDI/Esv++8GReIAR
         70LRbD5t+FzUttwjP6PjpYc5JfIvgGX5Caz8M8aYdXYkf7XWVNzrza8IuiHALLlythKf
         2im4MjVOaIdFSmAjylJnDl1Lim4DtQuuEUE8yXpb0Y97inOk1Rfb+i5ZlJBNZ/yC4mLd
         o39lGa/fl048ZR6+ywh4ZZ9QbuUI9QwJpCYwxxlEd9rvOJB4hJtmFaDWZ6DO9aSD7nUg
         VR9rvt+G1ULThPW/XyedKRd2h1rWKXzDfRt1PInoYvxnD/DSQvBwoPiP3RpCWwMsS8XV
         Aq/A==
X-Forwarded-Encrypted: i=1; AKwUvByt1XpeAXDJZWQZ+tX7I2ixP8DUHcCRBXrAs0sGhpSfTmixNpjqIMvCrzQTr2TnyHigJfoZdQbLCiaVhhw=@vger.kernel.org
X-Gm-Message-State: AFuF++kmskRzMco1WQK+waxnJ7Y3BcaSNeljlyanAuRsv4Anyq/61qHb
	0ME9d4KcXZe1PQaOKShhDiFVeeN0cfaEnAMufCztkSjI5CKvzIxLki2U
X-Gm-Gg: AYBFou001kgbX2Mpl546sC0xMn5UtUrLZBN+fQ24VxAFoAegTwZtA5W8Fsuopz67W6x
	WZNgrzPpWDMhLPrQvwhKguByLhMYDcKJvB+EyNrvDi9gMN5KjQjvmy6R0EvTmmEGGjuGZk8Yhy+
	AUAXF0niZZy3Yf3sDDe3xFypXM4YTuq48JzODd1yDDONjb0SZHDKv9TTLWdNJyBerliCi7U9Zmn
	Wb4Bsb9WnTczDKCFzF/TfC5Abi+ocb5oQde2HcNi8apwEqXDC9CBUjFXdPk1bEtGugvfSsjv2hD
	+fLZlduRa2b6F2smJ9KHv55Bc/iqDMs/7nIv1H0VSDn7CKEhHIcAdKpexE4HlxTB+kC6oJx0m2y
	wTBTf3X4hwaCiJeIod9y1rC/fWDU9KMSy3zLA7apBEveJxetEHk/fWvBTZE92rbOPwFfj8+f5tK
	a1Wnut00nSTfLfkBcTrqrTpg/zqCl8F1Kl+SHdjqVE0BkpEVtXwhFK7U74IriWIBtQmB9WF8iNE
	tE=
X-Received: by 2002:a05:622a:508:b0:530:2cc6:c8ad with SMTP id d75a77b69052e-5330b5ad6e9mr224448801cf.19.1790608666743;
        Mon, 28 Sep 2026 08:17:46 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332242ae75sm65540811cf.29.2026.09.28.08.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 11:17:42 -0400
Message-Id: <DLR1SNM0T642.1TU5R4E1EQQ32@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <dimitri.daskalakis1@gmail.com>, <mohsin.bashr@gmail.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v2 8/8] eth: mpnic: add basic Rx handling
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260924-linux-mpnic-v2-8-4badc9b58b9e@gmail.com>
 <179055370821.3145.15563353156431464401@kernel.org>
In-Reply-To: <179055370821.3145.15563353156431464401@kernel.org>

On Sun Sep 27, 2026 at 8:01 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 4 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Rx buffer queues can starve for good after a page allocation
>   failure.
> - [Medium] mpnic_clean_rcq() never checks that a frame is in progress
>   before handling a descriptor.
> - [Medium] mpnic_page_pool_get() indexes ring->rx_buf[idx] with the raw
>   18-bit MPNIC_RCD_AL_BUFF_ID from the completion descriptor (up to=E2=80=
=A6
> - [Medium] The descriptor fields BUFF_OFF (16 bits) and BUFF_LEN (14
>   bits) are used without range checks to build the skb head, frame_sz,=E2=
=80=A6
>
> --
>
> eth: mpnic: add basic Rx handling
>
> This commit adds Rx completion processing to the mpnic driver. Each frame
> is built in an xdp_buff from three kinds of descriptor: a header
> descriptor, one payload descriptor per page and a closing metadata
> descriptor. The frame is then passed to GRO, and pages are shared between
> frames using a batched page_pool reference bias.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/=
ethernet/meta/mpnic/mpnic_txrx.c
>> index 389a9e5476c6e..edb07b7f334bd 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>> @@ -405,6 +405,34 @@ static void mpnic_fill_qt_bdqs(struct mpnic_q_triad=
 *qt)
>
> [ ... ]
>
>> +static struct page *
>> +mpnic_page_pool_get(struct mpnic_pg_ctxt *pg_ctxt, struct mpnic_ring *r=
ing,
>> +		    u32 idx)
>> +{
>> +	struct page *page =3D pg_ctxt->page;
>> +
>> +	if (unlikely(pg_ctxt->idx !=3D idx)) {
>> +		if (pg_ctxt->pagecnt_bias &&
>> +		    !page_pool_unref_page(page, pg_ctxt->pagecnt_bias))
>> +			page_pool_put_unrefed_page(page->pp, page, -1, true);
>> +
>> +		page =3D ring->rx_buf[idx];
>> +		page_pool_fragment_page(page, MPNIC_PAGECNT_BIAS_MAX);
>
> [Severity: Medium]
> Here idx is the raw MPNIC_RCD_AL_BUFF_ID field from the completion
> descriptor. mpnic_pkt_prepare() and mpnic_add_rx_frag() pass it through
> unchanged. The field is 18 bits wide (up to 262143), but rx_buf[] only
> has hpq_size/ppq_size entries (256 by default).
>
> Could a bad buffer ID from the device read past the end of rx_buf[]?
> page_pool_fragment_page() would then write pp_ref_count through
> whatever pointer it found there.
>
> An in-range ID for a slot the device already completed seems like it
> would also reset the refcount of a page that in-flight skbs still own.
>
> mpnic_bd_prep() only posts IDs in [0, size_mask], so this needs a faulty
> or misbehaving device. Would it be worth masking idx with
> ring->size_mask, or rejecting IDs that are out of range?
>

Comment addressed in v1.

> [ ... ]
>
>> @@ -417,6 +445,87 @@ static void mpnic_flush_pg_ctxt(struct mpnic_pg_ctx=
t *ctxt, bool napi)
>>  	}
>>  }
>> =20
>> +static unsigned int mpnic_hdr_pg_start(unsigned int pg_off)
>> +{
>
> [ ... ]
>
>> +	if (ALIGN(MPNIC_RX_HROOM, 128) > MPNIC_RX_HROOM &&
>> +	    pg_off =3D=3D ALIGN(MPNIC_RX_HROOM, 128))
>> +		return 0;
>> +
>> +	return pg_off - MPNIC_RX_HROOM;
>> +}
>
> [Severity: Medium]
> If the device reports a BUFF_OFF smaller than MPNIC_RX_HROOM, does this
> unsigned subtraction wrap around and produce a huge pg_start?
>
> The BUFF_OFF (16 bits) and BUFF_LEN (14 bits) fields are used without
> range checks in a few other places:
>
> - mpnic_hdr_pg_end() can return values well beyond PAGE_SIZE. These
>   feed frame_sz in mpnic_pkt_prepare(), which decides where
>   skb_shared_info is written.
>
> - With fin set and pg_off larger than page_size(page), frame_sz in
>   mpnic_pkt_prepare() and truesz in mpnic_add_rx_frag() both underflow.
>
> - In mpnic_add_rx_frag(), a payload frag with pg_off + len past
>   page_size(page) would expose adjacent memory to the stack.
>
> The same values also set the page_pool_dma_sync_for_cpu() ranges.
>
> A device that follows the configured HROOM/TROOM/MAX_HEADER_BYTES layout
> should not produce these values. Would a sanity check against
> page_size(page) still be worth adding?
>

We trust the offset field written by the device.

> [ ... ]
>
>> @@ -442,23 +551,99 @@ static void mpnic_put_pkt_buff(struct mpnic_pkt_ct=
xt *ctxt, bool napi)
>>  	page_pool_put_full_page(page->pp, page, napi);
>>  }
>> =20
>> +static int mpnic_clean_rcq(struct mpnic_napi_vector *nv,
>> +			   struct mpnic_q_triad *qt, int budget)
>> +{
>
> [ ... ]
>
>> +		switch (FIELD_GET(MPNIC_RCD_TYPE, rcd)) {
>> +		case MPNIC_RCD_TYPE_HDR_AL:
>> +			if (FIELD_GET(MPNIC_RCD_HDR_SUBTYPE, rcd) =3D=3D
>> +			    MPNIC_RCD_HDR_SUBTYPE_HDR)
>> +				mpnic_pkt_prepare(rcd, state, qt);
>> +			break;
>> +		case MPNIC_RCD_TYPE_PAY_AL:
>> +			mpnic_add_rx_frag(rcd, state, qt);
>> +			break;
>> +		case MPNIC_RCD_TYPE_META: {
>> +			struct sk_buff *skb =3D NULL;
>> +
>> +			if (likely(!(rcd &
>> +				     MPNIC_RCD_META_UNCORRECTABLE_ERR_MASK) &&
>> +				   !state->pkt.add_frag_failed))
>> +				skb =3D xdp_build_skb_from_buff(&state->pkt.buff);
>> +
>> +			if (likely(skb))
>> +				napi_gro_receive(&nv->napi, skb);
>> +			else
>> +				mpnic_put_pkt_buff(&state->pkt, true);
>> +
>> +			state->pkt.buff.data_hard_start =3D NULL;
>
> [Severity: Medium]
> Nothing checks that a frame is in progress before a PAY_AL or META
> descriptor is handled. state->pkt.buff.data_hard_start is zero at
> start and is set back to NULL after every META.
>
> Suppose a PAY_AL arrives without a preceding HDR descriptor.
> mpnic_add_rx_frag() then calls xdp_buff_add_frag(), which writes to
> skb_shared_info at an address based on a NULL data_hard_start and a
> stale frame_sz.
>
> A META in the same state would take the success branch:
>
> mpnic_clean_rcq()
>   xdp_build_skb_from_buff()
>     napi_build_skb(NULL, frame_sz)
>
> Only the error path, mpnic_put_pkt_buff(), checks data_hard_start.
>
> Can either of these cause a NULL pointer dereference in NAPI context?
>
> HDR_AL descriptors whose subtype is not MPNIC_RCD_HDR_SUBTYPE_HDR are
> skipped silently, so a frame that starts that way would hit the same
> path.
>
> The opposite case is also possible. mpnic_pkt_prepare() overwrites
> state->pkt.buff without releasing the page_pool references of an
> unfinished frame. Could that leak pages and stall page_pool_destroy()?
>
> fbnic_pkt_prepare() has a WARN_ON_ONCE(xdp->data_hard_start) at this
> point, and mpnic_pkt_prepare() drops it. Would it make sense to keep it?
>
> All of this needs the device to break the HDR, PAY_AL*, META ordering.
>

Same comment responded to in v1.

> [ ... ]
>
>> +	rcq->head =3D head;
>> +
>> +	/* Allocate buffers, force dma_wmb(), and then start writing tails */
>> +	mpnic_fill_qt_bdqs(qt);
>> +
>> +	return packets;
>> +}
>> +
>>  static int mpnic_poll(struct napi_struct *napi, int budget)
>>  {
>
> [ ... ]
>
>> -	if (likely(napi_complete_done(napi, 0)))
>> +	if (work_done >=3D budget)
>> +		return budget;
>> +
>> +	if (likely(napi_complete_done(napi, work_done)))
>>  		mpnic_nv_irq_rearm(nv);
>
> [Severity: Medium]
> mpnic_clean_rcq() is the only runtime caller of mpnic_fill_qt_bdqs().
> __mpnic_fill_bdq() simply stops when the page pool allocation fails:
>
> 		page =3D page_pool_dev_alloc_pages(bdq->page_pool);
> 		if (!page)
> 			break;
>
> The shortfall is never reported back, because mpnic_clean_rcq() only
> returns the packet count. mpnic_poll() then completes NAPI and re-arms
> the IRQ anyway.
>
> Say the allocation fails while the device has no posted buffers left,
> or fewer than the 16-descriptor HPQ/PPQ drop threshold. The device then
> drops incoming frames without writing any RCQ completions. What would
> schedule NAPI again in that case?
>
> There doesn't seem to be a timer, a service task, a forced IRQ trigger,
> or a return of the full budget to retry the refill. The only
> mpnic_nv_irq_trigger() call is in mpnic_napi_enable(). The only way out
> seems to be a Tx completion on the same vector.
>
> Could a receive-mostly queue stay stuck until the interface is brought
> down and up again?
>
> [ ... ]

Valid. We prefer to address this in a small follow up series.=20
