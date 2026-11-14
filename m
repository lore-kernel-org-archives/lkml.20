Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665602;
	b=3jpU7b+XPxZZDkPaynSClqJWBX1xMBqlJByDsnqh1OFNWhpSLp1dFLGBsPgBMgUSXSUL
	 nJ6KYfwpzd2UdwBfaZ58Hscs0ptcT0Q6A1fSH9FCiLkFCf22jYfwRkqx9dgloLVWloLfH
	 2Eck2O+lNQ+Z/nbt8VU7R8v3c3iuI2jcW+euthhMnTx9cAB0yka2IrLDkjWb3abTfCIic
	 9y3mRSLj5E7CQhd4NLSc2aaZJDV21PoIyGcrgmO463yaljDl9iV/gCwvE173Zi4Yy629o
	 h0Iq4TCwpZMLDq4KD0Q3TdKI+qlxObwL58pRO7/P15B7915JioFHrSN35fFtd8+P2xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/lYN5cpAnwcvRLwVXKb5jg7Q77SzumSKXZpj2QEfzSE=;
	b=tIUZV9LR9PKY6ib6Wiu862Gdp2Yat9adHyC74RV/+Mjo1g540TKhNw0/0zcH6uchCoWX
	 7/qdDiUo4iboSw/uxfgYxKGRcILg7xRbdA9ilQEpL2tyAUQkdbhmwEBXTuuUsrrt0n2HV
	 z11JxTuO/y7BDbqabj7ZMJ60/iM4AWn+X2lfwwojRwb7LrnBim3zK3qE+APCrB2eJ1wJZ
	 b1Uf2SODk4M3EYGZ6nGT5dz0jSQvAjzKAkiEb7NekTVjsrMvUvMReTDF7teRMfzImXFaY
	 5qdtaAuSVnXlLX7TyM2knoSMrvWZ9hU3tZzJmVFuZg7v0lYkxWMPQ/isbq4unIQLhWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PefjNSwK;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F793606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F793606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PefjNSwK
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed0e2015aaso9807765ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665601; x=1795270401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lYN5cpAnwcvRLwVXKb5jg7Q77SzumSKXZpj2QEfzSE=;
        b=PefjNSwKA83Q9XnZkTR47Rv7Ph8C3n2d81LF7aoXPv/tSDKxDwxbeGFRPLnE5vWK1V
         0uKVkIumRKcpAGAFtMHk/ngx084YRUXyzAfWNB0StBSy0RmYWb494bbHhQFzGzBrq8vF
         0rGOIm6w411b4HzQ+C9PvmoEpUOY5T+QNxZdHDifN10q4EGPAJ2zgkfv2/ODBOGLzzIK
         rC1eU/yIXFfZV37+0HM/1/IQotKbkiQCunu850lBNxrZxjXdidrkHAnt8K/bLmy5Ttux
         X8WuQJPGtWZX4rk/SqwapAFwA6F4KTzwJwFX3etpmU88x7XpEwpQsvCZvKX0ILvaKKvx
         leUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665601; x=1795270401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lYN5cpAnwcvRLwVXKb5jg7Q77SzumSKXZpj2QEfzSE=;
        b=egevUdSTcTpOYPhGFroVRzgMU5nW5GwnExuZ95TFuExeGyKUQHJn8A3L8b05oTvJsv
         7Q4ACtbkY4Zawq8Dxmsi/4Eor0qyTPqXdwZdKC2du6VWbMAlSrBg/q6N086vT/12IOoF
         WV0e8d019UTVPw9dgXfBvoidlw9A21g11U6QjvFbngLoVPEVdFW8XY87oWJrpX6Q7/RF
         oWyraAQaWraP2wMTFOrn9z6cMJ/lUZl4+rY2YZSIeWFWrmy7y7G5AN0ZppjU1sXAsD5P
         S72sy3BjfC1uUl0WvtoQTDufsgjB7MYB33Ujck6gtdapqHh1M5w6+7hos6+qhT25zcdq
         bcWg==
X-Forwarded-Encrypted: i=1; AL+hErE0ABSOglV/BQakkmXYrBCYLURuxx1GbxI7WjKbfZ4Wwu8HQtkZLWT/kAkpLGnqpoRpOq99gM2Mqo26aq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z8fz5CIJZ8evZG3zSLatdj7ox54WFWZZEg1Vp3eMPz0Na3zCu
	2jsHvfUT2LAZuEgWyLLXvWkSf6cUlc6fTwK8YWmYrFAJNSJDJjGRg/Xi
