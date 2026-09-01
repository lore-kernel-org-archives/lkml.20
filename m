Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CBE476CD6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253496; cv=none; b=OHpSXQIwz8sNvM0nwj8egwGyXGfhNxVWOxshUMc20y8rnGSjGJeRmSaJFtyZ/3tb0vTWbqzUMerr4q8NeOKjCRgMlU6Bq884Zxq5HO/zWhU28wmttZjKlmat9MWYpeuKQiQ1eKidmcSFHSazTNvlozfWe0mx1Jiqtko4H8W2pfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253496; c=relaxed/simple;
	bh=aR05XSKkL3b3y4Zjj9QVy6cakyTIpzNdOUr+meAo6/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4qz6mlFpmvqXDeLeC7mU5s1k1+zlt2skvLrocvaQgMBIbRE2I+FdY71P0NvAGhdQfXUveUy8K6HR1DxhfOHOk/JzbsJgXNHpmohiM4J9Hwx6Q9H5WvCUZOf1bqmxQuV6a6Q9HDSfIny8cXZtVy2Mjebh5P33OkjC8SfPCY1y+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbZNgYUe; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbZNgYUe"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39266382df6so3837412a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253492; x=1788858292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQqAf7khM3cl6pZ04M6I5XPDq13U9kFDsHdlwrXDb4E=;
        b=PbZNgYUempJC4/ILvHlMOky/mwSoKjG9/WFNPjOLKQahDPcICQvzwd0DrOPzO4Xodi
         ZREzYYxAdtOMYIxvq2a4riLZ2fhw3Rmd+UtBPxHo3y3WqiwSpQ7h3TDDMdbYkECoGR+2
         jwIBJ2cXFh1cU30qhOOJTz7t1Id+n2jpPH2WrcfeflHH27pZ0aY/4D6ONhGnFK5RK7jO
         GM/n0rnT8SimPnWIxv9VHL1kGc7gB9nqtKvoF/7s7SPuguxpGnuYPIWh82F+Ol06Xycp
         zMIxqMNZ65YxycVR79GlJDoVVScSjCpR6RvRfnffm/z9wWXl7BW+6bDrwqQ6Sqtoztsz
         5WwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253492; x=1788858292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQqAf7khM3cl6pZ04M6I5XPDq13U9kFDsHdlwrXDb4E=;
        b=VqoJs8RWO+EK0169sfoAY7kmjiWTJSX27fhCkf/ywEVyxhPThA9KD9daxecM6PtPNF
         4iorJVPH0VlRcfR/yqm5YdqmZau14I1s1tu3kTyzxJMrXHnS22hak9ERehtHSfpjMvII
         QYAluRDw5qvETBanrwLKBXfl/FeTN3fOHRUWaiAKcRd4oG/mS4SyOCRb2TBconBNOP3A
         xZUFFmJXDiViLoWIIyXBODH1iGVZzr8x+OZ6In2UcDCeV6OgJzn7nM46H989cE3uRYsc
         aZwuKht15KtdL5N+DAOP0xh3Wga7CQ+6Xq9cD57dmes30BWCIOvPm95J2f04aYl3iQHZ
         Yyzw==
X-Forwarded-Encrypted: i=1; AKwUvBzRc271SXu+dLvACf6Xv3TuDs+FDRP8e93kULlGFgVNB8h1FlZqg/mal3ki0xtHJsKTXgOewzaXrgScyeM=@vger.kernel.org
X-Gm-Message-State: AFuF++nSGy/iqknd3YeNWPAkNhxfqBBkOashAeCMEqYmVWu3HoRkLihi
	lj3GLRfKjMhoCe3tItJ6BzLPemOCjS0iNaYiQ1K6k+aIhh+l3xV7OjCm
X-Gm-Gg: AYBFou0GWuGjY3lM5S+04qtGMF+Zg1lVs5Dqjdb0m54tfeCV0809JJS0loquly+sK4n
	VF8s3TP6yQp4UAyRu7weGoJmfnFY1Bhbum5oP2X6gEELeNEhO2+2Q6b+m9CHytCHiJbCuRcd2Sa
	T2W3MVyxjAj92NkMJBJHEtsLeGP4PrL9LG4VDYcs37czY6XBTQzgL/7gXGrzg4p5a71YGsggnAb
	suRLwTavArNQoIt4XIpT2UMndaD7oNUSlH2X9LiAsw+fhAfscGYeQOwj0ilKiuX5THaKNgb51QL
	MRyfPNSeoPxMKA+WCRwgyOODj/eatK1JZXkHjWqaT0iyaCpNf89GFeN7wqM4RB4Au1nZA7N3kgy
	u7fRU2tsRPunlQ03B6QBvHtifWD8lE1zB3HIeYxgHl6BD9FWf2E6FWIfxWpbTgwJME98O4Oj8DT
	TtVg8Ol0rU1yMYYDvwRGPMoZak+47QcoVAi9Q60+sJ8KNCoIczLP0kFlfb/c8GTxstvfxFei1Ca
	Pk5u3Xu
