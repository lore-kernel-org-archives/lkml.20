Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917269;
	b=mmiJ0viEK/ojyEtoSFyezNEFxuJaHodrgmZxpmDYUZ0dzxbqDBJrK0di8U5WKZVCls2r
	 XM+1tRaAalmPjxXrBcK0UXrC74Vxmxv6APmCK9n2J1+mHzCbTLbo6rBFh83Rv62gQdOw2
	 1Zj2esKFDbdw0+vEBz3tHV0lS7sX73W3DBxqhsgkszlOrBLI21XvTiepc3+U63RWnaW6h
	 S/r3IPUGA0f1/zsQFfyeuz7xLvk6Y+vnlQGdz51zhcXgtBJ9T7/h1YcHk9Urdpj9n8bcu
	 M282JVH8nUIwZ3y1GjrstRqtHdaH5f7UQ4B/EU+KdY4+96YvUVqjtpzpWN8XdYL6P/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
	b=m8CmRTSGQzgBsKkic+5lKV6FLLvdjHeaGFbipw2ic00PKymWSgt6YAgmOn6RwiDROd7L
	 Ffp4msPWZ8Riu1Ufrb1XSNPpy2F0ArR+GLpP/Nf7VIhKoTkiDnF2daG1tVI5f8TGn8Cye
	 ETFPlgHjnmU0+JSMDhOAAVVxisQUN0YTk/vLZIVLG6E1lGaJBP3NjNwVu5Lvy5BQQIwRh
	 SCtTxiYwYE7X7RxfdVJ2lNTfWXyW1LPFvQYgBUQ/THLHX5M5tkMd+i5Q6G2fcdDzL7GoD
	 CMrAc07WVAnzMlXQwQ/2QuR6jd8+Df9BViMJyOarLLCg3zhgJyldyODiUSAIKw4REGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrlqBW95;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2BD606D83E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2BD606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrlqBW95
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-14345ae29c5so51663c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917268; x=1794522068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
        b=ZrlqBW957FVRSJmhWtYT2LZ20iLqM9RUGB7Z0X1CqCOXFP0vE1Q7C6Q2nXJgpBFRq4
         Y0uMg2XCt+yCfud4FgOvOKF0JHJPs0lVYLnGJQ4jcxxF70pQppH8nnLD50s6trUzqKW9
         HGpBPaeom520SaQnpAAKksjsd0wAIXkDsU+aD/KgENAMz/PYFf5jq4jUvqCBiJJpoqLG
         v+bH1XZdZ6WrabNwkAW+3z+BeWR94LS0RIHFvavciURbGe8OriTuxF/R+Rx58PPkE5Js
         VeLlpHVqQwrZGLRVasQ9dARnv4xZUCKPjgg+Sgd9mEmFSk4Osvn6arU4uu75Bok6gbqw
         aZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917268; x=1794522068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
        b=SxNIdyu1y0uzeya8W4/MGmtxefaq0ccakTjRu5bOrdh5FXbKQDm0UODBcFFy0yc5mR
         atXUzwJdy2L/fKuPaY46eStAyp0ytqyIpXM3JRHdNdKmUVJhEegPk65luNx2r6IeGUh6
         MoG2OpyIVh6eAwsSpQ5cUjlwSgAFABVPrf/sWpnU4hm8Bfl/0pjbzh7L0yTWsOgzPeTx
         JEE8wLF7HkP9bMvEZOYV3PncoRVXVwmd2P/xlzr2t2gl6JTB9Y/kP9h6nn1vjRQTufWu
         /n+tCfmhQ6cHq4l6T9gfHhd//8abIIG8Z70yXt673aB8H+FmiaXgFlug21cMDuaHG2Pb
         tPCg==
X-Forwarded-Encrypted: i=1; AKwUvBxlc5ODHo+ORfClS2PakMry6LAmqy7UP3PVdCw2f5iUKLXTfzHqrKZzcX3jwrQ7fz/0hEE9hrqR0XADK0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QcHJx753dejVyUo8JjpGerIIIp18Q+lT3ubC/D87qi0TDuAQL
	xPgDI/Oj1HbpCq1HM5P6+0H2VlD58nigpiVvyS+X4N0ZBVbmu6wPCOz5
X-Gm-Gg: AYBFou1/mj/x5DwHL8ZFvDExf5DZFcMcUyqhaM4TctF0SUTJ70eMpR457krQqae7/GN
	BtRq36AD+5JImbIoH0wkzLTHPDaCbtxTE+efLP7oI3giaeirVrV2hCWS6IQSdGY3VrdNLimubrh
	NHduhOwb++TEM0DRK8KXG41Xae0BTHYcrkIslEOcOGxID6DD76d8vbACU7GkuWtZxLu6beTv5jK
	FtNVSBBOCtVEuqkCx2aTCpOOq/r/0nUCaY5evxiOaxOxLJIACtz+Qrl66P7alW960OHFCeB4jkD
	n9gruHJJq0uOakaV4kQHa7DOZa+TG0dmcCWZd0Ln1o9wqWeLiKCHOq8vQkXkxohMR57m9OFlORX
	ymj0ledN8V77CUki02npSZ8xafnQphCSkfrl7jiGfMJzURGxxgUu8NvtVQVacc1CjLrAa0TMIep
	/s+MXd3R2t9l/zPSS91w7hXFgKkRGiUvyQOlgQsEhGeQQNPq8t6o4pXNBUgJT6aE9eBjVsy1Wly
	s6NJKDY8Xy/TJAgGIVsbSO9ECTotvf7jJqhL24ciqXUTvbV0ka016QmHhA6iEqCnz9/W359FOWd
	8PsjRIWIJoXXo/edTn5K77U=
X-Received: by 2002:a05:701b:4590:10b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b25d31efafmr453115c88.19.1793917267847;
        Thu, 05 Nov 2026 14:21:07 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm26931436c88.21.2026.11.05.14.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:07 -0800 (PST)
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
Subject: [PATCH net-next v3 6/9] eth: fbnic: set the netmem TX frag size limit to 32KB
Date: Thu,  5 Nov 2026 14:20:55 -0800
Message-ID: <20261105222058.944293-7-sdf@fomichev.me>
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

The TX descriptor length field (FBNIC_TWD_LEN_MASK) is 16 bits wide.
Set the netmem TX frag size limit to the largest power of 2 which fits,
like bnxt. With 64K pages this also lowers the PAGE_SIZE default, whose
64KB frags don't fit the length field.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/meta/fbnic/fbnic_netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
index 8a6703afca38..0a2b66202aec 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
@@ -760,6 +760,7 @@ struct net_device *fbnic_netdev_alloc(struct fbnic_dev *fbd)
 	netdev->stat_ops = &fbnic_stat_ops;
 	netdev->queue_mgmt_ops = &fbnic_queue_mgmt_ops;
 	netdev->netmem_tx = NETMEM_TX_DMA;
+	netdev->netmem_tx_max_frag_size = SZ_32K;
 
 	fbnic_set_ethtool_ops(netdev);
 
-- 
2.53.0-Meta

