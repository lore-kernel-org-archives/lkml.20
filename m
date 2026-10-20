Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529824;
	b=BBm76OAMsx3abtDy9TWSPIthhw7/uOcHzdxJ6DfVyjXd3/FU0Ul9Uo94XnXZvBXsEsI5
	 VI5Lo1kQxnJdwC5NRm6r9mSdAXTYCFrAdKuNGsvy7IKM5t9G5QvfuUIdlVnPY25lrbI0E
	 UeYFL75bUqiTwzdMqfegf0VEZi8rQH3c/Zqzvt7DmQPiq/0VIWYV+k/fpAjkduFyWi6y0
	 2lzn82jD36HqfE2i1U4WcaP+fzJQRQ+hOGRjUPdJnN2UL6TicaUS0cD3WV77/oypU40RK
	 yNvZTysuNijmFdnZaFmEivTDHPtxqnCLtm6IYPXRlzQjM5WN7JLCNbRgVPqSkK17VyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529824;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cv9aRKSX0/tOF0YOH867TlpVtpIDhyHmrDapDoadVQc=;
	b=Khuw4sidJNMEc4WEUNL8QkEgss/hwGy4JCJgB8Zw6mWONZJwjW8/wxuH284wuvH+VvMz
	 BdnCgsydUtIGkoKxtu6JWDa8TWxQE/1iuWa/aerLDp2tRVfWlXRZthEzOltBqCkEiSl9B
	 tnrECtdvmHpI4Dl7WQgskg9p+SmgHorzZLcMgQ6LZ88kgYC2JVqk3uFsRtmd5DIH4F7hw
	 0K+uoXNlcXpsKooYgqHKLdIbhjwfn+0ljZ2KnCikx7z+Nrs47odel5PyACvcjFHVwm9PZ
	 GU4T7RBKq1NdkUiruyXTZ2H9vRh3OAoyB2wQlYqKlrhd4/9uISj2Lv6R4KDDsQGB9oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XBZ4qXyd;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KUl36tZ1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F38606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F38606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XBZ4qXyd;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KUl36tZ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792529823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cv9aRKSX0/tOF0YOH867TlpVtpIDhyHmrDapDoadVQc=;
	b=XBZ4qXyd6Mir8haawWSMzFaSPVSkCQ+6dAxWSJiR4LbTD7Vfjv8FDsaXzlyhBGNwRkVu/X
	APODIbMVYalJwHcWWElGkJaTTtq0IhGcUumd7Xfq3g74VGIKS3D6fwNHmrs2EBgq/nAsTM
	Unrkad0ohfcHrpb+OX0w4r0wyKQD1P8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-_yqacTjMOZinINnrNTHYFA-1; Tue, 20 Oct 2026 20:57:02 +0000
X-MC-Unique: _yqacTjMOZinINnrNTHYFA-1
X-Mimecast-MFC-AGG-ID: _yqacTjMOZinINnrNTHYFA_1792529821
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso320685e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792529821; x=1793134621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cv9aRKSX0/tOF0YOH867TlpVtpIDhyHmrDapDoadVQc=;
        b=KUl36tZ1h5Sc3z5N4MHGz7nzDWCkrN69mfUe6bDalDm2J/eFjYstEOl+ZNjgDbnqpi
         GKQK4jNSDYREm9K8/QHdrV6OJklAdOJNwxb1h0bR9AWRPzDrJyPAPIZ1LovHyJ4rdAU9
         v3WRicQRVTJ6FRris8jHx6p10+Q6GsWQG+pW3hs8QZ4jv6PsonpN452ogV4CwUlvx04K
         SHjn7Ha3XQSYgxhrlZE+p9bM2iWLMfdYc9CWRXfCuybhQsmGIFWM2j9vitA72T9uknbS
         XdUc92eGCc6ZJmFbz9rBnek5YZIV4/oXpWh9k4ghO7Lw72M5q+j+YZpL054XE/i3PliH
         s2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529821; x=1793134621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cv9aRKSX0/tOF0YOH867TlpVtpIDhyHmrDapDoadVQc=;
        b=QJ1FgcuKLaPHdMsspltJhuGBibrKYXCzpuT42uaEFvk8MJm52J1Rb7uEM5/06rXk4O
         rUmClAICidmqBC1KpDKtAbfr7RSlh5xrciUQHGnfttw1umYlhIHpvuH3jpTvS4tkm8tF
         K6NGD83nycfUnQFlY8aBVVxa+BgLp3RsHNO080r802+KEuhps7C/j4z8z44PqOL4wOfP
         l8Qt+X65f61Skoraf8SGGQz4l1wI/OUVHAbkucAXMo2VlO53joOspbe3EfoiIbBOjh83
         82TLtPG0psXqypOJ9Nu6SD4LVT3iMIPstDFiF7bAF8L7KfcPXbCoK80KfTbn0jAy9Yao
         gj5w==
X-Gm-Message-State: AFq9FYIjdZ/b/n/JsI5I19FfHEyEMexMbHmeBtw1znrZdivppB0Pv3JR
	iY6C2pVTgJ5pI3tYHzJLcldxsof8nDIdSftVeWJFVJNJa4S4UONYaVzgU2IEMnXETEuWO0HZTqL
	m7OBIUryeyLgyUeF3h1aP4ggcoQRhuGG3dqBbgbjpbUE3Jur3KZ7qQb/h/cXGm5M/vQ==
X-Gm-Gg: AYBFou11rT/1Lm+UEf04mv3etWTNbdxpVOFPUego/Rj5D2RU1T87+Q+Lrhizqnrr58j
	oy4iAs5wjd/jO1HdaqtMNmJPDwO9BAZBCg23ds9JxL1BfGMION+CkgJzUv4dpjdZTxBnCQE27J5
	Bicz9c714U5XYw/LygJfaauGYMveeT7XUAAqGimz9b+g8wxX22xPrElAujvuPrPxkiunUZmI1hd
	b1NpRuqiR5YPHmaqvAx2GvssqmlWzMAuXTm1NOeRowh8CiXs+ZIY9sufxBI0FJXB1HSUaLo7L90
	5HJQov2lWSVTj83iJ4tIf1ybKpMl5apeavgoHekF9jB7bJs45cjiobKr4eXYVM/EcSuClQ==
X-Received: by 2002:a05:600c:888c:b0:4a1:eccb:53eb with SMTP id 5b1f17b1804b1-4a1eccb55d9mr101082485e9.6.1792529820651;
        Tue, 20 Oct 2026 13:57:00 -0700 (PDT)
X-Received: by 2002:a05:600c:888c:b0:4a1:eccb:53eb with SMTP id 5b1f17b1804b1-4a1eccb55d9mr101082315e9.6.1792529820216;
        Tue, 20 Oct 2026 13:57:00 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm865375f8f.1.2026.10.20.13.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:56:59 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:56:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v3 6/8] net: add a sysctl to opt out of virtio net
 hdr checksum validation
Message-ID: <20261020165610-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.187d58ff2bce5@gmail.com>

On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > +/*
> > + * Protects changes to virtio_net_hdr_csum_check_disabled_key and each
> > + * net->core.sysctl_virtio_net_hdr_csum_check. Readers don't use a lock.
> 
> it appears that they take the mutex_lock below

Some of them? But
virtio_net_hdr_csum_check_disabled doesn't, that's the point, right?

