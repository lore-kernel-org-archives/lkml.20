Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF61A6834
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971813; cv=none; b=of7kRc2PEEg5vr2MBW1BM4+bitixy5ZpW8BlbnxE+NN5M75hJnGxhMuFAl7wewMDvgwfGA5T4AG2s2UMjy6uLRHqwO1L5R1sJNiH2Fu6wAw/k1Pw0KPydM8A9W+R1AKqvgep60RZ9RFUM/S1LOjuLs0l1p9jK/UxZf1Bzb4Mg2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971813; c=relaxed/simple;
	bh=U2V5IMc/u6meggyJrXxYm7ih4d32y2dC2PV0L8J54CI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QhIxqk9W9TVR/l87cblF13boLyecoTpTDbE1n1RWswLeIJhfBN3sLq+2qBYHWO8tf2gGCfkozUZXQhwjXG6SaB8qFlXtCwZn9I5j4t/uFScLjxpeQcK2cUKxJo+lZXWrku64oDQEEFRbS7ZOXXvu/kl37LeIg9y6pYsvGgIjHx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-469debb526fso3331172fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971810; x=1790576610;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1WS7BiJHVzykxEF57zDgMk+JKBiYO6rLWgps4DcMF2k=;
        b=ASWui/VzLiNKzoJeQlgJFaRRXA5J++Ltv51sTaGeM15pcZAELRlfRpmX+IgJr5X4TP
         IqLU+Zle5BZngCBLfSfYtOcE1Wvn/vmhsE5RFhTkHeLRJKK3mADi5dFOz4ryZ9q6mkF0
         DJ0waLNkKHZBs1t42quB1Cc/zO4WhLUDOX98tnMr/IBlem7pGx920mKazHYtjThgs9Tm
         SMmUsZN4y5P4bmpGxTcJkt49rHPTxZglwVNV3qPYrwp7tGQkFifHC5BSIvdaEpaAyvBV
         Y5Nss9j8lB9PCmlkC7/fUgSqDa0Yd+/e2IAAprTPX//pvRcEQmlVNHSvP8exyLHv3sr1
         2ngQ==
X-Gm-Message-State: AFuF++m0iT6uTsRM3dwYkvEwze0W3g0xeuCaUDr2HqzQoiJsPLp8ttF8
	Xl30Mj+GPewxYhnaa1+KDxG7tkH9dn6Yx5po8I+sdYXV9nbshm+MaPlZrJDOquaZVssIE9mLjIo
	kYjc0RrkLyetBxoC3mZiBpNOclfuggF+R1tWOha7CyIVVEtzK1FsTWl/VsDE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2085:b0:6be:731b:5544 with SMTP id
 006d021491bc7-6ca9c64fad2mr8899233eaf.37.1789971810699; Sun, 20 Sep 2026
 23:23:30 -0700 (PDT)
Date: Sun, 20 Sep 2026 23:23:30 -0700
In-Reply-To: <6a92fadc.08e933ee.dbf97.008f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab0cd62.71f81b7d.15fa6d.0023.GAE@google.com>
Subject: Forwarded: [PATCH v3] Bluetooth: RFCOMM: connect the session socket
 without rfcomm_mutex
From: syzbot <syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v3] Bluetooth: RFCOMM: connect the session socket without rfcomm_mutex
Author: mikhail.v.gavrilov@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 518e5b794c06

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

Fixes: 759c185d0bbd ("Bluetooth: RFCOMM: serialize security confirmation handling")
Suggested-by: Pauli Virtanen <pav@iki.fi>
Reported-by: Pauli Virtanen <pav@iki.fi>
Closes: https://lore.kernel.org/linux-bluetooth/5e76a95e934e451e7006db28827c2d64af5a88be.camel@iki.fi/
Reported-by: syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-bluetooth/6a92fadc.08e933ee.dbf97.008f.GAE@google.com/
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

The commit this fixes is in v7.3-rc1 and is marked for stable, so this
probably wants the bluetooth fixes tree rather than -next.

v1: https://lore.kernel.org/linux-bluetooth/20260902235132.453044-1-mikhail.v.gavrilov@gmail.com/
v2: https://lore.kernel.org/linux-bluetooth/20260904012028.77590-1-mikhail.v.gavrilov@gmail.com/

v3:
 - fix the lock order on the connect side instead of deferring the
   security confirmation, as asked for on v2; rfcomm_security_cfm()
   and krfcommd are left alone, so none of the questions about delayed
   confirmations apply any more
 - the queue, its annotations and the flush from v2 are gone

Tested on 7.3.0-rc2 with an MT7922 controller (btusb).  Without the
patch the reproducer below reports the inversion on every run; with it
applied it stays quiet and the validator is still armed afterwards
(debug_locks: 1).  A 10 hour session with BR/EDR headset connects,
AVRCP and SCO traffic produced no lockdep report either.

An outgoing connect towards a connected headset is answered in 29 ms
with ECONNREFUSED - the session is established over the existing ACL
link and the peer rejects the channel - which is the case where the
L2CAP connect can complete before the session reaches the list.
Towards an idle device the same connect fails with EHOSTDOWN after the
page timeout.

The connect() side used for the reproducer, so that it does not depend
on which end sets up the HFP session:

  #include <stdint.h>
  #include <string.h>
  #include <unistd.h>
  #include <sys/socket.h>

  #define BTPROTO_RFCOMM 3

  struct sockaddr_rc {
      unsigned short  rc_family;
      uint8_t         rc_bdaddr[6];   /* little endian */
      uint8_t         rc_channel;
  };

  int main(void)
  {
      struct sockaddr_rc addr = { .rc_family = AF_BLUETOOTH,
                                  .rc_channel = 1 };
      int fd = socket(AF_BLUETOOTH, SOCK_STREAM, BTPROTO_RFCOMM);

      memcpy(addr.rc_bdaddr, "\x55\x44\x33\x22\x11\x00", 6);
      connect(fd, (struct sockaddr *)&addr, sizeof(addr));
      close(fd);
      return 0;
  }

 net/bluetooth/rfcomm/core.c | 114 ++++++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 38 deletions(-)

diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index f7463f092283..227ccc7da848 100644
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
@@ -421,14 +409,72 @@ static int __rfcomm_dlc_open(struct rfcomm_dlc *d, bdaddr_t *src, bdaddr_t *dst,
 
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
+	/* Do not page the remote device for a DLC that cannot be opened
+	 * anyway.  __rfcomm_dlc_open() looks at the state again once the
+	 * lock has been re-acquired below.
+	 */
+	if (d->state != BT_OPEN && d->state != BT_CLOSED) {
+		rfcomm_unlock();
+		return 0;
+	}
 
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
@@ -757,12 +803,12 @@ static struct rfcomm_session *rfcomm_session_close(struct rfcomm_session *s,
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
@@ -792,24 +838,16 @@ static struct rfcomm_session *rfcomm_session_create(bdaddr_t *src,
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
2.55.0

