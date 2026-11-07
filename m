Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017360;
	b=wUY27khayTDju82vTspoT6H4BxpFDQetYNhFvoDkDKgeCHHPOEC8Rc+vodU4Gu1lo8fb
	 rpOkaDsZNOIznIx6ay9rjxTqXI8s8qxUJ8RskGPKOM3K29aINk/8Lv90a8GXo6k7+K7WP
	 J3tzZ+Ky5BZNPY8vVe+tOoHFuiYcyhF3+FHQ8qlIZgEWgShFsr090g5dagLvnqmHFjY9b
	 WiD9IvLtCNikJ1YGanPF4yN7ed/ahWz/Dr/LruYHHFglbTcDV7CpBKIXOHjSO/yKOukbe
	 PYS78ZKJjcUOH/IYXoeAhpU775bxedepeI9hThawMMBp9btezGxva3cMl77z5DquAWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=oWCm5sO2ZJcIfwM/bU9hgd9OcLaoRmJrQ2OQCAcOYQw=;
	b=OTG432u5YKGb5OE7bKgCRkhm/3IP8IRO9rPFDSqT2RMLHfV1Sx8Yk3LaqRjY4zFON0K5
	 o2nBbDWMss7vVRHLIV+jUxUkO8+1fiaizGyFmmh7k0DY2kRYn82rsNC69cThjFds8MEW/
	 T2zJtQsLFLy1HxW0Wds5iE87hI6ClZ6uaxaA0MxSu58jD0Qxpe44YtGziE8u+2HiXXCGm
	 2Ato6cC7urlohZBfU23pXenG+53JuOrojYdhjzSFQ+9bk/J12nGp9LwFrd9g+qtb21JHG
	 VYvY7bRn7xfVPhfGYhr0pkv+N13KsNBxer+dlbVN59J2mhYz6kxNH0S8GUxehViikTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+8vyume;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE25606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE25606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+8vyume
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1068676a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017359; x=1794622159; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oWCm5sO2ZJcIfwM/bU9hgd9OcLaoRmJrQ2OQCAcOYQw=;
        b=H+8vyume+obI271XmNk+PDu48Q19jOLc/Va8iCJp+YPAfevLZPbtqZKst6ucyXtfSw
         SesmJ3do6CgH0DvagS2lCWl//emQ8A8R9ws51AQTEijOWlvGxTR2vpKj7HFj7HUNesAD
         Iz/tqmsd4wcjINMkFThPdh82py3fh0hdETwaSNa/7BESxLI2fFYv4JdsIe5+Yh+iNqwi
         GuQQxgL9obB3jiEMRpDE9NQASENmDbDCM9g7vOrH4FzP3N/mV41LFrwuOV+fbmrRkUkI
         PlnkIn5ku0EaxwHF2d31ktU40mx5GyEtw9tUQotInc5smSPvSCczAu0/CGscJ/0+rKLR
         LO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017359; x=1794622159;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWCm5sO2ZJcIfwM/bU9hgd9OcLaoRmJrQ2OQCAcOYQw=;
        b=rbgzCVtdKW0VnQzW786nIGAdX88FOUCKQHXlA5xI1uEEFUrBrIvDGmbc9AZEdIElrU
         kYEHeWWw+XPoGz7mc76mhtq0pPPTH02sefcVZSeSMGYc0OCdulLTJrxrtX4OR1mzWYsK
         UE5nzBKwbXZqCFMIZy3ygQ9ljPBjc0O2+kYEUvJC/RKVCpgF33Cd4PyRNTGEsliMz7N8
         RGiZXVPhZ6OwkQrc883g/dCL/xSHQiDX0NVs9sXYknXH+96queiB37bRyBQRo8ZCQLML
         EMCjUh0F2inEgYIiNaHl9LgnLZ4soOnXBTY/BQeo3+dN1SBtD/FDgyCrHNGzUgPASEyA
         GthA==
X-Forwarded-Encrypted: i=1; AL+hErGvQKjF5ABECy+XTxSqvtsmHJOLP/FaaKLCFqzAJbu1aEOxUbKkhKFvhERoj2Y1gSiZB9v2Sez5/UJ2DfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y9oB+94/7toSGZKCusWhzFBWYwK5K1zc0WvOJKdZBhTNeb4Pc
	B9ayF175OExG+acpIUTOt8JTRTAxLHunQk5dxG5FdaRmfkg1V+RUdapR8vMbFg==