X-Received: by 2002:a17:90b:224d:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39907b17a40mr9025465a91.8.1788253492086;
        Tue, 01 Sep 2026 02:04:52 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d6d29de3sm6463240a91.2.2026.09.01.02.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:04:51 -0700 (PDT)
Date: Tue, 1 Sep 2026 18:04:45 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, ncardwell@google.com, dsahern@kernel.org,
	idosch@nvidia.com, kuniyu@google.com, horms@kernel.org,
	willemb@google.com, andrew+netdev@lunn.ch, kees@kernel.org,
	jiayuan.chen@linux.dev
Cc: kerneljasonxing@gmail.com, ij@kernel.org, martin.lau@kernel.org,
	shakeel.butt@linux.dev, matttbe@kernel.org, martineau@kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH net v2 6/8] tcp: fix use-after-free in the lockless
 listener path
Message-ID: <apaVLS6Srsa7SQhJ@v4bel>
References: <20260824033331.1084971-1-imv4bel@gmail.com>
 <20260824033331.1084971-7-imv4bel@gmail.com>
 <apaAskNL-IvdcR7h@v4bel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apaAskNL-IvdcR7h@v4bel>

On Tue, Sep 01, 2026 at 04:37:22PM +0900, Hyunwoo Kim wrote:
> On Mon, Aug 24, 2026 at 12:32:50PM +0900, Hyunwoo Kim wrote:
> > tcp_v{4,6}_rcv() calls tcp_v{4,6}_do_rcv() without holding the socket
> > lock when sk->sk_state is TCP_LISTEN. Every other path into
> > tcp_v{4,6}_do_rcv() holds it.
> > 
> > tcp_v{4,6}_do_rcv() and tcp_rcv_state_process() below it read
> > sk->sk_state again. A listener can leave TCP_LISTEN through
> > connect(AF_UNSPEC), and if that happens in between, the second read
> > returns a different state.
> > 
> > tcp_rcv_established() or tcp_rcv_state_process() then runs without the
> > lock. If the second read returns TCP_SYN_SENT, the incoming SYN is
> > treated as a crossed SYN and reaches tcp_send_synack(). When the SYN skb
> > at the head of the retransmit queue is skb_cloned(), that function
> > replaces it with a copy and releases the original with
> > tcp_rtx_queue_unlink_and_free().
> > 
> > The original is the skb that a thread on another CPU is transmitting
> > right now in __tcp_transmit_skb(). skb_cloned() is true because the
> > clone made for that transmit is still alive. Once the transmit returns,
> > tcp_update_skb_after_send() calls list_move_tail() on the skb's
> > tcp_tsorted_anchor.
> > 
> > In short:
> > 
> >   socket(AF_INET) -> bind() -> listen()   // the socket that changes state
> >   socket(AF_INET) -> bind() -> listen()   // the peer
> > 
> >   Several threads keep opening new sockets and connecting to the first
> >   socket's address.
> > 
> >   Another thread repeats this on the first socket:
> >     connect(AF_UNSPEC)      // TCP_LISTEN -> TCP_CLOSE
> >     connect(peer address)   // TCP_CLOSE -> TCP_SYN_SENT
> >                             // another CPU still sees a listener, handles
> >                             // one of those SYNs without the lock and
> >                             // releases the SYN skb that this connect()
> >                             // is transmitting
> >                             // -> use-after-free
> >     connect(AF_UNSPEC)
> >     listen()                // TCP_LISTEN again
> > 
> > KASAN log:
> > 
> >   BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report+0x14/0x140
> >   Read of size 8 at addr ffff88800a5d1460 by task poc/125
> >   ...
> >   Call Trace:
> >    __list_del_entry_valid_or_report+0x14/0x140
> >    tcp_update_skb_after_send+0x62/0x170
> >    __tcp_transmit_skb+0xe33/0x1e40
> >    tcp_connect+0x1b67/0x2490
> >    tcp_v4_connect+0x998/0xab0
> >    __inet_stream_connect+0x22c/0x700
> >    inet_stream_connect+0x48/0x70
> >    __sys_connect+0x101/0x130
> >   ...
> >   Allocated by task 125:
> >    __alloc_skb+0xd1/0x370
> >    tcp_stream_alloc_skb+0x2d/0x2b0
> >    tcp_connect+0x72d/0x2490
> >    tcp_v4_connect+0x998/0xab0
> >    __inet_stream_connect+0x22c/0x700
> >    inet_stream_connect+0x48/0x70
> >    __sys_connect+0x101/0x130
> >   ...
> >   The buggy address belongs to the object at ffff88800a5d1400
> >    which belongs to the cache skbuff_fclone_cache of size 472
> > 
> > Instead of taking the lock, keep the lockless path from reading
> > sk->sk_state again to decide how to process the packet. Move the
> > TCP_LISTEN handling out of tcp_rcv_state_process() into
> > tcp_rcv_listen_state_process(), and let the TCP_LISTEN branch of
> > tcp_v{4,6}_rcv() call a new tcp_v{4,6}_rcv_listen(). Listener processing
> > does not change. The TCP_LISTEN arm of tcp_v{4,6}_do_rcv() is left
> > alone, because a socket can finish listen() after the state check and a
> > backlogged skb is then processed there.
> > 
> > Fixes: e994b2f0fb92 ("tcp: do not lock listener to process SYN packets")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> 
> Looking at this further, unhashing the listener and then calling
> synchronize_net() lets the disconnect path handle it. MPTCP needs a fix
> too, though, because it closes and reuses the first subflow directly
> without going through tcp_disconnect().

