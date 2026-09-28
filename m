Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAB23EAAD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607662; cv=none; b=pVZ7SK4MiaDA/tqhLQ08QUKrXqS/pXdL736dxHwD92i9S5ZaAUurqPwkZOizj+ndSNHQEMgXDU9xV2e9uH4tLWHQa5tf2fGVmY2HO3sqqepS4k0RnuRxSFWg7Vi7g6+WUoLS5bQGsab84Dp5CamrrWR1cSDEZ/mZBuXQVpPMvKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607662; c=relaxed/simple;
	bh=nGJsllp8L7sqYAKIQ2/Hr/XmIXmSD+YY1xB0lRGMVQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qe31ZX+JUx4z5nlEcd3NNlJlza1v4k5oU7Xa4Cl9F5e0hJkt5b4sgSYwh0QSZDV3uf+53CkoO8AfnedA7CtohXjBEH8A8Q0+b+sMVgZtul5D9VBaM8PQOgT/LnCzd/vsf+N0ZevLKy4XWs2DQ+tT5p8ZPczWzKtX0M/Kla51OJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SkkpiHM2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mfQtQHKj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SkkpiHM2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mfQtQHKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790607659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vKOeRv5jdbU0/NaEiGEDb5uvk7fcRI56Q4PTcfyI8cI=;
	b=SkkpiHM21cgnl7MQUfi5AmUBz+j+TATww0n0vZsFPfioLmHPRA8iGMADLrKN/7UvlyzQxL
	Pw+Xp6xigHiPn0Zio5jj3J2tojL+1dDSHuz1Tgxp68gOGlIqGbXhqlEUs4hNZ0SpbEQNJz
	4rsEOe8kBSvYDrM4IFFTi0Zt2LlGKok=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-7qmDrxsWPNW5-8RtS2mMCA-1; Mon, 28 Sep 2026 11:00:52 -0400
X-MC-Unique: 7qmDrxsWPNW5-8RtS2mMCA-1
X-Mimecast-MFC-AGG-ID: 7qmDrxsWPNW5-8RtS2mMCA_1790607651
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e635a6002so38217325e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790607651; x=1791212451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vKOeRv5jdbU0/NaEiGEDb5uvk7fcRI56Q4PTcfyI8cI=;
        b=mfQtQHKjb6ErSZEeeZuQrJIvPVixHTpQ3i2rOJZsgWKJy/PxRvjZqRjA3nsZy3Hd8l
         1noZ6Nn+D320Y3RmH08aznu+6WmNIWLaH5L2pLUMm6HM/YLKSEgv0lqPjF+wKZgKCaGO
         MfhGhqSH8IGolDES8VcjzqASbgRv08ITUj7s8OBb9XD3N7u/cv1paHQfJx+WYfrFYc1r
         3INiRbms+iFJ3kVDRIDOmiThd7vaXBE9HgRrscvg9Dw9ltLRG8gqYNrK8mb7o7qrqamC
         QE9o/sGfGKuIirWPjDbKv9PtdKyoPmbw/ju2trZnCwOGJF/O/dJJBSzP7S6qHzUHxtQo
         nr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607651; x=1791212451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKOeRv5jdbU0/NaEiGEDb5uvk7fcRI56Q4PTcfyI8cI=;
        b=DN8wRLLmC2TSTovBtH5d9m29ZLFyxd9B4tP1GnL4X7MWUF0nvP0WWxSJ72yk1z3Q4Z
         JusmDFwOUc0Urut1RyFIkLWBaqPwOAs/Q4jWN5G4sge4ZYXFU4qkSJfvTFCclWRE5rZQ
         yf7DTWRq5dAzbxdovjXbYAoq/njFEPorb9psv+U6zZ6JVyoLhhvWFmS7yHMfVoAwZobb
         5y4sB86IHoZK3R5nCveMZ4OM5yOMAFW8OkjFObJs11m7eGl0HPscMbKGY+fB/BJpTPBy
         ZseVMfY6jQoOwcjoT6IYNbzLjo5LjIzkwEo9zJ5dgaNZA55V0w63QdzdQHPRD1Gd2nvz
         jtUQ==
X-Forwarded-Encrypted: i=1; AKwUvByn633hlWUjvf2T/FPn0VzlwZHl0CkZYs8DnrGAdl4U+rpXgRlcK5ISFUXdKxlRbRZeItUowNK4/x1GPso=@vger.kernel.org
X-Gm-Message-State: AFuF++n+DEh7DpMnrXkuw2Mi15wLhG2EYfhyCrnIXbUgSFCi9mAFmpFD
	KQ+DYgNTON1amKiy25cz5L+bQvOanBRi9OU2U7kB05EuHxZ+MlsZj60s/Jnp5xxKEekmlQ8tIT+
	9bFwTYvNSkyJHKqmsiK+bZNTg9nRnEYj4ekGgVIRYwY6fC6hxtvStaT4LX5QDRMTyBkY3jAdVGg
	==
X-Gm-Gg: AYBFou06ov/Fw6Ll/H28yL9dQD9HeJW6NO9456p2/ult58xXzq81FLXLrApTl7uHIJ4
	y63Pw07qq+NwhVZ8+Tiswa7pfJts43UXiGW5jQlH3aIMmXzzcp6k8GBjxqQSbxkSuyeVuUKjSrC
	AZjEU438TFBFTg+pVPYP7skwBWy3XaQ/H0flhl3Y6ZbRXvpt/qyqOA8iPW5lJEZH+r9C9YNx9V3
	YnIh4hO4I6OKMQV8qYV9OfJ0s1Di8eZSyN8uqTNpBFQgckQhZbY+R9Rfd0jZqGAUEKHJfF0iIwr
	f3ScA1u+m0Q/VQllQqRPzzxzoj51ErXuxiqy0CIOuptXgNnQTsyJfghhEKdN5oQtw9a7KJCULPl
	FxsU=
X-Received: by 2002:a05:600c:46c6:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-49ffe88e87dmr94650105e9.15.1790607651056;
        Mon, 28 Sep 2026 08:00:51 -0700 (PDT)
X-Received: by 2002:a05:600c:46c6:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-49ffe88e87dmr94649615e9.15.1790607650593;
        Mon, 28 Sep 2026 08:00:50 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.146.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm151770215e9.15.2026.09.28.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:00:49 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:00:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, bobbyeshleman@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] vsock/test: cover receive queue hints
Message-ID: <arqBCldsgfzf1nUW@sgarzare-redhat>
References: <20260923184008.153541-1-devnexen@gmail.com>
 <20260923184008.153541-3-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923184008.153541-3-devnexen@gmail.com>

On Wed, Sep 23, 2026 at 07:40:08PM +0100, David Carlier wrote:
> Add io_uring receive tests checking IORING_CQE_F_SOCK_NONEMPTY across a
> partial receive, draining while the peer stays connected, EOF, a
> nonblocking receive on an empty queue, a zero-length request, and a
> multishot receive with provided buffers.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  tools/testing/vsock/util.c             |   9 +
>  tools/testing/vsock/util.h             |   1 +
>  tools/testing/vsock/vsock_uring_test.c | 391 +++++++++++++++++++++++++
>  3 files changed, 401 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

