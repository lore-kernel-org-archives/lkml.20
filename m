Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109201;
	b=MnCSBoAaONHAXprRcA3BkOn+ukzfW8dEPCW00pAMt+TQpjyuMbxu6IZZRXYg8cnXJ3vc
	 Y+xiNoXgqAtL3nM2dhvP4EyYYg9BbcY16/DGEW0Va1rnhQXAoLvqM/qIURwxmnQCEdr7H
	 /1dTrHvwwWwusv2k9XOeucENoroizacNv3mDAet4pVUMu3eunkziYAefkPKRYwauKBrpC
	 SuMiAt3Kaprt3yLvrDeLYBR5TiF1rfrvrtQjL+OHWoo0JYvdRhSWUN4W69IEJZrEoK5HD
	 Ry3mguDkMqYhD4ndRr5jdZSppLWYUL3Jd25CZcCUrwou62htXnxoXA5QdScCy6RqPOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=seoLYPoPk5mt5piMxvDgKwZd5rMW4AsZNb6zEMwZMTU=;
	b=dvx0JknMnZsCZ9W8wEy6Yv8THVyyQAlky080UWXx17anxT/9zsfeuRJp8u7XFn5I0/GE
	 c4ZnwhXE00z5ce8C0AKv4t5YtDBmBvrhEVSDtAE8ZNbVRze3Mc+DRzIG0iNG0HiwQ8pWA
	 Y0B8Z1wN8kzjRMIbRFM643BxEutUz9rNhAmtDatSMvv5cprTg1hNasyBfERn7Xd7maxpQ
	 Rbkl9wlHoewFVxbini3phX4S/bDTyiTZjSqtzWFVciKIPmoI/yVOuxX+vWRDROiRBIfrN
	 Y3lM3zchpLqld+N8MlKoDerviUlBnQN2YI1gOl6JuGBcXd5NJW2o2XkMOdHOU3Yv3qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ao/YHcb0";
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3859B606A339
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3859B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ao/YHcb0
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd65a511e43so1922747a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109200; x=1793714000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=seoLYPoPk5mt5piMxvDgKwZd5rMW4AsZNb6zEMwZMTU=;
        b=ao/YHcb0a9EZt2JZ0Jw43sww0NwPRYR9JMmJw1T10j5LNFrQXEBicgmlxBSANOKCg+
         /XTzCfSG6FkkshfhKJjgOm+6/i8qfeB13uF80OHWQmN70t8gBUzKAJ5ZUbehP6EqBPH3
         3MHBwG+3gclSvnpjCid/OXjbXF/R2qgkdySo1CrVILv/4zVG7T4SFPWxCifPlYWhyf9R
         FKOjZlQbuXOYQ3O1RcnHjr/cE9FM8Xn5PcaMAbNG89Rzjs8ylNX7UXqxWELflCPDKe3N
         WBrLE+r2H6F+rfJUAUoBYFHAf6fN1fZN3BrBfkYQ/4VwK/wiCEd1ywrCj3YOGn9ieoXj
         KN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109200; x=1793714000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seoLYPoPk5mt5piMxvDgKwZd5rMW4AsZNb6zEMwZMTU=;
        b=uS1O7bOlSTeBVglsIJES3LLjokyUFN4ouHcqqPbytRzAYimEvOidESXumWQmrOGK5l
         N4CANS3hZj2hfMGMNHCbuKiHO7ZeP/eajSz97tjk1ynGZ0w3PMD+2fANrsszreMa20gr
         Aexph9kj4Gfizcx0DUWJ4gRIW5H6cH0ixW8XD6TeUtSTK3HqIgfkr5W0efvzqmRDrN6g
         E8MN8l37MkoWFxISFITttO1fKsXGRcZjp0iVpphAn6NgI5CbX+r/DjLl3+bpF8MOINdf
         2NJ3wqqrvi0CjXQmCoAeVEbd3FjJzFau5QnTKOTUnH6gYZCV1ckcgVM8J7l13lJ33d+e
         IvZg==
X-Forwarded-Encrypted: i=1; AKwUvBz/d/d0oaOfcWccyXiBgBDy21lVyMTB96IpHx2aqZJs8UQyGuzZz4T3Lz0KOghV1VCDJs0PQbuSGaXjaPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6NLqwRmswHARfhUi316Z1n7OzCSE4aoq+Uxzdb4faqtCCnaVj
	01BpZFh5oRs3x7PgumFfjI5pGY33VEO9NQVOHWVbS7x8xGnz5SEAjd1w
