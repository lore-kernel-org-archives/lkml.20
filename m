Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792518910;
	b=rRrxuORS9KEn0z55M/DukX50/xrqnjKCm6qchuPzrhvNbUpQ96ril3/E7xEt0ZZLpps/
	 y9qid4YaII+SOMP4LrrJ3YL6pq+4btZnms1mbkjuuzDBtDdILDlDzvgsi2WznTlZSS4e4
	 JtjsKEfbFOgvzbT3T2B12KmmmMJgG7NIaK1l8dgeJlpCy8RkNQlzQPEsJgE+VGUqA1EgA
	 8OEGpQGvk2yfGpQ19rP3SZ2/0ObSbIYQeMQE0kfycD7D+pr/MHIIYyKpY0Y6whans0tmh
	 8jrIuayBiTRMkPBTIX7ZGW5MQpUWDUcy/YJ3DAxolWfYGMsPrb038zo5SC28ajDWQ/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y9HpxehbmG7Pgq3cB5qfed70gkzJnlMwj02Bgt/gGcs=;
	b=3/o2u6KmCf+mWzoGSXDgLVCrEPr+tCzswDOjOm3esHHx+Vplde7WQcCA2slui7pBnDvn
	 D6w1tqPUQuKgy5uoftrUlgPIR+yKwSqGvu4m7zzqh2hn5C27GJguprvfGZ6fTxKNJKodH
	 PHnLSWayZQz2doErKfCERio/vFhtmc1vBfcevoJM9FBv35tmgOBST/m2KL3DnYH3S3ykC
	 c3B0ingIACublsg5y52YcWHnLLmpDJz2pMQel8t2jrMbC12Lf9PhtKIdhx7u2Qak6dYc0
	 /64RbQQh8f9nPK2WuGHRc5X9J0LV4NBDgKPo5qOYZrJHgMfyWQKzuUD4/w1SwxTrp1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=muNwDr78;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000F8606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 000F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=muNwDr78
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eadf48fb2dso299169e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792518908; cv=none;
        d=google.com; s=arc-20260327;
        b=I8ctPH0ASuzX5p8nlZD9QX1FJIa+3DLE6qeyH94KEbWvmT/1vGdIjtZq7/KJjaU4Ut
         I0CxQBJ79meEDRJKjVQ7RLkhgzybI36w4h5bCJCJ30YtGmajU2YAztCtKCXCm7UfzgTp
         2+9Ys7rxTeyvMBUjhlC2FCFgWWOZGU81bqtom3ifVD8vhBk+duYVokNoDRCt8cRa5Iq+
         FRYFBBLKHBajl4I4vNQXjhvAfudz6D3MnADCdJ1OCGgwvwBZU/zi9sXEiMRiqvj54tiZ
         7lZzBNirvPVrEoiNOJyNd7ifRJcrQE2MtqfBR2Iy+vH4xju6VOl0Ti5qBLIePbgEOcZS
         Gb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y9HpxehbmG7Pgq3cB5qfed70gkzJnlMwj02Bgt/gGcs=;
        fh=C3JttRZeCEscucjdn14cuSyF24rFuomWDZ3MTJeJ4w4=;
        b=eM3eUpNO2222joBnWHE7N2KUnL4kwYIwAsAc3l/eLTj5OSyjiPQIas85AT9RNuNejx
         Ja2sdQiq8Wd5un9wQW4c3+BfbLWyyGPO8ZgJN+R7yy/7xX4dJ+9FKZMbAsrnK2gwu3Fp
         SUTA92jh3dDDGxo+Yxo3zXz/4otYD44HNGk9pUA/iFOVGn8FVKhO71j8yyhqMFDhX6u/
         6xwShDtpM+N0BUMEpU0FkV7UwZXkdr86XTWbUiWhZFMNhc0ASxXljs1qO1l78C5F49Nk
         McGOoD5+17AGBUk8iLCcVGue4SzZyeutmn3qUqLTwe4VBxCCZnShAFP9yPu6PtCmV4IC
         glOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1792518908; x=1793123708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y9HpxehbmG7Pgq3cB5qfed70gkzJnlMwj02Bgt/gGcs=;
        b=muNwDr780gVOPOUtu5RLcskgnDy+/Y51C7VIArzXn80HBhuJFSXfl+/byFcl8tmTAf
         7/83dau48Vn+Cn32qEoRbCVh3q9GGxMxocdI3wVbQ9RZHQahozlQHSSnjc55GA5KhiBl
         F6vQOEe0ZhrEAjvu9qm1k+UZ0yoqsDfT3IDn7b/Tchm27AbKlx5eTHMcSpew4M/G6OLo
         N1t8fJg33gBx4x+JGuC+lYebKXu/5YhTnbXgUncziymf2Zpz/VyAT90/dQ0qrDFyCqKo
         dkae9MxZrRLDe6uoj+c6tBGLuWXIt+f7ghrliefycO2ZreO8kSW3GDTGwdW17NcvlD8u
         WRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792518908; x=1793123708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9HpxehbmG7Pgq3cB5qfed70gkzJnlMwj02Bgt/gGcs=;
        b=OFADuLI99CVzACGtty1g1WlvB+PpQkO+ywNtYJcIFaHgxrtBO2G5ow1BwIc34n2Bg6
         xdmN32lbU1f2+p4bLL1Tcm/VMARyKLly40mn8o7etJyRzjFH9stI5JKX//8f/nW0MiV5
         irqlG7CXWvapbuI7DW6Yang9v5TQ3M0amQ8FPqZ4sAiacPmi4uHs/eYGrMKxRTWwFDwQ
         WwbigRPggY4T1xuINJsQ7I1pK+mjLz7u0MobwA74t5ujYrtXRCdSy+4JNHEgP9rcPlA2
         n34RjImVrtGgcJLXqgulxRgXZFbiKGHZMltUm3x14pEyjiw7ovMK1rPcgTSS3oSHmJKH
         9oJw==