X-Gm-Gg: AYBFou1fMvLKdftslfQsrkoC6uCoXgGayfzVpvILsziNNQhnvi8fVfO4PH0y+RLdshK
	oNO4Gk3w6kEgirkSz/5HG0vfJB3UNvAUgauAogd2lMVaYg2L+pM3raw33kgYUDsP4iA5VrdVqh8
	HJdcQA9gaZCzjm+XtrwoBJbnFNboNKs1rqmenpg/Rj25WxoTf1G0CeE0eyzojh3kJVJJ55WhiJ/
	kQ4b5pXcGbQyGzhg1YXcl3ar3FRZq/+CSZNcdTy22t9DFQM+T6xsElrc0cBF9Xd6SJEwg5fnNz+
	rhKiYVqRerKlLUyiSzaRsIQ/W81CbeydgG5NLzGgIndjEMHZtYSDsxdCoPgw2iL4/jYMcju803J
	q6PABuc/sTDo4ZDMgUrLSJgI0E97EZMfqjmawnba5VGd86FISlE6VF1VSG8ODNMimE7uHIA4/0G
	vcly66f8mDaj/UkkznccwRGxC+lZJkNMxY06624zzIcKXKF8q/uvgTr+YbxmD9F0k4NG9rc652C
	+zS7ndrexDNRyegrp2wV6kzS2nJQ9ERivXtuz+jpil3HXw7VmxsJ1aooxhztr2eZuZq957vkzPm
	IzR709wiwiAx+G6M+pv/trK9+khYExoznowiTQzQR0ZUjnRKFDiphZZp6bYHeaKxU+ffKp9l89k
	bYDRqnrSQDcBxXVv5pm/R6ooBvzJ3DLN5mA==
X-Received: by 2002:a17:90b:1a91:b0:3b0:ae41:2707 with SMTP id 98e67ed59e1d1-3b0db6fe133mr4547927a91.45.1794017358501;
        Fri, 06 Nov 2026 18:09:18 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864375sm1156571a91.4.2026.11.06.18.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:09:18 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 02:09:17 +0000
Message-Id: <DMOM2SFCFHYK.3BT44IQ90X9UB@gmail.com>
Cc: "Michal Luczaj" <mhal@rbox.co>, <virtualization@lists.linux.dev>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH net v4 1/2] vsock/bpf: release sock lock while waiting
 for data in recvmsg
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <jrmmhm.kernel@eldare.de>, "Stefano Garzarella" <sgarzare@redhat.com>,
 "Bobby Eshleman" <bobbyeshleman@meta.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
In-Reply-To: <20261106-kbh3-1-022-fix-v2-v4-1-c7d36703814d@eldare.de>
References: <20261106-kbh3-1-022-fix-v2-v4-0-c7d36703814d@eldare.de> <20261106-kbh3-1-022-fix-v2-v4-1-c7d36703814d@eldare.de>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 01:57 PM Jerome Mohm via B4 Relay <devnull+jrmmhm.kernel.eldare.de@kernel.org> wrote:
> example by a credit update. So the wait also loops until data arrives
> or one of the native exits applies: a socket error, a local or peer
> shutdown, a socket that is no longer connected, the timeout or a
> pending signal. The loop alone, with the lock still held, keeps the
> deadlock, so the fix needs both halves and stays one patch.

No need for a 2nd copy of the return values.
The old code returns true on RCV_SHUTDOWN. The psock queue is empty, so
the caller goes to __vsock_recvmsg(), which picks the return value.
tcp_bpf, udp_bpf and unix_bpf do the same.
Do it for sk_err, peer_shutdown and sk_state too.
__vsock_recvmsg() doesn't wait in any of these states.
It handles len == 0, MSG_OOB and MSG_ERRQUEUE as well.

