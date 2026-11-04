Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782251;
	b=qL64znGspf7y9wOkH6aZUpDC51LAsPALEhPcOY1zld0JefiKCIyg7S482uTdy+ELn/Nx
	 y4b+xI5R1KkKtwboKEfcvRmpIF1M4PGBTggWtmxro56bvUJWNVfVgYHwVgpw+YyTkzI1Y
	 FTCxr64gjIbvqxO2nG4syxGj4dWKTLJpMlvM10QSUdNAJuZs5YqqqSZqd7I4f5zvo6KwT
	 3GlRLZrlqWWRvfk1WPyrmR5yjnp8HVuBeqagRYaljuK6cSP23GPmZ7G1UHEM7SJw+dg1K
	 p87vCF+WaQMP1Rku+u/oxikfRhfURO8e+y4HQ44eX93NV7OGN32gxnNEFgBDuBcPQDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782251;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uCivgI0h3vh+RWF9zWybe8D2nHGtyr7jy67Tn3KDSIE=;
	b=RFH4h70Q5/iSoLNygM1wYZwmKhhdVu86d/aDHQOz8UC9kl47yom1HXbZsn7ObRfOZDUP
	 9McxpX9WXLdocmhe5evvhhbo3x3oz1tXbEB/IpCuhI62YLfd9zIj4kwxu6poE5jZvfiWw
	 4cHP47bCefLdtYTPdqbBDj3BhBBUUrDHmJHTFfnPcrLAdAGnRc3DcL/b7JBm5u0YnjPDc
	 uwTD7Jrnxy91waW0vCN5EPGzo+cru1bWHKxhRGobg6bPfOJ5XWSWdSVSdAN+mNH/MbN38
	 aX+QQzr7amV2wdOKMon/q8JY8mjks3lvAB1tvTjLxS6G+AvcbTCqEpG1t3JEyH3X5Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jaeyeong.cc;
	spf=pass smtp.mailfrom=jaeyeong.cc;
	dkim=pass header.d=jaeyeong.cc header.i=@jaeyeong.cc header.a=rsa-sha256 header.s=protonmail2 header.b=dNHUWXtz;
	arc=none smtp.remote-ip=79.135.106.27
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AD5606D818
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2AD5606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaeyeong.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaeyeong.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jaeyeong.cc header.i=@jaeyeong.cc header.a=rsa-sha256 header.s=protonmail2 header.b=dNHUWXtz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaeyeong.cc;
	s=protonmail2; t=1793782246; x=1794041446;
	bh=uCivgI0h3vh+RWF9zWybe8D2nHGtyr7jy67Tn3KDSIE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dNHUWXtzmqm924h2HGx4qSnt52bhbBfd0wRi9GAscXbmZJ6FsfvC3Bm8jrZA2uRta
	 mZ8+jS1nBTMtGSBLhQgtx7Rm5/QUuVd9MR+v5uT8dZ3fQdmJlEdxdPwo6M4z3hr7tt
	 l8n6cLFaXz6X3JyuLIh7N1uM6OV6I86orElws5iBy0Tv244QROTM7rwNXy79nlmDq5
	 MjiJ64GUQronRpAYXTuHkSaFnRZwxHIGRgDbx11qiidWAJL29yraOucR34ZxAWBq7M
	 xHOz3Bf9sp+LO7HO4AGcLKzOFbViR2/n7ojro4A5WhkIXHGHfYArGas8JWxkk718/J
	 yznI32wubhTBw==
Date: Wed, 04 Nov 2026 08:50:40 +0000
To: Bernard Metzler <bernard.metzler@linux.dev>
From: Jaeyeong Lee <lee@jaeyeong.cc>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RDMA/siw: Ignore peer close events on listening endpoints
Message-ID: <179378222423.73361.5194383282780549988@jaeyeong.cc>
Feedback-ID: 177356447:user:proton
X-Pm-Message-ID: 004983994917d98c56b9e4d809bd14795bfd3cd2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A TCP child socket inherits the listener callbacks and sk_user_data before
kernel_accept() associates it with a new connection endpoint. If the peer
closes during this window, siw_cm_llp_state_change() queues a PEER_CLOSE
work item against the listening endpoint.

The worker releases that endpoint without removing it from the listener
list. A later listener teardown then walks the dangling entry, causing a
use-after-free in siw_destroy_listen().

With a listener backlog of at least two, an unauthenticated TCP peer can
reach this path by resetting a new connection before the accept worker
runs.

Ignore close notifications while the endpoint is still listening. Once
the child is accepted, its sk_user_data points to the new endpoint and
close notifications continue through the normal path.

Static analysis identified the issue. It reproduced twice on Linux
7.4-rc1 with SIW over loopback in QEMU. KASAN reported the endpoint
allocated by siw_create_listen(), freed by siw_cm_work_handler(), and
reused by siw_destroy_listen(). The same reproducer completed without
KASAN or lockdep reports after this change on one- and two-CPU guests.

Fixes: 6c52fdc244b5 ("rdma/siw: connection management")
Cc: stable@vger.kernel.org
Signed-off-by: Jaeyeong Lee <lee@jaeyeong.cc>
---
 drivers/infiniband/sw/siw/siw_cm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/infiniband/sw/siw/siw_cm.c b/drivers/infiniband/sw/siw=
/siw_cm.c
index ed49818793dde..518f09a2d37cf 100644
--- a/drivers/infiniband/sw/siw/siw_cm.c
+++ b/drivers/infiniband/sw/siw/siw_cm.c
@@ -1361,6 +1361,8 @@ static void siw_cm_llp_state_change(struct sock *sk)
=20
 =09case TCP_CLOSE:
 =09case TCP_CLOSE_WAIT:
+=09=09if (cep->state =3D=3D SIW_EPSTATE_LISTENING)
+=09=09=09break;
 =09=09if (cep->qp)
 =09=09=09cep->qp->tx_ctx.tx_suspend =3D 1;
 =09=09siw_cm_queue_work(cep, SIW_CM_WORK_PEER_CLOSE);
--=20
2.43.0


