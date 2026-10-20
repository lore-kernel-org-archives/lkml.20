Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484114;
	b=E5YXpxwj1bWRp0WBScXbd/m3ByoV6SJcH3ZK7Ux8AQZIeCaPTrYOoJnFdiIbGvsFJ7Hj
	 ZOtgsCvl4YxEj5IaNceJln6tkqmzrf7W4ZknlU1gxrKFYmpkK6hEkYdVCf067FbbrGBJs
	 vBzvyzXsHSU9rf9gRxqKlmsrNavNaYqBl7FPMYJPvmcCcH3IeTpz6VLsYRTwRty69H6O/
	 0FIt2TaD43WfJcmJeONtmbRdy87VQUB5/lgU1DvOdpGYfD8bdBIU8Lmnhv9NSPKpWy084
	 OI8VBGNyJUUBiquOjpTHPRafchZKAneC37Yq6Ox4d2WoZ/5sN1rXNj3SzuFk0wbEomw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484114;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=GEUVbf3oqEM4uCjbPCl2y5E8Qea8UYhc/7nraDMaOEk=;
	b=43I+iu3kRGiHXBZQ+ZTJVOsqxjUC0/U9kJ38V1nZna1yacEozfQqxiW4OXdZAn7+Z0lf
	 ZWb55wRrbkTw/OSaxRwaN1852RhkD0w1a+0ikVzCwr3ezANkvg11xeV2RB1+7M5QKPOVc
	 oyw7q9Pb0EYng5Lmss3lonccRRnt3tJ4hiD6UDElNaQdG02oGzSHYVQjwRDcE3zREvCUk
	 Hmf6MsSMOyisKrI6fuDMNRBYZsHuh+K6n0a0IogK9OMeA/brApOttXDdUzcBjbSJ/juCF
	 yr4OB/Soy6B4K4TEClWuo0AJJd6gGO7hUFw4YZx+XZQERyu2hljU4WuM5/rhe9ZrZcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB2606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDB2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c467e19391so5383389b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484113; x=1793088913;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GEUVbf3oqEM4uCjbPCl2y5E8Qea8UYhc/7nraDMaOEk=;
        b=oOCuIr/36TkUouDIwEZBNjtK4rpRUAqOQ7x5X20KcCUeSonfzU5F03RujfPyD6MYVx
         qOHFF3LMNEBpR7ab9kQE0nV6vkuZKxlR1PV2YrVn3o02blwvv8C1wjdqOPaycUbfmMMu
         A+Fvao/OnP3FTO2egnQ+Tc3kb9jTy4Fg7mwlgUQhNK+EEevD23rdAk6W5akMoY9lU9Sc
         bk77SiaPp1sE8ha3n7cY/4T12yB0s3HblocKUUqwP8h++nWG0tixjTmH/bN36vU5yL8q
         6G+2tbX/WONeFcXK/ed7GzsRVm/7QiNJwy3qA3s/1cfPPL8xzW8JsZEwXVitV8+5ipRU
         8Fcg==
X-Gm-Message-State: AFq9FYK6Oi7p08JRk9ZSAlVH9JOjm+xUAYNHDppwQHUDL3kURHIIKUGg
	FZCC3ECXRQuyeABlgQChwVYRKfKUuq3l74CmOvc8oeAY+GHMZLec4fG451JXOivyNtYaSdkcgEn
	tUnS7y6OqYZU8j4pJX4vykaWB8UJoGr2PscRcNCYOt52ouTdsGVuRNbez6Zk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c40a:b0:4c3:bc6a:a328 with SMTP id
 5614622812f47-53ccca4217bmr7335237b6e.31.1792484113191; Tue, 20 Oct 2026
 01:15:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 01:15:13 -0700
In-Reply-To: <6ad3da6b.7f4e89eb.3d59aa.00a0.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad72311.b5bd089a.6b57.0089.GAE@google.com>
Subject: Forwarded: [PATCH v2] nfsd: store net in svc_serv instead of deriving
 it from sv_permsocks
From: syzbot <syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v2] nfsd: store net in svc_serv instead of deriving it from sv_permsocks
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


nfsd() derives its struct net from the first entry of
serv->sv_permsocks using list_entry() without checking that the list
is non-empty. If the list is empty, list_entry() returns a bogus
svc_xprt computed from the list head embedded in struct svc_serv, and
the following perm_sock->xpt_net load reads past the end of the
svc_serv allocation:

  BUG: KASAN: slab-out-of-bounds in nfsd+0x118/0xbc0 fs/nfsd/nfssvc.c:894
  Read of size 8 at addr ffff88802d423f50 by task nfsd/5988

