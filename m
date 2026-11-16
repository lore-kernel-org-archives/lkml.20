Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821101;
	b=jSGaJGivkQeXPdBsUO/25Gjb2n6UBN99oy75qn+6+/2L50Ke3u4FfhPwoIu+gmESDbO+
	 9lYz7IgEIRCfC1YmQhMAqasTQoB1lxk/j+hEZqDUl0igR8UJFRPrw9MbCn+G4MULptd7/
	 xntjosIyPP4LZW8CqW6ew3n5VhJNViNwbJGo6K2wV1IsSPa4wmWhqbN9I6GxozRZmJ/gJ
	 bsE0GerwDZQOTN6RU/jHoLhmIM4iED3ixS5BL/14xxje0IH6elMOHrRlUXFYbCVE+lDh8
	 0ZD6xP9jawKd5yljoZpkbynhFrAru0lFO30N9v5StGMBbCpQ9buKiXqHpNqVLrdY/Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+kzbAXF6Q7HKw8jGGGgdN+4kZFhaf1FTj8cFnPCPCbk=;
	b=2MI+wh9YcG7QfMTmtZ/w7SZWtXVYV3DnlHjiSNrWjhIqMbDxgDPS9PzkRqb2L1NBOYKx
	 NA0PB090nT+VbmqyGVpDKiGea4CNpRHS6JuJoHM8CWg1yy2xeARjN6eItClThO8MD5iMU
	 VgUpdduWft9clEI6yW25Urzm5PMoNMC2aq2jNi+7mgHH37yL+pInpBsG0VfLeXLtoUr7C
	 SUM2kkOu0gBWgwN3uzLwXmcI2oeo6V/Iccp7JkR1Kg94n4vgCR2Xzs7qCOYXG6oDD2+jC
	 iVHTIlnJko6nowPlOQIvlmdbSSplwgmtsqbaAYDnJIbz2Z9WxfejcJQINVrxPqyqkVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=ZRiZttZg;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30E0606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C30E0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=ZRiZttZg
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3867046eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794821100; x=1795425900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kzbAXF6Q7HKw8jGGGgdN+4kZFhaf1FTj8cFnPCPCbk=;
        b=ZRiZttZgcfd62niaHc7feOuFxoxJnigtmUhpbCsLqYNjpOipU4Fr0UYiNcKTP09NAr
         4pM+Chmj005G94afM6s2MpaNbRQmwPS+MUiAorRxSSlWZZ26uIo0cunIBCcDpMthecS/
         LDaUiqyTPJZlHMFzL0kHjEz+9S2jMTW4T8mmJ1a1xPgYg+nq/CjaRPNrqS/brIryF9bx
         7nia8eCgjgDGqPIM/75kYF2t6r2PAaOi2WGrmEDQqsXTXA7qdD7aizkaFeug7L+GId7R
         kFAtWQ/t+eUBmV45hZ5UTVN8mWlkHe1HA/fVZYuboPydRb4AnekTfKygqPP9EBtsApf1
         FjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821100; x=1795425900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kzbAXF6Q7HKw8jGGGgdN+4kZFhaf1FTj8cFnPCPCbk=;
        b=jkif98zd29YiVZMrCkZduT9B7ktxNlBZko5DA/zv4C89oVJQzssFmVZbkF4BEnWE9W
         Cdc2JbWgyF/RNH/tFXN8MDEyYFYUxUrkRThMxXn2MM2ROOFWpfP+1LeCvzBDJ9x938K/
         VGBFlbv/9gHJ4C0OiOQkapexA0FlFM1fubovnW/BP8a78CKWbcWOjbtQYxGeGQhzSJl2
         g4qzE67bnQrTGH8ypVkh15mj+LU2Z9yZ591gQsBFq91EDyqkuOyCtE2HVFl2cjimKZ5Q
         LmmIBWV9m9RBHsUUd4RsUXoPXE6xmYM8GdsePFHvnXTu+7P3HsnpmEbEp8iv38eg37Zw
         Iubg==
