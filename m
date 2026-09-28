Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6755A33D6F9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603927; cv=none; b=kd/x9T1R4IFTspw+eVjuGHAjzP5EMc9UsWv0sluvxvEBT9S15VMXpao1Gz74SZQe1R+6XyjXc0AnZLRj0cilaF+IqHewhSUFfV5EuxAD7gGMoCep28HWmPTP8y0i7cYIFRLRT7mE69zheqfPxnMYkVAbFGApkPWL9FCZYwG0c+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603927; c=relaxed/simple;
	bh=EBWzc4O8yIvlhuQ64n0OVQvegICiNF/2xN6TF6aM+aI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kZK6HiULcZtBmXWUPJx9gx81z9w4VC7rJ+PiZFs74RatjvgD3SvZZ5b9RNG2Rg1wFaPNicVKcsLlaAruMaCHmVagwfmJdmXvrpff/mhmUg4NTa0q8q1pGK2ex4eDgze2fkkkGWF+LAY1sIgih/4qSOrsBNjibtAkZJf3/7sAOOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ttrmp7LY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WyVDZAVl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ttrmp7LY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WyVDZAVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790603925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBWzc4O8yIvlhuQ64n0OVQvegICiNF/2xN6TF6aM+aI=;
	b=Ttrmp7LY3iNZtRTmJ6zD/f4F3duwpNuP82ZpZAzx+z/GZRT/jgK4XW6CkE66V2ysAGS4o+
	ent+jxH+x+QC1u30F/Oi+WONVBs1nk7+2jPzbldy2Sx2+U103fikWpIC+4mumb691ZXyRm
	4Y8POMStGcxWCd57b2s5UX/KrdDbhUw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-MmDrEzmONqmFDRgM1mp9sA-1; Mon, 28 Sep 2026 09:58:43 -0400
X-MC-Unique: MmDrEzmONqmFDRgM1mp9sA-1
X-Mimecast-MFC-AGG-ID: MmDrEzmONqmFDRgM1mp9sA_1790603922
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0032846d7so11544475e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790603922; x=1791208722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBWzc4O8yIvlhuQ64n0OVQvegICiNF/2xN6TF6aM+aI=;
        b=WyVDZAVl5rA3lBEzKjUBvdhoQzxHS7x2IexcFOqsqJCicwxoVffVhA5W2RVS4X2JCk
         U4i1n/z9fgP/Cu3So8EUL6DHxaTcXNIb9UWmc2MtCpweKdp41rSg+kZfAeZKuMMDFxeI
         1pHl2Np2UM8PHyqsu3flTdoLfZ6PeU4ateoXWDhWGUFgwVTCTwOqfMqFWNW2s6Kcyvv2
         K9wT3QUqW2w/bDtkLLMSfwrT9DEoq87ykDO1ML97Volx4X2L3ESc81nxAn0nq/+lbESs
         2BdXpjUhJ8Z7Pv5feLsFZ4bx8OTvQ1YEAXD/xxUC2X/rLiFLaFEPtQ0F096Yl0CnFMRv
         VReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603922; x=1791208722;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBWzc4O8yIvlhuQ64n0OVQvegICiNF/2xN6TF6aM+aI=;
        b=OriVMrF+2N/Wc1WZxqx+4YiBPuAjMnapY1DLghEPbX6KWHYvgrIVymvbF0Vj+Oi0SH
         A5EKAX5fUC0oIZ80Ty10PgVnHXnfhePjDNJBYzL8fUiXPe8X/3V34pqSKNgTcynaN50Q
         Xba87TKFBD/sIz9SwZRTsRAx6n/tvnZRXVj/h4r/cypMtMGEpqrzOz2rS24iG5hOjTQg
         /yf/PxJHjAMj2xp8s/54d2NcJEZb5ZWUh3GKlr6S3qftJnQHiyk8uvnbzXZjfe2goMjH
         ksKyi4Ic0YNHvX9eOox1caiHKp4isVL9xic2N3XP5UF6YGxjAiHTe4NaqrbDvodWEYM2
         Xauw==
