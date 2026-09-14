Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25294484243
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404247; cv=none; b=KHI0SNOTfjbWufmUOEdIfZuIxAg1421kgw+XkU2jZG0oKUi5qZ1szcZynb3h2LgH2DO5lqjaXqAP4oSJwh230yyRh5mSTk5ZisB2/PJmfVnxit31CWYV4Mnt5cpkDBrusjqyN3LRaSHDcLQ587xWFkoaec5D4XxP09P34z5vM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404247; c=relaxed/simple;
	bh=B72i0TqWFDhyfs7iAPK30i8YZVrELBSfmsv2i7LPbl0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=o6j+PSKx5GIhJpJpLkcl9QuzinMpuxg0bpqyucDImrij4XFjMGI7MAWOk0Dh8kBWe5RHEUrixWo9lwri2PQI8bs7BBQt/sdKiM6BW3E37SqgCaTTMPTvJi9xjLD/O9ImQ8OHOkZOl8JVXFt25UrEyw45ASWEwbNPSO0NX+iGK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tZWs8dX8; arc=none smtp.client-ip=209.85.222.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZWs8dX8"
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so639395385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789404243; x=1790009043; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vLuB0gCfwF6zDMyZTlgcVgD+YFlPOMK6K5wbE2DV94=;
        b=tZWs8dX8CXU8rIbvTxDWDcYIG+rd0snLpEROaTLOkZptnjoH0Jc+HWuCZvNDPSd2Kl
         9DE0A1plI1e02htJM2twAct+nFOErTSb6nXRQvqmnurnCio4swtGc51Qtt9aXcyiHHO+
         6q3juNKxKv0IdYCgo1fUU4C0ZrCIQQ5NteGYWkigNn2vak25xccDlf/Qe+VilaUUOUy/
         CGuEBh397WPSooHDtA1Q3/tKG29nKz/E6Rbf3knQlSoXdSZuIIv5O9AHabePQEpEaroo
         3N/q3mqs5q7BOTfUPx1JrmAgOY1M/ky+yLAdz/BzjcBWOg8dIHtm0khRI37t0w1ydVvR
         QhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404243; x=1790009043;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vLuB0gCfwF6zDMyZTlgcVgD+YFlPOMK6K5wbE2DV94=;
        b=jcX1PG2VjN5ys4yVeD1DjKnxakgBds1ZHW4n0QJcXcEIz49+IlLeyzU0ii5UzQo0fG
         S3HP3wo4qLbZKykkx5mm/E8JqOU0T1L5Vq54vJJnVPsEEwydlQVMZlovqmAqDguVkRFS
         agUynYpGuZOI9mZbMKpuBW6lNAcjyEJFD5bcn4vBTQZs3OKot+B6cdi0nGidO6U+YMF4
         cw/ECUGPZSoo8GXczwfdHHhsgbc+LqSIs+QbvrO8+ZGwIY5+6oArOFxv37uW0nV09iqu
         Mz7XBYfABVSa3zDHpgtXNO6Md81z97yarJ8SEhw4qxfzXbylB47l/AXSKlwIocbx592+
         gopA==
X-Gm-Message-State: AFuF++lPrcmNfHUIdoTUATo6EOg6rSIlbwSCT2zSN3+YMNdhgSMYfIxh
	cZudmviKj2Zi5nMN7grKqqs7P3Ti52EJRTSV9/upNGDvZrnG62k8R58kKlKTDFtcYApAiWoIPpG
	eUtpP5wu5gmG62Q==
X-Received: from qknrb22.prod.google.com ([2002:a05:620a:8d16:b0:93a:8de:9f99])
 (user=edumazet job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4409:b0:939:9c21:8ece with SMTP id af79cd13be357-93a29a192e5mr456272385a.42.1789404242566;
 Mon, 14 Sep 2026 09:44:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:44:00 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260914164400.2738350-1-edumazet@google.com>
Subject: [PATCH] dlm: fix send buffer backpressure handling
From: Eric Dumazet <edumazet@google.com>
To: Alexander Aring <aahringo@redhat.com>, David Teigland <teigland@redhat.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, gfs2@lists.linux.dev, 
	Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

lowcomms.c tests and clears SOCKWQ_ASYNC_NOSPACE in con->sock->flags,
but this bit has not been stored there for ten years.

Commit 9cd3e072b0be ("net: rename SOCK_ASYNC_NOSPACE and
SOCK_ASYNC_WAITDATA") mechanically renamed the two dlm users, then
commit ceb5d58b2170 ("net: fix sock_wake_async() rcu protection") moved
the bit from socket->flags to the RCU protected socket_wq->flags, where
it is reachable only through sk_set_bit() and sk_clear_bit(), and is
only maintained for sockets having SOCK_FASYNC set.  dlm uses kernel
sockets, which never have SOCK_FASYNC set, and never sets the bit
itself, so the test in send_to_sock() has been false ever since.

The consequence is that when sock_sendmsg() returns -EAGAIN because the
socket send buffer is full, dlm no longer sets CF_APP_LIMITED, does not
increment sk_write_pending, and does not return DLM_IO_END to wait for
lowcomms_write_space().  It returns DLM_IO_RESCHED instead, and
process_send_sockets() immediately requeues the send work.  A connection
to a peer that is slow to drain thus keeps cycling through
sock_sendmsg() and -EAGAIN, burning CPU, instead of sleeping until TCP
reports that space is available again.

Test SOCK_NOSPACE instead.  This is the bit that lives in socket->flags,
that TCP sets whenever sendmsg() returns -EAGAIN for lack of send buffer
space (tcp_sendmsg_locked() and sk_stream_wait_memory()), and that
lowcomms_write_space() already clears.  This restores the semantics dlm
had before the bit moved.

Also remove the clear_bit() of SOCKWQ_ASYNC_NOSPACE from
lowcomms_write_space(), for the same reason.

SCTP connections are deliberately left as they are.  SCTP does not set
SOCK_NOSPACE, and it never calls sk->sk_write_space(): sctp_wfree() ends
up in sctp_wake_up_waiters(), which calls sctp_write_space() directly.
lowcomms_write_space() is thus never invoked for an SCTP connection, and
the test added here stays false, so send_to_sock() keeps returning
DLM_IO_RESCHED as it does today.  This is the only safe behavior, as
returning DLM_IO_END would wait for a callback that never comes.

Fixes: ceb5d58b2170 ("net: fix sock_wake_async() rcu protection")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Dumazet <edumazet@google.com>
---
 fs/dlm/lowcomms.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 2aff1c7c17de..abe9ae4c643f 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -522,10 +522,8 @@ static void lowcomms_write_space(struct sock *sk)
 	clear_bit(SOCK_NOSPACE, &con->sock->flags);
 
 	spin_lock_bh(&con->writequeue_lock);
-	if (test_and_clear_bit(CF_APP_LIMITED, &con->flags)) {
+	if (test_and_clear_bit(CF_APP_LIMITED, &con->flags))
 		con->sock->sk->sk_write_pending--;
-		clear_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags);
-	}
 
 	lowcomms_queue_swork(con);
 	spin_unlock_bh(&con->writequeue_lock);
@@ -1391,7 +1389,7 @@ static int send_to_sock(struct connection *con)
 	if (ret == -EAGAIN || ret == 0) {
 		lock_sock(con->sock->sk);
 		spin_lock_bh(&con->writequeue_lock);
-		if (test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
+		if (test_bit(SOCK_NOSPACE, &con->sock->flags) &&
 		    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
 			/* Notify TCP that we're limited by the
 			 * application window size.
-- 
2.55.0.1007.g17ff1f9808-goog

