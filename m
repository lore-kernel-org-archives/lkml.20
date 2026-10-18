Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99B47125E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792323205; cv=none; b=H3F6WOYVZmDcEMqYyPbXnk9sjic+T4jRp6egp8UR0nd2TA/O6GepL5tAZMtX21cFslfMR7sMpWqY8fzUW25VXm5DeYnwMr7tK55grup0GVvF3Oe0qyL3UVQ0xcbinr4KhEdtLpyQfZxurjazAXBvh6OVDe4e5XAacXTBokk3UUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792323205; c=relaxed/simple;
	bh=HQcatveyDyajpFL1UBpeC4RAkhS4VBszbXSkpzNqt7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tFyhrwmOZf4BUs+6ri9nPBglFarbyDzQ5FXCDjc4T34Fy/OO698mkwUj4YN2T2Zeabgs8fZIKsutlDDRDK9K7QNTIfbfkFEq0/P0fmI+Lg6O/k60FdioQudQNZf93Kuzkhw6E4bGrOnHIlQAcX/sf/xmsQsHMNvJOtkLVCeCRBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwz2uCAJ; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwz2uCAJ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so1288861eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792323204; x=1792928004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrG8DE2Q475ATUWi0QswHMnHOV5W49hUQct/k6+wgUg=;
        b=hwz2uCAJSTxVRK2UAzuYHQu/0eJccsXBoOllbMoSbCofj0IYYwWISteepMCgU1ev++
         d3utarnd0GuU5cvnFFAgessemGeMbhvglAx7ksSeANG6T9nevIkEYOUNQjTBYWgvLXgz
         t1AsILD16rMKddbpCEbH7dhbk7RyVAa6OKJ/lA6zI0FaJ8vth6ukokvK6jrJhOKLRSK/
         GlmjzWA8Mt/s/KsXgyPgsh9ZRosS/gj09XQsrQokWAbcs2pzJVdYtdmux1YS+uFG8zYM
         uF2pBkGMq1Ykpe5bD0VCo4sgQTT92BIo+e3SajJx9Q3EtKU8vc7lcdL8EIFHcrmFYSrq
         0EiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792323204; x=1792928004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrG8DE2Q475ATUWi0QswHMnHOV5W49hUQct/k6+wgUg=;
        b=Cmd41y5MWWYU1pDyOWFCtsDPdQcsug0eKQXBFsgZAuRzTe7xW4YtkDP0UFU6sR0vh8
         YGWuhb4bNVlDYpDUI/okaI94UfCPZ9b9gO8kJvSKKfg3SxU2qcH5e/2a6xtlJix8DcV2
         eNwKhBojsouJoD+bWl0+6xdHR6wAh/ZatsubF/dp2KTzOj6L3SztJ6yqsFRomE9RpvEH
         tRcU5iPIeyb4E4HfO7as2MOztbjUVzu76qKEzedC85CspzfNR+ETW4Vz8f2nzdDEC60c
         6RC8tUDfl+pZBAdTYTTIYsrmWKww/k9WmoeYBjqK0dkk+WtHRXaarj8rISFXlG8K7k8a
         Cymg==
X-Forwarded-Encrypted: i=1; AKwUvBzFeoj9SHn3hyTupK2Gvfe+gQ1uAFqevwKHe7Z57lgfcNWYQujUPszizislBheoeMI5YjrI3XdSvnqoKaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlVLPjnbUQWAoZdStEjx+fhL1AJQO8jwVcVv0YQEIAByzvDStv
	ADgRAbIfw4TKfOAsNpdKJgcj3FdydMcRjYMBejHuzeX/XAlYvHknsCor
