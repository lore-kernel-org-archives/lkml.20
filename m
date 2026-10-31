Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793444954;
	b=HgsQ7XXJWnFpRavH/m8L4kn+IomgqbDpPtSsTzKGqXv0uEIyMAnLyD3uSNl4Jgsovsg3
	 We+3HNiHkn9hUwzGYB/GZqD20dv9mPoDF2gNIVwgW7Gd7dFAiB5xBYmAFSbIW2c8GQ52s
	 xMGlALMJioGtQKVbkOuIY4vuwCdJMSI4wDXGrus9qXbUJNnoyihTON7v8GPPW3Y2vYAlk
	 3M/yP9pIk5Cj2BGMM2sgiDHVVKmBqqQI88jTAf/nYgYN+0qN/Qg+TVC1S5dyqe5YDzFt0
	 gE4/OYORQhZYQS6lIHi6ovSTqJRAObq1lj1pIbakOoR5S4vl4iLJ/x+7amyYigiB2DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793444954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dBEoy5iqEE1c+mW/hlhl+h0UQlikvbw3e87Ek3myWuU=;
	b=nRz4MQkyo6tSXmw1bVgXtf2DFH+sjvioQK7CH1smvR31M+tBA/FUx0yHaPzGg8P7FlJl
	 lk2TLZY+3JbQHbkxKOi4nlKCtrZ6NEDDmv06TGegvRmOsQ7iAZPUD64LU0wjjpKSckKqx
	 J7H6IiTm2ZYb4zNiqCfPY+k/1mbikZlDi+xizh2s8vD/xNjdlduZJ7GgrTFtTGrPAXGlG
	 scWo5xcXNxrgdNFKI0hNF00VS0zV1xh1ze4TpXViMp4PwsmPCCGa6eVrL4us8K0OmVge7
	 5bcj15SG/JWF/eElvNu/gVKtKFW0eI+XdG7G2Fmf/KuVtYC5UNUYb2qJu5XMM4TJrkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezJTXjiW;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3141606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3141606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezJTXjiW
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso759769f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793444952; x=1794049752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBEoy5iqEE1c+mW/hlhl+h0UQlikvbw3e87Ek3myWuU=;
        b=ezJTXjiWRX8u+57GIh7lc8J3gcmuICa9M7RIvDGzkt0/p5VD5AbZAA2FwdQpjtbuhs
         DGx44hX8P5+dpvioF9cVeF/+hb76i62fTCVxjZi/X17CwRKjhL+4XvYTGlG7cgASRHz0
         QWuN5OIxzwoPZllg6vSVrsvNqQ+R8ZC5Nq4H5MrwBxDE9tDIk7IgBvVGTB1PATvSuK2Q
         txtV5ekYGFUU12sYQdighPpchg+Q4iSU/YU3WCL4VUubYe4PeRss1juPO0EX8q8XTcJK
         ZSQMNq/+LryLcLwci96Q73ed8JCe0dD0IgAN0Z33BKcs5ZysNrOHMxK0yva/T6hEv1kV
         6AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793444952; x=1794049752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBEoy5iqEE1c+mW/hlhl+h0UQlikvbw3e87Ek3myWuU=;
        b=FrSWkrRX7BR6MyDh48TgI4JZw1Ply4xnsqrmRAr6VQdr+AH78zI+YvBFisN0tgkXg8
         gMGHFeq2oqmU8+fay1Dc9ZsAd+CaUIBYA7XcCQ9mPbjALMuh9JaGMoAowydzQdBuDBY/
         2EeE7ybLALtH2JJiYpVgNHKCMT8Runpoe4G4Hu5XnUbIkFlRBJYsrTw6LVRjVAhpl4w9
         ffJYqw6CRmYmTTannSKWgSk53q56JuGSH13uVXevaftn2SJs1VfxuKRwvtlp7ItIoYOf
         gUbBmT1//hw0sh8+rB+erazOvqCpzYEE1lJYX1TJiN/GA318Q+aamE5fgxIf8ueXkhRX
         gA+A==
X-Forwarded-Encrypted: i=1; AKwUvBzdzgKa03c9Nk74gX29nMuQHOjgv9bKWxrQ4HbpKWTxJL7dY5x3wAbMGWd6zn9C/9t8jRWHUZ4nho208bc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAzc3hmLi7hZnVhxHF9zB0h/EbQb9H8oNPt0yIugbNsMLo0tzI
	usEhc/okW0OZzQ+CEHhjSoQXXqQduzVJnsdQZB5IfugPWrtXE6nPZI3g
