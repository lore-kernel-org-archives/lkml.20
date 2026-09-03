Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538734F0522
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452807; cv=none; b=UTC9V7kFx5frhSWjEOT4o7I7z1oMXWTU/gk25/kQYxNFVE4GLNTwcINmrm9Q62A8oyN08/WfX18+Ypely03p4xZCiYA7RU0047u7tkAqkUTVb6ZHo4Yo4asCuET2a+w0OQvXiRW8TyHss9BLsMXblGg9kVoDy0c5f78cqswkUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452807; c=relaxed/simple;
	bh=9YHOe5z+ssvaM23jtJhGeLvjomXezj8HIDuK2w3BBE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojMFlIStJEpRQX+2ad70e69px2ZLJI/wK37X0D8UiTzimheCtmfb3kywfldTfHYAfGVaNWEESVjqJ7rC0cNRFwfTR4ueKN/w7ZcCQKH9/pU482fKLuiYYACtQ8y0bya/MAmOJ8uttIyrmkfKpiBqbR42miWzqK+Cw0o0Yw1TKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/rGdOkk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/rGdOkk"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48431632951so9698f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788452803; x=1789057603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SznL2xfveGEa7B/Oh0KOrdfcfg8AH0BShY6f4yHqRwo=;
        b=f/rGdOkkJE5xPRH9WyfY/hdBsMIpjcaU5sYKDsMCHazNuGzeiZe9G6NgBbm36z+lTD
         duH1JOmr/Dej5Hmhy1g1FIbBPKTBVliSffTLuwgpXxc3WxJ6Jds0hHbUX+hwSFRG72c1
         QYVP5SfHHax5kFSUW7plBqK9Lbidl1UC1D/2z9XzMtkxlqLyMJt35v8ACl/IwZdfU1DT
         rJn1pvKeGuxrJVBk/+280sWhaCtjUnT6UVEeNjecnnkfSOXMEvFipCusMitFp5rQ8w2R
         cX7LRTErfZLPWz+RdYjbJhMMV/LBHvDy0BYEltEaucOzr0GcHma0LcdxEFjYrknpPfTd
         md/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452803; x=1789057603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SznL2xfveGEa7B/Oh0KOrdfcfg8AH0BShY6f4yHqRwo=;
        b=eMsZcDXpx/UnhIon5QlHmvXz50sUyQe4p6WAnXSS3sKXbFy0m7YvYyR9Evww4EziS9
         A3QmRg4d3ABHtcC2MWolC4bBfr4tPjyoM1qz+79sz/99/oF+g4KVbNxzw/k/8g17wyB6
         3uP8kHzgi7h+uIctoIB/ee0YsXLDWed6dO2z6XTmgRnj40lWf2AfpZym0/g9SNUhAATG
         dvY/I45rfvXgJHyZ04sW1pF1iQgNCWMcSh3/uD98OZLxgiOZy4F77J37WIoX4mqW9jse
         ZUewPaCBIHLw9w6Al+6r25Wq9GIHkM4Y/+CQ885xVnotlpmVF6Ljzy8zWXfxvM/rThsy
         nSxg==
X-Forwarded-Encrypted: i=1; AKwUvBwd1LJmFiCkEfyVLnoiRfifjTKYINiw+dONdUVh1mb3imlUBN/hDAftVUZK45uKYVx06TZk2qp2DEVbwY0=@vger.kernel.org
X-Gm-Message-State: AFuF++kM8eFDhLFx6vAiOjtPtDMgf0lcSqRKD4VLB6/vTWzIX4trvcaW
	UKjFqM3lsivbEsleiyA9xRL56bvdWEXEfw5cDR/xqYUBbTsruCsP94md
X-Gm-Gg: AYBFou2KK6qIQy5gM3DGr6PimnzPTY2kdaCwDwzLrbn9mr/Lj5vJPBRmrw54Hl8m215
	skrtBhPiLGac60HA1h4ssyTUXZ+xqtEQAYvbvf28Y6LKYVKOedKkKMNBUVczGCMDrQrArpQ7AFq
	V8OGbkOxwZdZRdgS3YE238wQyidJRsGffSNl07tFrNSzvQlr7PtiEHUrNaThEGaYWtBnk2/iX1A
	Nb/xJ1NqeUM1ww89z5JNAc96VidzeL/J9UlwxAHFemfZmUUss6K1kZoXMCmHQCxnxe2QrgfIR7O
	1JXG455TKjvXNqtRgQOX0CTt+323glW4XOor72CsM3dNSvSX7nU0+G3yC25nuxLnJT+aDSB1wQV
	Vrmfck5oA371f77/M8gbLhCZwRgeGikT9AZrukNlSxYp2CCZkd0amoSX1lsdRHM6WP1ngztSXCn
	bANegWWm5qtKTNlY1roFQN+Rad1RJjOqxSE3cFZf5V8CSm8moziD1muw==
X-Received: by 2002:a05:6000:4555:b0:482:f1fc:d9ae with SMTP id ffacd0b85a97d-485872a4164mr103615f8f.3.1788452803391;
        Thu, 03 Sep 2026 09:26:43 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::6:124b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce236sm17593166f8f.35.2026.09.03.09.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:26:42 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 03 Sep 2026 17:26:05 +0100
Subject: [PATCH net-next v4 6/7] netconsole: move struct inet_addr into
 netconsole.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-netcons_ipv6-v4-6-bdd183c844d3@gmail.com>
References: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
In-Reply-To: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The struct inet_addr lives in netpoll.h, but since commit a1116396476f
("netconsole: move local_ip/remote_ip/ipv6 to netconsole_target") the
only user is netconsole. Move the definition into netconsole.c

Suggested-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 9 +++++++++
 include/linux/netpoll.h  | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 1f18d0a7d2dd..267254f046de 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -151,6 +151,15 @@ enum target_state {
 	STATE_DEACTIVATED,
 };
 
+struct inet_addr {
+	/* Address family: AF_UNSPEC when unset, else AF_INET or AF_INET6 */
+	u8			family;
+	union {
+		__be32		ip;
+		struct in6_addr	in6;
+	};
+};
+
 /**
  * struct netcons_userdata - Formatted userdata payload of a target.
  * @rcu:	Used to free the payload after a grace period.
diff --git a/include/linux/netpoll.h b/include/linux/netpoll.h
index de97f001a0f9..ec0821a5b02d 100644
--- a/include/linux/netpoll.h
+++ b/include/linux/netpoll.h
@@ -16,15 +16,6 @@
 #include <linux/ip.h>
 #include <linux/udp.h>
 
-struct inet_addr {
-	/* Address family: AF_UNSPEC when unset, else AF_INET or AF_INET6 */
-	u8			family;
-	union {
-		__be32		ip;
-		struct in6_addr	in6;
-	};
-};
-
 struct netpoll {
 	struct net_device *dev;
 	netdevice_tracker dev_tracker;

-- 
2.55.0

