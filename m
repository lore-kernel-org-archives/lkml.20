Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792433987;
	b=xizAJvqX0Xi86svZKwYZjtI4PxWNhx3eIhtZVDWjuLCy4Ljdh79Qn6wJ9G7AcwajWBK2
	 r6nsdcnuPCMvVQc5Zfepp5WprdPGc6ukw9NlItxvxQWPRRPQyR0QqcSFFqk38BpRuMyCC
	 kjz4QpqMIKf+2ukqC8nJiA41gRFhZw4ddnZ0CIu1rlxnASj5bU4qxG+GgQKurjbR0LLBi
	 eNNL1Eyq0dZgG0J4lUpaifvT0ODAyD4rGyy14wvx9FdvqtKH04S/28qtk/gn7b+uZ2/bD
	 pnG0rzb7j4sRcgOKN2EMEY9O0KBaFwYZoTd+w1c7IhZqS7XcX53LRiTEsWy7S84JuEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QIrE79vm5rJ95OFORudqvsCFoAgEHH/fkLFWkOBtscs=;
	b=KLRpnDMYj7tpFoieUAifRANRyNSXa3Vt/ul7bUKcywrJPjrfDiKDXHoDxIBbinxV5bfh
	 ldUIYbHduJytzf1pNWWe0b1l3wT3RRPopvT5Nk3kuYVsEIO7YhXbqB8BKE3IelYlOwwlY
	 CmbQN58EY2EI8+hK+ZYCAb+riJMVh7GK1S9qI4leG1M8C1LcJg6TVFOJxRF/p4I8tVDq/
	 jqgbKFQ+JkZTnwPxhSQQgYnejjakylvEnei7dgNqwRl1H7HHtO9zAB8C1Z7700zyrozWV
	 NGl0T5mQJTVrPDBvrAkCaBcWzfIMJtrBGEUVvVX6WA6FyHCEixClK8z7TOCsyLGFo1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="d/Ogn3Ca";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D44606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D44606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d/Ogn3Ca
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-87ab6e5f91eso18063127b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792433986; cv=none;
        d=google.com; s=arc-20260327;
        b=lSclmz2H/q/Y15ojuGfgQ1mXL381zUN035i5IdpPQRK0XphMj/bGkiTo9S4BCmjrPc
         UImfQSCDj4DLlKKtq98otycup1VpWX3R0RX39tbcee6kyij8znnw8/RGV1zorop+hi5J
         qanjPoIn2+krz1DLyMJ78e9r544eOdhAR/Cf5Q49YB+lbYfcyQJu+6RvqLJgETHKNAQY
         2rFwCuzPPPEIqWBBK+3VzEGK1GhnLZoTQjyCufGg4fLU3S8JLAGwQ39VUds/tEJyMB9u
         DRFLoiGC2AAh8ZopAd4+qIXfw/ur0fBJ4OAkbkOkJ6RpBhNYeSFb4sQ9hW7G9nYfBG1R
         iyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QIrE79vm5rJ95OFORudqvsCFoAgEHH/fkLFWkOBtscs=;
        fh=16lsNGKJXJ6zw+9UlZ9V5K/HYLGdrLguiWSMBcn35wg=;
        b=hzBLVahD9Yj0xW7BS8dOyCIYFJyxxB+kV4GfSSPQ8bqr5uxmLR+FQSU31jv9D/YIKN
         nNdejJnq7PDYoynv0gVaucNPr71cQ5Eo+nrIFcndWeqeTeeS+dPllTdI/94/8hQAJjpB
         zw1MLlekV9OKBHu0Twm9oRyO0i88+cDLL6gu69PwFvcQKwU3yQdRGkLNjvkWquyspbsV
         y2pf6vSf64U9+0OUxDdZ/9n40yeaiJRLVpvVaK5dr2nauL1csfJtLmeTl7pRy/eXCi7k
         fhj8YvBgzrIfPVlEYNf0EJ2IFKWOc1AI/7JiTRxNt7LI/uRVbxfY7kyXFbv1SIXNOurk
         KKXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792433986; x=1793038786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QIrE79vm5rJ95OFORudqvsCFoAgEHH/fkLFWkOBtscs=;
        b=d/Ogn3CaB8xDzPK+AM6nKJ56zb/MrgGIpwEvvNvNehVtYIF/SjL8yT2wRBgPPa66K3
         U6G1s0thXYAMQENJL43wyBnGFX2QLNXhwH8e302qUJqQcdxv0LbdH/eRKmMzJEezIgeI
         6ZYGRuaAzkqhLTPe9Cmn+UhvH3CsWqTmmx783erQvwm7Zd/mKDAPMeXGPl7HfCeU9q1X
         7FthYumlk0ql5usVkzbvhJ5R+l8mgIZx6vxwOsd5NOXV9I2YQsATBPiWBA3z7v3FAG6j
         KNywaAEkK1WdSVghWceMyktfRe30wZYpxQ1ucAKDAhmK6ABf9jQY9QtXA6eIHmgeugGS
         +rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433986; x=1793038786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIrE79vm5rJ95OFORudqvsCFoAgEHH/fkLFWkOBtscs=;
        b=0/H9dORyOSnsjnGbGG5b0eANyGdJL1a8POP5peY9X6C5QHOMNlyQ6SeLvhBUwap4VZ
         bRMP4gIs2yTmSB7Se6DC1uztfruZq3A854dSOL0nL8k51Nyp3Vx/fZRj8yym17aKsGu8
         e4LKLK+QTkb0k2IZ6iBphE3DEY2W6BnL0IYxPWj157PfEHWV4E4+YGUo3Eq/LhX6NNu9
         XFuS1+6nSgqTcFY2NsvwKkiDNdSINqRPCvCfHhC+KDuhZCUU38uBoy05Im18sCTL4jrz
         9rTSCJxEr+ASOyzE3dAnuVn0DqHfnAXeGkN3sJ3f4zqjC2Xrrt6JogvXDnSQqmuwCMV9
         TJCg==
