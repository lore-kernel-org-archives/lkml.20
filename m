Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793050795;
	b=J5tGVD5F0ZKfRg9u5H5XdnOHsgEH2UrbaDy69Yjp0HZnnFJ7wA+dhw7sPMvdk6te+jza
	 iey0iOpFo2k1SmlXLeZW/gVSTN18cDWnMB8f5ylUBLBo5akYOehx1JIxfzeFyCh3Ftkmd
	 tqjVyhaULK326WkEe9gHkjqgV+2sG4lrMgrbWhvZVVNlrzsK6fpZAYlJu648odgKQJMpo
	 A1WoiXi0u0x1wej164X1jgYciDdtvs6jb6w+StxJmpSluEiDSKtRvVIRKrXRJooeMkYvp
	 Cb/YvmkehEpBHh5BZ22kLw55FLhuwXHsc/yyVIYS3rjmP/KKDQqFJ4qq2cMaiWm3fjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xSeNS65qus3GCZvtaI28SVIcrlO1tnD2OBxNeWc37ko=;
	b=0qVAbpup14HRgRjPkRUuH9vBt2rNNevxzaDzBwuw/HyRLDqidjYCS1XxT5HS5yVyAyTN
	 /03coERFHb/25QMmZS2YBYUNMW2YCoXzXl4uG5Uwc/kC5vk88zackl/zOA0UpZa0Sw3E1
	 zV0kGO4P66dGAiLWHqc8thLRLOJVI1wcc8Tl7SPmtPxOqF115MbSj+fQEc1pPKSz9OHEQ
	 lrSDoXpmYy7kvadTBWBQ+XYzbZY+t0YTMzRAufh7Nm+P58DRBBcJDOXd/TklQoiPKX8fH
	 Oissc8vaGH5QQRGTrB4O9v8sA7DDIw8AHRJEL8Yg9i/c74znsJqn76avu/62HkaDSZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AkhoyGEF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37687606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37687606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AkhoyGEF
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20d7a8984so5005e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793050793; cv=none;
        d=google.com; s=arc-20260327;
        b=RcWP9iAN2QaRsekajjnFZJz9bkfI/SRYCTE1UGddcQ3NY7mHe5acWRQxnqrS43wzQE
         BkQyG2DRucEOyIOiR1CN25NkaePUcjU2RsMGF8HNQZ2leJgmaURjjuTuG7l9Tpn5SPPg
         T0+A3GWj9GNTgcgdkE29DTtJJQyRBfammHTWssqPwI0HAjIsDWy375aCX9MgP0xndO+s
         3YKPdodGgzgvPUaOc+aXrS6WQNMq2OgS813bUPfwvCx6SvqPAuK3jfiOLpXjee8gqa25
         bYlZl87iyl4pCuJaKFYhHsYiswT9DzBhww1ttmriqlg5LYYuaOJSzvvdpXOohJea+TPh
         Z/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xSeNS65qus3GCZvtaI28SVIcrlO1tnD2OBxNeWc37ko=;
        fh=rd14+2ZgGmbIv5vnVleyjLKY4v0Fsn498T6O1skzayU=;
        b=glCXDt+DZsyU8eTCEazwjPyPTFVkALnSKFl435KJWBP9yCncxiHy/6ew8S6V4Vr/bu
         l366TtJyOktNPEBuvNH4QHpWBaPYMoO4S+pOqLJR82fwu1GqlwG0KJVHFRzU3hcKf+JK
         BJoPh0sovW4vPZeyNx2n4gV0jFqGTGqP+0mYnr5IhRPXkOub7dgs4behFVCCVE2kphIk
         0UYDHqT7BvjRw0pwFw+6ON1JEzkv37NkwgnvRKUjql8959QZ77yn8BU+xWrfMQp463x1
         aTNBjcKoZ5Id9uIprejMUe2i8N4aHPbZox1OCK57Y6kwVlG/J2unN9vdNQYWX6eRClgq
         wQ4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793050793; x=1793655593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xSeNS65qus3GCZvtaI28SVIcrlO1tnD2OBxNeWc37ko=;
        b=AkhoyGEFiwKTk6zjNVHjA9wc5L29B3d4uC+l6tR9TiHokqM1l9x8YloeaTQoe+TL/y
         kwrsnlTSWVWicofnjo1Fm/ovL230erCkc4hJPiVRmMgtcWfncEiEODc0wW4mO+of6zE/
         cV7Nott2DlVcEZ47FiHNXWsiR6L5Cu4yUMpYwLG05dgCQPlYWeypQH2VTwSBCXBW6n8e
         heMl81P3WDEMbow1b+7JrTri8EkvGFqPPDdN7kn8PvrPy0+LJ+1ONuk3POd7oIwnfmyJ
         +ObSPx2K2cjbtJO7LQ8gtI6EBGTxAaMbKtqGJKv5RhoGVvGgEIxHhM2f0JSmHvrZWUF9
         HlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050793; x=1793655593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSeNS65qus3GCZvtaI28SVIcrlO1tnD2OBxNeWc37ko=;
        b=m2fmexY4ya2EGOM5ICnOPd0ZGxsvIyfCPIjEf7lp3qk0G2gaIFCsmuIPjeoSZse2m3
         PbqQBck4wSns6y+UrreQVbYHG33Rz6EJSZsK2jAz4St1PZcoqE7SirTkghT9dDZRa2ow
         FwAI7Bclt0Z6fs7p9l9fj6p4+iOj3lsMtuu6MAQc4bzrrqei3FJWMDUTNzFHEXszaP1M
         ed0gDNa3Mgm8ZdeQR1TOPLJL4ta4httEmORcrBmLFB+cTNC8gsU7f3iT9BmyGMFRo70y
         +T5JswGuBJWpe6yV3LCUQ7NOiFVc9UZ+Wka8Qx8M0Qgp3K1Lek7Tc0v5VLJQiO5ElYzr
         UUFw==
