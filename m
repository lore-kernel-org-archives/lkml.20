Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352407;
	b=ZLRm0w+8uRvkboEW/iusk9pByIDxcuTJ1+2xCfZp4gaOMV83g6+LEhpFvc/DP6zMmRFH
	 oayCoFuc3m3S/TmQYmzfWRxXtswtRfTG+UTwkF6WwAE2G9TN6URRFEyPtL93ezdt6l9+C
	 bSWe2uXqkBSv5aVcsXFcsSglRTbOxdEFgK6pxWaFnK6oL9iVT9RgNg3xrtCxQFD8akC4a
	 +yuGA7HXvmCV7rIa5hooTZNKRwuRqMvP38CuzR7p8ZBI/YUpuH6hXGrOB6/kyvx/LU+UB
	 OREvMrfbjLaXUv/pKHKeJofj23mVESOEedbKEPYkbiaoY3KRFpX2qDQ2VgTIovtHFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPjjNdzNNe62t+wzBfTzcH4sAdNUBvRnqarPrYBxLuM=;
	b=h/N6eQXWS4uA0P6ZPomBqhCxIjaaIoiE3SSzSDg4gQcj9itGI3iX1GjC7NtNDztuA8cp
	 DuJCGJPCdlDQBazSPbsiqFL9KAI1SjCTxTWzD3OciXpco9+i3Cq13bjlCdksKEKN01Ja4
	 yDwUr70VT38nZBWhx1/9+c53vvT2VozJ3rtqwfDzTG76OD1O5Z9Rj+u4sBSbTjMfi3z4E
	 FoxWGIhxqC54nST3trNKHl+594F5aL0z9KkKS7Hu6IxuthRbyp/1I8QX+atj+olZBzwIZ
	 Tk9cbYyfdsqVl85JA9d9bYSiEyhPvK4TfyUSRL2JbPxTeu++jCkQL2kdMBCGKv/Qw7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lOisifqB;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA740606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA740606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lOisifqB
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed1f1a7695so10212095ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794352406; x=1794957206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPjjNdzNNe62t+wzBfTzcH4sAdNUBvRnqarPrYBxLuM=;
        b=lOisifqBTO8ch8f+y85SanimyAgxf04DC8JmmHbuR4oySMJ7k67CQOulv4Pmz9hQDJ
         H+0kfYZIqUdc1VHGS0vheJs8VPLXkOhr88rM9RBPwAo3thVxFwhp3Q2SIz25PqeLMNb7
         BT6uEoDLYFlNTmnDNdLFcKtCfVCnabonrZxGnkea0sMLuVJ4WWggPHp8+4nNhHyV+VfN
         lVFJTYyAFWCnDrfz0BYTeVzBEVCT5AV85UrUMHCH8tT0FKY7QgFSC9kd3ecduNyrFJuk
         5wXjgiwKXIBx2XxCMebD3yCeArq8mgIOSlvvJ8FuXtMfZtWqQFZMR9/5SX3sp2obEyI3
         7Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352406; x=1794957206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPjjNdzNNe62t+wzBfTzcH4sAdNUBvRnqarPrYBxLuM=;
        b=2yoMuq3jOCJGlzaMi0KaMxU2EgFBOsXJaen52WpDS46npVk8ETNlPFU1Yid1ZqkgZ/
         pGGgEkSAvab0ADRpXNqsAXEzWh6HMqSofmtv1btZNc/3+P5+7kn5Vdc5/vguyZDqFz8q
         czofaA6pJCEoYqja52TUMhtRaZ6DeE43EoLo4sLnTfLU81V7g6EPrg1UEA5fTtMhct++
         sEIcfxAw9VJcUyJMPXhxwwMKOnObqiJGiCgciC1sn1p8cxQ3qBYTS6uRRuB7HiDCRaPx
         wC7gDnJv0Uhr3xkBr1XAf7JwL3JEXnIUZ6RnEagNyBgVWDDctbnrdz4X2rkH+KrmFKK8
         LL9Q==
X-Forwarded-Encrypted: i=1; AL+hErH0E8fp0L9dK9z7z7tDO4hxMuogR0MG3BESJdTmb+aWeMW8rrkUub8nVFbczUR91HzAlHJAsOb5/qjEP1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y/XZTM/w1gMlBDoIKhogD5Af6eW7Zv8tjwYA/Wddjmw2nH3Oo
	9dwZyFv/dFv+mnlYkrNxGPvXEsS7BZ6FniudRMw4d0LX9wFFmAuZRg7JY46jIpQPgE4=
