Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EAE51AFCF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684794; cv=none; b=hWwj1hlCFB4NDwowW4OIQyvPt6FLKra3PkXXLEQFCoPWxTvtifjHeHt2ZwGENlrkQt+iSBOF9XrV88z+1/X1AvDWvlUH8yuW9QpIIlEm520kG6qSUexqfd7zpP9Y2ZHUP5JP550SbIFzuz6r1Tx/NKVj1fD+RmRSfwfSohr6nn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684794; c=relaxed/simple;
	bh=m+H6q49yQeE+O7uFRKZCYEy6CRwr1q6H7gMCMKxjgWE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XroDU7mXWlYnYDPAmUdY2IJtn2z+rT4Rl6uXgwkPp8k5yAZeyG1EtEAwKiP+iVsIplagIWxkkHG/WLZzs+Cgy7No7ZkaJHuyXXoYfuPWDgV9ptGnRtw6xCIz3dzzhZo0Jxzo02d+D1CPUYeEfqvO6FbPF2GZkcDxVFkhII+K2mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b1bc2e44e0so6367941b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684791; x=1791289591;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XKfbFdNOUa1RHIc3kOSLaDHC/2hSgWUiJ2GA+9riaZk=;
        b=gsPdS5xzxQKmytqudhG8UBEyCI2jQVMPCsSqSxyk9D02c9OHi92NqWPOr1c3L3fsKF
         rxGsxOu7B046GmEjhCZ5AiC65QYo18SBNcQOP1YqXgDICfQPcEJWyvK20PY5f4TcuqZZ
         6H1NhiIcMDmNn4r0S/4PW1WKFx6MNpKfoDN6B5S5W2Ogie0Xv5+TrsFVEqC9cWF0exCy
         s2IUOVcVl9CqqsOtb1uvvqOBudtgMAx57nXKYj4EbiibXql7RsPq7CB8air6ocpe3cPl
         jeXm6r6ueOnr081EGI5tt8gmQ8igQa58XWA80hSAlHASDr3kHM72PbNp5eNYVihNbZzV
         xWJA==
X-Gm-Message-State: AFuF++lrCo3WTMwxnYL87DuYRTqBOrNtutNh8hBzDqDEGKbzMOKLDz/0
	851UpCfmZEslR5Ajt3X5QsMCs1jwTc5Uf/O3X+L0IHeH4zxJsM3VdjmgmnK1MPg54oN2CnlYVrI
	tr0PMH7ZoOxScCuLxZER3Z3KgV8mOZ4RsVd8dZ0M+QB5w/Rbf9ZalFZhZYFs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3e9:b0:4c3:6c2:4f29 with SMTP id
 5614622812f47-4d72e672958mr15836789b6e.16.1790684790942; Tue, 29 Sep 2026
 05:26:30 -0700 (PDT)
Date: Tue, 29 Sep 2026 05:26:30 -0700
In-Reply-To: <6a92fadc.08e933ee.dbf97.008f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abbae76.80e1c6cc.1e8e5f.0078.GAE@google.com>
Subject: Forwarded: [PATCH v4] Bluetooth: RFCOMM: connect the session socket
 without rfcomm_mutex
From: syzbot <syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v4] Bluetooth: RFCOMM: connect the session socket without rfcomm_mutex
Author: mikhail.v.gavrilov@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 72d3fcf802c4

An RFCOMM connect() issued while a BR/EDR link is being authenticated
makes lockdep report a circular dependency, and the reported cycle is a
real AB/BA between rfcomm_mutex and hdev->lock.

rfcomm_security_cfm() is called from the HCI event path, which already
holds hdev->lock:

  hci_rx_work()
    hci_event_packet()
      hci_cc_read_enc_key_size()   [hdev->lock]
        hci_encrypt_cfm()          [hci_cb_list_lock]
          rfcomm_security_cfm()    [rfcomm_mutex]

while an RFCOMM connect() from userspace takes the same two locks the
other way round:

  rfcomm_sock_connect()
    rfcomm_dlc_open()              [rfcomm_mutex]
      __rfcomm_dlc_open()
        rfcomm_session_create()
          kernel_connect()
            l2cap_sock_connect()
              l2cap_chan_connect() [hdev->lock]

  WARNING: possible circular locking dependency detected
  kworker/u131:1/1128 is trying to acquire lock:
  rfcomm_mutex, at: rfcomm_security_cfm+0x31/0x3e0 [rfcomm]
  but task is already holding lock:
  hci_cb_list_lock, at: hci_cc_read_enc_key_size+0x1d2/0xcc0
  Chain exists of:
    rfcomm_mutex --> &hdev->lock --> hci_cb_list_lock

