Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975962;
	b=uKvrKXVy/Kn/TD8KVYj5R6rNyBUjRoeAeTFyZ3vcA7+eNMKnYs6JyX32PLjNqKpRbOGG
	 21SfNF6v+RLn2D0vKnBjUYpHsXth79T2djTkHvfVgmSO5/x4R3Q90QkGLc0pcuDFD0jH8
	 5WnD7Twf6Ege99XObd8Ilv4fQlKjmS8wzxbiW6vD6pSAAAfZK/cFyw0cjzBfJh5CLvov+
	 RpN+EwBAr+qY5oQd3ILn11Ev1LNd4P/S7c6dsmCELfpDHBECn6rXLurklE9M0yP7tRAtL
	 aguZkRyBDEjPL6FuChkgNaHLNApUKzuiCC0Etrfu40IJGCPFl23rr7g7SjXKDh4VOYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975962;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8NLwtf7QYxfGCOsBeRSPlOa0BaKLAPm2183RpOle/E0=;
	b=xUcFGJWJ6th/bWXyoXIR6lsJMnrCSRZBFxoHbi94VD4t3gSho4D9uv7rr71My+wfrI7W
	 uTLBNuqDbuw1fnNENcPk70Ojx1+ne4/v4m0c9rnk7rx98fqhKW6U9ULKs6fiyrj+5favI
	 foi2WEE1952mpdlGSbV2RaKDICys8mPclAFO2pfIpS84tIJ/dbOPMc2/AW9wxBfCG59ol
	 +y5RfPQlUT3LFoV555OkYR7vZ/rpip5FExAnlMZbMuMRJQPqW1U91muNQeb8II+n3f8cn
	 +ykvwKNt6IUxrOMvEeCGuA8UqU61TYVWgbnc7o2qCaEnijhCaVD9Ke5letHxDVJgUJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZHJEv0gv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="fAM6/AAk";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028B2606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZHJEv0gv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fAM6/AAk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793975960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8NLwtf7QYxfGCOsBeRSPlOa0BaKLAPm2183RpOle/E0=;
	b=ZHJEv0gvhofCKl461vRZfyoKikUtoEcNqowg0jdxpQTd9zOlJqt5iI+82M4R0x5n5kPUmf
	xFyLQr6xxdwjm1CBsxGgbpppGPVewLrRv1JxFWsb8evK7/7TiccMoICZ6JPbPkWww+cIYn
	AO+GXjq8iiKe6phlB0yYcP75OCYuyf4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-pp4LL30BP96z5BdElPoCtw-1; Fri, 06 Nov 2026 09:39:19 -0500
X-MC-Unique: pp4LL30BP96z5BdElPoCtw-1
X-Mimecast-MFC-AGG-ID: pp4LL30BP96z5BdElPoCtw_1793975958
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso766845f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793975958; x=1794580758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8NLwtf7QYxfGCOsBeRSPlOa0BaKLAPm2183RpOle/E0=;
        b=fAM6/AAkZexi9ShT4PKSlVPSFrda+suPwTL5oZMjGDK2hGpPJqgPhlNRy+RYpqjkWf
         2JMG4IMJl2M34C7L+thWdoURU0kuca/K0IMjZjFfojQT/a6pFbyX1N9e3RnoJBusoB7Z
         4taG5137kJT944e02AtliUekeg5HaJ35thqj769B8rtEN48zv+io8HuVV4XNq/K2CQhE
         YP2VXsnMhq4HWxMdmwfFEkKQLJcWGXoktxmXYwTQLbsfHInpUhQmv2P/Lse9pSAfgr7A
         04i2/9jlTNS6LJlIdG1S9VvJMWEUTLA5VDg0VDhUs6UrhtJNJiRaA+t+SiiOfd9gPS22
         lzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975958; x=1794580758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NLwtf7QYxfGCOsBeRSPlOa0BaKLAPm2183RpOle/E0=;
        b=0wDMmvGmVJF9xuid7Opo40EIYylibOoSHSePQh7entRkU20hvNg8knO2+xPE3za7k8
         HKtOWJ9C6BcpI18weWwdffEv9Ba8LluGfeoamDJeiq6EmTEjQLQB0g78CHpDzAKHAXSf
         a1L/QaRVEj5iqnYwrYePTMLEh23oDPaYjEbQBSFElXPMUZhPKlxyZK8S9UolQ0sdeLhu
         5KnAKG6y1xVuV/AfHJt9G4ByWEfyE3/cZat+qY0yf9oDjjYj0UKcz421e2DhgHWiciEa
         rmSzEuIYt0/3Zmhr0np24p1+tvt+yMiMHUaLIYdAYkKIhxke1pWd9t0UPHSVGFOQIQyD
         hyFg==
