Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6834C47607E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454594; cv=none; b=mNv/f6ECru07L/yo2i7DP5DwcuQdGvisVbllAlEpoFbp8KXls2qcqYNTN1+aeFnGfNhU0BisZ8UwEIyX6fu0KGAe5l+l7aGeZGKNUFGlPcDteBJr+qwjLvPZD1rPjNtXk7WR9YTiEDk8k9Jr1q5mCFxHlYSfSbNdFxkgyBve7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454594; c=relaxed/simple;
	bh=U28lcf97/CjhFUZfOOidZjKnIealHaMgfzCpUp3Xteo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlau0W1d9TzufzodIm99AzFCqrQ1Po35DD90u+sKFQverrvS/nmymPFJ8camRAgW7k3tILKmpXSVfgOvTD1nNDKafRj5f8jDemYrJl7DUCz6+1wuyiqkINVksv8LSze/FUEEOMC8Eb90kT6f/ZK7HxEbAfMu0F6WqY4fOTVt/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FceKbm4n; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CNYSTWqR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FceKbm4n";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CNYSTWqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791454591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SP1f9UNmtX0LiVyYf6TXLIff3crRsFq13nTHi/mc7ek=;
	b=FceKbm4nqdS5hdRcB3sdCgez0T55T5kR4OgdcK47E+xL7zEtHYmKiy2IiXcsjTjwzykYFy
	sqWQZ2ZFuQTCxjM6sG6ylGId00I3owiRog1H8u44pOWdL8MrCyauEXmNbantO1JN6t/1Bh
	ri534Z60/lcTTZpH4ejbhlFaKv1xIeg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-tl2-fr5FNeWbm5RnV_ptuQ-1; Thu, 08 Oct 2026 06:16:30 -0400
X-MC-Unique: tl2-fr5FNeWbm5RnV_ptuQ-1
X-Mimecast-MFC-AGG-ID: tl2-fr5FNeWbm5RnV_ptuQ_1791454589
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a17fe1f66aso18765905e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791454589; x=1792059389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SP1f9UNmtX0LiVyYf6TXLIff3crRsFq13nTHi/mc7ek=;
        b=CNYSTWqRtI89N19CDwGDuwrlHmyMNd9dhnGNRpd2bx073GHh7YBifA83CRJExn4GQR
         wsK/TPuitMXQY6I4VvpTNFmdzQ2IVkADQSelzdN2gpBzsdejzirzSa7h+JdhGb2STbNk
         jr3wSlwv4HWxEbXoq24kL16/Exumtj0D9eEMoZd61eQYjNNwaHl4U3DQzXR+CQ2JCEbm
         g7LHB/9TaL2eg6elZh1/CUDrJiLCHjMvJ6c+cEjzOhRjuXgjuuICNyMfOzj4cVFGrfEH
         fREHFzFovSo7y0tdLgi+ONnOw7jCN1s7jWnN6KMz7JVGtB4Q6T6bCpf2N6l+5Gpfk/ED
         dtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454589; x=1792059389;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP1f9UNmtX0LiVyYf6TXLIff3crRsFq13nTHi/mc7ek=;
        b=t/HtQvLjbfblb3rxxicTrwIdHc1DDB79GfyfNhlVEuktMQQYkOyWfliMe7i6xyVUtK
         3sGs0E6wasJYhOPMHIFzrCFxDL5/KnEwZrSxB1vttmhAtnxfJGqPYfT86Ad5i+oQkXhg
         swuJFjrLEbkHA+rj4H1MXpj3YONondYI0FVsNdRFvtjg+x9aWRNEkUE+pGcW3LAQyQkK
         wQtTmP4SzPbjt10EdFtsyVWklaPo1YP6+5xLNRAthq5zVga7Gm0OYhUeGOPhWmKmMVtv
         BqS5h91vkj/iIHxqPIavbjjnbBHjUizbKo3wZBRL0H7J3ba19ViIA5KmMEW2I3COAHEy
         O7qg==
X-Forwarded-Encrypted: i=1; AKwUvBw1pP+xVj0sP07Z92JCwuh7tSxtD9msF8fffi8uLX22fJGIhd0MepCTbHnTZhklJC/UELnOqJjG2+7xKgs=@vger.kernel.org
X-Gm-Message-State: AFuF++lTDd5RYVX6YBi0K+i7eMjiX9RRoIYv+7ptP9rTZiFnzboffyhC
	EdljpAGUHLA5nJa+H3xeDvq2PhzPF3u2JSp6dNMrZGo3S0Rdfi9wxrBp8ymqlyIHtuYeE7sQ5wr
	K1yA9xD5fcLh19+CF7JJhgyG2k4OBP4bL9tVQ+d9LxK61bZ0Au2LEMmdsxxglTU68euxHXNwZIP
	Z6
