Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942397;
	b=vGxKcjLBJTiJhG8bNnDphwMk/HJHClWhLoFQhheJFn3i/J4nWxfEbAl7f4PK8D5yOJhC
	 D7HKOin8Uj6HG7wDU52HOtS1+XELn/ZHPO2BY698zC349kv7ATVQTUFE5AIXlvuDSrnLU
	 PowocyE5+5EQxH/3xcEloJ5UnvHAwdAvvOoD1EmBdca10wXWqXe6kfNWPNQolAPxoaYRO
	 sbrXykLaLPIO3Eo+obUteCOxBAY++dWPAfHq18dTR29ma/3IlGFv42puyTHsP/00u2oYI
	 hGoM9zRPsXFrAeelB5ekNHOq/74GiaDAOVDQJq6VvJ0CqLN5zSUYJPbM0GRTrXhu9nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhvxgM4OU3wkthv1IWxSDKnI9mH3KYqlfOb3SM6sBPU=;
	b=Wr/H5Uzym26IggdgSPLs2T2xI+cfNpQO3f6txAQpbG7udxEdtIdBwg6YifTLVY9MItu8
	 Q+tVzMziKS689UwXpDXwEw1LeF4R9UWB725LFf6mPbwmsGgBxWpVV8oopXJ3fCzu/1ryK
	 IZ/ZRSNOvWytEs0o1veWKdxGVIKHR4fI2Qj1F2qKoiv0QwaVlUUwDDcF3X+6MvPbDCL4R
	 nL5aXW5MV5EbqzldZ2j7N450FeWw4+nt244qMmWd/wbJPPo+uxWmU8F/Lh7KCquAxz9f3
	 vtxwjHRXSWMYgWXGg3nGKJQQCTwEuyYO0Wfap2r6N7YwY4DTAOD16DzXZSBlysQtlFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNE0BwBp;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F43F606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F43F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNE0BwBp
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9ae391a05so1682955ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942397; x=1794547197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhvxgM4OU3wkthv1IWxSDKnI9mH3KYqlfOb3SM6sBPU=;
        b=jNE0BwBpc/e7lmrNSiB0iQ/tyWQZ0whAica8HVjPbf3YT8WinM+PNzp2uUyvLpRxB/
         pWmeMlkaULtOOo2rcPN7mr98adfqyC8rAiDhlL5S08sCeq/u2UhuE6UQNVyIBPFikQtt
         VZ0BJrTbpPsmFqNdKrSVIZyiAvYRTRugZoC49u9eVJAevGNAELm18oNLJJjyY6T226VU
         ZsJWQlUPzaOlU6i9uxXrElJagj5G+2Ox4/Z+OmijG5vxeiFnNRj5dhUlfie1mKesnWAR
         bo/gPr8W3I7XLc18Jn/NQevyBB//FQPXmvEpdcdGgI3Yfk6fi0jkwWiFloZnJJRwQAVW
         fMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942397; x=1794547197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhvxgM4OU3wkthv1IWxSDKnI9mH3KYqlfOb3SM6sBPU=;
        b=xJoou09w+5J0g+mOFxF0UbGlkqAzz7WCllEkSYNZrYY/dOiqGNZ6T3wpYOyYR+0L4k
         5il/mLYAP2Av4ioRhXKAwVp/JYxDnyhcFQxj99w8PwSGYnviM56EGGnqkpSr/DfZNntn
         psy8XZYjrV/Ld3lSwp6ST/uzgaegInvYetj4Z25tW4sgZK8hzRLEmmdXk+zFdYwZiHZf
         9jNB3lsatuQlnzzIPYt7uN76Tc3eLiX9bf+viD4mJYbR9NgqAic2oBg5B8vO9srhlcQF
         wDDDGy4s/ySvExh56V2DyQaTlLy+V7eLID0kjW1jznFISXpgbcuL+Ldkse2/TxcB7T+M
         zgPA==
X-Forwarded-Encrypted: i=1; AL+hErFyRgCgQ+VKbz32gbXyB4AFj1PMuHo/z+ygqaGKeTBi5uqSeAX/PA9TH4ObpNagDZLdKt25yEO3sN9/9v0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96lTHMYnNEsEpCPuMhSfY0DFpGjLSzKw0YP9vyijJwL6KmS1Wt
	SRblPU1aD+0VYbJM9yP3hF0RCnrKCjgcb7jt63erBI2Y9zTZgGkER0ze
