Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7522371076
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274221; cv=none; b=WyTtCmWG2adwEhB2HMd5fTfminlBY+JMyNWLX+p39/URKhOeGahC4NX5fgeuWCJl4BFx19gKZe75cVUfrmkN++ChLsfLpm2bZbpcEzPvS/ohJSOpRD0FXcYXn+X1dWaF+iy0yFXbF739+mnJ0bwiB0kshjR9jPEjUyGertR6YfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274221; c=relaxed/simple;
	bh=BYLPDdtMbRsMbZBqiG6Y8QwjoDTJQbG1GON1KnrizEk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=oJwjsFoXsG7l0OgFyAHDOMXEmuyhLClvat3ZYhPocav21GXerE6Sbyd5KLq7Ky+/05J5Adep+cjBPIKWXqKzkjWTE8QBc/eEVqEMAVq+ZMnkIabHDTKSI8BOuUoMn3mbWPI0FCNd2mLnbtICc+APNbVLAB+kUCReMVGWb+JPqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwZCBHs/; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwZCBHs/"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-9142e0b0668so1747236d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790274219; x=1790879019; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=StxvthfeYX8VlV6E1S4M4PpN9J1tOF4TBmiuQqV9FYY=;
        b=EwZCBHs/J4zq7/4/VNGmumO+52hAhmUf6M2w2BsiC/7OyIpCniYI4ULTcqRwjGyzxS
         msa1pXlp9pQM99RMsUYF+KqwAJuw1tfpZ+08t1qSCBG6nSq+w/1GFSDi1LM2URvecV8w
         UpZyLqcusSHWT0IqAy0/87x+sDER6Lp+f61D8NAoJZSp2vMorzQj+h4F0y9cYZyDlM0E
         MaDqBmdPK4Okpwm4a+rkCJDXkmphC26Fm3x31f9HluYRwVGcjocEfaK8LcoUvtb+T9WW
         /IvFW/8NFLsGueWBoJWsTgwroPHQB0iIOzjrk0gUY3aEhmHHEWQYyUKz91ERcWVFsHI5
         vxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790274219; x=1790879019;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StxvthfeYX8VlV6E1S4M4PpN9J1tOF4TBmiuQqV9FYY=;
        b=BSMSYfQ4iu+tcOebIAzyLqdyMRb1JtwfJfbhAS3DBjP7+yuXqCsx7eUH4c4XfJQ2IB
         2XgjxoQmE+KsvhRIhjC8AYnyJh/N5D8npoMKOteK11QqLeXcvyPIbY7BugD8YNM8oEoT
         egeXggUPZDcSg/dLYRBvqIEeEH3MjElXZwlr5Tr+whRUfbVBYuWTqPUE9VDlZc+p8LV1
         nJN3jvmKu84DrhcEOS0BUfqVGaUYNLE229n5UDXJT3fXOPDPUZeQX4E1aHvrQf3SO1Mn
         DyoNMvASKbBbXR9f7besphee9wCJ6RIB950N0QroxzP04jmjhXfMvD/vH8DCQrGiXwLH
         ILTw==
X-Forwarded-Encrypted: i=1; AKwUvBxrkuI1DdMCrbHs8OW1t3rqfaAQEbOjWaXuiyCrASr6UoCZclsmqTUqUXpfXR8fe5EwfOO3DonxVWlTBkI=@vger.kernel.org
X-Gm-Message-State: AFuF++nKoVWqJk3mVkYzfsnEcO+/mLwdr1RL5btK/TbduDvPUPBC2GCs
	kGciPamRe7JMG7LwMmId8v2LOChiGIznxPUhYckrE4TouVYyNNQpTj64
