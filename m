Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B495533D6CA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608440; cv=none; b=ZY7eLYx2MbN+IHenGwG+k9tz+Wwlef7uYdrjayt+nwMM4QMpEp9fSSLJuTr8w+0rxhL94xqcLt12qwj7V7H+wK3Wg5eqQ5hSClXVUMfqB5jOuVBebWob8m9SfMGEARyE3LUNbGpIVcmbJpoQelkCSSPvFCCWF4iIv9G99VEbfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608440; c=relaxed/simple;
	bh=kIm9OghPV6mG9UBRlIV2nG9TkE+Hr/yUFD/oQxbpq5M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ktTINm6b8xG3dCq4SWJFP3uN/iNKcuAtbhR2u4Fj+DoL5ZiPKe1zmBc/kFnEUN7WA4CsPBpadyeV9MZ8M0hzm+1uBDRjsx0IBKMp63U8sW8dWUjAzn17qyKSUHLtZzwBCvaXjpM42FOuWaL8YzgVgGZC/X67z/TQBL0s7ADmHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451d80641efso355765fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608437; x=1790213237;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NdSPuE381k4FlDjPbHybT93tlsDNiovETNZ/KVHbD2c=;
        b=g1Y5h5w6tm/nhtcPvIEPexa/oyL7313RqkizQgMpONjvCaT+B0JfKU6k7IZFn0dXmi
         pmrCAKflz+6ne04k3xNMpEmVEth/8HYltnZxywYLTgo4rvBhZ5ygtZ4y4PmwP56iJfCt
         sWmqrU5Gt76aDRt52Z5Wo76l0BCx9aXZwHrSuuF3rSplanevLQSGauetT3muilR+YDve
         thuVTAOiqqcqMLD48Xw+cc2lBZsVwaIQK1VysgUtbTRjIB2/4+tJrkSIftAsohGr5B6O
         Nhp9dS3M7lMK97GD/KEiwu0N65+PbpmB2/YaVPCIGfbdjk5uluIDHqTE6DqXc8fynMr5
         7Q4Q==
X-Gm-Message-State: AFuF++myUd55FXnbPNuXyooroPdI06nASqxZ3pFigQM8oS6j8OgYDkzG
	Py2qs78aHNcNJ29C8va8Zeex8OK/0Q04ydojw3xXZIty7i0appkH1GOuBzH8mp/hl0ntF/HjqPN
	qa2XitszWRGWrQFLupmenCq3u5droMpToLYMwRmaiko7rDRjY2bwlPU5AdJo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81d8:b0:6bd:f333:7b83 with SMTP id
 006d021491bc7-6c7d1bc845amr4864441eaf.16.1789608437674; Wed, 16 Sep 2026
 18:27:17 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:27:17 -0700
In-Reply-To: <6a9ef807.2bb5a69c.24b23c.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab41f5.87c06881.1db2b3.0003.GAE@google.com>
Subject: Forwarded: [PATCH] KASAN: vmalloc-out-of-bounds Read in rpc_queue_upcall
From: syzbot <syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] KASAN: vmalloc-out-of-bounds Read in rpc_queue_upcall
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com

diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
index d513971fb..90abdea16 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -647,6 +647,7 @@ struct cld_upcall {
 	struct list_head	 cu_list;
 	struct cld_net		*cu_net;
 	struct completion	 cu_done;
+	struct completion	 cu_msg_done;
 	union {
 		struct cld_msg_hdr	 cu_hdr;
 		struct cld_msg		 cu_msg;
@@ -671,6 +672,13 @@ __cld_pipe_upcall(struct rpc_pipe *pipe, void *cmsg, struct nfsd_net *nn)
 	}
 
 	wait_for_completion(&cup->cu_done);
+	/*
+	 * A downcall can be received before userspace reads the upcall.  Wait
+	 * for cld_pipe_destroy_msg() to signal that @msg has been removed from
+	 * the rpc_pipe, so the on-stack message is not left linked in the pipe
+	 * after this function returns.
+	 */
+	wait_for_completion(&cup->cu_msg_done);
 
 	if (msg.errno < 0)
 		ret = msg.errno;
@@ -839,10 +847,15 @@ cld_pipe_destroy_msg(struct rpc_pipe_msg *msg)
 						 cu_u.cu_msg);
 
 	/* errno >= 0 means we got a downcall */
-	if (msg->errno >= 0)
-		return;
+	if (msg->errno < 0)
+		complete(&cup->cu_done);
 
-	complete(&cup->cu_done);
+	/*
+	 * Signal __cld_pipe_upcall() that @msg is no longer queued.  This is
+	 * needed even when the downcall arrived first, otherwise the caller
+	 * could return with the on-stack message still linked in the pipe.
+	 */
+	complete(&cup->cu_msg_done);
 }
 
 static const struct rpc_pipe_ops cld_upcall_ops = {
@@ -979,6 +992,7 @@ alloc_cld_upcall(struct nfsd_net *nn)
 		}
 	}
 	init_completion(&new->cu_done);
+	init_completion(&new->cu_msg_done);
 	new->cu_u.cu_msg.cm_vers = nn->client_tracking_ops->version;
 	put_unaligned(cn->cn_xid++, &new->cu_u.cu_msg.cm_xid);
 	new->cu_net = cn;
