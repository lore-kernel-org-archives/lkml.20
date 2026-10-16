Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136212E266C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156581; cv=pass; b=OkQvg/sVbj+QNSYy2GRpQwSuObeOGlLIUoTY088KJNlFme2avMY0dnJwtssCEoiofeepMedTA+aK2oyobFtrMod7TjBQkCy37CV4haS12HcuuJZ5m2E9AJAvyk4g7X2nzMkrQ+lHH0wfndvGH3ukLawZlpJEnJDDR7J3o+ybh98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156581; c=relaxed/simple;
	bh=WxKFwcJVOeUaFHQx1ghUjglbbmu9mBiG4gBTht9gmmw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sHn6bdA4usCAJoMXDgCdphuE6g8zLQ/MKgzzX41vV2yikj8u5vIUby+jI3QXJZ7A9xQGfQgRRIenrKRYE+33gTzh62GxoNHEHPw4Jf95/zQ4MC0UIrlF83Ud5yTOtoWAYekuYYr91MWm6SrU+iUKGdrAVtxkDLA6NMTk8Uf9RCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia16J9S6; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia16J9S6"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7be536cd40dso169491137.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792156579; cv=none;
        d=google.com; s=arc-20260327;
        b=qL2lATcPH41tXO21oeck4EI69luy7Fj2UByXj5cKh3uLamznwDDUAKCN5mOk8sgQXb
         ww/rBJzzmmb5wEttvVTllV+rjdgwO/7fgn0FLjFKHW7KL9kdoNV4gLwXkAhOdHR7IHNZ
         cWiqxAWZ+KhExOUiR0GpdYIG5dyEAiMMDQtQLgwRRRMrxkViIIP2Z8ek85BCBw8ShyBg
         cbp2aZUR0iqghWeOw/uES0hUYRuwBL/Dh1m+IuptTjIKs+w1YTsW/FRzACj7BGnRIpl5
         CHegAPpJdoaqwL6Oy/8Lmfomnu/BuFcpnei7xZXc4c73WuyLkzNo3aCEb7P3tPNXfA51
         B/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=m34V2DPSJQMgJ0PsxVie6y4fZxdO2kQHq0+ZE0ltKgQ=;
        fh=beS5CA8pS+Jw7jgQQ7ntlqqx6mbFzR9zwTlUhHYNFbA=;
        b=fFU6R1bPi35vMBUtalTGc3WWci/OV54vAUrBGw9e+f2GOgDOQLrbUqX9emPF7AVyno
         XK/mEFnTwT6QuulLTJK6AMsNFx4rahXhDW1wy3qcVkAtmH5AUwgkVfkIhWvgveluk7ha
         /qar7DmqdfnxAW2keU0MG72D3zGlnrnK86EgB+ZIeHE0fw2osZJS7f1iqdKFPCZf4E7t
         p8MUrjyZR3Ckt8sJRiykx29yh2iVI7UAUTj2c4EOuoRfBQGWyz6uXwSz1mEtUbNiiYvr
         w7YFcAaS5+yjUFcfIWuO7AwBqmSlbp3cTMDrBCEUU1/VP0C1VE2UNgm+WSWvULQILNYD
         OpYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792156579; x=1792761379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m34V2DPSJQMgJ0PsxVie6y4fZxdO2kQHq0+ZE0ltKgQ=;
        b=Ia16J9S6fkXDxuyv039Zr7xALZiHFeXi51ANUxZKwtwrI0chmKm0d7xkW4WWMxweeP
         9n+OVNoQ78iirKGiMawIWirs5s94HMe0RsEyVpX3jqwbkLs8edfmkZb/NZwWvB8HFHfd
         xERY94YDwuRh5UaUAs4GQyNGpX+RgqRo6nTfx9TfHoOF2KAnpaws1mqh3U+2c4S9CWYO
         fHil0J9LXa2ZF6UMUINbr/l6kKRy4++gaAn/DACKgyEMBxSb6wrbbXI+enrOJC3uJQjA
         WIS77tcUf3nLs4AQY4GqroE32Hjl1mtykh1YfU3mhbv5a9Hss2gkUl5Es8x44nwgcATe
         vxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156579; x=1792761379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m34V2DPSJQMgJ0PsxVie6y4fZxdO2kQHq0+ZE0ltKgQ=;
        b=1tOgu/2qpQptfhhTLrjDvq6/vuo+fHYYxkU2Er3AQyffq1at6ryCKzCzPLbR6+GefX
         PqIRwRGyi6DKAwjNfCbjxbdqvxeoEtXQYNiG4f9HhVOsE+yOUF4qjE+JwyvS75rim6bG
         oKkj2PxcT+IZS6V8ibk6C1C/A1mSyAAyJxXnGCDmtGFeI3QM/V30l9tkWMTyAeOMiuVP
         BMFkSGAdNgfZs46vyBWpoGEsjlZCTISWpp2oolQ/DIHcfjS+cjVmeEMcKqYy+wAf5c0S
         6Af21ajzRXSM8vB3/1hYY0lbyUXXEEgTzSGIWK5/HPh0SEschfJ30Qy382Q3fpRjyNp5
         RThw==