X-Gm-Gg: AYBFou39VWdBnkmV+LrPi/AuHr0Lq4mMTch9kMvaHZqQIEXp5freEeZWcjFaRaHAhbQ
	RP+7vlQ8Dibw6Ko/NkYYtYfZTj+e8WlDTytdx0xEDs1SxnNTKjePUSnyXQrUKbc76UMuXEtd5fT
	qMAJugK2NtcttNrk7fUHw2rnVmt3ZJ8sW4m1TJ8XXPj6ZOJ6hMbtY3rXfQIQ+CpZqjg3RpFhW0T
	+QVRzgqD9TwnKUsx/8OK7bS7/Si9qXREiHVvoXPtpMYaMTpOx7xbbou1KTC/iIEc4CAGUPC8mpU
	MCcO0sANKTzV+qLJDdlVScwz1EKXbEYbFwV6g/jrcZaPqSNuGNt7AuTTVyDZP1kRtJdWrrsDfLS
	y+kb/HPra/39C9SoHriNnxCMoWAZWYIVzgyEY/pvPSXNlvUBWeb5V0klfHlLb/Tc2YovEk9ROCB
	6iz+d3ZLxeIvXRkG+hExWhCD9TFQkDL6uWSLXjKRBlpHSDDgneQqlc7dYARty3hodqWhUepPwCN
	c2BsNh9cUlWoyyC8JlgXQdNqxbl7NP7o2F1d1RGfFwSLrhVlX5a6h2jbYvku+0o7caNcje0zuTn
	YQ49KAyZ1HopuEYOBLKQ0rPyYg+TeyYBqB6K5mt5APV/JKBTCZTNymeQckmFo5Qf
X-Received: by 2002:a17:903:1b27:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2edd7b85ea9mr5458855ad.74.1794352406223;
        Tue, 10 Nov 2026 15:13:26 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edbc1b81f3sm11989765ad.26.2026.11.10.15.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:13:24 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next 4/5] net/mlx4: track whether a TX doorbell is pending
Date: Tue, 10 Nov 2026 15:12:58 -0800
Message-ID: <20261110231304.1859217-5-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110231304.1859217-1-joe@dama.to>
References: <20261110231304.1859217-1-joe@dama.to>
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

When the stack sets xmit_more, mlx4_en_xmit() skips the doorbell and
relies on a later call in the same batch to write it. Nothing records
that a doorbell is owed, so a path that ends the batch without writing
the doorbell leaves the WQEs posted before it unannounced to HW.

Add ring->doorbell_pending, set when the doorbell is deferred and
cleared whenever a doorbell or a BlueFlame write is issued, so such a
path can flush the deferred doorbell.

Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 9 +++++++--
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 97f27e005810..123071a47bed 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -194,6 +194,7 @@ int mlx4_en_activate_tx_ring(struct mlx4_en_priv *priv,
 	ring->prod = 0;
 	ring->cons = 0xffffffff;
 	ring->last_nr_txbb = 1;
+	ring->doorbell_pending = false;
 	memset(ring->tx_info, 0, ring->size * sizeof(struct mlx4_en_tx_info));
 	memset(ring->buf, 0, ring->buf_size);
 	ring->free_tx_desc = mlx4_en_free_tx_desc;
@@ -757,6 +758,7 @@ void mlx4_en_xmit_doorbell(struct mlx4_en_tx_ring *ring)
 	iowrite32be(
 #endif
 		  (__force u32)ring->doorbell_qpn, ring->doorbell_address);
+	ring->doorbell_pending = false;
 }
 
 static void mlx4_en_tx_write_desc(struct mlx4_en_tx_ring *ring,
@@ -784,16 +786,19 @@ static void mlx4_en_tx_write_desc(struct mlx4_en_tx_ring *ring,
 		wmb();
 
 		ring->bf.offset ^= ring->bf.buf_size;
+		ring->doorbell_pending = false;
 	} else {
 		/* Ensure new descriptor hits memory
 		 * before setting ownership of this descriptor to HW
 		 */
 		dma_wmb();
 		tx_desc->ctrl.owner_opcode = op_own;
-		if (send_doorbell)
+		if (send_doorbell) {
 			mlx4_en_xmit_doorbell(ring);
-		else
+		} else {
 			ring->xmit_more++;
+			ring->doorbell_pending = true;
+		}
 	}
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
index aab97694f86b..601c09020f38 100644
--- a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
+++ b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
@@ -281,6 +281,7 @@ struct mlx4_en_tx_ring {
 	unsigned long		tso_packets;
 	unsigned long		xmit_more;
 	struct mlx4_bf		bf;
+	bool			doorbell_pending;
 
 	/* Following part should be mostly read */
 	void __iomem		*doorbell_address;
-- 
2.53.0-Meta

