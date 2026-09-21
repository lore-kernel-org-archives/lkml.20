Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049949B5AA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999471; cv=none; b=GFjZb5Hrm9DWovO4NTHW6NjoPsYQN2maA3GPUwtzsuwhRMlGkOQOazFqvUlsvaw2VLl7q501SXx3J+UQ3oENGhGwZBKaaZuT36K5iX/Vea0CLgHgaSJaBpa29qB15O4LZsRuaLhDfg+Xsa2FdhJi1UHFgz+iGuHAsMbpK7WHIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999471; c=relaxed/simple;
	bh=Flet1TxPCsHgegH2T9mxOyRPEEWxKKo709868NeI1FU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PbdDOu8RG6loVFhu8ODFaa48uc7CIDHU0C/VAhSGmn64hr6SR4QZXfA/flvEe9g4WiQKVdjA6mAULHm8ldm/yk48de7ER+G0Uw9g7/IipTKziQ32nPRYqeucrMZ17dEMUjm5VDzI9VCrwXXA9XYJ4DPhaH6yvlvUfkMIeohXi64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1abf73d1fso1904410eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999468; x=1790604268;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KMeu+1I4Byc20Qwgcx4bhEW8V2u/TB8126XLbcmRkrE=;
        b=xu3c2zn3GmrzYqMuiXpUzp5VSOE01z250muVsnhgsxRjq7cOCxDUMae2Bn12rePfFU
         Z04IPFiMKRM0XQYSXJ6jBfxU73baUI9eaVmLBYN3J7W1qwVkx73rUU0IQU+mQ22Wj6hS
         VJr/Irb3f5mmP6OEBeBG82Nj7Z3/vncVv23l0hGAmcX+JVHEwf7F8goNkxYKf0r+ffrS
         xPrPwhFYOxDFTzB3vfCTYZigHEi71w1Ja7OjZnI8q9kaZCnAQ7KD/GLLEY8Gv/+VvqRP
         LwoH4bD7E4jYBpwAgOPndVPtel1AIVmGFfK3WypbuXKb6h2rCVIJeGP3eVJm57D+Hd30
         cf1Q==
X-Gm-Message-State: AFuF++nLUoYLRwdrScnG6CYbtP4XpiKMYoJ9fnLJDvsfAAsw2ED6sJN0
	+nv7maemf7fevGGWMiyeiKugSxY8M4jj3oCJWunzFULd14t2OkTgiOxvmKkuVXxOU2HJ+1PYmgP
	WAdlTHjO+dZwszZ7Sv0tU/EHeFhlBqZBgNJtxowVHt4xZKgdOrKuv21TNjnQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c0a:b0:6b3:7d96:94c0 with SMTP id
 006d021491bc7-6ca9a1343f3mr8992708eaf.10.1789999468394; Mon, 21 Sep 2026
 07:04:28 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:04:28 -0700
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab1396c.3179f8cd.1e36b2.0020.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
Author: adarshdas950@gmail.com

#syz test

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 56b4f6469a28..a9b4e288ca20 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -842,7 +842,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 
 	if (ni->i_valid <= vbo) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		folio_unlock(folio);
 		return 0;
 	}