X-Gm-Gg: AYBFou3AY070bct5mjaY+bIkf9ySdV1LeUDUOpWB+t5ONmobnyvgMAzLF++AuOYfaEk
	wg+OP3XZhL2HQWwNvEX+HidZPIOwJs2SnRQ3m6HwLVxnDSkekSDuGAGYAEm2IbKUO8Afu8INAjy
	7V3BL711T6+VMEtplep9wJfC88GpnU+GKcP+488emc1tzSMEi94IC6vqm32T5Wf3qqe4nCDn1hF
	iBoN3irV6JWhI1wt5afwrEK4jHAX9SJ1gXVqpLgU30hjWPFs7mUk0NIe3v88SON/l0REQsP/K4J
	g2TBqgaRsL+kR1GltqaTB77V7S3M9PlQtlOLeXIZoMfZTZkyMIsrcf+42SgAy4mWfLZ+NURLA9p
	B9EC1tzKAk/+gyW+6qAVMrIHs4LuG
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a18045995fmr80697435e9.28.1791454588744;
        Thu, 08 Oct 2026 03:16:28 -0700 (PDT)
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a18045995fmr80696665e9.28.1791454588042;
        Thu, 08 Oct 2026 03:16:28 -0700 (PDT)
Received: from sgarzare-redhat (90-181-163-241.rco.o2.cz. [90.181.163.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843d1ea0sm60309235e9.8.2026.10.08.03.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:16:27 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:16:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Ilia Gavrilov <Ilia.Gavrilov@infotecs.ru>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	George Zhang <georgezhang@vmware.com>, Dmitry Torokhov <dtor@vmware.com>, Andy King <acking@vmware.com>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: Re: [PATCH net] vsock: Fix memory leak in
 vmci_transport_recv_dgram_cb()
Message-ID: <asds3RsjgMTh8OFj@sgarzare-redhat>
References: <20261007143716.1984702-1-Ilia.Gavrilov@infotecs.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261007143716.1984702-1-Ilia.Gavrilov@infotecs.ru>

On Wed, Oct 07, 2026 at 02:37:47PM +0000, Ilia Gavrilov wrote:
>During the closure of a datagram socket, the vmci_transport_recv_dgram_cb()
>function may be called, which will add the packets
>to the socket's backlog; then, after the receive queue is cleared,
>the __release_sock() function will move the packet back from the socket's
>backlog to the receive queue, which will lead to a memory leak.
>
>sock_close
>  __sock_release
>    __vsock_release
>      // take ownership by user-space
>      lock_sock_nested
>      sock_set_flag(sk, SOCK_DEAD)
>      vmci_transport_release
>                                      vmci_dispatch_dgs
>                                        vmci_datagram_invoke_guest_handler
>                                          vmci_transport_recv_dgram_cb
>                                            sk_receive_skb
>                                              if (!sock_owned_by_user(sk))
>                                                  [...]
>                                         (!)  else if sk_add_backlog()
>                                                  [...]
>  (!) skb_queue_purge(&sk->sk_receive_queue)
>
>      release_sock
>        __release_sock
>          // move all packets from the backlog
>          // to the receive queue
>   (!)    sk_backlog_rcv
>            vsock_queue_rcv_skb
>            [...]
>              __sock_queue_rcv_skb
>                if (!sock_flag(sk, SOCK_DEAD))
>                  // Since the socket is "dead", the function will not
>                  // be called
>                  sk->sk_data_ready(sk)
>        sock_release_ownership(sk);
>        sock_put
>
>Add a receive queue cleanup in the socket destructor to fix this.
>
>syzkaller report:
>
>unreferenced object 0xffff8880117bfb80 (size 240):
>  comm "irq/56-vmw_vmci", pid 205, jiffies 4295064448 (age 73.992s)
>  hex dump (first 32 bytes):
>    78 dc 26 1e 80 88 ff ff 78 dc 26 1e 80 88 ff ff  x.&.....x.&.....
>    00 00 00 00 00 00 00 00 c0 da 26 1e 80 88 ff ff  ..........&.....
>  backtrace:
>    [<ffffffff82be8d97>] __alloc_skb+0x287/0x330 net/core/skbuff.c:505
>    [<ffffffffa114bcbd>] vmci_transport_recv_dgram_cb+0xbd/0x210 [vmw_vsock_vmci_transport]
>    [<ffffffffa05072c6>] vmci_datagram_invoke_guest_handler+0x366/0x450 [vmw_vmci]
>    [<ffffffffa050ad75>] vmci_dispatch_dgs+0x235/0x490 [vmw_vmci]
>    [<ffffffffa050b025>] vmci_interrupt+0x55/0x290 [vmw_vmci]
>    [<ffffffff8137ad2b>] irq_thread_fn+0x8b/0x1a0 kernel/irq/manage.c:1205
>    [<ffffffff8137c7ae>] irq_thread+0x28e/0x530 kernel/irq/manage.c:1314
>    [<ffffffff81253dd6>] kthread+0x2e6/0x3a0 kernel/kthread.c:376
>    [<ffffffff81004392>] ret_from_fork+0x22/0x30 arch/x86/entry/entry_64.S:295
>
>Found by InfoTeCS on behalf of Linux Verification Center
>(linuxtesting.org) with Syzkaller.
>
>Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
>Signed-off-by: Ilia Gavrilov <Ilia.Gavrilov@infotecs.ru>
>---
> net/vmw_vsock/af_vsock.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 9b71479a2b29..fbafd882a12c 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1048,6 +1048,7 @@ static void vsock_sk_destruct(struct sock *sk)
> {
> 	struct vsock_sock *vsk = vsock_sk(sk);
>

nit: maybe a comment here referring to vmci datagram could be nice to 
have if you send a v2. In any case, also this version is fine to me:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>+	__skb_queue_purge(&sk->sk_receive_queue);
> 	/* Flush MSG_ZEROCOPY leftovers. */
> 	__skb_queue_purge(&sk->sk_error_queue);
>
>-- 
>2.47.3
>

