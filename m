Received: from mail-ej2-f16.google.com (mail-ej2-f16.google.com [74.125.228.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815948D890
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587669; cv=none; b=JI7wmwf0f6ZbgyyMyaMheTTbV4zqNC8mcjPOXcdimDJzseDWWrPuA9Y5enpLfhgoXVbHu8rDU2LIfIf/sK0BHjvi/POXNM4tcoVT8osGnFUJeOUw/3R+kT098Ngw+O62B0EQkoNdBGvpZXP8ZiemQlPvE4VyJeroIy40apIlHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587669; c=relaxed/simple;
	bh=/PV8bkEcmNLE+ijOGsRCg/0RHzPtaUQOaZJFKtUlBvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgwUccW6BrKZynzqp94cCXpzSnsfi4z2XvzupvD9Em8OezTqaAUKYSymFJwqBsBKiPAsDBb1h3YE6ql7t1QL11j55GALwvmdtSxYBgSxAMy7YJa6E8wmAqu/KItk99LKItX5PXjU9PQbA204ubvYgnC7c9SgJQvfYw7BzLeqVvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=UQS7l9Lx; arc=none smtp.client-ip=74.125.228.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="UQS7l9Lx"
Received: by mail-ej2-f16.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so241592166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1790587661; x=1791192461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPNufo0xGsOqd33WmAs2+EzxZR69r3CqEUC2DYFiTqk=;
        b=UQS7l9Lx14ZlyERjb0GQR0GSN9fmt3dYNxS90q76ZlA4/jpYD5O/la7zoeX4K28msa
         iwnbcXdnuJzwO7NpQLvqZE8Qp7dX2VUW68TR+NrKz9z2uxJ07W/d/c/0TLcf4v9jmGAM
         LWacF5A5nSBxjF9ru4YB6dBG4jcdb6pN4qxeU5XX/yie9Yhu0auWEnpl726RUXB3XVLY
         9zbMbfcHVAhscQ5f6YeQB6Nh3jyVajUzLACedexMW1W69tofrLUFL2cYz627WHQjh9GV
         BRyFnm9kGmH3dAsUp9iMzkat7G5opkhzLv3OQuGkwei4wnnPGqsfAdW6Fshy0ffz4CF7
         Sa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587661; x=1791192461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPNufo0xGsOqd33WmAs2+EzxZR69r3CqEUC2DYFiTqk=;
        b=l9xsXMPxIxeAzqi4E4Gc36FqOzAUO1KbKN2nuHR6GV9PBZwQ0WRtcTNJEG9y+Iz66i
         UuMT2rPKoI+aGHRdvmWIHNt4OUsPluMllQgYoAuL4J7HZq6iph6lB2hAxHdLPFq38MHI
         Uu5GMClDeTPEHKts76awKFzCFDmQ8ap45fRMklTvsDWRsPN37qyDYK20dIm2/jrqMiBl
         nkJIpboBsmb9uH7nPAezE5eN5PUVNPzuybo1KjVppgZtet3KJ/5GNwEwgZNuvhfqRyvZ
         2xexHtLBbhCxLTYoc4FTPxP3LcUhUhC1kvfu46KT3okGbMzbKrDpy844nHsjMo/jYOqd
         K2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmbaHWceJXt3Tq0EbTa4j6t25IE1zNRI9BW4nKhit2qBRULxoJk0YQkZUbO1xIeDs6HkGyha15bb0Wqks=@vger.kernel.org
X-Gm-Message-State: AFuF++mD+zoKml3Vz1HPG14nBwS5861dx6BsYgKNo9eAS45CzIQfQ+lf
	bY0GJzdGdnf1TUoYWpTvBbMvrCWAMv/tCal0McUufgwNCRlkeYXHqF4qkoh8mAokBjkF
X-Gm-Gg: AYBFou3PiACcvcnI5r8Y+3zD+ABOQo/h+dSHMacmeO60qLZriNshutnRh0oe5khiKK1
	r7jn4qh0FN1KAt59UCy2H0wXQ88J0gE4fsKJkBEze9CpOz6nLVWfQXgeGO0lJfaBV6tzhuvzChZ
	oa/sOs4wNLMA0sTGfxpH3lHIN3MZRWWX92vuh3clBNMpc6p7TgJcoW9fSqSJlO8KQMkHDlsBXqV
	yxzier0stsZrKZ5htWcmTBn48dv1dztgwj5oZfYu2zo+fHO+PBNc26V0y532thWmRzjWUTcRnqI
	VuWRG/xEGDxnwsHVEgm2pViR628j3jWAICkyy95br/RcQyRGEosQeZE9aXX/SCmUGb8PfCgKP6r
	ypt4yP2BQO3FqfGqbHqFHl5IEft8jLfQhcrAuV+mtftmWnlX07R74BiH7vZ5UHoa1otCmCHuKqN
	0FaJYYC+meAIj5AAggsKLoFymFeesuiaVX+euRdVmetou8ghM9n4YFwEuBhDAI0LMp4mGdqtvoJ
	06aGrADxbaVKFQKJ99dYYbotG51DWlV+B879MuD6w==
X-Received: by 2002:a17:907:1888:b0:c29:4513:f6fd with SMTP id a640c23a62f3a-c2ac24fee36mr999083566b.35.1790587661570;
        Mon, 28 Sep 2026 02:27:41 -0700 (PDT)
Received: from [169.254.24.37] (tmo-085-169.customers.d1-online.com. [80.187.85.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc8b71b4dsm205609466b.1.2026.09.28.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:27:41 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 28 Sep 2026 11:27:13 +0200
Subject: [PATCH v3 06/10] af_unix: record the pid of the connecting thread
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-work-unix-passpidfd-v3-6-532018a91b21@amutable.com>
References: <20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com>
In-Reply-To: <20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com>
To: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Oleg Nesterov <oleg@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 linux-fsdevel@vger.kernel.org, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Andrew Halaney <andrew@amutable.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>
X-Mailer: b4 0.14.3

From: Christian Brauner <brauner@kernel.org>

Currently only the struct pid of the thread-group leader is recorded.
The identity of the actual thread that connected to a given socket
cannot be retrieved.

Add the plumbing to make it possible to retrieve a pidfd for the
connecting thread. Nothing uses the thread-specific struct pid yet. No
functional changes.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 net/unix/af_unix.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 66a26a10871b..634db1b40ecb 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -743,51 +743,47 @@ struct unix_peercred {
 
 static inline int prepare_peercred(struct unix_peercred *peercred)
 {
-	struct pid *pid;
 	int err;
 
-	pid = task_tgid(current);
-	err = pidfs_register_pid(pid);
-	if (likely(!err)) {
-		peercred->peer_pid[PIDTYPE_TGID] = get_pid(pid);
-		peercred->peer_cred = get_current_cred();
+	get_task_pids(peercred->peer_pid, current);
+	err = pidfs_register_pids(peercred->peer_pid);
+	if (unlikely(err)) {
+		put_pids(peercred->peer_pid);
+		return err;
 	}
-	return err;
+
+	peercred->peer_cred = get_current_cred();
+	return 0;
 }
 
 static void drop_peercred(struct unix_peercred *peercred)
 {
 	const struct cred *cred = NULL;
-	struct pid *pid = NULL;
 
 	might_sleep();
 
-	swap(peercred->peer_pid[PIDTYPE_TGID], pid);
+	put_pids(peercred->peer_pid);
 	swap(peercred->peer_cred, cred);
-
-	put_pid(pid);
 	put_cred(cred);
 }
 
 static inline void init_peercred(struct sock *sk,
 				 const struct unix_peercred *peercred)
 {
-	sk->sk_peer_pid[PIDTYPE_TGID] = peercred->peer_pid[PIDTYPE_TGID];
+	memcpy(sk->sk_peer_pid, peercred->peer_pid, sizeof(sk->sk_peer_pid));
 	sk->sk_peer_cred = peercred->peer_cred;
 }
 
 static void update_peercred(struct sock *sk, struct unix_peercred *peercred)
 {
 	const struct cred *old_cred;
-	struct pid *old_pid;
 
 	spin_lock(&sk->sk_peer_lock);
-	old_pid = sk->sk_peer_pid[PIDTYPE_TGID];
+	swap_pids(sk->sk_peer_pid, peercred->peer_pid);
 	old_cred = sk->sk_peer_cred;
-	init_peercred(sk, peercred);
+	sk->sk_peer_cred = peercred->peer_cred;
 	spin_unlock(&sk->sk_peer_lock);
 
-	peercred->peer_pid[PIDTYPE_TGID] = old_pid;
 	peercred->peer_cred = old_cred;
 }
 
@@ -796,7 +792,7 @@ static void copy_peercred(struct sock *sk, struct sock *peersk)
 	lockdep_assert_held(&unix_sk(peersk)->lock);
 
 	spin_lock(&sk->sk_peer_lock);
-	sk->sk_peer_pid[PIDTYPE_TGID] = get_pid(peersk->sk_peer_pid[PIDTYPE_TGID]);
+	get_pids(sk->sk_peer_pid, peersk->sk_peer_pid);
 	sk->sk_peer_cred = get_cred(peersk->sk_peer_cred);
 	spin_unlock(&sk->sk_peer_lock);
 }

-- 
2.55.0

