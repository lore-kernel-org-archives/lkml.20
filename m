Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417347;
	b=FuCPbXP3hiwQ176HiDoiiiBV7Ir+1Ww0P25qjby0aaa7YFlZbcKwqRiHzm9TQZDHPOOq
	 N9iWux4tbNN5OFaUb35EPXXkrmxHluO+eDQSG+EGdIQfdFj0IJkHwkIc3CuUMCzOMELQI
	 czAY4Oli8jz0H3XFtsIZcq5qXEt88hSB3qiVGPLG3XvV8R5GY9xED6CnvwhO5lN2r+80K
	 6VUuOAuJPWWRxz65KyDt19RuzzDr5dYnZu45QTHy87IswuCFwc+XwuxufniSkiRA2RqN2
	 ZXGEdx7ICYD4h4r0oxW6V78YOTReNYjC8PjOMqQcn7D3dOwvj9ALDGWaUGO6oHgvlgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VOq7ZgXUCXWxUh5Tbv14sjkPSXL9OgmAdnHY1/BKfeE=;
	b=rhFwWjnSwSuKWLAIKXqtja9/jyuKJtGsb+tS8rL3dVXBT+i+C7Mw8lByVkEDivssP9tJ
	 yYmGqYm6qv/HvkEUZOIURKpufD5wu99PkCTtVoWhmfB1rFB9j97/xd3n190s/ls3Mqv01
	 kv1R3y9VuHJcCOVMFne2RCkNXuS+miyh5mxWknWnzNgFpNiMK+MLuywUpfLCw9k++QSti
	 sZHcuRRUxP8H/xjJUQDUAYwVfOG0+lr0MM1WEJHbeER4cd3PYRASq8Pz3mzyo3D7I75gZ
	 dm4cIMP/GlY0dCRidQHo0kRFMggZOfQrLC9AECcV9wC0Z3zVjfpwt/KEZ5nwQhscbWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0Nwc50X;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0C2606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0Nwc50X
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e987b4a710so13525085ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417346; x=1794022146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOq7ZgXUCXWxUh5Tbv14sjkPSXL9OgmAdnHY1/BKfeE=;
        b=s0Nwc50X8TuoMH3sQVIthhvnvDSYX/A99zFYV4ARkAP/govku/xTJxlFZE5SrI1xgZ
         Le013SMoPW0IDL+liS9OH75Xu4ALVIxsFRF0YLLIk7L9skI1u/0SGZe2aJ6g11dzoZnM
         mWhKHzFZMtpluBP1IBPYYFMMvLUDxUn1PPEy97Zf/tUhQtsDqoNALLfTPBLVlGVoJ6px
         D7xdUT+V/sw64nXuBmZ9ZWtTpEwNDP2VnBkED99mWMSxamrZ7CXoJqGZRfLW73NL6Rwf
         Qtx/IfuEMx1ZzMRyeUKdaf9fGhcEeRlxvzf9WqchM/dNrTReWClerAte2h2YYhSkvmQw
         Pb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417346; x=1794022146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOq7ZgXUCXWxUh5Tbv14sjkPSXL9OgmAdnHY1/BKfeE=;
        b=2ysY6nmFsOqo42oMLk/8jub6xPS2Jfnwj9xYWzPC+AP1yhdZcFVCfu1xx+0G9dkqAw
         NiTIXPOb4CWwvVhz4XosD+Hr89QH4BK98Tk6qaUiw3yiUssmdN4OGGH++mA+yKYbOZYc
         VZGw/gdmUt/dcvZG0c6r6mBzrrOwzDkY7KBkIc0vfgYntoFiXzBEGMOuvta6HGqLJOLC
         fP7wKsLMGIw06OkMgklhsrJ9WjnSkRSyPSn0lOTbir0bgfonfKh+JhPlTVQyrfk6UunF
         +WhmlvecH5Yrs1lgMH6m7YTggl5NphpGIADg+VfrnhgnAo/8ebxUbklAMeh6XDaErgT3
         F0Xg==
X-Forwarded-Encrypted: i=1; AKwUvBx1fOd+RNBlHi7tYdyVyj2DR3jbFwW9SAx1BR+UG9A8LMP2r551Y/PaY9S+zfP79oCZKyu9t/cDkZLf6wI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO6AzeWiTu3XLzTh9l2cZsovru+XPcIYnLOFmQU0M0PGg9pZHZ
	ytWBeQ29fE9RNXFDQLSIfiqYxtDsiwrzz/7mfgM80WQPvlwDz48GCFeo
