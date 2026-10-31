Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793444926;
	b=S/kmNNmaGUhSAgmNDpJQy2Gf2Cz5p/KH5h+68ldkpuYnIoXDS/wlbp6n7atJot4/ZFJC
	 otB8G7hff9HLSsLVk+jib669QEXj+bNklbK/JH81saSBA5qicOyOEAZ4ZqvppSgOvhMgz
	 cUfNloOLNuEEupt4BhvKlXk6Rk6riesrigsS0iUfw62rL7sb5jLv+dENz46TcYL3Qk6j6
	 YfN9IUjTkbltpB5neeLoBW0xB4Dq1Vm1T0nPK+yK2pBkuxYwk0gkGyyU9iDlebYYGmXAw
	 BFoeHPgvVutMhqAGWNzKDE6Vd/AZfCZ+ZZCxQtftKLKY9rvOWA2xAcnx5LJvoSoGEJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793444926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qn1VaOGofv/ujd8ZvwN7vtgFnr5O801uRmpZaOHHctg=;
	b=z7pC7ANCOnveSRhkZk9mEndqmcWXnqiE8ldorf9D/DU+Mhvb6D43wKTzUbylwGO+Ytwv
	 Lr5oZEVsXA35zULqnEO/o74xG45kVqt8TZf2/7B5q1xBtFL5M8qSpmOR/ktaTlWnvVcI3
	 3H0UdUxrEbeo9JHkjmnce5skCu9wytBACAy6t7agS0D5qvvF14QDcHcvfkeYgpiwxICef
	 pgQHIXSLmh9jQea+bB3oYHH/cZcbIOCoirALzdelA3+EtDxV/IV+49hLYfXIAmUxIr2ka
	 vEi32BUg4nHy1bI98618FsmFhP+frrHDsPRkludqbNL/NuFnHTrmQHgJnWv0PP/O0uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIMQ7ych;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A9B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIMQ7ych
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9587795e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793444924; x=1794049724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qn1VaOGofv/ujd8ZvwN7vtgFnr5O801uRmpZaOHHctg=;
        b=EIMQ7ycheZTgXQbRjcokmpZmK/CLPHtHH2SfHppIfhg2oKERKmSzR7izvPkjWhe74x
         JtC85StnC4zSC+HggZdELNK4281l1dAisngx+zfIAY6Qu+2H7ma1noI0MeSUNAh2dkWN
         tHXY0IBTqo3993BBJsPrPrHzwlvDcxMNJEc6bgMA4BOrQRLMTJwOVcBQ2y1fw/1Djr7W
         NdJklECyUwPZHY1sHxiqOfAG2Pu/6pi4TrfMLcYmj2qMObldWiiA/NrEcKR8pKUkdae1
         Qr3WBG91dtg2IhgBcP1taAgips5v+ROTywpFHCCvAAVR5jULGSVMpbySJVrfjBSSUQKw
         tEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793444924; x=1794049724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qn1VaOGofv/ujd8ZvwN7vtgFnr5O801uRmpZaOHHctg=;
        b=d3vhMKDjn0RTHdwAjUHQ0BSMCyYYiuV2A1eSThhGT5tPGRYRt1D5toz2D5g2URAtAM
         v4rBFbVgPcuEwJKYef2HvAFY4vpr/EOBE0aq6DRWgfVhBCrcaHn19YQpvevsIVw7mm0k
         yRqMbtolANhJ9P9t0Vpwwn22AbIAI5KuwOZOnYE3KxAMqKDZe8DDU2FRi0HIv84yhg8F
         ysO29b8cTGQy4TPan5JYeQvPov03H6GsbSW8iWTJopnkQjrgWWC8bATW6B4tmr7h9iuR
         gdFmPS2bDXM/sAuGmQMmouw/aJ7qLdYgIV4lyE4va0oixGFpZVdOYpge6d9Cb50jYU0+
         iQ/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2WfMLPgc2k1yd/1Gp6lg6SGUXHl8W3hQlOmGOERc1mw17/ZIuJhKvT22yV2NlCEDSXWJ6IAeZx7358zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl94gbqvanNIbJrerbOEdqSIq2mAIGVr0dlf5hmF/Ilx8Eh9kK
	+ED/60k7qOrxX0h8tZ09HTvONLFbxi/ewXlMcdLnJ0lE4oFnUAJXHaH/
X-Gm-Gg: AYBFou1E3hQ/mqY/+nhcIfzuBYAXT4r1JxRkd8w/j3gu/uqxASfENLJJRpEAvP/s1e1
	3JOS2k6JUp1bk/x7QmR72q7kbe16uTin1J1uWQRIpN4fvDxvBsye27YZONlCIBhrHasZIJqdKdQ
	qBjNYBx7CT1N/QKh/LiZ/aJ0uJ1BUBuLsjblCuZfRl7n6qQdmS8qm3uUNeTDLm98UCSA2nCnDyq
	hKrW7f8nQ+x26Lmyi65jDq/jKzuY1Kj0w36PXRENZp3PmuA6rTovS5gWMA8qkRpPabv0Uh+WlnM
	mV70Ji0yvzfiZtTwiYBqJawdWJhYQbU2Wjc2RUCa6V2dPU+PpUeiq87HtP1MDHOhJ8WoXfn02jd
	0HTSoaw8QUwR6CqAxIuauKExlAQOfIOjUadkOknhH3dOseuhfGZREEKc4izEMFYlGVZHTEG7KJd
	YrqxviFF1kX8ntlyWK7YiHw/ZrBo95LyOBKEvuN2Ks8YSzWHpz4Wxx9uor3dMn6lqzgw2CNO2c8
	Q9J42QJPzOdBmxNCh7ZGD8QV1/3r2souwBtrrvToOBd7FzEa4bHaAoXZfecBcTkuy2vCfeSimXt
	8iulZTUGoPGJOpPQ4u5DKnMNNgKK59oCuLPfghR/hkFyTD+m0BBQcgeJpnwbSBrhNQ==
X-Received: by 2002:a05:600c:138c:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4ac17ffaff2mr107425825e9.7.1793444923989;
        Sat, 31 Oct 2026 04:08:43 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm8190774f8f.10.2026.10.31.04.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:08:43 -0700 (PDT)
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
Subject: [PATCH net 1/2] net: check the sendmsg LSM hook for every batched message
Date: Sat, 31 Oct 2026 13:08:40 +0200
Message-ID: <0b1a91e7fa0de128c6e2bd3ae2f5c960a5c0f883.1793444262.git.thnkslprpt@gmail.com>
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

sendmmsg() skips security_socket_sendmsg() when two consecutive
messages have the same explicit destination address. The comparison
does not account for the message size, so a BPF LSM policy that denies
large sends can be bypassed by placing an allowed message first.

Use __sock_sendmsg() for the cached-destination case as well, so that
every message undergoes the LSM check. Keep the remainder of the
address-caching logic unchanged in this minimal correction.

Fixes: 228e548e6020 ("net: Add sendmmsg socket system call")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 net/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/socket.c b/net/socket.c
index 2e3b5737c481..c2a85224ab55 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -2709,7 +2709,7 @@ static int ____sys_sendmsg(struct socket *sock, struct msghdr *msg_sys,
 	    used_address->name_len == msg_sys->msg_namelen &&
 	    !memcmp(&used_address->name, msg_sys->msg_name,
 		    used_address->name_len)) {
-		err = sock_sendmsg_nosec(sock, msg_sys);
+		err = __sock_sendmsg(sock, msg_sys);
 		goto out_freectl;
 	}
 	err = __sock_sendmsg(sock, msg_sys);
-- 
2.43.0

