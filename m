Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF94477FD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454195; cv=none; b=tRsIpPzQ9dqmjQS/fbG+LAhaF2TzKgqIm2OoJFHc90m1MUMsnnPK6v1yVwjtiRC/Qbeu6WeA2J/Fu+yRJPEi+wMRMcJznaE2D+YVAP2QUTs9HPuSleAOe4f0Dr/GBQ2PKvaVJlbqer1vzJLs+SulLRWqGTZaIbAdEOvFanOoQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454195; c=relaxed/simple;
	bh=UGd+kjwZ7wLqKrdkmrx/xsOpXTlQdSYek/Xxji0Jj+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rYlXOqwrN2fpD4e/MFA2B/wgLRhYuIgcuA8vQAPzZcqqv9PjqKQ7SI31C8UBQ9KNf3YFcJuWjgI2GVkiVyiGMlIomhgHt5Uyadmb6rWBw9IhUAF20HxVrzAv2uX71LL5jfChpcMOeLar4oUaY6VtKJO8b6hSp6DCucemAuWleew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4wvkifw; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4wvkifw"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30b6dad2382so6404349eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791454194; x=1792058994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXNayWQZtrxImfBFLGBlgxTe4JKCGS+pfnkyA+c+fwU=;
        b=W4wvkifwHJqFfVu6Nxl7vmafRGI0SCSCFW5wJHHbnQFfaST1z+Bg8DO6gFw3PuFLft
         oQWZH+nHD6V+VmucYPbDVZ/8HcrBsFhZYJul+VrWRPr7zt7xv6RtbJMOaz0nOArUhnK9
         nA+rrUufCkgbkt62JsNmSlUdbHdU5/Hu23CqVU3dclG3qpLsOGPhItIJgJsbvS1abDuW
         lWPbFLzTRnlS6fPbt0qSwagS7WKV4x21uvraDqwZmT2zTPhbDw1vaj+wDJAYwmhQ3QmA
         Apflxs1q/Wo0VA0RxjXLrfKVhRpsqW0MpDY05lCMqC0VoILmTbjUtWFQSQ5CIfR/rWhk
         J3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454194; x=1792058994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXNayWQZtrxImfBFLGBlgxTe4JKCGS+pfnkyA+c+fwU=;
        b=MHRFgc6Ny9ktWFCJCOpFiulaoDfvVQz9tYaqeB2Hmd9KAJavqu4m1vt7/kMDYdx00S
         arprseaLfEp2CWfxX+FaQ+Ayc+xysA5kcm3uRTrAOWrVlyINBc/Wqxe2RtovSNXMMJa9
         PpyyulGkwF2GvVULknEOc6/AgZKyUYIwZAGpYd/Ag41ctqe8otISAFSoasiOIoltfV7l
         zsfBh3NBoQOw3zIYcwxdqZOnlnzfhv7bAp9L8hjpDuKkhInEyyuipa0gSmJbZ/Cl4eML
         RHorWkLPxJDwkGnOMBpapACfrA+OXBvYPUngAAL9i8++k4mWoxWwIr6C236NssV2Cj/2
         vOWg==
X-Forwarded-Encrypted: i=1; AKwUvByt1fjjUflA3ZXAjuTiP6+3XES1HcwGnfrYPTTn8FAw1g48FUHoqDHUeShji+FbI8F96eb0CasS7r42kpc=@vger.kernel.org
X-Gm-Message-State: AFuF++mnxBQBeEBiA7+2YCkfegzTICdW9Q18LjV+mua7I5hU6qGgsvnc
	BdxAr0e6BHEOoGVpzpcOGYVFh9cW4D48jLDseyTzzF9GhaLYupFzz7tGJVSDZjRIXvr4gQ==
X-Gm-Gg: AYBFou2QXWFCLZ/LywG9I8xVGYwSOtIVE6hFNeM7tYphnYGc3h4QZkJ+sfCOzZbAZ7/
	krjC7QJqbrPQk+y+Zl7CIYCW45LJTMnbdvY2pXe2HpDO2rkLLGCKj6/hyixc3ShaTc/7TwrHvto
	uxHRGrjPGzZccflys2aeg5S/Y3slrKJOeubaRYFZ6QNkoab1Jml0imTjlQAwUpB6hE9BuJuwDf8
	B970Ub6KPMEP2Rer8ma7Y28rGyISzz7HDfh8Hm89RuV6cO3tBGmEOaAQcdN443m7L9QsXVj2v/P
	zu4IIzxy+iL4JPdKMq6onUR3pElrJAGD1h4g2N+QtoLEq79c08GnbIqfqunZ1kVRH8j5qN8xMoH
	IIaqApL6oMamsmcpWZbD5XBr8Q9jcDSCQlGwT7YZgJdWfQ/EnCN96zgWSCc2+lwKQM16g/xhRDx
	OkC7Wl6vfhB7YUs/HgvMEd5tT4hqZbNjdVanr+syBxOV//jDbCXEDp5Zg3gKZ64DaE3EAHrAhUw
	XmxwpgKkvEVOhq8wOo=
