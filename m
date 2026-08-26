Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB5146983B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761286; cv=none; b=q64/lGe8bEzpZPbWY7UoTk+IICFsoozswMOivU5IJRdQyzb29y/hLC3aIQ+jODZXJZw4LImG5AnrsKNVOJ/QgiGp7qyRct1ISjZ9kTCJ5n4+ttVtgH3HZUVM7kK960EfItc1wyz4NOROTLpiDlbbKCj5kySuatkuOlnznTMbdEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761286; c=relaxed/simple;
	bh=pvjWpnlTdBZKx5UqOCq9/dEYrGv5OCu+9mtstfD1pFA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JKeFIWz0wFkURr6B3SNjtsH/h9fcsmtoAgLuzUfBuCu3c+iH9bM7EVsWVIl1daTo75kiOvv8MNvbBDlCCf6kvH+NeowqdrBOYDKVMlN+WM2gUO6NnFfs3oU6jDR4OVinECj0KlwEdBb5Ka/0OdKiUAs1qr5ztIvMzAWNW+Ha/NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVQ7iyD2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVQ7iyD2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceaf8a1265so16131545ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787761280; x=1788366080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/VxaBSyrAp2V1JuGfOC1NLa01pzB3ApfCB2gfxG+kg=;
        b=NVQ7iyD2jeGIpRsm1FJtEPzmfezADQch930PPya/IK6VEsIO2zl4I82W6ul6Xb6nXo
         EtFF4tTiyIi/jNTZdVYCE+uh0SxdBxJY2Zb8z4mWzZAzGXxGzr1qHOwNDDJ8Ctx9rwWj
         K3eXFRM7tjiTS6yliz0EwwOcuvmhaKdepaUx6m99H36KUqNQdlRMuXImCRZNvp8S6VZC
         zQMUbWBvP6f/JfUCdAWcHkr21bM9doH+rFqrV6mMUfav4/kbT8BizPdQWotpd+9TZnCr
         C2BqPgT5rf9wNyOyuDHH0u0YbWd944ZD+O83dnRqgOVxDyOHi9svquv+JxIzYEbbD6vX
         SC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761280; x=1788366080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9/VxaBSyrAp2V1JuGfOC1NLa01pzB3ApfCB2gfxG+kg=;
        b=Ut7MmkKT1t0YKbrtOJRZ0MZ2sZ/NfABWLDPsu+hHzw2JjRiCzLvHFS9O3mfd5Lh6g5
         Ot9Jfo2JfjWTWLImCPXyv49ZwfK/NP+m0FkpSdU+I7ZKUejIF+Z4Oh2M3F88sMDDfD8S
         fYMycPsoAd2ZUnE15CinkUfeBmZaDjEiqY3J9ZcszdcC3nNGTHaiWPHYQFIm+IcVOzj9
         nRaXHEQCFfckq6LMYiu4QvmIpqwa9ZrAIuF7NDq3KN+Bk9se5RqyYiZOjjY+33+EZrzv
         kK+tXBeI4r+E2nwngnq688fhHGrdBOQL2ujIe1X3diK8rPLP/8qDnxXNLPtf+2z5mpl5
         MGHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1JK8EdvJ7auJiJy1/ZopuzMAxyF5ggXLUaFbzvb9m6yXSKJGFKNZmzlFV3SDAxKzB88yOnkucE04dmus=@vger.kernel.org
X-Gm-Message-State: AFuF++kqUirFnxIsKnHUmZMKJJeubymNTbq36R1jEyF4sMJUSNIAjmKY
	CuRfEgv5tgPNEbQbVhMuzq/OZ9kxfMtEpUFUol7JqjfV86/JRRBH1vLu
X-Gm-Gg: AR+sD12fa47zfoqmP2ALqfvO8cR56WAeILfitBZpzt1qnvB2tTOZ3CLhJlCIWNYv1d9
	cFPT0FfRDjhQs//T8dL+RVdj5nMiPPnVdi3nrKVxaL8/QMyHIiP2R+XFMXamh6B+EXzBQdAu8Gv
	3hL2Hm9IUibcZg5pOsrD4cFjllt//hlNYWyrVFeLxetY8JTUryVUxt3jJnh26XB9vc/8aCveOKS
	VPAjtd861PsEfmUF5l0GvxvnZIJO0Kh2dDwDLelNz+4otK47ETeOvNiY+cXvQ8vnJcELWCKzYoZ
	cqVbbsk+tu6bE4Ybg7VUcFHkYOQ+T6gypKNuVulgtj+VtXCErDhrj5xnvhsAoFQYK+AX9LVoRzJ
	oejA/xAnC6YG1DNM2mb0ttk4a81Kaod0h3SBDtr1Qsp/zjrCK5/6kAP2+fXV7uuYC4KL2IIdvD+
	DdPTxiRJxhVF2vxSXLiKy87H8+5sUD+T6yVWr8qxHboUx87FBwXUCctReyEf3Pwrufc3LI6SjBJ
	fkO+O1w54Fn6/TXCIiWncw=
