Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B1E382394
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853336; cv=none; b=gfp3vhoUPPzOd8IW3j1KYtt7zXIrB2CpKVl9dv9cvP/KNq5bmGTtuvm8WccefBkRf6QJE4TkAq/pYmf+5LW5p2NYm/nE6ANYtAPbMQJivKHMua7f89C11lAy/HmXjdPDwGJXPaqjPIWp++mScOW8IrH8EYqs9XH8wt/nmTstIyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853336; c=relaxed/simple;
	bh=Ibtw12s8mFManBwzDCksjfYuvEvta8bAf2BA0lUL14M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZ/wWBmH8Kou0bUrLIahuV+NI+Wo2oladddB15Uhncc+BtkTFduxv8TSl8ex+H6o8fPAH6TIZidCgUPNo9U1eT4QfhS9aPtpX1Pfk5A9aFZu6zRUwXZ2/h5otJ+G4uZR8xo0KY/hDy6UpyqOTPKA/vulFTRzM1YdAKMdiRaAyhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ap9NDSrL; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ap9NDSrL"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fbef5018so23641175ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853333; x=1790458133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bL5cT666wm0sO8jk/Y9tDzXT395cNpb913zhgg5Jun4=;
        b=Ap9NDSrLwZuyYha3Iv/Y4GqCpUPuqz1oPPPzwOf6ckB4pHm3djnmaGXkNJoVvt3RjS
         wYICgKmWaqlNKv+fTFB1DJJQiqeYOKe94UYCwqfaXqDocIrNrwFGzRtpESJFedIfEhLv
         H6J/qPLVwwsOCvoBUTMDizFqu1XSJhtriAL7DnfR54+MaZDmlHNjHvPGTWE/jxcpStPU
         MDVSqiFwe+X6qHzHogcru/TLNG/YiToaeSszDkiI369cEBq2j9wjW2RtjvjVkpw0/ATJ
         9Z6DY1eJ03ntuTMnjTRC24Ism6V4OrW4nBqW4EIAzm6k6MpQ5Id41ZYbmsm3uf4SCTrm
         SFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853333; x=1790458133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bL5cT666wm0sO8jk/Y9tDzXT395cNpb913zhgg5Jun4=;
        b=G1tAnjiQM82sy9r8GyvplnaAeNUd5LN0FFJ3BN1DNju9B2uZNmnmTb4aGKt79g6tkx
         8F2Xi3u59jD3K6JNbygazqPBuj1y8/L9Kl4cDKu66xhfpBgMQzWCIVcprxOZCUDy1U1c
         d4y5cpp/4QJ+mTUF+HUmX9z92Ta+VWMptXCO8PcE/HQ7AHUXQdscr7rJQgySo9mmATJJ
         /X+ZZ4ujMudDFhWleKRTVJsTmj5oSNel3Dkm3pIhCYywUAsoLjbcYaw1XOyoDjVYk6WO
         lQ5w0MnFx5HQ9A70liwXcZnnsvXZl1nG8fcL7pmyyh4FY6fUt5C2B50/cdwK33Cx6shD
         8Fkw==
X-Forwarded-Encrypted: i=1; AKwUvBxEoMMojrYF2HGR5y1T33Kam4+j2iSU2KI9XXxIiEEFc9vzCq1mqDDW/yL+5OH53WwIp6WjUKHZKtux4/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lJKX0lwX1Q7TgWs0rqqMpFEenDH7WNoopPVzicyEiG8supGBKI
	D9y6pQxmtFMVfJqtxn6NYWcxUDoPbZ4Vq6vbTRZlMzJdhIuQVp1ZWKJg
X-Gm-Gg: AYBFou2MtVypxyuQvXUPW4kTHYxop60+9YH5C+4kqWgM+XmVWJiZxyFw1GSjHyctC3G
	uV4C41+qctDSPKb07B4XV1Cpbi6JIWyqiahDzxMlXGaL7jT8htpWBHXr1SROiSjSGRUU+hHdpm3
	JbAXQRFZAt0M3b8cQr9BPudNyp9ItfBADtZ1E0HfVaTKuUkpwsLur+G8Jq82R5ePqQBEqy+oKvB
	J0WIxrz2LkZvwMwUjUWK0A9ePtEeU9+TzhebwvjqFEZ6HdQXJjn0AU0l0dy+msX6HQrr65KaW52
	LcDSCZkmMfFlX0DvWftuy9O2kDA5hMWGfTAXgn9BH4/MNf7ij41IB1L0Erb4e+RKzaW9/O4GkmA
	oySM29Gj3rAeumZNxiT0if/FVNyNF96VfJqj+iXeXH1xOG5y8A1qYdRWWGvP4kotXtMxG3Mcsws
	0RcYi0v+z905DMjFb9tdfnYKg9BroaCUt4sBxVmoAHkg5mPTNgbk/4TdmVfQBZqSYrWY+u/y0Ey
	Q2119Q1X+N9DAlIUdnm3C58ifrA94aEXNYF5MXRPg1/A8IiRpBNmqwXAk8SHDlMAOrcwTCi3ZzA
	3CqmMJeobQ==
X-Received: by 2002:a17:902:f545:b0:2df:3f0f:d65 with SMTP id d9443c01a7336-2df3f0f0e1bmr2084335ad.22.1789853333426;
        Sat, 19 Sep 2026 14:28:53 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b4a3fsm13003765ad.8.2026.09.19.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:52 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: courmisch@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phonet: pep: fix out-of-bounds reads in pep_ctrlreq_error() and pep_sock_accept()