hci_auth_complete_evt() and hci_encrypt_change_evt() reach the callback
the same way.

Both orders have to be seen in the same boot, which is why a BR/EDR
connection alone is not enough to show it: a session set up by the
remote side is created by rfcomm_accept_connection() in krfcommd, which
calls kernel_accept() and never takes hdev->lock under rfcomm_mutex.
Connecting a device that authenticates and encrypts the link and then
calling connect() on an RFCOMM socket towards any address - the connect
does not have to succeed, the order is recorded before the page timeout
- reports it every time.

Only the session socket has to be connected with the lock held, and it
does not: nothing else can see the socket before it is put on the
session list.  So connect it first and take rfcomm_mutex afterwards,
which removes the rfcomm_mutex -> hdev->lock order for good, rather
than keeping the HCI event path out of rfcomm_mutex.

rfcomm_session_create() becomes rfcomm_session_connect(), which returns
the connected socket without touching the session list, and
rfcomm_dlc_open() adds the session once it holds the lock again.  If
another opener added a session for the same pair while this socket was
connecting, that session is used and this socket is dropped.
__rfcomm_dlc_open() now takes the session it should use, and its state
check runs after the lock is re-acquired, so a DLC that was opened or
closed in the meantime is still handled.

Over an existing ACL link the connection can complete before the
session reaches the list, and the wakeup from the socket callback is
then lost, so krfcommd is woken once the session is visible.

Connecting without the lock opens a window in which the socket can be
closed.  The DLC is not on a session yet, so rfcomm_dlc_close() finds
nothing to do and returns without touching it, and rfcomm_dlc_open()
would then attach a DLC whose owner is gone.  rfcomm_dlc_close() now
marks such a DLC with RFCOMM_CLOSED, and rfcomm_dlc_open() checks the
mark once it holds rfcomm_mutex again and drops the socket instead of
attaching the DLC.  The mark is cleared when an open starts, so a DLC
that is reused is not affected.  This covers both callers of
rfcomm_dlc_open(), the socket and the tty layer.

Fixes: 759c185d0bbd ("Bluetooth: RFCOMM: serialize security confirmation handling")
Suggested-by: Pauli Virtanen <pav@iki.fi>
Reported-by: Pauli Virtanen <pav@iki.fi>
Closes: https://lore.kernel.org/linux-bluetooth/5e76a95e934e451e7006db28827c2d64af5a88be.camel@iki.fi/
Reported-by: syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-bluetooth/6a92fadc.08e933ee.dbf97.008f.GAE@google.com/
Reported-by: Jiaming Zhang <r772577952@gmail.com>
Closes: https://lore.kernel.org/all/CANypQFabseTuRiyz2pGkc_Qj0moGDnY7KEp1qdTOqkw6gAL3hw@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

The commit this fixes is in v7.3-rc1 and is marked for stable, so this
probably wants the bluetooth fixes tree rather than -next.

v4:
 - rfcomm_dlc_close() marks a DLC that is not on a session yet, and
   rfcomm_dlc_open() drops the socket instead of attaching the DLC when
   it finds the mark after taking rfcomm_mutex again (Luiz, and the
   Sashiko review of v3)
 - Reported-by/Closes for Jiaming Zhang's report, which hits the same
   cycle from the connect side: rfcomm_dlc_open() holding rfcomm_mutex
   while l2cap_chan_connect() takes hdev->lock
 - syzbot tested v3 with its reproducer, no issue:
   https://lore.kernel.org/all/6ab100d7.71f81b7d.15fa6d.0029.GAE@google.com/

Tested on 7.3.0-rc5 with an MT7922 controller (btusb) and a JBL Tour
Pro 3 headset.  An RFCOMM connect() towards an address that does not
answer, run after the headset has authenticated its link, reports the
inversion without the patch (checked on 7.3-rc2); with v4 it stays quiet
and the validator is still armed afterwards (debug_locks: 1).  A connect
towards the connected headset is answered in 23 ms with ECONNREFUSED -
the session is established over the existing ACL link and the peer
rejects the channel - and towards an idle one it fails with EHOSTDOWN
after the page timeout.  The reproducer is in the v3 posting.

