Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD53455620
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037375; cv=none; b=eSzdza/hdRg8X8tuQJ+Wy3dcigwVHkV2+LtMQkG4GQUfmpMi8cXWVyIcb/lnjekEpEgzpr2+OE7/7TIcS0CcOLgOs8L7IlDpvJ8MW+6vezlDud6qPRslqD3ZzZr+oK3JP1fMu3eovI358u23Sjba8JZsnxCZpfgrL+PFdGqeCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037375; c=relaxed/simple;
	bh=BvbpnQGPvfTWDP81tODh27OGD1ht3yQ6yFG7OIw7yfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iu++pvNpjIjnA68a3bYno8ydTSenXsg8lfknGudJeW991MuhjgzrGVtrKsKoMUdIR03q248gDJm4QbhRzOd2dJBKUUIcWIq7GByxrk7qAwddOpZZugEQBbkNwxLm74T0G0v6CmhoKYK9QuY5kj0VmrTE7ezQFN21KV658++OtUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcWMU3yy; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcWMU3yy"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-49b0dd21eb8so15198175e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789037369; x=1789642169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI+U+fsPLOvEOMqGzYRotHx97PTJxMVyp0ELRDTR1ZQ=;
        b=RcWMU3yy83WYK5Wd2cAi/JGJO0liJN95NwXwKXUy839HRCgD/NMOAxpdwhSBUAhxSV
         BUpn50KS3J0SpP2b1qi0ZHMsuo79RUKH4ro+tjr0y0Gm39l3hwLb6XIw8L3ZUHP4XZch
         dMinvVEL4som4l2958QPgl0M7A5K1pIm3eoSxlAejHTDoscEd2HF6apVTVibkT/hkYsV
         3l8hXeIOBzD81AfCSCWnjXH91aCqzCLD0j8vbYKkiPw0DOqtMtpzYDewOvahmkwgBEJT
         2E9U7R8hL0d1YiWeHyyuAB34bY70meGjQl1JKW7Es0cU4Ruwiebj/tCEQdyFsCeofDTJ
         dVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037369; x=1789642169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bI+U+fsPLOvEOMqGzYRotHx97PTJxMVyp0ELRDTR1ZQ=;
        b=HCwp1w3MOECZuDeECrrIGoX7ARoFA4tLBYHhuqfADVlbqWLDneVCCXv1U/7I0Zldl8
         QoflnmVZKYGGCBvhWrL/n4jW9j+GYp8tSe0aImVsVCp3CHpYhif0+H5Ss3NQLyC9INH0
         haFfUAxFKRp96bKR47Tnwf93I64vVIn8OlfuCG9ExmY+mNmlqpsTdsb/6fVgNlt4Cauy
         yh7IQ60hiJsTA2AXElrXVLwmWswhqAI0HNPV9Ge3qZ6TK3oz/tAWLPK3p12PQKfDKvI/
         ENZDOt6YLyHqCQPpLhuTWR/hSU1gx4pubwuDQJ5wGZb2wOhbuwLBNGhKD3l5xUhA1E/9
         owOw==
X-Forwarded-Encrypted: i=1; AKwUvBx3eIgZgn27rFLRjQ+4hcZxboAV5cv3yYtGvp9YBfe3evM7Cm4/ywkvagvNpPiVHt0+gKmGxNdPQUCedkk=@vger.kernel.org
X-Gm-Message-State: AFuF++l8o3PX2nmqzX3zRmPn42F4askWFKQSTPu9QYpugp8TvepuqGjk
	LMoESCTBCfbI3O7WOuKz3Tk0XXvzA1qG6nek/29JmhqN3H1qy02cfRtV