X-Gm-Gg: AYBFou3s70T7XnnksP2bwsFBm1haLwQTjALiK1tW7j/aMBhzNjSfGgmcWyV25p0ksdt
	NzM39lvAFqmwwTb827laSyAzO6sjVP5fEaOJfFjjz01gajybaPKKL0NvStz1G7vMtO5tiKDwkuW
	7kg4oX6SV2Gs8UnTrt0H8eTZySuzOs7h3Vsd8oE0UOy6XIt64oeddXp0j0A9JdpvmBmWcST2CIK
	NJHyN7oziHazKrK9yDjwpVyTkhx7o/c/uVaFLOHzuTJYRBv0BcCDV9c9RwNUFG8ezKNvghWKLwd
	EUXrTp7vbufYciGnufZbz8yAcUVNfwSV9zgAaCLi5MX1IuOAo/A+ilDKxb6pr8ZlTfiip8Ewc9v
	DjeDQ+UrFR+zdgjFdP5Lnm/PRKQKqd0X4ENQD0HRbhUgQscqS3A1xQg9juyrXra9T+8rAtjdle6
	Y2hIn4CWIEaEBMu4j1Tz5njtVuVSnJjQ8iy04kQ7Px80yd1XN79BJQjVo85ZpfDg3DEJa2+FpJo
	xIJLTuxzNdMELAgG1Li1e4TrH8JYDGyxlafCynJNFB1/ZuZSwtl+H9DHvKsFtaRm7yCqWIKKvrR
	MWL32itHZYyLJFNyfQ1mieKBpXVJ0C4AvX63Utm6xbuR2ipYCf/tCCVZs2z4eAz2fg==
X-Received: by 2002:a5d:64e4:0:b0:48d:bae6:d7ba with SMTP id ffacd0b85a97d-48e6e3041edmr11132647f8f.26.1793444952037;
        Sat, 31 Oct 2026 04:09:12 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm8190774f8f.10.2026.10.31.04.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:09:11 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	kuniyu@google.com,
	pabeni@redhat.com,
	willemb@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH net 2/2] net: check the recvmsg LSM hook for every recvmmsg entry
Date: Sat, 31 Oct 2026 13:08:41 +0200
Message-ID: <edbdf4f4075565b1fb5925d7e311d6f315151a48.1793444262.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0b1a91e7fa0de128c6e2bd3ae2f5c960a5c0f883.1793444262.git.thnkslprpt@gmail.com>
References: <0b1a91e7fa0de128c6e2bd3ae2f5c960a5c0f883.1793444262.git.thnkslprpt@gmail.com>
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

do_recvmmsg() passes the number of received datagrams as the nosec
argument to ___sys_recvmsg(). After the first datagram, this bypasses
security_socket_recvmsg() even when a later entry requests a larger
receive buffer that would be rejected by an LSM policy.

Pass zero for both native and compat entries so each receive goes
through the security check. Remove the first-datagram-only comment.

Fixes: a2e2725541fa ("net: Introduce recvmmsg socket syscall")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 net/socket.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index c2a85224ab55..fff80fbca1a8 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -3057,13 +3057,10 @@ static int do_recvmmsg(int fd, struct mmsghdr __user *mmsg,
 	compat_entry = (struct compat_mmsghdr __user *)mmsg;
 
 	while (datagrams < vlen) {
-		/*
-		 * No need to ask LSM for more than the first datagram.
-		 */
 		if (MSG_CMSG_COMPAT & flags) {
 			err = ___sys_recvmsg(sock, (struct user_msghdr __user *)compat_entry,
 					     &msg_sys, flags & ~MSG_WAITFORONE,
-					     datagrams);
+					     0);
 			if (err < 0)
 				break;
 			err = put_user(err, &compat_entry->msg_len);
@@ -3072,7 +3069,7 @@ static int do_recvmmsg(int fd, struct mmsghdr __user *mmsg,
 			err = ___sys_recvmsg(sock,
 					     (struct user_msghdr __user *)entry,
 					     &msg_sys, flags & ~MSG_WAITFORONE,
-					     datagrams);
+					     0);
 			if (err < 0)
 				break;
 			err = put_user(err, &entry->msg_len);
-- 
2.43.0

