Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B843F788D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267966; cv=none; b=Dqxdb2IGcPQ3YZ5xzrbDR+svys18M+NW3O4Bwz+TdKbeqDQgZ4AAfSNdEOExN7tMl0E0KPs5DfrWOXj+tXLpMfqCz6uFnGHM6f8r76JvJhvHOcEIitEksiBkwARqW/Z5Cw+mbU2XU9ERk4gYBKf51EE0Y8tfA1sIUiIIhZBnCUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267966; c=relaxed/simple;
	bh=GXNqf47scpm0PSzUvB6Afz/r8IUsZ7Lt4SAJtHyKWwM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Icz9RZcCHQA3f3a2qebX6b3Ws3Y/3q6PcPELsfe0rAOh00ksuW/FxB5WM/FcozDlz1HQcFxFZdV3CcaO0Nth3cs8N4sv/prOmiUgtvdbHEj6h9n6NhZvnx38h27TiItU32UC8tuzONOWqhju544JbiERgKTO0Z+kUnxRNr4q3Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODQQyUyi; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODQQyUyi"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so617246d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267962; x=1790872762; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JueyTHN539QeHvN07NGJvgpoDup9+jaPUYXbwaQUx00=;
        b=ODQQyUyiCzT8VsclS0/xWb07ItOrhKmVWn76jhV82+fw4JrcNnwdkndu0N+rpTIYyr
         T8Ke5TEe4xDKgfSmV7igPdWF4FdWqOYNtR4mXINDs4Vc86NrNMwDyJFEMzk5u1CkhLKj
         lGUnC59jGMhHbUol0tLdchDX4M+4FllV9K+f/iKj/uXJjr6KvO/+VZbR/u7m+KGcCTya
         FLKpPutPudRF/3w+5X8u6LpKql9oh6e6T4XA9rsVSF2/ZvAUP24m9lqgkbwDqMfIG3rL
         JPRy5AzvllaNx4EBDMg57hJu+weSFvqL5TpMVRyw3pquwZFuIVxdrIDX7Nav57lhRgwT
         zHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267962; x=1790872762;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JueyTHN539QeHvN07NGJvgpoDup9+jaPUYXbwaQUx00=;
        b=Sm4zvq+2RuHMXITPJiXr0/W/AdLaEmdRZVFDaxFOn3QSpp+Q+nBCnZAuLZuonx1w+1
         WQXHRTzfSAXcDLzSAVhoBc3ZNWl8d8VH1sRZmrgzYJRXYSeNb198AUXBsBfD9o7qaQag
         fLnxvzQQ528JxuaGb8HWEBpHLkv1as7rbQfl1hgP79l/I7TVcb/OU51TwUzckl+5hIDE
         I+Ogpg7uD/iH0Ua5ALeFpCoN2R89EOCryGa2v+LjAgKxu1wZuVWfZ0Q6hHlFPBCZFuHn
         3P2/ui3G7vUouSOLnTpB+6wRn1Rg3/N9NWVqUICRLRC3hUjC9L7JGM7vrdI866tFCQeb
         At9g==
X-Forwarded-Encrypted: i=1; AKwUvBz40nlaVJglpchekexs88Bqs6L65UhXXm97UT8+HxXhN/YIEIvTM+HYVJMfaXDmHuszlzxt+t7es5cmk14=@vger.kernel.org
X-Gm-Message-State: AFuF++netDFsQkfvcwOD7j7KNArtqvTbfnGjI8UNjshNSbCI8qj2Ylq/
	ikoH0tNDw8rYvAWp/hXi1gmuOzw6EVBP6uPqg44W480xWh64JVxF8tE+