X-Forwarded-Encrypted: i=1; AKwUvByBJv7nbAggy+OwGqoUaqg8VubZb7nvgo8gB2UbwG0LZp74iiXXOdsP0nmI0rHK4dXl690kDhkeJTLXUNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKavPwU/cSrL2dUM4yr1+KO4Zc9w0NNQlua08ZNRwIGdz+zNM7u
	ROMRRZiLVhWnM+M0Gbt89179wcJBBwxgATDQghbeJwF18DxdBdig6XV6AHFJcWDA4CQFRv7nhQt
	tKbvMKxB/SDF+R6nj4sjeJ8InLBHiRFs=
X-Gm-Gg: AYBFou0Bm9YIXjXLjLEqqLh4hVeNWysVy6tjTmeMtSyd3A40QH9LGGUbXoImIO6sZZA
	oMvKFDFRouQQuh0CUHpPF424mxgYTZCnJ4zB27+HI9YmUn87ZXVE/i+Biegw32QnARGCI7fs+yP
	vzVpNnxdr2YP7apzPkcuGcM5cfCzK+gdjawmEA+iuBLAaKEHzvJAfwk/RQccf8jedaROHNQmJ/1
	0CZG3jseURYPpYvr5zs1uEG3Uqh9DwZepBPahQdDCehqm7KYYF83lHncsb6f06dV/SVWzaprXyj
	pwH5jIV3MHyGQHF6iZOX5vjuPMdhzWiyxttKkCYpQxNchCTzDd9HVdLjAu2Z/iAc5F+SgiSUJm8
	OMc/K7l5YLlw2l1ACzML1K83jaaKc5KLoBBrceBXiF+K5GOR4K/8B51zzwIknelhFucErOBOg0I
	ZJL9zIfLjlNg==
X-Received: by 2002:a05:690c:a192:b0:895:241d:6b2d with SMTP id
 00721157ae682-8b0f217d654mr20952207b3.33.1792433985778; Mon, 19 Oct 2026
 11:19:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261008163817.2983484-1-eva.kurchatova@virtuozzo.com>
 <willemdebruijn.kernel.2f0d78527930f@gmail.com> <dc9eda55-2688-40f7-9b0a-7dfa0e5cbf3d@virtuozzo.com>
In-Reply-To: <dc9eda55-2688-40f7-9b0a-7dfa0e5cbf3d@virtuozzo.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 19 Oct 2026 14:19:08 -0400
X-Gm-Features: AclHuK-TO08q1YjNenH7D-aAu70P2Yt09HngPzn-Fp2PEJuLp9lMDbDWphvb2QI
Message-ID: <CAF=yD-LZSec9g_0bBgrcQvq2OO1BrxMSRHH=uU7eamCmWcTO_A@mail.gmail.com>
Subject: Re: [PATCH] udp: let rx-udp-gro-forwarding aggregate under encapsulation
To: "Eva Kurchatova (Virtuozzo)" <eva.kurchatova@virtuozzo.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Alexander Lobakin <alobakin@pm.me>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:54=E2=80=AFPM Eva Kurchatova (Virtuozzo)
<eva.kurchatova@virtuozzo.com> wrote:
>
>
> On Wed, 15 Oct 2026 02:56, Willem de Bruijn wrote:
>  > Uses encapsulation in the same network namespace as where the test
>  > runs? If different namespaces, the socket lookup should fail and
>  > thus the behavior be the same as on a host without a tunnel.
>
> Different one: the vxlan sat in the init namespace, the test in the
> ns it creates. The static key is global, though, so the tunnel turns
> the lookup on everywhere, and the lookup then runs in the test's
> receiving namespace, where it finds the test's own receiver: a plain
> socket bound to any address, without UDP_GRO. That is why the check
> goes from 1 to 10 the moment a tunnel exists anywhere on the host.

I also don't have a straightforward fix to the test. Maybe just make
this one optionally SKIP if it fails.

This is the following test in veth.sh, right?

"
chk_gro() {
        local msg=3D"$1"
        local expected=3D$2

        ip netns exec $BASE$SRC ping -qc 1 $BM_NET_V4$DST >/dev/null
        NSTAT_HISTORY=3D$STATS ip netns exec $NS_DST nstat -n

        printf "%-60s" "$msg"
        ip netns exec $BASE$DST ./udpgso_bench_rx -C 1000 -R 10 &
        local spid=3D$!
        sleep 0.1

        ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 13000 -S 1300 -M
1 -D $BM_NET_V4$DST
        local retc=3D$?
        wait $spid
        local rets=3D$?
"

which gets called both to verify coalsecing and no coalescing

"
ip netns exec $NS_SRC ethtool -K veth$SRC tx-udp-segmentation off
chk_gro "        - aggregation with TSO off" 10

...

ip netns exec $NS_SRC ethtool -K veth$SRC tx-udp-segmentation off
ip netns exec $NS_DST ethtool -K veth$DST rx-udp-gro-forwarding on
chk_gro "        - aggregation with TSO off" 1
"

The full solution would be to add a third true routing namespace in
between, which would not have that local socket without -G..
