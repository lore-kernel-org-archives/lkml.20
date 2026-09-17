Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772E7DF6C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613193; cv=none; b=gIj1zH47zcGmAGk3zj8xX3m1VC7m1DAKoYUMNrBqy98BEO0FNUw1bvJEVpbJxUdISnNadQMJw34ZyWNLilTfoJpCYYYa2XScrSFnOoDHHLPvulvilbDbblJ7jPkbi9bA/JXYw4tDz/kqwuCx+NtvimkkX/XziXYyJ5w/blERFQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613193; c=relaxed/simple;
	bh=SMTtLsDtPswRQ0LUi23v5LFpX4gyePyA12BJYii5yUw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lwIIGLllQWLvG52aaHJENIAIQkNyyEy4i5mgdOsFIm86h2vdN2nAuMdNeNYFpuWmpJ2btGdnAAd5sZpzJPqR9+uwbPF1MYYQc0TdjGJc7Ww7WB/h4zml5EUBPn8yP55r1kQa0EFhmdYnKsRb0gntVrbGJz4lsd21BBPWozI308o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e8568ccdso770662a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789613180; x=1790217980;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BsITlTGGlmU4o6Hke+eiMUVag7dMVCvBhtVcSqpALq8=;
        b=igl0UgSTr+fmZOAvqYqLPqDHFzKiay2Lb/VTKTuM/fzvppZw6zJqa1oAsSzsYhNFTw
         HZ5VZ3aLNHVh4PPsNjpq8u/q9600zu8h+SQee5xcGq6FaIxAeoGp2c2DVo4B6unrCBe2
         6KixQ9s4LmUE5bN2FSElB/NuUEmPbpA7o3eV3bheu8r9Eq7MlV0gSuw2syjaj3nzgKAk
         CZFzMNdrQhBe95woiRNi0X7G4etStKdCLbhVWbl4AGfJ60Eng02gtoy6sAtXOZ4eZekU
         nDn+Sl71ry+QO2zi/8RPGze7ltuou2gF4FFU/1JTcmsG2fG4ml0MiBLzSwr3Wn0HyyRo
         kmOg==
X-Gm-Message-State: AFuF++l1ewya6UwXphrrZ9b4znIy0B0ARlJ4HeMqRpBOyEYJWk1H2F8d
	LSPzfaoxnPLDdfNPHMBHwQzA+qDfzaIIc68Vt2RCLHpMg2UZqwzemsuyviggmU/8HKf7Igjhb8c
	a8doNil2ZDDol3KiSehKZsCUrTb8/7A5stIW/Id+HZgP7N/+xHp1uNH8OYgU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:200a:b0:6b7:83c5:fdfd with SMTP id
 006d021491bc7-6c7d52eeb17mr5040457eaf.62.1789613180128; Wed, 16 Sep 2026
 19:46:20 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:46:20 -0700
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab547c.b398a7c9.1f86be.000b.GAE@google.com>
Subject: Forwarded: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
Author: neganhat@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index xxxxxxx..xxxxxxx 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -xx,6 +xx,9 @@ ecryptfs_get_key_payload_data(struct key *key)
  if (!ukp)
  return ERR_PTR(-EKEYREVOKED);

+ if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
+ return ERR_PTR(-EINVAL);
+
  return (struct ecryptfs_auth_tok *)ukp->data;
 }
