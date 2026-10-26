Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030450;
	b=Guu1B+iu3EYY9sxUilxMehLk20MX/UrDNTRaOhzan3xJLysb5Yr6qIRItd6R/Z+EaOra
	 uCZZoqzJBL2BKdpcntqUen1IH3ebky1rSVT83vRFLn28uAiLzzaWvbyBszKOde/3MkT2y
	 s/79i0vrBTgsowPspny1JtRctCc54SxflLyX5o/40pq2rQWfcW9IA6+pIa+gsIyrjyV5V
	 +hJq7oQnEZ9JNK+kLhxeAREYoGexwy4A/XhRKn5JWONd7oqM74C8592Rl+TSPb72Ounky
	 AgJJGZ7bOKztZ5QkZ6jjG2K7KoP2enR4wqQmgANN4qs3frZu/jChVmSKL2ThWouhwyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030450;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gdGEMgfJnyh5c7TJH0CYOcTTMHllOethu7h0lyRTWF4=;
	b=TzVzQ620VNNcVEoKKY/Q0KOmyf8WmeJRrPVAYl1FLQjH8+qB0I4UrYMcLQ2bouSJWzu9
	 XxHuPYKqwYeIIg2dXW679YhW4x5H+yQYG9naPZGJAkTjT8B36aGWExZ0cooMsWqPMo6me
	 HI4PLjxSaAR/FkrKjP4UVifieqXIXMOgFI0yaD2xKfrs6ysRMNJ3oWDbS8WRIUmCSV74h
	 EuKH1PraTzeusxzWVMMaTIUPBMp338P43vdR3UaCAqfVV21Qs88ohWkTvIn6VFs1kQ4LP
	 Rl9OwkCtAu+Lj0by1MB1MLqvD0H0g94H6otr2R7SNWWMnyuBIAPGBZIg7vExWPXLfoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UsVKaysC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WUOZccjz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA675606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA675606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UsVKaysC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WUOZccjz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793030449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gdGEMgfJnyh5c7TJH0CYOcTTMHllOethu7h0lyRTWF4=;
	b=UsVKaysCdLs6OznSchfeC/Hl2MyYhWz2Yx9VREVKqdPi2M0FzI06tAWRbKrqB7b5v4Rdun
	VTGqFhX59Bv5aGamHeLAr8+mHOAetNdAFvwhbqO9RqFfiUGGZRIw7sA50ajZ8OBw9Sv7Xa
	xxo+YZgXGDmtGTrdb0Cgl2x+AwDbpHM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-MiZr5KZJM6GHXZn2IHNKtg-1; Mon, 26 Oct 2026 12:00:44 -0400
X-MC-Unique: MiZr5KZJM6GHXZn2IHNKtg-1
X-Mimecast-MFC-AGG-ID: MiZr5KZJM6GHXZn2IHNKtg_1793030443
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c415561aaso2087250f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793030443; x=1793635243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gdGEMgfJnyh5c7TJH0CYOcTTMHllOethu7h0lyRTWF4=;
        b=WUOZccjzipFzglhUftqLKG/IfPJAtSiC5FZ/1zMchw5twZsgZ58ikqnJs/LtGfa6ZM
         O31j/0pVWuP47Baa6Au6UXH2cTaNaANxh0Q257Tf6W7j1rWxMU/iJQsPKMh6pZyjx+vR
         kd2b0SEsa5AuOrWcYc4UttFKCaJGnffjS5zljty9IW259Av0H1rlfNBIEx80Fe+07+N7
         WBhVyEn7tWtv11zPvHd8siSkddLp9IvsU5UNE4QLjfwl6GMn0A9UTHBKZmWpGx6vRFW1
         wLxPTtR9Iyb4+nhOVwlN2c+Onn2TIFPDF3Ibj046I+BOogPxyNu4WgpQmG/iOcEebeHz
         h4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030443; x=1793635243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdGEMgfJnyh5c7TJH0CYOcTTMHllOethu7h0lyRTWF4=;
        b=v5//TP0OvrI1laYfPzrrseCFA0flXI54Nfl5mVS/srdGqzL5fP8qxYwbfZpq75mESX
         eaW8L8y6KMVnuvPuJqon552d6nLUz1UgqIWGsQO2nIrmLm6bSTjEFcRm00jAKAZL6IpB
         F6DQVDs/yNC6Z5RyTJ8Y15KNGQk50KeKolJ552Nt1FWKwvxS6/quQdqXDX0K99CwrsIC
         4pQDxQs8Szj0wWgWOWxyISS8MqJXCSPBjrWDmmG0BRC90YcGStPIzWVYa+P6MpZvbN+a
         UHtGLEHC2IOT83sVSmABxPbm/1YXxT5dAirkE8jHl4rqaflHHGnQhEp1/LHm3fWhBPN+
         MBvw==
X-Gm-Message-State: AFq9FYJ6rA15KV+F33FpM4/Yf6TvRMRmb0ebY8ebEKbJx8NzopMExFHl
	HaNXYn2T0NbPHHOa0Cmv6H/Ldq2yQnd5QJwWX4XX7kV+fDFfm7c9oCJslXBQrDfD15MxJnTq3nW
	j/k0DLkLwFRe6f6bG7tgyjTnkwusH4H9MJ3dSsi8ceQMaCGWfAN5jvOw3M18vZqaDSSxK2FOm0u
	K+czfSxp2AnXV9Cjv0yh+C7RggOZDfTT181jxUydPf+00=