X-Gm-Gg: AYBFou1/uOMtW/Oiy3zWxO8gitgBAK/QiCBIcc8szS6UnmxXw3/1qPAubAKcmxsJegU
	sylSn10yIsQ3mQwxXXHZLKewK609wVvJErk3UefCDJ7OO5uIOFuV5yWSCy+LEBmx/WbXgx6VoQU
	OA778c7uJsAmXqS7FC8KYEfFLWI6Gdnh1ubS4Z7dATO6WIXsz5R3we9hHEYx4/2p2bpzhH5i49g
	7MTC1Sgs0rtLLlLZZu+MEddWEOa9c4c6TtOcTTc/1KVk1Gmn/RQtBFe4+8k7H40frI+GHORhH3+
	oKyOPHqOVga1WN0NZxfTM0wgvu7niXYBFuAyE4XAgCI4HrhJ3hhXsM32gDTvrS1REEbkLSOzjDm
	F48iMiUtEvja/F4hsj0gmInsmf1f2Aotb9wphCGe0bvQotbcyg5h0VLamljXp7k2VfAK0RDZPRd
	Y1MLOohrD4dxGRK64U3dnSfM96mEuczb4SVJ3DPGkSjDKNuJgq3ZdFO8JT2sNYooHGzDQ96ZKhq
	UGuFS3lClamLmD7SjfcqxhnRGWfCgvKtqBf86sUGgekQtJ3f8a42He+iNAVhU7cnFhsTggEUwx7
	qMgwyn25qNl7lUvdk9+TF13SO0gysBqD8bpBeFHFCUr795y82srlDWh/IY5VlBsIdlAVehQfUyM
	4Vm+c8xNL0dma1zccKH2dgtOtOBuUKfX3Vd3NsbXRgTwepAX6Tu+I1kpniLXBd7+8OCcDTVQd3L
	em
X-Received: by 2002:a05:6a00:3a17:b0:89e:779b:cff with SMTP id d2e1a72fcca58-8a364b4ce5fmr8249181b3a.6.1793109200511;
        Tue, 27 Oct 2026 06:53:20 -0700 (PDT)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a5f652aasm50188b3a.17.2026.10.27.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:19 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:53:16 +0900
From: Lianjie Wang <karin0.zst@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] virtio_net: reject stats replies for queues outside
 the request
Message-ID: <auCkXHi6IulXgm7v@wang0.localdomain>
References: <20261022182710.2055771-1-karin0.zst@gmail.com>
 <096bd22b-c569-4998-a943-0381c3fa9998@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <096bd22b-c569-4998-a943-0381c3fa9998@redhat.com>

On Tue, Oct 27, 2026 at 01:06:41PM +0100, Paolo Abeni wrote:
> On 10/22/26 20:26, Lianjie Wang wrote:
> > [...]
> > @@ -4976,6 +4977,10 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
> >   	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
> >   		hdr = p;
> >   		qid = le16_to_cpu(hdr->vq_index);
> > +		if ((qid < first_vq || qid > last_vq) &&
> > +		    !(enable_cvq && qid == vi->max_queue_pairs * 2))
> > +			return -EINVAL;
>
> I think the above check could be simplified to:
> 		if (qid < first_vq || qid > last_vq)
> 			return -EINVAL;
>
> squashing the following in virtnet_get_hw_stats():
>
> -       if (enable_cvq)
> +       if (enable_cvq) {
>                 virtnet_make_stat_req(vi, ctx, req, vi->max_queue_pairs * 2, &j);
> +               last_vq++;
> +       }
>
> (likely with some meaningful comment).

Thanks for the review!

I looked into this, and I think last_vq + 1 matches the control vq
only when all queue pairs are in use. The control vq index is
max_queue_pairs * 2, while last_vq is curr_queue_pairs * 2 - 1 for
ethtool -S. After ethtool -L lowers the queue count, or when probe caps
curr_queue_pairs at num_online_cpus(), last_vq + 1 is the receive vq at
index curr_queue_pairs * 2, which is not in the request. The simplified
check would accept a record for it. Since the ethtool -S array has
slots for only curr_queue_pairs queue pairs, with the transmit slots at
its end, virtnet_fill_stats() would write the counters of that record
into the transmit slots, and can write past the end of the array.

Would you like me to keep the current check or change it in some
other way?

As for the comment, I would add the following above the check in v2:

		/* The control vq comes after all max_queue_pairs pairs, so it
		 * exceeds last_vq + 1 when fewer pairs are in use.
		 */

Thanks,
Lianjie Wang
