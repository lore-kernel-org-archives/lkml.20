Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187281;
	b=3nH0t18gpwOvdX8zt+BSmlLkNP8FWlIqr3oIclbUFJqJ2ZhpM+NC/O2Cbd74Gc4dR3e+
	 w0TlsbfazE0YS+U9VQnKYB4IIJ4SMFStLMBWd0qrwycqp6KIhFnUSSEaR9ZRHFjKVt+h5
	 ceT33yiWIKQZjgzuvKxFP/pgmeg4v+QINCQfpmEeaM2FlZQVg87229+0dXvIfSUasNu6O
	 Et8aOeed/iNMf5Se+YHAMMTqZ8kwAGurk/aB7RgltTLkDVTyqyLIN+rV86ZycocfXQMRI
	 n4jjsEL3+lgYXqYprIP4VlFoPgLs67WnvKtMx1FfGgaFz7HuTAY8VcFTIjoA6QinqKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sifTHNrNa2DBCU4nC4S+i036dPkRsfarMXgVCAWsh+8=;
	b=UqFYMBD1go2BTAK3wQ8DItk1t273KsMQITTbuqal8wfIwvs7Yd/YY9gGRUNL2x/tgpUi
	 dk2wx1rtbcGUemutxcrPM8tWOpDlFqm/o4rFFtiuFhOU5xZdT8G5fBRKQnYhbxIt9scAu
	 4ix9sf0YO3mY3Ax5t2dsFAIHJO49Xmopoz308aTy70a1DPQI25UGmmCzbn+P68pvWVn3Z
	 UQjFNH7ZSCy+b6ZEuJuOXnN8uIwidKj38NrCp/U3PV3zjX5t6yEbLsrEfFxv624itG++K
	 l94oopzOErt+1i1YnDev+i12OZqM188sv7QLKFfC/R5fB5c9iPWhH72IkoslRVCJZEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q14AXqh9;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09C606D81F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C09C606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q14AXqh9
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb628232d2so187572a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794187280; x=1794792080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sifTHNrNa2DBCU4nC4S+i036dPkRsfarMXgVCAWsh+8=;
        b=q14AXqh9xNV12Rolio433oMvftZSMOru0V9VbHpTqATO1pla1rbJVbGuCzwKP1rPOJ
         SXYoTB2Q/P/fJm80nN3G9ii6alzMHnlBRhlSFOkszdL01U2z6XYIZJm0q0IKEJr3PrJy
         dVkFP9qeEC4FZSDSDMB75jBSixndq8U1ABACqQm1nqPby1MztHB70gJuiWBZy6cNFafD
         9wVz5insjz3dKRTOgRpKkIb9Ogal11lQWplcAK2HTlWEwjYgl6uG2nBYQduYu0+vNHQe
         /eIgl+RRGMI1c2H1u/wZMQNrs/f2QBR2CNK84xCTvLENtq1Jv6uAoDtTyduF2BjgWcyf
         iIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187280; x=1794792080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sifTHNrNa2DBCU4nC4S+i036dPkRsfarMXgVCAWsh+8=;
        b=1fJ3o9WcWe7TYLdm1qay3KuKHOE0hQVk0UuuhyoDR7WWq9zDHQD6NUA2WfZfmP/R12
         8aP0sD9dP+CzHr1GJhgci/rvUnGsWdVFxGoFHD2IR8aNf4Kou5m47Y9zgESgGpgXU2PG
         uv0rZVqG3UCCDy3yew9v0yT4rq0m07MNgCSzC0PsUR0XP/EXoNrVwUtQsjm3TXykFQJq
         nsnTjYSx+tUT3hV7WauImrbG8/AN7eksui3WaMi8J+kS1I+9OeEINT1QHkN9HD1BI1pW
         WnnH16QUIEGdws9X0iXOajaXfOsL4nKH40WZRZX2Y/5SY+vlRzDgIrF000mckyWA+liT
         fJ5g==
X-Forwarded-Encrypted: i=1; AL+hErHkSYtqr/zbqRFsBWGmtYthvHYsgNEORI3XjPttrCaveFfI0W2vArFBVPRemFUxsLDNgUk6IWacmGXbQ04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uNGiB5bWjZZtTlUHw9iGriL8trk3Bg6pvzV1fNCCttA3xQJLK
	G5keaoMNQhoHE6MjF4vt2GJIft4Ak2LLFgDrfI3y9TrF4lWeP2giL3J3+qavaHc59go=
