Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679872;
	b=CgjIjmqjL1vr1VpNvJ4GMzPzwH+XLzbB+tQxdRH3nm7lDH+5ANXGlW66bUdmdbHMdNnu
	 +/vQjGKl+THS6sAqZC95lZWWaPV4/LnLmJd1IAI9tq/AA2UA1G6d5CrDb/CJ3PY7xCUa9
	 4m2WIdjczHAi8eblNnC05r/QHh+m4I3bR73nr5Mqx+wM/JjBb+g9oJSSVYj+ZmGpb1qJQ
	 3IbRlN+fx9ogvMxCuBgpf9EVsGRahqRBvCX2QooKNeTkqqi5lSc6OWXfU8gvdGOsFmAQ2
	 StZFMVFr7Er+nU/apSe0HeARXa4FwDVtxs5xKkgB+3qD8NfQmgx1/nDwGEv9nqHU8ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wIEEgL0wnyCgnfYBD3fqLb39KxnaLSOeClNdZ/a2t8c=;
	b=VWGjvHgX596JORv+AccAj/RqJXjf/D1/RZNAVfI6ZpTCwVo5oAUUFIucUNerZHHo29jv
	 +8DF6ynrsy7JPOHobZEHOyqAjxp4V40OGMXzwiXAtsu/YnollVCEsnKC1D1tr1tZxujD/
	 1FoL+iWIULZMFiEKtp7ToDOECf+4T79yM0+iNmRL/Yb6++vvLUrNGsSQpcQALaQozl9fU
	 V+pVO/kmmIDoigCsc0UVVTyS9JNMnhsTbyEP8ByleV7EtRNB+5yi73KsPskL4qUDCTWU/
	 Am4MwvTmc7zyfZlEIX/pOrURsu3Gsn0QcauMtv85p7os78VNkSpouR5itr2c3Wg9GCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NrW1wSYV;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD32606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BD32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NrW1wSYV
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so1688470e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679871; x=1793284671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wIEEgL0wnyCgnfYBD3fqLb39KxnaLSOeClNdZ/a2t8c=;
        b=NrW1wSYVo/0BMy9ljHMzd7PivQSvRKB2TKTrRz/sIMlc+eMjlIYqpDmmn2Avr0192H
         tPwYeLcRhn9wTn6nPjpgMh3TYJnEIr8mCnTh6DO66V3uSusns2tV7B4QXQvLAC8KIyLC
         MsrvNL9u8HuVdfNVZkhvTXRNvnQszt4jmxZe6YqzmlkCdnZHTfUhsXR3+85lXzbsnTCW
         wMpfZUWyp6c/qeAhcALEV/Lf7/r4AEy4jk9PaK2QZsT6kECQ4kjik1uip8Z75fLtEKHc
         XloGcdQ4qkddT4uH1xxzERe5glU+Z2HsoM1jfijpHfTWukAcyyhqhTl+rMDePAAwOgVf
         O6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679871; x=1793284671;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIEEgL0wnyCgnfYBD3fqLb39KxnaLSOeClNdZ/a2t8c=;
        b=G74v+UiyWoKVrr8JEClQU2dpsws/CiIFI5D6YLKFd9Bwyv81LJqpmTcAi9jNGI3T+V
         5RbWTEdXHn+bCSsadM/qsbry2BzKczIGtZWZW2H2MDMLsukKUON6R89u77Kb0qBU+wL+
         cnfja5TIthnvxZL2PRTn4GI2Zo3g6kRLbxq9IJjQiYe8M0kIagyypcnKAKR2Y1JuA1rm
         SkR0gvW+ysGHnw8czDU1sppAhSy533QZWytuB6ik4wcbP2izuDtwrFywM2ninG2Zfl+4
         TuyBXQQ09i2zU484w5RO8pD8uXOe3lN5HE91E0sqq6DRC45ohxZuliOA6fTW+Z1ztznH
         q23w==
X-Forwarded-Encrypted: i=1; AKwUvBwA/aAiG/dB19ZEKuidBzZSsSX3qSIw6rJIbaSaVg7LZYyv+1pOwBW+0ap8hOjqo/XnbJcPD64qD1nSDYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3pnMhbgHR6GuNMS0Dcfd7zwQCiEfXVL2Avk++BopfmhajYtGL
	ipDhwKnCzVnGeNx5zO2fsp34ovsl+AVRb6/ZHeTctxmkGa9rxhqaHWRF
X-Gm-Gg: AYBFou2fuglbTG67xudJ6CNHSNgMCjBAC7l5udqtZJp0N/M+1pybY236nCy9xScAfi+
	4u0JVE2NhPzCwh39DdTGP88ebdvYmefMG2Wmjd0bisxR8UT+9zcFWT39HMizV1rb8Y9mO9fN096
	i22/ufsAl7yvO0uJrAaHAyKHdSq7Qp8ySFDRlmm95wR6DRl/ms7laXkdVgOkCh+WQAcLnhwC0pH
	Jf2n67KqJK30/ZViU3FMAmtEs3+3XOsJLDbj+IUwOXORB7GycFATRC4JETd/WG4tkR1wBgbqSxn
	7LEADonPNpsJhxwhZlZnL9rLB79Xb97w63iVvei/3HYYEhVaVc6yZ7Xe0cBmZtGH0rQeVKrJObx
	1P9IYL7OD5ftaUhO2nepFqra1dWoJsETUhGv0WKpWCe68xNAGtQuei8D481cyg6jMZojP1IX2ME
	tJAzyQW0Wm7BqyozXa10L+JRzb/znQUBj8vNJehkaxp/QgSCfFUUEAN3N0FVIbBefnl2puSxQI4
	6VpLr+rWF5LMJWk+yX20xBjEoOxQJwGw71YA2WoE6Qgy+GpMPWi09DwQuxEcsVBHkYItTWy0JXy
	QeTKXQAYI8YSE/X/dRUL2ZDb6yIzPmAvjebuExHzo6a2MLwt1iQf5HqcsoIdNMCfttgIBpil/em
	z4fDuFf2qSIfBDBfb6og=
X-Received: by 2002:a05:6122:2984:b0:5d0:1207:b693 with SMTP id 71dfb90a1353d-5eaebc25d1bmr2672346e0c.1.1792679871554;
        Thu, 22 Oct 2026 07:37:51 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97be251sm6978325e0c.8.2026.10.22.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:37:51 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:37:50 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Simon Horman <horms@kernel.org>, 
 linux-um@lists.infradead.org
Message-ID: <willemdebruijn.kernel.27710620cf132@gmail.com>
In-Reply-To: <94796ee3c32e50665ecf70e2b390db1bc2773be9.1792668082.git.mst@redhat.com>
References: <cover.v5.git.mst@redhat.com>
 <94796ee3c32e50665ecf70e2b390db1bc2773be9.1792668082.git.mst@redhat.com>
Subject: Re: [PATCH net v5 1/7] net: account for ingress-resolved virtio net
 hdr state
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> The following patch will add ingress resolution of uncommon virtio net
> hdr checksum metadata (software checksum completion at ingress) which
> adds performance overhead to the packet processing.
> 
> We should make it visible, so a hypothetical workload relying on
> uncommon metadata can be distinguished from none at all. This way issues
> in the parsing will be reported and not quietly pay the host-CPU
> checksum overhead instead of offload.
> 
> Flip every call to virtio_net_hdr_to_skb to test for negative errno
> only.  The um vector raw transport even ignored the return value
> altogether: rejected packets went on into the stack with their
> metadata unvalidated, so check it there as well.
> 
> Have tun count these events per device as rx_csum_sw, exposed via
> ethtool -S.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
