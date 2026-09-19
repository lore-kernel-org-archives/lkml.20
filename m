Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14C37E30F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853798; cv=none; b=q4UeUG7MTG0LeiKTpQVKkLoGTEifQKhgk3xp8mJTJ9mm4QxNcNmJvGnqsJyIbDW9OjElFwENfVqscPfIPbKoh27/ZLwEGbcEOS23VXIr/LvjhYu8vWpdq97MZssDAPlcc4C7g74gQ+jDy2OGureNGzUpQRl0+jhYeO4csv/71yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853798; c=relaxed/simple;
	bh=bMfllS2RYCeR0IwhWUFdoERnpYtUYbtX7V1i9njrQ8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQGt9tG5OSMz4lI0fJEge9IddppCy4h6E9OwBJFXg+H/HNauZaZMX4Y+HNxYBa//q8oO9ubj+F37j+GvQjhOLuHCDhBBhdIGjbp7Fv9RDrbQWdY3cmLTNJYzc4XqUDLpqmofwI+h3++aau0i9Gymi6ZfRhIPlkWWsmddOYMylZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmH4vtmS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmH4vtmS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so13113015ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853793; x=1790458593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNEBb3BmdvWSvN0iF1avI37h7OoCf9PVvmj/ZWnj+vc=;
        b=BmH4vtmSPsAH0K7IGsnjNo8agE9ilFK8RDfx71IOBlqTsMByFBTaAvwd/PqeAnIvGn
         c4JGlujpkIOz9yCjjZQj1a4t0Z1Z1TcyNKRkZbZrZLzXK9tlN/q7pGLH6nDm426ZdiFo
         mhnZLW+JVVDLbjaYfdEHLyJ8DrYbeiVmDmDFtUFdOzvt6QvSzU9/YgCE1ZJUYz/r8Wnd
         MTrt//ce74GRD6sQSYTGp3/LBv/GaTqt5ZRLJbKyl+6BoYK/Er41VFkGoUX6u7L3Pv9u
         Ar9wJA6NzvMUITc0T83NmdkXSuOpfEGifzhdcVvaeoiiHZ1W37RZ9nmr91Tx7UrkX53T
         yZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853793; x=1790458593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNEBb3BmdvWSvN0iF1avI37h7OoCf9PVvmj/ZWnj+vc=;
        b=D293m8I3xFxJ4F6REEhBwnBSmjQ9giqHM7SpuyunLgNMxS90gkaHxSyqdnjuMX1bII
         AAlO/XxPgwta/KXIFCewhR1iP0dfA2bqW+vGG84ixijMhg+FLU3Bs+3UPCjhqWkuC1uL
         8qs6pRyVOlHUqyYhGmYJliUzSPShUZ0IDxMvmJUhTIsuEU7M9yzOQUr6cRiUPrlGwZgM
         RWlgpfRHcGwfZTjXpLVPIGI366c8hPWJ6P+O9I0Z3M7iLkAhK4l/mvQ86ysva4J05SOz
         MecaaaP/cj9P7wuYCsbG/J3yYyfir3Bx4/x1gKEHCNWxAMJ2oAXMrMTwhpKWmjlME9rf
         NDMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy57pTWZoI0zSSwlWyz7DnxeIpGspnPeOj+9W8O+FI/OazfQXIJ0SUYxZ3CGm+niOpYbnOyfh8TNIEdVuo=@vger.kernel.org
X-Gm-Message-State: AFuF++nrK0pXuPGBQxLHXjm3Lwr5G51i7YEv57MoAM/ThCY2K0/8CPDe
	czGUsX2SZiuICMnjzxKbHEGGzabVU1eW8sbpakVbJAdV57F7sKa47Znn
X-Gm-Gg: AYBFou2I0lrTBfbOhQqEbI376RJJexTDYOTbSl42BE9ZisNcvH0pMlirGr+NLxyj3vs
	sIBUHBFjjHpysCa8v6YbL4hvd+myvugTb+1IX1sCmq611BB9wi2ffx5XK+etrxdtZu0UJ48wcvR
	wSyoM1CxZNHULclZRZUYjQV0QKO1j1UjTh9XBctCLU2BuDD3YlICxNHZB63Vqx08AC2R8PZgoP1
	xWv+X4qz3HloZB0D8jg6dKdaGTJLyBUN9Bfq3EaOiAUOYtCv2V2VbD8i7HeticIN7VHQ9k8jL2L
	9O0B/dsQVotaXR0y/jtkeRYfplIWjDiR4snz4AJVjj6bIPyujK0JQQ+kmisdhtnkNI+QbYXUEpy
	I0XPMGjd2jCrLpMvGK5ZbJQKZfFhRJozoA/2nVIn9aYl5mxNiK0Atue1KtUZfhi7EAO1YG5mBF7
	jJLM3810Dv2jn11KfdmywxQwgMRkW6DrjqdLJrTfeuqzmXro6Bmwe1Kkm+lWf1arRAuTBQ/4Gyr
	PrT5/rDXn3JX6S+93DYSJpxSbrdCz8jh7+qKcRHwNwOKlNPHy5fdLn4XM23i2l6vDwWArR/v6IY
	mlobH4jFQ7+S9uZImrTV
X-Received: by 2002:a17:903:1a4e:b0:2d8:d4d2:d13a with SMTP id d9443c01a7336-2dd9ca3f373mr130521785ad.22.1789853792359;
        Sat, 19 Sep 2026 14:36:32 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17a04afsm12964215ad.42.2026.09.19.14.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:32 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net/tcp: check rnext_key for NULL in tcp_ao_prepare_reset()
Date: Sat, 19 Sep 2026 21:36:30 +0000
Message-ID: <20260919213630.3313360-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `tcp_ao_prepare_reset()`, when an active reset is sent on a TCP-AO
socket (when `skb` is NULL, such as `tcp_send_active_reset()` during
`tcp_disconnect()`), `rnext_key` is read via
`READ_ONCE(ao_info->rnext_key)` and immediately dereferenced at
`rnext_key->rcvid` without checking whether `rnext_key` is NULL.

When a TCP-AO socket uses `TCP_FASTOPEN_CONNECT` (or disconnects before
a peer `rnext_key` is selected), `ao_info->rnext_key` can be NULL while
`ao_info->current_key` is set, causing a kernel NULL pointer dereference
in `tcp_ao_prepare_reset()`.

Return `-ENOENT` if `rnext_key` is NULL in `tcp_ao_prepare_reset()`.

Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/ipv4/tcp_ao.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
index bb7bbc20ba3f..18aca0dd5252 100644
--- a/net/ipv4/tcp_ao.c
+++ b/net/ipv4/tcp_ao.c
@@ -857,6 +857,8 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
 			return -ENOENT;
 		*traffic_key = snd_other_key(*key);
 		rnext_key = READ_ONCE(ao_info->rnext_key);
+		if (!rnext_key)
+			return -ENOENT;
 		*keyid = rnext_key->rcvid;
 		*sne = tcp_ao_compute_sne(READ_ONCE(ao_info->snd_sne),
 					  snd_basis, seq);
-- 
2.55.0.1082.g2b9226bbc0-goog