X-Gm-Gg: AYBFou0RycyhP0MOn63PL62aUISDOUwWjyDW7pd7uWrIa8AsIiG45SMoM0R7NA77KiH
	RwOxfN5H+hJFhPUQ4058e9nMoKIGOdmJM4itHgo6u5corA5B0gm0GozS3TLCuR1hATRBDbB8M3Z
	n1HHFYop7b8o1qrpF7tUJcblqUQ1UnD4YV0MmFNaHQyqDfo6CURKBwdgzM6zF489EtwD0mN6PRm
	YwZMakxtB3uAroqT+TzckJHBELbxw+SveRviI7GMfey5Xy4ii4IV393q1D332bAla0m+oCDZHxh
	Uexf05OY4j6CVfrfsuisdRWGVyB6QF+NHwwLKIXriaHEf4G0vGGhNaM/P6t53MZK1Oa+rLXVOUT
	eRMYN2TvQQf8jy80qOd8OF3uOZ5irnD6TaAyBlu/IDbkSe4twuuxTLju8rOD3AkVSuq88SGEfo3
	Z9jlihNkQ9kqvsXpoO+xZ6nxQuAG3pJ34d9QOGHvgMz8ivYledOFFso7ftt8UYvmq3k9e1glKhr
	XJX9v57iIm6SNjjytYRqHUHRBxI5MkMLS918RHYbeo3wY4Laxu/bPtbX/EJvFJ6gNWxdg8t7kpo
	TYYJBdt6QrOqgAltb94Qo9JGrB4gK6BN+nEdNwBZ+VLxxqN21+u7wBYt2f0ORksBijSDBEJRETp
	V1u5JilV9OQ9BkFICM6v0qzMPv0PVrVLpVjMq+uEedNGxXKAUjDVnJG+nrqle7Yf57SyfSUJtqr
	6luxv5P0mEIqZZsXR4I8P8rhLSGMhQWtn6Yrf5FG1a
X-Received: by 2002:a17:903:2343:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2ed23e53491mr32343595ad.1.1793942396545;
        Thu, 05 Nov 2026 21:19:56 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:56 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jann Horn <jannh@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net 1/4] af_unix: Fix inq_len leak when skipping unread OOB skb.
Date: Fri,  6 Nov 2026 05:19:02 +0000
Message-ID: <20261106051905.218638-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106051905.218638-1-sidchintamaneni@gmail.com>
References: <20261106051905.218638-1-sidchintamaneni@gmail.com>
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

When queue_oob() enqueues an out-of-band skb onto a stream socket's
receive queue, it increments u->inq_len by 1 for the OOB byte.

If !sock_flag(sk, SOCK_URGINLINE) and the OOB byte has not been consumed
via MSG_OOB, a subsequent normal read in manage_oob() unlinks the
unconsumed u->oob_skb from sk_receive_queue and drops it via
kfree_skb_reason(unread_skb, SKB_DROP_REASON_UNIX_SKIP_OOB), but fails to
decrement u->inq_len.

As a result, unix_inq_len() (reported via ioctl(SIOCINQ), SCM_INQ, and
sock_diag) remains permanently elevated by 1 for each skipped OOB skb.

Decrement u->inq_len under sk_receive_queue.lock when unlinking
unread_skb in manage_oob().

Fixes: f4e1fb04c123 ("af_unix: Use cached value for SOCK_STREAM in unix_inq_len().")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 net/unix/af_unix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 98fcfd7301f6..bfaab7c6d720 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -2853,6 +2853,7 @@ static struct sk_buff *manage_oob(struct sk_buff *skb, struct sk_buff **last,
 		WRITE_ONCE(u->oob_skb, NULL);
 
 		if (!sock_flag(sk, SOCK_URGINLINE)) {
+			WRITE_ONCE(u->inq_len, u->inq_len - 1);
 			__skb_unlink(skb, &sk->sk_receive_queue);
 			unread_skb = skb;
 			skb = skb_peek(&sk->sk_receive_queue);
-- 
2.43.0