The copy differs from a socket that is not in a sockmap in four cases.
The diff differs in one, the last row:

  recv()                          no sockmap    this series   the diff
  ------------------------------  ------------  ------------  -----------
  after a virtio reset            -ENOTCONN     -ECONNRESET   -ENOTCONN
  after a reset, len == 0         -ENOTCONN     0             -ENOTCONN
  after a reset, MSG_OOB          -ENOTCONN     -EOPNOTSUPP   -ENOTCONN
  after peer shutdown, SO_INQ on  0 + SCM_INQ   0             0 + SCM_INQ
  asleep when the reset comes     -ECONNRESET   -ECONNRESET   -ENOTCONN

Instead of patches 1 and 2 (compile tested only):

diff --git a/net/vmw_vsock/vsock_bpf.c b/net/vmw_vsock/vsock_bpf.c
index 9049d26..3cf017d 100644
--- a/net/vmw_vsock/vsock_bpf.c
+++ b/net/vmw_vsock/vsock_bpf.c
@@ -34,24 +34,34 @@ static bool vsock_has_data(struct sock *sk, struct sk_psock *psock)
 	return vsock_sk_has_data(sk, psock);
 }

-static bool vsock_msg_wait_data(struct sock *sk, struct sk_psock *psock, long timeo)
+/* __vsock_recvmsg() doesn't wait in these states and knows what to return. */
+static bool vsock_rx_done(struct sock *sk)
 {
-	bool ret;
-
-	DEFINE_WAIT_FUNC(wait, woken_wake_function);
+	return sk->sk_err || sk->sk_state != TCP_ESTABLISHED ||
+	       (sk->sk_shutdown & RCV_SHUTDOWN) ||
+	       (vsock_sk(sk)->peer_shutdown & SEND_SHUTDOWN);
+}

-	if (sk->sk_shutdown & RCV_SHUTDOWN)
-		return true;
+static int vsock_msg_wait_data(struct sock *sk, struct sk_psock *psock, long timeo)
+{
+	int ret = 0;

-	if (!timeo)
-		return false;
+	DEFINE_WAIT_FUNC(wait, woken_wake_function);

 	add_wait_queue(sk_sleep(sk), &wait);
 	sk_set_bit(SOCKWQ_ASYNC_WAITDATA, sk);
-	ret = vsock_has_data(sk, psock);
-	if (!ret) {
-		wait_woken(&wait, TASK_INTERRUPTIBLE, timeo);
-		ret = vsock_has_data(sk, psock);
+	while (!vsock_has_data(sk, psock) && !vsock_rx_done(sk)) {
+		if (!timeo) {
+			ret = -EAGAIN;
+			break;
+		}
+		if (signal_pending(current)) {
+			ret = sock_intr_errno(timeo);
+			break;
+		}
+		release_sock(sk);
+		timeo = wait_woken(&wait, TASK_INTERRUPTIBLE, timeo);
+		lock_sock(sk);
 	}
 	sk_clear_bit(SOCKWQ_ASYNC_WAITDATA, sk);
 	remove_wait_queue(sk_sleep(sk), &wait);
@@ -80,6 +90,9 @@ static int vsock_bpf_recvmsg(struct sock *sk, struct msghdr *msg,
 	struct vsock_sock *vsk;
 	int copied;

+	if (unlikely(!len || (flags & (MSG_OOB | MSG_ERRQUEUE))))
+		return __vsock_recvmsg(sk, msg, len, flags);
+
 	psock = sk_psock_get(sk);
 	if (unlikely(!psock))
 		return __vsock_recvmsg(sk, msg, len, flags);
@@ -102,10 +115,9 @@ static int vsock_bpf_recvmsg(struct sock *sk, struct msghdr *msg,
 	while (copied == 0) {
 		long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);

-		if (!vsock_msg_wait_data(sk, psock, timeo)) {
-			copied = -EAGAIN;
+		copied = vsock_msg_wait_data(sk, psock, timeo);
+		if (copied)
 			break;
-		}

 		if (sk_psock_queue_empty(psock)) {
 			release_sock(sk);

[...]

> guest's virtio-vsock device. With the series applied they behave as on
> a native socket, except for the reset case above, and the vsock
> vmtest.sh single-VM tests and the BPF sockmap test_progs pass.

None of these tests sleeps in vsock_msg_wait_data().
The sockmap tests call select() before recv() or pass MSG_DONTWAIT.
vmtest.sh doesn't use sockmap.

pw-bot: cr
