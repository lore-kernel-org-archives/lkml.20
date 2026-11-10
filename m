Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352409;
	b=JIX0qfi0KEaYaodUOrkZY6c3TMZr6iyLLl+McU4prEAf0Fm5+P2IzvlJFILcNtD0EmOK
	 EmD1YXM5rQpjaLK12QORnv6DaAOY8JdXfoYg+HJrhX9vHB5PJghM3+j6tgg9s5tRLr60n
	 Tk3woN2Xet37NC3gFJ83F9jBlwuCCFXdMkqLZmOKMRQnVJpLC+agTOlIrsclWmkzgjUQw
	 vFV2jOo6syAAIuszEt8nYSWkn2HHdMmtEfruHPWQ6Mhe/3mpWtc0XlXwS3guTcnid1rtp
	 S+m781vekdBYJmgF9xgHShKzg1aN40JlqzQG/dP1mwJMIXBvn7JUWjIBLDpPC0hM8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O1zdEmSlr6e17xANOXeUw7jgKI8hal4IZfaLSwVHO/Y=;
	b=nQtLe2eoEH6meDoInN3VpHgKWcxlVx62xC9FSJqhyLV4NykXDR1na8e5ypsjk2ICUoi1
	 iJMVo3u5wcyPNKEIPYQd97AWRlRJj9Wx9q7Rtj3L2ef1TTnf8N006smJH0kwnADj5Nrte
	 K9S35dM9OeKIG79L86mfrbHZH3PcZP0Wn94I/3X0WfYvSZSdFgymQ6YZo+TKYwTJqJ8kU
	 EM/jEdw4alMY081BCUZavP8rzAqj8eDKVuqytRkCxXiNy9RGuDnAtFwOaMICC0X4Mnvd0
	 /Ap98EzKD3PvIWdl0w9Gyyutx/GYvXi2okqCN2cfWyJ40lP3ArhklUFdyfpd+oJN+ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WUrW97WJ;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E41D60A2617
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E41D60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WUrW97WJ
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so1514742b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794352408; x=1794957208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1zdEmSlr6e17xANOXeUw7jgKI8hal4IZfaLSwVHO/Y=;
        b=WUrW97WJPkkiDyaPWBt/Yf86zlfQv6juXMNpHIHZOhnwO4n4cNdZ+rK8h+FAesSqPe
         wRKPVqoPPK51UhGdI1UDJti3+62RmC8UhKVhGWrZabQ9YxO2gHglKNDgQE7fmzsXN03d
         VndWLWwHM09scELUwC2ghDDVqkUR3Futp6OVXvZaNTTqLtJ0Dq6VHMcaZRP0/fUhKmSw
         2kBVtF6qDId2RQqe5g7v5k+XNurLhy/dI4ynNKAIki0DjV0JxZ6jIZdZoJvMzC20kpvj
         8sFOEX85P/Gu7KtP9/mY1NQ2aXlSeg+8LFbsM0IakzpH+jQpc9vwc/zz5Hq2rp9+PoB2
         EscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352408; x=1794957208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O1zdEmSlr6e17xANOXeUw7jgKI8hal4IZfaLSwVHO/Y=;
        b=xFn2PfCIBAnW4pLiHvcD74Q58yJVxUpVo7K5KXZNbzC7UFDV1PjE1HFpfFGvL+vB9c
         IGfSCRoAhPOBBMpCbWU5tkLx6UyHpYVp1LYZCpAWrkRUVm6OGJBqRyk+qhqVxRqKUl/4
         zJrkk/HIo4u+LnOCvpjBm3Gn4Yfuk5El3wij/KGFVuY5U6LRa5e3ARk5ZjuGJVc3Nhj5
         j+yZyrLftScwoPO+o96/AzYLMEIWjWA7WJyATmesvA+jApv2cTYp3k7kPKZ6becFPbrc
         AqcxJtiY3oeKvod1189inM41M3JOVBMvwIq8G9GmduTcXcl81ZaBifSVwqSTXgaio0P+
         O6MA==
X-Forwarded-Encrypted: i=1; AL+hErFIdgILltdHk6j4oplT4NGZAAFbHf7n+RO4FasmLIbWcYv4H2gp+KG0EWx2/6OnTBtusCClMcD2+go2RtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mp6IEicfvNKigMoZiFrKJ7Q7u7e40Ppz1ruEMHCwV/oJK8yUd
	YPZ1rgUHQ6xDgQ+va7SQjSg8ygJBNWcPiSR5PQWxDA4dNEvDYwhsvNTsMDzylXovOw0=
X-Gm-Gg: AYBFou2fpxNBzxn0+PnM2ci4EMD7ev2mUsEHotmDToNt0Lvqn4Y7AAGa9KoN03HCvsH
	wQSLPO3N+8dLsLp23jpT6Elzcm5rxw6rgHBp9iBt/HRdDa5ebL14TenMJvwizXwXEHtcOPWMxsI
	XQcREOlAo1X9scwYayq0W+l9sPy9wIdJwdKTcVm/NhXu7tTan47oLtO3HCc0QUqDRIZCO4/xSks
	WXiIjly5Htgwsqhah2TfzHt3zi1vKrsdUhRdjACq04XgZ60I+ItpzTQ7Of/jk6NNLuIiLH8CU3I
	zuCi2s2S/1B2YZ2u9mIm5xnE1jzw1EMKH2KE5h9FnmReeVCmoQSF41uYxCZ3YoC+RsUG7TcvF4C
	QtBkDx98LCX2UVyvOPz0Y+gjF+M1DWvIzDDVX3//tlGi/qFfYvgGSMknSMWCZOq+yFLo/YYQRtz
	y1lfPOGRAWdU5GeWAX8n6SgnRIQ1hwhUwbcngnxQdUN2GJvviIbckXZqJPoh5ryx5i2HgPqZ6Q2
	vioqelVnLdoPYWXwAv44clNa3WXvPjH19VEQMdptb42wBD7Oh1UCrdVzA1j53dijCVjSUurMjsg
	fWCJ76Pdha/dbdivViwCPkF4dBaUdBG+/O4eq48bGyw=
X-Received: by 2002:a05:6a00:4605:b0:89b:6041:2348 with SMTP id d2e1a72fcca58-8bc1c2a9089mr440796b3a.7.1794352408016;
        Tue, 10 Nov 2026 15:13:28 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:70::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b2887sm1432058b3a.20.2026.11.10.15.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:13:27 -0800 (PST)
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
Subject: [PATCH net-next 5/5] net/mlx4: flush pending doorbell when dropping a TX skb
Date: Tue, 10 Nov 2026 15:12:59 -0800
Message-ID: <20261110231304.1859217-6-joe@dama.to>
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

If mlx4_en_xmit drops an skb (for example because DMA mapping fails) and
that skb happens to be the last one in the batch, the doorbell for the
WQEs posted earlier in the batch isn't written.

The queue stays awake, though, so those WQEs are eventually announced to
the HW after the next TX, but that depends on traffic and could induce
latency.

Avoid all of that by writing the pending doorbell in the drop path.

Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 123071a47bed..3166837711be 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -1135,6 +1135,9 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 
 tx_drop_count:
 	ring->tx_dropped++;
+	/* an earlier skb in this batch may have deferred the doorbell */
+	if (ring->doorbell_pending)
+		mlx4_en_xmit_doorbell(ring);
 tx_drop:
 	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
-- 
2.53.0-Meta

