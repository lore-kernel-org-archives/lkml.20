Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504118;
	b=MdmgRLbLfu/DY8YlwSqsno4oECNt9b+aCpbLJHEugtU4nhcv3eN2ywIioNB5kAew6h2m
	 tukh/xqCxRhESxJjzvWucBSmFSLDPxGhNw9Y+OByqu68cHBEWcZ3C4FN3GjEiwL4Kh18h
	 0Q2M4+iIX2M2OkynI8WeCdqD8gNsJpPth9vGR1vwn8QSv+U1RXH5KyGI3p9ghh3ZLguvX
	 LA03fX20Jm9PqJPcN62AuPxVkg7wSRTeIjDbnA9lKyMCeYgJG/t+71Rm/uc1DEzjsWCo1
	 iwa0O/DsG+YYMPUmWEyrkJxNnPfvOdPg4Zjx6GGOEh3XuU/CwQ3fm6TVhk7ldV6ZVuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RMTzFB73wRCkjilaTwDIf3wsPQNxn4uql3pqUcPvaJk=;
	b=l6rMIuKuvQO94bfUhj6mX+t+ysiES2zYRbzd8yZ3nIM2M0Q2/io3DkXr1tEaQHehcwnS
	 PTKn0I82aXG7o7ceFV6tnvCyWbqdWPR26kKS/MkBaeqi93yPnojdXDZYV9bav9r4vpyVY
	 21gk7QCoSRcdCH2b1RM+NVYT5Pngx8NAaQKwOb+Qb0v/PpaLjWTyt+0fcwrKEIGnsgazb
	 W5QibnrpwpVzOJDBUC3ntnkVlXRwklZzxhRjzsdAyo1R4iz38tFuCdBTXCrOr7gwos06V
	 /7EVGKmlu5DqOyKhN10zV9Vz4P6g/sIhxXHx7cEZak0CAKrcgpjMnCiVFb8Z1bm12qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=theori.io;
	spf=pass smtp.mailfrom=theori.io;
	dkim=pass header.d=theori.io header.i=@theori.io header.a=rsa-sha256 header.s=google2026 header.b=G0Wekqxe;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50681606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50681606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=theori.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theori.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theori.io header.i=@theori.io header.a=rsa-sha256 header.s=google2026 header.b=G0Wekqxe
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-497614c95f0so2603207f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google2026; t=1794504115; x=1795108915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMTzFB73wRCkjilaTwDIf3wsPQNxn4uql3pqUcPvaJk=;
        b=G0WekqxezQih4/CxNOTg3eZ6gRN85MDuSKCrziTFZVBB4Gi46ftZ+GSchNZbg769DJ
         XAw2wEqI0QCirJLmOcb6ZT5uKkTN/npSe782oZnrjMMDW1OVHLoyEQO0ltIzmBQYy2vc
         h/r2AgLlpNsU+OzmiDw3Y+sZdkmUC5UaZT5EEDwIFsgaAJCFpiC7f5EDR1p0zD9A4yQ7
         RnJBlGFRwbiZhyjokWLUAyBzEKW8PS1cvxzKi1d+iNdcQllq3mXkJLazkoT6Xs9K2+f/
         BSLKRKgHyg/YvjgZd+KSTlBdJTda7VwS506j2t1qsDLzYJtSxjzJfgFRrixwl+otbHWi
         FaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504115; x=1795108915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMTzFB73wRCkjilaTwDIf3wsPQNxn4uql3pqUcPvaJk=;
        b=Isah5EneXLjq7nPsHhe5jdJHotolHmgKRNDHw46o+/vAOQ7vXy92hJxO6voqi5yptG
         DUUOqIbnI334tILrhXr4RqIV6iT6efckjxG6BPRPfkq+A41CoJ3gEK6ZOi36IVfPn4ev
         FaJ9gITuzFSl548hAdzqEnmB7FlRx71y7f4/7ujM7hLG8A7WAElweaoIl+mEq1WurU7X
         YAaLM9HTnEBkXLCSJZElmEKrieT/KcPhvhyhbzofXc+FoGMl1vL8D7eJp9ovyKoEiDWY
         vkSn51N+wSJoK9AM42kDaN6c/pxbRXQJxtl//I+JzoJCnqiP7GsKFlQsOUqBUlq+lbYK
         2Caw==
X-Forwarded-Encrypted: i=1; AL+hErGrsL+oXbuwHynPvXyWb1ny3neyjD4SNuw3QDX9hOj3LKW/ndVRilyImPp0A/RLRyCJGOiZKRRwhdllQMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DuGsLtGcndXP4+c/yz/f0S8eUOQb0PI4deDOnwh2Efz8unzdY
	OOoPrvuqFqKs8GgM2YDHUGLIlSIz69Ovmknwj5xBnXRcJ/gBPHhPSoZULLUQMr1uWA4=
X-Gm-Gg: AYBFou1nxJWgqNQ8hOPA5HYr2XTxuVnnDmDMpIDa62FyCslKcoetVdGce69AekG3LTi
	uWpa8dhfZc95mOa/mFmmP+xFv6eim9lu1SoYAgeWrnKYIxAdM4QkZMkV2T8suCbv3jB5AmJ/mWe
	HaF18/0JPkDVEd5A8vVN4kpmd0Q9tWVxryMQFnf2pJq00alVjFTvPaa33PS7X5/H40rYalkr5LD
	IAsUISwyqOJ/vs9YvzH/jGHqsOlaA89BeCtmAATGTxp/WYZIWodWO+8OpIbfncakoVaiVt6CHdO
	0QwOSnSt1xYf11nak/7ELYSNeN+Z3S8WC4ZngxFZ2+JSgE+tTrlylmQCv3ypA5xJKB+bSBMEqDw
	7ACnwbTfmShaTBIWMRn4jVgx/BZ0b6b8bMel9JCj8FVI8FI6xolsrhMuXBZ0le58KDMzB/fP15M
	PXtsPLgyyuHGNNPB1vyA1Y13ErrvZ1UO8bCjXasjDxw0gQ/LnbNkLqLH/q1p1XZxDi+HaWWrdsH
	MbF2NL4O4c8l/5iAe+1WqaIujN10Zye5QpS5hHxLjer58sou+tv8smP7zdOuXd88+gLlxG9AtrP
	KD/+BuXruDDaTQmmLN0E1rvn6AE5nJNf1vQz3vuWwdGNMQPSdlzO/G7ohLegLLvMjLn+wZ7kb22
	xRTJaSQ==
