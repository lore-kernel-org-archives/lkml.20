Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154C847D44B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862811; cv=none; b=AAmfHn6Q3771Tnk/1EMaTVyt/eMGA7pgc3dxYY/UeWLT4bqGelMpMSRVYUBUeKqQQUnyU9+Z0UPL/mfkvkbK2zBE2HIzMaFeeN8Tz5j2XDs3V36uLvAAHicZemdb8oFWlk3S0rckrYYjik7sec3k+CX4KfQsJ4kWYKGEiqOdylM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862811; c=relaxed/simple;
	bh=XnEXyehbf3q7HhKExf90f8FmP+xOJxpxISMdSdj426Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HPPW6gtAvOz45NoRAGcQE30IeRVvRFUGsy1WKjulQwo+M+nJuFZ1RZWWxdT8edJ6ogFWLmCLHDmhggZjqnxmSvBARfnmX233ChCW4mTc3IYUJAWWjNCIa1vuoWOdLEKKGqaAkHHhgCsAbw6e34AnrfnZy7mZxk9LPQ0niv9fZ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HfSKHC3F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HfSKHC3F"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so19386775e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1791862807; x=1792467607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMK1XqT/J8MAVtE1uBRjfQrR0wwwFxzE/LoSBxhjIGk=;
        b=HfSKHC3FPR5gT5/jlZrIMKTu+jO+uZ8IOYTVEno1hdhhtsqwOj0Ca1x3Xqg/snbeSa
         0lqcuwUMCHQ3CN+iCLZWmBkDRdKGyKItkXOFSWco46YKUh5Q8he24hmdaYSBrGVbjE1G
         rnI5Y1QgQp384s41Bta+jO3qdGjeRoGVI44QawAQ+HaTpYltPZnWW/Y+Q8V4I3HnDjgC
         qrvcekIWpAZl4y1WwuD2Ez6GIL9S4YIIcg2jF7pZnkPsNCSz71cbFxwm9RiUsiXpV7+U
         8ZKGNREW7XgOIXntwTXTYiaL5V14YOwqsy7YcfAFBU6asK1KWgf1GZ80mBgq/Sm+K+qh
         cE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862807; x=1792467607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMK1XqT/J8MAVtE1uBRjfQrR0wwwFxzE/LoSBxhjIGk=;
        b=tXm8bEahAc6olMaqBk76H1xWLTEPoufUWluMdlB3mEP2b4khikmoFWp+nrQELPvylZ
         5gDumiHx+h5cyfPeDrtoN8+7Jg/thINYq2h5FEGSkYO944BjjZB5uK0foHd3xS7avz11
         WEkw0tQ+YWPZWvQuxU77KAikjmnmfAqci6fjJhyEHHzHEp7jfrESWxZvWF4lKHjFOQWU
         i2eVVTPvYBAfsoHrk1NzBwwODKUqFXkUB7zuQvflTNxv0EnksWUnTKWzomF3DKUimsIz
         a04Zbh2mqSneW1w3CbD3x7nowp+Ebf3KwNJ6tCIIAVz7CMkiHB44+cME/w7izHO4gdr7
         bajg==
X-Forwarded-Encrypted: i=1; AKwUvBzqLsMV+faWzdzHWJP/6wJwGCx8CqrKg6ZI49zSUC6E2eGsFJ0Wan5nr89ntxlIM3qUPKgneQfzJ5+3pdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjN1WK3mHd3xn/I0dngUdImdexxmDiXA++YiLxRg/96lme+k7Z
	u2nzWUFU/fATz1JnP94iRiaGkwgy3Hu0/n8CJE5IbR8FSkMZHPhMja1+cHkops/Uat8=
X-Gm-Gg: AYBFou27mqfem5mYOMbEFWN4VyOLpY8QMSDsbg6Y0XDa4NDmF9le2RlWEIvCFL+4XlB
	9IyYK43iW2i0qsIlUc35HwDhD03MRVfUNOGBC94oFy4w3I8LBPwVVFJLKunT5iB7GCKsWi04WPv
	/s1LNAe+ZEbKCJg0GQFW9n0P7EmjiCMqxG5RHA9PKYva1N45t7XE6rTTFj1ltkPsZzoNHqosiDh
	oA5oAOt+/ShfjXB9B8DvJueDMIwHF7LR42D2Aojtvt8Tlkv2b6zkW4F59T+A3KHm4VkQUeg3AXo
	y+wxR74zQ/47mrNF4OM3SPy2jCaH/yDrpvEqjZebyUaKsWtXi0Aux+OXadSRDgi5D+f1xOq5geV
	BcXn+SMZhyRi04+kI1RJf61Wh01Vj7dA2dBMHRl4yHDDChzCBHHfhpv4zsyPnZjXOmsTI0ophbH
	qhV0dPzmgt2EzAKPuyDFpLXqhfyXF3aBh0I6vf+f/AdMZlmC6h6tHnsZX20ojgQUi+BGYe9zeCs
	qsbyHBrlDOmJy9aUEMaMm0i+G0xNs7lKNibWHIlGQCvZzzZy2x+YKmssmeLYZJuEqnMBqwmld7A
	6lwFTdr8Zg7pXcFUKNkD+9e0Xzf3oQpZqRGE0uAdAhvefBJW5mPRC34Lpt/ur+VN2XyCLvGw2a7
	7M3bzm+cuSzGLMOcdBxpY1i0BRQl+