X-Forwarded-Encrypted: i=1; AKwUvBwR//SxcNYZhZ0vBYlvn02qgqkt1maeruuG51R9T8Ueyo5b3CzLQD3Gj+cmw7CkzZ+z0MOMV19kYgujsSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ42Iz1vHdlHgy9xkS1zhKdN5SX1oWO61IW5qMo1gQWzFj00Fff
	86Y6jCXlS+zwpXKW/JX5GQRI/WOgsHJukAa8xRK1FGwfp7vWzWRC+h72gGgyTbkCUwJjpGTsvfw
	zALFv6tj4CD1zv0JXORHuJ7ZuPwwcldM=
X-Gm-Gg: AYBFou3v1nTzy021jlAyr09muiZfmraiuYruoz0WYxkQc6NjuRhZPqj9+ZcVdaWidaq
	baaIuHLn9WsE2D0B36VNxe1t5c8glf6VjLs3B62TzB91hn4Sp198HE+QcKH0Kw/KCChibPheXTU
	6CJ+72mdDhI6RTpxjK1RHaFJDU3lP5E/yx+pw2JlXnx5Bv52z0HUgEXdU26OjSlTiAUeCQGxScJ
	bEq05rnA7i/LWG1ZMptl+FSn6zOQJPcp3VpupcSDwL7Poff4YtF4N608f16s2exEFFTDc8BR6vn
	QFcSGb9QWBNYWX2z06DgVlg0mx9awG7lug3CRDw/FXlyrdX5C9Vm/SKMc4vtM5thw4SoZEzyOIj
	UyofPv36jH50A7hB/UNkOsU1bCflkllWIWTMPm8eYJw==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id
 71dfb90a1353d-5e9397db6b5mr5174161e0c.3.1792156578871; Fri, 16 Oct 2026
 06:16:18 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 08:16:17 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 08:16:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?TWlndWVsIEdhcmPDrWEgUm9tw6Fu?= <miguelgarciaroman8@gmail.com>
Date: Fri, 16 Oct 2026 08:16:17 -0500
X-Gm-Features: AclHuK8xJbV9fsv1Ej8XzXPH6zX3IbQC6Zj0JpmjQur27sv77M0ATC1K6PdxLXU
Message-ID: <CABKbRoJw5SOQH6ydjxyi9j4k2uhjnDSwN2dOpzCAGsFeJZ0bJw@mail.gmail.com>
Subject: [PATCH net v3] llc: shut down timers before dropping SAP and device references
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

syzbot reports a slab-use-after-free in
llc_conn_ac_send_sabme_cmd_p_set_x() when a connection timer dereferences
its SAP after the last socket reference has been dropped.

llc_ui_release() holds an extra SAP reference for release_sock(), but
drops it before llc_sk_free() stops the connection timers. If this was
the last socket using the SAP, llc_sap_close() can RCU-free it while a
timer callback is still running.

Keep the extra SAP reference until llc_sk_free() has completed. Use
timer_shutdown_sync() for final teardown: a fixed-order pass with
timer_delete_sync() permits a callback or concurrent state-machine
action to rearm an earlier timer. Keep the device reference through
timer shutdown and queue purge as well, since timer actions can use
llc->dev. The non-final timer stop path retains timer_delete().

Fixes: 9708d2b5b7c6 ("llc: avoid blocking in llc_sap_close()")
Reported-by: syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D44efda9647c52be29d9c
Signed-off-by: Miguel Garc=C3=ADa Rom=C3=A1n <miguelgarciaroman8@gmail.com>

---
v3:
  - Keep SAP and device references until after final timer shutdown.
  - Use timer_shutdown_sync() to prevent cross-timer rearming.
  - Remove the separate unlocked timer stop from llc_ui_release().
  - Reproduced the KASAN report on the unpatched kernel; the patched
    kernel completed five reproducer runs without a KASAN report.
  - syzbot reproduced the UAF on the unpatched control. Two patched
    jobs built successfully, but their C reproducer aborted at bind()
    with EBUSY, so no Tested-by tag is included.
v2: https://lore.kernel.org/netdev/20260916104735.3565609-1-miguelgarciarom=
an8@gmail.com/
v1: https://lore.kernel.org/netdev/20260916074158.3375909-1-miguelgarciarom=
an8@gmail.com/

 net/llc/af_llc.c   | 11 +++++------
 net/llc/llc_conn.c |  9 +++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/net/llc/af_llc.c b/net/llc/af_llc.c
index b0447c33d..e34d1e7b5 100644
--- a/net/llc/af_llc.c
+++ b/net/llc/af_llc.c
@@ -196,6 +196,7 @@ static int llc_ui_release(struct socket *sock)
 {
 	struct sock *sk =3D sock->sk;
 	struct llc_sock *llc;
+	struct llc_sap *sap =3D NULL;

 	if (unlikely(sk =3D=3D NULL))
 		goto out;
@@ -207,23 +208,21 @@ static int llc_ui_release(struct socket *sock)
 	if (!llc_send_disc(sk))
 		llc_ui_wait_for_disc(sk, READ_ONCE(sk->sk_rcvtimeo));
 	if (!sock_flag(sk, SOCK_ZAPPED)) {
-		struct llc_sap *sap =3D llc->sap;
+		sap =3D llc->sap;

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
 	sock->sk =3D NULL;
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
@@ -942,10 +942,10 @@ void llc_sk_stop_all_timers(struct sock *sk, bool syn=
c)
 	struct llc_sock *llc =3D llc_sk(sk);

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
 	if (refcount_read(&sk->sk_refcnt) !=3D 1) {
 		printk(KERN_DEBUG "Destruction of LLC sock %p delayed in %s, cnt=3D%d\n"=
,
--=20
2.43.0
