Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB52453A5E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040926; cv=none; b=UUZKrKXDLLH938G+6dIjSF9plnkxE8SGC0ya3dUb/tlaC4CvFVoY1oNRsVN9GgeTF2aQesZQ5modd0Y1IfJkeWgNDbQ+Bn1UKwtmNJ9brgoA37cGAY+bdRL8QM/2aNXPZ2IlsdSThZ4JESk07fW/hHD6TWS1HrLwgym385MeniY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040926; c=relaxed/simple;
	bh=GiJtBRQd0xHqR+tc6VrPEYqLqIRh8L6y/3T9gHQIV38=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=a8J9TI94uEY9i/WK6BtkHVfH0NRkWSJ6MgDZr30EdJGEKPw6myFSnMg7vY1JAh65M8NxUqxsxihlMsM6zKa6Ln6O7nFysMyF4CKNBrP7Hrd2S/hvzQ30/vZwU2wLkQONqdjy2R7vknRiTh/iMKzZmvTRlLMAPRDWb2rBVjbpH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a45b3f0bdfso10473597b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040924; x=1789645724;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l1xxYAesGwsl1PGA4fLjtTeL9m2ZNFbUgY1KxDeHAdM=;
        b=Fh+aFCl+8uk3D7D5EAl4d0NxCW4z1BW70422fsnxXgWsU5cYxAHUaUXxknkkum1ITP
         lB4g+LUYP7DIn0dZEqKZa7yvDb7koCCgQt3JVu+Jw0cTd7SbLkcpN0CuzhA1ZIEZo5ti
         9B1my4rk+IyHs1MrjeoVnOlJ1h6SAzHDXf2mwLNjY9lUQl9vYLlrDUJFv89P1yg8YAV2
         7BBwTmQaCouEH96TMVsDbnXltbLQKtYr6hKo33xUEMkaQaHvcc/OrNV8O51krieRYic/
         05cRuVRwkg9KoRERrKsHYKeV3APEJH+jrsEaUUNQpr2dv+ToSCGbk4IOr3sewhl5wNGC
         I4VQ==
X-Gm-Message-State: AFuF++mWAcqHd6vGrhCpUOCSjv0eOsSYmyxIm7HvB50Of49Zy5dsgg6m
	8NyA7Pi98tWAZwhJ9esn8dQJfgZz4JBkrPF735PwPaQh37gOJ5sXzraJoXVq24SoOn33pNSn70H
	w6FJySRTW65lEu9zc7Thnb6QyYnsclco3/f13vZm8DKuTkV+A9wCtEF64BU4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:34b:20b0:4bd:e96e:482d with SMTP id
 5614622812f47-4bde96e4ce8mr8871448b6e.42.1789040924099; Thu, 10 Sep 2026
 04:48:44 -0700 (PDT)
Date: Thu, 10 Sep 2026 04:48:44 -0700
In-Reply-To: <6a9dc9e7.87c06881.102b7.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa2991c.f2639fcc.29487d.0015.GAE@google.com>
Subject: Forwarded: Re: test patch
From: syzbot <syzbot+de3d7f9bcc9212f3fae1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: test patch
Author: tahasami8@gmail.com

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 9c03a555a6ba..98130182e05d 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7995,8 +7995,10 @@ int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
 		goto out;
 
 	reader = rb_get_reader_page(cpu_buffer);
-	if (WARN_ON(!reader))
+	if (!reader) {
+		WARN_ON(cpu_buffer->reader_page != cpu_buffer->commit_page);
 		goto out;
+	}
 
 	/* Check if any events were dropped */
 	missed_events = cpu_buffer->lost_events;
