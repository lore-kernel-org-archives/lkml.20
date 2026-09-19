Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F6395AE3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854768; cv=none; b=cCg/j7kbMmN6JvCWcOrhOSKH6PGMsyA76EJ/kujlyNvV9M8knk0BFxRNMHHeLB28F5hEEo8CeVVxyMt4Sz6gUJdcJyjSxHezpYfhxLhnfcOEybOGRPht+s/lJiZ09y6DT39jqM+9IdbHLidFbXclG7q0IWqJETZwKuCjEI4rJ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854768; c=relaxed/simple;
	bh=YW6Gi7D2/H87n3HPiVky+/xlwpzlVguoqM2i0WP+mrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ANlGMBo4kkpkeFcywCNK05Hmh6b/gBJ+81k2Foz8qJM7IvaZj7P88qauAoGAhAdBn5PUzDqM2yfvZqEGYx8HXrLgaIoSXLb3BS80tE+U3KxsKY59ViyTnuNrd/X6eQFL4J8xXZ6wRsnnQMAddTbU7bm+tyoVu1uMnw9o4cxl13Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQaCixrJ; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQaCixrJ"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso924240b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854762; x=1790459562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHO1A23GGY3oucDFR6eg4tcJFI3qqigh+dtyFgyYgao=;
        b=aQaCixrJyOUkZ/zG37cytB3px9L0H4mOZ5zCXUR1nbv0aeuG2ZjBtP3cO9tKR3ye7A
         jrz7ci1kNaFL578zr0IfGKxliILgwyP4lYmexzPwlIy87DF+3bejWRNa8PJVduMZv+9E
         fvlbu4o815liui16DRNfsnos8KBI2fPtKXQaDsBhiwmfdkTPaE1hCGaY4B3hQAxqZE5j
         C3vxaCrxyJb5//XILNMsdomCBBEu0cUPiqMa29at3JheheBEjEOjFCawOd+3ZU8Qtnjv
         nhxt5xT2MwW21m4rpKt2IwbBQ3wKVRhTMSTdAb9WQwehoj3AIPiiiTEgE+uv8q4yb8Va
         QyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854762; x=1790459562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHO1A23GGY3oucDFR6eg4tcJFI3qqigh+dtyFgyYgao=;
        b=FshrYEap8bQ4DyS5h2U0meVpWq0ohduIqH0SKSp3vldgaSnzdjPl3RcLpHaJLkJebX
         eaUER+nMTRgMU3ta6aeVBXRXvcDGK+JLzLlAj3tYXi0WosNbqPj3AqDjF6kp+5gTZaqX
         vG6Df4WeIyKLAW2PgBYVJflcdCXrWbGm3pnvZzK9VX47O1p6rv7yhaReSJQrTpJWWJaz
         53kDKDOUQXOiQ1X7BXDDx9aDkpW58iE7AwoTMSZeVoi4TOfnx1J3Wh8cYffQyLLz1GAi
         aJ/4j6E4YOgevdv5lqjxBIr909Jst+7bY1RP/bBE4VkvQYhplKIyTuOqHCV5vsOzvzyS
         TPow==
X-Forwarded-Encrypted: i=1; AKwUvBxAr3Pg8WEZjNBSzZV1p1iYkDUlRbIt+Z8stFtV+k9wxYTDWN4mWnDK0aG3NuHSA1q0zqH8M3wTerRfdHc=@vger.kernel.org
X-Gm-Message-State: AFuF++k8zfqi4LQgqhnrH3DqTBqhahO2uNqM7cwwdwg/2g0X/oEvBA8o
	muxLI0sDdcLpiokckEvbTmkCzH74cpZOvxAG+KrKdeyhe4c8zHvzfntJ3IqrVUFU
X-Gm-Gg: AYBFou3Fjn9nWvvJjfpclbTQ/CdF72gNXwbXTdEWgPakfthTZEzLXWpxdp/8jkcqEIw
	dM2kDSRsxmhSe6DGWNZxzuG1zrTq4VnCI3ibyUmGYbyr24OHhEQP9sdbRwnYGcv1liMcicpfYkD
	2q1YnBxbPenh40bD7Wy43gGbKdxMXtINa1f3ucmE/BZQTNu5bGek5VcuTgFCzGREqy5kfZIzz3Q
	73uZ3Uqbebjun0n3tuQQHr63hQb7+fSrYnApwy6fGooRXUVa+zlJUDoETYlkQZ8yzGfKo9QsuDB
	bI59Wj3hXM26nT8+Kp5ifrtckWl6E1PopslG9bt3kDd9ui3NtHAK+/uT0nNH68MCud4YfOIPXO7
	E9ADNHCga0ICEUszd293W3phm/B/WrIjpfh5AnhxhekqH6TJQPneMdWTTX90BRIL9PVVtQI2f80
	kiXnuyxmsSRcu9QDok9wmYpgMbcXPJcQ4lwT7XMWKihd9EWZ6xaEXAoommiPU4HVRWH5JShjmvK
	q/wEJOyXl8Pu1tsmEKKdECIaLQVehJIinkhRDVA1X/K3viWQEqOqIujEUCAsI7Mnw2p6M+ymGVv
	0kPyajmw1g==
