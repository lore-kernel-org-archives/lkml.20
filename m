Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334110;
	b=vIQdIt257vWUoFSqMt5NLmobkbd1RyaZG43kuy5jbrKRmIPx0e9sTh0mZ1dCzv4GP7kg
	 KqsExQBmb8tfwAGXlYh09G7XAyNfXNNmyaHXgCpq6kCoK4dTLfA032OwihPnYMNUdkczi
	 otTVZvam5vpYfj8Vhp805R+JF3aTn+n30B6HpmOVHS/9m/+Hrl7YXAyVtE6GVSAI15Kx/
	 068gSDo84dZ1OZnNzoY7noi1IzqOejSMrXXGwpu5wDN7ggPCvSYREe3kgf9GjNplNeGL0
	 tEtZORR8Xnf4n8w0NEQOZNz6KoOeFL9YYY3IUUO2R5FbQk+UM04rdd9XS1Kag4aLHwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sQmqYXwhPEoOIU+cSSlto5ZT2a+PGkxqqNn7RgX5NXs=;
	b=EghdgGLNMV/b5ZQ939rgQd3qFNfardVcDM1UNBNlYN4V/aO99InqnDSdiggLQBxIAHqL
	 ifDfNIZGTRNDPm2bl1bBBv/RcSwXr5f2GVqPzg/RE82UlnkQtIKo0ezEUAIHXas6sWtq6
	 IDNXXHTu9Xu0BL9O+QwmjImj53k5ggu4UG94hRpjJfYOId9qXXJ4SMj9BGJhaSSb75kEY
	 zZrx4/zt8n8DINzNuZ4TXP2xAtKWwlwh8oRikXHBFVrtLOqvXSOx2sn6A3jvGX05QZUiL
	 VIen0xvIcg59V7WA6H1bW4Ta4HcwmQEc4xf7YJ1srj/TcM8BbmJYaA2OVtMqbCr3Mpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Wifjvk9Q;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C87606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C87606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Wifjvk9Q
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b28d9537bcso232556b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334109; x=1793938909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQmqYXwhPEoOIU+cSSlto5ZT2a+PGkxqqNn7RgX5NXs=;
        b=Wifjvk9QHpX3sDnV1u9EjAM+z8pfyMKSggxgf12jYYnhxtPnNR0PmmJFV2VFx79Ccv
         mcceEvSRLAEp0EqiHIFMr21tfvtlgQhFfqVRRktD/E6r34jadH3vcaaBLvA0dqG+B1Qy
         1HsQmobNCqUjc8tLHwKwgJDipuOWsgoeihM9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334109; x=1793938909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQmqYXwhPEoOIU+cSSlto5ZT2a+PGkxqqNn7RgX5NXs=;
        b=m/sJOSWK4ACiw+PPi12uWkHBS0WN2UTkrFDpf1pwnXZlyO9wJqJ8gM+Vz4kIyuqc2n
         z9hejS78ISWpH1zHUGVUWn7v9QQ+u2YCo9KxrOccscEnQ3zxgdEkhbtsl8ed1t4rhTe4
         WkEzUQ3TPYKqkLP6xqU/ujjkbJFUcbDsVp7H7TqJX89wYN/j5vVVzKrfWlfug7bQKmsg
         B+6fOpCrxdIGayGLIiATy/gT8hOvmgZcSUX7S5LmFzWm8DleWAitGGcwVPy67B0xTxCT
         BhlIG1WtJZAqI/Bq///GOPH6nNX1G6sA6MmmiNA7VresSkz6JLfQk8g4DTrfQfs772aw
         p2qQ==
X-Forwarded-Encrypted: i=1; AKwUvByxXHuwBVbhDYUu41WSRXgV2WZcI5UyJ98Hngro9waFF9GFi2zWOVZNJmxJtbeqapunKYVjGqslAmUV5OY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNzPekQQK+qvAn2QWU+MYvEFspLeQ1AETxtNILDUEI5wTxG4nw
	gQbWO7IE2LGmj+UimmtHbxRe4ipdVxfhAoOAAtUvPkiJaPmLQkA6pQH2pHD+NL/PAfU=
