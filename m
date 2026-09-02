Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C401289E13
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379914; cv=none; b=Iy65NGTQu+aOiTfbiRlnjfRqiIycCvKChwKmZ3fAt+4xXjF/zhr88qAGiKykc2b2MBbaukybDI/GMpAlaQKbGBZaIm+Plr/CeHxfrPkBPXRh4YIrdAP4ruhmGFlPQLUH36+wt15ci++HOypQ6zSL0gfI9taryMdUD51SiuCLcMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379914; c=relaxed/simple;
	bh=o5BmhHDfnw4iwrf8K9gkgfQD2kj3FWkXvYaXnpyVv+s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SZSEAmXDd/+DOonuEkEI2PYDk/e70gmsXEuLR/KhzgVg3e8zJ1XpC1ctGbeWN++x8b73PHe0DLALeLGNXegklMZ5uh7ombJM+ukxv8FBWoCw/VVEb4iqSJUiNadF7FGjxqkclBmli+IDpT6dE7giIOK5z2RWqKsMUusD1OWxQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46f178d813bso1504093fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379911; x=1788984711;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rRDQJDr7g3YarYzKUbvtv2aPQ8VmIq45ubT2JPVUTtA=;
        b=HIoLPSiU6uN86ROCbG4UL4hQYG02AR0Zg549w8OYttlE9geX1rvKS0PPw09Vv8I+nD
         i2gZVWoHeRIUpHP0H8AkHKrjCwng2PMneicTblc0X/DJa7rqlfwOXc1IyMEgq4m+EOd0
         YIcWaciw3AamckXY1TJGg2wByiQ/pQHv098MLHcN2peNWhw1qOPJNhQAX9jSaXHY3EI4
         VF0P1k/d3gNYDZ+SrD1cGvBEyrefh4H09O/mfQyUUDMQN3eTMIx5zvVGYdYZCUWfzoH0
         RoipK58PtMvhB2ILzO2Ghg8E10Irbv/OHCBSkQQzqHS6vfkqydeI/9FVGjZ1tIEVFqBL
         K5rg==
X-Gm-Message-State: AFuF++lvOM7530tCuc9YsVJpcS/9vJcc6QQ1LCj9gy8Vkl76qzGu2Oyy
	ddJkGjXh69S7cRmMpDG3OWp7yU0edCgSiUyavdxNOX3ZDNxEuMl9nso4rP7wMA/O58y1ea6jtnZ
	NWOcXRcRMhep73aHlGPYhYoVczJxtgv9gPpkg/afHZRO8lenkbFayE4Tuk+0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee0d:0:b0:6b1:a11a:eeaf with SMTP id
 006d021491bc7-6b47c6ba8f1mr6529752eaf.13.1788379911436; Wed, 02 Sep 2026
 13:11:51 -0700 (PDT)
Date: Wed, 02 Sep 2026 13:11:51 -0700
In-Reply-To: <6a964b83.99c12218.408a8.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a988307.9266084e.bf0d7.000e.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [ext4?] general protection fault in __bh_submit
From: syzbot <syzbot+41453ea05ab61c075f1f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [ext4?] general protection fault in __bh_submit
Author: pavankumaryalagada@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 8b72f6626dc39b9e7e82b2721d4f7c3b86286012

diff --git a/fs/buffer.c b/fs/buffer.c
index 427d8a817cd5..f46fa6413032 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1106,7 +1106,8 @@ static void __bh_submit(struct buffer_head *bh, blk_opf_t opf,
 
        bio = bio_alloc(bh->b_bdev, 1, opf, GFP_NOIO);
 
-       if (folio_test_dropbehind(bh->b_folio) && op_is_write(opf))
+       if (bh->b_folio && folio_test_dropbehind(bh->b_folio) &&
+           op_is_write(opf))
                bio_set_flag(bio, BIO_COMPLETE_IN_TASK);
 
        if (IS_ENABLED(CONFIG_FS_ENCRYPTION))

