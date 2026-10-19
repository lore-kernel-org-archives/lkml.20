Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423979;
	b=uCUVbAPmu4hwheuxqftSCfPDwOxIi/Iy5hbbbNiXb8bIZMQVKkiRso58Tqf1mYT1/zC7
	 1s5KQvjYt5U4rj86o4uMGE3pRKow435ZANV01FagknzZbLAOnETntkvlxXDlYKsxYNfa3
	 cZY0WaQpjetJMP60C6bNwmXRrI8sRjY6Lt+lOxmwaZpmxRRBtBTt6ICAU9vETMiWIyW1i
	 MHL2h8qSFkjfTDY0Q7X+oLmDGBKJc4ETw7D/iZDaMH2huFjE5NG0AnVymjfX9zZs6homN
	 3qJtKWmy9jbwdKPKX94apxvvDKFF363TBeANrAPZExuWl9cHqdipSZnZ5O1hafBYgXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ygIty8U4Oh+xEsvVfMJ67KbyembTcOkF0IMJVfaJF8U=;
	b=cMb3JYKs0mppAe394iNVXwfBR9oEss7mVirywzheAvLSnUFicmCbQv13vQJxhlpStowH
	 WB5Vw6bsGt5gLia62t+sZnFA4tcVlZtBcS9nRjNbkhvHXgdTxWrGu8v8v1ZBCN+GTqKpZ
	 nut353/AwcEJFob50gFtpcNvNTT67LwF+6LtNwjf+Ph76eTRmNfUO9U4PTD/phoJiXn4+
	 X8ByFQpVBeSzM4F9GUHNLZeWgwt/7y0C++p6OuLlG1pgoE7inp8U2Huzo7FBHlwstOUPB
	 PFh4gzWF+tWaPOTwHS6gq+9fAwJne0ESdbO15BYAPYk586Tm8jSo+2a+/69VlXyabRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ViAwuJvu;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C0606C904
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4C0606C904
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ViAwuJvu
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd63b18598dso110608a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423978; x=1793028778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygIty8U4Oh+xEsvVfMJ67KbyembTcOkF0IMJVfaJF8U=;
        b=ViAwuJvuJNS3lPnbcEqbXbBxon4y5zd/k2I/OZW6XWgxcEyhQk3+ztZymplTonjrs5
         /RJeOzwIusIHemZZbaTWEkYbhFtxowq7pdFw+QhUOZir9JT2BIzImWIgmeVQkMIQRgGB
         PvxVG6KX4MPpuO08nYcRWnSjlH8LGQJsyHqbaZOSC1jKWOxrsMc5vcEdfNWWqaoNe7GZ
         BA1iiqBhnRz4rh1miPyDJopAnnoCfHj6QW9NDEXo4vCbNuSheFNp1w8tHAV3jzDRLh84
         GARCA5IVGqjzvNqToWhW8FG5U9v0Q0Pi5ZhLv4s29cyEEdYN72lkZ8vExXWfa438rQK7
         L2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423978; x=1793028778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygIty8U4Oh+xEsvVfMJ67KbyembTcOkF0IMJVfaJF8U=;
        b=2nTuln0GnzvHF8EaYL2ShtyTstt5fTXWkaFLABeVwEZeaBFKb8j7KTq+cjrudpugcu
         XOg23o0XtiGiDUZTOO19muHxP+yq1SPWgUnhxbop1sYMXaQ22q8VKZ9uqjfV7I2fPCIg
         HfvxGXbGTB3SYjbJ39E4TWOubcuENjVGPPqBlE6pNvTK06nq+PeAh80HDhICe9z20dEd
         wgDDJFKBdd7+/w7VlPbA3ftAZDqyLj69VQCFkXHG7MmaxgDx+/VsjhRmcgft1x+DUL0c
         fmZgV9WPj5de3KTaO1Ok8TVb4bx0COJWgQL93VR0c77EgZ24Jnx279vAUanATPl6PF0V
         7u2A==
X-Forwarded-Encrypted: i=1; AKwUvBzilbZ5+ayoYdo38juEn4fnAnfLS25/0IzRLQHdBx3qdUccbN0cN5jLqrEEVBWYksm/R6v1Aq2dZYiKeKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBquygn5YT8Mt0rm/RfEBp12b9zziFjgnVP5G8A7Z9GGEBnZ59
	bO/nKqhZe6aefIPDAT9O7K3AoVV705DLiOuLtg/gp6iYPaBlbladXv+IiLLPRoyx
X-Gm-Gg: AYBFou0o5avsYHi3EYEBnWGLcputYoC6vkNjmZp+swuZTCb1Wb4r7Gzr4hut4yNSjVw
	bF3RPfg192IEOr1CfKzkjyRpu8QXKredphhf7NebVsDS0rdo8iBLxffddGTtZyaiV/I5y5D2Ege
	Kif1eYRHyj/R9+DkQvc0wCF2J3D9ke6EJQ3unV3H0r9H3jbWzv8yBaYObyD6uQ+XGyLgYpR17SG
	HzusS6Aq8ewOeA3HZ7AITY9Zw7NCT4jRKN1a7ieHTBnM99tHvAFYW25V+8Lr7fJ39FVYz/eTbIT
	xIAG0TGSioqNFKfAbZDiOcOGa85Fyxixr2FpY3yKPZ9GVOA/gXWjsWrhoBdNH+geB+UUq/3QuJ3
	rm1yxMvDlv0QftAzecc/zYvOWVr0B+K5kzOogb8y1hFJCPO/fqF3pmSG++aj2gjTR+6ETkc6oH7
	y5dwRAog4yiyIjTHQb8z+63EmGMK5AcQu0ES05Xfdsra/Xezlbzc3GWyc8C9hjm/2YeTmySNH5v
	jNKAHzFBZtmVD41LCDOR83P3RHUHbkYD6Wsd8D7bbdiJWJvJ+3i1eC2MSa2fMTKp0U=