X-Received: by 2002:a17:90b:554c:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-3966d1396famr18305322a91.1.1787761279828;
        Wed, 26 Aug 2026 09:21:19 -0700 (PDT)
Received: from localhost.localdomain ([103.210.91.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396689f1419sm4660649a91.9.2026.08.26.09.21.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 09:21:18 -0700 (PDT)
From: Khawar Ahemad <ahemadkhawar123@gmail.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	syzbot+aa48b5fe7bfda62d1682@syzkaller.appspotmail.com
Subject: [PATCH bpf-next v2] xsk: Fix circular locking dependency in xsk_notifier
Date: Wed, 26 Aug 2026 21:51:10 +0530
Message-ID: <20260826162110.99879-1-ahemadkhawar123@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a circular locking dependency involving &net->xdp.lock,
&xs->mutex, and netdev_lock_ops():

-> #2 (&net->xdp.lock):
       xsk_notifier
       unregister_netdevice_many_notify

-> #1 (&xs->mutex):
       xsk_diag_dump

-> #0 (netdev_lock_ops):
       xsk_bind

In xsk_notifier(), xp_clear_dev() was called while holding &xs->mutex.
Because xp_clear_dev() acquires netdev_lock_ops(netdev), this created a
nested dependency of &xs->mutex -> netdev_lock_ops. Combined with
xsk_diag_dump() (&net->xdp.lock -> &xs->mutex) and device unregistration
(netdev_lock_ops -> &net->xdp.lock), this formed a circular locking cycle.

xp_clear_dev() operates strictly on the buffer pool and net_device, and
does not require &xs->mutex once the socket is unbound by xsk_unbind_dev().
Both xsk_notifier() and deferred pool release are serialized by rtnl_lock.

Fix this by capturing the pool pointer under &xs->mutex and calling
xp_clear_dev(pool) after releasing &xs->mutex in xsk_notifier().

Fixes: 975b11ae9077 ("xsk: add socket allocate, create and bind")
Reported-by: syzbot+aa48b5fe7bfda62d1682@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=aa48b5fe7bfda62d1682
Signed-off-by: Khawar Ahemad <ahemadkhawar123@gmail.com>
---
v1 -> v2:
- Resolve the circular locking dependency in xsk_notifier() instead of
  reordering locks in xsk_bind(), avoiding ABBA lock inversion with
  xp_clear_dev().
- Preserve user-space errno precedence in xsk_bind().
- Reference the correct Fixes commit 2495b430e382.
- Link to v1: https://lore.kernel.org/bpf/20260825152152.86092-1-ahemadkhawar123@gmail.com/

 net/xdp/xsk.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 7855ee09c4..c2f47182dc 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -2106,6 +2106,7 @@ static int xsk_notifier(struct notifier_block *this,
 		mutex_lock(&net->xdp.lock);
 		sk_for_each(sk, &net->xdp.list) {
 			struct xdp_sock *xs = xdp_sk(sk);
+			struct xsk_buff_pool *pool = NULL;
 
 			mutex_lock(&xs->mutex);
 			if (xs->dev == dev) {
@@ -2113,12 +2114,16 @@ static int xsk_notifier(struct notifier_block *this,
 				if (!sock_flag(sk, SOCK_DEAD))
 					sk_error_report(sk);
 
+				pool = xs->pool;
 				xsk_unbind_dev(xs);
-
-				/* Clear device references. */
-				xp_clear_dev(xs->pool);
 			}
 			mutex_unlock(&xs->mutex);
+
+			/* Clear device references outside xs->mutex to avoid
+			 * lock inversion with netdev_lock_ops().
+			 */
+			if (pool)
+				xp_clear_dev(pool);
 		}
 		mutex_unlock(&net->xdp.lock);
 		break;
-- 
2.54.0 (Apple Git-157)