X-Gm-Gg: AYBFou3naDJbouvS1H9oiXUGNA23vx93/3z8AgH+KBQqtIdPH4f6GyRnkcgmCBKPwGy
	vSK3MeyZBSTPfk+FVYCh7jsD2NojSddn6R5CkI/3fVSHwJdGVGS6aJohRUnlRMSUTc3n6UG2aV9
	aTlSoPILsMd+EusG9wOv0pXsfUDWR7SZV5OcNsn3d08SvAc288Aj3kvxui1bza/s0xpUuNjOK88
	pDoaMNHt5SmdUbF70nzgu23vuHcSLRaeTXXLtL8+GgvOlHeJmiv/LFcj8ak+Ad/zI+20Oz41xZQ
	2Z0LH/Wjg0/cJV1qePCCzUU/7syTInqJBCpk4Gt7NU/KypONH1xDZtb5AsMOdLZWJLr+eE7mn3A
	6KbXYYWSaAPVuk9pAezjSw7fK0O7hn2XICWk3S12MeliUUPOGkc6QLLSrmvy6uJADTkatFTA96g
	z4DXCY7KKEy86j1XKDAJLnPfiWFlAdkWRtrMMu/94N+bUF0jNrvMic2qlSRJDNGQF6NSD/Bfm23
	oY=
X-Received: by 2002:a05:6214:328f:b0:910:706b:6a66 with SMTP id 6a1803df08f44-91421cc6c82mr30762626d6.15.1790267961936;
        Thu, 24 Sep 2026 09:39:21 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e292ddfsm20201616d6.34.2026.09.24.09.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 12:39:20 -0400
Message-Id: <DLNP0Z73GU74.I5ZMXMO5VPSL@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <dimitri.daskalakis1@gmail.com>, <mohsin.bashr@gmail.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next 4/8] eth: mpnic: implement Tx queue allocation
 and cleanup
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260922-linux-mpnic-v1-4-236844f53072@gmail.com>
 <179021553452.2160803.1706539646105038044@kernel.org>
In-Reply-To: <179021553452.2160803.1706539646105038044@kernel.org>

On Wed Sep 23, 2026 at 10:05 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] Cached doorbell pointers let queue-head MMIO writes reach BAR0
>   after the driver has marked the device as gone.
> - [Low] Concern (baseline: rejected): mpnic_alloc_ring_desc() stores
>   `count - 1` into the u16 ring->size_mask (line 334) without checking=E2=
=80=A6
> - [Low] Concern (baseline: rejected): mpnic_clean_tcq() takes HEAD0 from
>   the device-written completion descriptor (line 163) and passes it=E2=80=
=A6
>
> --
>
> eth: mpnic: implement Tx queue allocation and cleanup
>
> This adds the Tx ring structures and allocates queue triads per NAPI
> vector, along with their descriptor memory and interrupts. It also adds
> Tx completion processing, where one completion reports a work queue head
> and can release many packets. Nothing enables the queues in hardware yet.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/=
ethernet/meta/mpnic/mpnic_txrx.c
>> new file mode 100644
>> index 0000000000000..fe360a26a27be
>> --- /dev/null
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>> @@ -0,0 +1,496 @@
>
> [ ... ]
>
>> +static void mpnic_commit_cq_head(struct mpnic_ring *cmpl)
>> +{
>> +	u32 head =3D cmpl->head;
>> +
>> +	/* The tail shadows the last value written to the doorbell, so a
>> +	 * completion queue which has not moved costs no MMIO write.
>> +	 */
>> +	if (cmpl->tail !=3D head) {
>> +		cmpl->tail =3D head;
>> +		writeq(head & cmpl->size_mask, cmpl->doorbell);
>> +	}
>> +}
>
> [Severity: Low]
> Can this doorbell write still reach BAR0 after the driver has marked the
> device as gone?
>
> mpnic_alloc_napi_vector() reads mpd->uc_addr0 once and stores raw BAR0
> addresses in the rings:
>
>     mpnic_ring_init(&nv->qt[0].sub0, &uc_addr[MPNIC_TWQ_TAIL(idx, 0)], id=
x);
>     mpnic_ring_init(&nv->qt[0].cmpl, &uc_addr[MPNIC_TCQ_HEAD(idx)], idx);
>
> When mpnic_rd64() sees all-ones reads, mpnic_mmio_err() in mpnic_pci.c
> clears only the accessor pointer:
>
>     WRITE_ONCE(mpd->uc_addr0, NULL);
>
> BAR0 stays mapped through pcim_iomap_region(). mpnic_wr64() checks for
> the NULL pointer, but mpnic_commit_cq_head() always writes through
> cmpl->doorbell.
>
> So suppose one mpnic_poll() run still has unprocessed completions that
> were posted before the failure. The TCQ head doorbell write goes out,
> while the mpnic_nv_irq_rearm() write through mpnic_wr64() is dropped.
>
> The scaffolding commit says that once the device is gone, no further
> accesses reach the bus. Should that also cover the doorbells?
>
> Later in the series, mpnic_tx_doorbell() and __mpnic_bdq_commit_tail()
> use the same cached-pointer pattern. Would a mpnic_present() check help
> in those places and here?
>
> The comment in mpnic_alloc_napi_vector() already says the doorbells
> cannot notice the window going away, and fbnic does the same thing. The
> practical effect is probably limited to posted writes to a dead link.
>