X-Gm-Gg: AYBFou3ObVE0Q3Xii9QijAGMNhOBNGroICE0YB2yZfevUoIvlFnasN4JwHxwbTpuXo3
	F5kOwn0bdo1mZyIKtLXOvZoBjDQ5hBWv4uLGZFjju8c4LCtfY7kSK9huVkLgcalUUg8lemow1HY
	zymA53NMPu1sPJ6cOeQnMqYZwU4AWZ6isl9yiAGgmK0EOUM6bqNEv2vACctSZLWU9xh7TQSVJG8
	hPveMw/gM/AIAaBujDjT3Q3Dl+liSwQPrbd4ICsnAjJXggb9oNBq9rfs6NcEAUzJEciyN9TsK3p
	WqSZie3BiBQ20ECKBIBdxKo7Gm8Mkv8jw9h/NsnbF07vfTTwu1aV8ZErG6R54IVMR49s55nu5wr
	hJXtOY28Mf8CeydbR5SVMSK6k2at8F/rQJ6LzEvnI9Ox7Lu9gxDKdKUPfZw9q6afBuLLN89dx42
	+zFw036skCfhj4VqpIfzpDmrhr8vb5da+ON/maJN40ecUXFSeC6CcFrGIRy/J12qW8y1pTj0EXZ
	yARrYoMeSi6Hg==
X-Received: by 2002:a05:620a:d8e:b0:93b:d79b:9a5c with SMTP id af79cd13be357-93c43d2cf3emr15767785a.61.1790274218442;
        Thu, 24 Sep 2026 11:23:38 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c43b94ad5sm7961985a.2.2026.09.24.11.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 11:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 14:23:36 -0400
Message-Id: <DLNR8TCZEHFY.3D5MY7X4DXBO3@gmail.com>
Subject: Re: [PATCH net-next 7/8] eth: mpnic: implement Rx queue allocation
 and cleanup
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <dimitri.daskalakis1@gmail.com>, <mohsin.bashr@gmail.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260922-linux-mpnic-v1-7-236844f53072@gmail.com>
 <179021553913.2160803.3546397730187880772@kernel.org>
In-Reply-To: <179021553913.2160803.3546397730187880772@kernel.org>

