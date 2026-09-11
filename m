Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47552F7F07
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168516; cv=none; b=B2d90jGQcZRn/lFmqn/UcKgRhK+/jt3JF3EBmua8Dfc15Jx5/xzSlIa6++xxBTu1jQn7DAxzZQryCpVcOplPG9ztCqVkuXfraAWJkqwM50ouYMEBaSyMTKk81Ko/Z2kYBAwoRLIJts7dpHxUimyrqS6lkT/QXkoBVxQBH8bVfa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168516; c=relaxed/simple;
	bh=gOjvvX82AUYe7RXXt/0k2kXy8hscDaCjw8dbHhtTwhA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nexYSAbcoLV90mlP1ZMzvpzkVAtjmYRVAsAEREVGgefGso6I6APvN2l5hGRL6UBvPOAsFac6FtVZzRR3Y4VguVB5OV7667h/QMR2e0igKEpMd7wgG0S7q9muxcAf4qQVxua7FejTtgLPzBnN1SRv/8mhypgYQC0EbTbq50RU2mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RngWluNg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RngWluNg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so2352605e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789168513; x=1789773313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2mWYsIChjfxQsD+xpNWBWCUshmCpIYMChyiD6YqWGA=;
        b=RngWluNgpD13XAk7pl1fwT8Z7AJvo/4gZPv4DhiQLuwbuaV9c1KRcMUaDN5XGUO9km
         bi+s7s64SGJBiQGo+kyPnVva88soskgrmZUTGVIO2YYlTZZg6zqQT42f0LVm1JKys7dt
         MPZl5V92B7G7HA+DvjpILm8/yeBtWeLUuphO2VnZGlaqKj8eSw3GnQ43mqNZSi1PfEJZ
         d1Uy51JPOBYwrNa7OoiF3eU+iI4s19QpnmmIsaI2EXWQd8LvwbznPvrFeQRMdDxJVC9K
         ufvIfRqgZxWe3vdm7S2ycRjo192xFiVpu+LAXb7d0W2pk3RjHnRkHxitMz1nkERSw86E
         Sy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789168513; x=1789773313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2mWYsIChjfxQsD+xpNWBWCUshmCpIYMChyiD6YqWGA=;
        b=IPqnA9Ni392Ga4UajmqP/PBTxT5gKhgQNKuR0d32DmxogJsc0G60hpfs13N9JmAFx1
         twQAMBAPY52eEZ87Y6xUf4nHbiGC1kg5Naw1zJsy+vtk+wiEEu17NlyD7oio5hCyiQJj
         LgdVpgDJmOM5z4KnEZ0abY9cgKwRcZqGpruXSfpL5yXQpIAZnct6u8Tljiprg/od2J3Y
         zMqBoZDBDNhgFSSjqGg8h0oPg3Dg2eENc5u30UgyLWm0BAXIcWarUYfup+ArBOWu3Gma
         w/5jIZwX84r/12ACvyFP4VQL+LsNnD+AGprVOD6b9Qjv4AsNwo6WkXgfirvvSjr5Is7U
         tKxA==
X-Forwarded-Encrypted: i=1; AKwUvBySaMHMzk88+CFUT9z287+cod5l3qVTyisE++pjCWxD44lDhGER2Cl0LyMHYWxJSYyqM+0FMBBGY6geHPg=@vger.kernel.org
X-Gm-Message-State: AFuF++k8BgvtLmMr1nH+yfkKTHC47A5+pV/F0HzeF568OSLigHTn/01u
	WNW4BR03N9ypOivvTXEHrKDd6D3z6yDsJ7CluxY8jQrDKTi62y9Dg9B7T47QZ508
X-Gm-Gg: AYBFou2M+DVn56ByliEZKeKbWsy06wjLAKjFFPbHRRMf+CRJfxzts/NtCkaG0SAgu0q
	iiiQjFM5wmqBTDTx2aSFaF9pQmzSgZSOiSJiRPDMJmn3JoNJaQDjuAty79qpnHMXXpq8neq/FD5
	/0u0K3428C7sf5N8ErbI/M/1+UItNILuOagiSgTWNRqXdQ0SFX+Sil4eJ5uIlGluHTJs/sk0flv
	Ym23HS9hvTYtXnyED9xcx9kIY1mVCgjUVSwctrNDV/C8G18KO+kewHbKaXKf52vpM+k1e67pL+9
	/sGnQDaEmADecjwv5+jRnlqSV+Grmszh10LAFpNP/aFtG7DqjiwO1s4KZwRhJhMVrrIi8aUFvAL
	TgGqidj+BHdAOmpwgzWB+t38hZRNVvQqyP4CqvLxb12sH+52ZZaiU5UIIJKA64ayP2LGX2EG2Xo
	POQoeAJ7QWzhz9jQLSmd2V0JTTRwjs6d73JoQMmp7vWBLWpfy3h0+qQxUAptxU0b5Qi6cPwlPeU
	p/TqfT9hXz71jkiFB0CHT0u8guohJkvsU0oCPGokrZEEIfQiL5p3QLSGgJIF0X0cfCwcjs10Yce
	1D4lafIZFb6KRUqHAZUOSj06wfUgkqJUhqfssQ==
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr184554905e9.6.1789168512866;
        Fri, 11 Sep 2026 16:15:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm171124655e9.10.2026.09.11.16.15.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 16:15:11 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Antonio Quartulli <antonio@openvpn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] ovpn: Fix the return value in ovpn_bind_from_sockaddr() kernel-doc
Date: Sat, 12 Sep 2026 01:13:52 +0200
Message-Id: <20260911231352.12706-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ovpn_bind_from_sockaddr() returns an ERR_PTR() on failure, never NULL,
but its kernel-doc says "NULL otherwise". Say ERR_PTR().

The wrong text came in with commit 80747caef33d ("ovpn: introduce the
ovpn_peer object").

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/net/ovpn/bind.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ovpn/bind.c b/drivers/net/ovpn/bind.c
index e42b60cd04a9852c80a0cc478d499821836ab909..62a5ccfd3502a2680b45b0732804eafd47d79a2c 100644
--- a/drivers/net/ovpn/bind.c
+++ b/drivers/net/ovpn/bind.c
@@ -18,7 +18,7 @@
  * ovpn_bind_from_sockaddr - retrieve binding matching sockaddr
  * @ss: the sockaddr to match
  *
- * Return: the bind matching the passed sockaddr if found, NULL otherwise
+ * Return: the new bind for the passed sockaddr, an ERR_PTR() on failure
  */
 struct ovpn_bind *ovpn_bind_from_sockaddr(const struct sockaddr_storage *ss)
 {
-- 
2.39.5 (Apple Git-154)