X-Received: by 2002:a05:701b:451a:10b0:158:7ea9:4a5c with SMTP id a92af1059eb24-1620637efafmr5613674c88.27.1791454193686;
        Thu, 08 Oct 2026 03:09:53 -0700 (PDT)
Received: from ramesh.. ([124.123.89.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb5389sm16487581eec.2.2026.10.08.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:09:52 -0700 (PDT)
From: T S Rameshkumar <rameshsv06@gmail.com>
X-Google-Original-From: T S Rameshkumar <rameshkumar.t@phytecembedded.in>
To: Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>
Cc: netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petar Sakic <petar.sakic@ink.fish>,
	T S Rameshkumar <rameshkumar.t@phytecembedded.in>
Subject: [PATCH v2] mptcp: push queued data on passive TFO subflows becoming established
Date: Thu,  8 Oct 2026 15:39:41 +0530
Message-Id: <20261008100941.104715-1-rameshkumar.t@phytecembedded.in>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With TCP Fast Open on an MPTCP listener, if the server application
writes data while the passive subflow is still in SYN_RECV (after
consuming the client's SYN data but before the MP_CAPABLE third ACK
arrives), __mptcp_subflow_active() refuses transmission and the data
is queued into the msk write queue.

When the MPC third ACK arrives, the subflow transitions to
TCP_ESTABLISHED, but because the third ACK carries no DSS data,
the queued bytes remain stranded until the peer sends more data.

Fix this in subflow_state_change() by checking if the subflow was doing
passive TFO (subflow->is_mptfo) and has reached TCP_ESTABLISHED. Acquire
mptcp_data_lock() and call __mptcp_check_push() to flush queued bytes,
clearing is_mptfo so subsequent state transitions are ignored.

Reported-by: Petar Sakic <petar.sakic@ink.fish>
Closes: https://lore.kernel.org/netdev/CAFPPu1gU2Y-D+d4i3F0MoNkYK+e1U+=X3qf6QycjfKBw+8snPg@mail.gmail.com/
Fixes: fb7084501a61 ("mptcp: add support for TCP_FASTOPEN sockopt")
Signed-off-by: T S Rameshkumar <rameshkumar.t@phytecembedded.in>
---
 net/mptcp/options.c | 7 +++++++
 net/mptcp/subflow.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/net/mptcp/options.c b/net/mptcp/options.c
index ce0de02f5..d5238fa11 100644
--- a/net/mptcp/options.c
+++ b/net/mptcp/options.c
@@ -1042,6 +1042,13 @@ static bool check_fully_established(struct mptcp_sock *msk, struct sock *ssk,
 
 	mptcp_data_lock((struct sock *)msk);
 	__mptcp_subflow_fully_established(msk, subflow, mp_opt);
+	/* Passive TFO: the application may have written data while the
+	 * subflow was still in SYN_RECV; __mptcp_subflow_active() refused
+	 * it then and nothing else spools the msk write queue when the
+	 * MPC third ack (no DSS) arrives. Push it now.
+	 */
+	if (subflow->is_mptfo)
+		__mptcp_check_push((struct sock *)msk, ssk);
 	mptcp_data_unlock((struct sock *)msk);
 
 check_notify:
diff --git a/net/mptcp/subflow.c b/net/mptcp/subflow.c
index f0a6725d2..c71122842 100644
--- a/net/mptcp/subflow.c
+++ b/net/mptcp/subflow.c
@@ -1894,6 +1894,13 @@ static void subflow_state_change(struct sock *sk)
 	if (subflow->resetting)
 		return;
 
+	if (subflow->is_mptfo && sk->sk_state == TCP_ESTABLISHED) {
+		subflow->is_mptfo = 0;
+		mptcp_data_lock(parent);
+		__mptcp_check_push(parent, sk);
+		mptcp_data_unlock(parent);
+	}
+
 	/* as recvmsg() does not acquire the subflow socket for ssk selection
 	 * a fin packet carrying a DSS can be unnoticed if we don't trigger
 	 * the data available machinery here.
-- 
2.34.1

