Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743628;
	b=sz2K8e4kj2syHkwbaRhuilMr/yiVROJAU5T7RMhKXFFsv7h55HsZKGxBlWpMDpdF27tC
	 ZvjqTdQ0xK97NcqKVon8lPvHyZ7ZLrSD6+NVIw/TqG0r5Zko29hFB3zkgHbrwd22UL4jl
	 PPXaGMCX6O6DGYZMYdmrNPL7AgLUIGnRJMfswBoRMJl/nO3F3TzxkM8fl73xplwtgNHTE
	 qBJqjsnb7GRbw5IpxUCw9HZlbQ5jk54sHs9XHaQcVcp1coSaQEG/O8d+WUH21fcmIH6Am
	 OO87wiZguhc98S7X7JOF00+7vJxSQ7rjZeYnUlmk8RDm7SeUm2arpHMQviLkltvQQjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UWkGir4qU1HOXBM7UDVrmvnooNoUjfmfTGYPX9mWWvE=;
	b=q1pm7Ui1VMRo2GWb4qx45j39wbyZ81V5/P84ZGzH3XtVirNp2dKO64DlJHha0CryFiKF
	 o6hty+MTd8zFhsFV5FxNQPvpbzlAeOZiS7+QM7I6KtEksgbhHKS3WKJ+p3uxBreBQetnN
	 0IgF6rcdV2k9+2/QY/an63XxodU1vZZt7++v/2/lVvpmUM7jwAmlq6Ga8wEWtsNcB3fsz
	 FApcxQexyEiYtnZq4yAhwNSsA7WB5Cu8lWLnjaxfYFzaDr3nAX74aWwmTy0LGARge/XzL
	 Ndci/hhm59dRYjrgWR1sSYLy4uydLdkJQBv6Q+8nj5FIGpDZZcu2HOXc42rPyBHwxQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VO+dgxIU;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082E606A880
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4082E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VO+dgxIU
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso3029189c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743627; x=1795348427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWkGir4qU1HOXBM7UDVrmvnooNoUjfmfTGYPX9mWWvE=;
        b=VO+dgxIUum2TwF1DQuOZn5OCDMRCH0TY8ifUfWx6Sx67aY5+ZsAGrlVeNJ/ABdEtxo
         hxoi+e+LKb4AkMCq6G2J2L91YfDtq6WMOV3JwkI0FmCNRjVU+5XlP4diOamSZF6ZqaaM
         e2YVJ9dtw4mk7YvLFHClS/S7TiSCZT+D0nzmNKlTFIbtU7lNMF8EhEKH243Ys455w6xG
         156q0wYjd4A8X2O1Iu0nOLP0Cbsez65FyS8qftwRoDyt7gixJrCG91yKI2Sh8ZFWAdvM
         Q0MMaT1Q6ZVIVyqO6nYgzlwybHe+kL8RGypnhVv9h4CQhug8jobOwRAP9azSsk4PEg/9
         Iw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743627; x=1795348427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWkGir4qU1HOXBM7UDVrmvnooNoUjfmfTGYPX9mWWvE=;
        b=SCWiGGDcjxCwABK5tBUrSAeVbqlrao2Xv1NVYuVIoNyoEilw153RypGlZ9ghL2ieFn
         lCSVMpH+QjfLckY4hIuKOXKcU2xeW1Tm9K3gc0P3/hmOzGwopwm4kiJyg6mQxaWRUsNL
         aWCAmusVK7C6uSnW+8my63AAMpboPBrfIRNkLu1eRPockNQJ+bidN6TqL/h9VfVl40Pv
         rydXfGckDIOB650I5t7jWQ5sLxiftJ/KR6AKOpZQB4Z8JWMwj6nNjI2mD39WiPHvUAzs
         Fgo1m6W/EFmMrnMvmPdgtOVMjxXH3Q/sSUOM47OpTGo85rz/6r3/XGl0c2eZLj3oE5w0
         /bgQ==
