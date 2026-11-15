Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730962;
	b=zwxkfk8FlSxoqvjG/6F535T8Vzr/bApAxXndTjpIjMoRPSdvcnN6ejApnvDiBgZILanL
	 Ehm2kOJedqmdnoG08U7xFQchomgZaasFc8EbnB2slCSHI4BSAFK6Uh/jW7Y2dVClTEpza
	 5c5LMs58HkzACbZ2TBz9lcthHORFrA1OGgQKt9L4vveapQNujn1xkouEO40SoXX4xC5fO
	 sQRHT0ZM5eauMfxOqH2+qCGbaAq/hIX2i2S0QWnDnufWngWw/nAHLNxnoGbFemZI0SaWY
	 edEvYUWGcQU/JG0jChj8eX2GKnzosxN9AtGBVMfxPyY7QR0ZAgRWXSmreF862grZ74A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730962;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hOqx9PI7nO87s05epf/KxKW2rSgtDSMLjv2nLVv2RsY=;
	b=sB07RPo7txdyUSe+EA9bL7miHTiYfb8SyH+vUJCJMQw0AkKjDtafFjfIsZZKIREm5F2p
	 uezZjD0jtlOLCuxcASVRRR7fcwzlLwFHCdPTRH/x51wIWuGfeXVED1GyUhUAdVh6MppDi
	 g1jLgU881RSOZzzyy/64KDh7tQjK+efOqyMxd0unKCAF3kA/R67Hdtp8NUy9LLazcEDWv
	 6T/BFYoltC++V/iIRkjd3vako2aUm1GQpNwd8W8+x/0jxRM1VVAJwYKZFrpTyjIAJJ5ri
	 l+HY/Fi+FfW9ACvytb0DF8Qf5txo4N74fwOfp+0YuVCCPi16cAbbdtzV36dU5HACsIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fzae79s4;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DmTM11z2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA98A606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA98A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fzae79s4;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DmTM11z2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794730960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hOqx9PI7nO87s05epf/KxKW2rSgtDSMLjv2nLVv2RsY=;
	b=fzae79s4r33XIm4X0Qplugnvzcx6gmPVHrx9mtrZBkRTm4nlRPUcw1+SPvXJg7RI2vN7db
	cMANMWjWd4+a8HcnjUfAdloBcKJBlC61C8d9w+Yj3H6YmqZPNcP33FoP1P7YrLhbM37cjL
	fv+ZjYa3kgtVouWIOS3xtRXdYH3jv8s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-R669S21hNp2jwKBBZ1kp6A-1; Sun, 15 Nov 2026 03:22:39 -0500
X-MC-Unique: R669S21hNp2jwKBBZ1kp6A-1
X-Mimecast-MFC-AGG-ID: R669S21hNp2jwKBBZ1kp6A_1794730958
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4916d47eeb5so2204555f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794730958; x=1795335758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOqx9PI7nO87s05epf/KxKW2rSgtDSMLjv2nLVv2RsY=;
        b=DmTM11z2mj0Ygyj+SNk4FmJDtfZr0mpv1PUS2jGNBIKf8NMHOQcQqCCVH78jJnYr8w
         BcLd6CjxdqglHGwJ5zLoZ2EH+AXT5DksN/YWmNfMWshEiGPfB5wbL3ur3RXMt+eak/bo
         AJU3htHY47nwfMp58dD7JeMtvLCU83xjPwW+zQGwNZUK53OG10JeUWhK4dqc4phQswdW
         Ar/lr9h7EaYwautyYFc1ZvinugH7pbRkEDJxsZ/bXqOBotJbEZcAGAiALRAhePW6TbLY
         iL0iS/8I5xz+qWtOxPYrgduXx37RHZ69MBAqu39Tu6g0e1g5xBYYkd11SclSGtv3Hsdb
         8IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794730958; x=1795335758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOqx9PI7nO87s05epf/KxKW2rSgtDSMLjv2nLVv2RsY=;
        b=n+xNNmRctsEZA634WSS4tQTirIFbf3cX58IKSDP4GAlBOq4IyXvcPzzkbxIesjPsYY
         VApJ2IXem762H+WNYiDqqe/mkfBwlo871s1lgVydhPtq0qjBtobLz3PY38bby2p5H6Ia
         dVESUqynyvSiSuXoDRFCj1Hpnp7XGQyIF1o5lbve3A89zroRaYtnN0npamr813svn7Uv
         1dlDUzhowCUWj5+I0Jhz/52206GCBhneTozX+pA3gUtMgK9YSzxUtyur+9xHggNEDPlu
         KA5orV3w21xoaYQZ4u98fqtRU0q4M6J/YxUNi6GidrHD5s16HtddJijMPhO9fGCuSvNo
         w//A==
