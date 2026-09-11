Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862A49E14A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789127756; cv=none; b=vBjeXGK6v6nqnS7fwyNo++pPs3HQK7/nirB3Mc36D7XiYyw0y3StAYd2WtjmEvq6pk7q5ZBbA078v6UOyHWOAVa8Y/wg3nLwgcxOi/TL83Ut5AnV65D/gQrq4ZBfsKa8b2J3fpWIKtJcZwA0EQFlUxFCqJ1ApH+0yTvzflQZqXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789127756; c=relaxed/simple;
	bh=Akj0JGIhzq6ACFnfw2Sa1ABt4QIcgJsRU651vzot37E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dEJ+n2DZDOGv8cj1pPI9x8mQuXXT8Vslw6sYB9cXkBY3EJVFNAF+sGiXHLwKkWMlPTQE7uHYdE7Xe2DU61+fdHPykrj61v+8HrXm09sedutAyiMlPWKr8aowt2oMr4GY+WSuBj9ABBIQPDPmqwP5cJiJJUVcVQTelomTIuyvBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1b24c4d0bso98254eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789127754; x=1789732554;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vC5j4jUtdSmqMIxdYew64t/svIjKXf63TExKUyyupr4=;
        b=jsFk+hGmmB0Nxyr1IXgwzOqjr0UaIbZZ5Xa10X4RypxR6Vg7UtzOSzkUplaEtDjOqL
         z+FvT6LSbmGnzCYr9HpPiGu93kOrODTMW/gDE9+/h2V1+3Jl5ocrETX0uLAlBhcc4KTO
         jx/EpFJLPl7wcp8pOCmnyQoYO5HlZP1Z6DI3QkKLbr/sgZeoDwNyZIShxOAJQUpLcVsA
         unSCaCZYVSWsRQQvHcBlzenBd+Obnw6wQG+maFfbLSHQohvf5N3cdWkRO4ace1yn8TF1
         LoWiIjRRBa662riawv2hl3b+pErh5MefJtYtIuCe3HFs+qpO9ZTtLCWcXMrdhsNWqhEL
         I94Q==
X-Gm-Message-State: AFuF++lESkH1HFpzOxtgn2NAjyNytzWM9v97gv3q6H40u4+ClrQWmRIQ
	Vg8K4PcDtfY+y62hRsj+UqnPFoabhYiyJAFV918R17tcEKc/ja153zY6TnOWDu2bHDVyVU+w57q
	Fo0ZptxPasn70lnDtA8PwJpgakNx8dW0O5HA3sSEVlPD1dsheFsANk2376XM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4dc7:b0:6b7:46fa:169a with SMTP id
 006d021491bc7-6c0bc7c4a4cmr2415709eaf.47.1789127754013; Fri, 11 Sep 2026
 04:55:54 -0700 (PDT)
Date: Fri, 11 Sep 2026 04:55:53 -0700
In-Reply-To: <6a6a9894.7eebbf3c.214d51.000c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3ec49.f2639fcc.29487d.0029.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a7c1290eef60711c10289c056ad32ed1f2b47b12

Reported-by: syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index 3c88f13f1..d9c222ff0 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -418,6 +418,16 @@ static void configfs_remove_dir(struct dentry *d)
 			pr_warn("remove_dir (%pd): attributes remain", d);
 	}
 
+	/*
+	 * The dentry can still have external references (e.g. from a
+	 * concurrent configfs_symlink() path lookup), in which case
+	 * simple_rmdir() will not have unhashed it yet.  Make sure the
+	 * dentry is unreachable before the caller drops the last
+	 * reference to the config_item, since configfs_symlink() resolves
+	 * targets by taking a reference through a hashed dentry.
+	 */
+	d_drop(d);
+
 	pr_debug(" o %pd removing done (%d)\n", d, d_count(d));
 
 	dput(parent);
