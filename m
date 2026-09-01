Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BA382365
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250225; cv=none; b=KgZCTN8P+on2uOz91srgeC/iYTGi7JVEPDMkUog5OVr1pojGAhLss0jAEOwkxPAdXTtB1AIUmH48igQkitvm6s7Dn3AEeM6ppulaRtYciuGzOqKkoZcl4m9WRM57RNH3s7XmDo4DT+U2IxeUr58uZLlh5LI1lfzUzpA8CYHBMbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250225; c=relaxed/simple;
	bh=2OP2L7SzkBrg/QvLyKIZXfRlLBLWuoclJ+HmnVt54lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3TokRCF9Zflz2tALaTiSisKQ8GJj2fdVkSvc52fl5qA08xfoaEtR7OTc9GzobidMGrZtG0IjuVbUubkBy+ScK8hBQXuXVvHrw4M/hWMXdUpHbcau39WPIDFRwmmHPuIbBStn4qkGINM8YNKAdm+Mqx19F88drjjai8N84HUDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F4v5qIUL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rs4vuC+W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F4v5qIUL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rs4vuC+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788250222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6II7OJOvbSf1qn4a78SQvZqHlqlRqW3TztU7vrsw3A=;
	b=F4v5qIULJCjLCNpmupjdX+BOhp0TkaLuuFNRLmL1Z2aGhFSc0zlLJyGxa6ytdnG/rRY8E8
	wV6GpLwIc6mtaUM9WO+Y02oJLKsykuAWu0JC2U+fI5jw+kb2+KRgMtyBQpgZh4BU9whONW
	PGbh9K9HJdR5NqmQr8f3MQXL7Ce+/wY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-XJPUseyMMYmneAbgCAwmPQ-1; Tue, 01 Sept 2026 04:10:16 -0400
X-MC-Unique: XJPUseyMMYmneAbgCAwmPQ-1
X-Mimecast-MFC-AGG-ID: XJPUseyMMYmneAbgCAwmPQ_1788250215
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c25148e933eso346917166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788250215; x=1788855015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6II7OJOvbSf1qn4a78SQvZqHlqlRqW3TztU7vrsw3A=;
        b=rs4vuC+WJysZ94IxUMoCsMGnOM+jFIQfS/7LYTTZBvTUSMlNIBA0SlgLTx7IImTsZB
         aYVpLRsRCXuAOO93DCfnygsjtpoXv9A4TfhdeOGsoFwmUwUQyLVoYAgh9MmDBLc1K2mI
         253tRPtWYy8OIu8I+HngboIt+qwen0T4twuGqcOs2t4t7K6v6DALtf7LKe9W1iV8dh37
         fUzhrI+wkIAj5DofigHEUM+pjBxpFJ9mD3KG+6zb+gzRrBGpRgEicfjhXb/Ak88RclQF
         fw4HDNotIXJF9gjp22JRIM3Uz5pQfO86qeDqwkUz2Q7tNx4QcFRKTkyc2DtcaFTUuiSD
         oxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250215; x=1788855015;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6II7OJOvbSf1qn4a78SQvZqHlqlRqW3TztU7vrsw3A=;
        b=NKkKv0o9tmRP6jjEohk2mU81BKc/a2YGcagfpAwz8GuJ0bdXxUxaISzMx25F+sJpp7
         uEMx+cxtfKOpIoIP72JXpEQZlP3HlhaJlZCXyUzOinO8rFkTRyjPFHsEdRTvrB4PegfS
         DpDIgH6oFiCe5rnlUO8zTxghE6Kd2YJsOTcZxJG5G8GfkRTmQdzKclGsPYzW5xacTz0c
         loZ6rwT0T7oFRHBecmyYYqEBmBA5pbTa5qEkcDNb4roAp3ZDJxL/nmC+VjKcucercA89
         ME2DEGFI84Mdr6K7qHpUQpflYqA1/5klJuMuN3o9TNhXx+F1ONFNPfSkyoAV2P0upW2w
         6JJA==