X-Received: by 2002:a05:6a20:244a:b0:3da:9b31:5ace with SMTP id adf61e73a8af0-3e225f8afbamr9866969637.2.1792423978219;
        Mon, 19 Oct 2026 08:32:58 -0700 (PDT)
Received: from localhost.localdomain ([183.42.136.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm4017801b3a.29.2026.10.19.08.32.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 08:32:57 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
	chopps@labn.net,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 0/3] xfrm: fix vti tunnel device use-after-free across async crypto resumption
Date: Mon, 19 Oct 2026 23:32:44 +0800
Message-ID: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This replaces the earlier vti/vti6 series and the reference-transfer
rework.

vti_input() and vti6_input_proto() cache the tunnel pointer in the skb
control buffer without taking a reference. With async crypto, the
receive callback runs from crypto completion and may run after the
tunnel device has been torn down, causing a use-after-free when the
callback dereferences the cached tunnel.

The input hook takes a reference on the tunnel device when caching the
tunnel. A successful receive callback leaves the cached tunnel in place;
xfrm_input() releases the reference on every exit, including after
delivery and on drop paths. The error callback only updates the error
counters, so the common drop path releases the tunnel reference after
the skb has been freed. IPTFS, which can free or consume the outer skb
itself, releases the reference through xfrm_input_drop() or
xfrm_input_consume().

Patch 3 relies on the first two patches: the receive callback must run
before the async skb->dev reference is dropped, and the address family
must be available on the early invalid-state drop path.

Changes since v4:
- IPTFS: when an inner packet fails validation, __input_process_payload()
  can reach the drop path before the inner packets queued for delivery
  are sent. Drop those queued packets as well so the outer skb's tunnel
  device reference is not leaked (found by the Sashiko review of v4 3/3).

Changes since v3:
- the cached pointer is always a tunnel; the address family selects its
  type, and a non-NULL tunnel slot denotes one held device reference
- xfrm_input() takes the tunnel device out of the skb before
  gro_cells_receive()/transport_finish(), which may consume the skb
- the device reference is dropped only after the skb has been freed,
  including on error paths
- IPTFS passes the state's address family explicitly instead of
  inferring it from the secpath; consumed skbs keep consume_skb()
  semantics and drop paths keep their skb drop reason
- drop the xfrmi changes: it re-looks up the interface and does not
  participate in the reference transfer
- merge the reference and IPTFS changes into one patch so the series
  remains bisectable
- the gro_cells NAPI window is pre-existing and is documented, not
  changed

Runtime testing (aarch64 QEMU; KASAN for UAF detection):
- VTI async success and error: RTM_DELLINK completes without a KASAN
  report; the unfixed tree reports slab-use-after-free in vti_rcv_cb.
- Async resume with the SA deleted during the crypto window: the
  reference is released and the device is removed; with patch 2
  reverted, xfrm_input_take_tunnel_dev() warns and
  unregister_netdevice() waits for vti0.
- IPTFS outer-skb free: RTM_DELLINK completes; with the
  !first_skb xfrm_input_drop() reverted to kfree_skb(), the reference
  leaks and unregister_netdevice() waits for vti0.
- IPTFS aggregated payload with a valid first inner packet followed by
  an inner packet with an invalid IPv4 header length: RTM_DELLINK
  completes; without the sublist drain, the tunnel device reference
  leaks and unregister_netdevice() waits for vti0 (Usage count = 2).

The IPTFS timer/reorder/state-teardown paths are covered by code audit,
not by dedicated runtime triggers.

Previous versions:
  https://lore.kernel.org/netdev/20261018090638.55686-1-q.h.hack.winter@gmail.com/ (v4)
  https://lore.kernel.org/netdev/20261013074610.17808-1-q.h.hack.winter@gmail.com/ (v2)
  https://lore.kernel.org/netdev/20260930090813.73901-1-q.h.hack.winter@gmail.com/ (v1)

Qihang


Qihang (3):
  xfrm: run the receive callback before dropping the skb->dev reference
  xfrm: set the address family before the early invalid-state drop
  xfrm: hold the tunnel device reference across the input path

 net/ipv4/ip_vti.c      |  3 ++
 net/ipv6/ip6_vti.c     |  2 ++
 net/ipv6/xfrm6_input.c |  3 ++
 net/xfrm/xfrm_inout.h  |  4 +++
 net/xfrm/xfrm_input.c  | 63 +++++++++++++++++++++++++++++++++++++++++-
 net/xfrm/xfrm_iptfs.c  | 42 ++++++++++++++++++----------
 6 files changed, 105 insertions(+), 19 deletions(-)

-- 
2.54.0 (Apple Git-157)

