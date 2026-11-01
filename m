Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548799;
	b=zLKZVkDYZX+zyNinmZmqvoeH+A/H1qYuuAgAZCi4bATBGdBDIjMS70SeKTo7Pwo/ZY9m
	 qkudB3IECe1zPzsriN0tx12fFST1r3Srok7lyOTytWLPtR7GNv/m+oPrZlr2U43fu3SA2
	 Tc/gvoYz9UBx8bHQxNG2PJhxPA3xx67IqfSIDNotUJqDpQstqqYsW2ApMhAWAKnKIRZcp
	 dkbeSZEdgRp9kvNS79fltXIK3lS8yZ/IWSyO9m4F77RM0fwdhMAMb0Ucasn82jimjLakY
	 R1UXuLa82IqBw4cd8Pmc6vyKHKDuXLa/q7qS6fWVuKakJnRFP5UDOTBDvhgTH9lpNCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=I/3KNWEEu6IZN+CXs23fsbkAyCG4qcqp3COErszDAAU=;
	b=KLE3LC19Rn1wsyGu+pMe51OAToq3Al3Tegu0AeecSjnkeGGzLVhAKyOVudq7ycPfbVnu
	 CrYpU5evJ3G6dQl15dwvr+8MdKpmx8B7AWuihIQdkj1fpCuHsgRBHI6PuBT+CaEbwcuQ+
	 zONfU/6VcVDhcYkdXTLPJIbTB5o+wq5vQ9GAtrXGt1piiC2oxtJb0d91aOoUsAhXkAxGX
	 yLtc5UMmZtZdgaoScgh3Qa8Knb3mbZrgstKkiaxR5gG7hZsOWduEIsBJPuEvjcwDk/dPd
	 VTvPY1FThN/GUQD+xCP3jB2oR6OTIQaNxtB2W6TZmkMxbEJA5VVMK5euSUIlNcDumqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="I3/SxCb9";
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1C606A32D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D1C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I3/SxCb9
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1308052a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793548798; x=1794153598; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/3KNWEEu6IZN+CXs23fsbkAyCG4qcqp3COErszDAAU=;
        b=I3/SxCb9r8isKAZuyi8zggBKTG9izfADqSnDe8BsNCPcv6urpOKu715L0wIp5ZDSzg
         iyOSc9qrMULYv8W9eZPP0mT8DgXreddeqZIF6ay99VMHR8MMBPYNQVs0apHttn6pQnVM
         m8XvOrnYbVE9PT2rGQ+zcJ6hu09DCZzCbZCysKlJ2V8kaSzw0l2eUSZg7efO5vRBhMry
         uYmIBNQVNioWG6TQX7giEpQn9A0cJ5LSpIxy3tKrwak1ckvOfrzgN2ZW8PAtKV2Yt0n1
         NgHSWKDrZM7JifhfuzdMLYeSbL9EPv8F6nlNeMoCKPzfCF9VfZCQBnxDBm/CbsnAs0ve
         v9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548798; x=1794153598;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/3KNWEEu6IZN+CXs23fsbkAyCG4qcqp3COErszDAAU=;
        b=OmoiAKMNjtPuLM1fe1IIqdlE7RtyN5sxkh7VolPk4uCP8w1Xaa/WutspKuSwPFJ+06
         oIUJ5hQVtdme48O+QrRhjb09vQ/f9WOA6W+3+YksGVxCBBKKMWVpN+zTbKvujd88yeTq
         CBlTk238/M4qNQ5lj7qPjC+FtCcsBGOVAOSySxE+5+q4WHE4iPnQ2kNJKv1XgR1xd89j
         iG3pljgNYv/wIFPzJG3qoPmAIZvTxn539wjrLDFoTYNDII360cQqlLTnPZPV7AFqVjuj
         eQXbQJfMWLj3qXE2bIaohViQI7Cnd+ntCiFmcc1W/zrNj+sA76w+Ho9n2WyCflFwbTT4
         zheQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7ibS9MfNoRCSr8Sr9jVQcinR4jyIwYhqrtFUbhBuV6MpVAM36wugASs9bpNdfj+X3hfM+ZqfAIjvniAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA6Kwxe5qCNYsM8RZMRMqZqNlz6MtZIXJ73BDvPLa7KK7SZd9p
	9FwZQmJ/q1QfvVs/jjavZsXFXW9gmKq2iPgfZezv6f+6sKYY2/HiD7GAq+PC1wOFSgcnyXtiwFd
	LlUDXdQ==
