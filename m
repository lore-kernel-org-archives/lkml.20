Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08735908A9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988122; cv=none; b=gey6C9aBGOSmvHaUXro6BQWWsjSvWRFsiLfb4+qEWOeRtnrpg8u8MIhteWu+cCJ+vY+0rJ1zKDxE68s9Hu+ibluqEJq0GBYasZhqhv2up+rhk9rcYEYTWYhdNl+D/PuyJCUD2jK07ENYi2/Q58EMRyOR1MNJ4yrQKP63KDZdHaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988122; c=relaxed/simple;
	bh=v6XN1bSzrdiOZsy+gxDBorIxvgzRZF1Y/gKavtMSJdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VthHx39mOxJDv6334LJ67qgocTqD7ah7UvD9s/rhH5LNMaRyRV3R0ysmvlacZLtKv5ac1L3HExJdjpG5/tyvLEEkhgmXEgZrHlIyGWLgYmpw69QivPxaNE9OfTyb343AkLf2BNguRqe41oBECUcpsUU2Hl3JkS3TkiUhTwhipog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=coTraDnG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrgxgPCb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="coTraDnG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrgxgPCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788988119;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JeCu1I7ci4XqifONO9NCiEC08kQGS9StekRATuRZUpY=;
	b=coTraDnGs/wAD8KBc82xncnv4L+tv6tvaG8lrH7NRfim4G3CLJ9XNx5MAHhdtFvfOrmTg4
	WE5fEJGK4KMe0TPhpzBVOpHVaISsia7XAW42t8Ep2WyqTwl3hVlX74pbCAyukTl6nxdyLt
	zNKbdSLZWufU5I91ecKHh8Ze66HliK4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-BF2AzGBLPMCv3QgOaTnNvQ-1; Wed, 09 Sep 2026 17:08:38 -0400
X-MC-Unique: BF2AzGBLPMCv3QgOaTnNvQ-1
X-Mimecast-MFC-AGG-ID: BF2AzGBLPMCv3QgOaTnNvQ_1788988118
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5308a3825deso61735451cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788988118; x=1789592918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JeCu1I7ci4XqifONO9NCiEC08kQGS9StekRATuRZUpY=;
        b=hrgxgPCbI+s2W6pD4vzacl4WpRBvQfuv4h0IzPeK3MG2bd7YCv9lzyixwuWci6j4zC
         VDWCz3ZdETVEeyMEnmPFtKukP58YhG6WXGO91YyfdHEqCgUO01ehWMaxAYdaGwHhh7WP
         bCrcsCQKeGli+uI0sbi7DY9YsLmw/2pNRB+ELdcWLMm3hawoWzCdDfcMssftK5ltNXmR
         ZtISmNxU3Hrodujh6PmggJg4/v1lyxj7nZLTu9a5I16r4k9ZVKjOpM33Xi85hWQgyo1C
         wRvO+fQ7L7VYbQqSnrxEdUgAKKUz3E3qKnjI1PPNsfe98EsDKJvnwMXYZjZLk5X6Npdr
         zUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988118; x=1789592918;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JeCu1I7ci4XqifONO9NCiEC08kQGS9StekRATuRZUpY=;
        b=YmJlRpIcSQ9bPPDH9lhrflPDTx9/217Pa/IgBs/aI3dck4dOTSZ2IPLRLJELcvKzJ7
         YmFxSoiC2VEWiInAO5jXZeFtvuC9P3YuqgZycISR/+eqxxv1T/3oUNHgtOXXqS+K92Uy
         fOtQXE+OO6ljkDKi7lpO2xnmuJjtXno3MqDJFzZmm4IkKggO/hSdzeMepaqrSis5kMZC
         wtG15Y7nleax5O5jFxkx7S14vyaTFrgumDC3rrGCjmPSpipMSSi5a1iyfjc5Ncx5EzFB
         PqlCkCZAvHEjHoamWtNdWCF3hiYRiqxMsuhWXQFoqANjK2wxGWXZWg3wSqnY8UU2hqeK
         pxpw==
