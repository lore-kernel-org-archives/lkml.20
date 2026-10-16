Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4AE40BCB2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153641; cv=none; b=rwOA0Wv/WGysAgxXzjvEzItbD/iI2yDW7AGkbrOKynipEFSDNLMDXqWSEn59xGzgwrELuDadD8pj7QuYwa4mcdrkhYRzVJexq4SvpYhSB5rGjfk04GenOuoCvbqtiDAwbl51XqdvJQKjlYQmZNSNENgQW212d1n0ol/4SDfIb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153641; c=relaxed/simple;
	bh=UdH3bYYiu/DW8AOa9cSct/M0dzuL7pmIz4c6cxyO43I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IZXx95+OzYlfqBwt0+VT4a/ax2BPcom5h+Ash+gyrsnyQKZu75PO4tnR9MeLGNbwUysQS+VbpztZYyccTZjuJ7g+3v1Iehl1BAvZuOQeN8h2PPRopJP3vnG3dofsEkqurdIhrdl88yrJJQQxcRAnA6MIvZ3NTRNREI8NMYGm0ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-492f39f29c4so7977047fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153639; x=1792758439;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H/ShnoktrueM/dvQ1kOlPFnDW6NUg0YB+mAbYz4x2hw=;
        b=xrwLcn6aM7bpO6KOx7cmLWmcqhJWqsXq9CWa66hvKwRbQ04jDjruBLrXnqzVlJA5PI
         EVZBpEK34e4jITHKrYupbBrFjK6lVriST+0UITGXdQICFcl8kDF+VJgEM0nYGMHFuYoq
         ej0iRIzkyDCer68C9nXByWZHgR3sxZhhDGaYUc7srPzANa9eYNh6r4xSG5nleJk2sbbY
         rKM0/tcGMu21Cx151AYCpjWWNaDk7z7sObCtfDVM3GsRnLYkXADeXi2cRCs6XNdTwGsx
         PyfOBreyPM6tLbrrdcJ9CO8Kwi1UTRiV5p4qBXJhtesnhHmpLkOOcSP70v3zNB0iYCBM
         2Adg==
X-Gm-Message-State: AFq9FYKivhg2Se4c6I5y63BW64gdMYjzEkHbEaolp8k56XzlXjJBdY2v
	LdSLLQRpCUhQoE1EerQzS8mAjaJKMQOCBldacFUdPm6SZqi6f7aDrRBybyuhu72DJWjw8G6Ikxb
	GNYrNa5n53sJSB9r+kxXhTkpqrjEpurFsGMUjKfwVfmQeUyE+KZvVx5eCSYc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ecb:b0:4cb:f21b:6f8e with SMTP id
 5614622812f47-50c56354c13mr19568659b6e.33.1792153638929; Fri, 16 Oct 2026
 05:27:18 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:27:18 -0700
In-Reply-To: <6a57ad78.9d83364e.246513.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad21826.7952420f.283480.023d.GAE@google.com>
Subject: Forwarded: [syzbot test] llc: keep SAP and netdev alive during timer shutdown
From: syzbot <syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [syzbot test] llc: keep SAP and netdev alive during timer shutdown
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
