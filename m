Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670709;
	b=vHKQ2D1lIBgkHhxysxknf6kCGm5xsV5qADa/zI/Zf/wSbkKosQQCv9Jda7u0yG2P5T0O
	 E+I/DmhGPaU/PiZAYdf8OcT2VD8NmNRw3+HZKvwD2HY/0so1tHMSpbvGBKWmXffUNgIJd
	 KrHGxZhYxmGagM2BQQZvibHKNZNC7ui3IYeM1Vir8cMHPvgEwuz466i6PzmEZB2hO+2tz
	 6IHDPVuOKM7NfbbfD+xQFwTGVbccYmlNNnICQ6Dqedu0dsEpwFJpE3Z7/aZdReS736c3m
	 +kvEcvqEMnUig7UvwdNORMpYaTmH0/Fo3SEgMckFrhOiDMvIs7KAttJpghmZfK2sxBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4xB13t/qikSGlf5PM+4NV5sg6iC2/DLGLtE12IAvGY4=;
	b=k4Rdk1m8I1JBeWl27UDK95qkBYLBU7Y2cL1CGUAV1OqOM20CxrK6SJtGsyyeYR/iOx4H
	 3Q6vV4kPRBp+uJI4vkzPF8G6Ag4Cq7/wAUFLI1LHVAY9l5HENRgaZ66ftqkpZ16zF+BrG
	 9XHy6JgB3R0fe7Q7H+r4M16ZqCLoOXRX5iP9MQMSD+mOsPydMWrTGlxrslwyZV1IVPDDQ
	 UvNllNidYNE1ZvCPa9Do2VMp/nNpmzLVIVPTd4st/XCb3LYlreFnH7UwV1Ic5diz5NZre
	 V9whtzrLnXegjpNLuEnclXpFPgpDXssGKx5piRElGk7SwXM0RjJxmHD0UqhGr8LHeBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMK0lNWQ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D28606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D28606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMK0lNWQ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so2720955c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670708; x=1795275508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xB13t/qikSGlf5PM+4NV5sg6iC2/DLGLtE12IAvGY4=;
        b=JMK0lNWQ4acWBiUS8eVeyG451iSPxaDJGQL+kQ1xkFo+XDmzc8+HXj2AqPLOoun/w2
         W367K0mWM8/dG865GvIMPnFQIG3CtuUS6gp0iLJN7XfdKIOXByLk3rpKqSfTZs2Poi9C
         l9h6apnrN6yd2aIyf6NsR9MjM+kbtaoi19uHHX3S5BZKTStD8gNnbBMMDPH65rF7FTH6
         cUgftdWeVVQVTOw5XNVKBO5GArgg4SwSxl9/izRqsdxfedU679aNhUNNOfraCNzoKE4I
         UwW2nE1bdRhSrqU9YyhMFx60zxcPb1PIlJHwFpXnqBx54OpT6CMUcgzEdlFvwP5SoWG7
         5LnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670708; x=1795275508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xB13t/qikSGlf5PM+4NV5sg6iC2/DLGLtE12IAvGY4=;
        b=BNHVH9GMZiyqEvsqmpqsZDNHB3pUCQeSDvB1uUHpf1N0cWcbPvoswopq4wdOoYpgDX
         nKCJ+BVmgPxgLQvwpp8+uyaEFB5tY36QML4P2U4dkfP1ES62JUVfP0WLX0LwmwPOeeB+
         LJssVqw5S144jGgDZI1IEu12y8uscxoQS0O/BEqg8lDySAnA6BQB4D3UePXhf1vUXv4j
         ymeJmde7DuFL0UTneEn1qYEr2+mIHWFFj8B7ZSO0U0lPUHS1rStgT/xviRNWjGOJRK50
         mRo1dM+FUZO2p3UQ3x3JTdi9FEXHOu0vPRqYESPeB3ErIMPFm0bCERmaqQV/v0sGqcaz
         kNGQ==
X-Forwarded-Encrypted: i=1; AL+hErFnEcZTnGpsfuqgF3q+dJxdv4zTaVWgsAZog4DC/qhya7le+9maDPCLFHEoobUCl8OOmXZFtAplgA25lcs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+16AYmeDmVyU9pSDGUJQ+RkF5YO7fpVtXqz36hfVbgcO8ONa0N
	JkZ3RHlchKr12qr3fE37q/ZuJk/NQbY+fsztLlJE0MBQgLerpWrax5gp