X-Forwarded-Encrypted: i=1; AHgh+RolKUCHSbdqC+yE0rbCEqGDBQ/BnMKYLjsJ7AcqgJyRtI9zC4FIWtTKnBdPvhwK7a9MTl27xCu5ch/5Jaw=@vger.kernel.org
X-Gm-Message-State: AFuF++mKyGVK83WIGbOSiJo+hYX/6jwDmm/U/WcVn75+aIb9rYljYoGK
	nWtHA3clfKjgkrU1kH6xFtA3lMEa3z0rfJnruhJTlpiXt14wFytVNhF5bglmP/3pPHjGq2szkSs
	nhT2SpQcqpmcHOaTIOkSz7rsbpnRU4xUGjex479wH16h67DK4KHBcGPclcksV8qlXfEvk+7eZgw
	==
X-Gm-Gg: AR+sD11MG6FkB2i8AlVy/CeLtV7YKpy5/HgLMoBj/H/khyQ57esu8pS77DmC/c1kst2
	N8pEXPHMPL7JxmmQLqVkvRaKI8xaBWBhyWRRjyubdWg5LIev4YX91P8Jt/ez3gU41WsQ2qnFfxe
	J86cIaOU3aaAPqGpC+xjVFi0cSydSwEe0DDQWOz7Z9KcYOZWc2PrMwV3eDH/kbUnaBg76PGIMH5
	/psYsle0YIJ2o5SNGMAySmOR34hRhbAFXh/7sU8RbLFJnoG6toZou6I3Z6Kq0dC8T3J5yxTn9Nq
	IYDT2t5VAqqhYdhrG0lr6XBNc3YK9n4WgwbWtySZ54a3criJa/DcUJzG0LtCZ61AmPppOWaPDLi
	xmViCUdvf6CK9/97Q11jGHQ6R5y51PWVqARGJiqIC0ECTwoR2ppKJriv23TOUg/V1gHpLAFktyA
	==
X-Received: by 2002:a17:907:980e:b0:c20:f529:2d6a with SMTP id a640c23a62f3a-c255721317amr1968414166b.22.1788250215160;
        Tue, 01 Sep 2026 01:10:15 -0700 (PDT)
X-Received: by 2002:a05:600c:a012:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49cd81887aemr179602105e9.11.1788249844819;
        Tue, 01 Sep 2026 01:04:04 -0700 (PDT)
Received: from [192.168.188.103] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm49860305e9.1.2026.09.01.01.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:04:03 -0700 (PDT)
Message-ID: <e121d343-9a4a-4f93-86c1-c96dd37f1ae1@redhat.com>
Date: Tue, 1 Sep 2026 10:03:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 6/8] tcp: fix use-after-free in the lockless
 listener path
To: Hyunwoo Kim <imv4bel@gmail.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, ncardwell@google.com,
 dsahern@kernel.org, idosch@nvidia.com, kuniyu@google.com, horms@kernel.org,
 willemb@google.com, andrew+netdev@lunn.ch, kees@kernel.org,
 jiayuan.chen@linux.dev
Cc: kerneljasonxing@gmail.com, ij@kernel.org, martin.lau@kernel.org,
 shakeel.butt@linux.dev, matttbe@kernel.org, martineau@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260824033331.1084971-1-imv4bel@gmail.com>
 <20260824033331.1084971-7-imv4bel@gmail.com> <apaAskNL-IvdcR7h@v4bel>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <apaAskNL-IvdcR7h@v4bel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 9:37 AM, Hyunwoo Kim wrote:
