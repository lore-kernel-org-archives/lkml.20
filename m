Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520CC34BA24
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789269684; cv=none; b=E2Uef1nx5Xj1KbDYfDiofGiEl6nZ40um4M/e2ghr/yS4S03rQTaWS9dhl5lHRWMRt5Vr9yW2jPfWG86fcGsPwPcvEq+IpNB+2DuRSP4UjzVTg57WOgDX6SQEdq5U5nS4By7lA8KLdjesi7/c5Vv1HkPcDU+XBm4ay2WF0hvZrLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789269684; c=relaxed/simple;
	bh=WnDAO2pahEmp53CG7kf3TIvvqAhNEjSG0Sa9sgrAcrU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=G6xKEeDsVwWNKzqWDcBA+FqnWGm6Dsg4dsFtOQmTo3DP3cjBX7fD86rdvKKlyU5PR/lgaGnpEJpXyh+7bu6BVok/kOUKxt8nMTnzL1mHJPnNHUTNfPoO60bPRPwLZBmXI5g5spZ8s8SrGIM9oG2DijXHnA79/C0V8DslI5Ry5BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c27804563dso1182748eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269682; x=1789874482;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ny9uJQfZ0S+wsuo1UQkd7f0g8UW1hVkJm/1jKqwJkmE=;
        b=iK9gJnAwYdmkdtm5Z/A+xajlCkcSexJlISMoigKT9XC1Gi+CeDGQohzQPkZybZ6mrg
         sX8WQ2DyX2CWZ1sHZIeW4SDwc1jEQpZh1lTV6Y2wc/VVo/qWokTovgO89h36LN+W/vWb
         LrH8ZCtQWR3yVQonPAtfVb8EaUB7diljJflD0wtIfhuTd8ZCs/Bi7GVECxd1BqhYyjQf
         xwNTK+dP+pqSPoQxrO75sSqotA4Q8e/l9zBKp1keUIBVj7YVdyZVGo/J+xwtx8niGwS8
         PgqWi6+0Ql/DbKQ6FC1ooi6qImnVkR9MIe3J3VUe1dS2r9T2yMV6Pfb3bN3pSRuczpTl
         JVUQ==
X-Gm-Message-State: AFuF++liGlOftu5xuOmE6a6HhJQkEZSVKe83ykT0oYjjZHzXGGf2uyvm
	rihH0OsrFszTR7kZ5D8c4j7EK9ED/8RFqThCDd5vEazK4ac21m6osh+BnDIgkFdVEJLQQ9MwZTA
	/eEJXRrbxZLX/5h8DUwXYIVODeKTH8YA+3EoKiYHqkhmQM+dV4iC5MnJi12k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:5715:20b0:6bd:af9e:a7f8 with SMTP id
 006d021491bc7-6c0b9a5fbcamr4774947eaf.10.1789269682012; Sat, 12 Sep 2026
 20:21:22 -0700 (PDT)
Date: Sat, 12 Sep 2026 20:21:21 -0700
In-Reply-To: <6aa60ec9.f81106d8.2ab401.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa616b1.f2639fcc.29487d.004c.GAE@google.com>
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

