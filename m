Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324543BB57
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789359578; cv=none; b=ZFwLhNFXVYAqbYFJLvqwusmDsOy8IeSlX4fprK/pmRQLDD5ucS7xOXR8VMh9e9OaZLI4l52YINRXgdBI5yk9wx5L3R4Wru6G8dv4Yc7xWI5JKvxDt5XLPVSbe9aoH9ECqX2tLEpnRq0PRjGf89nB2nFtZXrVqCvqBn0y8H9LliY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789359578; c=relaxed/simple;
	bh=9oKBhg3meR+W6hKK33WbJkwtHPNaohkVbsl2JTzEIiA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Gf7r95qHggoxDw7myjzyyxKaIvkt4c97hXDO0/QF/iOEMvKxxzpru1FhQLf9liQfWSPXqLLd/426shbQQ6mj272R2SFvCEUko6/9oE+pjpv1zlh3oIht/Zol6npTmMh4BW9U0QSlZqbbcIoR0wrvQxxKUIO2yKWKw12/lTQdH2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f8931a803cso2422443a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789359575; x=1789964375;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jAGxWAkqJ2PpeNUI4hbani/vDBhxvyCLiTaLssOW/2s=;
        b=B5Cdb9x159Kmv7i9qeNSpYGM7Tqs/4Fw69PIEJw5itz8ZB7YSF5p9TSF6dnb7ftc1S
         tNFKwTFSBaWhVtpz+8X9j5/JZVmrik8J6BwaPO6horfMRpwkrYrUJ8hJ9G+cqBtOyWwR
         1uxY8g7MgdTKDFeSFqP0TcY5wi7CcGzGdE81X2bA1sQfF6N2W4ltfvwAhWo18GeBS0gm
         5amrB5SCor0idBYkyq7KcR1xC2ETrRyX+3fPpgDGXv/C2IuX0QNNTEm4FwDMi3ISsR8A
         l0jeXscw3HEElg2cZ7A1+my+4M3dy7jhwVHl/UmKP20jcZczQky7jIeZed1dGlnyB+xS
         QZXQ==
X-Gm-Message-State: AFuF++m0P1XcJyJQcPt1KVwbugfPAK8PCH4yzVbhgN+x/3CsvnizJqGI
	37gyAGh7O13bKr4E/23Q6JxOrwB3rvSZWjl0lH00tPONYNDoy/4Mstu1NPY9zyXYG/0F0B4Omne
	Oj5y5wFXvNChKFAIaVBp0EvvwMi94sl/bugKhQThbGJe0LdAmMC4+EWnq86A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2685:b0:6be:4eb3:e1c0 with SMTP id
 006d021491bc7-6c541553efamr309923eaf.45.1789359575192; Sun, 13 Sep 2026
 21:19:35 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:19:35 -0700
In-Reply-To: <6a74aa44.01d0871a.3a0d52.0028.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa775d7.3aa11909.1a03b8.0057.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 069f4aad347e1f3181639d2dfbadfae592df93e7

Reported-by: syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com

diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index 384bdce6a..1c3ef902f 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -88,6 +88,11 @@ int null_init_zoned_dev(struct nullb_device *dev,
 	zone_capacity_sects = mb_to_sects(dev->zone_capacity);
 	dev_capacity_sects = mb_to_sects(dev->size);
 	dev->zone_size_sects = mb_to_sects(dev->zone_size);
+	if (!dev->zone_size_sects) {
+		pr_err("zone_size is too large\n");
+		return -EINVAL;
+	}
+
 	dev->nr_zones = round_up(dev_capacity_sects, dev->zone_size_sects)
 		>> ilog2(dev->zone_size_sects);
 
