Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646886;
	b=3lQc16DRfVhWGF5eSfOHMOtgD8+axflt0irbSo3xdzQ3+mJPZBWyUrXJz8xMC6vQxX9l
	 6wtHf9+nidOC8R+Iy5CqQCAz0za9uXFWeiaKs++bVWKJXO4mN/aYuKBB092co+hdlR5lh
	 f/CfU7tqbvNCGsc4LnK7kvT4Htlx4p0rPgwRF4VHDljg16oo9tMeSFAigb0jSVH/FzHch
	 uiPv6EaxeU81YhEH4ZnSHw8Zgh5ZDbP0OC0DPN+5TI1Pfp8BK9UfIJ83hRFSrIgXhraLX
	 ycZt+fAVQYQNIExxFoT6yQKMCo8p0rjS5vM3uiIzQKGY5rpu5byAUuGKQpnKNMmk9lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0fkWwqUr24UUjvWom7HkAX5hPBH7703K8eWke+dsLR0=;
	b=IyYhxOXBmPocmah1ht3okxGLxOevV3zDFUMqsqE/FF8qk5zChi/vGIHThRbLuNK4cRrv
	 3c52eO7uyCYcsl8N6rYWI11m1n5ftXkSF4zM43O9vVmcAtf1NvPA7emz2ZOnQBeyTqO5y
	 Gm8zimB7Jf37jz+3nTvsCfqongVv/BiTvXDftSQ76xKZ+WVgX+zkW8D+DYKOaG1kXC6eG
	 54fBvVrlgkwyM2eHQkqOe2HVcOwCac1HF5SZ6c37vrQRFsOx+jmMDKNv6KZRJXGYCOcbN
	 Yj+3Z1ywe4SjCNEUZmhuY5Q0A/QcEwq4HTD0xnCgv8ndfb0qdlogl1jatqGlGAS2ddA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJiTy+hC;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA3606EE84
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FA3606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJiTy+hC
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso387794eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646885; x=1794251685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fkWwqUr24UUjvWom7HkAX5hPBH7703K8eWke+dsLR0=;
        b=dJiTy+hC3H4kxCI3qHT9mx61g9/FmwOVPDgGu39Cm4eH7Ev2O92eDCqDrjXnnZbJi/
         oujjVOK5sfXJe7NCV+utNUtQZsvpLoLRlAVWvoYT31nth3GhXBZS3K0QEA7oIV137aXq
         hP2k5rcV2T5SHMxqH/fM7zp9bqiaAsMShtqOf998cSW4FtQfH9P6O+ji2LngoVodiqol
         wQ0mWoBgcsEp3CPOF/oXJyw2jKx5DmyqIIGzzSnKz/85KXSup4xnII6+MqwyFxZw/MXd
         S+PQvDKBuKQuPypOEOgka8V2i//wBD4gA6AuMj1diGXpDTtez1u9pqnXuA/6dJ2tUR5J
         VjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646885; x=1794251685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fkWwqUr24UUjvWom7HkAX5hPBH7703K8eWke+dsLR0=;
        b=tbFkj8OpDqZ0ixYiq1aa7keKOj+Zx1kJiaez+K3pAw9pkxzEaAgAsUtvVskdHYN0FC
         QH0eXRwlI0IO7KVPTggGiY46Xvnjzs/lItnDbskHcsp1m9atG9Jyz0t9M2QUYsz5zwVc
         oZkLr5EiBmriSNXmKTUJR0ADo7Q+6vSvXuPeIAR7CY2k5Srzh6Kdtyqr66LUiZhUallS
         l4mBhKvma7NFF0In2uxECO0MpuVJC5jgnuJ8atsnxzJ0isHYkIYB/CU7dSFLrNKHT5zd
         bqWncc3SBOEfmeK/Derlg0yBa2XINpHBXCrATw355SMnBlrvbsVQ51s9T1aiwsOHqQgQ
         Zctg==
