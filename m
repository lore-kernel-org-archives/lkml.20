Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926984;
	b=YOm2tmS/em8OiWR1AAYauPKHCPQGSpuM0Rr7W9qsRBGHgXk4uYkpXAFBR37wdI7BdkLX
	 5ayPXJWhWsEWnb3Src02/Sz9xkHpbORAxoJ2JoVJcEzj8cma86MY3w/N5FmBLmmTNdmmI
	 tiC8tUQlJZcExECWAy8TlqaZTOucz0s6SA+jwi4Rbg1PbDA2219fpZZN4RShLLwxcfAyg
	 wTJ/bDzhCVBgMahr55bNDbqj46xVxdZyRJnbGEv2p/nFjeoo32wYnSzlwGX4cIsYMdl/h
	 eEpnD27QJUO45szlMMyq49FVBn/igKnKQCPgrIC7GF2/5L1vkTCvs739KyBtB8wrD6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3sTWPUTlwAcUBnRVcL93zdm48VDNuD84VEKeKVBAxRU=;
	b=iiFQt9rUM+p+4TVB2z4fqAL/ixu4gWVOfhTStuJn4EQ7EFKdCqiBXkjPrsfYpjMPgKgv
	 exzqnGo/TwfiHXC681C/mERcTe4e+5+LK/3WIDSm31owSPe8XmNKdga/4OOvA2xO3RmVj
	 dYGL1oZASr/Clni0Hvq8ChihZFdoL+LzHXg334yioojY/+ALXUOhWu2N4P7vOgbTM3Ecu
	 9GgG/iJuVSBmPaUHeWbha/6x7bnc2FE6zyw0eHQ2yHDqJ64+eHDuCjEX7zNxvEpmH7JFz
	 g2WFTpdOKRopLoZg/+OE3tMJS4kEWApJegFvS3m4uNX92SGzn1j/VmNPp5ChY4hpO1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+q9gXIV;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25B9606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25B9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+q9gXIV
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b37951a397so2516057a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794926983; x=1795531783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sTWPUTlwAcUBnRVcL93zdm48VDNuD84VEKeKVBAxRU=;
        b=c+q9gXIVbFD39Pr8RsogKNzLXL/TkHDlBjgA8twtnolwwDOKAYwY22FaeL7L7GcQmM
         vh2kxx4l9EQuoFpxDQuF7i5ePGgH3wsaKcRRfer6sY3hJUk4je7kT0CcPphm4gpbpxoT
         fqA3k2CTrEDLJWWRxniAn2dgRDu/EEhM/0HJLFAds6N6LsARCxA2WJAqSHBmpPcyJAz5
         mk3w3Q50hLq5y3Ys7fBMkH1MUXsFwQzSa6FyyOEUy7wGxwhZmJqpfnUv4aJVt3bwSnot
         XfEUcl596ql9uv/U3iNTbxIydhU3O4GACxrCTNPlUjwv5WL2Stsaph57EvYLLXonsdDd
         HxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926983; x=1795531783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3sTWPUTlwAcUBnRVcL93zdm48VDNuD84VEKeKVBAxRU=;
        b=H0WbvjZnejbFG25Wj/TYDnbdoQ5MR0a8Plc3Po65+bp1IVji2bO0VbZsFmPxVW8pdh
         Z36gzBHF3ufr8vL1+4Z6ARFr5rn3M8OZNEE/OTJRWYQLVTQBhvVkKzqG+K1CS5AWj30S
         3uQkQsaHfix6wOxIevIALmY7fhMk25fQrDIJkQVrzRiOpnryPOzuE4z9r9AGaT+AUqlP
         CCUbSWXF+QYTmayTfizv89RIjyxY+c8hHqjbxXiz/k6VbwYChncEZ65xTOjJ45GE2sQX
         rX9LUqHHf7x4cPKgks86//cZQ7PyVh4nYN9SC6mRYTUgrGr3G45xERoMyh/1nP9oA2QF
         fJ1g==
X-Forwarded-Encrypted: i=1; AL+hErHtWeiZpAiyzQZsjnI1kUsyBnmlhYilHzkrRJkJs7nGCsDO9UWNoWWXPQwFYgSszjjBBprT85au5vCB3ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nu2JHoOzJhzeH7aDsCfINTPp1GVhY94zbjna3CAgmC0aJw05l
	Z1SJs0QwDCQcRJah/JGb+S8PgT6iN0Vee6cuiZ+nNJWP8jbj4EcRtV42e3an9g==
X-Gm-Gg: AZFdTZd2I0umsLoZI61ZQ7YAkuuTkfy6285rVaU/mturlphLey/nIeuPjecHgVK5iWg
	2f2fO8X2cuMY/c+wK8nF+NuVZ9DcxDt9k1LkCH7G/9hn6PmdddUES4y3bQjxDp+YEbvmgHVl2ei
	KpaUtg3DMQRV9anjIgCBx6u+mcSC2FK73xP7+/myDbHfH7xpLBdV5BLL9H7YecIRqSP/+QaNasH
	SIO9lhtr16lEqJ9Thx43PDSv9w6wQSOWsrxvh8JNTzVGw9jHpjhntbTScayaa9DO0E0qAwvzwB2
	5j6bZfjz9eKT7E5MdJ4vKcacGyAjedL7SBaXQvYRWXkG9i2hT/BE2DX1V4m0/YYbBFCrL6ZOrO3
	yRshBM8aeb/zgBTtwYWXHOX7mpxwEnqsX+W4WKHOU7bPSJRqzudj9/8V26s0RyU6f7KawVXlNPe
	ctDs6i37/z4t6awLUfDtDleKeDGjnmP8hOEhqhNDdTnQS2EiRrG+IhTGeXtwfyVG7OTBALO5Aww
	qEgXT8IOIwgez389YIxrXCG+RHPr3PXa7rU36KIigql9zcP/Ctt5cUmg8XSQuDnB3LGjrMokaub
	qg9HB28IHxwPPZwXFAwQDTvW/qvASQ==
