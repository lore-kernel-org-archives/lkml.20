Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D7495ACE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463482; cv=none; b=u4GcZ7bQgZDSYejOKGqGv06UUplG3y/brldYCxa3I4DlbZAg8W6jN0Xblh+9wWozfsZCRB/5xCbgRPs0KdBWJc/TzCZ16PfZ1EgO7BOtAW0z2a7p2OdzzB7t0pszoZB0JNLxswfV7FDTIzcv9dCnzIce4TGwkn3YyRB4GoIyVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463482; c=relaxed/simple;
	bh=1wmo1JdXpHAEF33ghsK5ngwfDfCrfwSZJ8Lt5pDXSyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mKjUHmhObE1lIr6BpUfrMgYY6erPlXVxtB+tSM/rvzGx6c5POiJkqIstlgoZyBO0B2/LvGYkk6tE7LvZbtWiDiScqOE1+9Cg+TXkAA/YiRssTawtiro37XZVoypvdhNMDxBqHti0kc0M6v0BtwE8DhkyrN4lXMiScWsBPF13Lvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4Gd2NkD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4Gd2NkD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so37049285e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791463478; x=1792068278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=umbLSqkVyKq6IzM8iFkLDvRc9MitdtRPDOB4w8coJ8A=;
        b=Y4Gd2NkDvpVJOQVt7RmGJHtNHdEomMjbiWaY49XDBWX5hMpq3eeNxgIf6MflYhAo0o
         vD6Gd1zV5KxRjm+KH9+aa5RRePrc0wvHXhGUKGtLc2zrxk8FZUur8EZW7T5rE8aFn81V
         MmlSJUUfyVPzSgi+IvvRkiy0V0F5xvTRgt1P3UTLoM05WH+Tdq2VHPONODA57RrY/f10
         J8qc8Zjmqu5aWqBFn09dz+5Rl7LPwR17leezcjpl3uFdgFcPKYF058nEQt2NJB2Q+sUc
         B+HrT8dUea/WfKnSxQ1oRKho7O8KeoVohyV3pYFrUy4HSvH0M1VqEQSTmcrF/PLlB7JG
         xYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463478; x=1792068278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umbLSqkVyKq6IzM8iFkLDvRc9MitdtRPDOB4w8coJ8A=;
        b=e9mIr/SvVwLsjhQ501h265s6TQsDKVq87ZuDQpgQc2TLSovJe+OHfXHVRtRp8iFGvQ
         cHSBNvqf/WBMe3WtnxPfE/B1YxLFQ1Ephk7K/D1fvL+hLAwuhW73mO5rRY+eTiLkQsY6
         Njr+oSRrUtgcKVzkLvVkfB7HkGPxVTh4PZUvkygGlabHiR/rz5tKcj3cAEjSf+uhm4iV
         toqPdcwVYGoRxwmBHgONIpqJzz4uUa6DEtdSYD4SRRerMJ+B0WpsuXlBzq2V8VjUT/UJ
         hBFZTiRnl7YYEq8ziVKPB485jGoVcgLeRwoehPztgPLoj1lk0jbp60OTYYC8CxGg6R3Q
         nwuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU2d4hD2FCJcH5l0NhsUj5kAW59nrXcIBS2oI+7Vncr68zj+nE0kOZDz0SmqQH73fTGr6/+Swinzf5F7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nX6lZcTOQC9EUAKAk0wZTDJj3wbuSzcjdQgOihuxMC3FZMP2VD
	bP703MKSUUZSDb8JyRoz6LIU3pZs/lCOFjtrD/pHqBXF2NQgrFsm8e2C
X-Gm-Gg: AYBFou2qnTJMltIKNruiqcprFIe3m7W08FweXy4MDWov2ZmAWBcNrD7eoQ/tMEpEOOb
	vmCD+7+GXITsqraLzK7MJLaI6gAZSmAEcQ1xR4OFCg4igdUBtn2E33uy34v/zHN8eqK6+Kscy80
	PitbEX6mY942Dif9WycIv2pwGGZ/mjSXE+A0CD7WVqsKd0UrtP2Ega1jDfu7JzOIS8TiuxbhtN7
	XzE3xe8CVoc3kFocYPc892gNHemX3iC0qDUetzJw6RD1q02SkEhAcpF8GPVR6pKFwztJErAfeIp
	cWC3eWIcAMw8WgzYfbTXfp3IWBycZVthmObWZVIJF18Q6+ooNgKvUu3TuoxvYDO4BiNkTlRgx6L
	LSETrOvHc2XTSxmH3Zq1IMVD/vFlNSmOrQcybGWbYAz1Ar7FDov6Wgjke66tLwgu9cn0D22HBy5
	sy540yA6bxXvka+c9A7vZpVT94Lx10nRYSP2mP99CNYAdiZMD46n65cUG5UAZKsn3V7z1AVumvy
	nZni2gosW/cVUnVemvLru3U4lj6dCV2WYCcKnXYB8uw4phYUQyS7Wk=
X-Received: by 2002:a05:600d:848a:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a1825a5968mr52235585e9.32.1791463478037;
        Thu, 08 Oct 2026 05:44:38 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.41.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffd2sm10885399f8f.34.2026.10.08.05.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 05:44:37 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] rtnetlink: comment the RCU and SRCU waits in unregister paths
Date: Thu,  8 Oct 2026 14:44:22 +0200
Message-ID: <20261008124423.11543-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtnl_link_unregister(), rtnl_af_unregister() and rtnl_unregister_all()
wait for readers before tearing down what those readers use, but most
of these waits do not say which readers they are waiting for.

A missing wait is then easy to overlook: rtnl_link_unregister() lacked
its synchronize_rcu() until commit 3b70edea393d ("rtnetlink: wait for
RCU readers in rtnl_link_unregister()"). Add a comment to each wait
that lacks one, naming the readers it waits for.

Suggested-by: Eric Dumazet <edumazet@kernel.org>
Link: https://lore.kernel.org/CAL4WiioFMQN4troVjQjCmE6Z9kwwb95SnoEupjD=PPSK6Q5f6w@mail.gmail.com
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 net/core/rtnetlink.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 15bffafbf0a9c..80f8577816760 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -526,6 +526,9 @@ void rtnl_unregister_all(int protocol)
 	}
 	rtnl_unlock();
 
+	/* Wait for rtnl_get_link() callers under RCU that may still
+	 * dereference tab.
+	 */
 	synchronize_net();
 
 	kfree(tab);
@@ -711,6 +714,7 @@ void rtnl_link_unregister(struct rtnl_link_ops *ops)
 	 * not yet taken ops->srcu.
 	 */
 	synchronize_rcu();
+	/* Wait for rtnl_link_ops_get() callers to call rtnl_link_ops_put(). */
 	synchronize_srcu(&ops->srcu);
 	cleanup_srcu_struct(&ops->srcu);
 
@@ -843,7 +847,11 @@ void rtnl_af_unregister(struct rtnl_af_ops *ops)
 	list_del_rcu(&ops->list);
 	spin_unlock(&rtnl_af_ops_lock);
 
+	/* Wait for RCU walkers of rtnl_af_ops, including rtnl_af_lookup()
+	 * readers that found ops but have not yet taken ops->srcu.
+	 */
 	synchronize_rcu();
+	/* Wait for rtnl_af_lookup() callers to call rtnl_af_put(). */
 	synchronize_srcu(&ops->srcu);
 	cleanup_srcu_struct(&ops->srcu);
 }
-- 
2.53.0

