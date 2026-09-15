Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBA838D404
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436337; cv=none; b=PsmLa5HJkSIExwSxSNATe5upw2GYSCsFNCmaSFbbMZEWyx71o+mU7lMIOGEndSdRG4jdyBtyzGcTM52oxaYSbyTC9nfZcaNCngaC0DHqx958CVTLVMJHYZFVLJWMB9RTWWDoi8sMpclOe4yuK66xlYG1cd8zDwqScaBQ3/AsG0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436337; c=relaxed/simple;
	bh=1vn0DaY2kbKlbIp3EOrtHjmIeCf+jv7cawCduavprtY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cOXYpKacBjH5XU218ukkV7ibsqnDPtK/R+19Z/V6sdiSPCnB9VRtkk6kigJDbjLSAL1Rt1++s08O+MapEfDc2T/frbq8dNwdlAE48Wilg3rVEqoVNGLjHBxkn2mBpmJJpZpHaorxyqmriH4WDduPhMejpM15+2ZM8/TGb/fM6J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so3398357b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436335; x=1790041135;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tusnWiUTm3IaD21wDWg99kpT4MI1Q/oO+wLnMenXcZg=;
        b=SJyJENuM8/atFYVs9y6vFx+W7XKX+TqgwMeNsz8nti45LhHyYyO/UZcpigGMhD7ygS
         0B5BmtoIqNcrQiev7qItRg6vIoQLdlzryyLlLiDw5qONecHlZqCJZjTA1wPx0gts90Az
         BHOZ8h6JoGLL3V4euaUIKj4meTqB0roPXe6FJm9rqlsMSddrs/qU28jO3ywqdqHY82bF
         uUPGOsWdmyJc5JdtT4yKinSOxo9iaTuNLwvJgzmOY3vdwAhiffrV5Uhc9wwyiZmjw2uX
         zGaI1MCVqKwGH1KCP7axpH4jBV+on12OpOw7zd+dAvi0znOaSqOLIBT0lyeXg4k18upv
         JwVQ==
X-Gm-Message-State: AFuF++nhOjAAigShsfcK3oDFbz8Xb2EWiZj0mZ5w7gOTYGUsVTYJ2ZAA
	DXYXK74wRJJ2MOo1XV6CAbZteC9AjKp/Zg94+U70W4FoN95e+DRvfoxi9OE5pcj8mPytVu1BJVw
	APtqMb7d9joaTih3WsXQQKc+IMBbF5BQSidMqJ4B7gPcx5XanFco315bthf0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id
 006d021491bc7-6c53fe8437emr3080570eaf.24.1789436335101; Mon, 14 Sep 2026
 18:38:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:55 -0700
In-Reply-To: <6a9ef807.2bb5a69c.24b23c.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a1af.a211d2ce.1a5198.02a1.GAE@google.com>
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
index d513971fb..90d356e1f 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -647,6 +647,7 @@ struct cld_upcall {
 	struct list_head	 cu_list;
 	struct cld_net		*cu_net;
 	struct completion	 cu_done;
+	struct rpc_pipe_msg	 cu_msg;
 	union {
 		struct cld_msg_hdr	 cu_hdr;
 		struct cld_msg		 cu_msg;
@@ -658,22 +659,22 @@ static int
 __cld_pipe_upcall(struct rpc_pipe *pipe, void *cmsg, struct nfsd_net *nn)
 {
 	int ret;
-	struct rpc_pipe_msg msg;
 	struct cld_upcall *cup = container_of(cmsg, struct cld_upcall, cu_u);
+	struct rpc_pipe_msg *msg = &cup->cu_msg;
 
-	memset(&msg, 0, sizeof(msg));
-	msg.data = cmsg;
-	msg.len = nn->client_tracking_ops->msglen;
+	memset(msg, 0, sizeof(*msg));
+	msg->data = cmsg;
+	msg->len = nn->client_tracking_ops->msglen;
 
-	ret = rpc_queue_upcall(pipe, &msg);
+	ret = rpc_queue_upcall(pipe, msg);
 	if (ret < 0) {
 		goto out;
 	}
 
 	wait_for_completion(&cup->cu_done);
 
-	if (msg.errno < 0)
-		ret = msg.errno;
+	if (msg->errno < 0)
+		ret = msg->errno;
 out:
 	return ret;
 }
@@ -806,7 +807,14 @@ cld_pipe_downcall(struct file *filp, const char __user *src, size_t mlen)
 	cup = NULL;
 	spin_lock(&cn->cn_lock);
 	list_for_each_entry(tmp, &cn->cn_list, cu_list) {
-		if (get_unaligned(&tmp->cu_u.cu_hdr.cm_xid) == xid) {
+		/*
+		 * Only match upcalls that userspace has already read.
+		 * Otherwise the upcall's rpc_pipe_msg would still be queued
+		 * when the caller resumes and frees it, leaving a dangling
+		 * list entry that corrupts the next upcall queued here.
+		 */
+		if (get_unaligned(&tmp->cu_u.cu_hdr.cm_xid) == xid &&
+		    rpc_msg_is_inflight(&tmp->cu_msg)) {
 			cup = tmp;
 			if (status != -EINPROGRESS)
 				list_del_init(&cup->cu_list);
@@ -834,9 +842,7 @@ cld_pipe_downcall(struct file *filp, const char __user *src, size_t mlen)
 static void
 cld_pipe_destroy_msg(struct rpc_pipe_msg *msg)
 {
-	struct cld_msg *cmsg = msg->data;
-	struct cld_upcall *cup = container_of(cmsg, struct cld_upcall,
-						 cu_u.cu_msg);
+	struct cld_upcall *cup = container_of(msg, struct cld_upcall, cu_msg);
 
 	/* errno >= 0 means we got a downcall */
 	if (msg->errno >= 0)
