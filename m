Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908593;
	b=Ke3kXD0UX0SdU3klWUII6OZykCrJAxWKaXxRMZ/sckzMqKfMiEe+5Y2mPXL0fBi9hZ9N
	 Mmar62iwvCkVdFG8KhN5WdjgI4VDU8sWFEAhNXRP3tAwn7pvM8Bzqpvuc7qsMGU6BvozT
	 Ngm5S4CzmnRo5pRVq8HS3hnrHXbCB4JfET11gpt64xdFVV0UiwS+GtaQSYOkFid1LSW1A
	 CYyJGULnmgmTqp3r6vGVMZr1fg7ExxkvfE/XdcEpIk8gTG1FFvMKQL+WBTvcPYVl/uGDJ
	 bqGdJgjT4BwDO3NE8el7eIz02MAPvOoOe3YWmiXYxTYZ2IUy/ysUbQBBhZUqGnl7lvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908593;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 X-Scanned-By;
	bh=XmNOJezMWFZ8d9FUQnR93oHeejrxTbPCvCkgJ4e6wSI=;
	b=1dEZ0EhYQGRz+NeM5+wWP5l1Ok+t+RTsjn80A73l1vCRpJ5hv6dPUvNZibv1/hWSwGuR
	 puHegmPaQaN3FclI/pe7pfg3xZE8NO7VGEvIuCN4z2HkCjeawX7EQ0gbrVD8ZDqUHT8bk
	 7ZFGRgrSXVT0Np6gbBSEz4GuLv8F0Z5B9cq3GMuegF+UlWBKWuJzRP6bPLtv/Fz2uEJHp
	 3Z6vaPL81QBOyEt8rjJkzEajEZlP/xhtDIn1rbgbGHu6iyazwHXDl1GEckCbXP5j1+8hY
	 bbnV18d0MOisN151XuJHbixG3V6lXAqpP8/ibxpDXkcGfpgmpr4oeK83kt0OUYIabqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U8OprlN4;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A4606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889A4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U8OprlN4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793908591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XmNOJezMWFZ8d9FUQnR93oHeejrxTbPCvCkgJ4e6wSI=;
	b=U8OprlN4P3OBjjNcy2efGQIVpmcHH65Sk3Z/ZyXunkdUioOVxtX3jc5ocvQljtHWUECm/Z
	JRu4QSCenLk7lXvnY/v17E3rt809pVww1YjlsTUbFTaQNfTygSAu3L/w3gC986iv4pp+fT
	P4FF2YaiC2rErw0YadmpK4s5KF1VWoM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-HVtl068wNGuHBG9SvbPSiQ-1; Thu,
 05 Nov 2026 14:56:27 -0500
X-MC-Unique: HVtl068wNGuHBG9SvbPSiQ-1
X-Mimecast-MFC-AGG-ID: HVtl068wNGuHBG9SvbPSiQ_1793908586
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53D8C195422B;
	Thu,  5 Nov 2026 19:56:26 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4BEA1848D41;
	Thu,  5 Nov 2026 19:56:22 +0000 (UTC)
Date: Thu, 5 Nov 2026 20:56:20 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
cc: agk@redhat.com, snitzer@kernel.org, bmarzins@redhat.com, 
    dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
    syzkaller-bugs@googlegroups.com, 
    syzbot+5307e3bcacec2ce4c2f0@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] dm: Reject table setup after queue or disk teardown
In-Reply-To: <CADZg-m06Zf1c63em8uJaDKVQu68sHbdBi1oZw7JAbhUtvk5nXQ@mail.gmail.com>
Message-ID: <ab4a2433-234f-d275-8473-50494d019439@redhat.com>
References: <CADZg-m1A5qKMfXGtQw_s9-tYDL-NinDX8bNAxurFkrWRRq7ZeA@mail.gmail.com> <CADZg-m06Zf1c63em8uJaDKVQu68sHbdBi1oZw7JAbhUtvk5nXQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi



On Wed, 4 Nov 2026, Kirtikumar Anandrao Ramchandani wrote:

> A failed table load can leave a mapped device in a state where its
> queue has already been initialized or its disk has been removed, while
> md->type is still DM_TYPE_NONE. A later table load then calls
> blk_mq_init_allocated_queue() on the same queue. If del_gendisk() exited
> the old hardware contexts, blk_mq_exit_hctx() dereferences their cleared
> flush queue pointer.
> 
> Reject setup attempts after queue initialization or disk removal. A
> failed request queue initialization still leaves md->tag_set NULL and
> can be retried. Set the request-based disk operations only after that
> initialization succeeds, so an unsuccessful attempt cannot leave a
> bio-based retry with request-based operations.
> 
> Reported-by: syzbot+5307e3bcacec2ce4c2f0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5307e3bcacec2ce4c2f0
> Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
> ---
> Changes in v2:
> - Resend as plain text after the previous mail client reformatted the diff.
> 
>  drivers/md/dm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 1881d86..2f3f1ec 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -2606,13 +2606,17 @@ int dm_setup_md_queue(struct mapped_device
> *md, struct dm_table *t)

Note ^^^^^^^^^

The patch is accepted, but your mailing software mangled the patch (see 
the split line above), so I had to type it manually. Please, fix your 
mailing software.

Mikulas

>  	WARN_ON_ONCE(type == DM_TYPE_NONE);
> 
> +	/* A failed setup may have left the queue initialized or the disk dead. */
> +	if (md->tag_set || test_bit(GD_DEAD, &md->disk->state))
> +		return -ENODEV;
> +
>  	if (type == DM_TYPE_REQUEST_BASED) {
> -		md->disk->fops = &dm_rq_blk_dops;
>  		r = dm_mq_init_request_queue(md, t);
>  		if (r) {
>  			DMERR("Cannot initialize queue for request-based dm mapped device");
>  			return r;
>  		}
> +		md->disk->fops = &dm_rq_blk_dops;
>  	}
> 
>  	r = dm_calculate_queue_limits(t, &limits);
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> 