X-Forwarded-Encrypted: i=1; AKwUvBx9w4SzWVcJZnKvP0hr23VJPBPfwphoJwc0VpazipLqNCtOpkcUT8xNFipNOQV95LH2K6Auomfrua5mOyM=@vger.kernel.org
X-Gm-Message-State: AFuF++lGBFBsk/UQ0aRE28ttIqiaFHA9jbaoxXzYxWlVAtjr+E/nRq3B
	HfvAFsEtl7vq3JaZH8iVQh3PYANYqXEfprsZrDdRzaD2DFiGZ1px8WNYkpB2zPBswodYO404tqJ
	t+JRGMvGMzHii/hi4QOvp9NnPGOLWZ6H0zeIocTdnBYThoRWE9h8i3Bw6fzfDyD1bhQ==
X-Gm-Gg: AYBFou1AbvuG4y5e4kCeacfrFc8BEZ4EbkEFsawBcL20NykGpw9D2bDyOWRZVgJDYuR
	LYNnMp0Njv07Uk4eyV6XcVvPnKoDVDveKekAZHmtWG+gilE8cNXCfPtcINdfKaVGZS8qwIxdTTH
	Fm8QKRI4QLUVYBEzElSKsbDcA60gz4ObBNeAvV0CBSyf7T9eBoNykuD+7k5oI4izREhRIrDJC5x
	cdoTi5ql8pKTkw/JpRM65WyOWodSp/u3iDnuReOPBZJCkvRKgDy9UoAPnovSeF9m95FmbIA0t1A
	ZUrsJznnsQ55F4ZivypRTKTrPA5VFKVGy8GH4IJQuenm8SbvSfwQlXOWw68sQk5r6pCEJV35KYA
	yInPBxWKQuw31DQk68PdWSQigTX3s6U1u0lgQ5iMr
X-Received: by 2002:ac8:5cc1:0:b0:530:b2e2:2f1 with SMTP id d75a77b69052e-530b2e23739mr27765601cf.51.1788988117881;
        Wed, 09 Sep 2026 14:08:37 -0700 (PDT)
X-Received: by 2002:ac8:5cc1:0:b0:530:b2e2:2f1 with SMTP id d75a77b69052e-530b2e23739mr27764751cf.51.1788988117237;
        Wed, 09 Sep 2026 14:08:37 -0700 (PDT)