X-Gm-Gg: AYBFou1TTxlkt3Ls8fDOTPyThG/a5kXufhjZXiNUd2nO8KsbArccI9tOM9vp9WcID5D
	ubay0cjl2avBYpQBAicVhHLEGc0DYVrZm4qvx/uPKFpXLLh5QXaqtfF2Y4cKtbjZ92w9hBI/qog
	gOvj49p6WT+NVEZQ4adr0V80aPSWNUBUeCQwCQZJMsxgdFA3GBMFXSs7BoGESZergyHtNR7TOel
	XH9BXGb3NcN25g8qd58gtj5sVZH1MYvrLlJ1VSpHjR/BUGWaES1tBVT4e0E7nR4ODsI6W3tutMu
	sa9u8nhXPhkDkROLYo9NKtFEOYhUvxROaDLVy5sE/8bXjwEAFdcYHvFKIHKglc9Z5v03L4MK5WG
	ZyQHxyp7cEehbuC01z+vLmDvJ1xafRdNV1z8cM2++CELQFXRwCEbVdAw2fxHq+QnXKxKY3ywYhu
	HBCjVrrTtILt8A3Her4q4SRvp+rsiYpViDd4LM5b5ZOn3+w109CmUhHcYicP4rMHdg+KzIddbNf
	ZAyjzxZeyVLxiVikv0j24elTGUmjohgF4MBJCYjGNBLqPxrdN9jnaFnDUyoct6sVJU5Lb76j7f+
	xP+uE0zSytdm9QbWTz3BOwjc1Fm3Lv422iqzk0Mfj3ERC6K3lGsPQjaV8FDGHZFVmSCcd8zprXN
	Xd9nuvZ803kz+UNosvtk4msC2Cn5gNg==
X-Received: by 2002:a05:6808:c122:b0:4c5:38f1:80cf with SMTP id 5614622812f47-563ef9c93bdmr2524160b6e.21.1793334108882;
        Thu, 29 Oct 2026 21:21:48 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm704647b6e.3.2026.10.29.21.21.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:21:48 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: b.a.t.m.a.n@lists.open-mesh.org
Cc: Marek Lindner <marek.lindner@mailbox.org>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Antonio Quartulli <antonio@mandelbit.com>,
	Sven Eckelmann <sven@narfation.org>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] batman-adv: mcast: validate tracker padding before forwarding
Date: Thu, 29 Oct 2026 21:21:46 -0700
Message-ID: <20261030042146.73797-1-kylebot@openai.com>
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

A multicast tracker with an even number of destinations needs two
padding bytes after its destination list. batadv_mcast_forw_packet()
currently only checks that the count field and the addresses fit in
the tracker TVLV.

If an unpadded even tracker is compacted to an odd number of
destinations, batadv_mcast_forw_shrink_update_headers() includes those
missing padding bytes in the amount to remove. The subsequent memmove
can then write two bytes past the old packet tail. With no tailroom,
this corrupts skb_shared_info.

Include the required padding in the existing tracker length check.
This rejects the malformed tracker before either received or locally
generated packets can reach the compactor.

Fixes: 2dfe644a1ce0 ("batman-adv: mcast: shrink tracker packet after scrubbing")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/batman-adv/multicast_forw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/batman-adv/multicast_forw.c b/net/batman-adv/multicast_forw.c
index ac97cd8b81dc..9ffed1f237b6 100644
--- a/net/batman-adv/multicast_forw.c
+++ b/net/batman-adv/multicast_forw.c
@@ -950,8 +950,11 @@ static int batadv_mcast_forw_packet(struct batadv_priv *bat_priv,
 
 	dest = (u8 *)mcast_tracker + sizeof(*mcast_tracker);
 
-	/* check if full tracker tvlv is within skb length */
+	/* check if full tracker tvlv, including padding, is within skb length */
 	tvlv_len = sizeof(*mcast_tracker) + ETH_ALEN * num_dests;
+	if (!(num_dests % 2))
+		tvlv_len += 2;
+
 	if (tvlv_len > skb_network_header_len(skb))
 		return -EINVAL;
 

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
