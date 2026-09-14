Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4580532A3C8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369017; cv=none; b=TMiTqAvNhLxfi5RFZ1YiyPSGPSfuHF66FbvhKzjLrZ2wciJWtlzDTa2a1EUxIm8r86d20e7c4NYMz8ivk7JW82RTXhjLrm6q1IITzkBOda1S5WZXeBGC+3rNiwgJKuglU+klc5QLMOdrOLYF0JaigS5pQY6ElkInjRLVLJbOBRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369017; c=relaxed/simple;
	bh=4kkwfB3wt0tjQZOsyuZcZfcnsHcKgyKE6TLF8R8a2dY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=H12BSfyO5GHKJX2yMdOfm5UlqEYBVemwL2QH6zRFaqrGLLCvMPSLZX+UgtxWkOeta+8bFlT1MEkgqR9Gr3mU16zWVQL/kvxK8vtOJ+aS5DF2f4LRRbgdCaH8aNAX3MMJt3F485QW9wgnay6FQV1tSTZjyS+/yleirnGRLrJl7OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-804e73b36eeso4360402a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369015; x=1789973815;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Em7QP4LVPkGnSbOb2hhruaM4Y9eV+8l7dS2b1+CVU2s=;
        b=Gavj/p4DQ0CLpssg60o3wOJ0okEQwEM/SZKaGPBc/58ZlYN3U0rcQpeouwXril6RR8
         ft1aVMIMAC7/BBRXUwNLLMkMbedpkoiVAzWhvzAYNRtawqrZLJ/ymNIimu0eFXZpucLl
         YCPrpE691f3E13yQGsRFd31xAdrDUVv7mxQKKk/pHs86R/b0KnYPMUYnoIm4sJLOVA7R
         ssdb37riReyCfjuXGWm+RY9V3rXdmSpnc5gTfRexf87x92Mxq1X8Zv5NBGMrKMhy1wjw
         78yNu35JrU2Wq2cyjD637ykIvtshQQiFJYUd2P3/yw1W59gWX+QCPaesSMbYMRFuEGRV
         YjIQ==
X-Gm-Message-State: AFuF++mquSfdnxgqezCyTCOK8rDj3bt7B2II4rdrPtUOlzSB9w6ETPgT
	iF/y77eyVXDbv4W2l19QHYII4yt/aWqAX53kuzpsL8LEs/DH3IGYnFaI3VsyqDO1NsgUaUq9Bsx
	/XTg6xCDSGzxAS5oOwGBSODRdU0x7sNhjd6FWDgBiw+JUx3fJKF6am0uAF44=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:810:b0:6ba:3635:800f with SMTP id
 006d021491bc7-6c545b7dda2mr517774eaf.69.1789369014976; Sun, 13 Sep 2026
 23:56:54 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:56:54 -0700
In-Reply-To: <6aa60ec9.f81106d8.2ab401.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa79ab6.f81106d8.2ab401.0045.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d05c7c76c96b90462f24debacca971d2e86713

Reported-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 53fbdbbe8..3c5f7c80b 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -1410,9 +1410,12 @@ batadv_iv_ogm_update_seqnos(const struct ethhdr *ethhdr,
 		return BATADV_NO_DUP;
 
 	orig_ifinfo = batadv_orig_ifinfo_new(orig_node, if_outgoing);
-	if (WARN_ON(!orig_ifinfo)) {
+	/* batadv_orig_ifinfo_new() can fail when the memory allocation fails.
+	 * This is not a bug, so don't warn and treat the OGM as non-duplicate.
+	 */
+	if (!orig_ifinfo) {
 		batadv_orig_node_put(orig_node);
-		return 0;
+		return BATADV_NO_DUP;
 	}
 
 	spin_lock_bh(&orig_node->bat_iv.ogm_cnt_lock);