X-Forwarded-Encrypted: i=1; AL+hErEV3YhVzqHw0uLuBn6se5FnDt4cV7mzfqo9sKuMun1YqKa+h4MA6G1ixGFP0bDVqksapU2YFKzKW9G+Kxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qYmzqvzsCovMxfLKA8um2688+Wjh9irxQpvYJ32MUuXoIEkoJ
	8r8fmEFD0fI1orwbZVqo/Tou5gisTwGH3e0nBs0sbNGRQA8yRGN6TMDgVvKn7WgdfFE5B8yYy+u
	PNr60ZJ83DAlKb0lVoZVV8TubuukVt4QFTHfhr+9Pw8ySbSiSqPmS3h1o0z9dAo6s8nkgHUAUPP
	DM69I=
X-Gm-Gg: AYBFou3x1hCLXc3AXvCfe9f/G3ekhi2VMooxNtCB3tCLVx9gQJu6jRRRY7wAhQE/miq
	DdsPcZAHTgrt9umSjYeCQHZb28WQDMdO8N9CnC92NN7TP8IsLz31hBTgkYNAvF+zgJrcg4Upyjf
	QJDykiRdygjN7pVGlStFL7CEqZuZ/S4+gt/8i/GCqlpSFNIhZWnYwhZuTwpb6Aw9NPQOsomhVaY
	4BTTGV7BmJz0XPYx4WkRpMMYJsKPtY9ICZCIQ1ZeVGLeqJ7l+qsdslH0mpkm/8ALWMFFw/XE7Tp
	FqB7Q+yJvvo/LdjRrAsQ5ERlacWQMjgpcwELiC18vwNWGtp4621/ksUiloW0yKOiULhVNCNm++B
	OFwVAJNl9zK+jbFmrkKmGYdAtlXOJIt1BIOyWWAjkLuXxBM01SEGWyg==
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr155906615e9.34.1794730958283;
        Sun, 15 Nov 2026 00:22:38 -0800 (PST)
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr155906215e9.34.1794730957813;
        Sun, 15 Nov 2026 00:22:37 -0800 (PST)
Received: from sgarzare-redhat ([193.207.75.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm297980195e9.15.2026.11.15.00.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:22:36 -0800 (PST)
Date: Sun, 15 Nov 2026 09:22:22 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] vsock/vmci: reject datagram binds in local network
 namespaces
Message-ID: <avlpwYZr4pSpunEl@sgarzare-redhat>
References: <20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com>

On Fri, Nov 13, 2026 at 06:04:40PM +0100, Sergio Lopez wrote:
>VMCI already rejects datagram sends from local network namespaces, but a
>datagram bind still creates a receive handle in VMCI's global port space.
>A VMCI sender outside the namespace can therefore deliver to the local
>socket. Its handle also prevents a global-namespace socket from binding
>the same port.
>
>Reject VMCI datagram binds in local namespaces. No namespace-local
>datagram transport exists, so EOPNOTSUPP reflects the available receive
>paths. The receive callback also rejects any local-mode socket as a
>defensive check.
>
>In a KASAN/lockdep QEMU guest, a reproducer observed cross-namespace
>delivery and the global port collision before the fix. After the fix,
>local bind returns EOPNOTSUPP, the global bind succeeds, and a global
>VMCI datagram still reaches the global socket.
>
>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>Cc: stable@vger.kernel.org
>Link: https://lore.kernel.org/all/sashiko-outbox-212907@kernel.org/
>Signed-off-by: Sergio Lopez <slp@redhat.com>
>---
> net/vmw_vsock/vmci_transport.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/net/vmw_vsock/vmci_transport.c 
>b/net/vmw_vsock/vmci_transport.c
>index 1f186e8f8364..282131544c42 100644
>--- a/net/vmw_vsock/vmci_transport.c
>+++ b/net/vmw_vsock/vmci_transport.c
>@@ -627,6 +627,8 @@ static int vmci_transport_recv_dgram_cb(void *data, struct vmci_datagram *dg)
> 	 * outside of the create and destruct socket functions.
> 	 */
> 	vsk = vsock_sk(sk);
>+	if (!vsock_net_mode_global(vsk))
>+		return VMCI_ERROR_NO_ACCESS;
> 	if (!vmci_transport_allow_dgram(vsk, dg->src.context))

Why duplicating the VMCI_ERROR_NO_ACCESS return? Can we just put them in 
OR ?

The rest LGTM, if you respin, maybe we should mention that also 
connect() and sendmsg() are affected since they call vsock_auto_bind().

@Bryan, @Vishnu PTAL.

Thanks,
Stefano

> 		return VMCI_ERROR_NO_ACCESS;
>
>@@ -1697,6 +1699,10 @@ static int vmci_transport_dgram_bind(struct vsock_sock *vsk,
> 	u32 flags;
> 	int err;
>
>+	/* VMCI handles are global and cannot serve local namespaces. */
>+	if (!vsock_net_mode_global(vsk))
>+		return -EOPNOTSUPP;
>+
> 	/* VMCI will select a resource ID for us if we provide
> 	 * VMCI_INVALID_ID.
> 	 */
>
>---
>base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
>change-id: 20261113-vsock-vmci-netns-isolation-7e46732dcd73
>
>Best regards,
>-- 
>Sergio Lopez <slp@redhat.com>
>

