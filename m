Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171911;
	b=3oVLlf5JsSU1TmoPddRLoMu93xeAkk3DnJRCTq5rXL3y2LVMRmIoYcLc005xfnXIK3aS
	 D2J/SL+ur9lQ1iqW9DvfT8+3nC3GKiuSv7il4uzf03otEd/h2YlBVir96rCAWXtujL5gF
	 4Yd3Uk2fLEY7crI//CydU7sfg6w54n0zUza4J1syy93vmGwhhi2ohZaadVbrTId7zHb9z
	 Bxf3TkEI4BO4MiddNPHdcUiBXvNrdOzZ6WaXd6C0mnLI1l/wIP/HRykkjvsiMD8WiTLLy
	 X1oBOEDCPqfRctjFq+7wIDsYMMs4ceDodI8OHV+Lq4U0E1B/ULkIY7rhT46QVLSbEXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q9i7tR5s9CUBGsXLKzIqatReW7kAHiPt/K2J7j8OS20=;
	b=l82WKmb4HBnXag+cE9hzkE/rmctOlK8mCcsNCNDwOLCDSxiko9FogNkE7Uuc+Y9lL5Ix
	 4TIl5z8FiHD5torzibXz/uFdgYTz2POVyraK2QU1r2F8ope69pULZkLWlUpEfhOxndxvP
	 jJsS18/eKdD8ZqAhuKEfgcaFp0R/HmJndxjSx35PmlEO640tOH9QFH1I7ch5G3eDDYxdB
	 gcYu0J8utTEGIMoYjN6FL38auNRdaQdRKlU9Kt1D9+GYClZl5+qSZQjPe+ET5qL3D+6qZ
	 LiqqsnNolL1bsuyChjzZocZVGpsilTRr8qheebrHtGF7vi5noofkPIlBuhqtWrrHkVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+9YVNPC;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB20606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+9YVNPC
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so675476eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171910; x=1794776710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q9i7tR5s9CUBGsXLKzIqatReW7kAHiPt/K2J7j8OS20=;
        b=D+9YVNPCPU7fVRI5wlhs7CRsnvOYIwUkXjPyMHMNPIcYTxLSECBA0pFVV9zJ7GZIcX
         DcIdnNRps4BV4VtATk7aQkZLcrRKdgpzSm988uxOO7+8BPqwdV0e2EZGH6jvlHhgW6Ut
         s9wqRQGHgwsaD4sV84oYlhAnSsMMbqbect2bECo/ZKH0LApMIIfTL5ER8/v2FaJ5j9po
         1/bA6PxjJ3b3c1OpWRsyV4/aXYFc7kJqGAfrcbmYViawlQzaZQUz5kSqoqQpHQfQsv+M
         +5DOGGzAHlqVkjuUR4VpJn3AdcIleD2E59h8JO1+dEuyRUeLG9zDF7Vj9it/jMD/Mvph
         fYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171910; x=1794776710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9i7tR5s9CUBGsXLKzIqatReW7kAHiPt/K2J7j8OS20=;
        b=K/lwtsrKe5Rb5mAUwYY+lMcXnweRHirOTnsP+6VBzb4RzBvjeP1Nzs43aQcJYHQyr1
         7I637E32wSzV3C5smEzNMJpBNufBnMKRI7vYsSgKFjbAh2h1RDadjFDEWdkeik6rDqhf
         IA2JYsVsSju6zFwAMyVISQUoSSpu0h3GoHuzV52KoktKVja6Gfos37aEj6Y1+YOVzict
         BPwRHv3ZWr4d6Qd9JydZxgPtqCczbf3MjrDw6IJBQCbzgjkf8k69MoJAQKBcGhRCQJjh
         X8fAXeV2gdkky3Y/tzMU2Una0SFr0NPLM43sGZwptGLanC2qucexJ7vEaHGHsh8z3xAC
         w6qw==
X-Forwarded-Encrypted: i=1; AL+hErHTGtBfG4iUZsW81xU813lxzVNGqZBGp1CWY7v/2O3AbqxYbsR70qk9VcVc1n/8Mb2nweL6u9frNk78aiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UW8r/Tcgh7nLr7ljll3ymMO/J6u+GS7MTEpKKcFmE6r5J/BKO
	EFEIEJf9mt0dgy83A0jLG3L+3XyKNZnVR6Boi0T+G/jSnYC5gF82Fva4