X-Received: by 2002:a05:600c:3e05:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a18e4cdbd0mr198437185e9.25.1791862807370;
        Mon, 12 Oct 2026 20:40:07 -0700 (PDT)
Received: from dev-rjethwani.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm610444425e9.9.2026.10.12.20.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:40:07 -0700 (PDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Junseo Lim <zirajs7@gmail.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	Christian Brauner <brauner@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishikesh Jethwani <rjethwani@purestorage.com>
Subject: [PATCH net] kcm: defer receive parsing when the lower socket's read_sock may sleep
Date: Mon, 12 Oct 2026 21:39:20 -0600
Message-ID: <20261013033920.2069285-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psock_data_ready() is the lower socket's data_ready callback and can
run in softirq context, under read_lock_bh(&sk->sk_callback_lock). It calls
strp_data_ready(), which, when the socket is not owned by a user,
invokes sock->ops->read_sock() inline to pull records out of the
receive queue. For a plain TCP socket that is tcp_read_sock(), which
does not block.

A ULP may install a different read_sock. kTLS installs
tls_sw_read_sock(), which can sleep: it waits for an asynchronous
AEAD to complete via crypto_wait_req(), flushes the socket backlog
through __sk_flush_backlog(), allocates with sk->sk_allocation, and,
on reader contention in tls_rx_reader_acquire(), enters
sk_wait_event()'s socket release/reacquire path despite the zero
timeout. It passes nonblock, so it does not wait for data, but these
paths can require sleepable context, which softirq and a BH read lock
do not provide. Attaching a kTLS socket to a KCM multiplexor can
therefore sleep in atomic context.

With CONFIG_DEBUG_ATOMIC_SLEEP, a loopback TCP connection using software
kTLS RX, with the receiving socket attached to a KCM mux, reports:

  BUG: sleeping function called from invalid context at include/linux/sched/mm.h:321
  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 189, name: ksoftirqd/34
  Call Trace:
   __might_resched
   kmem_cache_alloc_node_noprof
   __alloc_skb
   alloc_skb_with_frags
   tls_rx_one_record
   tls_sw_read_sock
   strp_read_sock
   strp_data_ready
   psock_data_ready [kcm]

Keep the inline fast path for tcp_read_sock() and hand any other
read_sock to the parser work via strp_check_rcv(). The work runs
do_strp_work() under lock_sock(), where a sleeping read_sock is fine.
sk->sk_socket can be NULL here while the lower socket is being
released; strp_read_sock() already treats that as a reason not to
read, so take the deferred path in that case as well.

Tested with the reproducer above on a 6.18 kernel: without this change
the splat is reported on every run; with it, nothing is reported.

Fixes: 662fbcec32f4 ("net/tls: implement ->read_sock()")
Assisted-by: LLM
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/kcm/kcmsock.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/net/kcm/kcmsock.c b/net/kcm/kcmsock.c
index 71af69d442f2..381a8f0b792e 100644
--- a/net/kcm/kcmsock.c
+++ b/net/kcm/kcmsock.c
@@ -30,6 +30,7 @@
 #include <net/kcm.h>
 #include <net/netns/generic.h>
 #include <net/sock.h>
+#include <net/tcp.h>
 #include <uapi/linux/kcm.h>
 #include <trace/events/sock.h>
 
@@ -358,8 +359,19 @@ static void psock_data_ready(struct sock *sk)
 	read_lock_bh(&sk->sk_callback_lock);
 
 	psock = (struct kcm_psock *)sk->sk_user_data;
-	if (likely(psock))
-		strp_data_ready(&psock->strp);
+	if (likely(psock)) {
+		struct socket *sock = sk->sk_socket;
+
+		/* strp_data_ready() calls sock->ops->read_sock() inline from
+		 * this softirq callback. A ULP's read_sock, such as kTLS's
+		 * tls_sw_read_sock(), may sleep, so hand anything other than
+		 * TCP's own to the parser work, which runs under lock_sock().
+		 */
+		if (likely(sock && sock->ops->read_sock == tcp_read_sock))
+			strp_data_ready(&psock->strp);
+		else
+			strp_check_rcv(&psock->strp);
+	}
 
 	read_unlock_bh(&sk->sk_callback_lock);
 }

base-commit: 8e2fbe0e75d38690d551456658194c632933cb57
-- 
2.50.1

