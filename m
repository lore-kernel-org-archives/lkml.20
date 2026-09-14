Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E874477F5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387516; cv=none; b=DyDz+D13Yf2ly7MbnWBTWoet81brVFlxx3lbESDU8dDS4JUVYoQdrN29GRTyXjRgLZ3b6BDsS54jz+vbDAmHFZbi0tFrdeL5dXEb76LjQkwHa+qBNuGUrXk6/tddK5TLh6JeoEE09D1ffc79xsYF6hAd3rxD+5Ope4UYGY43nq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387516; c=relaxed/simple;
	bh=SjzF0KpL7oZ9lff7D9PO//7zWWIk62azOuTXU8rxJvk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MfZJxpMqcwUSsFrEWAj8TKSBZnw3ib4feQtbMuE15znmz8D/AzVyInYFT4l30NP2+8uE48ZHurKwfNu0GHzGXGsQPPyItnyFBQIWG05ug1EYELJaUCOAV+iZgy+Uz+Zpz8iibhGnIdpSz5JOqWB05xzBaSQtlQQbMr0kYkn+mFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-807383233b9so896524a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387512; x=1789992312;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uc6EoMQsHJ5+mpQ+u/4Asv8ljheXINNhr5r2V1FfOao=;
        b=sYOiMir4BG8RQr6mWOMceNdoUVlAvan03A9UrEDykSUDNdc8zu7WyPi7lrnAxIhooF
         DzhS6ptHHY9jaaVak4nAYFndPnlHKaqwQMx2u+tOIPv0mYm0inmDPDsiyi6gNl25S5Tc
         NkSL/n44/CxNoDqMawoWLEbnPd2KOyICtR4clRMR/FT7W0QyS/efyJJiSPtBXDnOo0Cw
         XKbRAN+c8tysBDdccx+umezyU8ezMTdEW/KRkQvAHXF5L2JVjhvc77uz1M/oy33x8B6J
         K/ol7PbT2ewNmomHD/vklPRCxVl2iwUC2W4In3KFE4xtLoSzvxJrZMxM11uMLalR2lgK
         w+gA==
X-Gm-Message-State: AFuF++m+dXHdQWqAgtzypaR9K/NAHig+g6Ii1Cfz9DeyelEFCHcgEipQ
	fOf2YBdhWbPgQ84NI6nPDtOmZvEAe4Z/kx64qyzTg7w/to8OuK1G7N78AY/8UjP2An86FtT/5JN
	au8TkXi8eVWWifXbI2pvhbFfNiO3kVEYu2BYvKC58CwqqZvphuENOzRMfuIQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1515:b0:6c2:3441:9b03 with SMTP id
 006d021491bc7-6c53fc6a216mr1046204eaf.21.1789387512570; Mon, 14 Sep 2026
 05:05:12 -0700 (PDT)
Date: Mon, 14 Sep 2026 05:05:12 -0700
In-Reply-To: <6a9ef807.2bb5a69c.24b23c.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7e2f8.a211d2ce.1a5198.0291.GAE@google.com>
Subject: Forwarded: [PATCH] KASAN: vmalloc-out-of-bounds Read in rpc_queue_upcall
From: syzbot <syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] KASAN: vmalloc-out-of-bounds Read in rpc_queue_upcall
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git df2908090cda368b01ff43709f51890076c56157

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
