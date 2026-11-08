Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162732;
	b=XaUu1HBwAXf6TFWsBKzUFcrG9xjaBHd9NXeaRiAhVrmKEwQTpdwvbvfdulJfMBE0oVL9
	 wt3Y8ryBrS+zg3meZ8lA9Xac7GBTmbC/Y4SeguhdvYYz1U7vNWsdmHTC20BdPiWonBCQF
	 ntC9x6zt4jjOZFAfCtqI+Gr9xb9epjbZ/sPaB0uMOaWD47627f0Rei5Sb/s2e1zGP80gu
	 Kj4GXTbD0fi8BBH/zkQR4Z5hU5SjsZr2wZug6721FRyYZnDFhrgaww0C6HxwElAjdH9n3
	 LCVqBZGIpps1Xx+Ox1aay1f3W4DnyEnBowqWbSTr0+eJa0ZEpguE3A3TePbQZnsrLMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xMsgQo42kELXp5TpBRTE7OCSKfvQ8gF/xzLE0ha8Gds=;
	b=aqvpf2iHopcJiZXP46W5W+hJeIS939/ZagvTK6R39CD41mNa+lVq1b5DIhQJ/+RVbuQv
	 GYp7tETCKuQ2aR5TP4o7IoG27YKv4ld2h7bcJ9A/S+NrG4/SJ8S+9Kmf2l2+U2HSdWC/G
	 Uf3Ha+KS9PucOP9fjTrJOOUa4FRQouDXNqVLiHMt8VYbIwPxjfJkl3vQf8Q6gOE7lYktW
	 U1yD10CdW4So++rQumV4Ra0uZJzZF9WhWFbCftZfXeJfyze3aynvX2NNIf4wmJJcdYnCK
	 IuhRGth121JS3uhmiMFtujp+Ek+ncUsvbTfBdObflvk7x0XkgA6x81k6kuYhJspyQ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsax9Fmq;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F3C606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsax9Fmq
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso135548a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162731; x=1794767531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMsgQo42kELXp5TpBRTE7OCSKfvQ8gF/xzLE0ha8Gds=;
        b=jsax9Fmqy+mDVTZmjim3al0F6YSfiGg7z/bt5CKJTti1jx0kQOSAr7EjcST9gNzPrj
         W189756essGDQ7GBRoo3hxbydCiBPRzfdwUYsQcncj2qk1++PkU8Cg33jBENmyhdruSV
         EE//hmjsIdYnGzZMf9gWDzvNO2F9yeb93bJ2otvMORVRl4lEthV0p/SLp5Sc60aSpbeI
         /J8n00KMLVtoZaud3b8vEDJsZbHffR4bhdzjzcvlogOF3H6+JRVsX87Z0GlGS0RyHCqw
         cS4FxL9/5k9NVnncWcuDQuSD4X70+MX5etYiTBZYx7yDVs9DPGNiXd366rKjz5bq4oW9
         tHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162731; x=1794767531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMsgQo42kELXp5TpBRTE7OCSKfvQ8gF/xzLE0ha8Gds=;
        b=Q44xZ3J4x16F+NwPwiLC+1/rfecVphLL6vx3RA75iTjrMkMMjsG/UFGm9pzWINbRPq
         1Jo8NTMlNqTmG/MrLLSyOS+y3VbwhLPDporaf60JS2yKrWRBITADnMJ0sCMMVdAyTA4F
         MuR7Q67mkAkJyaehpIkc/1B17NjVjykCPbBbKvSqceiAhbXJmiUUugpWlD5HMg37yic4
         hAoX8PtEoHnfvg8yeCO7AYB+goRDoMgvM9afRXQNOHWKSsYuGF3dOJ+MH6BUrHs5lqws
         zrBMsyi5rRbqICuYOmCte2PCac0MOjUzaV67QtNcI8EUyQRgrJbIMIiZTao82jrNjS0I
         IfYw==
X-Forwarded-Encrypted: i=1; AL+hErG9YMicfrPm5Cb5mi9vdDkQtWVHOFThtQ50aXaM9g0gx0hfxyACLM3SQ8fvSZjG+6PqVH7UAdX1vukMtKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QzyWNKnvGd4azKrwAivlNrDN6RbQSXTets3VuRVWSSOz2vXSk
	1VPQjbvq5YErJ+1o+8OD0/lsGJSn89nP1U8KMxJJCZscX6CfsXhz49Gr
X-Gm-Gg: AYBFou1cnFPoKRiiOyhBrK7jOjp+u26jL9INqAk5ujywaZUw4kQkIgsZpti5qtl4Jsr
	03JsQayZQeshmDIuAofWmDk25qymXGd9K+2fYbWUca9rQy/WN4tfJ669PjPO0xPX9F0uKXpX+FV
	LlFEg9+aljNUjc5s/tdcTiFnOxthYyG0gajUxnokF1MsnARp6WV+2klhSe4i0536dZMdni/4kmq
	StBVWhzHi1VWybBSUSvr1p/Uxtb9u7UsMUgJ7j3t5X++de8IQgXYqDD4I68cAfeE56DK0uhYk9t
	9jjPVjnzFKBwImLVKM9j1AraBtBrcV4JDc2RxaDo60bTzwED3wWqw2TLrurwvhc3QlAhg4z/kfN
	hvlu0OIYDJBU5K6NdDC81mnGeeEjxq+TrLrj/o8o4jlqWNKuu/ggUoa4U9nPVTRFjwE7zW+uGja
	M0NZTXhKKATafllxBkKQr/LiE+15oo8fFhYB3pII11QY+dCSiVOAb+GvxwBw40AnRkhh5a3OSXG
	Ryud2zvV4dVMwix9CE3QzoAZ3+D3y7WUHAz/3fIm79crbDPTcIedscWSwa8m1frTlMUl9LSprhg
	Xow9jneUIWn6A5o9kAZXGk1NUe6RolckrlkeIfVYwxtwhn2Ca8NHAQ==
X-Received: by 2002:a17:90b:264b:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3b12d5e30acmr1697269a91.66.1794162730574;
        Sun, 08 Nov 2026 10:32:10 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm7600534a91.0.2026.11.08.10.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:32:10 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/3] net: dsa: motorcomm: Fix RMON fragments stat
Date: Mon,  9 Nov 2026 02:29:27 +0800
Message-ID: <20261108182931.1542638-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108182931.1542638-1-mmyangfl@gmail.com>
References: <20261108182931.1542638-1-mmyangfl@gmail.com>
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

etherStatsFragments counts frames with a bad FCS due to fragmentation;
report the dedicated RX fragment error counter instead of the alignment
error one, which is already exported as AlignmentErrors and
rx_frame_errors.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/mib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index b8fe2c407c32..e9f28d446251 100644
--- a/drivers/net/dsa/motorcomm/mib.c
+++ b/drivers/net/dsa/motorcomm/mib.c
@@ -336,7 +336,7 @@ yt921x_dsa_get_rmon_stats(struct dsa_switch *ds, int port,
 
 	rmon_stats->undersize_pkts = u64_stats_read(&mib->rx_undersize_errors);
 	rmon_stats->oversize_pkts = u64_stats_read(&mib->rx_oversize_errors);
-	rmon_stats->fragments = u64_stats_read(&mib->rx_alignment_errors);
+	rmon_stats->fragments = u64_stats_read(&mib->rx_fragment_errors);
 	/* rmon_stats->jabbers */
 
 	rmon_stats->hist[0] = u64_stats_read(&mib->rx_64byte);
-- 
2.53.0