X-Received: by 2002:adf:e19e:0:b0:487:b50:101c with SMTP id ffacd0b85a97d-49c6fc9dc98mr124584f8f.5.1794504114498;
        Thu, 12 Nov 2026 09:21:54 -0800 (PST)
Received: from localhost.localdomain (bbcs-110-227.pub.wingo.ch. [144.2.110.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm1909f8f.17.2026.11.12.09.21.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 09:21:53 -0800 (PST)
From: Yves Bieri <yves.bieri@theori.io>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yves Bieri <yves.bieri@theori.io>,
	stable@vger.kernel.org
Subject: [PATCH net v2] sctp: do not free a new asoc peeled off while sendmsg slept
Date: Thu, 12 Nov 2026 18:21:49 +0100
Message-ID: <20261112172149.27355-1-yves.bieri@theori.io>
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

When sctp_sendmsg() creates a new association and sending on it fails
with anything but -ESRCH, it frees the association. The send can
sleep in sctp_wait_for_sndbuf(), which releases the socket lock, and
meanwhile another thread can peel the new association off to a new
socket. The wait then returns -EPIPE, and sctp_sendmsg() frees an
association that now belongs to the peeled-off socket, without holding
that socket's lock.

If the peeled-off socket frees the association first, e.g. on close(),
sctp_sendmsg() frees it a second time. Otherwise a syscall running
concurrently on the peeled-off socket can use it after sctp_sendmsg()
freed it. Both are reachable by an unprivileged user. The double free
on net with KASAN:

  BUG: KASAN: double-free in sctp_tsnmap_free+0x5c/0x80
   sctp_association_free+0x1eb/0x750
   sctp_sendmsg+0x15ff/0x2020
  Freed by task 836:
   sctp_association_free+0x1eb/0x750
   sctp_primitive_ABORT+0x85/0xe0
   sctp_close+0x22a/0x8d0

Commit dfcb9f4f99f1 ("sctp: deny peeloff operation on asocs with threads
sleeping on it") fixed this double free by denying the peeloff.
Commit cea0cc80a677 ("sctp: use the right sk after waking up from
wait_buf sleep") replaced that check, and commit a0ff660058b8 ("sctp:
return error if the asoc has been peeled off in sctp_wait_for_sndbuf")
reverted it to return -EPIPE, without restoring the check.

Fix this by holding a reference on the new association while sending
on it, and by freeing it on error only if this socket still owns it.
asoc->base.sk only changes in sctp_sock_migrate(), which runs with this
socket locked, so the ownership check is stable. The reference keeps
the check safe if the new owner frees the association meanwhile.
Userspace still gets -EPIPE, and the association stays with the socket
it was peeled off to.

This was found by Xint Code, an AI code review agent, and reproduced as
an unprivileged user on net with KASAN (trace above), without modifying
the kernel or using error injection. With this patch the sender gets
-EPIPE and the association keeps working on the peeled-off socket.
Without a peeloff, a failed send that created the association (EAGAIN,
EINTR) still frees it, and a peer ABORT while the sender sleeps still
frees it exactly once. The SCTP selftest sctp_vrf.sh passes. The
reproducer is available on request.

Fixes: a0ff660058b8 ("sctp: return error if the asoc has been peeled off in sctp_wait_for_sndbuf")
Cc: stable@vger.kernel.org
Signed-off-by: Yves Bieri <yves.bieri@theori.io>
---
v2:
  - move the hold to right after the association is created (Xin Long)
v1: https://lore.kernel.org/netdev/20261110224233.82977-1-yves.bieri@theori.io/

Tested on net at b71c101bbb98.

The fix and this message were drafted with Claude, and reviewed and
tested by me.

 net/sctp/socket.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index b5a57f6..6ed184e 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -2063,6 +2063,11 @@ static int sctp_sendmsg(struct sock *sk, struct msghdr *msg, size_t msg_len)
 
 			asoc = transport->asoc;
 			new = true;
+			/* sctp_sendmsg_to_asoc() may release the socket lock,
+			 * and the new asoc can be peeled off meanwhile.  Hold
+			 * it, and free it on error only if sk still owns it.
+			 */
+			sctp_association_hold(asoc);
 		}
 
 		if (!sctp_style(sk, TCP) && !(sflags & SCTP_ADDR_OVER))
@@ -2084,8 +2089,11 @@ static int sctp_sendmsg(struct sock *sk, struct msghdr *msg, size_t msg_len)
 
 	/* Send msg to the asoc */
 	err = sctp_sendmsg_to_asoc(asoc, msg, msg_len, transport, sinfo);
-	if (err < 0 && err != -ESRCH && new)
-		sctp_association_free(asoc);
+	if (new) {
+		if (err < 0 && err != -ESRCH && asoc->base.sk == sk)
+			sctp_association_free(asoc);
+		sctp_association_put(asoc);
+	}
 
 out_unlock:
 	release_sock(sk);

base-commit: b71c101bbb9814d163c00234d43c41f0a17907d4
-- 
2.43.0