X-Gm-Gg: AYBFou14IoBZVoq8aPD09/KhA4hswSBJkX1T4/Z3dlyZsZ3TWRVD//22j8v1P18XJmO
	ruDgYFM53XqR6sizXRHsqNZZSxYET//p/OEomYojVIMTNBm+901AO3vbYKNksba4p2y0gppQVwU
	zVy6jHVTbjH7fBFaftorwIH4YCF/cAEPl1dtCL1eqcxL5l+JxVbWmBuUGmQ1nOXXRIBCEI/mrjd
	NArZwGGuAw+qNWHyLq0/lI6CEXZxRjc42efxc2+ID2SYpDuvWUkA/V1RVed5lrAzTKJscA6gWsE
	/mR3R7W/9m5oryjEFVDbz+W0DLG7IIANvEiy4QvyxYlx+uO3ffxLdrvbj4tVzFvW9L/Mgu4iXUA
	fvhrnUd3TXFi6AXEyaqL54YzETKbQqKjDOC56s454Ilq4lqqNNyAbGjVRiZAnBy3XbP35aNpPyO
	cXef3n1vtAeMoE/wOhLeGnaIMma+E3NACyKJ0H5KQAv/SHyOofzTVb90etbQyTWzKt/jiHsmx0q
	+spFnH6O+ERrXMJk9aJzT72iJbZfu7+HTaH/gRSHmQbCJaGo1vqrPAvgYjPkj9Lp2Oc+o7bFdSt
	zh0HmCSKWYNfN6p+ZV/zQYpgJP1LX9eMkWKSQit4oqyvMw8exkMZdEtqt21+W5KcTY3q4fI/BA=
	=
X-Received: by 2002:a05:701b:2202:b0:16e:c820:b20d with SMTP id a92af1059eb24-1b50302b736mr5463987c88.5.1794670707564;
        Sat, 14 Nov 2026 07:38:27 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1c60:38c8:74f6:e2c1:4674:3e44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm16513014c88.12.2026.11.14.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:38:27 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] tun: don't steer a flow to a queue index that no longer exists
Date: Sat, 14 Nov 2026 21:06:17 +0530
Message-ID: <20261114153617.102288-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A multi-queue tun device keeps a flow table that maps each flow to the
index of the queue it last used, so that packets sent back to the flow
go to the same queue. When a queue is removed, the last queue moves
into its index. An entry that still holds the last queue's old index
then holds an index that no longer exists. Packets of that flow are
sent to queue 0 with a "selects TX queue" warning, until the flow sends
again or its entry expires after a few seconds.

Commit 4cc0a3f89707 ("tun: delete the flow entries of the moved queue
on detach") deletes those entries when the queue is removed. As the
Sashiko review linked below points out, a send running at the same
moment can still write the old index back right after the delete.

Rather than taking a lock on every send to close that window, check the
index when an entry is used. If the entry holds an index that no longer
exists, choose the queue by hash, as is done for a flow with no entry.
The index is read only once, since a concurrent send can change it.

The race has not been seen in practice. The fix was tested in a guest
with stale entries left in place. Flows that all went to queue 0 with
the warning are now spread over the remaining queues.

Link: https://lore.kernel.org/netdev/179415734502.994134.10139593761656069984@kernel.org/
Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---
 drivers/net/tun.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e6..5367975ff8 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -471,13 +471,15 @@ static u16 tun_automq_select_queue(struct tun_struct *tun, struct sk_buff *skb)
 	txq = __skb_get_hash_symmetric(skb);
 	e = tun_flow_find(&tun->flows[tun_hashfn(txq)], txq);
 	if (e) {
+		u32 queue_index = READ_ONCE(e->queue_index);
+
 		tun_flow_save_rps_rxhash(e, txq);
-		txq = e->queue_index;
-	} else {
-		txq = reciprocal_scale(txq, numqueues);
+		/* A racing update can leave the old index of a moved queue */
+		if (likely(queue_index < numqueues))
+			return queue_index;
 	}
 
-	return txq;
+	return reciprocal_scale(txq, numqueues);
 }
 
 static u16 tun_ebpf_select_queue(struct tun_struct *tun, struct sk_buff *skb)
-- 
2.53.0

