Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973554;
	b=HFSodvkDb2dbUF+ly1RBF0JdFWUIs+ZY1UWlS1yVYiiwu0Q/YrEtvRTkPqyqlgAl1YGB
	 uSEYwLz5/JCu0rwG57pC50LlI5pdt/D6oY9E5bBt5DJsXYYJNes2GCDHC5olXGk6346It
	 DnK2dP74NeJbAoKG/Nlb3aONGwAO+gfCgORQieE8iJhv3tI/14Ez7Lx6diuh8HCyVmvHW
	 PDGH/CUZQe5VUz5PcvWt2L3l9deh+oFhg33GHoIlENAm0nvQsdhTLJJt9K2o0BWzDxqjQ
	 HjSnF7GnummDMYFUzAOq04KAXzpdzzzP77z0P6rdquv34ChDxNd8Py6ks9SWQdkTDTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fdyWAktPoh7yf4BNuSuBcGMtWgBKcjHGM1gjgcFt1EY=;
	b=tT28OLuPTbnM5TvPjs9n+mhtLMDs9XjARn9UNQ4SQGngnJHgJQNxkGc41uHxQ3gKSCqH
	 loTqSrksYw72SCdLtKAgaPiNIfjSaGR0fMQO+uup9aSMckLOwRA/ghgy6j2Kw5z+w1H/t
	 C/HqCuxjtw1HbhH9vegwn2BCdzPdrydEAY6n26TOUp7smehMKVw99OH5r+9tviQK8BeJn
	 NO4wPuAE9BeXwrcO/ul7Vw5vcFwz9uPSjSFHzwiyerLbskwUjEA4QNqW/qWjofIf77+/D
	 /gRZS/BXG2utc/6sjgAAlUBM2VmlSmDToesEnV7b+phSpONxli+pZCfWsX7wufgSz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P72btyHj;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE784606D80E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE784606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P72btyHj
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed39646f04so2073165ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973553; x=1794578353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdyWAktPoh7yf4BNuSuBcGMtWgBKcjHGM1gjgcFt1EY=;
        b=P72btyHjY0jWhATyUuntFPnCjQYvQyZl6CAC83+e1eJuLGmmk7Srn9vgLectTb7NwS
         SkjrxMTYbyIkZH1OX9DoDc0jA57Mir0CQ7WrD90TidWTpgD6p/gwTrVFFlxtC0+6PYkF
         swJ3gb2skQPh3jakrbqwFmrYeNOQ08vL2/HS9ib3W2KuLGakO5w5iDpt7u9ISs34WWC1
         4sutvtlrtkR7hlYys/VMaFkUgpIikUYS3oLKM1fSOY2OCUp9MqYI3m/Fhtff1hXOSO/d
         tIr+Bda7xassy/dF+LT7We+g6DFiq0/g/6MV4zsyEQAF1jpiEPZsIiku+lL8KaDmdFOS
         OWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973553; x=1794578353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdyWAktPoh7yf4BNuSuBcGMtWgBKcjHGM1gjgcFt1EY=;
        b=drdlzM44wzrOigyA5XMAtoLjr78+888PH3C4IbjBwRsKhDiBF71HbNaGdf863HLUH0
         k8a+sk5KP0/Q0O4VjtviOGpEJ1wXCotBtCXG5LUR8Nqk3X6iZ5tf/bHRUbfNXP7KX01L
         g7VjdmjC8g+V6VMylqFl57RSOkVKqLNxG4UfJ/kZz7uT8jvyFlGVzk2EoCTAjFUD0I72
         pC6ECK3EN6G7S6fLQrI7gB6WkUdqZL7aIdbNVl9rq/B/kfkyCG461Y/5Wc9QwZWWxrSM
         4NiJMCYTpf7ih/mHzu3KOz8wSLLbkLHTHSbYzihShJkcozk68kZg1Jo3NXrXqomPub48
         ylvA==
X-Forwarded-Encrypted: i=1; AL+hErF0qb7rBt9UR5AChm2QFShj+sYAMEk0sIFyKY5YTQexBVNrZHVMIXJk0sPHJMS0zutEGUZ4WTmkdn6K6AQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zyh6bJ5HAsi5N+kZ06LWvv/TL5D251m7Y/wXQB6vb/ZIyuLOx
	jIXPEKfIm1JuuLKH6OQSp77KmNoe5dFY1st7vkiIi9Sz+2ksG5IbPrY5