The observation is correct, but this is by design. Won't fix. If we lose
the device, we can let these writes get dropped by the bus instead of
trying to stop them.

>> +static void mpnic_clean_tcq(struct mpnic_napi_vector *nv,
>> +			    struct mpnic_q_triad *qt, int napi_budget)
>> +{
>
> [ ... ]
>
>> +	while ((*raw_tcd & cpu_to_le64(MPNIC_TCD_DONE)) =3D=3D done) {
>> +		u64 tcd;
>> +
>> +		dma_rmb();
>> +
>> +		tcd =3D le64_to_cpu(*raw_tcd);
>> +		head0 =3D FIELD_GET(MPNIC_TCD_TYPE0_HEAD0, tcd);
>
> [ ... ]
>
>> +	cmpl->head =3D head;
>> +
>> +	if (head0 >=3D 0)
>> +		mpnic_clean_twq0(nv, napi_budget, &qt->sub0, false, head0);
>> +}
>
> [Severity: Low]
> This isn't a bug with a conforming device, but head0 comes straight from
> the completion descriptor the device writes. It goes to
> mpnic_clean_twq0() without any check against sub0.tail.
>

In this case, and in general, we do not perform this type of hardening
against completion fields written by the device. We trust its outputs
for things like offsets into buffers, rings, etc.

> If the device ever reported a head past the posted tail,
> mpnic_clean_twq0() would reach an empty slot and dereference NULL:
>
>     struct sk_buff *skb =3D ring->tx_buf[head];
>     ...
>     desc_cnt =3D MPNIC_XMIT_CB(skb)->desc_count;
>
> The completion walk loop is also not bounded by the NAPI budget. In
> practice the device cannot post past the CQ head, and that head is only
> committed after the loop.
>
> Stale entries from an earlier bringup do not look reachable. The
> descriptor memory is freshly zeroed by dma_alloc_coherent(), the head
> and tail are reset to 0 later in the series, and at head 0 the expected
> DONE bit is 1.
>
> Would a cheap sanity check on head0, or a NULL check on skb, be worth
> adding as hardening?
>
> [ ... ]
>
>> +static int mpnic_alloc_ring_desc(struct mpnic_net *mpn,
>> +				 struct mpnic_ring *ring, u32 count)
>> +{
>
> [ ... ]
>
>> +	ring->size_mask =3D count - 1;
>> +	ring->size =3D size;
>
> [Severity: Low]
> This isn't a bug with the current callers, but count is a u32 while
> ring->size_mask is a u16 in struct mpnic_ring. Nothing here checks that
> count is a non-zero power of two no larger than 65536.
>

Ack, but won't fix. When ethool is implemented, caller will have the
responsibility of ensuring these.

> This cannot be reached today. The only caller passes mpn->txq_size,
> which is only ever set to MPNIC_TXQ_SIZE_DEFAULT (1024), and there is
> no set_ringparam path.
>
> If a runtime ring size setter is added later, a count that is zero, not
> a power of two, or above 65536 would break the masked indexes in
> mpnic_clean_twq0() and mpnic_clean_tcq().
>
> Would a WARN_ON_ONCE() or an explicit check here be worthwhile?

