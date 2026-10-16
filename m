Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CD04756D8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155442; cv=none; b=tLIFdQqDkyzL0fMCTK1Tq7FI9LKxxjQEhea5X0D4GIyvB0M+k+1Mm76kMiw6Wr1Ed54JnkPelxhFYV1/oP56Y++y7yY3+0wAAnXZ7AQq6r5BY6xaDF3zFwUDA7LHNK5hMyCNYa9GinXl68FrehThyZORDXlM5q9s8YTeySir3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155442; c=relaxed/simple;
	bh=j5UrZfFEIwTmcLUdb3VBrKaIXdOJ8WrdKly6ZUvf80M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=beJ6ir6o25/2mtRHfswO5Ayq3wraAFuS47D/44Fjboc6ioSPl/AphfQJH0B/jhsGsoYeoPxvidCidkJyo3kfFvt43XXYD4bhef8CREsayvC7kjR/navcaMDEOEe2MZc6oa32qe44VdrBX7koQuP8C9wxjDNdwvGFjp+NfoDFOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4d2f0f77124so8380220b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155440; x=1792760240;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oawdeVDRMGK3EBK/OhJb+bmNlLnm4ng0pOWbAQVNbe0=;
        b=VD1L12hzBUQqccF/yZyRWSRbaN27ghynMxJ7anN6VGtSzHKOTteA23pgtQcwho/axe
         FJl0h8H5v10GW8l+slyuC36a0wbogIyPbWyLlC2/XETqSNAt2fBYxiFSjM9nUvhcX03z
         pb8tQHqBb3kG7NNqD2E07yEonJvj/V5g0WOIpYtW8DuPlWWdC6w5MuwBJBtxpWPEk+cE
         9/rGOKXnOnv2wWQgP9q4B//Wa8wTrYraOvSbcWERITZdqG/yvenqerEROibaV8j22IMv
         a507LxMoaXEwN/j1yS8j9t2T1sW59W+OLfKKE7FyJLkeSwuH9+KeU4XtgA6KhQiLacfz
         5ezw==
X-Gm-Message-State: AFq9FYKVDFRkfUQkESdCWxFuTwhnYpGjA59j4SADOhJhn1S7+SIdWRJJ
	efx8DGb93MCT9uoYts03LxFlp3lNU7um4Lg1x9Z6F39LlU11TDmNHyE4UjpIrpacItGYSvuUVJS
	JI0szwUoThOZbAM9Fr/hbSzOKg5Ey2Yx0903u0uCUKINdQI7LL1nqE9u7m/w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a21:b0:4f5:c4b9:dc14 with SMTP id
 5614622812f47-50c4dfb8c43mr17449848b6e.13.1792155439859; Fri, 16 Oct 2026
 05:57:19 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:57:19 -0700
In-Reply-To: <6a57ad78.9d83364e.246513.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad21f2f.7952420f.283480.023f.GAE@google.com>
Subject: Forwarded: [syzbot retest] llc: keep SAP and netdev alive during
 timer shutdown
From: syzbot <syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [syzbot retest] llc: keep SAP and netdev alive during timer shutdown
Author: miguelgarciaroman8@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e

diff --git a/net/llc/af_llc.c b/net/llc/af_llc.c
index b0447c33d..e34d1e7b5 100644
--- a/net/llc/af_llc.c
+++ b/net/llc/af_llc.c
@@ -196,6 +196,7 @@ static int llc_ui_release(struct socket *sock)
 {
 	struct sock *sk = sock->sk;
 	struct llc_sock *llc;
+	struct llc_sap *sap = NULL;

 	if (unlikely(sk == NULL))
 		goto out;
@@ -207,23 +208,21 @@ static int llc_ui_release(struct socket *sock)
 	if (!llc_send_disc(sk))
 		llc_ui_wait_for_disc(sk, READ_ONCE(sk->sk_rcvtimeo));
 	if (!sock_flag(sk, SOCK_ZAPPED)) {
-		struct llc_sap *sap = llc->sap;
+		sap = llc->sap;

-		/* Hold this for release_sock(), so that llc_backlog_rcv()
-		 * could still use it.
-		 */
+		/* Keep SAP alive through backlog processing and timer shutdown. */
 		llc_sap_hold(sap);
 		llc_sap_remove_socket(llc->sap, sk);
 		release_sock(sk);
-		llc_sap_put(sap);
 	} else {
 		release_sock(sk);
 	}
-	netdev_put(llc->dev, &llc->dev_tracker);
 	sock_put(sk);
 	sock_orphan(sk);
 	sock->sk = NULL;
 	llc_sk_free(sk);
+	if (sap)
+		llc_sap_put(sap);
 out:
 	return 0;
 }
diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index 260460d50..2ad5a69dd 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -942,10 +942,10 @@ void llc_sk_stop_all_timers(struct sock *sk, bool sync)
 	struct llc_sock *llc = llc_sk(sk);

 	if (sync) {
-		timer_delete_sync(&llc->pf_cycle_timer.timer);
-		timer_delete_sync(&llc->ack_timer.timer);
-		timer_delete_sync(&llc->rej_sent_timer.timer);
-		timer_delete_sync(&llc->busy_state_timer.timer);
+		timer_shutdown_sync(&llc->pf_cycle_timer.timer);
+		timer_shutdown_sync(&llc->ack_timer.timer);
+		timer_shutdown_sync(&llc->rej_sent_timer.timer);
+		timer_shutdown_sync(&llc->busy_state_timer.timer);
 	} else {
 		timer_delete(&llc->pf_cycle_timer.timer);
 		timer_delete(&llc->ack_timer.timer);
@@ -978,6 +978,7 @@ void llc_sk_free(struct sock *sk)
 	skb_queue_purge(&sk->sk_receive_queue);
 	skb_queue_purge(&sk->sk_write_queue);
 	skb_queue_purge(&llc->pdu_unack_q);
+	netdev_put(llc->dev, &llc->dev_tracker);
 #ifdef LLC_REFCNT_DEBUG
 	if (refcount_read(&sk->sk_refcnt) != 1) {
 		printk(KERN_DEBUG "Destruction of LLC sock %p delayed in %s, cnt=%d\n",