X-Gm-Gg: AYBFou2r/JMDtTodekHHxalKYGlJv4+a2PN0vaTdxANezPHKpGWqftDiVIUIF/M55IS
	R53qPLLYGdnSW/JImn+M/ER+TqrSjpZIInX+C+p6jDeFpMBkLznmfqW8uoRjnkMQ9oUsaUB810P
	RMj2py7TSuBX2u7e+71+kCpx0iy0FZhMXLRv79XQMPmdq5HtydTnqUOdEQM3Ci8BFNKLzVIBALF
	j1LcG45ZjW6WzrU96JancRlBdkowKGzbpVz9hwZR/b4P/SiDrn0zEMy5RoQJ4AwwIedi5GdW9P8
	5WCboJ0JYDvlHp/EUrTROEtqbZbucr8OXknjSOUaDQYCP5pi0MsH8eqiFkGX/iwljnDmu/Z/P9M
	HN2u3YbYfLYOQu7KRzJn2SJszTL7DXjFShWzGMTwY33WXjiS5KpxEYxQLkO4h42CbHKW0AvSP+h
	AQphiGSFWkFDLXaFP6CyezOfxlDBTO+gtZIK/W5kj58BS0ZBJSwnq9znBgxDqXrkF+PE+yyJHoD
	3PttiC+sOV1dSmR/u9Z3lRZ00YF36Ia/SaQau1l73fnrbUwWk1ATWZ1aAUxONHP2+t76BEAjB9B
	IaLA7ktGHtqjTQjlhE3zNGIckIxbiLtwv4zhvWIm4tJDPQ==
X-Received: by 2002:a17:90b:564e:b0:3ab:b764:8256 with SMTP id 98e67ed59e1d1-3ae897276a1mr2527847a91.17.1793417346367;
        Fri, 30 Oct 2026 20:29:06 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87ee7765sm3212773a91.2.2026.10.30.20.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:29:06 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	antony.antony@secunet.com,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH ipsec v2 2/2] xfrm: use cached offload ifindex when migrating an SA
Date: Sat, 31 Oct 2026 11:28:49 +0800
Message-Id: <pm-xfrm-core-objects-candidate-0050-v4-3c6b8c5369a802e9be0e-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-xfrm-core-objects-candidate-0050-v4-3c6b8c5369a802e9be0e-0@gmail.com>
References: <pm-xfrm-core-objects-candidate-0050-v4-3c6b8c5369a802e9be0e-0@gmail.com>
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

An xfrm_state reference keeps its offload record alive, but does not
prevent xfrm_dev_state_free() from clearing xso.dev and dropping the
device reference. xfrm_do_migrate_state() checks xso.dev before
xso_to_xuo() dereferences it to obtain the offload ifindex.

With XFRM offload and migration enabled, XFRM_MSG_MIGRATE_STATE inherits
the old SA's offload configuration if the request omits
XFRMA_OFFLOAD_DEV and does not set XFRM_MIGRATE_STATE_CLEAR_OFFLOAD.
Device unregister can flush that SA between the check and the read.
The supplied report used a scheduling probe to delay migration in this
interval while in-tree netdevsim was removed through sysfs.

    Migration (xfrm_cfg_mutex)       Device unregister (RTNL)
    xfrm_state_lookup(): hold x
    test x->xso.dev != NULL
                                    xfrm_dev_state_flush()
                                      xfrm_state_delete(x)
                                      xfrm_dev_state_free(x)
                                        xso->dev = NULL
                                        netdev_put(dev)
    xso_to_xuo(&x->xso, &xuo)
      xso->dev->ifindex: NULL deref

The netlink configuration mutex does not serialize with the notifier,
and migration takes the state lock only after this read. The result is
a NULL pointer dereference even though migration still holds the SA.

Use the ifindex cached in the offload record at attachment, as state
dumps already do. The SA reference protects this snapshot throughout
the read, so serialization no longer depends on the device lifetime.
Annotate the binding check with READ_ONCE() to match the concurrent
WRITE_ONCE() in xfrm_dev_state_free().

Oops report as below:

    Oops: general protection fault, probably for non-canonical address
    0xdffffc000000001c: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x00000000000000e0-0x00000000000000e7]
    RIP: 0010:xfrm_do_migrate_state+0x1f06/0x2c50
    Call Trace:
     <TASK>
     xfrm_user_rcv_msg+0x3b3/0xc20
     netlink_rcv_skb+0x133/0x390
     xfrm_netlink_rcv+0x76/0x90
     netlink_unicast+0x504/0x840
     netlink_sendmsg+0x7f7/0xcf0
     __sys_sendto+0x425/0x470
     __x64_sys_sendto+0xe5/0x1c0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
     </TASK>

Fixes: a9d155ea9b44 ("xfrm: add XFRM_MSG_MIGRATE_STATE for single SA migration")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Assisted-by: LLM

 net/xfrm/xfrm_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 781d4ec565aa..1cea24380797 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -1240,7 +1240,7 @@ static void xso_to_xuo_ifindex(const struct xfrm_dev_offload *xso, int ifindex,
 static void xso_to_xuo(const struct xfrm_dev_offload *xso,
 		       struct xfrm_user_offload *xuo)
 {
-	xso_to_xuo_ifindex(xso, xso->dev->ifindex, xuo);
+	xso_to_xuo_ifindex(xso, READ_ONCE(xso->ifindex), xuo);
 }
 #endif
 
@@ -3462,7 +3462,7 @@ static int xfrm_do_migrate_state(struct sk_buff *skb, struct nlmsghdr *nlh,
 	} else {
 		bool inherit_offload = !(um->flags & XFRM_MIGRATE_STATE_CLEAR_OFFLOAD);
 
-		if (inherit_offload && x->xso.dev) {
+		if (inherit_offload && READ_ONCE(x->xso.dev)) {
 			xso_to_xuo(&x->xso, &xuo);
 			m.xuo = &xuo;
 		}