X-Forwarded-Encrypted: i=1; AL+hErGWEWsj0o6+XOf84jf9fMAsPbOgttyzZWGKD9TsDk9Z5UR/ka3aXNVGfySwy8fqhVyElkuNh0dMctgr5ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ajBBflGc1F8LLC9iAU09D2P+V9+L57ZZu/AO7Xeauhx1RoIeW
	un8vATJB2wYLyoPxuAor6uYeczDfR0lwAHj1yUZ+Zy040/1cdkskPwUyq2dhTg==
X-Gm-Gg: AYBFou3ZleAH8AZB/Sg5x3+s7uqnkuRDzAmFBgTNjML3he2sAWpccufN9Kexma2u/Gz
	JcF3vZkWveYBVnUpMsNODxe/UffCmnwYw7KMsVKkxNZs6Kg+bC3+30liQ2m+4mv4cpe4ZAdPdx3
	rj8aPwK/+ixxF+ljMV7zIZgUYjEjWD312aIgQYEn4NBGIZqwkIZkNCMi5OMHN0vwtw4BtrFbHqc
	s3Ja+IyhLhjGTvA8sizURba3rXYjLObuQZuTqEjm9geOpbrlLJyPbnJEufBLoL8eDLvGAjfcYmP
	L5oeQa7ec3ZwVwvfdhiqKL3JqWWq53PAvAtE9bmmvc8md+2LWDOc2t8fHKbI/+56IHsZp1+8sSk
	hNZ9308FAbMzFHvvmqO2OMj5/NqYVoZTK2aP6JEnaZ6MXeqxT39prFEpA1VWKqLGzaGMamhyJwj
	TvLVSPSbBe/h82XHQ6FKLZEbD1xDAdqg/AzXiqPV4JFdCDcjRCoDZFWf/pAhZ9fSjWzi3MJMNQK
	T3GP8aiKLKIS8lunOvPWEjIf/2kuVeMPPgdOqHG4fUg2RkveE5o+4WSZ1vzNtVBhWArWBbBfMY3
	mTa2cr09HOtUBmAIgExB2hbt064m
X-Received: by 2002:a05:701b:2083:10b0:145:287:ce91 with SMTP id a92af1059eb24-1b50314bef1mr8426787c88.14.1794743627152;
        Sun, 15 Nov 2026 03:53:47 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d45c:e6::17:34a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm21722845c88.15.2026.11.15.03.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:53:45 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stig Hornang <stig@hornang.me>,
	syzbot+9dc8780713b11155dd74@syzkaller.appspotmail.com
Subject: [PATCH] Bluetooth: L2CAP: don't reserve an ident for L2CAP_LE_CREDITS
Date: Sun, 15 Nov 2026 18:53:41 +0700
Message-ID: <20261115115341.316484-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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
L2CAP_LE_CREDITS and then frees the ident unconditionally, since the
command has no response.

But the ident is visible in tx_ida while the command is in flight, and
the remote may answer it with L2CAP_COMMAND_REJ anyway. The RX path then
releases it in l2cap_put_ident() under conn->lock, while the credits path
runs from recvmsg() with only the socket lock held. Whichever ida_free()
comes second hits:

  ida_free called for id=3 which is not allocated.
  WARNING: lib/idr.c:594 at ida_free+0x24c/0x2d4 lib/idr.c:594
  Call trace:
   ida_free+0x24c/0x2d4 lib/idr.c:594
   l2cap_chan_le_send_credits+0x17c/0x29c net/bluetooth/l2cap_core.c:7113
   l2cap_chan_rx_avail+0xb4/0x134 net/bluetooth/l2cap_core.c:7126
   l2cap_publish_rx_avail+0x110/0x168 net/bluetooth/l2cap_sock.c
   l2cap_sock_recvmsg+0x280/0x7b8 net/bluetooth/l2cap_sock.c:1317

Worse, if the ident is reallocated for a real request in between, the
credits path frees that request's ident instead.

