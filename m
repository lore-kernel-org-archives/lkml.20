Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793009719;
	b=X2P4EihD7Vp87tQi1R0WjsRSBdfwmAlJ6pFsJXjQeNeULEtwy039wNuZXCxkqZ17++Us
	 PHEkH8rs8RfqgqnXJ/9U8NpnW+RVXUnTk4FTwCH1M6hftvE+xYW/MEKg8H1IZy75Oyyst
	 nKZ7mDd1ZC/l2DgZRFAvIx4mFuaebK4ykMOsDImQ8onjhyLDUKP+bT387Ew90pKKFQ8wW
	 +pJIcHOq0RYgm5u9bZ7WTD/lFByUPF5QskkCrw43l5BMTMFBfXls/QI5B3Efvp5Q3p8ZS
	 H5PKOrrF81sR84sJ4QCnUF3SbOmhDecOmqyyr4Azr/ht2m3rfK6keuU6snTutx9z9jQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9aBZuFYnOniDZkDJYDzTBINBGxjSmG1ya1bp17w8auU=;
	b=TWo39diNpp+wMF5ZwoFL/V23D49+uIZHgEBB6dJ3eH7AGkltkBBly1Ilvo3Gc7HGQs+q
	 2e6SYScjnJsgCZFW5HiUCflySRqmprXovefqi1MrugWY9HE+kXys/Aq3zBaxeRpawaM3b
	 tYjzAu6HdIjQ8k2lXYKLEXS0BIbJx7MR1nwUngwnII7UoanFmR9iwkOgXxU8uWqrHnzuc
	 6Sm+t2Had5zEw/RwxlMPLsJdTGHaKnkRTQLQglpFcMYs0uvr+yyZSS+AnvKpkSOCGT9PW
	 f4svsh8qIAEtMv3lHHKSBf6Ux+xdvqsKgNqwvin28fwdLmINRf0FxA7rw5i4RaDp4Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hWBOayci;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF4606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8AF4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hWBOayci
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso18365305e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793009717; cv=none;
        d=google.com; s=arc-20260327;
        b=rNHqEJVU8POU+iGpCOcpTQPlZudu8oRBFZ0R/140h57a+69L62/8jT+HsPuzuERoHu
         JjR7fvsh+Z+WtpRgGsu02SDTojZvSfzZgFUhdsXFbiV5iYITwmd8fzBlldC90rJEIgQK
         CZT6eXKLCRxp9og83ltBqBFbF7YjU3R3eODR54UIMqsoWo5ksa/nbAWvwq/mSI2eZTNR
         LZaIn8W8mH0+Ttu0Nv+69v3o8c8zSQfmWl6gKk0cmwGxy8K9NmlqeMuwO4lDqLC7l6x3
         XsSCveH/IALfeRG8IrfiMocWwMarpMidCLVnpgo+kTRbsp3UlW36tEe0G8VnVf7zGU1B
         C+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9aBZuFYnOniDZkDJYDzTBINBGxjSmG1ya1bp17w8auU=;
        fh=OfMOmfGbCyH2KEkR9QM7b0V803evMdnNILaAj/chqHE=;
        b=SIYRJvgcrxP8rUn0yJdj8C4af8Tmec61X9CvjDalr04VqrE4SSmIFdvAYa8ZTcZ7wX
         kYu2FHtUq8TCW2OqgLaPTM7l0O6NtmVRHoeDUt6IXyEkV64TbAty8xE0GU0c/Y+uLTUa
         XgVGlmOdO4V/lAVPru2hQFP9z5+QQwNszUU94iU5eFeNBdUr/WyHtffZRK266L8afttJ
         YhbO10hvM5E8ptaoj9kiu1S0WDlnW+BeDNoHzEmwsDZqYRVjA/nj43XV09DjHPjglVns
         F2NWscrpsCEBVJEpGUzJl6G/LbfCVxODQOGPETTn2uVHVyGCTm0BlB33vfs8spf9XkHY
         eeyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009717; x=1793614517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9aBZuFYnOniDZkDJYDzTBINBGxjSmG1ya1bp17w8auU=;
        b=hWBOayciY+6ObABV4Sj87WKyKv7sYo6Nss8lpvQuDk2JVaFbm2I/YnHoazh8RbrKr6
         V3OlV4pIY9lNPYeAFLlkFQrJtYgEuJWANJIdVnxWAp0JaR1Of0rETrkEabue+rv04Hoz
         rA/fSqUD4GzXVWNkAN4SV3MJ42HlhqRFZGHdScvuK0htDzJbmTdG5RDnOtuX4AFHTShP
         fVjGAPrH2EHd/D3k9m6KTNt2kDCzA//r8D3ne95pqrTkzF7KBP81XOxLfddt5G3QcyVe
         8yKOJDnH7oIiqvr0KTANgDpRUngH4dtXdw9AxEt2wU+7aGmL93TwBLyEBVWsR2XoqY51
         2tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009717; x=1793614517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aBZuFYnOniDZkDJYDzTBINBGxjSmG1ya1bp17w8auU=;
        b=cPUqYTU4Ci3rx+zz2JBR5+kaC+p0p6GB1gBz1GENeQ8Nc8MwAsHdz4ltSjDUu9DIU6
         fOOfS670Vcsyl+bv6yRpG7Do7JeG5x0J1tU10BfduF3ilmk08notM10o/vuYEMDYJyr2
         bmPv7/unaLTs/axfsM8Brf0IOLqX0SVUhcJlgjq1ry6Hcb+G6biRGuMJYlOvo3Nm5xbj
         DS7FPY+VTTsvWVwzoTkLwoQlmTN4I7QYHybQesjtD9p8oiB0eKGhN1aOUcXc9iJSXgYI
         geM4+95L22fxLOzM0pTxG0LifjKJLxsbo/JreEsjI9BwbTDoNGGZn58g8o/OZRMYB7b7
         Mn6g==
