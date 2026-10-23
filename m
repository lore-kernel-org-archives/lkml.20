Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785194;
	b=srXmsh0xWNjbp7cjUn5jjx7wpyr8y43uouJUbKCRBuhjreC30P1AjGCDrqUG9+fSQ8US
	 Vh05yvWn3YdpZAtX3QrzEBAfbakA+FCM3w8wgMKjMBWc6Vfcbku1J9sbBofTFpr/OZsSA
	 6eziW9tN5L2wScYolO//BPNDcvBQMC6Zp66oKjhQD1QDyd8peoJCYZ7wG2iafKsRPHw/6
	 2V3bDp+Eg5lSuMozXFnH3Br5GdszV3VgDJz/wJrwwAaBdBTJFuz8K+JqYVRo7h/w2cTrY
	 iAIPtymGo7orrf36zyYBLCU4NeC0d9oDksscRe1qOroJL+fSodv2Om3sluCqu3h5xpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MYMvGahXwl+NkKbqUxWpkDAanrsDHqw5aIx8j0gxjPs=;
	b=uO56lubIlxf1FETBe5IS8spWsCVZzfv+hhM9sOeJlbQ1S1P2OIq5K2kI2olgHz83Ytec
	 6cEvR/N+rX3t5n5XeTnRzyeNipJCDUmysa8Nv2gYPRgM++2Z6duTNd2DLtnMUHobZYNvG
	 hTIR0HfuzYiOqcjNsVzEkFPWeF9HZjmiM4ILn36RNaLbux33zUPokT8gKHPa5IiVN/6Ki
	 QMh5McnVHgKpEiD5HZsyOecgWCbX7yIAS0QIf69wn1P8A+SeePhpLXkCmD385EBGoT+q0
	 ze13n7tC0295gvWgrJIauiVU6cLWd2TAojFivCEGU+I2/gsbNwFCjUk0/az86Z5KtoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SNymd6a1;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34CE606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34CE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SNymd6a1
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-487049569b6so736239f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785192; x=1793389992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYMvGahXwl+NkKbqUxWpkDAanrsDHqw5aIx8j0gxjPs=;
        b=SNymd6a1wWN4/3R20ghV9hJHANXsMHNZSjpLs7ikUYUtr6b9oz82iVM8+eYTK/D3vU
         IGsAk8eCbL0wRGWa2VkqZqGYenDcQblbEh7NY5P5CnCrzU0GVQJd8GQdSa9LiNUopKf4
         H+smT8EN7qxVHmRrLBcf8NQKwog626n7OpXx7vMBHc3nJNf4Ek+rT6LmoMS5Z1OSQAkX
         /vhr8qGpafrpNzpFK/lC3P8bxKvBmvsJGKTJoKns+JWDQ7uGfMcy3Ble1kF/ytdKyupE
         4LNMEbbDLPq2dsN94uKUpxZoySsaQkttM4MnXwwrNGH90oR3nHt597WX+Ij+22CRbRl2
         pKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785192; x=1793389992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYMvGahXwl+NkKbqUxWpkDAanrsDHqw5aIx8j0gxjPs=;
        b=MYOgaT+zC7E4llXsnc+Ct7XM0kVmW9jgW3biroPvh5hPv6PN0cGj3we9W0cImO52Tk
         es2XfgqJV6znPRe9NaOuNkrPo8ojKO01KUkJmwUV5CDlG0ApX1ST1QONxy9iJbmr6/Hy
         3uzziIHnspHmlq/J0kLqVykuKAHVcosBCcUNAIEfvBeBJARU9ixrqjBZCzLbnwQSolBh
         n6EwNY/6gj8vHYE3eQFzDIZs2++gHvO2NhJekHt1jNzJEf5I2IKf2a2Z7r5iMLR8289D
         WvdWasknanA+RdBM/1jdeNQcON+XhW+yTCh2dHeRPINgm95Kq8IsJmg1NXAGCbr2n9fH
         7VhA==
X-Forwarded-Encrypted: i=1; AKwUvBwneAgm1e6XWBiC+KsMj+tpo+UIHBbLcA5+IQB6oWKXiu0bhNQ1fGNGnDHPd9n17QiK+fz+vG/ED+DN/x8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRF2Z6HHDDCtgRHNDhVOdbeJdH516y47118If3JTP6oop8fSpN
	GkCIquEQ9XQ2zCf5m7oZfOmZ/s0BYeMWLRozNs4yDdrI2Agji52GvLE=
X-Gm-Gg: AYBFou0ehwDmi/BiNu13lMuNDFm7PyHc8d45EPWU78wRQ4Dycz20gU0X0bp6BnqcQUq
	/apDt3fdl3hHz0Z3HZguU/LMM2t2cOdkoTGzRN7RUX7sS4n6dGNFanTdb4ezyWlGcuy4BwWWv3Z
	MXSrfyJ4XtHOs2pzfDL9G6Mls7dVHnf2btBzWfSZ1IB+PyxRdLlb4G/JkRb0eD3wpKMe8gMAni1
	+egpxmawMAt0lvPrF7IMlc7//xZktrF/1K7c4157vg5a1xQeGKrNC1hN6fejW6mqop8Sk6PYs4e
	C4OgBpGUeqAkg1NRnpHONeEtzktnNVea+4v47/nMQyHWdEcjb/5Xn+ra2wcboNcVgkTHh7iJ3sU
	u+0+W6QD8p2bWmVxeFpoaB586UJhoEi/60pfKGJ/atmjgFlpsbFzhWJDU0tlYIMOvIrQR2P9svB
	QJPgjPZqcDrI+zHd3lkQ3xBbmakq6WoNLa5EaoHE5jZkme6YZeUTNxzp0zjzmijvftfpMCwU5KW
	HZ9MnucN7NjgSle4ig5piUjfA==
X-Received: by 2002:a05:600c:19d4:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a35a42b345mr2557955e9.26.1792785192118;
        Fri, 23 Oct 2026 12:53:12 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm4434875e9.1.2026.10.23.12.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:53:11 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Qingfang Deng <qingfang.deng@linux.dev>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net] ppp: fix stale pointer access after pskb_may_pull in ppp_ccp_peek
Date: Fri, 23 Oct 2026 19:53:09 +0000
Message-ID: <20261023195309.3527129-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

ppp_ccp_peek() caches a pointer to skb->data in dp after the first
pskb_may_pull(), then uses dp after a second pskb_may_pull(skb, len + 2)
in the CCP_CONFACK handler. If the second pull triggers
pskb_expand_head() due to a cloned skb or frag linearization,
skb->head is freed and reallocated, leaving dp stale.

The stale dp is subsequently used in CCP_OPT_LENGTH() and passed to
decomp_init()/comp_init() which read from the freed memory.

Re-derive dp from skb->data after the second pskb_may_pull.

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/ppp/ppp_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 1a610a18893ba..3998ce4332f42 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -3157,6 +3157,7 @@ ppp_ccp_peek(struct ppp *ppp, struct sk_buff *skb, int inbound)
 		len = CCP_LENGTH(dp);
 		if (!pskb_may_pull(skb, len + 2))
 			return;		/* too short */
+		dp = skb->data + 2;
 		dp += CCP_HDRLEN;
 		len -= CCP_HDRLEN;
 		if (len < CCP_OPT_MINLEN || len < CCP_OPT_LENGTH(dp))
-- 
2.47.3

