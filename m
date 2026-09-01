Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7692262809
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268586; cv=none; b=WhS+g1yKlzWbSEK5SrNj8EddbBRMPqI95FpCxjwk0wXRdyM6clzwN9JrY2SepsDMMTDbQzOYP5vPWxM4li8UKCX804f/4DH7r79Oi38sC6moj5IBPMOE5NIGXSV1ClGqBr8agiv5+wnd5SiJeOe5ViS0eEnRl3u0NvbBxABnHwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268586; c=relaxed/simple;
	bh=KmtqmjihylUMd8gBP7gQb2UvWrf7mqU2iQfbMv86z8g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CcCG+If05S3FeM38WXwSlUDuUTQCYx3DleaCj7BaKU0rEwoGbye9FLFCEKGIYESjxJZx51ACgwJEtHVIsOlb5h7Rc9DfVD66I3MFgerpZMu8I/0R6oLdzDia34SJThup6GOSrxSK+xpHTztIwZEdvapir1lii0GDPBco0aMjRcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28d8d1b76so860618b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268584; x=1788873384;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SYskznde1jivF1YcdvvwLcB2ZIRqI4KbHxaOQ+HEb2A=;
        b=QEO/Gmp1HmztMAKKtDGeb2SW6iXHEvtylTT3P8eTzAb3fallb/nN/AzRMpfmgEuvdO
         p+gslgJ94dvfzYKWKxp3V8CD/3W6TKylWb/Lc54iOS/kaTiNthTn5PJ0KT0rO6P5DeUT
         ubUG+SIey6DSrGNb8O/pJWRiA88eiTUaZMEauDyaiBJDFnBlK1irn3jhsmBDa+dJkWWN
         qchHsefUCPxVU7BLzc6npiD29d2VEJL0VtN6iL4SYerXxw4somSgOeVCaZ1bwoB//Ffs
         FN8ozkBOHs/vBBa5G566m2u4sRoAFWT5T+SJFL2LXG9HvVklz8BVm8BeV2/vwRxlKpVz
         Efzw==
X-Gm-Message-State: AFuF++kC3Qo0a93vIqsp1vIfWeYQHk9SFbrh17kEee3O8forlkv8kL+o
	H+3wNacvEqWSFF1Y4/L3fl4Gr7pDcSz1kAY3mGDfnQH1lQExgm5UnND75+M6GP5ppchJYrt8cXb
	s58m4krWXOXLbW9s41nzpOuH7LSqE1JG0LPuqm4uIRusd8zcwJr0VBJT0Cls=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c165:b0:4ab:3210:b31a with SMTP id
 5614622812f47-4b398253454mr36499319b6e.14.1788268584497; Tue, 01 Sep 2026
 06:16:24 -0700 (PDT)
Date: Tue, 01 Sep 2026 06:16:24 -0700
In-Reply-To: <6982985a.a00a0220.37c87e.0017.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a96d028.a8e469d2.cbf3.5626.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [f2fs?] kernel BUG in clear_inode (5)
From: syzbot <syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [f2fs?] kernel BUG in clear_inode (5)
Author: kth5965@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 786262be6048deab760f68c8acc2c85607165894

Please test the following root-cause fix against the latest upstream tree.

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index aec06fb4fd76..4047e446ca1d 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -55,7 +55,7 @@ bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio)
 		return false;
 
 	if (inode_has_blocks(inode, ifolio))
-		return false;
+		return !f2fs_exist_data(inode);
 
 	if (!support_inline_data(inode))
 		return true;
@@ -221,7 +221,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
 	struct f2fs_lock_context lc;
-	struct folio *ifolio, *folio;
+	struct folio *ifolio, *folio = NULL;
 	int err = 0;
 
 	if (f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
@@ -234,10 +234,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	if (err)
 		return err;
 
-	folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
-	if (IS_ERR(folio))
-		return PTR_ERR(folio);
-
+retry:
 	f2fs_lock_op(sbi, &lc);
 
 	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
@@ -248,6 +245,21 @@ int f2fs_convert_inline_inode(struct inode *inode)
 
 	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
+	/*
+	 * Keep the folio #0 -> inode folio lock order while checking
+	 * FI_DATA_EXIST under the inode folio lock.
+	 */
+	if (!folio && f2fs_has_inline_data(inode) && f2fs_exist_data(inode)) {
+		f2fs_put_dnode(&dn);
+		f2fs_unlock_op(sbi, &lc);
+
+		folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
+
+		goto retry;
+	}
+
 	if (f2fs_has_inline_data(inode))
 		err = f2fs_convert_inline_folio(&dn, folio);
 
