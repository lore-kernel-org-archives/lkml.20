Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787986;
	b=LMfH6HZFbgDcCejdx9NMVHSgmu+lBWRXZkbNUoc6bCUBHpAaCSykmlEO3sFwACv3xAuh
	 uZPzlgCZ8j8LUuig0wdKSM6+OFnMmnWZIgj4lntBL0AEN5Gtc6gCc0HP+HjwHWFYF8rAJ
	 D4KFHLAMtlESv5dyz/j91VsNWxTVTaKqusDOEtX7tbOdw3T/t39rQCG/g5FF4GNMbNkDq
	 SJgE25V+KXB2UenSZBG0kSebbvBk3FQ/DMvt2V/DqhrCKvKNGyFtwYALLXJqxZ6o8gKAU
	 6lSMSXJV4z+ATxAsG72dd2quSRw3MD16AWDjSi79wpm/X0KjOi2GzLvSztLgRk8cofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=V7bVxjxfNJMJ9ikA6qreYHkI8rZ5PEd2tPNtK+tsbm4=;
	b=po4G5De2Xme9q9r8cof6Odd3FDrl90RAmhsCtcANA+q9QQhUHSIcLaOu1LigItxdve4V
	 mGE5FSuY5cUtcDFkCy+BB13GLZN6pWv/+bOlHqaXKtctbYmP4Bx4+5xdtaudxWDr9MMU7
	 TxwSKLLw6tJpiekQaarxzR+l8L/KuB9ypB4Vb6pRQGo7YCvL083JCl0EnTPawAXs+mHSw
	 PK1/VLF+iyNYjHwZvsaNslEtoES2gz6bMRWlYhmWpcHYsZE5We3yNQoSV+MlI10ndJjgR
	 WI3xPiazX7V55CL91EggBfl8LMxzw8crLlKZpX2j+NkpRpjBdv4jp1f3ZYj1hhbwmqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Pi1jAnCQ;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB7606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BB7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Pi1jAnCQ
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c2fc03880so19480086d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792787985; x=1793392785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7bVxjxfNJMJ9ikA6qreYHkI8rZ5PEd2tPNtK+tsbm4=;
        b=Pi1jAnCQp/bNBCDhhH8yUcJx9fE5XrYU4vuPxRlJv9rxDppk0ltamiAzl7JDuUiIX1
         qkFAin9hMxWGsUEafR3iZkWYwKQdvogopSv09S8uZiu3di0UOv5I23nt9xI/kK7jm4rN
         hYTulHmunI4CtSdYI34rbrz3h6Bz+gt8Lku52dr517dvo+PwWb940nPI7q2/vR9EPusV
         sGxUnE4OM1H1c1+YZpCyOxANrxfy4/hSjSQeGjHErrth4P/dgdou0vubBAPGQ7KBuPSX
         o6hWFSz+nFCoy2q86y13p32RlrmqCKTZhqUexO5eavtrUteqotE2iIelqbY8rSIXfICq
         2O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787985; x=1793392785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7bVxjxfNJMJ9ikA6qreYHkI8rZ5PEd2tPNtK+tsbm4=;
        b=qa7Q0chWYIwVZxoCgNEBsNqRJl7xcqTY4TSCISkvRNm1TOpy7jDEVn4qtjKHyyn/U4
         CO5tmpMMpU/JtIBVT6oKlx+Wl+UTBxGbfZ4gS7x/lnq/TkS1/fAMu5zPCPXpxwFLJCPn
         Jqw49eZ5AxmLCJuX635rPm02LeIiLwOwtGby+aZ7nyo2wyqQ2PoMTbT6Z+GnRYB9lVgV
         TX7PRJCdVZ/IKECx50KXiLt51OfZjOxiha4bV41u5ptCm8ahBm9COsYo1v9kXAn4+1zQ
         7Nh3Nlpu6DlOwTPkzMLkywrcXxmMkMyShrchrmpOfi+M7vOa2psOf2pshfd9WfHZRyxP
         MKhg==