X-Forwarded-Encrypted: i=1; AL+hErHxR2u35x5me99B0nHifrj2tLX9uuiq3NUHHQ+Ag76UtEhPQLYveIeNEXed1yf/sTOyJ0gzs/jhaZozwJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m8DAvZObGtC4Kh2BsG1DIqrDXmddOeYLPYm08nSXOIe9zvSq/
	wN0BT+s2jSZRSZrUKaZyU+QRalXb4lbNfWIkLv6DYrvLCySSX8RoyFqIVqxYD/btTg==
X-Gm-Gg: AZFdTZdy2xh7rWYYzjVxMPyBzQijO9zqGB7GdSWfkd5iWahEMFINp89QPgcMyckevYK
	ukd0z/j1dqsl2hVuOWLsqK6iuoMK4U1BWT+HNgaj2JnsnfG5WUOPbG2qhY4OMEhstH43ZmQgBjk
	sQxeXBK3pDAHGKWEBU8o3egVjT2bIGe9vdH2AbNoIquJp7TbCVUOpizmC2m036axhTfjvIXG6u3
	eJnflT/njDYLpNuZtbDXp0GFUO3fgCrWtHzjE1KrdUwUFCq8Kc1EVNU8SFiWU8Nm2j6MszzVwhM
	f6F6h6EK+2wSWCQN/UkFoy46EIZ+S4z0gW/KppOOkNPW6uhGxVoBk5/cgk1IEJPfVmcUKIg4dwj
	H5P9c1m8zxK7LE98IyUFnr+G0aBUvi+GlERTpvHcTX8r2TVuLagvgOdJ4iCDJVTHELiwT2Q8LqE
	YAbhGgynsxwrXvFmiWHVnEFqFtoSJW1dPpmAkhueMByYDxgqZkjHGeHccsrWJjWw/4qZZFXTwN8
	MIYgs89hs6ey+bJUD/PAR5YJciQwCWktApfvJL9rRRwZMFIh9Y6S81nIZ5Y3f4XqQnbuW75D43i
	/CmsKhagGBdWS5gcNR8aRsMVnzSFuSDJmg7KpA==
X-Received: by 2002:a05:7301:6184:20b0:36e:a179:85f2 with SMTP id 5a478bee46e88-379675fea57mr9358295eec.23.1794821099594;
        Mon, 16 Nov 2026 01:24:59 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32056314eec.26.2026.11.16.01.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:59 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>
Subject: [PATCH net v3 4/4] virtio_net: report a failed stats command as an error
Date: Mon, 16 Nov 2026 18:24:45 +0900
Message-ID: <20261116092445.3391334-5-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
References: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
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

__virtnet_get_hw_stats() returns 0 when the VIRTIO_NET_CTRL_STATS_GET
command fails, so ethtool -S reports every hardware counter as 0
without the "Failed to get hw stats." warning.

Return -EINVAL instead, as virtnet_probe() does for
VIRTIO_NET_CTRL_STATS_QUERY.

Claude Opus 5.5 was used to draft this patch. To test, the virtio-net
device in QEMU was modified to offer device statistics and to fail the
command. With this patch, ethtool -S triggers the warning.

Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/all/20261110001659.1654289-2-kuba@kernel.org/
Fixes: 941168f8b40e ("virtio_net: support device stats")
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v3:
- New patch.

 drivers/net/virtio_net.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index b9b6c915b6f3..185ac95b9b1b 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -4980,17 +4980,14 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 	struct scatterlist sgs_in, sgs_out;
 	void *p;
 	u32 qid;
-	int ok;
 
 	sg_init_one(&sgs_out, req, req_size);
 	sg_init_one(&sgs_in, reply, res_size);
 
-	ok = virtnet_send_command_reply(vi, VIRTIO_NET_CTRL_STATS,
+	if (!virtnet_send_command_reply(vi, VIRTIO_NET_CTRL_STATS,
 					VIRTIO_NET_CTRL_STATS_GET,
-					&sgs_out, &sgs_in);
-
-	if (!ok)
-		return ok;
+					&sgs_out, &sgs_in))
+		return -EINVAL;
 
 	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
 		hdr = p;
-- 
2.56.1

