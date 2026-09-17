Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83A52DCBE3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608500; cv=none; b=EfCpYuilflZkdHa4CAN0YfWHhn2DS69/q1J4VL1amWYjt1ARnse5sq4lK1i0CeHLgwBdKQLIM+CdJJSLEzwnPuVAccjMY1urrpjAqVqjGVTdZQbx8SAE0v4YE30XTF6aZpGqt4YPsqakjJf7ExKGxNHN3U6CxdX3xKDxOIVRuTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608500; c=relaxed/simple;
	bh=v7RY3/SUpilIN8GLfd2w6uNWD5ZXB8qplHDlxaMx9jo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kDqN+sGUNgHmCYmSGB1hoyIiyTKiPG+q1epG+lNqMe2AxWD7I3KVbyjGXPoUNGE/qrVWd1nnMBfrBpBvcT34qx1fg72e/7hGxucR0wvvlHhEZFs7dotK1cmvYp9hBY5pwL+lurk0X06P1jT3I/YJozXF+/KlkZvUxo4rE81HN88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37620eb73so491995b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608495; x=1790213295;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HToXUVlFlAXfNpDRIGsMlFOUujvuH9ERgsVEzRz5wmk=;
        b=cT7k6g1ZCQwIEeDyC84lDH/oWIfOFre2ECzC6eg3a81pIswg4acnBXN/scIiA4Qngs
         5ZjLEMS77yxlX5sywldkrugHXoGipY4BNmGuUMYzt3e+k6Ti9PVJSTxHJh/iCGT/a81p
         EcY9KUv6X+EtY7thPuRXC8f7JSOvf3U8rfUBRQ3JzZTV5T9KV2x3cXyW/PqRz4jVvmGI
         FohcsbHzeR2+9fnPRs371QczPddnp3gHg3wKf98NtBci8HX4He2KJFlJBL3wMATZHhTf
         Q7tCdcDETdlcaRD3Ja2SVx8f260pv/p9AntuKWPUzkxCEQaSUv+E46l2+dLi97Ctf2cn
         +Uag==
X-Gm-Message-State: AFuF++n4ZbXFl323MTuBohsazBOume6gxwlN8k3irky/Q/s0q5ksyILV
	MvyB01WB4f/MI7jFEX48N0v8JyK95Jp+jbLXh1IQRLOYlZCHYU6MN6nZwV+ugGypmjbx1R1Zj+x
	UCMMh0uU0r90j1eYgcJn4sZVrqa7jojKJM+mV6tUqEw/nh1rUXYRBd0mpWtE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:170e:b0:4cb:f21b:6f91 with SMTP id
 5614622812f47-4cbf21b73e2mr106154b6e.36.1789608495371; Wed, 16 Sep 2026
 18:28:15 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:28:15 -0700
In-Reply-To: <695faa63.050a0220.1c677c.039a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab422f.71f81b7d.278072.0007.GAE@google.com>
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
index cdfa699cd..0edb70b01 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -2971,7 +2971,13 @@ static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, bool is_ctl)
 			/* sufficient free space found.  move to the next
 			 * level (or quit if this is the last level).
 			 */
-			if (x + n > max_size)
+			/* max_size is the number of elements in the
+			 * stree array, so the last valid index is
+			 * max_size - 1.  Use >= to reject a corrupted
+			 * tree height that would otherwise push the
+			 * index one past the end of the array.
+			 */
+			if (x + n >= max_size)
 				return -ENOSPC;
 			if (l2nb <= tp->dmt_stree[x + n])
 				break;
