Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128683;
	b=0vhVsSeqxGQmSzwC7C+7WSFsO9MNbfnzFZMj+MttyUyeEQwOQmle1dP045dSShogwBFg
	 HHCwLmPqR0Z95MTx+L3aPp8z61CH1RZjbHr+uY43Ty/oHR0Y05lyYp6ai8+/xf8Io06GT
	 GZmCHxn6XRPQwkDfD3srxoQOs3XN6BWuLkLGeuD6AK7H9AVmuoYsO7ZuqFSn6h/BUNG3b
	 z/EGGMHwzodzYOLOgwc/OmvTGSRlRRftiDJjs3TSusZPZ1TpOZEZJG/1wcwgV8tT1zMIQ
	 iwhhvC+trJUlIp3JCbcS+nrpOBUH8poetOO/rdVIEXVi4FjvlBX9qQhobxBBuMo46IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128683;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Scanned-By;
	bh=7/No7ycCs2MnT2orES72SqWWMGh3qVK3ShQRxwctkpA=;
	b=n2LLFPnBy3RiOI+FCqsUNjTN2LKkSm2/xtqW4U3wh0sYRqXNIyv/PVM0l/Yjz1rSoXdH
	 p94YfNDsXiTnmiCnHH93ap54aMpSUOXS99F0iFyGzq18lph0yWUhPvaqZul0GjGbSNoc1
	 BOyX5bD59YJv+dwbF6EV2Noxh3of70Unyw0sNeUjvvn8WUaQmGygyaJqnVXYBuotph2vK
	 PuZUMkBiKaCneTe8rQC9Wvcok/GqpGNjc4VCaDyz/CS6NIUmfoxOu30VlXCH1aassxyuN
	 6GtjEDHOTJWlLTY+xg1zLRrpwuyTT7UshnvpSwkxcUxzOJoqunnV29L5ZhvK1+PBWjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVqxTBoK;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580A606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B580A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVqxTBoK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793128681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7/No7ycCs2MnT2orES72SqWWMGh3qVK3ShQRxwctkpA=;
	b=JVqxTBoKkPwlYWpZo9ykkkadoSPPmfoZ8h9G/9TnDFDk9Vy94Qf7BDiNW0pa0PH/57e6Vb
	XNsXpd31kE+4dyFNilPbS6Z0DKkjbWDEK3imP2MjHflwmm2ryLLkOysqFvAYaxZFQop9JU
	XB6pL20INXBRNYatD0Rk2qRqZWWgqt8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-uA8oikN1OKqB5a_uqW4b4A-1; Tue,
 27 Oct 2026 15:18:00 -0400
X-MC-Unique: uA8oikN1OKqB5a_uqW4b4A-1
X-Mimecast-MFC-AGG-ID: uA8oikN1OKqB5a_uqW4b4A_1793128679
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 910C51800619;
	Tue, 27 Oct 2026 19:17:58 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 253971803A48;
	Tue, 27 Oct 2026 19:17:57 +0000 (UTC)
Date: Tue, 27 Oct 2026 15:17:56 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: shao.mingyin@zte.com.cn
Cc: mst@redhat.com, jasowangio@gmail.com, virtualization@lists.linux.dev,
	pbonzini@redhat.com, eperezma@redhat.com, hch@lst.de,
	dlemoal@kernel.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio-blk: Fix zone append sector reporting in batched
 completion
Message-ID: <20261027191756.GB933537@shajnocz.csb>
References: <202610261955196384aSLGuy3_0MiTvlYXVdiC@zte.com.cn>
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
In-Reply-To: <202610261955196384aSLGuy3_0MiTvlYXVdiC@zte.com.cn>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Mon, Oct 26, 2026 at 07:55:19PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> For zone append, the block layer copies req->__sector back into the
> bio in blk_zone_append_update_request_bio(), so the driver must update
> req->__sector with the sector reported by the device.
> virtblk_request_done() does that, but the batched completion path used
> by virtblk_poll() only unmaps and cleans up the requests before calling
> blk_mq_end_request_batch().
> 
> A zone append completed through polling therefore keeps the sector that
> was assigned at submission time, and the file system or application sees
> the wrong LBA for the written data.
> 
> Move the sector update into a helper and call it from both completion
> paths.
> 
> Fixes: 95bfec41bd3d ("virtio-blk: add support for zoned block devices")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

