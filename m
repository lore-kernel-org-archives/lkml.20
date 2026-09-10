Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A772853E9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083983; cv=none; b=hrheOfd4q7J072cwGI2FXIQcS0OJsergLopx/DmyGs6TAkISiu4pv5SPCSBTwbw5CZhfab6ZrYIde+1n55fqxNe9F1zVcZmRsepFXU2lkJuK96y7vJLlZg3tUH80KfDuwxwPRvDts0KHGDBnv6mtiZNPnenbQhAV16NdeRQclRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083983; c=relaxed/simple;
	bh=M6jIXaEoyrgc6/WiURsN+U8IhrrnZ9zZFg+Oj7F70yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfW72PpIiLSkdbLesdr+wLuBDYoxyt3Io5lMjarjmqqOyIEPIGh+L9g53KRzxPdlIs6qwZY6QdUs1JFMY8/wgOurq/EZXLM6lxZcU+Oj7WPvYFaVuuqlomx0W+pHiYHzUFV9klYAzxBBXCycxbSfBbsi4K85YD6Mn3C5Rh5xbRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2zxLEdh; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2zxLEdh"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f64ea07036so353223a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789083980; x=1789688780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbyz7e2Zj6Paq1U1ORPGnZB2czddhzmepRdeHB+cyyk=;
        b=h2zxLEdh2X+9pBLiJGXLrsF7DuPx0SdMZj202+AUvu8KfSElB9fEgE145Bxigj4AaA
         u1LgPi24WJzLIPC3Ul4quk3T72yvOtIRcand7Ete+47fyfL//NNTyMG3PXMj/iqH4+Ny
         QNkg2Mhy7ddOPMQ0mBNHQVU4UY1ipAIiXRL+GNmwUvf23+NQm6ZL2AAITHbxx0/6egQN
         6gq/FI7XVpOyAQS+//I6tkbUIJ6SRTYa6fUodc/SD8sHgCYev3YBRNMA3q39ZK04nnYu
         n0UGk+hwJgpsllh4x8XRiPAePsH8aZ83TNZMX8lYIjm2Bl2L0f0Api6sCwAHuAmN3TN2
         mClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083980; x=1789688780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbyz7e2Zj6Paq1U1ORPGnZB2czddhzmepRdeHB+cyyk=;
        b=r3L8rR0gYj99ONaVJdR9VSY+x43n+gHzwpmDflZ4MHFADbX8FY6f6pnV7mmAqWx6bC
         EvlJ+2CinL8n6/vX4YSw8p5KgG4rXuEqn59L+ZlCu6X8RbCx/sbU4t6CaandJBtP5jM2
         MV7CyPxPrkyvfnUSqDsmraPLkeygPVj7Cek3lqVWmxymnz0xMO1xVuPiI0lWVkDHuMW5
         HEtAT1KIvYB79vkwqEwlCTHtXpYqxGxHc7+ErALIHngEVGtSoOTFXjCF5DBywkTN0llt
         BnT2/0eE67HEiQOyXILOtZRG4HnOVHCOKkJGxLenL6xGUkYFqYG6DNAvU7DCP5u0ioIb
         uiaA==
X-Forwarded-Encrypted: i=1; AKwUvBx8D7VvqpfPah5eJu/cZfxGo+EUxsXc2jS1Zn3MGpV861g3Kw4Tojk/7j6v3f2x8gnmVLjw3kHRfMGEDCs=@vger.kernel.org
X-Gm-Message-State: AFuF++lKxUqDiWsHh5hSOE5XxqAEJjL24VJYOfAcYjbaZ3XQjVJ9e+X9
	45OcJvJV7GFXRXJqoS4j8ZiH5aj80cGQ4tD+DwqQF7d1diRx6L+RqJFe
X-Gm-Gg: AYBFou2qcVEB+muyd9S3vP5o/ckS6Qfu1CEipGksjIlImkxbD7g5xUOHgwtCfPlwV0k
	uxv3UHVUD5srByTcDXSKywNI792o62rbJGd7g2dfZePQF01nYD5Iqe+whyv1VfZWdDZM7kS/b7a
	zxmqKO0qPu7za8+G3F8q32qgW8NO/wAx7NTV1UlPznF4pvpav6sN8DTWFS05kC1g8OwGS2pWZNZ
	9+mWjCQtdgioHRxjJzM+8FLm3e+G1wLLZX2CKWWydhrvfUBki7Mq8bc+XRPqhFLObvad387HuUK
	vYNdp145rG9l1Dqr6iCVYV2cN/3EGLQelZiPUc+DwWiTPCAEl2Ht82SmOpPK/hEDaVw8NlzxGH7
	gw4enFm7ctS8pIsFeDwPRm3yNhnN0dkc1+AKWsbn2f06GPp7RDjwCrZD4zbG9odcdCS7+j98dXv
	eo/8lLVuYcH4yWocgW+ZZHfiX1R91RTCcZ9s0XqDgp6v3QDOtRJrlQOadhYhE18p3DdZg=
