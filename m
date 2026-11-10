Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346959;
	b=qI7RRzTqyNpsyjf0yC3a5TknToftUB23HVOZnYLtfJhNefEkZ0oDcFL0l0xiYlUupkkT
	 K7nQsW7hV527kiukS/86DNcNqOsPVndWtSYC1U+20GXTZlO2i7ZiK3mzb+CKRCmcgBiXh
	 VBSaDen3u6XRBXQxGiPGInUpjTmxxHvYCh+HIOyilAEvKmqhNAFE1epC7plCIrjyMAQKU
	 BD6AZAqlelNmZbS7nXHcwej+RKyeLm7OL+yCO9OwU+IFVyymG/3GBBZLQ85RC9QyUJqsR
	 yi6RYRMdC7EP5/k3XsHxdBlT/vHzIxDKRKN9qOrK/QhlTNuJCOQ4SSEiJmbsHZqkHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5RCtVbPz+qIXu1i5cf+OFt0akM1iFcHbAtV0XVQiBYU=;
	b=5YluYo82dIMzzrvtas5ZBpqXAo9/7z24i5obLKjfPB837gQAq8aMZmwOZQKA2TJf63ba
	 TAZO9P16AFTrO/Lytwuw5zK30zd0OvLaUBc2LhqjY0PuFqAcxRg6Ejs988aCLjLv7DHAA
	 CCV4oappsU14DAhfBU30zFbhzbfk6WlBd+sOYDmmGUvTwLFaQasSjagmSFL4DmaQE1Eig
	 TQyE6QlhDruI5NQ/0xJNwPFIp6CdC6xdRXf5IAsTpwis3Kfw9lO6Xy1OloEYJZyYXInl+
	 c0yJKg+WTQdiyFfkkeootnoWaOHGhvEeoQw40UOMLPajxArQo4vuGA9nw0tmXRlEFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k6H/qLF4";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437E0606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437E0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6H/qLF4
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84d5e56f876so1649483a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346957; x=1794951757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5RCtVbPz+qIXu1i5cf+OFt0akM1iFcHbAtV0XVQiBYU=;
        b=k6H/qLF4bbf7rcyUJTTOVrtLQg1T4mQisUqZqTOptcR9ySMlXow2jQgdbUvSY2ZN3G
         wQEj+U2eBJ7apPFknmoofTcmAR5+g6JbMuuQIqc0aRkb4ars5n7dbyB1LPmPKf6cn/7M
         7rl1i0h4T/v36yR1UJXxaJTdS3NJlA4pyW4xZW2V3NWRAbguVUQl/a01nLVQzcWBATc+
         yeyk53L0xKKE6u/kq2zj8m8tfi+FnmWWl/GWc9hPD6Zh/zkHpOgnBPYQBBum+Uadey9g
         i5tuu17OP0qYFk8Aq1NK7Y/LYAEHa6UK8rVXQr0puM7Wjf877vnPpmHmCUcPBIlNln7f
         0Hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346957; x=1794951757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RCtVbPz+qIXu1i5cf+OFt0akM1iFcHbAtV0XVQiBYU=;
        b=Z/VyXbd2u5HqtJbBXFIz+p/CLmVqpwJbrqNTUXzi0Pmy2yV52coubetmtmn01+spKU
         9UTFO0Xd61S+Xs7bLsvgIKC6qHWKN+P4R6gyXCKaKYh01TapVDiX7SGKjOeSSgsZSkX3
         zB2+MMx/uhPNCSwo7xsAR2MXUXaG1FstLbRrIR/R5tZvltQ1Ukvs3On5QLCkzVo0ythW
         J7ucgk1avbrU/t1cP3ldybfz90ToUWFTsFp3ErRTwu1UCMCS2+ceeO02RyRmqqNuFXP4
         FuPBCEBI1UYcbMP0N1TNMI/aup+AwdbH4TWdEFzId74fjBDakrr+6OemQ3KyN85mUFxl
         C0mg==
X-Forwarded-Encrypted: i=1; AL+hErHjE8hrP8daHkai+psGi+t+zoYD1aHl3/TWFFSa1NowDPJKYlncugQXXTqvMrL19tKxJUy+wLbaZbYaqDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RWbFxqJOqO8Bkh6FP0jGMG8RZZUrhe/HWnoMZy9TNMzoMdjgD
	PBZSGhhGxVzpLk0QPOQal7K+cOs74X+FrKewLIK3wOvWKTS7B1NQ3AjKJWYYILpvchA=