X-Forwarded-Encrypted: i=1; AKwUvBzpnVAUaXP/+1vIYbuEoAFX/8QBkT3F+CkOdQfiCTGo9up2vORatUqNnj8dgLCYaXeV3xkF6r4NcDVB0Pw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoqetqqGCxjVTkN/L16wJzXGSKGG6R2rXxrZfiq2RRdRCdGV5w
	DvGeNTfWeYPBrUW66BR99SvrV9oSUBymuIuDI8XLXoXoW6j02qCxVhh4U8jluSnZHxRfUZCViMe
	z4NVtqnIYMQ+HVdGM/6UmonSZud9BWHdeQnrGbdVFoA==
X-Gm-Gg: AYBFou1HTDUTkj5PzF/IoXhNnUqzKlkZjY0zjG84a8970O/byyXTy/0VKbNMG1razmu
	3IDySTH6/xEcfRNAj1LpHBvnt/uZfxxFx/GAWdNgZfESjNqXVY1SzUfOLxhkYEJO9bYrRynqAcN
	0PkYx7JAX1+ihB8G8hAvRnDkaRuq9gVximiDCLkmHXgwN8Ref8nLUjD7KtdCRLw13RKqbMl6PXF
	OiKdPMfaDH4lsxWmUupY3Sos1ygkPhUvkElw7lgGjvSD32V6B119ihxVtDoBl9SY+cxpDQFMDGP
	TeaX8d9zTP48b7251iiiyfqxLMur6Q6wzhEj0DFmcAvd7/arilpMDPcC9Xxj48b4sAHH5AR8mmx
	UYVHMJNZknGvb30GnieUcpJzNiHvGd0QzmG+C0CvzYnvygTWJLHqWSRrv6bkwyoCqTV/htuAc62
	y0q0HjFTMv8GZiWVGOFoK3pQvYMlXRffu0qUOLU9EvXNp8kcCsodB94V4s1SQe8mksr8COrOey8
	CvRoelClfvY0A==