v3: https://lore.kernel.org/linux-bluetooth/20260912100315.151674-1-mikhail.v.gavrilov@gmail.com/
v2: https://lore.kernel.org/linux-bluetooth/20260904012028.77590-1-mikhail.v.gavrilov@gmail.com/
v1: https://lore.kernel.org/linux-bluetooth/20260902235132.453044-1-mikhail.v.gavrilov@gmail.com/

 include/net/bluetooth/rfcomm.h |   1 +
 net/bluetooth/rfcomm/core.c    | 134 +++++++++++++++++++++++----------
 2 files changed, 96 insertions(+), 39 deletions(-)

diff --git a/include/net/bluetooth/rfcomm.h b/include/net/bluetooth/rfcomm.h
index 102c278e3..9dc5fd4cb 100644
--- a/include/net/bluetooth/rfcomm.h
+++ b/include/net/bluetooth/rfcomm.h
@@ -207,6 +207,7 @@ struct rfcomm_dlc {
 #define RFCOMM_AUTH_REJECT  7
 #define RFCOMM_DEFER_SETUP  8
 #define RFCOMM_ENC_DROP     9
+#define RFCOMM_CLOSED       10
 
 /* Scheduling flags and events */
 #define RFCOMM_SCHED_WAKEUP 31
diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index d91e2a6ee..54ec1136f 100644
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -62,10 +62,9 @@ static void rfcomm_make_uih(struct sk_buff *skb, u8 addr);
 
 static void rfcomm_process_connect(struct rfcomm_session *s);
 
-static struct rfcomm_session *rfcomm_session_create(bdaddr_t *src,
-							bdaddr_t *dst,
-							u8 sec_level,
-							int *err);
+static struct socket *rfcomm_session_connect(bdaddr_t *src, bdaddr_t *dst,
+					     u8 sec_level, int *err);
+static struct rfcomm_session *rfcomm_session_add(struct socket *sock, int state);
 static struct rfcomm_session *rfcomm_session_get(bdaddr_t *src, bdaddr_t *dst);
 static struct rfcomm_session *rfcomm_session_del(struct rfcomm_session *s);
 
@@ -365,28 +364,17 @@ static int rfcomm_check_channel(u8 channel)
 	return channel < 1 || channel > 30;
 }
 