> On Mon, Aug 24, 2026 at 12:32:50PM +0900, Hyunwoo Kim wrote:
>> tcp_v{4,6}_rcv() calls tcp_v{4,6}_do_rcv() without holding the socket
>> lock when sk->sk_state is TCP_LISTEN. Every other path into
>> tcp_v{4,6}_do_rcv() holds it.
>>
>> tcp_v{4,6}_do_rcv() and tcp_rcv_state_process() below it read
>> sk->sk_state again. A listener can leave TCP_LISTEN through
>> connect(AF_UNSPEC), and if that happens in between, the second read
>> returns a different state.
>>
>> tcp_rcv_established() or tcp_rcv_state_process() then runs without the
>> lock. If the second read returns TCP_SYN_SENT, the incoming SYN is
>> treated as a crossed SYN and reaches tcp_send_synack(). When the SYN skb
>> at the head of the retransmit queue is skb_cloned(), that function
>> replaces it with a copy and releases the original with
>> tcp_rtx_queue_unlink_and_free().
>>
>> The original is the skb that a thread on another CPU is transmitting
>> right now in __tcp_transmit_skb(). skb_cloned() is true because the
>> clone made for that transmit is still alive. Once the transmit returns,
>> tcp_update_skb_after_send() calls list_move_tail() on the skb's
>> tcp_tsorted_anchor.
>>
>> In short:
>>
>>   socket(AF_INET) -> bind() -> listen()   // the socket that changes state
>>   socket(AF_INET) -> bind() -> listen()   // the peer
>>
>>   Several threads keep opening new sockets and connecting to the first
>>   socket's address.
>>
>>   Another thread repeats this on the first socket:
>>     connect(AF_UNSPEC)      // TCP_LISTEN -> TCP_CLOSE
>>     connect(peer address)   // TCP_CLOSE -> TCP_SYN_SENT
>>                             // another CPU still sees a listener, handles
>>                             // one of those SYNs without the lock and
>>                             // releases the SYN skb that this connect()
>>                             // is transmitting
>>                             // -> use-after-free
>>     connect(AF_UNSPEC)
>>     listen()                // TCP_LISTEN again
>>
>> KASAN log:
>>
>>   BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report+0x14/0x140
>>   Read of size 8 at addr ffff88800a5d1460 by task poc/125
>>   ...
>>   Call Trace:
>>    __list_del_entry_valid_or_report+0x14/0x140
>>    tcp_update_skb_after_send+0x62/0x170
>>    __tcp_transmit_skb+0xe33/0x1e40
>>    tcp_connect+0x1b67/0x2490
>>    tcp_v4_connect+0x998/0xab0
>>    __inet_stream_connect+0x22c/0x700
>>    inet_stream_connect+0x48/0x70
>>    __sys_connect+0x101/0x130
>>   ...
>>   Allocated by task 125:
>>    __alloc_skb+0xd1/0x370
>>    tcp_stream_alloc_skb+0x2d/0x2b0
>>    tcp_connect+0x72d/0x2490
>>    tcp_v4_connect+0x998/0xab0
>>    __inet_stream_connect+0x22c/0x700
>>    inet_stream_connect+0x48/0x70
>>    __sys_connect+0x101/0x130
>>   ...
>>   The buggy address belongs to the object at ffff88800a5d1400
>>    which belongs to the cache skbuff_fclone_cache of size 472
>>
>> Instead of taking the lock, keep the lockless path from reading
>> sk->sk_state again to decide how to process the packet. Move the
>> TCP_LISTEN handling out of tcp_rcv_state_process() into
>> tcp_rcv_listen_state_process(), and let the TCP_LISTEN branch of
>> tcp_v{4,6}_rcv() call a new tcp_v{4,6}_rcv_listen(). Listener processing
>> does not change. The TCP_LISTEN arm of tcp_v{4,6}_do_rcv() is left
>> alone, because a socket can finish listen() after the state check and a
>> backlogged skb is then processed there.
>>
>> Fixes: e994b2f0fb92 ("tcp: do not lock listener to process SYN packets")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> 
> Looking at this further, unhashing the listener and then calling
> synchronize_net() lets the disconnect path handle it. MPTCP needs a fix
> too, though, because it closes and reuses the first subflow directly
> without going through tcp_disconnect().

This looks like a more palatable approach: this patch in the current
format looked way too invasive to me.

> This also closes the trigger path for patches 4, 5 and 8. I would still
> keep those, since they add no work to the fast path and they remove the
> root cause itself. Their changelogs would have to change though.

I'm unsure accepting new connections is not fast-path: the connection
per second rate is a relevant metric for a sever, even if the additional
cleanup is possibly not visible in most benchmarks.

Still I would avoid additional unneeded patches.

Thanks,

Paolo