X-Received: by 2002:a05:6830:81cf:b0:7dc:df37:844b with SMTP id 46e09a7af769-803fadd1e9dmr1084870a34.4.1789083979942;
        Thu, 10 Sep 2026 16:46:19 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f5adf6absm926604a34.6.2026.09.10.16.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:46:19 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 10 Sep 2026 16:46:04 -0700
Subject: [PATCH net 1/2] net: psp: avoid conflicts with skb->decrypted and
 sk_validate_xmit_skb()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-psp-ktls-fix-v1-1-e3f30aaeca4e@gmail.com>
References: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
In-Reply-To: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
To: Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

PSP conflicts with TLS ULP in its usage of both skb->decrypted and
sk->sk_validate_xmit_skb(). Offloaded TLS conflicts on both sides in
both Tx and Rx. SW TLS could mistake skb->decrypted in the Rx path set
by a PSP device as being a decrypted TLS record.

Prevent PSP from being used with other socket features that use
skb->decrypted or sk->sk_validate_xmit_skb().

For now, we include all TCP ULPs in the sk_has_decrypt_user() check,
even though TLS is the only one that conflicts with PSP via the
decrypted bit. This is intentional because PSP was not designed to be
used with ULPs. It is best to close off surface area that may make bugs
reachable, until someone wishes to design and test an actual user of PSP
with ULPs.

Fixes: 6b46ca260e22 ("net: psp: add socket security association code")
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 include/net/sock.h | 11 +++++++++++
 net/core/sock.c    |  7 +++++++
 net/ipv4/tcp_ulp.c |  4 ++++
 net/psp/psp_sock.c |  4 ++++
 4 files changed, 26 insertions(+)

diff --git a/include/net/sock.h b/include/net/sock.h
index 51185222aac2..ba5e5092f192 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2312,6 +2312,17 @@ static inline void sk_gso_disable(struct sock *sk)
 	sk->sk_route_caps &= ~NETIF_F_GSO_MASK;
 }
 
+static inline bool sk_has_validate_xmit_skb(const struct sock *sk)
+{
+#ifdef CONFIG_SOCK_VALIDATE_XMIT
+	return !!sk->sk_validate_xmit_skb;
+#else
+	return false;
+#endif
+}
+
+bool sk_has_decrypt_user(const struct sock *sk);
+
 static inline int skb_do_copy_data_nocache(struct sock *sk, struct sk_buff *skb,
 					   struct iov_iter *from, char *to,
 					   int copy, int offset)
diff --git a/net/core/sock.c b/net/core/sock.c
index fa60b7494c58..9489d9c47949 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -142,6 +142,7 @@
 
 #include <trace/events/sock.h>
 
+#include <net/psp.h>
 #include <net/tcp.h>
 #include <net/busy_poll.h>
 #include <net/phonet/phonet.h>
@@ -2670,6 +2671,12 @@ void sk_setup_caps(struct sock *sk, struct dst_entry *dst)
 }
 EXPORT_SYMBOL_GPL(sk_setup_caps);
 
+bool sk_has_decrypt_user(const struct sock *sk)
+{
+	return psp_sk_assoc(sk) ||
+	       (sk_is_inet(sk) && inet_csk_has_ulp(sk)); /* for tls */
+}
+
 /*
  *	Simple resource managers for sockets.
  */
diff --git a/net/ipv4/tcp_ulp.c b/net/ipv4/tcp_ulp.c
index 2aa442128630..f3e0c9d379bb 100644
--- a/net/ipv4/tcp_ulp.c
+++ b/net/ipv4/tcp_ulp.c
@@ -136,6 +136,10 @@ static int __tcp_set_ulp(struct sock *sk, const struct tcp_ulp_ops *ulp_ops)
 	if (icsk->icsk_ulp_ops)
 		goto out_err;
 
+	err = -EINVAL;
+	if (sk_has_decrypt_user(sk) || sk_has_validate_xmit_skb(sk))
+		goto out_err;
+
 	if (sk->sk_socket)
 		clear_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
 
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 1a2a6b7516b0..509035617894 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -143,6 +143,10 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
 		err = -EBUSY;
 		goto exit_unlock;
+	} else if (sk_has_decrypt_user(sk) || sk_has_validate_xmit_skb(sk)) {
+		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
+		err = -EINVAL;
+		goto exit_unlock;
 	}
 
 	refcount_inc(&pas->refcnt);

-- 
2.52.0