-static int __rfcomm_dlc_open(struct rfcomm_dlc *d, bdaddr_t *src, bdaddr_t *dst, u8 channel)
+static int __rfcomm_dlc_open(struct rfcomm_dlc *d, struct rfcomm_session *s,
+			     u8 channel)
 {
-	struct rfcomm_session *s;
-	int err = 0;
 	u8 dlci;
 
-	BT_DBG("dlc %p state %ld %pMR -> %pMR channel %d",
-	       d, d->state, src, dst, channel);
-
-	if (rfcomm_check_channel(channel))
-		return -EINVAL;
+	BT_DBG("dlc %p state %ld session %p channel %d",
+	       d, d->state, s, channel);
 
 	if (d->state != BT_OPEN && d->state != BT_CLOSED)
 		return 0;
 
-	s = rfcomm_session_get(src, dst);
-	if (!s) {
-		s = rfcomm_session_create(src, dst, d->sec_level, &err);
-		if (!s)
-			return err;
-	}
-
 	dlci = __dlci(__session_dir(s), channel);
 
 	/* Check if DLCI already exists */
@@ -421,14 +409,84 @@ static int __rfcomm_dlc_open(struct rfcomm_dlc *d, bdaddr_t *src, bdaddr_t *dst,
 
 int rfcomm_dlc_open(struct rfcomm_dlc *d, bdaddr_t *src, bdaddr_t *dst, u8 channel)
 {
-	int r;
+	struct rfcomm_session *s;
+	struct socket *sock;
+	int err;
+
+	BT_DBG("dlc %p state %ld %pMR -> %pMR channel %d",
+	       d, d->state, src, dst, channel);
+
+	if (rfcomm_check_channel(channel))
+		return -EINVAL;
 
 	rfcomm_lock();
 
-	r = __rfcomm_dlc_open(d, src, dst, channel);
+	clear_bit(RFCOMM_CLOSED, &d->flags);
 
+	/* Do not page the remote device for a DLC that cannot be opened
+	 * anyway.  __rfcomm_dlc_open() looks at the state again once the
+	 * lock has been re-acquired below.
+	 */
+	if (d->state != BT_OPEN && d->state != BT_CLOSED) {
+		rfcomm_unlock();
+		return 0;
+	}
+
+	s = rfcomm_session_get(src, dst);
+	if (s) {
+		err = __rfcomm_dlc_open(d, s, channel);
+		rfcomm_unlock();
+		return err;
+	}
 	rfcomm_unlock();
-	return r;
+
+	/* There is no session for this pair yet.  kernel_connect() ends up in
+	 * l2cap_chan_connect(), which takes hdev->lock, and the HCI event
+	 * path takes rfcomm_mutex while holding hdev->lock, so the socket has
+	 * to be connected with rfcomm_mutex released.
+	 */
+	sock = rfcomm_session_connect(src, dst, d->sec_level, &err);
+	if (!sock)
+		return err;
+
+	rfcomm_lock();
+
+	/* The DLC may have been closed while the socket was connecting.  It
+	 * was not on a session, so rfcomm_dlc_close() could only mark it;
+	 * attaching it now would leave it with no owner.
+	 */
+	if (test_bit(RFCOMM_CLOSED, &d->flags)) {
+		rfcomm_unlock();
+		sock_release(sock);
+		return -ECONNRESET;
+	}
+
+	/* Another opener may have added a session for the same pair in the
+	 * meantime; that one is used and this socket is dropped.
+	 */
+	s = rfcomm_session_get(src, dst);
+	if (!s) {
+		s = rfcomm_session_add(sock, BT_BOUND);
+		if (s) {
+			s->initiator = 1;
+			sock = NULL;
+		}
+	}
+
+	err = s ? __rfcomm_dlc_open(d, s, channel) : -ENOMEM;
+
+	rfcomm_unlock();
+
+	if (sock)
+		sock_release(sock);
+
+	/* Over an existing ACL link the connection can complete before the
+	 * session reaches the list, and that wakeup is then lost, so let
+	 * krfcommd look at the socket state now.
+	 */
+	rfcomm_schedule();
+
+	return err;
 }
 
 static void __rfcomm_dlc_disconn(struct rfcomm_dlc *d)
@@ -508,8 +566,14 @@ int rfcomm_dlc_close(struct rfcomm_dlc *d, int err)
 	rfcomm_lock();
 
 	s = d->session;
-	if (!s)
+	if (!s) {
+		/* Not on a session yet: rfcomm_dlc_open() may be connecting a
+		 * socket for it with rfcomm_mutex released.  Leave a mark so
+		 * that it does not attach the DLC once it holds the lock again.
+		 */
+		set_bit(RFCOMM_CLOSED, &d->flags);
 		goto no_session;
+	}
 
 	/* after waiting on the mutex check the session still exists
 	 * then check the dlc still exists
@@ -757,12 +821,12 @@ static struct rfcomm_session *rfcomm_session_close(struct rfcomm_session *s,
 	return rfcomm_session_del(s);
 }
 
-static struct rfcomm_session *rfcomm_session_create(bdaddr_t *src,
-							bdaddr_t *dst,
-							u8 sec_level,
-							int *err)
+/* Creates the L2CAP socket a new session will run on and starts connecting
+ * it.  Must be called with rfcomm_mutex released.
+ */
+static struct socket *rfcomm_session_connect(bdaddr_t *src, bdaddr_t *dst,
+					     u8 sec_level, int *err)
 {
-	struct rfcomm_session *s = NULL;
 	struct sockaddr_l2 addr;
 	struct socket *sock;
 	struct sock *sk;
@@ -792,24 +856,16 @@ static struct rfcomm_session *rfcomm_session_create(bdaddr_t *src,
 		l2cap_pi(sk)->chan->mode = L2CAP_MODE_ERTM;
 	release_sock(sk);
 
-	s = rfcomm_session_add(sock, BT_BOUND);
-	if (!s) {
-		*err = -ENOMEM;
-		goto failed;
-	}
-
-	s->initiator = 1;
-
 	bacpy(&addr.l2_bdaddr, dst);
 	addr.l2_family = AF_BLUETOOTH;
 	addr.l2_psm    = cpu_to_le16(L2CAP_PSM_RFCOMM);
 	addr.l2_cid    = 0;
 	addr.l2_bdaddr_type = BDADDR_BREDR;
 	*err = kernel_connect(sock, (struct sockaddr_unsized *)&addr, sizeof(addr), O_NONBLOCK);
-	if (*err == 0 || *err == -EINPROGRESS)
-		return s;
+	if (*err && *err != -EINPROGRESS)
+		goto failed;
 
-	return rfcomm_session_del(s);
+	return sock;
 
 failed:
 	sock_release(sock);
-- 
2.43.0

