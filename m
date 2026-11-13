Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539172;
	b=njX2afKq9z7cHSt9Ubno+7tqDroeN+X9EDrA1nMZElQ9A8QZJj3C/A1e1tVXuM4TR5aS
	 7glCer9zZ769mTZnF/RVHpIa1UjKDLVOgR857G8X62NwUUzTKHQh4Geb4gFK4FuTU/nbc
	 ZmuDjdxN3te5/RFv+btDVrg5cMYHhSbzb0Ls3Lhd9CgtxeFEtAkgK3YZOAdG5xnkzsUGK
	 fGs0XV6JZPSgjy8yvhtYhyF4OJfiQJPgtrb1M02sbu9sC6cgrjQ3hKhcUSqeQ6AZkSPC6
	 Qdsqa9iwPKmSlO7ZQ/nG6kDsfj54jezfInA8s9yYiG329oFqwOGoTz6DaFscLZeFJzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539172;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WHnWYm6okEfZAdbFVv9Aii9Xt7prcdOzbKX8GUWiBkI=;
	b=Yz2+ox1Oj7LZKecNg1mbbXmblY0NnxoWmf0MZGkCQCK4NXgLOKF98hWleFr/OBoB9lZd
	 /hcnF1WaAEx6JnJvp0b/Dhjmu8YwQcTckHRUiJuGLSo//hThW8yQVJ4iscU/IxWqbJ30q
	 iLwnKMmcycd1cmqbiWMx58OJ7G4E0gyYdXRUWhNXaIw7vADaWQM2ZBbXTDu5QECBM9l1V
	 tepgf6NUvVRqyfukr8VWEG+li7fN8Lywns1hiUAl7DO0YgsmubCvWJ0Go87n/+GW51Xx3
	 Bo9b6bAbOuepDGjyh4QvFJAnl80IKeBH4qf5XxbBDZ/W4ekcJQOnXn8Gn/GktokqQUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=v4MgdGEN;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10DC606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=v4MgdGEN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794539170; x=1794798370;
	bh=WHnWYm6okEfZAdbFVv9Aii9Xt7prcdOzbKX8GUWiBkI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=v4MgdGENzPpyxTk4llk1zDEIO+iU7YVwaEvGMmHDWFDdePbYvu92y7Wpiv9aGzuHL
	 XFa0nr+vR0KIx8keDM46lL8aXuYA2py5okY7JtkDmcxdqb8V+M+KhuapKPw6EcHzFg
	 xu1gQvC+1DCr3Bz6Yix39Zu7yzzMvpST6yHQWjK1gME8UhRwL0lPtwxTV7/DY8H4uV
	 5doMHF3/DhiWJDnAjUylWC3fmUwO3HdkYElDXLLiKrB/GOtvnopzdkf+NaGg+yjqRG
	 gTExUWXM9oTGZ91P8Dnf7ADhS2p+acx3DsH4TNLkRDyMqa9rvvZdlbDFYP1kOs4BKr
	 NjFWel6trv23w==
Date: Fri, 13 Nov 2026 03:06:06 +0000
To: linux-bluetooth@vger.kernel.org
From: Kyle Pepper <cochcoder@proton.me>
Cc: luiz.dentz@gmail.com, marcel@holtmann.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/2] Bluetooth: L2CAP: Restrict LE credits to connected CoCs
Message-ID: <20261113030556.75484-1-cochcoder@proton.me>
Feedback-ID: 97716137:user:proton
X-Pm-Message-ID: bbe3b649a5c1ceaa66c36c96960db03bad2c5c1a
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

Do not let credit indications change fixed channels or complete pending
connection setup. Validate the channel state and mode before accounting
credits, checking overflow or invoking its resume callback.

Fixes: fad5fc89594d ("Bluetooth: Add LE flow control discipline")
Assisted-by: LLM
Signed-off-by: Kyle Pepper <cochcoder@proton.me>
---
Hi Luiz,

I split the credit validation into its own patch and reworked the security
handling to use the existing HCI workqueue. There is no new workqueue or
pairing timeout. The original l2cap-tester and smp-tester now pass without
changing their expectations.

I also checked failure handling, repeated security
requests, key refresh and deferred LE/ECRED setup so fixing that bypass
doesn't leave sockets stuck.

Hopefully this brings the patch to a more usable state.

Thanks,
Kyle

v10:
- Separate malformed-credit validation from security request completion.
- Use the existing HCI workqueue and SMP/HCI timeouts.
- Keep pending upgrades gated through failure, refresh and deferred setup.

Previous v9: https://lore.kernel.org/linux-bluetooth/20261112022948.187618-=
1-cochcoder@proton.me/
Threading uses the Message-ID from sent mail; the archive lookup is not yet
available. Luiz's reply Message-ID was not supplied.

Validation: original l2cap-tester 111/111 and smp-tester 8/8; 27 private na=
tive
cases; GCC/Clang/ECRED-off W=3D1 builds; 42 modeled cases per compiler with
ASan/UBSan and 10 expected mutation failures. Guest tests use emulated
controllers and checked module identities. Physical hardware, PTS, KCSAN
and remote CI were not run. Private fixtures and traces are not included.

 net/bluetooth/l2cap_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 09ff32394..4e8aec98e 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -5464,6 +5464,11 @@ static inline int l2cap_le_credits(struct l2cap_conn=
 *conn,
=20
 =09l2cap_chan_lock(chan);
=20
+=09if (chan->state !=3D BT_CONNECTED ||
+=09    (chan->mode !=3D L2CAP_MODE_LE_FLOWCTL &&
+=09     chan->mode !=3D L2CAP_MODE_EXT_FLOWCTL))
+=09=09goto unlock;
+
 =09max_credits =3D LE_FLOWCTL_MAX_CREDITS - chan->tx_credits;
 =09if (credits > max_credits) {
 =09=09BT_ERR("LE credits overflow");

base-commit: da3cc02587c629420603df4395179ec82955c941

