Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636360;
	b=yqaIBdGFPPY4Iywwn7faIHkCYdnC6UW7nUxKFXE7/HmgpIKL1bUK9wa5SfcDt1e7avYM
	 VN5Qzg+5gw12bioE+WnMPKOHZqtp2JxihBFFiOM77ZoNXtK1sE3w3b2X7rVYbBqv5FQbl
	 VPirdojyajaaaUgOT1yv4X1kkLnfpsK6Fg9KvAOoJ+m25XvaCS51RyyusrjQCK5mvEnV1
	 Kq1a/pwZqQV18Ee+6ucU16R/N2g3+1B2KzMhMFMjHUlAH9nlz6syis7DCMl5BUMLZYSke
	 s6mRUMlvevof2KN0qIOPTJjSy8qOKPm8Qsu5P93Drz3JBUu/8euWiGmUBNFDyzBfHcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636360;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JI+2sH+Uu1ZOvGzPhcQFUiy4/8whn4kWR/+yXjsmH2A=;
	b=CcxR+UmUB235PfsDX5YMlg5XaZb9IShC+MU2zaNcLKuFdN9XojU6IwsFk6t3CK1nEks1
	 YVT2FnrO277B1oTMdggX8wRp7+p+slTCFtfPrG4mwfF3vRqDCuXZjMq4sH851mtKpCm4I
	 VTdNbTWloqv5rjkGBfRzqX1iFlXPeCpMP71S7I44b0IG30LuNfASUfv92UsMkOmzG8w2D
	 k+bbgRScuEAnUGdJajCeQVo6/f++/0y0Ogg/zJe/Xz41TJHBSrLBGXcD2aCFDMqVGznwv
	 ZpM6gXEUNzGkzg77RA3aUAl3vNzx0naCe+fJo6MQeyh12vsXlRtnIhbmeHr/bJN6ddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Stc+VYRm;
	arc=none smtp.remote-ip=109.224.244.122
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77629606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77629606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Stc+VYRm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794636353; x=1794895553;
	bh=JI+2sH+Uu1ZOvGzPhcQFUiy4/8whn4kWR/+yXjsmH2A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Stc+VYRmdk8WvDG0TvfGqt/Rea1MEiNvinVj1xNwjTepofmFzfWFjAM83clxcGRr3
	 6QuzEG3y+trxK44DY2dULss2a0IemRcGw0hw7oY4Nb3Bl8wt4b8qj4KMbk+hjGXKp7
	 K2GpE2tkzEaSl1JOVdxVjd4blryn9Kyz0diJLyGogRaRkcK+1QnxOnSKy3x/Rd00yN
	 bjoo4aXMKDlgzZcbQsgym6KJfovKjYB8M1GlUSMjBflFXcLVaLwgJdFuBjo5KhsVBb
	 7E1Do1t2M1RdAWpC1sV0Mxl1NTwK3yUytSBJ/m6EiN93ZZqOTexlFwMUq1zzqPpXQ7
	 yr/P3vgSbGbIg==
Date: Sat, 14 Nov 2026 06:05:49 +0000
To: linux-bluetooth@vger.kernel.org
From: Kyle Pepper <cochcoder@proton.me>
Cc: luiz.dentz@gmail.com, marcel@holtmann.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 1/2] Bluetooth: L2CAP: Restrict LE credits to connected CoCs
Message-ID: <4278a9caf4dc8e949092452c141a5be465ec77e1.1794617024.git.github.filter194@slmail.me>
In-Reply-To: <4278a9caf4dc8e949092452c141a5be465ec77e1.1794550328.git.github.filter194@slmail.me>
References: <20261113030556.75484-1-cochcoder@proton.me> <4278a9caf4dc8e949092452c141a5be465ec77e1.1794550328.git.github.filter194@slmail.me>
Feedback-ID: 97716137:user:proton
X-Pm-Message-ID: 5415ea1f0499e80b9d9d46183518e4f6cb0473ee
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
Changes in v12:
- Reject the deferred ECRED batch when an accepted child closes before
  the connection response; close all siblings instead of disconnecting earl=
y.
- Patch 1 is unchanged.

Previous v11 (no cover letter):
https://lore.kernel.org/linux-bluetooth/4278a9caf4dc8e949092452c141a5be465e=
c77e1.1794550328.git.github.filter194@slmail.me/

Review:
https://sashiko.dev/#/patchset/4278a9caf4dc8e949092452c141a5be465ec77e1.179=
4550328.git.github.filter194%40slmail.me

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

