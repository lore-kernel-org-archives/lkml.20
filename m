Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B8B393DEB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369808; cv=none; b=NGgSsIYSKNTqDX9Gu2Ll2ViAvz3R8B+J82lT/x2mZHGomM5udJ5mOKijU2ZTrItCI5LVz1u8iL0cONaDxQy8FpzHPUev36gdTpPCSK5vlsfsXF8gYLU0+ZC1+BJusEGZcyW1Sm1tP08PFuv5K45M1icu4kBClDAki3+a2gyDZeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369808; c=relaxed/simple;
	bh=StZnvQJiw/jGEgswuyS0WcG0iFbaDEbWxFKIv2maTt4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=peNRS8mX4/Xhh5nqDv/NhstCYLaBcsQmJ8YVYu86GNR2lTgE3BTLoCh7uMijsdz5xcc6EpS6Zj4xWT/3H3cIPRRAuex82Rc42dSGTmq6tHa2zDIyC4XJYYpA1A1RvCdQdh+ni8s/lekgXVAQsiGRojrK6KjchJFZgyD1dDSYM+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b36cf0d9d3so3199582eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369806; x=1789974606;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bSwwMzrMMe3qDo0FnunxYy3hrhaeFsQX/OYG3KwwEfo=;
        b=N16uZjqI9Vk+aCXOHpZFYlhpv2p2Th1Ad5luleXH/F9dlgDW9uJbC7qavKmbQoBm1S
         mIY/bnjBHvxbWfP1GM5XbQN4lHcUKllsct/z8Kko3dk/sVGClZfVQm1KelC4DTId2mau
         d9FbkB485ybVewnWWSsTiOG+fGEBLgKfe9zCoNoiWurEZW02kySr7Z2dzxwk+JHgJlDU
         1ZEfmD4bTUlgaVm4Y06a67WXPADoMFhLzqIJ8QTZ7fgPqev2EjQ3H0QDzIS0JN/iRSI1
         Lh+MLcA97tkgdFZfrS9fTCB6QTCQwz3RZzjwITeht6njOE9wI8JnY24gVINBA4glKlo1
         WNYA==
X-Gm-Message-State: AFuF++mpkzuVcD45fsVI7ZR4Ep85MuTMbI9/GbuVRnqwHe0juoiKpXtb
	g1zBxXiL7/UlWZemt1PEEaaUIsny02rIMhDcJIV68SBqKl2+7q3XhcteEdX8v2wy/dGyg/7blw9
	X6PgARXUB7yy38zT0ES8P1UB9imOQHBHFO0SGuvIZNrOAUGS2GI6vDkQqs/8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b96:b0:6c1:fd93:5295 with SMTP id
 006d021491bc7-6c5412661demr1173715eaf.21.1789369805989; Mon, 14 Sep 2026
 00:10:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:10:05 -0700
In-Reply-To: <6aa60ec9.f81106d8.2ab401.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa79dcd.f81106d8.2ab401.0046.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

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
