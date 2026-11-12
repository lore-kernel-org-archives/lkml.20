Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505107;
	b=mZ4Gam0hgMSWc/9ol6QvzTSPlviryMo3DCHqXwe6jedbKqg1AmvPX5HVYpGlj3RwdMP7
	 7ColaQ+3VCAgEvyEsqhQ0Cj902lDlvgmxIvqhr/wxq+JxsiDiTQGeFxT/P/gPXoKiERwO
	 D7mlOoRlAn0eilC4vs8kEOgNVwtsaP77Phf2FAHwqnvYcgIzpILZ82mz2odY5Z+nXyUlj
	 Yie2tHXUQruycjd8u+kMHydvRUfZaDaMueXrY4HNyVDcmFBhbDZLljUpJIElF6U4hEguD
	 TL+k/pKsFrltJOHy8uHoQ6dbL58FaS67dMM5Ta4hM44JBZOUa5/74qu5PIGixuXBCOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+dZkixRp7zWpHdguCFu+wBrypPW0NfmLkLlkPI3M37I=;
	b=xZ5RVLouQY3BfkwQigDvigp0kJUMLPeMlTc3tAkeEB/7oKdIVtZw09OJsKo1jcDP06XV
	 8mOK03e2+KlaKWBl4Q8ujtr3k+eNmWbL8UvP718S4vRJFKGzheuf3ItttG1DQt9AzUwLZ
	 wXhKECT66TWaEPHAIX5rC0n5ue6Wjy9yQSCPzEU87VAwEIVSIP1CZiuw4o70dT8CV98Hh
	 CSgO6eLp2/s/46rkskIRzEnqawXNJno+b1bPgiZD4M7LxoP+LNbd4+uVlrklyy45jOB/r
	 RcTA3un0s+ef0KGlQqvRmVg5ZFzGgpTaolf0PPGX4mpLyT4THeEOcRcnA1LbiPEF8RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VY2lIOBN;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCF606CFCA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CCF606CFCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VY2lIOBN
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so206894eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794505105; x=1795109905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dZkixRp7zWpHdguCFu+wBrypPW0NfmLkLlkPI3M37I=;
        b=VY2lIOBNJ0pCX4pJjWCe+l4Ex1U7XS/IpzvbNAqNVFOwS4uKyJFEjIW/yPRd+inJ1o
         /mBTGJMXq9VjNlDsh72MymMz4SMc/Is3EIyGlPPXABye66JdE29oIblavzWiUL2L8G7n
         Qio+0AmaB5O+mpMNJUutHnhdAWzeUfXCzMt2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505105; x=1795109905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dZkixRp7zWpHdguCFu+wBrypPW0NfmLkLlkPI3M37I=;
        b=KX3KV+49GbZPkH3gj6bQ7Vl4CF+4ZelTq7FKijpbJagq7mQQB0Mc6Xw1zuDOBtxkV+
         XCiwSXERgsR2zf9UbYTgArvA7cfbQn84JJqIDgV21veLnYfEAIyxg5FoN2dzTxVrglPE
         jEfI979c3twZ5Y6IN5RwAOZB/ytiTQBv8F2FKxn4prxviyG7fH7aQINkE8pbzwnDLG03
         eqp/7BWmpSZHiJYuuIsxX3pzykFNOToAD7xwMC1V7W0RocnO8Zg1VclGcOkZmfeUOtdz
         0lB8qBEqQg2LIXYnbO1mIXM0M+u+hbk4pIBkNYpacUrs0p3X8xlapnpjN9nH69W/P79W
         2I1g==
X-Gm-Message-State: APuU4Z92lZvmTh1bhrdKQpb9Q4rUBMct6GQMLZ6fm6PcmVQ1lbeW5wmE
	piB1K4RHo+zl4ulsdyV11NnyWw7FZMnZJ0q4X1TVTxXWVaGpArNaN58ahouBHwn6f5M=
