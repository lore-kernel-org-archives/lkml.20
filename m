Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297526;
	b=bLIivBat0N+cXnwL1BxbP4uGFq6If5I4SKuPtFz/88LbWYQF505veY/Urw3+c0A5lGEC
	 T0jKnQqsvnnWcSNS9eYxWHGjVEtd4qVg4oIIDEgh9/iQM9Giu+cJfEEWGXPLplPWfLK7X
	 CD8Hu637lOR733W1w2yEGoqBV2XEXOZjQFgtGiuNrzEO1PXBJjhDXxFlRQXp9p0LgjV7P
	 pZV/LZPwOgZEUT9RX9fK892PYls3v53M56AgrwV0vktUeEwBjIBbvu8hsqMwytIPQAhjz
	 GDqMHgiUjHMpkjOGcXg02vdkDKFCKxvmE5urJquCNnwSKhyZMgK2pm/KQCtvDOz9bcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297526;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Scanned-By;
	bh=52GGOIPcBybueFQ3XkV7m5rJYQJjkP+ldIdwErNttcM=;
	b=SptOwmoAOs2svGworzHB31c3HDPEhHGtwyoO5Fxcagp2Uekop/BaJCc32MqpNyxptkx1
	 7NXnKPz70Ffwc0VkNUG7ROIS29gFXcPuczf22oP45JtG1tBjWOXPBuxwdCkjcW1/KmKc5
	 gIBtm2Ro/JELgyIRAjOY944wDGi/0DRXw20RgcB9jmBjhNbtx9ppwHUuQ0sI+r5Fqq3uk
	 hjNemFRYAhCjfJq/FhXfxOYn1fuDeS18pjA4RXhtTn8jb9PqVzwYMvYRB+O1e+LM0wysC
	 ymHoun3CHoBCyORVI+hg3Uzhb7cJIV8n3ye+ViOhP4KBZ5ROUupias6Ud3o5nMlDeuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CtnriEIb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C679E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CtnriEIb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793297524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=52GGOIPcBybueFQ3XkV7m5rJYQJjkP+ldIdwErNttcM=;
	b=CtnriEIbERGjQxc9+Xiq682kitPW3vmmM8I/mW4hc3bk3KBM8cZgT0cRX5F4LK70GmadPT
	MaVyiqFoA/xgrqbtDfre0g8z3iw1srdc6lBrzZK6dND8OPbmUNHBNsXulC8IajNcry9kHf
	N5ZAYvy835RzaDYiRgsXS6ub++FQIdo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-rgpI6PabN3e2MuKlyAY0EQ-1; Thu,
 29 Oct 2026 14:12:01 -0400
X-MC-Unique: rgpI6PabN3e2MuKlyAY0EQ-1
X-Mimecast-MFC-AGG-ID: rgpI6PabN3e2MuKlyAY0EQ_1793297520
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D3451956055;
	Thu, 29 Oct 2026 18:11:59 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 39D601803A40;
	Thu, 29 Oct 2026 18:11:58 +0000 (UTC)
Date: Thu, 29 Oct 2026 14:11:57 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: linux-block@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kwolf@redhat.com
Subject: Re: [PATCH 0/2] virtio_blk: add FUA write support
Message-ID: <20261029181157.GA1571175@shajnocz.csb>
References: <20261021055235.648957-1-afaria@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021055235.648957-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Wed, Oct 21, 2026 at 06:52:32AM +0100, Alberto Faria wrote:
> virtio-blk FUA write support has been added to the virtio spec [1]. This series
> implements that by adding the new request flag uapi definitions and
> corresponding virtio-blk support. It also enables vdpa_sim_blk to handle fua
> writes.
> 
> [1] https://lore.kernel.org/virtio-comment/20251112055113.62207-1-afaria@redhat.com/
> 
> Alberto Faria (2):
>   virtio_blk: add fua write support
>   vdpa_sim_blk: add support for FUA writes
> 
>  drivers/block/virtio_blk.c           | 15 +++++++++++++--
>  drivers/vdpa/vdpa_sim/vdpa_sim_blk.c |  4 +++-
>  include/uapi/linux/virtio_blk.h      | 13 +++++++++++--
>  3 files changed, 27 insertions(+), 5 deletions(-)
> 
> -- 
> 2.56.0

CCing maintainers according to `scripts/get_maintainers.pl -f drivers/block/virtio_blk.c` and Kevin Wolf (QEMU).

If this patch series is just now coming to your attention and you want
to take a quick look:
https://lore.kernel.org/linux-block/20261021055235.648957-1-afaria@redhat.com/