tx_ida only exists to track requests awaiting a response, so a command
without one has no business in it. Give L2CAP_LE_CREDITS a plain cyclic
ident instead, which never needs releasing. The ident is still never 0
and never exhausts the range, which is what commit 6e1930ece855
("Bluetooth: L2CAP: fix tx ident leak for commands without a response")
set out to fix.

Fixes: 6e1930ece855 ("Bluetooth: L2CAP: fix tx ident leak for commands without a response")
Reported-by: syzbot+9dc8780713b11155dd74@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9dc8780713b11155dd74
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU (x86_64, KASAN + lockdep) with the syzbot C reproducer,
15 runs per kernel:
  base (origin/master 23c62304dde2): 31x "ida_free called for id=N ..."
  patched:                           0 warnings, 1200 LE credits sent,
                                     none with ident 0 (ident wraps fine)

 net/bluetooth/l2cap_core.c | 44 +++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 7dcb0586a10b..0b861ced5703 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -1028,21 +1028,36 @@ int l2cap_chan_check_security(struct l2cap_chan *chan, bool initiator)
 				 initiator);
 }
 
-static int l2cap_get_ident(struct l2cap_conn *conn)
+static u8 l2cap_ident_max(struct l2cap_conn *conn)
 {
-	u8 max;
-	int ident;
-
 	/* LE link does not support tools like l2ping so use the full range */
 	if (conn->hcon->type == LE_LINK)
-		max = 255;
+		return 255;
+
 	/* Get next available identificator.
 	 *    1 - 128 are used by kernel.
 	 *  129 - 199 are reserved.
 	 *  200 - 254 are used by utilities like l2ping, etc.
 	 */
-	else
-		max = 128;
+	return 128;
+}
+
+/* Ident for a command that has no response: it is not reserved in tx_ida,
+ * so nothing has to release it and it can't be released twice.
+ */
+static u8 l2cap_next_ident(struct l2cap_conn *conn)
+{
+	u8 ident = READ_ONCE(conn->tx_ident) % l2cap_ident_max(conn) + 1;
+
+	WRITE_ONCE(conn->tx_ident, ident);
+
+	return ident;
+}
+
+static int l2cap_get_ident(struct l2cap_conn *conn)
+{
+	u8 max = l2cap_ident_max(conn);
+	int ident;
 
 	/* Allocate ident using min as last used + 1 (cyclic) */
 	ident = ida_alloc_range(&conn->tx_ida, READ_ONCE(conn->tx_ident) + 1,
@@ -7081,7 +7096,6 @@ static void l2cap_chan_le_send_credits(struct l2cap_chan *chan)
 	struct l2cap_conn *conn = chan->conn;
 	struct l2cap_le_credits pkt;
 	u16 return_credits = l2cap_le_rx_credits(chan);
-	int ident;
 
 	if (chan->mode != L2CAP_MODE_LE_FLOWCTL &&
 	    chan->mode != L2CAP_MODE_EXT_FLOWCTL)
@@ -7099,18 +7113,8 @@ static void l2cap_chan_le_send_credits(struct l2cap_chan *chan)
 	pkt.cid     = cpu_to_le16(chan->scid);
 	pkt.credits = cpu_to_le16(return_credits);
 
-	ident = l2cap_get_ident(conn);
-
-	l2cap_send_cmd(conn, ident, L2CAP_LE_CREDITS, sizeof(pkt), &pkt);
-
-	/* L2CAP_LE_CREDITS has no response so the ident is never released by
-	 * l2cap_put_ident() - release it right away, otherwise the tx_ida
-	 * range is exhausted after 254 packets and from then on credits are
-	 * sent with the invalid ident 0, which some remote stacks ignore,
-	 * stalling the channel.
-	 */
-	if (ident > 0)
-		ida_free(&conn->tx_ida, ident);
+	l2cap_send_cmd(conn, l2cap_next_ident(conn), L2CAP_LE_CREDITS,
+		       sizeof(pkt), &pkt);
 }
 
 void l2cap_chan_rx_avail(struct l2cap_chan *chan, ssize_t rx_avail)
-- 
2.43.0