X-Gm-Gg: AYBFou0r0PEZqtachcHq1tsU+zyuTNkT6LXSO7OhvcV0glydvjRiH4tfHRSIpkyLUSc
	l3P/+u69UORwHDllQcsljfxEHXsn6lT8XIWhkTvO8Ujt4QpwXnwj95Sr9bAw0zcwMY/SAmfxdvX
	JlhCz5OrW/gG1oc5+iGYy3FH09ACz59qXH8b8Zco9lXTRajamAJC7069lb/s2saQ+WRS7kcM4PJ
	AIlXor5NKPE8sDNZb7YtSG+dLzzCJaYzO5hEsWmncDluGp79JX4pPNzn/f9HuTsT7J+tK2GPj4p
	q3dgyUFofc102qUvmnBoh140MP/7B/zXUUq34ii14OdjWUw8kg+8a6jXn3DSpMSx3X6ISMK0wBt
	u+DyNsdHJJX2iLfhPblT/PI6RDLx//vG0Ac3GhVtJLaeXaQNkP4gJ9OgiDMJqfQY+yY+LdrawO1
	RuXR2fi05v6Sg9ehZOIvS5ufKG2vWnbjD9h0eIrp2aPh5C/cL4zVfcF0Zyz7Gqetg2qhniS3f8f
	6Eg2GvvO8jV1lFda0iaffKn+G9yQMcwguBlIVhIo38K3f8ymgjwhppxbdWNMkEKe46pa0L3NIky
	I05IolJh/T7LmauoMbX4zVhQngOIggpltv2z3PaatfwIqhaCEeG4f55wsxtDZn8kpELBz7CfIV8
	v
X-Received: by 2002:a17:902:db0c:b0:2ed:b7e4:f52 with SMTP id d9443c01a7336-2ee0dd907f9mr51917735ad.57.1794665601458;
        Sat, 14 Nov 2026 06:13:21 -0800 (PST)
Received: from LDYT9Q2G2M ([2a09:bac1:7680:450::1c:35f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d9966sm21077595ad.61.2026.11.14.06.13.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:13:21 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: roccet: do not restart from idle on RTO retransmission
Date: Sat, 14 Nov 2026 22:13:15 +0800
Message-ID: <20261114141315.19007-1-zhiqizhangg@gmail.com>
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

roccet sets .cong_control, so tcp_slow_start_after_idle_check() returns
early and roccet implements the idle restart in cwnd_event_tx_start().

An RTO retransmission also raises CA_EVENT_TX_START.  tcp_enter_loss()
marks the outstanding packets lost, which drains the in-flight count
while packets_out stays non-zero, and the RTO timer expires at least
icsk_rto after the last send.  The idle restart then overwrites the
snd_ssthresh that roccet_state(TCP_CA_Loss) just set:

  tcp_enter_loss()
    roccet_recalc_ssthresh()       ssthresh = 0.7 * cwnd
    roccet_state(TCP_CA_Loss)      cwnd = TCP_INIT_CWND,
                                   ssthresh = max(ssthresh, cwnd)
  tcp_retransmit_skb()
    tcp_event_data_sent()          CA_EVENT_TX_START
    roccet_cwnd_event_tx_start()   ssthresh = cwnd = TCP_INIT_CWND,
                                   state = LAUNCH

The flow loses the reduced ssthresh and cannot slow start back to the
pre-loss window; CUBIC growth restarts from TCP_INIT_CWND with
last_max_cwnd reset.  Skip the idle restart while packets are
outstanding, matching tcp_slow_start_after_idle_check().

Measured with a loopback sender and 100% netem loss after cwnd reached
about 126, reading TCP_INFO on the sender:

  before fix: ssthresh during RTO = 10 (TCP_INIT_CWND)
  after fix:  ssthresh during RTO = 88 (0.7 * cwnd preserved)

The same issue was raised in the Sashiko review of the initial series.

Fixes: 819d59638796 ("tcp: Add TCP ROCCET congestion control module.")
Link: https://lore.kernel.org/all/179179785248.434549.16829837649351382748@kernel.org/
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---

AI assistance:

- DeepSeek (deepseek-flash) generated the code change.
- I wrote the tests and reviewed the code.
- I wrote the documentation and the changelog, and used DeepSeek to
  polish the wording.

 net/ipv4/tcp_roccet.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_roccet.c b/net/ipv4/tcp_roccet.c
index 04b9e5246..4b4621a79 100644
--- a/net/ipv4/tcp_roccet.c
+++ b/net/ipv4/tcp_roccet.c
@@ -1144,8 +1144,15 @@ static void roccet_cwnd_event_tx_start(struct sock *sk)
 			ca->epoch_start = now;
 	}
 
-	/* After idle periods, go into LAUNCH with slow start */
-	if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
+	/*
+	 * Skip the idle restart when packets are outstanding.  An RTO
+	 * retransmission also raises CA_EVENT_TX_START: loss marking drains
+	 * the in-flight count while packets_out stays non-zero.  Restarting
+	 * there overwrites the snd_ssthresh preserved by roccet_state().
+	 * Cf. tcp_slow_start_after_idle_check().
+	 */
+	if (!tp->packets_out &&
+	    READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
 	    delta >= inet_csk(sk)->icsk_rto) {
 		tp->snd_ssthresh = tcp_snd_cwnd(tp);
 		tcp_snd_cwnd_set(tp, min(TCP_INIT_CWND, tp->snd_cwnd_clamp));
-- 
2.54.0 (Apple Git-157)

