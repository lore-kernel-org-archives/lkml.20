Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6014E534B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013837; cv=none; b=ist/tEJ4av3kXJ69zivWlZPO09c17WdHAFRku2ndP1ys741fqSuxlmnmGEZIYaitcFN5ZbgGzjk60LLI32CaW5HfPjyj0Ztp6xxT1XVzEv/1M0/9VmmlwvpcN/KSiCYvn9OBg1tquLtWUzTbxJYAyW0WtDVjEDoNa5VAAopyrg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013837; c=relaxed/simple;
	bh=KeOBaL2tSlsBGQiOYJAeZn3qCzQMwPoWDadrrl1McjA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jx8bSQVikCesaBUm/eFmKh6gVQJPuYG4Tg0nDNGzNKZOk+y9IE6IWmR6gFJ0ohjVQn8PSXyqhhmlzeSU235+ME3Drs21WGRpPi/8YYze+BIGdD0w6wyC9OMmCN94vTyWxwkwXLN6QDInP+j80icrHD/KD4sjwB+LGJk8XCrugfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b5bfffcc2dso202825b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790013835; x=1790618635;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8JbzzG0w+d4g0AA5sIPJYw4hRJWrJKeUVD1ex7G//kQ=;
        b=VKcqxZOZ2rFLN0JWUvbE0bDDShOX+BCr+XobdqF20eU5fWcvL3GWBPICEt+f8Z6/0a
         AoyPMDEPnosv2DQu/QPbmciIOX9mrX0soAAuSTCVMVah6omNl9hfahFZmvUCnnUeqDVW
         VNL3bkSq8ad4qVWSqUn5Bpl7vLtH6xb5bTGyO0Humc7kCiUszYSF/j1iBUnUvF8Rvavu
         cn0YoTqrpVqeSV9a6AHeBCvzlwjUUdccOHu/RLbQdK8EZRBzzgQ+aEeZ+oEZMrcRIadV
         Tte5NrCCcPg+va+mA0YxHM5Bo7aGqLJ18oCO+c8ZtgVonvt1WJ7bVbxB1J3R4jWvzgnm
         HIsQ==
X-Gm-Message-State: AFuF++mbNUk9YXCfJ/jVpl6sAxPxvD9CGP8Lzbzugi4Tbuc8FkidoZj9
	yRkyNN+PmkwazvmIKP2E0JZBQa850RpUj46EMLbpYhtQxAeJj97wi8jnTD4JCAHuD2rrQVACWuX
	33cfgIVYueYuXsD3XIGessiOTGprL/rC2mmY+fKKhYd20hFxvwjQTKiZQqU4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3518:b0:4c2:e32c:1ee2 with SMTP id
 5614622812f47-4d4388aa5c5mr376207b6e.22.1790013835296; Mon, 21 Sep 2026
 11:03:55 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:03:55 -0700
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab1718b.a6af0033.177e91.0018.GAE@google.com>
Subject: Forwarded: [PATCH] debug: log uptodate states for iomap bug
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] debug: log uptodate states for iomap bug
Author: nsvatoslav515@gmail.com

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 238650ef6c7c

 fs/iomap/buffered-io.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 0a5ebfda90f1..37596bae664d 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -291,8 +291,13 @@ static void ifs_free(struct folio *folio)
 		return;
 	WARN_ON_ONCE(ifs->read_bytes_pending != 0);
 	WARN_ON_ONCE(atomic_read(&ifs->write_bytes_pending));
-	WARN_ON_ONCE(ifs_is_fully_uptodate(folio, ifs) !=
-			folio_test_uptodate(folio));
+
+	bool ifs_up = ifs_is_fully_uptodate(folio, ifs);
+	bool folio_up = folio_test_uptodate(folio);
+
+	if (WARN_ON_ONCE(ifs_up != folio_up))
+		pr_err("IOMAP DEBUG: ifs_up=%d, folio_up=%d\n", ifs_up, folio_up);
+
 	kfree(ifs);
 }
 
-- 
2.47.3

