Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADCB4AC153
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327068; cv=none; b=VLgICVTwtcn3bc83b8h+z6SoT/CjDjhwMS8BADDJfsDcqLw1sWgdJGqP5Qvr3QcX7q8wdLA0UF8rQATMSfeVtnDSCl/oTckTqUOs0FdM9Li+svtk2ingXJVOLCfFC9EuTEt+Z8yO5B6RsGBHSbF+8qrWmfTAXvdZFJ3pHApTFQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327068; c=relaxed/simple;
	bh=9q/Q6o+ob2o7WEZqJukHlF5j2ofuhypf6s5/8ZliFW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCiQrpBvUVkU9Mg5VGuQtx8Poe+Un1/iW5nnCiJomkbCbL/8adQ+KUmC5a+Yc8qYyZWgsADxo/pww9IoHHnxj2bliY20XIX9HVsS0OFHVUDsH0h8Snx9ynOldImUIkZnNWBm/8LRI5yX4g2WL/kogn5HFVCnQz/XuzUskhhHa2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=CO0D5nD2; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="CO0D5nD2"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a865731ee4so1048627a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791327068; x=1791931868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YAIbJYCoaKPFMKMZsiSwU2c25LSNjGe+Dlh96jOlX6g=;
        b=CO0D5nD2gy27fcbj2u8TpoUHDAaYuZVsT9ZPrcWcnprhtETOBvE0GNBhL4tu3WRIGE
         AdwlWWkSlrZzrew/XVsvG94tVP6wwOees2Roti8t1ufbK4oOOfeUSbEpPXJtEskybIkI
         hzd4vzk3RNWosDb9Ur9dD8PkV3x4SUMpGgrw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791327068; x=1791931868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YAIbJYCoaKPFMKMZsiSwU2c25LSNjGe+Dlh96jOlX6g=;
        b=zryKL2Q6cbSahB0o+cxNJ54Qdw1Od4TYqr26C2lu/TTSKjtJpC2eUaTdDOx7e3OArF
         SNZ5iSmsL452EMytcdRS2Q/4sNS3yKNrmzImp4IOV5d6E5bfOQtvlXHvsHiJ+p9+df66
         RdhGr7fJ44XnVYvnYnKqqQHDyZa4a7w2HXJA0h4grjg2kWTugQx5O1PwApeopAvoxoA0
         V9yPJBaRG9VGla9SdGl43fPzGTrhqe4H4dqSJ04hQXFzGggLmrL8xd8TIQMnLYdEO5ci
         J5ZiIVzcrxDlJNhI0dHm40W0Pid1iqPpYZMr7IwXff/vTIyJH2/HsUq8C4DX4twLh3sy
         cprg==
X-Gm-Message-State: AFq9FYLZeWJ5uWTdzUycfXutElqSgyTDQSiTMSHvzlHOxeIWZIpqPCXL
	x3KewHimPmwlU75Favu6CJ7GAI13vD6/w4+45OaaW40KTuEmV+3VjSwPNMqmRjzyN4Ci8QhFDBh
	BVPxqwXA=
X-Gm-Gg: AYBFou2nngjjVzvJG9wgxb/ZrC7fWmtT2p1Ygx9gDoHywv4oW6LWw0v/utv2wUYzZkU
	hHVDPw4JcnLNopFgFfVXgnSklUTKNe0uEtp2g5+sDYB5M653S6Q3ZCgy4Ris0C8AshaK2YJZZ48
	NymYmGLE39spO1DEwozcCMZ1kSh5up6Q6GvT9dECC6uo/PifUQh4lORBms6nDUllxeSxhWj6d7r
	u5XE2yDDbhrleFBLFW2e4ybifzFL4o7LzH0fBUNiD4hCf2v4q6+6d+h6pI1oNErDQ7nALWgjCPm
	54G7gq24V8wfjSz0khbtmnWw3SXUbNPE24IdWw8RckaHiF2UfSJzv5gueoGJ8B5jk09E8o8QoNW
	BrTk3UJfQE/lamJJfrMG3OFvix2i0757UUj+pE8Oofxp6r4MemjdX/YfZcwpNlzFE7NZKnBWBTP
	R09zHDuYWyaiLO34YN81vmhgFnLBE+duynaEBzcBuW4DawRqkWdVqx1AKWVxYaB+wJP0Rn14Cu8
	a+tafIL20tlcHskB7w4ajhoehr/xKeerfiJYwrrn3xJ/rUBVD3MKxrrHXno1YbymDOr3P6SVI6a
	iRqVnu2Gog==
X-Received: by 2002:a05:6870:4409:b0:48f:e0e5:a1fe with SMTP id 586e51a60fabf-4a259655af6mr418975fac.50.1791326557484;
        Tue, 06 Oct 2026 15:42:37 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25700e3easm586986fac.3.2026.10.06.15.42.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:42:37 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH net] netlink: reset skb headers before unicast and multicast filtering
Date: Tue,  6 Oct 2026 15:42:32 -0700
Message-ID: <20261006224232.50724-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Socket filters can use SKF_NET_OFF and SKF_LL_OFF to read relative to
an skb's network and MAC headers. Netlink producers may reserve
headroom without resetting those headers, allowing a receiving socket's
filter to read data before the initialized message.

For example, IWPM HELLO replies are allocated with dev_alloc_skb(),
which reserves NET_SKB_PAD bytes. An unprivileged NETLINK_RDMA user can
attach a classic socket filter and disclose this headroom through the
length of the delivered reply. The resets in netlink_dump() do not help
because IWPM sends a separately allocated skb through netlink_unicast().

Reset both headers before running the receiver's filter in unicast and
broadcast delivery, as is already done for dump skbs. This also covers
other netlink producers that reserve headroom without changing their
allocation or message-building code.

Fixes: b1153f29ee07 ("netlink: make socket filters work on netlink")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 net/netlink/af_netlink.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 9fdf964224ab..01af3bb144ae 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1363,6 +1363,8 @@ int netlink_unicast(struct sock *ssk, struct sk_buff *skb,
 	if (netlink_is_kernel(sk))
 		return netlink_unicast_kernel(sk, skb, ssk);
 
+	skb_reset_network_header(skb);
+	skb_reset_mac_header(skb);
 	if (sk_filter(sk, skb)) {
 		err = skb->len;
 		kfree_skb(skb);
@@ -1497,6 +1499,8 @@ static void do_one_broadcast(struct sock *sk,
 		goto out;
 	}
 
+	skb_reset_network_header(p->skb2);
+	skb_reset_mac_header(p->skb2);
 	if (sk_filter(sk, p->skb2)) {
 		kfree_skb(p->skb2);
 		p->skb2 = NULL;