X-Received: by 2002:a17:90b:1dc8:b0:3b1:12ba:867e with SMTP id 98e67ed59e1d1-3b1b0b5b550mr14590958a91.13.1794926982909;
        Tue, 17 Nov 2026 06:49:42 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac1:7ac0:50::498:83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3b6da0fa8sm3491697a91.9.2026.11.17.06.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:49:42 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stig Hornang <stig@hornang.me>,
	syzbot+9dc8780713b11155dd74@syzkaller.appspotmail.com
Subject: [PATCH v2] Bluetooth: L2CAP: return LE credits from recvmsg under the conn lock
Date: Tue, 17 Nov 2026 21:49:37 +0700
Message-ID: <20261117144938.82299-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115115341.316484-1-ngocthang2710.1999@gmail.com>
References: <20261115115341.316484-1-ngocthang2710.1999@gmail.com>
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

l2cap_chan_le_send_credits() allocates an ident from conn->tx_ida, sends
L2CAP_LE_CREDITS and frees the ident right away, since the command has
no response. The RX path frees idents in l2cap_put_ident() under
conn->lock. That only works if the credits path holds conn->lock too,
so that no response can be processed between the allocation and the
free.

The RX path does, but l2cap_sock_recvmsg() calls l2cap_publish_rx_avail()
-> l2cap_chan_rx_avail() -> l2cap_chan_le_send_credits() with only the
socket lock held. If the remote answers the credits packet with
L2CAP_COMMAND_REJ, l2cap_put_ident() can free the ident first, and the
credits path then frees it again:

  ida_free called for id=3 which is not allocated.
  WARNING: lib/idr.c:594 at ida_free+0x24c/0x2d4 lib/idr.c:594
  Call trace:
   ida_free+0x24c/0x2d4 lib/idr.c:594
   l2cap_chan_le_send_credits+0x17c/0x29c net/bluetooth/l2cap_core.c:7113
   l2cap_chan_rx_avail+0xb4/0x134 net/bluetooth/l2cap_core.c:7126
   l2cap_publish_rx_avail+0x110/0x168 net/bluetooth/l2cap_sock.c
   l2cap_sock_recvmsg+0x280/0x7b8 net/bluetooth/l2cap_sock.c:1317

The same unlocked call also updates chan->rx_credits and reads chan->sdu
concurrently with the RX path.

Publish rx_avail from recvmsg under conn->lock and chan->lock, taken with
l2cap_chan_lock_conn() as l2cap_sock_defer() already does, before taking
the socket lock to keep the conn->lock -> chan->lock -> sk_lock order.
Assert conn->lock in l2cap_chan_le_send_credits() so that an unlocked
caller is caught by lockdep.

Fixes: 6e1930ece855 ("Bluetooth: L2CAP: fix tx ident leak for commands without a response")
Reported-by: syzbot+9dc8780713b11155dd74@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9dc8780713b11155dd74
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2:
- Drop the untracked cyclic ident from v1: it could collide with the
  ident of an in-flight request, so a REJ of the credits packet could
  free that ident and close the waiting channel (reported by Sashiko).
- Fix the root cause instead: return credits from recvmsg under the
  same locks as the RX path. This also covers the unlocked
  chan->rx_credits / chan->sdu access on this path that Sashiko noted.
v1: https://lore.kernel.org/all/20261115115341.316484-1-ngocthang2710.1999@gmail.com/

Tested in QEMU (x86_64, KASAN + lockdep) with the syzbot C reproducer,
15 runs per kernel on 666539eecdf4, credits counted via dynamic debug:
  base:    10191 LE credits sent, 49x "ida_free called for id=N ..."
  patched:  9330 LE credits sent, no warnings, no lockdep reports

 net/bluetooth/l2cap_core.c | 3 +++
 net/bluetooth/l2cap_sock.c | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 7dcb0586a10b..12794af1cba4 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7099,6 +7099,9 @@ static void l2cap_chan_le_send_credits(struct l2cap_chan *chan)
 	pkt.cid     = cpu_to_le16(chan->scid);
 	pkt.credits = cpu_to_le16(return_credits);
 
+	/* Keeps l2cap_put_ident() from releasing ident before we do */
+	lockdep_assert_held(&conn->lock);
+
 	ident = l2cap_get_ident(conn);
 
 	l2cap_send_cmd(conn, ident, L2CAP_LE_CREDITS, sizeof(pkt), &pkt);
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index e5c15c083c1a..3db1608dd71a 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1292,6 +1292,7 @@ static int l2cap_sock_recvmsg(struct socket *sock, struct msghdr *msg,
 {
 	struct sock *sk = sock->sk;
 	struct l2cap_pinfo *pi = l2cap_pi(sk);
+	bool have_conn;
 	int err;
 
 	if (unlikely(flags & MSG_ERRQUEUE))
@@ -1312,9 +1313,12 @@ static int l2cap_sock_recvmsg(struct socket *sock, struct msghdr *msg,
 	    pi->chan->mode != L2CAP_MODE_EXT_FLOWCTL)
 		return err;
 
-	lock_sock(sk);
-
+	/* Returning credits must be serialized with the RX path */
+	have_conn = l2cap_chan_lock_conn(pi->chan);
 	l2cap_publish_rx_avail(pi->chan);
+	l2cap_chan_unlock_conn(pi->chan, have_conn);
+
+	lock_sock(sk);
 
 	/* Attempt to put pending rx data in the socket buffer */
 	while (!list_empty(&pi->rx_busy)) {
-- 
2.43.0

