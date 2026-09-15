Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB83911C6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436340; cv=none; b=iKoS84+7L8CrzCnjrLU6EaoFQDrqEW5CNsWl1x/kV7naPY43EX+mTiv+eeoqzIHZdjx+/v9KDVqXmvZL7c26Gki3QmKgZ3mC1z3anVKZrQB+L0JvtT4/S0RuUEmq26h4MIjne/uCQlm8ylj72nLGauMwKraumGZMKGHPZ5/bZ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436340; c=relaxed/simple;
	bh=MQ0fuE4WyjBewW1NR5Qcjs4IjsnnY2p/t7h3xiC9F9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AuTcWp/chY2FjDE1mKRRJUTHACdpyg6BTzq2g4WB7s7XZIoXjE5gicbajCZzjJuba+hlukpBnHT8IttK1Ga7dc/O1frXxXr0IZlmk+RH1qQFdsEGkmsJTwH1jXH3BYQiFNN2od0KvIqs5Lgn2jd5DQLobpCnnhH1OTr9t41RET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a7de733fa9so5250687b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436337; x=1790041137;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jy4GOhYeO1ZHo/3pivXDnL7Kl7+K8L2Mt8dmTrpWuS8=;
        b=B7ezpNutTuLeKDUBXOw23gQYBahPtaidZL4LAve2MkI2dyFN8wy+aO6hnOmZIAXRDm
         Forfi7QcwexpMzCwMGVgGuwFHVcBK+blV2MNAqLbDpeMwahRslnBVNZTdY+rYgS+KTKK
         ojviG2lhSJFwkvKZ03ydOxFyZlLtMHzNB8q/CrIBUeWD+N0Pqu4fA/471gbUJcrCgAul
         3f5Zg8B5/kyar+o4foDPGXwUGfMu9duKy0wJnCU/T5M+1FVHxz9jKlfaDv5wrhrqLhD6
         eFStgRRBOtStGSi1lqeHCnMfTjMbwnMxiAsZhXJXYUg3mzFyJATjOoLwv/hIKJQqonB2
         27JA==
X-Gm-Message-State: AFuF++mUrevawbfIMcqXZdBu9fiEJdjVQLV2CTWZO/BL7iVVp7S1aVlk
	zpi1tmZrUtAFflxQizflu+kv1mf406Hn45UezOpncqAmGax4HLKkhNfaD+92+yaYtWT1Z0OeN6I
	rNeTl42PEXXuz6wxuviPScjUuNOA0zrYazMnS9rCTTVO3SSP+aH2rCvzfbKM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f014:b0:6be:9627:194 with SMTP id
 006d021491bc7-6c540a68066mr3082462eaf.25.1789436337396; Mon, 14 Sep 2026
 18:38:57 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:57 -0700
In-Reply-To: <695faa63.050a0220.1c677c.039a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a1b1.a211d2ce.1a5198.02a2.GAE@google.com>
Subject: Forwarded: [PATCH] UBSAN: array-index-out-of-bounds in dbFindLeaf (2)
From: syzbot <syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] UBSAN: array-index-out-of-bounds in dbFindLeaf (2)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index cdfa699cd..53642b1ec 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -2971,7 +2971,11 @@ static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, bool is_ctl)
 			/* sufficient free space found.  move to the next
 			 * level (or quit if this is the last level).
 			 */
-			if (x + n > max_size)
+			/* stree[] holds max_size entries, so max_size is
+			 * already one past the last valid index.  Use >=
+			 * to reject it and avoid an out-of-bounds read.
+			 */
+			if (x + n >= max_size)
 				return -ENOSPC;
 			if (l2nb <= tp->dmt_stree[x + n])
 				break;
