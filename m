Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF062BEC3F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789269668; cv=none; b=YtzP3IMqK/SafONF4hWR/WIulFB8UnEvNOIod8zVPedjXi+4pL2pLXeVTdfK9+Dwnr8EoUYZ1Mbh769AMpcE1hX8eImA+Z9va4MAhN+i6Bei5Mh7gCvmfz/vkcJCClt6bm7edzN3OtTB7HW9TKKyCzmL7Qey8vcsxBlbz8mbAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789269668; c=relaxed/simple;
	bh=WnDAO2pahEmp53CG7kf3TIvvqAhNEjSG0Sa9sgrAcrU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=saovEt6VfeFFc7G+cYANqmQLMBwL9k2XN2WtVnHCfChcX7pR1fr1FrYP6vUNkLaj46F5XbsRARs6FIvEvQPR16GQVgrab4yRB4UlzW9XdDVt+eJDPb41weeKydcDbYfgk4cyV/uiTCl3OwbA87OF6pPhn2umyFaM3GR95bqJJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-806004ec379so456797a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269666; x=1789874466;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ny9uJQfZ0S+wsuo1UQkd7f0g8UW1hVkJm/1jKqwJkmE=;
        b=XkhbC3ogH8HBanuBbglrtFPqXHbkEuSSibdUsD5qlG5wII/jUaaCXTPrbI3QJQJFvk
         LL3Bd5Z6aYpnUaxkJNCtgex8k3pZ9GSot21OIcNphrbgmE3TRwSi2Gwhvb8jwu/v7WXd
         Cy/N9+XXqP3wtCUybPUQeOPv276617avxtW4dbkmy/M50gnQUVjko/gVv8ioIsS2sN90
         khXFqC3gYTid7EKHnpZq0x8omJN0mMXaA6E+2k1Y3Ee1ylTQAQ7/XrqvFc8pGN5QS7XF
         jjM7ZMPxT7kpcftxP+zmckWRHu9nXlKrAYiKO6SeOHGw6cOjhj2fPw/KYUaeMNjAeXJp
         DDdQ==
X-Gm-Message-State: AFuF++kxI0uEu/pOH3OpGqc31/fIjEpn2RmHwcBEF3uRu95mJ5Ij4p5w
	AxyxLFLodbZidqKYS+Fg6t0EFEUIbBu2qJ6iaJnNzTUEtf/q+FZpZgUAjJff4ME4BnPTtpCKGlQ
	j8TRSxGzgBZHNHbHqeIHEeRIrWgnpi+htQg8A2hgxsXIyDrovP+qZ/eDiTPo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b92:b0:6aa:ea7e:1dac with SMTP id
 006d021491bc7-6c24ec5aae8mr2953354eaf.33.1789269666213; Sat, 12 Sep 2026
 20:21:06 -0700 (PDT)
Date: Sat, 12 Sep 2026 20:21:06 -0700
In-Reply-To: <6aa60ec9.f81106d8.2ab401.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa616a2.f2639fcc.29487d.004b.GAE@google.com>
Subject: Forwarded: [PATCH] batman-adv: avoid WARN_ON for orig_ifinfo
 allocation failure
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] batman-adv: avoid WARN_ON for orig_ifinfo allocation failure
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



batadv_orig_ifinfo_new() returns NULL only when its GFP_ATOMIC
allocation fails, which is a normal runtime condition and not a bug.
batadv_v_ogm_forward() already handles this the same way, simply
checking for NULL without a WARN_ON.

Do the same in batadv_iv_ogm_update_seqnos() to avoid a spurious
WARN_ON splat when the allocation fails (e.g. under fault injection).

Fixes: 7351a4822d42 ("batman-adv: split out router from orig_node")
Reported-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a079f084653164a652d1
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 net/batman-adv/bat_iv_ogm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 53fbdbbe8f4f..d8a6a0f64ce2 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -1410,7 +1410,7 @@ batadv_iv_ogm_update_seqnos(const struct ethhdr *ethhdr,
 		return BATADV_NO_DUP;
 
 	orig_ifinfo = batadv_orig_ifinfo_new(orig_node, if_outgoing);
-	if (WARN_ON(!orig_ifinfo)) {
+	if (!orig_ifinfo) {
 		batadv_orig_node_put(orig_node);
 		return 0;
 	}
-- 
2.43.0