X-Forwarded-Encrypted: i=1; AKwUvBxbVM7mSlZiQwTpKmWGgG2hibOTmjPniT/d/C1s+/PbiAxzrVy8A9HF5YZaco+Vbkh034QY/f4Kl6dsJT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8RgoI7iFcxFOTL5CZWdsTToQjTNh4JEAYpsy+d6dl1tJAzEyS
	nt4+lhTWQV0oS2oLNu66S8qnzoKdXTcdam+M/tIO98qgSPCelAh5F2w/EnuNHIW4DQgN4G48JiE
	8yzFA/sGpGrAh5G1g9jqSd9VbYAo9ihW5Yyl7MY4v
X-Gm-Gg: AYBFou3j9sBdHsPRKFWOymKPaj1ogXqBNNA8u9ddgMiGnrB4VlMf5kXjorruTezdii7
	WtgeZpqPNqqdamowgLAX+2gLcQOgnr8pDJnWuMVTq1695SvkEpAH001OAbRNTucET0s7aad3fD/
	KFiyPQ+E9SpPzyChfoMmUkxCZnmpcXsTYk7byRQNUy70JeAql5OAT+QhDMaitlqm296qrAVYnMD
	WGKR12YWaQpR/HGLX79limz8NudN4TljGZnyq4SvRvGqIBfboYDmJ6H22u3F1RmsYF/Oil5n1xk
	ND2tb1HbG5h8GDDEmbJvLcW3556j0uNi7bugWUFXtVUezC5V92w+B2oRkZMVuu5Jk1YvMj+z3GP
	uft6bs8E5IA9O1RgLREpCL18gHIw5MO1PbeBK7gqubehenCKM+MqplcE7zuVVpuWw/lk=
X-Received: by 2002:a05:600c:6385:b0:4a2:1053:8854 with SMTP id
 5b1f17b1804b1-4a7fa6d7103mr133845e9.7.1793050793074; Mon, 26 Oct 2026
 14:39:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024030401.852598-1-almasrymina@google.com> <179289749460.3134.17105687099040790537@kernel.org>
In-Reply-To: <179289749460.3134.17105687099040790537@kernel.org>
From: Naman Gulati <namangulati@google.com>
Date: Mon, 26 Oct 2026 14:39:40 -0700
X-Gm-Features: AclHuK-532-QF-vwACr9a_MraviT-0vIBoDHd00aDqRCqW9_XeV6vsyv8HKpu8M
Message-ID: <CAMP57yUindVWCLV4O=Qki61VmZ2y8hjMPVJ51UnODz3D0LKwXw@mail.gmail.com>
Subject: Re: [PATCH net] idpf: free the skb on TX DMA mapping errors
To: netdev-bot+sashiko@kernel.org
Cc: almasrymina@google.com, aleksander.lobakin@intel.com, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 8:04=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix leaves the skb leak in place for HW-timestamped packets,
>   and the Tx timestamp latch they hold is also never released.

Both issues are pre-existing. This patch does not introduce any leaks
and these should handled separately in the tx tstamp and FLOW_SCH_EN
code paths.