X-Gm-Gg: AYBFou3uWHojBTmk7FKWBgH7+m8jjIW0l2e/VJAc3Lthf6tJqQx6tLEXXiyzw0ZVTi5
	6mvdt9OxTz6bpbfquDjhPCzpJDDIypWrpnd1vaT9wxtr44cw8jgQHDVESq0Momcm01BLBtlcmra
	BVk9ANATiUl9j69E4t2Fthxbp8oOO7rQUUwO3D6/KR5d+qb/lpOD2tzOl+8+XaDs4M5xVu9kMLH
	bthIfnzWKtone7y3wgo6jAwYews6MJBtrBRpYpq96ktqtZl3OmO7QLtk1JQwSEoaFuEdoEK+god
	fty+W1X3iiCvkNPn79vCm///B+RCOWXy4TZn68cUMcbWLRrz9sA/9Mxjf+GFHVtMKh6JBUlRS27
	je7/EMKEODjD5tIcPlt2SVPsNKkLa8bPmZtJ+vBNmUQp/ef48eju7890uiHYrQEG0LU15QsAXQi
	KRQKaHqGXd07DTZfH6GT9zzLT4UKyQsEZJeV6jCxcV53SjGni3TU+sVXeGKtNEFwftePRdRnGLJ
	OdTQW+LKnVoWzRn1hECxEHIoHNAXQzWDEKxLHSHrqWE0rmkMJ6y9eypuXHpU1Lx
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id 5a478bee46e88-361a341c8e6mr9786894eec.37.1792323203533;
        Sun, 18 Oct 2026 04:33:23 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:a1f4:8b77:c28c:48f5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm28859299eec.3.2026.10.18.04.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:33:22 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: cel@kernel.org,
	jlayton@kernel.org,
	neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com
Cc: bfields@fieldses.org,
	skinsbursky@parallels.com,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
Subject: [PATCH] nfsd: fix out-of-bounds read of sv_permsocks when starting a thread
Date: Sun, 18 Oct 2026 17:03:12 +0530
Message-ID: <20261018113312.10455-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfsd() derives its struct net from the first entry of
serv->sv_permsocks using list_entry() without checking that the list
is non-empty. If the list is empty, list_entry() returns a bogus
svc_xprt computed from the list head embedded in struct svc_serv, and
the following perm_sock->xpt_net load reads far past the end of the
svc_serv allocation:

  BUG: KASAN: slab-out-of-bounds in nfsd+0x118/0xbc0 fs/nfsd/nfssvc.c:894
  Read of size 8 at addr ffff88802d423f50 by task nfsd/5988

The list can be empty because nothing guarantees that a permanent
listener exists while a thread starts. With dynamic thread spawning, a
thread can begin running after the last listener has been closed and
removed.

Take sv_lock, which protects sv_permsocks, and check for an empty list
and read xpt_net in the same critical section. If there is no
permanent socket, report -ENOTCONN through svc_thread_init_status(),
which wakes the creator and exits the thread, instead of dereferencing
a bogus pointer.

Fixes: 88c476661719 ("nfsd: pass proper net to nfsd_destroy() from NFSd kthreads")
Reported-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=561b859d032c8bf2fb53
Tested-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/nfsd/nfssvc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/nfsd/nfssvc.c b/fs/nfsd/nfssvc.c
index 2edf716ea022..da6fce79efae 100644
--- a/fs/nfsd/nfssvc.c
+++ b/fs/nfsd/nfssvc.c
@@ -890,17 +890,31 @@ nfsd(void *vrqstp)
 {
 	struct svc_rqst *rqstp = (struct svc_rqst *) vrqstp;
 	struct svc_pool *pool = rqstp->rq_pool;
-	struct svc_xprt *perm_sock = list_entry(rqstp->rq_server->sv_permsocks.next, typeof(struct svc_xprt), xpt_list);
-	struct net *net = perm_sock->xpt_net;
-	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
+	struct svc_serv *serv = rqstp->rq_server;
+	struct svc_xprt *perm_sock;
+	struct net *net = NULL;
+	struct nfsd_net *nn = NULL;
 	struct nfsd_thread_local_info ntli = { };
 	bool have_mutex = false;
+	int err = 0;
+
+	spin_lock_bh(&serv->sv_lock);
+	if (list_empty(&serv->sv_permsocks)) {
+		err = -ENOTCONN;
+	} else {
+		perm_sock = list_first_entry(&serv->sv_permsocks,
+					     struct svc_xprt, xpt_list);
+		net = perm_sock->xpt_net;
+	}
+	spin_unlock_bh(&serv->sv_lock);
 
+	if (!err)
+		nn = net_generic(net, nfsd_net_id);
 	/* At this point, the thread shares current->fs
 	 * with the init process. We need to create files with the
 	 * umask as defined by the client instead of init's umask.
 	 */
-	svc_thread_init_status(rqstp, unshare_fs_struct());
+	svc_thread_init_status(rqstp, err ?: unshare_fs_struct());
 
 	current->fs->umask = 0;
 
-- 
2.43.0