...and tcp_abort() needs a fix too.

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index b4237d0e994d6f..ce8e76052fe376 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -5139,6 +5139,9 @@ int tcp_abort(struct sock *sk, int err)

        if (sk->sk_state == TCP_LISTEN) {
                tcp_set_state(sk, TCP_CLOSE);
+               /* TCP BPF iterators run with RCU read-side protection. */
+               if (!has_current_bpf_ctx())
+                       synchronize_net();
                inet_csk_listen_stop(sk);
        }

> 
> This also closes the trigger path for patches 4, 5 and 8. I would still
> keep those, since they add no work to the fast path and they remove the
> root cause itself. Their changelogs would have to change though.
> 
> 
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index b4237d0e994d6f..ae6ab3b22beb53 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -3373,6 +3373,8 @@ int tcp_disconnect(struct sock *sk, int flags)
> 
>  	/* ABORT function of RFC793 */
>  	if (old_state == TCP_LISTEN) {
> +		/* Wait for lockless listener receive paths to finish. */
> +		synchronize_net();
>  		inet_csk_listen_stop(sk);
>  	} else if (unlikely(tp->repair)) {
>  		WRITE_ONCE(sk->sk_err, ECONNABORTED);
> diff --git a/net/mptcp/protocol.c b/net/mptcp/protocol.c
> index b474d03620a75d..e41a5e1bf8dbf3 100644
> --- a/net/mptcp/protocol.c
> +++ b/net/mptcp/protocol.c
> @@ -3432,7 +3432,7 @@ static __poll_t mptcp_check_readable(struct sock *sk)
>  	return mptcp_epollin_ready(sk) ? EPOLLIN | EPOLLRDNORM : 0;
>  }
> 
> -static void mptcp_check_listen_stop(struct sock *sk)
> +static void mptcp_check_listen_stop(struct sock *sk, bool sync_net)
>  {
>  	struct sock *ssk;
> 
> @@ -3446,6 +3446,9 @@ static void mptcp_check_listen_stop(struct sock *sk)
> 
>  	lock_sock_nested(ssk, SINGLE_DEPTH_NESTING);
>  	tcp_set_state(ssk, TCP_CLOSE);
> +	if (sync_net)
> +		/* Wait for lockless listener receive paths to finish. */
> +		synchronize_net();
>  	mptcp_subflow_queue_clean(sk, ssk);
>  	inet_csk_listen_stop(ssk);
>  	mptcp_event_pm_listener(ssk, MPTCP_EVENT_LISTENER_CLOSED);
> @@ -3462,7 +3465,7 @@ bool __mptcp_close(struct sock *sk, long timeout)
>  	WRITE_ONCE(sk->sk_shutdown, SHUTDOWN_MASK);
> 
>  	if ((1 << sk->sk_state) & (TCPF_LISTEN | TCPF_CLOSE)) {
> -		mptcp_check_listen_stop(sk);
> +		mptcp_check_listen_stop(sk, false);
>  		mptcp_set_state(sk, TCP_CLOSE);
>  		goto cleanup;
>  	}
> @@ -3593,7 +3596,7 @@ static int mptcp_disconnect(struct sock *sk, int flags)
>  	if (msk->fastopening)
>  		return -EBUSY;
> 
> -	mptcp_check_listen_stop(sk);
> +	mptcp_check_listen_stop(sk, true);
>  	mptcp_set_state(sk, TCP_CLOSE);
> 
>  	mptcp_stop_rtx_timer(sk);
> 
> 
> Best regards,
> Hyunwoo Kim