X-Forwarded-Encrypted: i=1; AL+hErG/zuuboq45+mDiyKa6BhdQw1zN99VJgV67Dp4gR27gG17SlvJAnNc4P9+IAjcN753N96sJoH1x553XFzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b45JPGzdOmrRqUW12a9cRJWoMllqdcnseJ1brk7QTLaCNdLtM
	g9TjCGKWEDG7LZQA9tqqXjPkxVkZjCMjVPKpRxi0A/AsrAO+p18Jm2MVlnqs22/FoPJnWRTxvF2
	mGlpGOlydt6FDkI8uvLXH3I5zwZu8EAQ1WXXEVVrjwIXhxbeVbf9vjrHbOjp8JpbPmQ==
X-Gm-Gg: AYBFou3tXgxaO86Ww+XQnqYJtV9oj+kmILNotSkOEmEfvcEK0cdnwCveZnW85YHp5Fj
	0CJTn3xbzGhhk73wOsydedKPVec40FBqRU3PNgv/ROYqRJl9BQJxUVIQj1jXk6wOXXqdPX9LRCm
	pTSrg+cJYlzuveAzInJWEZcWgYsaddfjWQ87epaLLLsDsWcMY/z64mryBokXeN8rHfJ4qpHnlw7
	9vsVyjdb2fdj0mxphDv91ZzgTlvQJUTFUrs6Qgd5SYTHNp2UdYbH3gM5gvPXCwuklBVlXDqbg3W
	5zScMm2VcMToTIGICoDm6Gk8HYkyRPzQdkYqW4MsRCwifIehCG8erFEoMIKCfeSsqlV6grNNL92
	9KHaEWq/Cm+4Jh0430hrgp4x9+kj3BsYeFDMxAYxTH/9Mm59M8IW0
X-Received: by 2002:a05:6000:26cc:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-4927817451amr5363050f8f.57.1793975958189;
        Fri, 06 Nov 2026 06:39:18 -0800 (PST)
X-Received: by 2002:a05:6000:26cc:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-4927817451amr5363018f8f.57.1793975957758;
        Fri, 06 Nov 2026 06:39:17 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63ad7sm4518709f8f.15.2026.11.06.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:39:15 -0800 (PST)
Date: Fri, 6 Nov 2026 15:39:10 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Simon Horman <horms@kernel.org>, Luigi Leonardi <leonardi@redhat.com>, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>, linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] hv_sock: Report no unread data before a channel is
 available
Message-ID: <au3k0TggFXTn6usw@sgarzare-redhat>
References: <20261106123920.162131-1-parri.andrea@gmail.com>
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
In-Reply-To: <20261106123920.162131-1-parri.andrea@gmail.com>

On Fri, Nov 06, 2026 at 01:39:18PM +0100, Andrea Parri wrote:
>The Hyper-V transport is assigned before the asynchronous VMBus channel
>offer completes.  Its zero-initialized hvsock therefore has a NULL chan
>until hvs_open_connection() associates the channel with the socket.
>
>SIOCINQ can query the assigned transport while the socket is connecting,
>or after connect() fails once the transport has been assigned.  Unlike
>poll(), that path does not check stream_is_active() before calling the
>transport's stream_has_data callback.  hvs_stream_has_data() then 
>passes
>the NULL channel to hvs_channel_readable_payload(), and any user in the
>guest can trigger an oops:
>
>  BUG: kernel NULL pointer dereference, address: 0000000000000178
>  RIP: 0010:hvs_stream_has_data+0x23/0x120
>  Call Trace:
>   <TASK>
>   ? vsock_ioctl+0x74/0xf0
>   sock_do_ioctl+0x42/0xf0
>   sock_ioctl+0x27d/0x310
>   do_vfs_ioctl+0x700/0x810
>   __x64_sys_ioctl+0x7d/0xf0
>
>Return zero unread bytes when no channel is available, before accessing
>the receive state or ring.  Leave the existing channel-backed receive
>handling unchanged.
>
>The oops was reproduced on an unmodified v7.4-rc1 kernel in a WSL2
>guest with a small user-space program, available on request.  With this
>patch, the program reports zero unread bytes and the kernel logs nothing.
>Other vsock_test cases were not run, as most of them need a host-side
>peer.
>
>AI assistance was used to identify the issue and develop the fix.
>
>Fixes: f7c722659275 ("vsock: Add support for SIOCINQ ioctl")
>Cc: stable@vger.kernel.org
>Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
>---
>An alternative is to check stream_is_active() in vsock_do_ioctl(), as
>vsock_poll() does.  That would also change SIOCINQ on VMCI sockets that
>are not connected yet, from -ENOENT to 0.  I kept this fix in hv_sock to
>limit it to the crash, and can send the generic check separately for
>net-next.

Yeah, I was going to suggest the same, but I agree that for net this is 
a better and self contained fix:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>The reproducer is a new vsock_test case.  I have not posted it, as
>Documentation/process/security-bugs.rst asks for reproducers of bugs
>found with AI assistance.  I can send it privately, and will post it
>once this fix is merged.

Yes please, post it upstream when merged.

Thanks,
Stefano