Received: from [172.16.0.69] (c-98-227-24-213.hsd1.il.comcast.net. [98.227.24.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm153786676d6.0.2026.09.09.14.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:08:36 -0700 (PDT)
Message-ID: <317dd59c-819f-4bbe-a196-3946c30eb0a3@redhat.com>
Date: Wed, 9 Sep 2026 16:08:34 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: sorenson@redhat.com
Subject: Re: netfs_read_gaps(): aliased sink folio makes the read destination
 unreadable, SIGBUS on cifs with signing
To: David Howells <dhowells@redhat.com>
Cc: Paulo Alcantara <pc@manguebit.org>, Jeff Layton <jlayton@kernel.org>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 CIFS <linux-cifs@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <afd68097-b2b2-47e5-889b-fb077e7a9247@redhat.com>
 <a385053c-1c4a-4060-a3bb-befa007ddb33@redhat.com>
 <1714046.1788952509@warthog.procyon.org.uk>
 <1730052.1788974127@warthog.procyon.org.uk>
Content-Language: en-US
From: Frank Sorenson <sorenson@redhat.com>
In-Reply-To: <1730052.1788974127@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 12:15 PM, David Howells wrote:
> Try #3...
>
> David

retested successfully with v3


Frank

> ---
> commit 05abad6ef207137fd3a2559d6ac242d1f94c60aa
> Author: David Howells <dhowells@redhat.com>
> Date:   Wed Sep 9 11:36:30 2026 +0100
>
>      netfs: Fix netfs_read_gaps() to use separate sink folios
>      
>      Fix netfs_read_gaps() to use separate folios rather than re-using a single
>      sink folio to discard the unwanted data so that cifs checksum checking sees
>      all the data that was fetched.
>      
>      Fixes: 7f84a7b9892d ("netfs: Make netfs_read_folio() handle streaming-write pages")
>      Reported-by: Frank Sorenson <sorenson@redhat.com>
>      Closes: https://lore.kernel.org/r/a385053c-1c4a-4060-a3bb-befa007ddb33@redhat.com/
>      Signed-off-by: David Howells <dhowells@redhat.com>
>      Tested-by: Frank Sorenson <sorenson@redhat.com>
>      cc: Paulo Alcantara <pc@manguebit.org>
>      cc: Namjae Jeon <linkinjeon@kernel.org>
>      cc: netfs@lists.linux.dev
>      cc: linux-cifs@vger.kernel.org
>      cc: linux-fsdevel@vger.kernel.org
>
> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> index 424df70a5c30..105194de6e13 100644
> --- a/fs/netfs/buffered_read.c
> +++ b/fs/netfs/buffered_read.c
> @@ -482,15 +482,14 @@ static int netfs_read_gaps(struct file *file, struct folio *folio)
>   	struct netfs_group *group = netfs_folio_group(folio);
>   	struct netfs_folio *finfo = netfs_folio_info(folio);
>   	struct netfs_inode *ctx = netfs_inode(mapping->host);
> -	struct folio *sink = NULL;
> -	struct bio_vec *bvec;
> +	struct bio_vec *bvec = NULL;
>   	unsigned int from = finfo->dirty_offset;
>   	unsigned int to = from + finfo->dirty_len;
> -	unsigned int off = 0, i = 0;
> +	unsigned int off = 0;
>   	size_t flen = folio_size(folio);
>   	size_t nr_bvec = flen / PAGE_SIZE + 2;
>   	size_t part;
> -	int ret;
> +	int ret, i = 0, sink_from = -1, sink_to = -1;
>   
>   	_enter("%lx", folio->index);
>   
> @@ -515,24 +514,23 @@ static int netfs_read_gaps(struct file *file, struct folio *folio)
>   	if (!bvec)
>   		goto discard;
>   
> -	sink = folio_alloc(GFP_KERNEL, 0);
> -	if (!sink) {
> -		kfree(bvec);
> -		goto discard;
> -	}
> -
>   	trace_netfs_folio(folio, netfs_folio_trace_read_gaps);
>   
> -	rreq->direct_bv = bvec;
> -	rreq->direct_bv_count = nr_bvec;
>   	if (from > 0) {
>   		bvec_set_folio(&bvec[i++], folio, from, 0);
>   		off = from;
>   	}
> +	sink_from = i;
>   	while (off < to) {
> +		struct folio *sink = folio_alloc(GFP_KERNEL, 0);
> +
> +		if (!sink)
> +			goto discard;
>   		part = min_t(size_t, to - off, PAGE_SIZE);
> -		bvec_set_folio(&bvec[i++], sink, part, 0);
> +		bvec_set_folio(&bvec[i], sink, part, 0);
>   		off += part;
> +		sink_to = i;
> +		i++;
>   	}
>   	if (to < flen)
>   		bvec_set_folio(&bvec[i++], folio, flen - to, to);
> @@ -553,8 +551,10 @@ static int netfs_read_gaps(struct file *file, struct folio *folio)
>   		folio_mark_uptodate(folio);
>   	}
>   
> -	if (sink)
> -		folio_put(sink);
> +	if (sink_to >= 0)
> +		for (; sink_from <= sink_to; sink_from++)
> +			folio_put(bvec_folio(&bvec[sink_from]));
> +	kfree(bvec);
>   	folio_unlock(folio);
>   	netfs_put_request(rreq, netfs_rreq_trace_put_return);
>   	return ret < 0 ? ret : 0;
> @@ -563,6 +563,10 @@ static int netfs_read_gaps(struct file *file, struct folio *folio)
>   	netfs_put_failed_request(rreq);
>   alloc_error:
>   	folio_unlock(folio);
> +	if (sink_to >= 0)
> +		for (; sink_from <= sink_to; sink_from++)
> +			folio_put(bvec_folio(&bvec[sink_from]));
> +	kfree(bvec);
>   	return ret;
>   }
>   

-- 
Frank Sorenson
sorenson@redhat.com
Principal Software Maintenance Engineer, filesystems
Red Hat