X-Gm-Gg: AYBFou1xbZ1lhM0eMmDnGZg+vICcEYzBSX1JScqJCv2uMRUV1QFNTtHwjaKBcYaqfSG
	29IXZiAw649RxhFYiRyDltutJr49qSr2TciN6naZxM2RTDXjbQ6OJ5zKLsXa7o1+UuO5N674a+O
	Yu2CRG1CilF6eIwc4yAi7BEBbpX4bTg93LSCsJ8xPDkEqAp2kEN/U3KNa9NQoSzmFKzA2hY9XT7
	k940vAIfMYBmcdITj50LxSMQAjGxpVMCP3LtvJRBCR9LPehF83dC3pX6U2isRVu6B67n0dyr6PW
	CLO/khFL+PMe2SXbLfPSW9PzrcvKS+H6e5v3zTBK6yeibQ36kK4pCPNJ3bzL1HF1pVqy7yLAf18
	eZiHsdo1voTsE7VRgBbuNq/yJ958JMxX+20uFoD3kVUdCxlBUO+WWFg1yPa+lSDsNuD9O8f67uq
	/2dbyKunQuVUkrLf2oostgkhEiWruYbO1W4sBgUQowGuGty5Db9SrbcjWhqdDUrLhmbwLeUQLrw
	TBpbgNlFVF5KBw4GmXQC277jIYODvfbs0RQghRzUPGCCkFBalxjPRwVeDOkgdPcWKa+0GleqWsy
	Gy1hLSPAk/k5hS4wEEOIu5p3/0+XbWQ7uZzz4FuZ7ofJpMaNAa9RpMSZMDMrT+die1qCKJHMS/T
	ofDVgkOGzzxkW7GGD
X-Received: by 2002:a17:90b:2890:b0:3b0:d0c5:c10e with SMTP id 98e67ed59e1d1-3b12d3cbdf5mr2565235a91.17.1794187280310;
        Sun, 08 Nov 2026 17:21:20 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103432e26sm4883217a91.3.2026.11.08.17.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:21:19 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] rtnetlink: return EMSGSIZE when first dump entry does not fit
Date: Sun,  8 Nov 2026 17:13:12 -0800
Message-ID: <20261109012115.11898-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109012115.11898-1-stephen@networkplumber.org>
References: <20261109012115.11898-1-stephen@networkplumber.org>
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

If a route entry is too large for the dump skb, the dump is silently
truncated and no error is returned.

For handlers with RTNL_FLAG_DUMP_SPLIT_NLM_DONE, rtnl_dumpit() drops
-EMSGSIZE and returns skb->len. With an empty skb this is 0, so the
dump ends with NLMSG_DONE and status 0, and the remaining entries are
lost.

The first dump skb is allocated from __netlink_dump_start() while
max_recvmsg_len is still 0, so it is only NLMSG_GOODSIZE. On a 4K page
kernel that is under 4000 bytes, and a 500 way multipath route does not
fit:

  ip link add dummy0 type dummy
  ip link set dummy0 up
  ip route add 198.51.100.0/24 table 100 \
	$(for i in $(seq 500); do echo -n "nexthop dev dummy0 "; done)
  ip route show table 100

The dump prints nothing and exits 0, although "ip route get
198.51.100.1 table 100" still shows the route.

Only ignore -EMSGSIZE when the skb has data, so that an entry which
does not fit in an empty skb reports the error to user space.

Fixes: 5b4b62a169e1 ("rtnetlink: make the "split" NLM_DONE handling generic")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 net/core/rtnetlink.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e141340172ce..2777796a4ed2 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -7043,7 +7043,10 @@ static int rtnl_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 	 * Some applications which parse netlink manually depend on this.
 	 */
 	if (cb->flags & RTNL_FLAG_DUMP_SPLIT_NLM_DONE) {
-		if (err < 0 && err != -EMSGSIZE)
+		/* -EMSGSIZE with nothing in the skb is an error, as returning
+		 * a length of 0 would end the dump as if it was complete.
+		 */
+		if (err < 0 && (err != -EMSGSIZE || !skb->len))
 			return err;
 		if (!err)
 			cb->data = NULL;
-- 
2.53.0

