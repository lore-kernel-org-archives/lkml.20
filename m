Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987346EF77
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000905; cv=none; b=gUq58umxPZOq5NH8R1ychjLUc2FKQaydmmuslQ0urlQYjsX2Qb3gXy6AhKH6o/1wu9+xYgU1phVYiMFPHV/nmuawRn85/w515kYbYFTcihX+Gv/TQPPlJElcw5AsnyaY2s6A+i5voWeN0VLpxPTKaTcBOP6HyZ0KOOmhrrDZZ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000905; c=relaxed/simple;
	bh=AOzJqskYZ6tpG/gaLqr3mftX79xWAeivpY/dV5rz7sM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=F3ND4VVDNx+Lg059AfMfNDM7U7ig3pr/ewYVw14xWWVvy82yVWQQey3uyJpJK652bCgluH17cmJuxhoSYsclouyTz8J1naTEksiyBW0zHacemNnJAO2CVDSFhV4uqDmLfEZxaUWxvpXpTo8If/SnhahaQRYeEY8B4CcUO+MqpLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c2d5235ac3so5006265eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000903; x=1790605703;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YqWRIFcbGro7+XZLzaOYHcoFX4D/dK/8s83tJRvpMVg=;
        b=gYmqdenhp5DCEElozCKvdE9ZYPANRW+xJDR4oxzo1+TwvBYf2sihXAST4GSze3HdC7
         rd18mBoQeotPrT3Bg+sqYiMaJhUkXpwEX9qKjAX1Hhvvga59EJEErl4xxFQJRQa0awHO
         fPGExZH8QnS+ncDAwvEYoWqLWb0bJvSTcqNIxPeuG72iIrIFM1XBK/WQ90str1JR2FaD
         bpgD60aJkBb3BhYui/W7xvn+U2HONIJLMGncaGg+sHnYxYnQ+j5RrB6NEVfuTXzdhu7+
         wYpsVmQe+qrPfEgHjo7xeMNhIkzsPiDpng86e8mAXkpRj5l87Bx4XOoBhKGd1Eq29bSN
         VCng==
X-Gm-Message-State: AFuF++lmrMXtQR9jO/TfssgklPDOdQmiiWNzzRQxfLqfchE0XAe1y5ye
	6fI6mP6jntfngGXhLCC7kEnwBcV84gdwdLa2ke2Im6iV19hfC/+B/tqioFFhmgrbm8eztFxKdfl
	uUIg9tVxX6u4eJqTibtRhKXkvdQyz1OJd7ey9Pedfo3/JE+mUU+X5qfZLfls=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81ca:b0:6a3:6f5d:4d6c with SMTP id
 006d021491bc7-6c8fba84ae7mr11806816eaf.6.1790000902972; Mon, 21 Sep 2026
 07:28:22 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:28:22 -0700
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab13f06.a6af0033.177e91.0016.GAE@google.com>
Subject: Forwarded: [PATCH] debug: log uptodate states for iomap bug
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] debug: log uptodate states for iomap bug
Author: nsvatoslav515@gmail.com

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