On Wed Sep 23, 2026 at 10:05 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The Rx engines are added to an idle wait whose timeout is only
>   logged, and teardown then frees memory the device writes into.
> - [Low] The two comments about Rx buffer batching disagree with each
>   other and with the code.
>
> --
>
> eth: mpnic: implement Rx queue allocation and cleanup
>
> This adds the Rx side of the mpnic queue triad: a header buffer queue
> and a payload buffer queue, both fed from one page pool per triad, plus
> an Rx completion queue. Buffers are posted to the device in batches, and
> the device is set up to leave XDP headroom and skb_shared_info tailroom.
> Teardown releases any partially assembled frame and the buffers still
> posted.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/=
ethernet/meta/mpnic/mpnic_txrx.c
>> index f4ad8caf6ce66..6d2123bee97b4 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>
> [ ... ]
>
>> @@ -335,6 +336,109 @@ static void mpnic_clean_tcq(struct mpnic_napi_vect=
or *nv,
>
> [ ... ]
>
>> +/* Descriptors are only handed to the device in whole batches, so the s=
lot
>> + * the device is working on and everything up to the next batch boundar=
y
>> + * stay untouched while it does.
>> + */
>> +static unsigned int mpnic_bdq_desc_unused(struct mpnic_ring *bdq)
>> +{
>> +	return (ALIGN_DOWN(bdq->head - 1, MPNIC_BDQ_BATCH_SIZE) - bdq->tail) &
>> +	       bdq->size_mask;
>> +}
>> +
>> +static unsigned int __mpnic_fill_bdq(struct mpnic_ring *bdq)
>> +{
>> +	unsigned int i =3D bdq->tail;
>> +	unsigned int count;
>> +
>> +	for (count =3D mpnic_bdq_desc_unused(bdq); count; count--) {
>> +		struct page *page;
>> +
>> +		page =3D page_pool_dev_alloc_pages(bdq->page_pool);
>> +		if (!page)
>> +			break;
>> +
>> +		bdq->rx_buf[i] =3D page;
>> +		mpnic_bd_prep(bdq, i, page);
>> +
>> +		i++;
>> +		i &=3D bdq->size_mask;
>> +	}
>> +
>> +	return i;
>> +}
>> +
>> +static void __mpnic_bdq_commit_tail(struct mpnic_ring *bdq, unsigned in=
t tail)
>> +{
>> +	if (bdq->tail !=3D tail) {
>> +		bdq->tail =3D tail;
>> +
>> +		writeq(tail, bdq->doorbell);
>> +	}
>> +}
>
> [Severity: Low]
> This isn't a bug, but is the comment on mpnic_bdq_desc_unused() accurate?
>
> __mpnic_fill_bdq() stops as soon as page_pool_dev_alloc_pages() returns
> NULL. __mpnic_bdq_commit_tail() then writes that tail to the doorbell,
> so a tail that is not on a 64 descriptor boundary can reach the device.
> In that case descriptors are not handed over in whole batches.
>
> It also looks like the slot at head - 1 stays untouched because of the
> "head - 1" term. Whole-batch posting is not what protects it. The
> ALIGN_DOWN only holds back up to 63 more slots that have already been
> consumed.
>
> The comment on MPNIC_BDQ_BATCH_SIZE in mpnic_txrx.h gives a different
> reason for batching:
>
>  * doorbell. The device consumes whatever the doorbell points at, this is
>  * purely to keep the driver from writing the CSR for every descriptor.
>
> Could the two comments be made consistent with each other and with what
> the refill code actually does?
>
> [ ... ]
>
>> @@ -760,6 +1081,9 @@ void mpnic_wait_all_queues_idle(struct mpnic_dev *m=
pd)
>>  		{ MPNIC_TQS_IDLE(0), MPNIC_TQS_IDLE_CNT, "TQS" },
>>  		{ MPNIC_TDE_IDLE(0), MPNIC_TDE_IDLE_CNT, "TDE" },
>>  		{ MPNIC_TCQ_IDLE(0), MPNIC_TCQ_IDLE_CNT, "TCQ" },
>> +		{ MPNIC_HPQ_IDLE(0), MPNIC_HPQ_IDLE_CNT, "HPQ" },
>> +		{ MPNIC_PPQ_IDLE(0), MPNIC_PPQ_IDLE_CNT, "PPQ" },
>> +		{ MPNIC_RCQ_IDLE(0), MPNIC_RCQ_IDLE_CNT, "RCQ" },
>>  	};
>>  	u32 non_idle_bitmap;
>>  	int err;
>
> [Severity: Medium]
> What happens in mpnic_stop() if one of the new Rx engines is still busy
> when this wait times out?
>
> mpnic_wait_all_queues_idle() returns void. It only logs on timeout:
>
> 	err =3D read_poll_timeout(mpnic_non_idle_queues, non_idle_bitmap,
> 				!non_idle_bitmap, 20, 500000, false, mpd,
> 				queues, ARRAY_SIZE(queues));
> 	if (err)
> 		mpnic_idle_dump(mpd, queues, ARRAY_SIZE(queues),
> 				non_idle_bitmap, err);
>
> mpnic_stop() then keeps tearing down:
>
> 	mpnic_disable(mpn);
> 	mpnic_wait_all_queues_idle(mpn->mpd);
> 	mpnic_flush(mpn);
>
> 	mpnic_reset_netif_queues(mpn);
> 	mpnic_free_resources(mpn);
>
> mpnic_flush()->mpnic_clean_bdq() hands every posted HPQ/PPQ page back to
> the pool with page_pool_put_full_page(). After that,
> mpnic_free_resources()->mpnic_free_nv_resources()->
> mpnic_free_rx_qt_resources() frees the RCQ ring with dma_free_coherent()
> and calls page_pool_destroy(), which unmaps and frees the pages.
>
> The earlier commit "eth: mpnic: start and stop the Tx HW queues" says
> disabling a queue "only stops the device picking up new work, it does
> not tell us that the work already fetched has been retired". If so, a
> DMA_FROM_DEVICE write could still be in flight after a timeout. Examples
> are descriptors the prefetcher has already fetched, or a frame the RDE
> is partway through.
>
> Could such a write land in RCQ memory or Rx pages that have already been
> unmapped and possibly reused? That would cause an IOMMU fault, or silent
> memory corruption on systems without an IOMMU. Before this patch, no
> device-written Rx buffers were covered by this best-effort wait.
>
> Whether this can happen depends on whether a non-idle Rx engine can
> still complete DMA after the timeout. fbnic_down() follows the same
> ordering. Would it make sense to return the timeout to mpnic_stop() and
> avoid freeing device-writable memory (or reset the device first) when
> the queues never go idle?
>

Same complaint addressed already.