X-Forwarded-Encrypted: i=1; AKwUvBySANCY0S9X0rA3AvAwiOkY8e0RgLFjH5LBgvCfnr9JPTkN14OZYiJV5HIwGPdZC61AmelJMmUs4gw78qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNcttLYD/qtTAZVRzpO8TSnR3W8BNaNPlKYQn1ZsMafdpVkBU1
	+G8NxxQgtnOmgVzKNnuFrtHMS7u7bidLkIiv/RP0TY1giBkN8NJxj17z51/DU4w7fsS8G4eACNb
	rjP10CR4=
X-Gm-Gg: AYBFou29xGEBoWdurOQRaDuz2swtZeavnTEuQVuRmb7xloyadrvfCnEhKLg/KACKwJb
	0zfLh12sPsivSsPCS+N8wE5/q5CVvFzT+RqdtQfbcutyYNhNtXKrYiLPJzK8ul1+SE1gYp+ytLd
	gMZBaXeJfsEVGbyJQPmJx/j3maJ/L7LfCmKA8p8pDzwyVytrj/XMPIPB1tinCLvGjp3R+hiNn6P
	Sxm9gwoDfE27ZBkmaHQB81IZRNFGrLCt90wqg24+93hmUOG1Q9z601aJIv64/dA89fxy30HgKkW
	GEd+1kUcfXH1mlwpZw8xD9vevZRWAOxEC4LicXsCqW5RqZT9ASMYQ2gFdFed9O+PFJRazJeBQNP
	G0sLfiIGeFXOx8Wz+DZ4VRpzyuI0iqcG/MAU1AIHIs1Lu7GaWgmptQBo+Fvo0MN8bllFXmwlOAX
	truRqQgkIf3uywxbsEpmbS8+xBH+pOQDsN7p4hGfql3kJoTTGk2UHzIjb3G2vgf5wIas3tbN80V
	cKpSX6LSOXHZ+q71tyTuKky/H+8EtDpB3VwR3jbrfKLrkTo0aP8FQ/z4MmZotbJj0xkPJFP
X-Received: by 2002:a05:620a:2b83:b0:93f:1600:481a with SMTP id af79cd13be357-940efa11fefmr22310885a.5.1792787984882;
        Fri, 23 Oct 2026 13:39:44 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a912d5sm2143785a.40.2026.10.23.13.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:39:44 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 23 Oct 2026 20:39:30 +0000
Subject: [PATCH 1/5] fs: make syncfs(2) killable on s_umount
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-s-umount-killable-v1-1-844a341ff1df@toxicpanda.com>
References: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
In-Reply-To: <20261023-b4-s-umount-killable-v1-0-844a341ff1df@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792787980; l=1241;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=9tTHvzdIGkeCZRT40x/w5oXKIY3j5URO5x0Y7DuGFv0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDNM2h9XGKfC52ZUUVpGP87Zjrw09KIERumqmEPJ8TNlGZLvunsB/mC+Y3PnmmAU9T443/8lscB
 46rwKu2/DRQY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A syncfs(2) which has to wait for s_umount sits in D state and can't be
killed, for as long as whoever has the lock takes.

That can be very long.  Another syncfs(2) holds s_umount shared while it
writes the filesystem out, which on a slow or dead device takes forever.
That alone doesn't keep other readers out, but as soon as somebody wants
the lock exclusively, a remount say, that writer queues up, and every
reader which comes after it queues up behind the writer.

Taking the lock is the first thing syncfs(2) does and it can return an
error, so use down_read_killable().

This only covers the wait for the lock.  Once syncfs(2) has it, it still
waits for the writeback uninterruptibly.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/sync.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/sync.c b/fs/sync.c
index 0681bfcb2da6..ea54af59cf4a 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -156,7 +156,9 @@ SYSCALL_DEFINE1(syncfs, int, fd)
 		return -EBADF;
 	sb = fd_file(f)->f_path.dentry->d_sb;
 
-	down_read(&sb->s_umount);
+	ret = down_read_killable(&sb->s_umount);
+	if (ret)
+		return ret;
 	ret = sync_filesystem(sb);
 	up_read(&sb->s_umount);
 

-- 
2.55.0