X-Received: by 2002:a05:600c:a06:b0:4a2:40:7f35 with SMTP id
 5b1f17b1804b1-4a35acaaacfmr115694155e9.31.1793009716860; Mon, 26 Oct 2026
 03:15:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004152840.61222-1-b2rancourt@gmail.com> <e8669ef4-1b3e-4429-a6b2-db4c6a734f7f@intel.com>
In-Reply-To: <e8669ef4-1b3e-4429-a6b2-db4c6a734f7f@intel.com>
From: Benoit 2r <b2rancourt@gmail.com>
Date: Mon, 26 Oct 2026 11:14:40 +0100
X-Gm-Features: AclHuK8a3o2txfU9CppftX-zSmZGF88PYoTCRr2FEwkGvWFsn1ZWRvLH6WvAKpU
Message-ID: <CABti8MHmpc=sY5zE9Hpdq4OP_-Th_E7O1XQi=Md-aznGQmtikg@mail.gmail.com>
Subject: Re: [PATCH iwl-net 0/2] igc: Fix Tx hangs after NETDEV_TX_BUSY with TSO
To: "Ruinskiy, Dima" <dima.ruinskiy@intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinicius Costa Gomes <vinicius.gomes@intel.com>, Sasha Neftin <sasha.neftin@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dima,

Thank you for the review and for the explanation.

Yes, going with patch 1 only is fine with me. It is the actual fix for
the problem I hit: in my tests, it removed every NETDEV_TX_BUSY return
and every Tx timeout on its own.

I agree that patch 2 is a broader question. The same pattern exists in
other Intel drivers, so it makes more sense for your team to decide
whether and how to handle it consistently across them. I'm happy to
leave that to you.

Thanks again for taking care of my contribution.

Best regards,
Benoit


Le lun. 26 oct. 2026 =C3=A0 10:04, Ruinskiy, Dima <dima.ruinskiy@intel.com>=
 a =C3=A9crit :
