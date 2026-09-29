Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF83DAAA9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701501; cv=none; b=gOJ4jq721v0eYmn7GajRAWCR3W+09f8mpfdKRDjZvbeV5aJYkluk0hZQG1V43a/G6TwxVgEecK/THHTWUuqIfi2mFZK6isnehdSPSozTUCztK3I/LJr6n0nypE9dOYDZIj7ZyNznhmnMvKJTId9ig07MMM1TMeIsibARk6UZNbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701501; c=relaxed/simple;
	bh=lSKhCVe2e9y67BQZBB8N5b0lo4u2NoSTarkPLG+MNOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tf57fU15rxeVx0P8xAbL6EVvtiqH6rmS2BjRyj3tfRe3Q+KAN5v9hlhwbtZU5j82E5yZ6RreJiqoq/bJFjLJBj721zjiG3OARFxdImlhHkyYoj/Sv8Xs4QX31h+Mi9p17WA6zzYUt5c/jzra4Q/6MKYkhgrGvARu2wT+ELErx/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndru4r+4; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndru4r+4"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so3196580f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790701498; x=1791306298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYlY+0VQmviH8AJ9O1JXprZTbqCcvurlza+Wbwy3a28=;
        b=ndru4r+45UlLvkt9Jo7mAfA/iJ8v4WnZjZ2imhAPMsweaAyPPZ86ESzXx/y/VZ/SZf
         eohcQnK1yuWRO7NqWW3sDAXmXDbXSTDfc0/RUjgIz/ZLRRawGplibykllKekjkniJQVJ
         jqkUe7DBa0wJNANEvipMCBx0kHIJ3FCTtPjFzeilJVc5sJ3HQDUnvyQmIv9C2nRbgb61
         wTqXFKnPPq+GIdJAHbQA02EeGfsJLQ95Ar+iMTG3QHl6FRWYivG59GP3LNY+o2WVlHEI
         3dJRcUONzTPSGEocddVslU2FhQgobnlJBn9TBtQRgFG2pECH3tT6VYBFIJI4i3HEIPpu
         VhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701498; x=1791306298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYlY+0VQmviH8AJ9O1JXprZTbqCcvurlza+Wbwy3a28=;
        b=2Su5eiJiIWC7+TdcJWjDhA6BUp+JCGRPJaZrIqwnUg+q74nbDE+PP8UicPiUwJmr2I
         EYIYy/EyxvOnbl7GcAGj+Fi1zPG69G/04Xw9SY3kl27AXveCLuUEgpoR5qfs+9TCfl3i
         ZM7gZPSwl5VxyZyJZRgD1+k+BJ36lsy0BICR/Y8ztClHOsIf8o6M65ggqeOgSuU6Epkc
         ZrWJY02agPTEM3j1rPXSers40LFWTktezEdaBryf33MSwcxAmaI8S8aupjK4qyS+7/E6
         B6W7XHdcJQfx2lcflIZKAyhTvzy0PY0fHNsKCwZYRtw1WMVfXTm1FeDly6pdot1jrfjR
         aMLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7UnNjL8jiqUZx7DwObWwvhYhsGI4i0AroAPFIP5Y9wJLjIYahg5TF+17do/+TayJfpLphwxFsyMsTD6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVCmZcypGh1GgjFjqnP4A0Dqv30Cvf5mBNcUg/Zjy6rzQpiGDJ
	chlb+WxfuL3HHRcJNFeBDELIYReeJoCkl2Ic+A7JlzMrp+ALs204NVnh