X-Gm-Gg: AYBFou37FHKokOWkz/SeTcvO65SVcsebqvYGPwMLsXttno6V0WK1dsBaI8jNASGK2w+
	TQNImcfTxf95g4AdstOxd3bYIFZvKP4ehc0/Oi7vx7yVslHsOJXaLW5CKwm0w3Fd0GaTRfkIrSz
	NWiuMHpzL+kCAhZ1M7v1RqeucJhLxQc3xY0MiqeKc5yFdFFXEUa8ntag3S0DguGU24MPijsWDfK
	e9opjMCFnWs0UwgGtIzPSN8GjM8Ts2wtydsxr+sIgb9F3P7S/8DosKc+Iw0b7v1KNHIefr03OC0
	edn29XXiFxMBL5CwbwSCxu+aKGyZPKFewBQVJ/bEip2RZM7xQC6SGuKxV9xHPYNJWFsXE5FUHAE
	dxQf68VuKtCS5N9QPalJdiG50SQb0u8F1PMGJ2EJGmKJKVeVUKo1dk2FdH/kAXqCbZXtoF80uua
	b/9e5A9rItwtKLo/WYYiOSO+DxPqhb/d9wvhwdIDsN7BdmvuzxT74s03kz7stKyuJcvZ+Gr+8kD
	PnFfiYs6PYPwgTZX0FtIOymHc2jgZKuRTx2o1xZWSTUYo/zIKnlDdpBn1EvcTzXqIcoG8kO5W4U
	gwOjZey6pL+ZfUshroMeRmY0jKyIX4M86UfU/LFjPPfIddUbb2EFqBaEPSpQ1LYU6ORf/FskuW8
	WA3jDru/T4YyGyGQb5p4Y7hUVem1afIRJESI2sskMFIJROIzNXWsUnGcQd6TQ8Lhg8A==
X-Received: by 2002:a05:7300:560e:b0:376:972f:afa9 with SMTP id 5a478bee46e88-376972fb1dbmr5670014eec.9.1794505104966;
        Thu, 12 Nov 2026 09:38:24 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm69448eec.18.2026.11.12.09.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:38:24 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH] Bluetooth: L2CAP: clear the SDU before the receive callback
Date: Thu, 12 Nov 2026 23:08:12 +0530
Message-Id: <20261112173812.18696-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112173812.18696-1-piyus@iiitd.ac.in>
References: <20261112173812.18696-1-piyus@iiitd.ac.in>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