X-Forwarded-Encrypted: i=1; AKwUvBxruHaPvDuQWYClXeHbnVVGVRrUsR0Ls6PvaQOEtozfVkYv5fdMO2ejhe2i/hmL3r9jIKJ1aEcb6eg9Z58=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvc8TXwlEw+E7m2vSNwQl7Az8aXUxRDPuhGPap/B7Skyt9cfWA
	pQANlkD/h+5zVeaCfmysXAE14KLMtcTTqLipslnaLMvB7XGcB5eeJCg7tgX6uD6RLmZBnzx+0MA
	U5YDToR2R2pYO4YgJu1aL0y1filT1heLDTnFed5Gvcg==
X-Gm-Gg: AYBFou1DLIiXNrZdmbnR9l1/JOX17fxX3dhWtjayJqJM0/7mp9kbBBImreB/x9gHEG0
	N32cdxPeXzP/aJcfgfMROrS3dBvpagMH4SeYfPmsMtkgGCk/YGvVBS4+0boeVIjGvPmPeEUDi3e
	N7ITs4CbflMcyQJyifd58pa25Z1/2j2faLXpXjf6cwJ2x+M4G2DqlS8W8LhLhFBfZjeHZ2jWz/C
	jB+8PdDm7P7y42DQNEOfGzAxeVdOhjrfxhUPRdQyI3L8Q8IjftcHBR35JV38IE6jPrjBx+/Pt+q
	hDpLyxVO2v7lTnF0dtzO/vQUopNl9HgaMZlk95s11uaDHGkERK70bw5ZL6iK4XLJuJMhhGTxigH
	MrXu5lrWZuVpr8afKH0Zqk6i/6M+wu8+u12P+BCV8hm6gkBjQTgdb830DJz/JYRWkvpRTe+9djz
	y6UbvQTrXuWmDUQI0xRvRbr2/S+iVs8MEk2TaQolFX
X-Received: by 2002:a05:6102:3c92:b0:7a7:195a:1b2a with SMTP id
 ada2fe7eead31-7cc36af715bmr2410635137.36.1792518907708; Tue, 20 Oct 2026
 10:55:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016042604.357739-1-rjethwani@purestorage.com> <atH1ThJGVObmpeKT@krikkit>