X-Forwarded-Encrypted: i=1; AKwUvBz7t67V42SdKueHkbrFgYKH4Lfy7DOOlFj2H204+xqFwGxKFnOBBY3tAXVoJFLMBztj1BexFEJY1VGERyY=@vger.kernel.org
X-Gm-Message-State: AFuF++nhxHwKNfPe/MACRofF6G+KcWXDoaqYsz7jnlCgy0Gkn7+vMnbg
	9UpsENwNBuJwj/Cmv27TCtTUVzCDCIbfjPS39qH5O2DrZgi95LVteP9AuJsace9aLKyCxP7uDng
	7wZ0TStprIqOe7MjgizT4VWXHtLOOhD3BAHve34YLQqWjpn5NJ1/UMKYiDzDupI76ZA==
X-Gm-Gg: AYBFou1zebemlJdXlcWYvvJ/w4O9TH1Xo5dZoqmCyzp9yxMeshGJUmK67j2S/7cy5gn
	7rOInXagLD6dDxn2fHDDjJVhF1UOXUXKc3Ks4zL4MB9NbCKljObUQ8GPck9v8/6pYxDTJv0gOkk
	r+fLZEol7NSM9Xtid24v3AxZ90Wi688UGLFTOK5q+itG5RIlHwnC8nAjZE2jxbvMXUQOoYolUnl
	x0c9JidxUcQAuQROXqfDQaKwI340NInOkpgTyKKEOIGA6IcMXlImkzosrzEnLUgPTZVPtP7RKdw
	rDGx2mnneKGmJsiS7whN/0FLOoJpZne8aeDUfSOKCyM73ofOfL9dpG4Kl9Fki0n0tLxHmD/3pYA
	bS4blNOi4kQsIpDaT4zofmHOJDw==
X-Received: by 2002:a05:600c:198a:b0:49f:ce78:356c with SMTP id 5b1f17b1804b1-49fe67023femr226123785e9.29.1790603922532;
        Mon, 28 Sep 2026 06:58:42 -0700 (PDT)
X-Received: by 2002:a05:600c:198a:b0:49f:ce78:356c with SMTP id 5b1f17b1804b1-49fe67023femr226123175e9.29.1790603921835;
        Mon, 28 Sep 2026 06:58:41 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a2acb4dsm27519158f8f.0.2026.09.28.06.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:58:41 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 856EDA0FCDD; Mon, 28 Sep 2026 14:40:22 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Mina Almasry <almasrymina@google.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Kaifeng
 Wang <kaifengw@google.com>, Dong Chenchen <dongchenchen2@huawei.com>
Subject: Re: [PATCH net v1] net: page_pool: fix use-after-free in
 page_pool_recycle_ring_bulk()
In-Reply-To: <20260925144127.1445667-1-almasrymina@google.com>
References: <20260925144127.1445667-1-almasrymina@google.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 28 Sep 2026 14:40:22 +0200
Message-ID: <871padlfbd.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mina Almasry <almasrymina@google.com> writes:

> With CONFIG_PAGE_POOL_STATS=3Dy, page_pool_recycle_ring_bulk() updates
> the recycle stats after dropping the producer lock. If it just recycled
> the last inflight netmems of a pool being destroyed, page_pool_release()
> can pass its producer-lock barrier and free the pool before
> recycle_stat_add() runs.
>
> Commit fcc680a647ba7 ("page_pool: allow mixing PPs within one bulk")
> moved this stat update after the unlock. Commit 271683bb2cf32
> ("page_pool: Fix use-after-free in page_pool_recycle_in_ring") later
> added the barrier, but only fixed page_pool_recycle_in_ring(). Move
> the update back under the lock.
>
> Fixes: fcc680a647ba7 ("page_pool: allow mixing PPs within one bulk")
> Link: https://lore.kernel.org/r/179028939171.2160803.706522228583664641@k=
ernel.org
> Cc: Kaifeng Wang <kaifengw@google.com>
> Cc: Dong Chenchen <dongchenchen2@huawei.com>
> Assisted-by: LLM
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