X-Gm-Gg: AYBFou1uUwBHHhthqtgOT9ltxrc0I4L4cSOVRCCwkV013zkbopeHoF1qmgX9p/kHP5v
	CkZ90GmeO61uAJonYlWAyj9aYkav5ho9mJnr5r0r4YJVtIVshbkALKahImSwaLD/BczaCCms7UG
	wz+Rm0fGzSEHC99+kyMAAKlPNWloe8Gjr24DkHaBKJOOVZBree6Ls4Tz+v5xpTKnKGxojhicoJm
	j8pd4WpbYHQ6MB4QCz3I4NJ0v2Gad7wjQDy10APwnFi4qcj7ordGGVVJqGH6jykZwxhWAjqsQB2
	KO9158VHnU3JlAN26ARRaEwwRMtZD6OrqnohsQ8But9LXNPwslP7XuMfngkFMpz5YF/ZF0aujG2
	nt7AyzAjDgKxSoiSE9ISD56wZifYy06ecdtoKbfANSoQ4urqZgZoKea4odnZM7fwZRkGn6Rakhc
	H2T2/DGJRp3TFrSIbiB8ku/UnmcIBkAeqlatqtzXj8mYjNg/J4cxARMDIsHmHfPtWCDukptEkDh
	6NcTmS2nLud+hIltb25SDkNpvtlaWkeqmwOnRO1VMkDLqaFXL1SLBQ=
X-Received: by 2002:a05:6000:2204:b0:487:27f6:a4e5 with SMTP id ffacd0b85a97d-488716bd7ecmr33864013f8f.53.1790701498062;
        Tue, 29 Sep 2026 10:04:58 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe698525sm3243f8f.20.2026.09.29.10.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:04:56 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] rtnetlink: wait for RCU readers in rtnl_link_unregister()
Date: Tue, 29 Sep 2026 19:04:42 +0200
Message-ID: <20260929170444.218093-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtnl_link_ops_get() finds ops on link_ops under rcu_read_lock() and only
then takes ops->srcu. rtnl_link_unregister() unlinks ops, then calls
synchronize_srcu() and cleanup_srcu_struct() without first waiting for
RCU readers. A reader that found ops before list_del_rcu() and has not yet
taken ops->srcu is not waited for.

Such a reader then locks a cleaned-up srcu_struct and keeps using ops
after the module that owns it is gone. rtnl_newlink() and
rtnl_dump_ifinfo() both look up ops without RTNL, the latter for any
user that dumps links filtered by kind.

With delays added between the lookup and srcu_read_lock() in
rtnl_link_ops_get(), and before rtnl_link_ops_put() in
rtnl_dump_ifinfo(), running "ip link show type dummy" alongside
"rmmod dummy" on a KASAN kernel gives:

  BUG: KASAN: vmalloc-out-of-bounds in __srcu_read_unlock+0x57/0x70
  Read of size 8 at addr ffffffffc02ff318 by task ip/147
  Call Trace:
   __srcu_read_unlock+0x57/0x70
   rtnl_dump_ifinfo.cold+0x30/0x3b
   rtnl_dumpit+0x7a/0x1b0
   netlink_dump+0x486/0x11b0
   __netlink_dump_start+0x661/0x910
   rtnetlink_rcv_msg+0x611/0x9e0
   netlink_rcv_skb+0x126/0x380
   netlink_unicast+0x605/0x830
   netlink_sendmsg+0x6d0/0xbb0
   __sys_sendto+0x335/0x3a0

Call synchronize_rcu() before synchronize_srcu(), as
rtnl_af_unregister() already does. This should be enough because
rtnl_link_ops_get() is the only RCU walker of link_ops, and it takes
ops->srcu before rcu_read_unlock(), so every reader that found ops is
covered by synchronize_srcu() once the RCU grace period ends. The extra
grace period only costs time at module unload.

Readers and the writer were serialized by RTNL until link_ops got its
own mutex, which is why the missing RCU wait did not matter before.

Fixes: 6b57ff21a310 ("rtnetlink: Protect link_ops by mutex.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 net/core/rtnetlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index be9d1625bac31..abcd2c4ea2178 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -707,6 +707,7 @@ void rtnl_link_unregister(struct rtnl_link_ops *ops)
 	list_del_rcu(&ops->list);
 	mutex_unlock(&link_ops_mutex);
 
+	synchronize_rcu();
 	synchronize_srcu(&ops->srcu);
 	cleanup_srcu_struct(&ops->srcu);
 

base-commit: 54518e0e827f4ca9229ae657022c60bf60f5c1bf
-- 
2.53.0