X-Gm-Gg: AYBFou2GbcIifCw4MqUUuFqieLjKlq3Q/sNTzRE49725ys2lLQ4l0zmLdov5BtHACJN
	CVleZBgflp3CFqx0mf/MAm2HLnJZTP9ebuKpAKBCYR16glVELUrCb5hmzEP9JHz2mlxxDN0i5fv
	rxD2oBRINXL3Vt7z1RoxlnmwPQ4yqrz3xSHJ5l1xs/q94X9ulA4hQ6ivRGVOEkSBiMBdjin0R/x
	UltlU4nrCeeRqJJNIRQyuXAeKxzMMMDsZTjmWzoo5iNGBXx2uL3pDe3+YNoilUVInLMYdjb1t9E
	xLpzjtMTuKloyzfHFtWq7j7lWNDXfxqOVHkae/rIvSkTTotdj8NkSiUOKcWYz7ZzpH3E8YKBsxV
	6MWOl/y63VvVB3dDVvfbxyxryPHN4UNy/X0IkZbvzXg0yEUac4G7s0Q6iW0E3fXswTK1mmC1RNO
	1vW8sRo+u8N4P4O2W0J2JwXRtGn+5wm6WKfRdTXkoAXczh6/CZm7NbuTdN9GnnIVKA9EEAjnimG
	ZKPrdxJTYzOnO91pyTU7PaV+LR3qOfkRSmqsPZY4ZJfqnS2pyZF62qFfcls4Yn8qjjbdrF0WLWO
	z9x3i1n28xxvvdMg8fgQDhIZB0RGnzEb1dAQIg==
X-Received: by 2002:a05:693c:69da:b0:368:2548:c08b with SMTP id 5a478bee46e88-372569033d2mr4333877eec.21.1794171910458;
        Sun, 08 Nov 2026 13:05:10 -0800 (PST)
Received: from user.. ([2405:201:c052:b00b:a46f:2762:f97e:59a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372656187f8sm6963475eec.5.2026.11.08.13.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:05:09 -0800 (PST)
From: pavankumaryalagada@gmail.com
To: trondmy@kernel.org,
	anna@kernel.org
Cc: skinsbursky@parallels.com,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com
Subject: [PATCH] NFS: Destroy callback transports on initialization failure
Date: Mon,  9 Nov 2026 02:34:52 +0530
Message-ID: <20261108210452.84550-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

During NFSv4 callback initialization, the IPv4 listener is created
successfully, but the IPv6 listener fails to start. The error path
returns without cleaning up the IPv4 listener. As a result, the
transport remains attached to serv->sv_permsocks, causing svc_destroy()
to trigger a warning.

Call svc_xprt_destroy_all() when IPv6 listener creation fails to
close any transports that were already created. This ensures all
transports are cleaned up before the service is destroyed.

Reported-by: syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6aee17c4.8be4ead1.3b45e1.0199.GAE@google.com/T/
Fixes: c946556b8749 ("NFS: move per-net callback thread initialization to nfs_callback_up_net()")
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
Note: Tested by syzbot using the reproducer. The kernel built successfully,
and the original WARNING was no longer reproduced.
---
 fs/nfs/callback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/callback.c b/fs/nfs/callback.c
index bc282b744f34..29134e2c56cd 100644
--- a/fs/nfs/callback.c
+++ b/fs/nfs/callback.c
@@ -61,9 +61,11 @@ static int nfs4_callback_up_net(struct svc_serv *serv, struct net *net)
 		dprintk("NFS: Callback listener port = %u (af %u, net %x)\n",
 			nn->nfs_callback_tcpport6, PF_INET6, net->ns.inum);
 	} else if (ret != -EAFNOSUPPORT)
-		goto out_err;
+		goto out_destroy_xprts;
 	return 0;
 
+out_destroy_xprts:
+	svc_xprt_destroy_all(serv, net, false);
 out_err:
 	return (ret) ? ret : -ENOMEM;
 }
-- 
2.43.0