>
> On 04/10/2026 18:28, Benoit DE RANCOURT wrote:
> > Since commit db0b124f02ba ("igc: Enhance Qbv scheduling by using first
> > flag bit"), igc_xmit_frame_ring() requires count + 5 free descriptors,
> > while the queue is only stopped in advance below DESC_NEEDED =3D
> > MAX_SKB_FRAGS + 4. TSO skbs with 16 or 17 fragments then hit
> > NETDEV_TX_BUSY. That return skips the tail write deferred by
> > xmit_more, so the queue can stay stopped with descriptors the hardware
> > never saw, until the Tx watchdog resets the adapter.
> >
> > Patch 1 aligns DESC_NEEDED with the admission check. Patch 2 writes the
> > tail before returning NETDEV_TX_BUSY, which remains reachable for skbs
> > with buffers larger than IGC_MAX_DATA_PER_TXD. Each patch was tested
> > alone; together they keep the queue stop logic consistent and the
> > remaining busy path safe.
> >
> > Setup: CWWK router, Pentium Gold 8505, six I226-V (8086:125c rev 04,
> > NVM 2017:888d), 7.2.8, default MAX_SKB_FRAGS =3D 17. Load: CPU saturate=
d
> > with busy loops, a remote build routed through the port, two SSH bulk
> > streams in each direction and short TCP bursts, 180 seconds of load
> > per run observed during a 195-second probe window, TSO enabled on the
> > egress port. bpftrace probes on igc_xmit_frame, __igc_maybe_stop_tx
> > and igc_poll recorded NETDEV_TX_BUSY returns, the inferred last tail
> > write and next_to_clean stalls.
> >
> >                         runs  Tx timeouts  NETDEV_TX_BUSY  TX_OK return=
s
> >    unpatched 7.2.8         3           25           10890       7.3M
> >    patch 2 only            3            0           10751       9.5M
> >    patch 1 only            3            0               0       8.8M
> >    both patches            3            0               0       9.4M
> >    unpatched, TSO off      1            0               0      21.5M
> >
> > In all 25 timeout episodes, the stalled queue had pending descriptors
> > after a NETDEV_TX_BUSY return. The probes inferred at least 214
> > descriptors beyond the last tail write. For that queue, the hardware
> > register dump showed TDH =3D TDT =3D the next_to_clean value recorded b=
y
> > the probe.
> >
> > With both patches applied, no NETDEV_TX_BUSY occurred, so the flush
> > path of patch 2 was not exercised in that run; its effect is shown by
> > the patch 2 only runs.
> >
> > TX_OK returns count igc_xmit_frame() calls returning NETDEV_TX_OK,
> > excluding NETDEV_TX_BUSY retries. These are software call counts,
> > not hardware packet counters; with TSO disabled, segmentation occurs
> > before the driver.
> >
> > Related code, not addressed in this series and not tested:
> >
> > - bnxt: commit e8d8c5d80f5e ("bnxt: make sure xmit_more + errors does
> >    not miss doorbells") rings a pending doorbell on the drop paths. It
> >    leaves the busy path alone, reasoning that busy can only happen if
> >    start_xmit races with completions that both enable the queue, in
> >    which case no kick can be pending; the current code warns "ring busy
> >    w/ flush pending!" if that assumption breaks. In igc, patch 1
> >    restores that property for skbs whose buffers each fit in one
> >    descriptor, and patch 2 covers the remaining case.
> >
> > - igc drop paths (skb_put_padto() failure in igc_xmit_frame(), out_drop
> >    in igc_xmit_frame_ring(), the DMA mapping error path of igc_tx_map()=
)
> >    also return without writing a pending tail, the case bnxt fixed in
> >    e8d8c5d80f5e and 00eeab0c644a ("bnxt_en: Write doorbell when
> >    linearizing skb fails"). The queue is not stopped there, so pending
> >    descriptors are delayed until the next transmit on that queue rather
> >    than stranded.
> >
> > - igb, ixgbe, fm10k, i40e, iavf, ice, e1000e and e1000 also defer the
> >    tail write with xmit_more and return NETDEV_TX_BUSY from their
> >    admission check without writing it. Their stop thresholds match
> >    their admission checks, so this should only be reachable for skbs
> >    needing more descriptors than the stop threshold assumes.
> >
> > Not done:
> > - runtime test on a kernel built from this tree; the patches were
> >    tested on 7.2.8, where the affected code is identical, and apply
> >    cleanly here;
> > - launch time (ETF/taprio) and XDP/AF_XDP traffic, which share the
> >    ring and the wake threshold;
> > - longer runs and other I226/I225 boards;
> > - only the igc objects were built with W=3D1 under allmodconfig, not
> >    the full tree.
> >
> > The analysis and the patches were prepared with an LLM-based coding
> > assistant, which also wrote the bpftrace probes; the results above come
> > from those probes and the kernel log on real hardware.
> >
> > Benoit DE RANCOURT (2):
> >    igc: Fix Tx stop threshold to cover empty frame descriptors
> >    igc: Flush pending Tx descriptors before returning NETDEV_TX_BUSY
> >
> >   drivers/net/ethernet/intel/igc/igc.h      | 8 ++++++--
> >   drivers/net/ethernet/intel/igc/igc_main.c | 6 +++++-
> >   2 files changed, 11 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: a83267db14681b3be481e02a4d5a38177507006c
>
> Hi Benoit,
> Thank you for this fix. Much appreciated.
>
> I wonder if we can go just with patch 1 for now. Reasons:
> - As per the analysis, just Patch 1 resolves all the issues encountered
> (the corner case resolved by patch 2 is not reached anymore, although it
> remains theoretically possible)
> - As explained in the cover letter, Patch 2 changes the behavior in a
> way that makes it inconsistent with what other drivers are doing. Maybe
> the new behavior is more correct in all cases, maybe not, but in general
> I prefer to avoid introducing inconsistencies, especially when I don't
> fully understand the effects.
>
> Best,
> Dima