X-Gm-Gg: AYBFou3g6KXdri0FsHktCa8oOW3IIaVIo8cs4E07X0K+/+dkeSpOlpNlg9kFrLu1Qwg
	TdzJW3Pcc8fpU9u/8eiZlf8vclcutcMROsYD3dq/5inmx2B+/9hDpg6cbDQ4McAssdx0g60N7Oi
	xglApCch5idwgsF8xJjgbD0jK4EN1MTPsMqX/XBraUs+I0XujAjOYJD5dQKBn+R3GdGtMMC7ZXt
	xbTXI4Jyzy7B6MmYp4AQ5mwif6M2WwOMFwjcaGsfrY8ykmgYpRwZfkg+NDRA4yTXA4r8ScpFbiQ
	MNFiGv89NteZjoH0H8igScFXCnb2E4um7LAlAIFxaSJTSmcnHBpsH2K1SDq9XQ9hcrYYZIqADq2
	L2QvgXJ98dgAHd1H/LIKJQTKimKDNe2hm1WltEHydlIUph8t70qX3pzQyZU1KlzbwVC7Jq9a6t0
	jIqkAfJuT31XqHCJ14p1FpI0blz9va5kj0o4PG82+dBj4N36xVQtvm2gNJgf4QP1qtzoCaPOLhA
	yT5qQ4ZRROC8Dn/UuVZzG9W8kw9UmP/5qQTFKN6il6BtzNm+XelQKcmrYz4Z2xsYZfK11u+zd1w
	T7WFETWFhlvI9/0ETjBBDxDwxGBpOs6rlNWklWvHU0bttqwDgXtnnca5kFxZzKJyRxGSLzKlxcZ
	tYRrgsJVVp8h8iQ==
X-Received: by 2002:a17:903:2ecd:b0:2e9:7e90:8a3 with SMTP id d9443c01a7336-2ed41bfc38fmr34706695ad.39.1793973552850;
        Fri, 06 Nov 2026 05:59:12 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([112.97.59.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d40998sm5634145ad.34.2026.11.06.05.59.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 05:59:12 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <ljp1205831794@gmail.com>,
	TencentOS Corvus AI <corvus@tencent.com>,
	stable@vger.kernel.org,
	Lin Jiapeng <jiapenglin@tencent.com>
Subject: [PATCH net] net: reuseport: avoid duplicate closed socket insertion
Date: Fri,  6 Nov 2026 21:58:38 +0800
Message-ID: <20261106135841.418-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Clearing SO_REUSEPORT on a TCP listener clears sk_reuseport but leaves
sk_reuseport_cb attached to its reuseport group. A subsequent listen()
does not put the socket back into the listening section because
inet_hash() checks sk_reuseport. However, inet_unhash() checks
sk_reuseport_cb and calls reuseport_stop_listen_sock().

With request migration enabled, reuseport_stop_listen_sock() ignores
whether __reuseport_detach_sock() actually removed the socket from the
listening section and unconditionally appends it to the closed section.
Repeated connect(AF_UNSPEC)/listen() cycles therefore insert the same
socket until num_closed_socks exceeds max_socks. The next insertion
writes before socks[], overlapping prog on x86-64 and leading to type
confusion when a reuseport program is attached or detached.

Only insert the socket into the closed section when it was actually
removed from the listening section. A socket that was not rehashed as a
listener is already represented in the closed section, so leaving it
there preserves request migration semantics and prevents duplicate
entries and the resulting negative array indices.

Fixes: 333bb73f620e1 ("tcp: Keep TCP_CLOSE sockets in the reuseport group.")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Cc: stable@vger.kernel.org
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
 net/core/sock_reuseport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
index fccbdd0430b0..775f446516c3 100644
--- a/net/core/sock_reuseport.c
+++ b/net/core/sock_reuseport.c
@@ -480,8 +480,8 @@ void reuseport_stop_listen_sock(struct sock *sk)
 			 */
 			bpf_sk_reuseport_detach(sk);
 
-			__reuseport_detach_sock(sk, reuse);
-			__reuseport_add_closed_sock(sk, reuse);
+			if (__reuseport_detach_sock(sk, reuse))
+				__reuseport_add_closed_sock(sk, reuse);
 
 			spin_unlock_bh(&reuseport_lock);
 			return;
-- 
2.55.0