X-Gm-Gg: AYBFou1YwLgCyJBcgaOsGlaLUC7G6nvE3BG49DNu5FT0bJRDqtKtL7mBB5DiN1RXyCC
	OpFHY3jJIE+jUUeDirnFEnG6wwHorTt/jm87jh+eoiAqzlSY4+4hBWjpZWoT3VbtJiqRnwPIuSE
	ePCS6UenivYr74PNNtjGDwRoYMgcmjTfrWd5HYh/K5/wymZ8fwuyJ8In5ZoWEUsUiT5/jdaLnu1
	CukrBThkNX7cIGH847CWAjMPSIrV2aHx85mAOFMaiZKdgUIqBctZPcJx8Dv4BRrE/8VGdOGfkv0
	/CwM68qU6yFuExmpX4HkgSX2fw5+OQdeJ4QJt/+MPtGnE4igXyXlMdf6kyXOK8GozHBtQWXlcTk
	xR0XidpggTxm4JLxg2IUXchlZYG1oxzC447wv+voA/f9hQGLmdcVS97iRc11pTwt+X0vVd9KkSz
	rwAx44BXlgagLy0dLTX80ZB2q1qWEJ2iSyWP6KewEASfzKOfangm5GfJwVxc0QkfQs2PXKzHMiR
	m3pgLT4YalbJYg=
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be04 with SMTP id 5b1f17b1804b1-49cfc6cc091mr348067955e9.27.1789037369203;
        Thu, 10 Sep 2026 03:49:29 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.205.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm67419465e9.1.2026.09.10.03.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:49:28 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8c9eede336e3a843750e@syzkaller.appspotmail.com,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH v2 2/2] RDMA/nldev: remove the unused dellink link op
Date: Thu, 10 Sep 2026 13:49:06 +0300
Message-ID: <20260910104906.19681-2-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910104906.19681-1-serhatkumral1@gmail.com>
References: <20260910104906.19681-1-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rxe was the only driver implementing rdma_link_ops.dellink and does
not need it anymore now that its UDP tunnel sockets follow the GID
table. Remove the callback, the nldev code invoking it, the mutex
that serialized it and the now unused ib_device::link_ops field the
invocation looked it up through.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/infiniband/core/nldev.c | 15 ---------------
 include/rdma/ib_verbs.h         |  2 --
 include/rdma/rdma_netlink.h     |  1 -
 3 files changed, 18 deletions(-)

diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
index a4014a230639..8b5b9bfb1345 100644
--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -51,7 +51,6 @@
  * a controlled QKEY.
  */
 static bool privileged_qkey;
-static DEFINE_MUTEX(nldev_dellink_mutex);
 
 typedef int (*res_fill_func_t)(struct sk_buff*, bool,
 			       struct rdma_restrack_entry*, uint32_t);
@@ -1885,20 +1884,6 @@ static int nldev_dellink(struct sk_buff *skb, struct nlmsghdr *nlh,
 		return -EINVAL;
 	}
 
-	/*
-	 * This path is triggered by the 'rdma link delete' administrative command.
-	 * For Soft-RoCE (RXE), we ensure that transport sockets are closed here.
-	 * Note: iWARP driver does not implement .dellink, so this logic is
-	 * implicitly scoped to the driver supporting dynamic link deletion like RXE.
-	 */
-	if (device->link_ops && device->link_ops->dellink) {
-		mutex_lock(&nldev_dellink_mutex);
-		err = device->link_ops->dellink(device);
-		mutex_unlock(&nldev_dellink_mutex);
-		if (err)
-			return err;
-	}
-
 	ib_unregister_device_and_put(device);
 	return 0;
 }
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index cb3b6163961b..4930def66c70 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -3034,8 +3034,6 @@ struct ib_device {
 	struct completion unreg_completion;
 	struct work_struct unregistration_work;
 
-	const struct rdma_link_ops *link_ops;
-
 	/* Protects compat_devs xarray modifications */
 	struct mutex compat_devs_mutex;
 	/* Maintains compat devices for each net namespace */
diff --git a/include/rdma/rdma_netlink.h b/include/rdma/rdma_netlink.h
index 2fd1358ea57d..d1a7186f7436 100644
--- a/include/rdma/rdma_netlink.h
+++ b/include/rdma/rdma_netlink.h
@@ -127,7 +127,6 @@ struct rdma_link_ops {
 	struct list_head list;
 	const char *type;
 	int (*newlink)(const char *ibdev_name, struct net_device *ndev);
-	int (*dellink)(struct ib_device *dev);
 };
 
 void rdma_link_register(struct rdma_link_ops *ops);
-- 
2.53.0