X-Received: from pgbd16-n1.prod.google.com ([2002:a05:6a02:64d0:10b0:cd8:b7a7:1171])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a96:b0:3e2:b17e:40e6
 with SMTP id adf61e73a8af0-3e928ab246cmr6424437637.4.1793548797553; Sun, 01
 Nov 2026 07:59:57 -0800 (PST)
Date: Sun, 1 Nov 2026 15:59:57 +0000
In-Reply-To: <20261030032314.1978575-1-zhiyuzhang999@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030032314.1978575-1-zhiyuzhang999@gmail.com>
Message-ID: <audeGRiIR1JE1Yk_@google.com>
Subject: Re: [PATCH net] tcp: restore IPv6 af_ops on disconnect of a v4-mapped socket
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Matthieu Baerts <matttbe@kernel.org>, 
	Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, 
	mptcp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Tong Liu <lyutoon@gmail.com>, Qi Tang <tpluszz77@gmail.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, 29 Oct 2026 23:23:14 -0400, Zhiyu Zhang wrote:
> From: Eric Dumazet <edumazet@kernel.org>
> 
> A successful connect() of an IPv6 socket to a v4-mapped address switches
> icsk_af_ops, sk_backlog_rcv and af_specific to their IPv4-mapped variants.
> These are only restored if the connect() fails.
> 
> After connect(AF_UNSPEC), the socket can be reused for listen() or for a
> native IPv6 connect while still using the mapped handlers. IPv6 packets
> processed from the socket backlog are then handled by tcp_v4_do_rcv().
> tcp_v4_send_reset() and tcp_v4_send_ack() interpret
> TCP_SKB_CB(skb)->header.h6 as IPv4 options, and __ip_options_echo() can
> overflow its 40-byte destination buffer.
> 
> Commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between ehash
> and lhash2.") prevents listen() after connect(AF_UNSPEC), but a native IPv6
> connect is still allowed.
> 
> Add tcp_v6_disconnect() to restore the IPv6 handlers when a v4-mapped
> socket is disconnected, and use the same helper in the connect error path.
> 
> MPTCP subflows override sk_prot, and two teardown paths call
> tcp_disconnect() directly. Route those calls through the protocol-specific
> disconnect operation so IPv6 MPTCP subflows receive the same restoration.
> 
> Tested with TCP and MPTCP by reconnecting an AF_INET6 socket from a
> v4-mapped peer to a native IPv6 peer after connect(AF_UNSPEC).
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Tong Liu <lyutoon@gmail.com>
> Reported-by: Qi Tang <tpluszz77@gmail.com>
> Reported-by: Zhiyu Zhang <zhiyuzhang999@gmail.com>

This is not needed when you add Co-developed-by.

> Closes: https://lore.kernel.org/netdev/CALf2hKvp0NPVLwr=a3+jUHtPohxbra8gox+aYAfWathJnn-J+Q@mail.gmail.com/
> Link: https://lore.kernel.org/netdev/CAL4WiiqFJpmcV4=TWRpukCq6q=-729658FwGvieNcPXe97kLvQ@mail.gmail.com/
> Link: https://lore.kernel.org/lkml/20261029054136.1174216-1-zhiyuzhang999@gmail.com/

This link is not directly related, remove it.


> Signed-off-by: Eric Dumazet <edumazet@kernel.org>
> Co-developed-by: Zhiyu Zhang <zhiyuzhang999@gmail.com>
> Signed-off-by: Zhiyu Zhang <zhiyuzhang999@gmail.com>

Otherwise looks good.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