X-Gm-Gg: AYBFou1TNEQ1RMWKah3jucgiOd5zbTmq30JhqqoxK4oBCnCeU2iZkrQAqhvJGux35x6
	eB807XZQ2LvXFRB4hqf4w0g8NrZzutDKIIbModhu/CGhojJR/om9gKHWp6gA48feMZeAuZbUCJR
	JxZhMV+Q1KA38NZhLS80gynfB+tVjLs1l5YmHq9QNW3LJM7BObpWB5pZF8091wJ/T5ZJjRGABSg
	jVCvCKM90FUFybSWYtmI+Kb0tLRyKq0f1Yin3Ir54rHWmOzHwLUeYYvaD4b3HAQXEaTDORpHQUB
	ugDGwnDtsV8vi64QfGjRYIqsBnvjjo+QZBJdxbduvUk1hcmLfarKv3pzHTi+bVZ/cNGgwijplkp
	kl5kJ32Xpb4QohJsP9MggfMYXDioNWqW+EVloR3NZBZqZNXmeOMLcu3RmwaEgCMGqpBNLRD4+14
	T2l8vCdQ/0LR21AWN/H0BY16fAWLblHwnS3oOiVqI7LFdY+r10TlHLck/WkvRKx7NI9LLa2M4nK
	LBvTRsM8p9zL09CQmCukiwNogr9wg2infZegg3dLwR8U4X79EjsI4lKPaQHngINgYJ7oV+1oXpk
	clvS+6er4c5JDFJqb86vTFz3
X-Received: by 2002:a05:6820:1518:b0:70b:8379:c145 with SMTP id 006d021491bc7-719177cc79fmr245993eaf.28.1794346957078;
        Tue, 10 Nov 2026 13:42:37 -0800 (PST)
Received: from en1.. ([204.144.167.9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a945ceebsm2575322eaf.8.2026.11.10.13.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:42:36 -0800 (PST)
From: Amir Abudubai <amirabudubai@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Amir Abudubai <amirabudubai@gmail.com>
Subject: [PATCH] Bluetooth: L2CAP: Increase default socket buffer to hold large SDUs
Date: Tue, 10 Nov 2026 15:42:30 -0600
Message-ID: <20261110214230.3646539-1-amirabudubai@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The L2CAP send path requires a full SDU to be assembled in the socket
buffer before transmission can begin. Therefore, the socket buffer must
be large enough to hold a worst-case SDU.

Derive the required buffer space from the worst-case parameters:
Maximum SDU plus length field: 65535 + 2 = 65537 bytes
At MPS 24:                    2730 full PDUs + 17-byte tail
With 4-byte L2CAP headers:    28-byte full PDUs, 21-byte tail
At HCI MTU 27:                2730 * 2 + 1 = 5461 fragments

MPS 24 and MTU 27 are chosen because they produce the most fragmentation.
Apply a 4x safety factor because SKB_TRUESIZE can underestimate actual
usage because of class-size rounding and minimum allocations.

Signed-off-by: Amir Abudubai <amirabudubai@gmail.com>
---
The L2CAP send path deadlocks waiting for buffer space if it cannot fit
a full SDU in the send buffer. Using the system default typically causes
that to happen before the max allowed SDU. I didn't address the deadlock.
I just scaled the buffer so it is unlikely to happen unless the socket
gets resized after initialization.

 include/net/bluetooth/l2cap.h | 4 ++++
 net/bluetooth/l2cap_sock.c    | 1 +
 2 files changed, 5 insertions(+)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index 54eddcdd341f..0cf1ca4ec3cd 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -26,6 +26,7 @@
 
 #include <linux/unaligned.h>
 #include <linux/atomic.h>
+#include <linux/skbuff.h>
 
 /* L2CAP defaults */
 #define L2CAP_DEFAULT_MTU		672
@@ -41,6 +42,9 @@
 #define L2CAP_DEFAULT_MAX_PDU_SIZE	1492    /* Sized for AMP packet */
 #define L2CAP_DEFAULT_ACK_TO		200
 #define L2CAP_DEFAULT_MAX_SDU_SIZE	0xFFFF
+#define L2CAP_MAX_SDU_FRAGS		5461    /* Sized for worst-case CoC fragmentation */
+#define L2CAP_DEFAULT_SNDBUF \
+	(4 * L2CAP_MAX_SDU_FRAGS * SKB_TRUESIZE(SKB_DATA_ALIGN(HCI_MIN_LE_MTU + BT_SKB_RESERVE)))
 #define L2CAP_DEFAULT_SDU_ITIME		0xFFFFFFFF
 #define L2CAP_DEFAULT_ACC_LAT		0xFFFFFFFF
 #define L2CAP_BREDR_MAX_PAYLOAD		1019    /* 3-DH5 packet */
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 7a2551ef7f50..5f4fde8b4a6d 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -2046,6 +2046,7 @@ static struct sock *l2cap_sock_alloc(struct net *net, struct socket *sock,
 
 	sk->sk_destruct = l2cap_sock_destruct;
 	sk->sk_sndtimeo = L2CAP_CONN_TIMEOUT;
+	sk->sk_sndbuf   = L2CAP_DEFAULT_SNDBUF;
 
 	INIT_LIST_HEAD(&l2cap_pi(sk)->rx_busy);
 
-- 
2.43.0