Rather than guarding the list walk, store the net in the svc_serv when
it is created. svc_create_pooled() is only used by nfsd, so add a
struct net argument to it and record it in a new sv_net field, then
use that in nfsd().

Fixes: 88c476661719 ("nfsd: pass proper net to nfsd_destroy() from NFSd kthreads")
Reported-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=561b859d032c8bf2fb53
Suggested-by: NeilBrown <neil@brown.name>
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2: store the net in svc_serv via svc_create_pooled() instead of
    walking sv_permsocks under sv_lock (Jeff, Neil)
---
 fs/nfsd/nfssvc.c           | 5 ++---
 include/linux/sunrpc/svc.h | 2 ++
 net/sunrpc/svc.c           | 3 +++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/nfsd/nfssvc.c b/fs/nfsd/nfssvc.c
index 2edf716ea022..06a756d5636c 100644
--- a/fs/nfsd/nfssvc.c
+++ b/fs/nfsd/nfssvc.c
@@ -620,7 +620,7 @@ int nfsd_create_serv(struct net *net)
 		nfsd_max_blksize = nfsd_get_default_max_blksize();
 	nfsd_reset_versions(nn);
 	serv = svc_create_pooled(nfsd_programs, ARRAY_SIZE(nfsd_programs),
-				 &nn->nfsd_svcstats,
+				 &nn->nfsd_svcstats, net,
 				 nfsd_max_blksize, nfsd);
 	if (serv == NULL) {
 		percpu_ref_exit(&nn->nfsd_net_ref);
@@ -890,8 +890,7 @@ nfsd(void *vrqstp)
 {
 	struct svc_rqst *rqstp = (struct svc_rqst *) vrqstp;
 	struct svc_pool *pool = rqstp->rq_pool;
-	struct svc_xprt *perm_sock = list_entry(rqstp->rq_server->sv_permsocks.next, typeof(struct svc_xprt), xpt_list);
-	struct net *net = perm_sock->xpt_net;
+	struct net *net = rqstp->rq_server->sv_net;
 	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 	struct nfsd_thread_local_info ntli = { };
 	bool have_mutex = false;
diff --git a/include/linux/sunrpc/svc.h b/include/linux/sunrpc/svc.h
index 2db1b9ec5658..49a5052b2670 100644
--- a/include/linux/sunrpc/svc.h
+++ b/include/linux/sunrpc/svc.h
@@ -72,6 +72,7 @@ enum {
 struct svc_serv {
 	struct svc_program *	sv_programs;	/* RPC programs */
 	struct svc_stat *	sv_stats;	/* RPC statistics */
+	struct net *		sv_net;		/* only set for pooled (nfsd) services */
 	spinlock_t		sv_lock;
 	unsigned int		sv_nprogs;	/* Number of sv_programs */
 	unsigned int		sv_nrthreads;	/* # of running server threads */
@@ -461,6 +462,7 @@ void		   svc_exit_thread(struct svc_rqst *);
 struct svc_serv *  svc_create_pooled(struct svc_program *prog,
 				     unsigned int nprog,
 				     struct svc_stat *stats,
+				      struct net *net,
 				     unsigned int bufsize,
 				     int (*threadfn)(void *data));
 int		   svc_set_pool_threads(struct svc_serv *serv, struct svc_pool *pool,
diff --git a/net/sunrpc/svc.c b/net/sunrpc/svc.c
index 8297bad2b177..810c2db27fe3 100644
--- a/net/sunrpc/svc.c
+++ b/net/sunrpc/svc.c
@@ -481,6 +481,7 @@ EXPORT_SYMBOL_GPL(svc_create);
  * @prog:  Array of RPC programs the new service will handle
  * @nprogs: Number of programs in the array
  * @stats: the stats struct if desired
+ * @net: network namespace the service belongs to
  * @bufsize: maximum message size for @prog
  * @threadfn: a function to service RPC requests for @prog
  *
@@ -489,6 +490,7 @@ EXPORT_SYMBOL_GPL(svc_create);
 struct svc_serv *svc_create_pooled(struct svc_program *prog,
 				   unsigned int nprogs,
 				   struct svc_stat *stats,
+				   struct net *net,
 				   unsigned int bufsize,
 				   int (*threadfn)(void *data))
 {
@@ -502,6 +504,7 @@ struct svc_serv *svc_create_pooled(struct svc_program *prog,
 	if (!serv)
 		goto out_err;
 	serv->sv_is_pooled = true;
+	serv->sv_net = net;
 	return serv;
 out_err:
 	svc_pool_map_put();
-- 
2.43.0