>
> Pre-existing issues:
> - [Medium] This bug was not introduced by this patch, but in FLOW_SCH_EN
>   mode idpf_tx_splitq_frame() increments=E2=80=A6
>
> --
>
> idpf: free the skb on TX DMA mapping errors
>
> This commit frees the skb at the end of the TX DMA mapping error unwind
> in idpf_tx_splitq_pkt_err_unmap() and idpf_tx_singleq_dma_map_error().
> At that point the first buffer is not yet typed LIBETH_SQE_SKB, so
> libeth_tx_complete() only unmaps it, and before this change the skb
> leaked.
>
> > diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/=
ethernet/intel/idpf/idpf_txrx.c
> > index 885df6294ad94..a92e2457781e6 100644
> > --- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
> > +++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
> > @@ -2606,6 +2606,7 @@ static void idpf_tx_splitq_pkt_err_unmap(struct i=
dpf_tx_queue *txq,
> >       struct idpf_sw_queue *refillq =3D txq->refillq;
> >       struct libeth_sq_napi_stats ss =3D { };
> >       struct idpf_tx_buf *tx_buf =3D first;
> > +     struct sk_buff *skb =3D first->skb;
> >       struct libeth_cq_pp cp =3D {
> >               .dev    =3D txq->dev,
> >               .ss     =3D &ss,
> > @@ -2621,6 +2622,8 @@ static void idpf_tx_splitq_pkt_err_unmap(struct i=
dpf_tx_queue *txq,
> >               libeth_tx_complete(tx_buf, &cp);
> >       }
> >
> > +     dev_kfree_skb_any(skb);
>
> [Severity: High]
> Does this still leak the skb for packets that asked for a HW Tx
> timestamp?
>
> idpf_tx_splitq_frame() reserves a timestamp latch before it maps the
> packet:
>
> idpf_tx_splitq_frame() {
>     ...
>         idx =3D idpf_tx_tstamp(tx_q, skb, &tx_params.offload);
>         if (idx !=3D -1) {
>                 ctx_desc =3D idpf_tx_splitq_get_ctx_desc(tx_q);
>                 idpf_tx_set_tstamp_desc(ctx_desc, idx);
>         }
>     ...
>         idpf_tx_splitq_map(tx_q, &tx_params, first);
> }
>
> idpf_tx_tstamp()->idpf_ptp_request_ts() then takes a second reference
> on the skb and moves the latch to latches_in_use:
>
> idpf_ptp_request_ts() {
>     ...
>         ptp_tx_tstamp->skb =3D skb_get(skb);
>         skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
>
>         /* Move the element to the used latches list */
>         list_add(&ptp_tx_tstamp->list_member,
>                  &tx_q->cached_tstamp_caps->latches_in_use);
>     ...
> }
>
> idpf_tx_splitq_map() can then fail in two ways: dma_mapping_error(),
> or idpf_tx_get_free_buf_id() failing between fragments in FLOW_SCH_EN
> mode. In either case this dev_kfree_skb_any() drops only the xmit
> reference. The tail is rewound to params->prev_ntu, so the hardware
> never fetches the TSYN context descriptor.
>
> Normally a latch is retired only through the completion path.
> idpf_tx_clean_bufs() sees a LIBETH_SQE_SKB buffer with
> SKBTX_IN_PROGRESS set and calls idpf_tx_read_tstamp(). After that,
> idpf_ptp_get_tx_tstamp() asks firmware about latches in the
> IDPF_PTP_REQUEST state.
>
> A packet that went through this unwind never reaches that path. The
> only other cleanup is idpf_ptp_release_vport_tstamp() at vport
> teardown.
>
> Wouldn't the skb then stay pinned until teardown, along with the socket
> wmem charged to it, and one hardware latch per failure? Once every latch
> is used up this way, it looks like all later HW Tx timestamp requests
> would fail with -ENOBUFS until the vport is torn down.
>
> The refillq exhaustion drop path in idpf_tx_splitq_frame() also runs
> after the latch has been reserved. It seems to be missing the same
> rollback:
>
>         if (unlikely(!idpf_tx_get_free_buf_id(tx_q->refillq,
>                                               &buf_id))) {
>                 ...
>                 tx_q->next_to_use =3D tx_params.prev_ntu;
>                 return idpf_tx_drop_skb(tx_q, skb);
>         }
>
> Should the unwind also move the latch back to latches_free, clear
> SKBTX_IN_PROGRESS, and drop the latch's skb reference?
>
> > +
> >       /* Update tail in case netdev_xmit_more was previously true. */
> >       idpf_tx_buf_hw_update(txq, params->prev_ntu, false);
>
> [Severity: Medium]
> This is a pre-existing issue that was not introduced by this patch, but
> does this unwind leave num_completions_pending too high?
>
> In FLOW_SCH_EN mode, idpf_tx_splitq_frame() increments the counter and
> sets last_re before calling idpf_tx_splitq_map():
>
>         if (idpf_tx_splitq_need_re(tx_q)) {
>                 tx_params.eop_cmd |=3D IDPF_TXD_FLEX_FLOW_CMD_RE;
>                 tx_q->txq_grp->num_completions_pending++;
>                 tx_q->last_re =3D tx_q->next_to_use;
>         }
>
> When mapping fails, the tail is rewound to prev_ntu. The RE descriptor
> is never posted, so its completion never arrives. This unwind restores
> neither num_completions_pending nor last_re.
>
> When a context descriptor was used, the stale last_re can also make
> idpf_tx_splitq_need_re() return true again for the retried packet.
>
> Once IDPF_TX_COMPLQ_PENDING() exceeds IDPF_TX_COMPLQ_OVERFLOW_THRESH(),
> idpf_txq_has_room() returns 0:
>
>         if (IDPF_DESC_UNUSED(tx_q) < descs_needed ||
>             IDPF_TX_COMPLQ_PENDING(tx_q->txq_grp) >
>                 IDPF_TX_COMPLQ_OVERFLOW_THRESH(tx_q->txq_grp->complq) ||
>         ...
>
> idpf_tx_clean_complq() also sets complq_ok =3D false, so the queue is
> never woken.
>
> Could enough of these failures stall the Tx queue until the tx timeout
> reset reinitializes the counter?
>
> >
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261024030401.852598-1-almasrymina%40google.com