X-Forwarded-Encrypted: i=1; AKwUvBzrShWI3ealQQYUhS84MKOLndOs+WkhOpnz/i9ZdtA3RpyKs+yZxUmwrmZrdceXMwGCjCNmVC7zDrmah/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LRBXtDoxjJLIaAnwrhmTLeoyRVsIePXuY+pAion3PEHXX0Vt9
	knsuPmJx1j5P4nH6myj27Pqt96wEU+aThMNBED3P5OeXO/yPG9dvDMzU
X-Gm-Gg: AYBFou3h8xI/jpIj0txoAFMgvvHrpmB5grM9H/tTDxgwqhVtoMb/DhaCzOPsVR6mt8L
	0khdPeFOOdHS7gkuPXMpC+coZdZOIk0kopqm1fBbUKPb8eVn0oiYQtTJ1USNHt/mAVELDAJx2cC
	DO1rVu93txJk6XF3DbAJEj9X/JznoZDp4meuBQbAXYZaCMA4BrzPYvMJTt5rhRj3vawcEL+uo4l
	80Bar24y++KjWcEDcQ4YL1GPezHJS/4SfKx32szXebB1Tfjb0qFc8CqWQJ59AnjbQ1MK7BPrQJD
	T1/KgIJyEm2OW6XR6C6soZEeWK6FOOYKiNsI5+SxESDAFar0QNIeXT6xJfSHJp1PaOdvL7eCVz/
	BJu3KD3u6tbdm5y4iw0F1d+H/5LYHtey/syASZ4Rb3VtWNbi68Ws+1F5FfJ1iRkQZrivqavP2jM
	qTZwNsQRa0pVPjU9Ax4WBWs5KcUdXaPDSrJiVcvro8riPsyHIVH58iiLsRJAho4IYF/66BCTFJz
	dhYtHa2KugRPmmV11pnSrCUHZ8L8uZj6/z/XVpfRT9ktHd520YqnvfNMCjwfFxQoBUueh7dzVYC
	xdcwSncqdjNtksXJ+CQ+5lg=
X-Received: by 2002:a05:693c:69cf:b0:369:daea:812a with SMTP id 5a478bee46e88-36a423fae73mr15064264eec.30.1793646884909;
        Mon, 02 Nov 2026 11:14:44 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm40129419eec.24.2026.11.02.11.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:44 -0800 (PST)
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
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 5/7] bnxt_en: limit netmem TX frags to 32KB
Date: Mon,  2 Nov 2026 11:14:36 -0800
Message-ID: <20261102191438.1059771-6-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

The TX BD length field is 16 bits wide. Limit netmem TX frags to the
largest power of 2 which fits, which keeps 4K aligned frags 4K aligned.

With 64K pages this already applies to PAGE_SIZE net_iovs, whose 64KB
frags would otherwise wrap the BD length to 0 with BIG TCP.

Tested on a 50Gb/s NIC: devmem TX from a 2MB hugepage-backed udmabuf
runs at line rate with 2-3 frags per 64KB skb, none above 32KB.

kperf output (sender side, 1 flow):

  client: == Source <sender>
  client:   Tx 46.358 Gbps (174483046400 bytes in 30110590 usec)
  client:   Rx  0.000 Gbps (0 bytes in 30110590 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:           729   153 599     48    0 13893632 3147
  client:   net CPU 71: usr: 0.03% sys: 0.06% idle:67.62% iow: 0.00% irq: 1.12% sirq:31.14%
  client:   app CPU 72: usr: 0.16% sys: 6.01% idle:90.66% iow: 0.00% irq: 0.83% sirq: 2.32%

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e7a4190a8c78..c8a887facc20 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -17439,6 +17439,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (BNXT_SUPPORTS_QUEUE_API(bp))
 		dev->queue_mgmt_ops = &bnxt_queue_mgmt_ops;
 	dev->netmem_tx = NETMEM_TX_DMA;
+	dev->netmem_tx_max_frag_size = SZ_32K;
 
 	rc = register_netdev(dev);
 	if (rc)
-- 
2.53.0-Meta