Date: Sat, 19 Sep 2026 21:28:52 +0000
Message-ID: <20260919212852.3240704-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three packet-parsing and locking bugs in Phonet Pipe End Point
(`net/phonet/pep.c`):

1. In `pep_ctrlreq_error()`, `oph = pnp_hdr(oskb)` is dereferenced at
   `oph->pep_type` (`oph->data[0]`, offset 4 from `pnp_hdr(oskb)`)
   before verifying that `oph->data[0]` lies within the linear `oskb`
   data area. When called from `pep_do_rcv()`
   (`PN_PIPE_INVALID_HANDLE`), `oskb->data` still points to `oph` and
   only `pskb_may_pull(skb, sizeof(*hdr))` (4 bytes) was checked,
   causing `oph->pep_type` to read 1 byte past `oskb->tail` and echo it
   back to the peer in `PNS_PEP_CTRL_RESP`. Ensure `pskb_may_pull()`
   covers `(oph->data + 1) - oskb->data` bytes (and `sizeof(*hdr) + 1`
   in `pipe_do_rcv()`).
2. In `pep_sock_accept()`, `n_sb = hdr->data[3]` is read from the
   `PNS_PIPE_CONNECT_REQ` header, but `__skb_pull(skb, sizeof(*hdr) +
   4)` is omitted before the `pep_get_sb()` loop, causing `pep_get_sb()`
   to parse the 8-byte `pnpipehdr` and connect-request header as
   sub-blocks, and `PN_PIPE_SB_ALIGNED_DATA` reads `data[0]` without
   checking `len >= 1`.
3. In `pep_setsockopt()` (`PNPIPE_ENCAP`), `release_sock(sk)` is dropped
   around `gprs_attach(sk)`, and `pn->ifindex` is assigned afterwards
   without re-acquiring `lock_sock(sk)` or checking `SOCK_DEAD` /
   concurrent attachment.

Fixes: 9641458d3ec4 ("Phonet: Pipe End Point for Phonet Pipes protocol")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/phonet/pep.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/net/phonet/pep.c b/net/phonet/pep.c
index bd1cdd00edfa..5511770bb21c 100644
--- a/net/phonet/pep.c
+++ b/net/phonet/pep.c
@@ -192,15 +192,21 @@ static int pep_reject_conn(struct sock *sk, struct sk_buff *skb, u8 code,
 static int pep_ctrlreq_error(struct sock *sk, struct sk_buff *oskb, u8 code,
 				gfp_t priority)
 {
-	const struct pnpipehdr *oph = pnp_hdr(oskb);
+	const struct pnpipehdr *oph;
 	struct sk_buff *skb;
 	struct pnpipehdr *ph;
 	struct sockaddr_pn dst;
-	u8 data[4] = {
-		oph->pep_type, /* PEP type */
-		code, /* error code, at an unusual offset */
-		PAD, PAD,
-	};
+	u8 data[4];
+
+	oph = pnp_hdr(oskb);
+	if (!pskb_may_pull(oskb, (unsigned int)((oph->data + 1) - oskb->data)))
+		return -EINVAL;
+
+	oph = pnp_hdr(oskb);
+	data[0] = oph->pep_type; /* PEP type */
+	data[1] = code; /* error code, at an unusual offset */
+	data[2] = PAD;
+	data[3] = PAD;
 
 	skb = pep_alloc_skb(sk, data, 4, priority);
 	if (!skb)
@@ -377,6 +383,8 @@ static int pipe_do_rcv(struct sock *sk, struct sk_buff *skb)
 		break;
 
 	case PNS_PEP_CTRL_REQ:
+		if (!pskb_may_pull(skb, sizeof(*hdr) + 1))
+			break;
 		if (skb_queue_len(&pn->ctrlreq_queue) >= PNPIPE_CTRLREQ_MAX) {
 			sk_drops_inc(sk);
 			break;
@@ -823,6 +831,7 @@ static struct sock *pep_sock_accept(struct sock *sk,
 
 	/* Parse sub-blocks (options) */
 	n_sb = hdr->data[3];
+	__skb_pull(skb, sizeof(*hdr) + 4);
 	while (n_sb > 0) {
 		u8 type, buf[1], len = sizeof(buf);
 		const u8 *data = pep_get_sb(skb, &type, &len, buf);
@@ -836,6 +845,8 @@ static struct sock *pep_sock_accept(struct sock *sk,
 			peer_type = (peer_type & 0xff00) | data[0];
 			break;
 		case PN_PIPE_SB_ALIGNED_DATA:
+			if (len < 1)
+				goto drop;
 			aligned = data[0] != 0;
 			break;
 		}
@@ -1048,8 +1059,16 @@ static int pep_setsockopt(struct sock *sk, int level, int optname,
 			release_sock(sk);
 			err = gprs_attach(sk);
 			if (err > 0) {
-				pn->ifindex = err;
-				err = 0;
+				lock_sock(sk);
+				if (sock_flag(sk, SOCK_DEAD) || pn->ifindex) {
+					release_sock(sk);
+					gprs_detach(sk);
+					err = -EINVAL;
+				} else {
+					pn->ifindex = err;
+					err = 0;
+					release_sock(sk);
+				}
 			}
 		} else {
 			pn->ifindex = 0;
