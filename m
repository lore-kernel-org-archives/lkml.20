Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521042;
	b=icASeMcAC9Bdlb+J4bDS0lpD0crs1VajOE9jWgaqMOheVhpoBZqv34gavp6lJwyESUwI
	 OuATd/ZLzrE249Ro8Dwbki9GU5CGNFu5Dduee+cLzzz8hieCVArNAYITKyv8NXHikeQeU
	 dpdZYWsdj8pdAONsURwBahcXJKQ/XQ2kcf2u7w7KLsLtPCuntbraBDxg//4JrHoLOLhnk
	 qpvm0vkEUeGSytk1fEb9e626MxKS24nEqisXoOBJVObuz/OJ8R07Hcvvb4p40J86ov4kd
	 RvBrjM3p2aiScEJikikWlrgzX+LDpjn7KwqakiDcSPIGu0h/rTt/q53sjfz2VoiqDCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521042;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=j+5ABTbGPPOaU3igJu6SEBsEIoe2AYDDz80XUCD6TuQ=;
	b=2//LykWpvh2sDBhcB1zJ5mgsFei7ycDA4DUUenfx+4HxI8RAMuxyi6IrmV362ZD8yJU/
	 13JzhkYAD1pHYr3IbLK3DMB7XN8ZY3eAuO3tmqAtH8fYCbxsh86if1nfP+j1rAwaez/M4
	 oiFp2jsXBThx1B2sxaKaU6wmvB/rjJZh3kWdenc9l5pPBboglDdSoZ8LJ6lf8YZsnNDsx
	 wCEaA8BjC6ST829abR98ijcZpSSiqNwChC6SAPcmbwsg9oAXkf1B7y7ATNnvNkCt9OyY5
	 nXL5ZtoSnn+mLGUSS75gM2Oun8BnwyAn2ujemd77JuztBuLbXgtUKJJ34XAA6/xhUug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990B7606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 990B7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so3195704b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793521040; x=1794125840;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j+5ABTbGPPOaU3igJu6SEBsEIoe2AYDDz80XUCD6TuQ=;
        b=Tr9Jurua+c+cI4XECSkfg56RP0MWnk6gpZ5XD/mLHGhdbckQYQBWCFQqiL3KW/Y6n0
         Y9ypBLxEue3DnwfzGchM/y48ITgeLMaUCJPadj11HxpUittsPm66wtKeIDqngAGwpDyD
         GKCXY0qHNSN9f4U7d0G6tOphgHCtKK6KwV+BeC3YwIo5eYq4iEM7orAJiZxtzjxoF+Xi
         Rz+kbN1RG1vGwuugniQM8MNogzLgUKHtKYct3XPAFA/AsNdDVhkRXJl6e96raInqh85L
         kqHSRl04TbsEYKG9IDQkUMgGr4bYghWDnTl0g/eU6BiJ8pepHj36JZqykwlfJ/TDsrMW
         f2LA==
X-Gm-Message-State: AFq9FYJv0CZpt7IZSvlGa8obR2olOwC4bYNeeryN/UN4p0RxUuo/X/dA
	mssmwuJIFreEsfFABaKcnOHX5Un3wYouLq0mZhqQKvbqoVcmNb2JUEW4ucwKZtr9xuzt3A8BC1e
	wrBKmZjV2xBO6/niODt65/KYTXpH2a7oybtP5I07mkmRHuGFS2PPOq71q/Po=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c124:b0:4fb:f1d7:932a with SMTP id
 5614622812f47-5640d91b370mr5202486b6e.3.1793521040612; Sun, 01 Nov 2026
 01:17:20 -0700 (PDT)
Date: Sun, 01 Nov 2026 01:17:20 -0700
In-Reply-To: <6ae6ceee.67782f90.13afb0.0053.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6f590.64e51036.15cf6a.0009.GAE@google.com>
Subject: Forwarded: [PATCH] RDMA/cma: Don't warn when device removal races
 with rdma_resolve_addr()
From: syzbot <syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] RDMA/cma: Don't warn when device removal races with rdma_resolve_addr()
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


rdma_resolve_addr() on an unbound ID (RDMA_CM_IDLE) first binds it with
cma_bind_addr() and then moves it from RDMA_CM_ADDR_BOUND to
RDMA_CM_ADDR_QUERY with a second cma_comp_exch(). These are two
separate steps. Once the ID is bound it is attached to the device, so
cma_send_device_removal_put() can find it and set RDMA_CM_DEVICE_REMOVAL
before the second step runs. The exchange then fails and hits the
WARN_ON() added by the commit below.

syzbot triggers this with RDS over rxe, where rds_connect_worker()
calls rdma_resolve_addr() while the rxe device is being deleted:

  WARNING: drivers/infiniband/core/cma.c:4120 at resolve_prepare_src
  Call Trace:
   rdma_resolve_addr
   rds_ib_conn_path_connect
   rds_connect_worker

This is a valid race and not a kernel bug. If removal wins before the
bind, cma_bind_addr() already fails and the error is returned to the
caller, and err_state in the same function already ignores a failed
state exchange. The caller gets -EINVAL, and RDS destroys the ID on any
error from rdma_resolve_addr(), so nothing is leaked.

Drop the WARN_ON() and keep returning -EINVAL, and document in a comment
that the state may change because of device removal.

Reported-by: syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6699995b421c8ec7d2fe
Fixes: 732d41c545bb ("RDMA/cma: Make the locking for automatic state transition more clear")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/infiniband/core/cma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 337a49d1acf7..46741c1fd34b 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -4117,8 +4117,8 @@ static int resolve_prepare_src(struct rdma_id_private *id_priv,
 		ret = cma_bind_addr(&id_priv->id, src_addr, dst_addr);
 		if (ret)
 			return ret;
-		if (WARN_ON(!cma_comp_exch(id_priv, RDMA_CM_ADDR_BOUND,
-					   RDMA_CM_ADDR_QUERY)))
+		if (!cma_comp_exch(id_priv, RDMA_CM_ADDR_BOUND,
+			           RDMA_CM_ADDR_QUERY))
 			return -EINVAL;
 
 	} else {
-- 
2.43.0