X-Received: by 2002:a05:6a00:882:b0:868:f03a:70d9 with SMTP id d2e1a72fcca58-874dbeedfa0mr10037157b3a.4.1789854762167;
        Sat, 19 Sep 2026 14:52:42 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9b0c55dsm1327117b3a.37.2026.09.19.14.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:41 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] netfilter: nfnetlink_log: fix config error handling, SIT headroom OOB read, and nlmsg rollback
Date: Sat, 19 Sep 2026 21:52:41 +0000
Message-ID: <20260919215241.3471723-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three issues in net/netfilter/nfnetlink_log.c:

1. In __build_packet_message(), subtracting ETH_HLEN from skb_mac_header()
   for ARPHRD_SIT tunnels can read before skb->head or past
   skb_tail_pointer(skb), and nla_put_failure returns -1 without calling
   nlmsg_cancel(inst->skb, nlh). Remove the unsafe ETH_HLEN subtraction,
   verify hwhdrp + hard_header_len <= skb_tail_pointer(skb), and cancel
   the partial nlmsg on error.
2. In nfulnl_log_packet(), only increment inst->qlen after
   __build_packet_message() succeeds.
3. In nfulnl_recv_config(), propagate errors from nfulnl_set_mode() and
   nfulnl_set_nlbufsiz() and destroy the newly created instance if
   NFULNL_CFG_CMD_BIND was processed in the same message.

Fixes: 0c36b48b36dc ("netfilter: nfnetlink_log: fix mac address for 6in4 tunnels")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/netfilter/nfnetlink_log.c b/net/netfilter/nfnetlink_log.c
index d923f2cb1398..ae29dd55d7d3 100644
--- a/net/netfilter/nfnetlink_log.c
+++ b/net/netfilter/nfnetlink_log.c
@@ -610,10 +610,8 @@ __build_packet_message(struct nfnl_log_net *log,
 
 		hwhdrp = skb_mac_header(skb);
 
-		if (skb->dev->type == ARPHRD_SIT)
-			hwhdrp -= ETH_HLEN;
-
 		if (hwhdrp >= skb->head &&
+		    hwhdrp + skb->dev->hard_header_len <= skb_tail_pointer(skb) &&
 		    nla_put(inst->skb, NFULA_HWHEADER,
 			    skb->dev->hard_header_len, hwhdrp))
 			goto nla_put_failure;
@@ -688,6 +686,7 @@ __build_packet_message(struct nfnl_log_net *log,
 	return 0;
 
 nla_put_failure:
+	nlmsg_cancel(inst->skb, nlh);
 	PRINTR(KERN_ERR "nfnetlink_log: error creating log nlmsg\n");
 	return -1;
 }
@@ -832,11 +831,12 @@ nfulnl_log_packet(struct net *net,
 			goto alloc_failure;
 	}
 
-	inst->qlen++;
+	if (__build_packet_message(log, inst, skb, data_len, pf,
+				   hooknum, in, out, prefix, plen,
+				   nfnl_ct, ct, ctinfo) < 0)
+		goto unlock_and_release;
 
-	__build_packet_message(log, inst, skb, data_len, pf,
-				hooknum, in, out, prefix, plen,
-				nfnl_ct, ct, ctinfo);
+	inst->qlen++;
 
 	if (inst->qlen >= qthreshold)
 		__nfulnl_flush(inst);
@@ -1002,8 +1002,10 @@ static int nfulnl_recv_config(struct sk_buff *skb, const struct nfnl_info *info,
 		struct nfulnl_msg_config_mode *params =
 			nla_data(nfula[NFULA_CFG_MODE]);
 
-		nfulnl_set_mode(inst, params->copy_mode,
-				ntohl(params->copy_range));
+		ret = nfulnl_set_mode(inst, params->copy_mode,
+				      ntohl(params->copy_range));
+		if (ret < 0)
+			goto err_destroy;
 	}
 
 	if (nfula[NFULA_CFG_TIMEOUT]) {
@@ -1015,7 +1017,9 @@ static int nfulnl_recv_config(struct sk_buff *skb, const struct nfnl_info *info,
 	if (nfula[NFULA_CFG_NLBUFSIZ]) {
 		__be32 nlbufsiz = nla_get_be32(nfula[NFULA_CFG_NLBUFSIZ]);
 
-		nfulnl_set_nlbufsiz(inst, ntohl(nlbufsiz));
+		ret = nfulnl_set_nlbufsiz(inst, ntohl(nlbufsiz));
+		if (ret < 0)
+			goto err_destroy;
 	}
 
 	if (nfula[NFULA_CFG_QTHRESH]) {
@@ -1031,6 +1035,11 @@ static int nfulnl_recv_config(struct sk_buff *skb, const struct nfnl_info *info,
 	instance_put(inst);
 out:
 	return ret;
+
+err_destroy:
+	if (cmd && cmd->command == NFULNL_CFG_CMD_BIND)
+		instance_destroy(log, inst);
+	goto out_put;
 }
 
 static const struct nfnl_callback nfulnl_cb[NFULNL_MSG_MAX] = {