In-Reply-To: <atH1ThJGVObmpeKT@krikkit>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Tue, 20 Oct 2026 10:54:56 -0700
X-Gm-Features: AclHuK9koDIljjad_6okkmgr1_AHzXjpT3jzcnthxdH7jkI-vtrm4xJ9DHNQB40
Message-ID: <CAKaoeS3UFK-mBcw_Rd82z_HbF32E9MUg8pcAKmNbgYraDi-m8A@mail.gmail.com>
Subject: Re: [PATCH net] tls: only install push_pending_record for a TX context
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 2:58=E2=80=AFAM Sabrina Dubroca <sd@queasysnail.net=
> wrote:
>
> 2026-10-15, 22:26:04 -0600, Rishikesh Jethwani wrote:
> > tls_set_sw_offload() assigns ctx->push_pending_record for both
> > directions, but the hook is a TX-side dispatcher. On a socket whose TX
> > side is HW offloaded, tls_set_device_offload() installs
> > tls_device_push_pending_record(); any later TLS_RX setsockopt overwrite=
s
> > it with tls_sw_push_pending_record(), because tls_set_device_offload_rx=
()
> > itself calls tls_set_sw_offload(sk, 0, NULL) for the software half of a
> > successful HW RX offload, and so does the fallback when the RX offload
> > is declined (NIC with TX-only offload, tls_dev_add() failure).
>
> This makes sense. Some comments:
>
> > From then on tls_handle_open_record() (a TLS_SET_RECORD_TYPE cmsg after
> > a MSG_MORE send, or the close path with a pending writer) runs
> > tls_sw_push_pending_record() against priv_ctx_tx, which is a
> > struct tls_offload_context_tx, not a struct tls_sw_context_tx, and
> > reads open_rec from inside the offload context. On x86_64 without
> > lock debugging that field overlays sg_tx_data[2].dma_address,
> > which is never set, so the push is silently skipped and the data
>
> Do we have arches that support TLS offload but use dma_address, or
> where the struct layout would allow something more harmful than "wrong
> payload"? I'm worried that we could access some random address for the
> open record.

  The more harmful case is possible on x86_64 as well. sg_tx_data is
  initialized with sg_init_table() and filled by tls_push_record() for
  tls_push_sg(); it is never DMA-mapped, so I did not find an
  architecture-specific writer of its .dma_address fields.

  I checked the layouts using the compiler and this tree's headers. In the
  tested x86_64 configuration, open_rec is at offset 144, sg_tx_data starts
  at 64 and sizeof(struct scatterlist) is 32, so open_rec overlays
  sg_tx_data[2].dma_address (80 =3D 2 * 32 + 16), which stays zero and the
  push is skipped. Enabling CONFIG_DEBUG_SPINLOCK, CONFIG_DEBUG_LOCK_ALLOC
  and CONFIG_LOCKDEP (with CONFIG_LOCK_STAT disabled) moves the offsets to
  280 and 120, so open_rec overlaps sg_tx_data[5].page_link (160 =3D 5 * 32=
).
  Entries are not cleared between records, so once an earlier record on
  the socket had at least six frags, that page pointer plus scatterlist
  flag bits is interpreted as a struct tls_rec pointer. The first invalid
  dereference is msg_plaintext.sg.size, before bpf_exec_tx_verdict(). So
  the address is not random but a struct page pointer with flag bits; a
  non-zero value read there would make bpf_exec_tx_verdict() operate on a
  bogus record. I have not reproduced a kernel fault or established
  exploitability; the offsets and field writes are confirmed from the build
  and code.

> But on its own, the wrong payload within a TLS stream seems bad
> enough, I think it's worth a Cc: stable tag.
>
> > buffered by the MSG_MORE send is later sent under the cmsg's
> > record type, e.g. application data in a handshake
> > or alert record. With a layout where the field lands on a non-zero
> > value it is dereferenced and fed to bpf_exec_tx_verdict().
> >
> > Only set the hook when initialising the TX side.
> >
> > Found by code review while developing TLS 1.3 HW offload
> > rekey support.
> >
> > Tested with HW TLS TX and RX offload on Mellanox ConnectX-6 Dx
> > (Crypto Enabled): after setting TLS_RX,
> > send() "AAAA" with MSG_MORE, then sendmsg() "BBBB" with a
> > TLS_SET_RECORD_TYPE cmsg for a handshake record. Without this patch
> > the peer receives a single handshake record "AAAABBBB"; with it, an
> > application data record "AAAA" followed by a handshake record "BBBB".
>
> If we already had selftests for offload, I'd request a selftest for
> this.
>
> Would it be feasible to extract the non-1.3/non-rekey bits of the
> selftests you have in your 1.3 offload series? Those would be valuable
> on their own.

Thanks for the suggestion. I=E2=80=99ll submit v2 with the non-1.3, non-rek=
ey portions
of the selftests extracted as standalone selftests.

> > Fixes: e8f69799810c ("net/tls: Add generic NIC offload infrastructure")
> > Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
> > ---
> > This is independent of the TLS 1.3 HW offload KeyUpdate series, but
> > that series' TX rekey path (tls_device_start_rekey()) calls
> > ctx->push_pending_record() and depends on this fix.
> > ---
> >  net/tls/tls_sw.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> > index d1ad31986cf2..b3fe153c3c68 100644
> > --- a/net/tls/tls_sw.c
> > +++ b/net/tls/tls_sw.c
> > @@ -2591,7 +2591,12 @@ int tls_set_sw_offload(struct sock *sk, int tx,
> >               }
> >       }
> >
> > -     ctx->push_pending_record =3D tls_sw_push_pending_record;
> > +     /* The RX path shares tls_context with a TX side that may be HW
> > +      * offloaded and rely on tls_device_push_pending_record(); only t=
he TX
> > +      * setup owns this hook.
> > +      */
>
> Please, no. If I see "if (tx) install_push_callback;", I don't wonder
> why we install the callback or why we install it only for TX.

I'll add Cc: stable@vger.kernel.org and remove the comment

> > +     if (tx)
> > +             ctx->push_pending_record =3D tls_sw_push_pending_record;
>
> --
> Sabrina
