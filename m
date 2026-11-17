Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874807;
	b=x0EVLpZ/5/7QiKX+hauj+rQqKdRtnUuYVbfC/VonpfzSEs/rdl+ml/ORb+rPJE07O9AV
	 kK0RnQnNk0kGDfW31OqxvPItGGCjxAhL+gZXnv99aYLWaransf8tZsgbdzLJFt+mmnPtW
	 T1zYiJtqg+Hc+uU5iKM4W8pjHpkVQ7WDxSbmkbrTOTKOvu7eCdc8yYRkGV58BKYAzAPqx
	 UTvCDhp21O9aCAuR6z3EkKDbSC12rwOoYi7i7HUrdtKZgqJgOveyd5gq9n93lZVSF91pZ
	 z2C/AmaNYbTDpnpFS737hakIRnK2ta5HCoUPH2n6U19i3T23WZQ5y3FuBpAt9idESlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RbrdWR01eNMnnGuLY5WN6Vtdhl1qGXWujBNMei7/1vM=;
	b=MXvuNvJ+SVwpy2+WYtFsgy1jgKKIFsqqZTSnL9QVHVXAT6UyuLI+e2BhDiu3Ju7saXjB
	 K9Om5HamhQSXa+jBnyZ2cra0mvxHKeX1fuvKXlK14fdZhxwWcK7QoHed6aUAw4g9+hXWq
	 1SoS9W/8HURQzhsKrNIvr+HmFkjWq5DC3f3Z9ytrCjAePqblnhcIr26Qnrg9OotetQadV
	 k+h+2olZ+CHLfqZDIIUUbXJv9r+E5BbfRAqynu1N2eFGOwe1leiQXQ+3g/M5/vD7Fmeh8
	 X1P53FALJZba4bCT5GMl26UeVEvx/3xmMdaTB2vseuk1QdFQ46S3p2DwzeYZV5paeEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jLCrgO/i";
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76325606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76325606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jLCrgO/i
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8bfe396acb4so1874026b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794874806; x=1795479606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbrdWR01eNMnnGuLY5WN6Vtdhl1qGXWujBNMei7/1vM=;
        b=jLCrgO/ic/5lnMQoLSuLrcWSJJLk9j1wBeibgpvZL8bNE6cp2+DAZ4suo3V0FAEPKq
         08+hn2pUgz9+rm4VMSeaIxfYqBX4BDOHKnP6sD+59Nhk0f1FW5RSl2QPG27DZ8+fOLSn
         nyWialbSushN3fg6SCxfI6k5dvrXXNFQLFHXxPSmnmCdQFSQAayydmbjJFvWkH2S4Bg2
         qPZLjVjPfykjdD7EA3sHhhKtQpO84FNt6TxtSef36NejxG0ZX2vaouBgFpbidkbUp3DQ
         6CicRRms4ZEJCaOekZDduLe3c3J8U2AhJSvtoXBev7cYsyyRaBiyV8XGxZkSUVi9tUxG
         97ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874806; x=1795479606;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbrdWR01eNMnnGuLY5WN6Vtdhl1qGXWujBNMei7/1vM=;
        b=u8LE2eVa4vzZYyG9vNrB+pN3u6Xsv5YQril3hK9763+xr+N4N/Uvgussx/mWFQQlhp
         9obKLrd5sCNeUR4fVHeXGMSPT7i5327LzmkbE67VC7ugyy9agq77wMj+O01HDzpXswZs
         Lg1wVNlVy/Y9g479NwZk6th3pzvPXrsxFgjRjLogDZNWouvip7tkq2QOwEpCuq87kb36
         AiDgAOkb8fLUfoTjzUJnBbpDFUtUhfF6xP/i5h8CMZX4LC4HWvgkrA1cRd0rjyot5jVk
         Xs9SDONeL0SYUCVNU1LTJ+VrWYCd0CsNmKAi+W8hzwlGCMAbFiAW5bPKdvxSRD/t/Ql9
         kTTg==
X-Forwarded-Encrypted: i=1; AL+hErHAKFRakUacLeJjsurhbNE0s+CCDVhluZsIG/Go55HmB6gsA52X1nsdcA8EoNumtSZrO61N0teDmP8PlYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JwzjtWTzYkypWEXt/p9lE4V7mQSDHf9kNm6TwRxGVVu1O80Ac
	a7s8bgxhSx89A820Qr9rweQfVWLnq87RVF/yqfHs2DTVCmbMnhNxnjm4msYBKviveykQMYBTXnj
	iwS9fwQ==
X-Received: from pgby22-n1.prod.google.com ([2002:a05:6a02:6516:10b0:cd8:c6c2:d403])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3f95:b0:3eb:b9e1:4341
 with SMTP id adf61e73a8af0-3f7a8cd8fcbmr9316238637.67.1794874806023; Mon, 16
 Nov 2026 16:20:06 -0800 (PST)
Date: Tue, 17 Nov 2026 00:20:05 +0000
In-Reply-To: <20261113193355.3820232-1-hengyul@cs.unc.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113193355.3820232-1-hengyul@cs.unc.edu>
Message-ID: <avudn_RA-u2FweCW@google.com>
Subject: Re: [PATCH net] neighbour: do not update an existing proxy entry on SIOCSARP
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 13 Nov 2026 14:33:55 -0500, Hengyu Liang wrote:
> Commit dc2a27e524ac ("neighbour: Update pneigh_entry in
> pneigh_create().") moved the update of flags, protocol and permanent
> from neigh_add() into pneigh_create().
> 
> However, arp_req_set_public() also calls pneigh_create(), with all
> three set to zero. As of now, SIOCSARP on an address that already has a
> proxy entry clears the flags of the entry and makes it non-permanent.
> The entry is then removed when the carrier goes down, and the host no
> longer answers ARP requests for the address.
> 
> A similar issue happened before with the protocol. It was fixed by
> commit cbada1048847 ("neighbour: restore protocol != 0 check in pneigh
> update"). Perhaps flags and permanent need a fix as well.
> 
> The issue can be reproduced with:
> 
>     ip link add d0 type veth peer name d1
>     ip link set d0 up
>     ip link set d1 up
>     ip neigh add proxy 10.9.9.9 dev d0
>     arp -i d0 -Ds 10.9.9.9 d0 pub
>     ip link set d1 down
>     sleep 1
>     ip neigh show proxy
> 
> Before commit dc2a27e524ac ("neighbour: Update pneigh_entry in
> pneigh_create()."), the result is:
> 
>     10.9.9.9 dev d0 proxy
> 
> After that commit, the result is empty.
> 
> This patch will add an update argument to pneigh_create(). Only
> neigh_add() sets it, so SIOCSARP leaves an existing entry alone again.
> 
> Fixes: dc2a27e524ac ("neighbour: Update pneigh_entry in pneigh_create().")
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks !
