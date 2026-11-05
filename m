Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917270;
	b=gk1i1M7vCJ4kBXrWGicv2xMzZbE0zM2kb06R5DF2ozTEBmoRVPAou0O2uawBcy6X8eoM
	 NCJGFhx8Jpk7TOHoQ7JqzkVtRc0WhAgHRdl9Jj344g1H8CHiIT+PX8+4t01GsgfR29f4Z
	 qPl2WLzK4vI84U/9pJGJsVi+UxiC5ytMRV3enTMEYtlbEHHBZ6cJdhtpX3SxYPFax7LIQ
	 GIp98DsM5JtCLLF3yQeUWrrZoROXAbl1ZPatMZd1yPm6i15Oz1SfnGON/iP9/hYF+mGyh
	 dTgWCByh8ozxz7cxqHiP6n9C7AmWkMbiRPNCr7HTLONCFuFX7blcm2aCO8ZqedDkcOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
	b=cNs/PKrYzrBm2PFmgmjGsNl8KfSJKv7z9KQsaXGVirU4rL1t9ix9Ysg3sYDzrrka60wk
	 Py6I6T+tuakmX1yik0e4qJlglXyA3SfrV1Eate4DfYD/yReNBb4+sUak0sKGtuW8r2QDb
	 ddo6J6NsGi8aqa1vBPOOQDwH0cBhWlidygnTqhrqto8ckr0aApdCWBgODBxZN66/h1bC/
	 UnxEUSoi+slYJZUqqnplRvS7bfRKkbbdkYrqbuHHEEekdJnEhvHifMuFpxIJelSGpc25O
	 7Mt9gJnUxeITRkerGFIA5y8nswFnWRF0Z+E9n37z+WFaZ/0you6mOQntwjuKu4ehpeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXK09pbb;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ADA606D818
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00ADA606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXK09pbb
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-1379d236149so80315c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917269; x=1794522069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
        b=tXK09pbbOwh8AP9jNlpQhqDpUJfAjAae6Ku58Zgm44oOrfeRgdSy3UqYDB78OGEkcU
         +7aiH8UB+U/cTYuBSbGlhDQoEbs9Vjmeyf3p9O/kparVcGyxuc93925WNTKkW6a3BEzO
         kK/Sp3YdmtVRiF09ADY4T1DxgRws8BeCuiAIpg2IYjHqryzRmvfWPHfU/TX0kerBTqqP
         Z9XvevicmbaLbeiorRF3IL8ubRSPGIbqOCg8Q6r+m7CUkeDrHjJ0xWcSXEoZeV3ileAK
         XGTP86A9kpQXIAKr1zaON1csyIQLpcAgryipH13EsnYOQnbNlmrL/xzxbLANwK/Q5qrd
         5YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917269; x=1794522069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
        b=d55Y5Jc/GluaabwraNDtGFA1jP39/mnQG5+WPMRHlXt5hi5AjqJ0lcs5gSpFwytCuW
         c/op+kov+dYxmmR+cwbmj9lxanhyA3BK5sp4uOa7GpHt/vevsmwoHKLitVuxWUzx9Mrl
         n+TFgGB1/Z9JMSTmsqTXXtXvq6HgNetsoy0osM1lBQi6RXbd2y59dIDukN0DRq/dHIfG
         giDBELkMYv2Z8Kfoa0rbIeoXoNcO5p5syR8eaEENj29AVLrIOzlHZBRC5BKrfjqvUqnd
         OEHnzlMy4WapsMElz5DR/lL2IF0bRuVq2XYnd1CE3V6ewW7z9cTodteEqNd8xuQM8iHa
         ROpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJdX0M/wjB0iP8CqelYnCU57afzQqlazSOSnO04KNOfbYxPD/6GunF1rcXQRigxgHxHBtJmRyBMWDz7jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dVOevGB6ZuIKPaK0fqzNxtyJ8znfYOZKPWp3EI4AI8rE1ka1Q
	kHMgiBeNn7QO/ljUDFE8ToUT0Y6FnafD2EIa4awlw7WWuthhRGBTsaEQ
X-Gm-Gg: AYBFou0yYBEM4HAvHEbmbANJmbRk8BUs5AYC3wZoQyn+mJwz6t0CYHpMgp6SRKJ+32t
	GBUcUTozdmBqOqHdddH0NwnyEgC+Bmy6RhRkUPzV3M+pnlKxs9EF6mAYIbQwI7DOSgO7Qpj+E2Q
	hGz97Hjhglz9YWvPC2kLOlQ5s5BGUEAsh1HRLlcPLFtHmNGux4vSSXYpjrrVMBLm/fVFkAhE6Gl
	ptrvJrzQ6+hQcD8wVVpeLEx6td23rSll+XUujs/rp7Fqw2LzMh3IrKHMYp3DdLGxhhN0teCJfIU
	rmzCGDORTy5id94lN12MaK6fItlonQsDyzf+PxK9kXjt1vtD9W3ddsILqQ4TyBQYJhk7aecDt+G
	AnAtgeOPyrZ/dqsLNA30Olgg9oI3Ev8HXd7t5IJxzi9rURjspXaoPseSG58B7bn+kPv8TlTx41B
	0jh6a6IQta+WUSNdgqa4uitfgwW1ouHZDP7NWNxmvGI+v+GKIbftjAZs6i4BJF3lR19qKnNyoMG
	nmFCFsg6l8hcD5OnIx1tn7QXTsf29Jz7w47UYUezavvRWvdnku1wiGjzO0/hWwZLKPJKfJgt0Od
	fEWsanYVY3CM9EirLM7ZyeQ=
X-Received: by 2002:a05:701b:4292:20b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b25d37e36dmr449336c88.31.1793917268955;
        Thu, 05 Nov 2026 14:21:08 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm26931552c88.21.2026.11.05.14.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:08 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 7/9] net/mlx5e: lift the netmem TX frag size limit
Date: Thu,  5 Nov 2026 14:20:56 -0800
Message-ID: <20261105222058.944293-8-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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

TX data segments have a 32-bit byte count, so devmem TX frags don't
need a size limit. Set netmem_tx_max_frag_size to U32_MAX.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index c3c2c5720c6f..28ba04bd5f4a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -5967,6 +5967,7 @@ static void mlx5e_build_nic_netdev(struct net_device *netdev)
 	netdev->priv_flags       |= IFF_UNICAST_FLT;
 
 	netdev->netmem_tx = NETMEM_TX_DMA;
+	netdev->netmem_tx_max_frag_size = U32_MAX;
 
 	netif_set_tso_max_size(netdev, GSO_MAX_SIZE);
 	mlx5e_set_xdp_feature(priv);
-- 
2.53.0-Meta

