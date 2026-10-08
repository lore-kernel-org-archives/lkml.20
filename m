Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C514A490C0B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453886; cv=none; b=NS83//JlecwvvGKgN/D+Ye5qxae19mzx+RC1g4xGcL4qX/a5YbncDXR8fHWsFJQT1yCGmeKBFRpAonw2FeQMRBTaWZVqzQOEPvAeavUztOpcBUf1jbujw54dqsaqaMb8kf24RGsKsbHYorVEJMruwjrXHl0wul69IbiZNoB5nko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453886; c=relaxed/simple;
	bh=IBBWbJgmFH6lJu6+QIx/O2wKOmeF5C3uunKkyAaCrOc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ts1ubXJdCFunSSmmhHe8HrgnSwDY6O+pJrC4D7IdZuWqHKJabYivBV/fusMl1LdetOoTlL60J3PaVPz5PHXJd3St+1JbxFYrZ5TtUBujB24GLovfU5hmrcoaiNoqbCErlemZnbZ8DPw7vT6zoKZ3m9Uhv/pZObq9iurbF/eSN8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvsqKtor; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvsqKtor"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6afe29c08ccso3736891a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453882; x=1792058682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3Fkc6KptJmnbz47ELueijac4ZeGq0qNxwAnlB3zbrE=;
        b=AvsqKtory3oSFHdQ+EwdbZaQQ5KmBKLfaJPpTc2U8nGA8N3o0xqDvyhBjc1b1K+6RZ
         K3h1XbbBCS/3gKczzPhOBzii1FpazBL4SMJHw6fvsfxLWF4BKsVyEkujfZtMwPXQSfLw
         i+RW6tFFhUC02YuUXGKTjFPCr+HxUuIQooRMH4kMQOXkRxJ/xEfJgv3ZJYFNyfjpsXO6
         QnB3JjPDExK20r1Zm1DpV5aESkKBRrGo9HsKaLt4T6IvrD/gkREuXruJlwzpq4G4G6mi
         gZs+D+LJ+IwqeZFDSa/ax1mg+j/RaGKjKWEUr1hQvlDfKidWzUe+/gJTsnTQIVm2I5Qr
         9yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453882; x=1792058682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3Fkc6KptJmnbz47ELueijac4ZeGq0qNxwAnlB3zbrE=;
        b=12TOhfkZoRi8jI+wo+D9xYNUIxvTIS+MDYXC/tF9n265ml4ZPDOB88oHMmV1Lf22Tt
         fwGV6tGTI+Yq9hwi4obtRyORT/V4ZzA+vfbqvLyKzvH23yIBjQi2i8EYFbpqMaFUrYak
         D9Qy5UBRfbIVKJAVcBVFbkHjT4mzKQ9b/myht2l46Yu5Bd+4NIVw1mgM0gLWp/QSVwDL
         s+aaDx6trGdJ228aswTmNJcLaRvSi1oauEBzXDtpMDUPH5OuPWqVEru2Yr6pv/Spj37K
         l2krewuHmndOk6hc/rGs5xmuA8vQv9EKADum0EwkV6wYW0yIyNZgg41RUv4QzOD6HmcK
         U3sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcAXJ3u44XqsBdqExRUaePZghVDRg57MKA16JOr7pxkaqbORY4dGe6Jc9Z97AQIBzkhUjlUoTLFzAj9iU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9DjUhaT+kbw/LUBKgLuxB2nJ/ryKpc3i2IKIostqQv+xqlt/g
	9VsgbSy9Ri8LgTM5RUsPJsu8aC0Iqy4EhD3n8t+zHXo182o6lARrjnJ/
X-Gm-Gg: AYBFou3skSi58HEeMyMuQFR45p9j2clntfvCUqhQChv0rMYz0HYpJw5OrUnh+cEFJC3
	Ka99x18b8GZY3AvT6hDyP12dnnvEcDwXxqh8JwuJ2A9C+U9fF+aYnNC0MvZeO/DohntwLUESlW7
	wDLb6umfH/0OtS1JedkSnquWx9V5RCd59bPrY2vTHDMxX4Tj8a/UpeToGSwFQe4GaadSo7Iid5u
	I/twAIvS4RhWY6ym1uhNUi2WspzzhR99FBq5taIS9487V/BpCHlEkjs+++f38+ZenHuOqvtAQz4
	gp/WMK4ypZnLcyHZ7iPq63drIcXizviZ6c4FZ70h19AIICai2LDj7rt1ukyP98s/a2oyo/j2xFS
	CHkS0qeMUDAVNWqDOjuROtLD0j+37ftImIMsau43BDuSGKmiemDg5qX5UKHAzLz5ms8iKmQpUPo
	AHh37VAn4q6jmgJe8cDrSk+KCJnyMu/ZshMoc7qJeIWXLDWeWa02Dco4qp60aZvgo0Cuz8qfg8B
	BUTyZGBYw==
X-Received: by 2002:a05:6402:21c1:b0:6ac:6c00:bd27 with SMTP id 4fb4d7f45d1cf-6aff27b010amr4366054a12.2.1791453881786;
        Thu, 08 Oct 2026 03:04:41 -0700 (PDT)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b009c6a4fdsm1176582a12.5.2026.10.08.03.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:04:41 -0700 (PDT)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: edumazet@kernel.org,
	kuniyu@google.com,
	pabeni@redhat.com,
	willemb@google.com,
	davem@davemloft.net,
	kuba@kernel.org
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net] net: use the full socket in sk_mc_loop()
Date: Thu,  8 Oct 2026 13:04:23 +0300
Message-Id: <20261008100423.1256884-1-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcp_make_synack() sets skb->sk of a SYN-ACK to the request socket.
If the SYN-ACK destination is multicast, ip_mc_output() calls
sk_mc_loop() on it, and inet_test_bit(MC_LOOP, sk) reads inet_flags,
which is past the end of the smaller request_sock object.

KASAN reports a slab-out-of-bounds (or slab-use-after-free) read in
sk_mc_loop() from tcp_v4_send_synack() when a SYN with a multicast
source address reaches a listener.

Map the socket to the full socket before reading its flags.

Fixes: ca6fb0651883 ("tcp: attach SYNACK messages to request sockets instead of listener")
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
 net/core/sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/sock.c b/net/core/sock.c
index e8551df8330f..1302c1e848b2 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -769,6 +769,7 @@ bool sk_mc_loop(const struct sock *sk)
 {
 	if (dev_recursion_level())
 		return false;
+	sk = sk_const_to_full_sk(sk);
 	if (!sk)
 		return true;
 	/* IPV6_ADDRFORM can change sk->sk_family under us. */

base-commit: 6d25ffca055a77787c21a36b66c253f76239411b
-- 
2.34.1