X-Gm-Gg: AYBFou0e2uWrkSL7lddbSegIrIVambwJH+9Joq7nr+cQgntxmp6rHqOvgmvApg3nQAa
	KyM+5bKYyoAPqCoqPR5RJnamm9mLQwydonaKjgvKx1fezLnawFz7YX+M+iLQDi7eesCV3w5WHOW
	aA1L+7Py4gAkBZPmLggB3fURLWqYWm0lV2cI7nrMdPOP4eHFoO3vFQwiLPCK95UQlZbo/GX3rZb
	Pk08aze27yhEkrM5n3Zl6CcBUHdtWhU4rXGxmsZvE+q31NMo9BQ+c1avqPBJMuZiQTBeJYI9Pah
	3gBuLcr/iABiBFtcGE9daCGlOlb5L9Hi8Dhr/uKDpXB4WAmLuIMl1+0SLv4Ftk6crCQ=
X-Received: by 2002:a05:6000:160d:b0:48e:35d4:55b5 with SMTP id ffacd0b85a97d-48e545bcbe7mr1461316f8f.52.1793030442462;
        Mon, 26 Oct 2026 09:00:42 -0700 (PDT)
X-Received: by 2002:a05:6000:160d:b0:48e:35d4:55b5 with SMTP id ffacd0b85a97d-48e545bcbe7mr1461218f8f.52.1793030441486;
        Mon, 26 Oct 2026 09:00:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm17511497f8f.21.2026.10.26.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:00:40 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:00:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, Ruben Hakobyan <hruben@meta.com>,
	David Hildenbrand <david@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] virtio_balloon: submit reported pages as individual
 buffers
Message-ID: <20261026120022-mutt-send-email-mst@kernel.org>
References: <ad6a530f49c4a0e182112a73789e31b5e91f3bb7.1793026707.git.mst@redhat.com>
 <6668d51dbda117d05d2eddd47db6ad69baab8b0c.1793026707.git.mst@redhat.com>
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
In-Reply-To: <6668d51dbda117d05d2eddd47db6ad69baab8b0c.1793026707.git.mst@redhat.com>

On Mon, Oct 26, 2026 at 11:09:59AM -0400, Michael S. Tsirkin wrote:
> The virtio_balloon driver reports a scatter-gather list of free pages
> to the VMM so it may discard unused pages.
> 
> For an arm64 kernel with 64 KiB pages, the default reporting and
> allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> report contains a sufficient number of large entries, we will end up
> with a descriptor chain that represents over 4 GiB of memory. This
> violates virtio spec, which says:
> 	Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
> 
> Specifically, submitting $2^{32}$ or more breaks Rust-VMM.
> 
> Submit each reported page as a separate virtqueue buffer instead of one
> buffer with an sg list of all pages.  This also avoids indirect
> descriptor allocation (kmalloc in the reporting path).
> 
> To avoid multiple buffers causing interrupt storms, keep callbacks
> disabled while we wait for an event.
> 
> Note: if the virtqueue is broken, wait_event on
> virtqueue_get_buf hangs.  This is a pre-existing issue:
> the old single-buffer code had the same hang.
> 
> Reported-by: Ruben Hakobyan <hruben@meta.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

brown paperbag post,forgot to commit.

> ---
> 
> Lightly tested. Ruben, could you pls help test?
> 
>  drivers/virtio/virtio_balloon.c | 48 ++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index f6c2dff33f8a..363519fa890d 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -202,25 +202,47 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
>  	struct virtio_balloon *vb =
>  		container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
>  	struct virtqueue *vq = vb->reporting_vq;
> -	unsigned int unused, err;
> +	unsigned int i, err = 0;
>  
>  	/* We should always be able to add these buffers to an empty queue. */
> -	err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT);
> +	for (i = 0; i < nents; i++) {
> +		struct scatterlist one;
>  
> -	/*
> -	 * In the extremely unlikely case that something has occurred and we
> -	 * are able to trigger an error we will simply display a warning
> -	 * and exit without actually processing the pages.
> -	 */
> -	if (WARN_ON_ONCE(err))
> -		return err;
> +		sg_init_table(&one, 1);
> +		sg_set_page(&one, sg_page(&sg[i]), sg[i].length,
> +			    sg[i].offset);
> +		err = virtqueue_add_inbuf(vq, &one, 1, &sg[i], GFP_NOWAIT);
>  
> -	virtqueue_kick(vq);
> +		/*
> +		 * In the extremely unlikely case that something has occurred
> +		 * and we are able to trigger an error we will simply display
> +		 * a warning and exit without actually processing the pages.
> +		 */
> +		if (WARN_ON_ONCE(err)) {
> +			nents = i;
> +			break;
> +		}
> +	}
>  
> -	/* When host has read buffer, this completes via balloon_ack */
> -	wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
> +	if (nents) {
> +		virtqueue_kick(vq);
>  
> -	return 0;
> +		/* When host has read buffer, this completes via balloon_ack.
> +		 * We report pages as individual buffers, so arm the callback
> +		 * to only interrupt once all the queued buffers have been
> +		 * used: otherwise we would get one interrupt per page.
> +		 */
> +		for (i = 0; i < nents; i++) {
> +			unsigned int unused;
> +
> +			virtqueue_enable_cb_delayed_max(vq);
> +			wait_event(vb->acked,
> +				   virtqueue_get_buf(vq, &unused));
> +			virtqueue_disable_cb(vq);
> +		}
> +	}
> +
> +	return err;
>  }
>  
>  static void set_page_pfns(struct virtio_balloon *vb,
> -- 
> MST
> 