l2cap_ecred_data_rcv() completes a reassembled SDU by calling
l2cap_ecred_recv() with chan->sdu still set, and only clears the
reassembly state after it returns:

	if (chan->sdu->len == chan->sdu_len) {
		err = l2cap_ecred_recv(chan, chan->sdu);
		if (!err) {
			chan->sdu = NULL;
			...

l2cap_ecred_recv() hands the SDU to the channel's receive callback,
which takes ownership of it on success, and then updates the credits:

	err = chan->ops->recv(chan, skb);
	...
	l2cap_chan_le_send_credits(chan);

l2cap_chan_le_send_credits() calls l2cap_le_rx_credits(), which reads

	size_t sdu_len = chan->sdu ? chan->sdu->len : 0;

so between the callback consuming the skb and the assignment above,
chan->sdu is a dangling pointer that is dereferenced.

For the 6LoWPAN channel the callback frees the skb outright -
chan_recv_cb() -> recv_pkt() ends in consume_skb(skb) and returns
NET_RX_SUCCESS - so the read is a straightforward use-after-free that
KASAN reports:

  BUG: KASAN: slab-use-after-free in l2cap_le_rx_credits
       net/bluetooth/l2cap_core.c:576 [inline]
  BUG: KASAN: slab-use-after-free in l2cap_chan_le_send_credits+0xa8/0x3e0
       net/bluetooth/l2cap_core.c:6811
  Read of size 4 at addr ffff88800e134070 by task kworker/u21:2/11352
  Workqueue: hci0 hci_rx_work
   l2cap_le_rx_credits net/bluetooth/l2cap_core.c:576 [inline]
   l2cap_chan_le_send_credits+0xa8/0x3e0 net/bluetooth/l2cap_core.c:6811
   l2cap_ecred_recv+0x63/0x120 net/bluetooth/l2cap_core.c:6873
   l2cap_ecred_data_rcv net/bluetooth/l2cap_core.c:6976 [inline]
   l2cap_data_channel net/bluetooth/l2cap_core.c:7028 [inline]
   l2cap_recv_frame+0x6c3c/0x9650 net/bluetooth/l2cap_core.c:7162
   l2cap_recv_acldata+0x6fd/0xe60 net/bluetooth/l2cap_core.c:7902
   hci_acldata_packet net/bluetooth/hci_core.c:3865 [inline]
   hci_rx_work+0x3c0/0xbe0 net/bluetooth/hci_core.c:4092
  Freed by task 11352:
   recv_pkt net/bluetooth/6lowpan.c
   chan_recv_cb+0x88/0x150 net/bluetooth/6lowpan.c:367
   l2cap_ecred_recv+0x61/0x160 net/bluetooth/l2cap_core.c:6864
  The buggy address belongs to the object at ffff88800e134000
   which belongs to the cache skbuff_head_cache of size 240
  The buggy address is located 112 bytes inside of
   freed 240-byte region

Offset 112 is sk_buff.len.

Only a multi-frame SDU is affected: the single-frame path already calls
l2cap_ecred_recv() with chan->sdu NULL, so l2cap_le_rx_credits() reads a
zero sdu_len there.

l2cap_reassemble_sdu() completes a segmented SDU the same way and has the
same defect.  On an ERTM or streaming channel l2cap_sock_recv_cb() calls
l2cap_publish_rx_avail(), which reaches l2cap_chan_le_send_credits()
through l2cap_chan_rx_avail(), and that function evaluates

	u16 return_credits = l2cap_le_rx_credits(chan);

in its initializer - before the mode test that makes the rest of it a
no-op for a non-LE channel.  So chan->sdu is dereferenced on that path
too, and the result is discarded.  What makes it a use-after-free rather
than a stale read is a consumer that frees the skb from another thread:
BNEP's session kthread takes it off the socket with a lockless
skb_dequeue() (net/bluetooth/bnep/core.c:530, freed at :533) and never
takes the socket lock, so lock_sock() is no defence.

Fix both sites.

Clear the reassembly state before handing the SDU to the callback, which
makes the fragmented path behave like the single-frame one, and free the
SDU on the spot if the callback refused it - the error path's
kfree_skb(chan->sdu) used to do that, and the callbacks leave the skb to
the caller when they fail.

Clearing it first is also the arithmetically correct input, not merely a
safe one.  l2cap_le_rx_credits() subtracts sdu_len from chan->rx_avail
because a partially reassembled SDU will claim that much receive buffer
once it completes:

	if (chan->rx_avail <= sdu_len)
		return 0;

	return DIV_ROUND_UP(chan->rx_avail - sdu_len, chan->mps);

A completed SDU is no longer waiting for that space.  If the callback
queued it, l2cap_sock_recv_cb() has already called
l2cap_publish_rx_avail(), which recomputes rx_avail from
sk_rcvbuf - sk_rmem_alloc with that skb included in sk_rmem_alloc; if the
callback consumed it, as the 6LoWPAN one does, it occupies nothing at
all.  Either way the reassembly buffer is empty, so zero is the right
sdu_len, and a NULL chan->sdu is how l2cap_le_rx_credits() expresses
that - the same value l2cap_le_flowctl_init() depends on when it seeds
chan->rx_credits on an idle channel.  Carrying the old length into the
calculation instead would subtract the SDU a second time and under-grant
credits on every delivery, and once rx_avail fell to the size of one SDU
the channel would be granted none at all.

Per Documentation/process/generated-content.rst: the use-after-free was
found by an AI-driven fuzzing harness built on syzkaller, developed
jointly by Kapil Vaswani and myself, which drove a virtual HCI
controller and a 6LoWPAN channel under KASAN on x86_64.  The root-cause
analysis, this changelog and the patch were written with the assistance
of a large language model over an extended session, and reviewed by
hand; the before/after testing below the --- was run by us.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---

Tested on net/main itself, before and after.  The kernel was built from
a2fd526d6442 with x86_64 defconfig plus KASAN and the Bluetooth, 6LoWPAN,
vhci and configfs options the test needs, gcc, no instrumentation, and
booted by hand under qemu against the same unmodified rootfs each time
(-snapshot, so the image is never written).  The only difference between the
two kernels is this patch:

  unpatched  7.4.0-rc1-ga2fd526d6442   KASAN on every run (4 runs today)
  patched    7.4.0-rc1-g63fe746a609a   no report (2 runs)

WHICH SITE THAT COVERS, because the patch changes two.  The reproducer
drives the ECRED path, so l2cap_ecred_data_rcv() is the hunk those runs
exercise.  For the l2cap_reassemble_sdu() hunk, the same patched commit was
rebuilt with CONFIG_BT_BNEP=y and driven with a segmented SDU on an ERTM
channel with a BNEP session attached, under two kprobes:

  l2cap_reassemble_sdu   14 hits
  l2cap_sock_recv_cb      6 hits
  interleaved rr-C rr-C: two entries into the reassembly function per
  callback, which is a START frame installing chan->sdu followed by an END
  frame completing it - the branch this patch changes - and not the
  unsegmented path, which would call back on every entry

with no KASAN report.  So the changed line runs and reassembly still
completes.  What that run does NOT do is reproduce the use-after-free on
that path: it needs the freeing thread to win, and the harness that found
this bug did win it with BNEP's lockless skb_dequeue(), where we did not.
The argument for why that site is affected is the ordering one above, from
the source.

The clean runs are not setup failures: on both kernels the reproducer
reported the same L2CAP LE channel and the same frames -

  SUMMARY mtu=1280 mps=1017 credits=2 scid=64 chan_gone=0

- and exited 0.  Only the report differs.  On the unpatched kernel the
console shows the program's own marker immediately before the trace:

  [   45.878309] LOWRUN sdu
  [   46.063560] BUG: KASAN: slab-use-after-free in
                 l2cap_chan_le_send_credits+0x86/0x1d0
  [   46.063711] Read of size 4 at addr ffff88800c9a82f0 by task
                 kworker/u21:0/353
  [   46.063838] Workqueue: hci0 hci_rx_work

Offset 112 of the freed 240-byte skbuff_head_cache object is sk_buff.len.
On the patched kernel the same marker is printed and nothing follows it.

The same reproducer also faults on an unmodified 7.3.1 kernel, and the
harness hit the signature 19 times over eight hours on a third kernel.

No Fixes: tag: our clone is shallow, only 27 commits of l2cap_core.c history
are reachable and git blame lands on the shallow boundary, so we cannot name
the introducing commit.  The code is byte-identical in net/main at
a2fd526d6442, in mainline at 79eb6679ef6a and in the 7.3.1 tree this was
found on, and is present in every v7.3-rc tag available to us.  Please add
the tag if you can resolve it against full history.

Reproducer: not included here.  This bug was found with AI assistance, which
Documentation/process/security-bugs.rst says to treat as public; the same
paragraph says not to post the reproducer publicly.  It is one C program
needing no Bluetooth hardware, it is tested, and we will send it on request.

What bounds the scope: the channel's receive callback has to be one that
frees the skb, which is the 6LoWPAN one, and the SDU has to arrive in more
than one frame.  An administrator enables 6LoWPAN through debugfs; after
that bt_6lowpan_listen() listens on L2CAP_PSM_IPSP and a connected LE peer
reaches this with an ordinary fragmented SDU, needing no local privilege.

 net/bluetooth/l2cap_core.c | 53 ++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 7dcb0586a10b..fb965e4d75f2 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -6186,6 +6186,7 @@ static void append_skb_frag(struct sk_buff *skb, struct sk_buff *new_frag,
 static int l2cap_reassemble_sdu(struct l2cap_chan *chan, struct sk_buff *skb,
 				struct l2cap_ctrl *control)
 {
+	struct sk_buff *sdu;
 	int err = -EINVAL;
 
 	switch (control->sar) {
@@ -6246,15 +6247,25 @@ static int l2cap_reassemble_sdu(struct l2cap_chan *chan, struct sk_buff *skb,
 		if (chan->sdu->len != chan->sdu_len)
 			break;
 
-		err = chan->ops->recv(chan, chan->sdu);
+		/* Reassembly complete.  Hand the SDU over before the
+		 * callback, for the reason given in l2cap_ecred_data_rcv():
+		 * the callback takes ownership and may free it, while
+		 * l2cap_chan_rx_avail() -> l2cap_chan_le_send_credits() reads
+		 * chan->sdu->len on the way out - it does so before the mode
+		 * test that makes the rest of that function a no-op here.
+		 * Return directly, since the state this leaves is what the
+		 * trailing error block would otherwise set again.
+		 */
+		sdu = chan->sdu;
+		chan->sdu = NULL;
+		chan->sdu_last_frag = NULL;
+		chan->sdu_len = 0;
 
-		if (!err) {
-			/* Reassembly complete */
-			chan->sdu = NULL;
-			chan->sdu_last_frag = NULL;
-			chan->sdu_len = 0;
-		}
-		break;
+		err = chan->ops->recv(chan, sdu);
+		if (err)
+			kfree_skb(sdu);
+
+		return err;
 	}
 
 	if (err) {
@@ -7245,12 +7256,26 @@ static int l2cap_ecred_data_rcv(struct l2cap_chan *chan, struct sk_buff *skb)
 	skb = NULL;
 
 	if (chan->sdu->len == chan->sdu_len) {
-		err = l2cap_ecred_recv(chan, chan->sdu);
-		if (!err) {
-			chan->sdu = NULL;
-			chan->sdu_last_frag = NULL;
-			chan->sdu_len = 0;
-		}
+		struct sk_buff *sdu = chan->sdu;
+
+		/* The receive callback takes ownership of a reassembled SDU and
+		 * may free it, while l2cap_ecred_recv() goes on to update the
+		 * credits - which reads chan->sdu->len.  Drop the reassembly
+		 * state before handing the SDU over, and release it here if the
+		 * callback refused it, so that it is still freed exactly once.
+		 * The reassembly state is already clear at that point, so
+		 * return instead of falling into the failed: block, whose
+		 * kfree_skb(chan->sdu) would have nothing left to free.
+		 */
+		chan->sdu = NULL;
+		chan->sdu_last_frag = NULL;
+		chan->sdu_len = 0;
+
+		err = l2cap_ecred_recv(chan, sdu);
+		if (err)
+			kfree_skb(sdu);
+
+		return 0;
 	}
 
 failed:

base-commit: a2fd526d644233d6a892c28173f07c61e21e4c93
-- 
2.34.1

