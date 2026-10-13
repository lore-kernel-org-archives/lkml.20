Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6D3BB669
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879246; cv=none; b=Xud9OcXL23CTSs6CYSfPWRHuv1nXphUdwUxlPwMXUo59KYgVnMlDr+CJkUhVrJTyjTBzJTlm75Q3QazYnGaDpDdBd1wgmaaGVfcGFpDdiEBVNDHxYgA1Fk3EHvjc/iRgFA1DkCzSfBoiU+llHZ+y3i5tZpwN1LOcFDbURIyIv08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879246; c=relaxed/simple;
	bh=kIJgnr/8fmPQEMfTYzL5uGySgGwig8u7nUKJCpef/Lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MraUO/LAgmVHvB8eg+xu59fR4Nk3d348nPyKxGDIrECVaUqDFytPCEY5YVpj4PrdpykvkMBVfAXEZGpD784nw0H3tzq+1526sqPwWBlHXsfEuRUtWeTlO0VMFgtxgRSn6AfJyHVyR1fnELGqtVls00MI6B6Lv/e4GD2AJ56lziU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD/Q0JS1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD/Q0JS1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-887fb6c0ad1so640327b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791879245; x=1792484045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAUohNgu9SSrZDroQ9BQ1lUYsCyK2OM4/OMeA6X2nw8=;
        b=LD/Q0JS1KfAH9ozBu8mmRbkdFBOPqXFmyhukUxecCJP/bfjVeDdpmNmMH13KgBeVte
         +qee5k7IMopgj4vo9keawScXOWIww6fYUmM/HjTZNl6pG0MWu8AVzJg1FBqreEKdp50b
         3r6yZczIKNFjs176qaRLUOVkBN+IeSW9GyR8a7a5ie3byMG2IFhHLdC7ZouiviX8a2qB
         hREDri3o8ab90o+cfkfCBQ8iIK1MOIsEtVaSLn/CH0v2To7PUEsexYkQTYJj/NA0FyrT
         Ro3uIQ/nnpw324mWVJgbjwDS+DE+qwvOyKTr9ezc2u6wKZVgXAU+ypDZV0eMREq/Z1Vo
         EXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879245; x=1792484045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oAUohNgu9SSrZDroQ9BQ1lUYsCyK2OM4/OMeA6X2nw8=;
        b=f0QcXs8ja7rU+5ON+9/uoumT9QRC2RG3msQyySl5qlBMKzRa3HQcsYWsUlcc1kqVHx
         zcbTiC7nJiTYAUZQgp6p9/5ECrs8UCEILuKa6q7T/3mMr1t0vkJ9Q6G22p1KNQmjgV6i
         gy0oK2vDBGIaiLuPDaU1ZWaYXPZzB/6GsoaoXSiZNUd3WuphfsfLBT7sZFUuXaz1MA4Q
         Khj3g4zUsKYrTnSekkuxdgn+7TFS/wzKMARmBkokd5XPpY14C7Lh8iwUGygBuYPglo/E
         1qQ8LMoz4Vk9SBFRuIb+ctz+qnn+MNocf6Vg+ws9lkoT6bGSWlL6NurfM3ZAjEgGQBde
         cQYw==
X-Forwarded-Encrypted: i=1; AKwUvBzOzhbL6H0WWyz/WBAkPJA/L2Y2A9QPDpksEePtdmfDGvfghnFZgvNHt4T5V/7SJDjoYZ14RDVv1/4sKwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpznVKH4j+engenypRo1OI6zzSdmt69THJe2NREARMv/kTQLZJ
	uF5kbky9Q5XoB1sXHEB4yvPux4kb+txu+YJ3gO3OkLhc5rZO4fxRgLTm
X-Gm-Gg: AYBFou1GzmP4IaJL7nhRmkHMRWNyL5ffrnLuWf3A6Octbj2Co1PxSKveV5NqGBbyrNJ
	tji+3wBFX02GZBeCIjrnGAckrVGaHx9EOEObRtdqBLx0/MFIsSO6TvHO9a56Wa556Cq/QuNIlSt
	f/pT+7EN1kXfPDN7T8O2Jbha7bmMASlSsTXsTkvAuX07ux/oHQaSw7MigcMOCDSQvxVBs5kxox8
	dI1drwR/Cd4bg4wN/fkuc6Jxxm268b6jSQ1mh9ZwvHcqI+6tRNN8QP/3WyvpwF+azjdIyOXoKas
	Txe+QvXfuW5siKb8jXgJxXoqL4c9JCwU0/Lz8aOJGPka0QHxN35mKUB6yXQZN3MeEvhrpMlTowJ
	D1tWbOm0a/D69K8/tTHpjKGZYPeoq+v3wAwH2YPD3ebOAqdxtoopL+51IAZpJWv33XusXITevdL
	Bv2OxGoTfEsdUuGnmRhjAktBJSpEgrSCsXO5QCqPAxBj3eZC3sY37zFHgi4OZWYwdN0GXTf0WYR
	NcGo/cCbSvevio6dBRIuu2cFUbHu5Rp6UQm4ajJGFIEM4hiF3b5MpMXQvOytj1AoA==
