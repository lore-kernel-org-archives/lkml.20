Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F245384CD5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856263; cv=none; b=dyQYEeCJMLN32LjhHr58thG2/iwspcMikpg3RgbWU0KZRvnYYC39FjXqC/bGd84W693UC/OkIJ3avxkzSJlMVOLk3vHiDhlYrTDBmsk8IW6g95ry5LasDyHoD2cZf11DNYM372zckIV6mlacBv8JGy0bJN4XnxqoVce+AOiS0Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856263; c=relaxed/simple;
	bh=a5Y2KWWWwAi4V/RQWwZJd/MSE+q2UPPC+lrYmqC0FlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f8iwCh4XYb+o+o6592Ix+pFS8+L6b272U01n1FyZPNCdVol0fPaEaQh3taFMTYZvx1xfYrDXNi+F7VuIH2TCbuI1/C+oB3Mm6pOzPmbHYPjiIRDEOiCiMfavSZntaPB/ofGYQWYGJERts9vAGxs3FIv0sEcvg3F4aa/o5giOtIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLRMjMQH; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLRMjMQH"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1442026a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856257; x=1790461057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zj1nZb9yBa52W3cqUr6hajKJjyJRC/rB8Hcxjxs1Pyg=;
        b=BLRMjMQH5e+t9Co4fUn+HTuo2zmqpvQUnRLkmUFbcDce+YdIaN/t4OGvYZimZF3z5g
         kqqKgm3cJcH4+JcolWRHbH/wxFsVFdsuXtGyjGn88E8vB7v7b/IAPZAHBL0FxodGQy7N
         XqcQG5vtLyBvFI5d/Rp3JwjdCxhcJfqD/oK+o67h1/b8K9UPxUdKCKhCXcPCQKkPxgJM
         siMG4HqiQhdEhznsNS/y5WEQGXONQ16tQOhY0sIMApfw9Kbhd5fABJX+ujpnmUhOIpZ5
         DuiRm0ojyR+cCOLP/NZ/Fg9228llnQw4Rn3BpOMqda4r3uN9JQFVmXkVThwtZQ+KHfgZ
         CCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856257; x=1790461057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zj1nZb9yBa52W3cqUr6hajKJjyJRC/rB8Hcxjxs1Pyg=;
        b=A1mOQDnYjOGS2hOXfmVk7VSfMOh8B9yPEOlAj5oX65OE1bUfdSHKOZImoHFUK31pIY
         itEgPL2R/Ll0lDgZrsgEDP+L18PWTOtSwt7gSakxhgtxb0viWEXrugsRrSSFx/+vB3ge
         Nqc8XrobMrfDa0C3FelDw7X36ovF65G20HdsrbbczVSg4jez4TsOc4EXFZxvu0codKNF
         w443pf796zTS1C3MpyTVYxjEtSm/vovMuA7FnlPlbILGzpvm5OZ9Ijc78ukc8V7t5lB2
         PgV8GW2d2qYbYOMYOKh2pIXzYZ3l2oHnNv5y7FoGmdiD0LzXWXVkX08hYawnx6jVo2fO
         yZuw==
X-Forwarded-Encrypted: i=1; AKwUvBx+wS2+dxu4+hjkjjQV8pS8L/xi7nx/oP0BauFaaTkp8F13vgRCPbnE9izNcqOaqlEoKLuYcDwzezpDQYU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHM5vW6iDnU18/CQ2DTFVVWfRP6l980XXJqzvuwopPYf8faXCf
	74Khz2yDZsjfPU9ybc1zlIr07uv/fB0KVwBr0yh+PirBpyvHHrbL/sYp
X-Gm-Gg: AYBFou3fDNL0WF0DLcVofMNUen2HuGIpsXdv8hgD8x6t66ks/G0KrZ1Deu4AjlZhSfd
	6JcfAd8UrhU+a4GG3JXNHxczqzzI54/sRwidiK2SfdcjsGjwuuAuVYn+YzEIJLCjpSXBq32b/eZ
	Aiy+tFTfQCNcMphkjPhW0UETemEc/D09PHhdtSrULDtHnIzArUUMaHlecPbZkQxFnxm8IQRc+Mr
	EwLwTVgjO9mfLFCqrawEfJknSwjafmNadqyoO+qagkWOiP1gfjOF9eXhUP8CpUXwbIs4TZBrLn/
	DEiiKlynDPEez5O8Y2pYiML4HB/s9Jn2ycvGg8izwzMIgi/QzIeGVCw//B8l2P3RA+kCYkvEJFl
	JDvFXfX9CUZYPrGbkqV892yjseXsNdrYZoWgJ2TUBo7WipskXrbrNNy2oQr5V/8klVxEv/onBpk
	3b27Q4U64eenBoJ7XWzA7Tu3T8/3mbzQyZlrTU266fOiaksHDSwU6ABdTLOMJ1lLQhQ4Y3/D57E
	F50qEFdf3JJf7k6Y6rRILSLnhahOEj8+6eEredZpy+sPN3MSvdpruAHV4KVVdhqtqPXwo1JUqUH
	9aMZlZK3fA==
X-Received: by 2002:a17:90a:4c82:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-39e6c6a67d7mr3165966a91.67.1789856256925;
        Sat, 19 Sep 2026 15:17:36 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb3284asm6236175a91.14.2026.09.19.15.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:36 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: kuniyu@google.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] af_unix: fix u->inq_len accounting in manage_oob() and unix_stream_read_skb()
Date: Sat, 19 Sep 2026 22:17:35 +0000
Message-ID: <20260919221735.3708237-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an old OOB skb is replaced and discarded in manage_oob(), or when a
fully consumed OOB skb is skipped in unix_stream_read_skb(), the
discarded byte count is not subtracted from u->inq_len (or is subtracted
inconsistently), causing SIOCINQ / FIONREAD to report stale positive
byte counts on an empty AF_UNIX stream socket. Properly account
u->inq_len when dropping or skipping consumed OOB skbs.

Fixes: 314001f0bf92 ("af_unix: Add OOB support")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 42cffeafc8c1..1770af3c2684 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -2849,6 +2849,7 @@ static struct sk_buff *manage_oob(struct sk_buff *skb, struct sk_buff **last,
 		WRITE_ONCE(u->oob_skb, NULL);
 
 		if (!sock_flag(sk, SOCK_URGINLINE)) {
+			WRITE_ONCE(u->inq_len, u->inq_len - 1);
 			__skb_unlink(skb, &sk->sk_receive_queue);
 			unread_skb = skb;
 			skb = skb_peek(&sk->sk_receive_queue);
@@ -2884,6 +2885,7 @@ static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 		return err;
 
 	mutex_lock(&u->iolock);
+again:
 	spin_lock(&queue->lock);
 
 	skb = __skb_dequeue(queue);
@@ -2893,6 +2895,12 @@ static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 		return -EAGAIN;
 	}
 
+	if (!unix_skb_len(skb)) {
+		spin_unlock(&queue->lock);
+		consume_skb(skb);
+		goto again;
+	}
+
 	WRITE_ONCE(u->inq_len, u->inq_len - unix_skb_len(skb));
 
 #if IS_ENABLED(CONFIG_AF_UNIX_OOB)
@@ -2908,6 +2916,11 @@ static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 
 	spin_unlock(&queue->lock);
 
+	if (UNIXCB(skb).consumed) {
+		skb_pull(skb, UNIXCB(skb).consumed);
+		UNIXCB(skb).consumed = 0;
+	}
+
 	unix_orphan_scm(sk, skb);
 
 	mutex_unlock(&u->iolock);