X-Received: by 2002:a05:6a00:4185:b0:890:a3ed:8a49 with SMTP id d2e1a72fcca58-897c7cd481emr10083173b3a.51.1791879244700;
        Tue, 13 Oct 2026 01:14:04 -0700 (PDT)
Received: from [192.168.99.4] (i114-183-29-19.s41.a013.ap.plala.or.jp. [114.183.29.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-896c469d2a8sm4606502b3a.52.2026.10.13.01.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:14:04 -0700 (PDT)
Message-ID: <65a3e29a-24e0-47b3-a189-903b1a33c336@gmail.com>
Date: Tue, 13 Oct 2026 17:14:00 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] veth: clear rx queue hint in veth_xmit
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org
References: <20261009040412.14571-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Toshiaki Makita <toshiaki.makita1@gmail.com>
In-Reply-To: <20261009040412.14571-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/10/09 13:04, Jiayuan Chen wrote:
> With more tx queues on one end of a veth pair than rx queues on the
> other, and RPS or generic XDP enabled on the receiving end, we get:
> 
>      veth1 received packet on queue 2, but number of RX queues is 2
>      WARNING: net/core/dev.c:5212 at get_rps_cpu+0x560/0x1360
>      Call Trace:
>       <TASK>
>       netif_rx_internal+0x1af/0x4c0
>       __netif_rx+0x99/0x350
>       veth_xmit+0x713/0xca0
>       dev_hard_start_xmit+0x166/0x5f0
>       __dev_queue_xmit+0x1797/0x42d0
>       ip_finish_output2+0xa34/0x1f40
>       __ip_finish_output+0x510/0x7e0
>       ip_finish_output+0x2f/0x320
>       ip_output+0x17a/0x3f0
>       ip_send_skb+0x1bc/0x220
>       ......
> 
> Easy to hit with "ethtool -L veth0 tx 4", "ethtool -L veth1 rx 2",
> rps_cpus set on veth1 and a few flows sent over the pair [1].
> 
> veth_xmit() uses skb->queue_mapping to pick the peer rq, but never
> clears it before veth_forward_skb(), so the rx side still sees the tx
> queue index. Everything on the rx side that goes through
> skb_get_rx_queue(), like get_rps_cpu() and netif_get_rxqueue() for
> generic XDP, takes it as a recorded rx queue and warns once it is out
> of range.
> 
> Clear it before handing the skb to the peer:
> 
> - It is the tx queue index of this device, it says nothing about the
>    rx queue of the peer.
> 
> - The two sides don't even agree on the encoding. The tx side stores
>    the index as is, the rx side stores index + 1 so that 0 can mean
>    "not recorded". So tx queue k is read back as rx queue k - 1, and
>    tx queue 0 as "not recorded".
> 
> - Commit 710ad98c363a ("veth: Do not record rx queue hint in
>    veth_xmit") already decided that veth should not pass any queue
>    hint to the peer. There is no tx->rx queue mapping to preserve, so
>    nothing is lost by clearing it.
> 
> On NETDEV_TX_BUSY the skb goes back to the qdisc, which looks up the
> txq from skb->queue_mapping to decide when to retry, so restore it
> there, next to the existing __skb_push().
> 
> [1]: https://lore.kernel.org/netdev/156834bb-8e40-496e-9443-9d515fa18eab@linux.dev/
> 
> Fixes: 710ad98c363a ("veth: Do not record rx queue hint in veth_xmit")

I guess the splat can happen before this commit.
I'm not very sure but probably it has been possible since after 76ff5cc91935
(with ip link add numtxqueues & numrxqueues, instead of ethtool -L)

> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

I agree with the patch itself.

Reviewed-by: Toshiaki Makita <toshiaki.makita1@gmail.com>

