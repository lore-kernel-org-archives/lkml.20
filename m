Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD483B9D9E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617623; cv=none; b=qkvMzauiN9p1eqzcgyvYOZ4HO7PFdXFQnC78sYRAVDPot86LR3u2wui6GM3Q/UvChnbTgzzOGTV6yDDlbI70xCR5B9t+KE+Prv9FGILISY3qlpxGSKusZpFeoTMZ9UkFthv8dMoAdnT8f+V8e3hdLt+LrQ0VWDhjN8uwHlnfFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617623; c=relaxed/simple;
	bh=NndGd9GOf0I6NO8Ce3nP+s13O09BbawYzE6kgfvxPZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IVwmRh4GBD2ck3fJveinbecqbg87U+p8i3733DSvT3zLj/517OB/h7Jf34OPvDTj7tEpx5H27T+MBo/w3bImNjHGJgYTxUkyjIJk/NCsB5Dn7ARbFQgtHUNTEHPsXVy+m/3mV225zYNb++tXjQD3k0HjZoDXt3sjWTHQ6l0hIPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPELqpR0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPELqpR0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so2559035e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789617617; x=1790222417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TH7pqPWttSJGp/Lqeiet7/X4Ui7u8p69YinbdJusLhk=;
        b=qPELqpR04YALqjxUxYX27T5X6LbKk7qrq2qS4kGgGTQpyIJTtjUNQOrjXzVat2nJR7
         cvWbz/2JETY+eWMI5n/cGRtA4oVq+IorawxoFFcbvWCN/QgnI/Li/oJW55jlXl2wrhsV
         twyuzaKIivXO3EQQKVwb++qJFll81qA36yH9L8JeqFXW2mWXBlpS4CfuM5scboFuWneB
         EILTypVnyiaTrh/ZsQTpCGdE44iHP7oDfsclJ68X+avzaBrYLMBQ9PUXJCl2SNk4US4j
         p82EAspswa8ms4XxoRVCeSJ+NciuPPSlw3ClQAN6/sdvk+qGCMttXAnsmbCdz0v8xi83
         Z1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617617; x=1790222417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TH7pqPWttSJGp/Lqeiet7/X4Ui7u8p69YinbdJusLhk=;
        b=kmkoBAzFkiVUvsfc85IMcKirqOgvDWCv/Y8k5hhTEK8Ywnz8CpfVdBBpukse6YjB53
         pX8+XMTHna1LhkaTqZvOwoOaIFRNHbX95yYDTJRuOjSvDzE/r2PvedFUZ0Lhg4tE/9EZ
         fDoqC+ns9o4B+QTKPw32wJuFNkrRvseNRloW76Ov4DkYaD/vyZJHiA/J2Yn/qxOlIP9n
         ImZNKsm7w0VjF2dUbLjgJBjrm+HSLGGv6Brd91T/VcFkjf+AVvRAGm0+KovfSLva3iq1
         tShTTsaTR8onCJ9ehUtR4OzzWEBQRjHS2mF3lNlWw7Ok5xgfn2cRIgxpvPCiyu4IQxds
         2+mA==
X-Forwarded-Encrypted: i=1; AKwUvBxeb2Wcv9whOq+TuML75iE6pJlrxD7+MFtr8b53/VG2ny6GpOHGupmEIgsRV1m/yxZeBDaQ11FlJ5AEr4s=@vger.kernel.org
X-Gm-Message-State: AFuF++kfl/0UQwCsAxa+Voh9PxI0yfPoST2gBumvv24qcbZ+TUsHY8Yk
	8d/p8fhJfWN40mUsx6Tx9mezCITDvjAlfcz/r62wuBJ+wOxFYTwoDQtF
X-Gm-Gg: AYBFou0le7TPXW2AtO1GCRTv6VMQl7QDYYz9gFU6ZBMQxxgQiRnM0mERvpc2+dEJV5d
	A3vk9lirr5Km6I2H7QwL+sjPStsrDDiNP/Chp5lX9WyHHNNiH2AgftNTE8YCgotHtnKpdj004XH
	ZG3yFpnJLBTattGGq6BKA5zEeIVbZD+Kd+GaWEnA2uecilcZuXU6fJtQDtKhSKzhmET5VSoyrw4
	h5fOl09PfBydOiLzvMkuQwS3NWNpoK7bJOVEW+2Cx4AvJSAFx7pLLGByKJs9zV3M8IrDHP90dnE
	rY8r5rcwplUxVBHDG8yezKIet76ShN1QtZd4O8b8mn9kHYK33td3d9NcsrfdnlckTrjl1Yw5sAS
	DvDf1q7DZKj94ZPKNciL/JSRQ7sE4+wsjoZl7tG7Ei7XsST7VzCrYKKR4Vb+nZ9UznpakKauWod
	2cHNZcesTURfQD40HKl6HoTDKlY5S+Fi2/z0HEIZw2fZDEe8vEqo2+MTiSheS5qnJ9iVfPqDxG4
	HY+uatqMh5SrbUwMwX/Ow8fxb/RJ78eFIHJ6LgPJFDUNFp1FRwXWai35GJlrnIA6Dx6BKlrV+CW
	OSxhuWy86NYfC1yV84RjwtOUlM1G2aJQKZOT7ElZgGzC25bIj98sdbq8vq6U9qod6r5IAMCLLZN
	Q
X-Received: by 2002:a05:600c:83c8:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49eb7341406mr52441125e9.29.1789617616894;
        Wed, 16 Sep 2026 21:00:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm6880015e9.0.2026.09.16.21.00.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 21:00:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	luiz.dentz@gmail.com,
	luiz.von.dentz@intel.com,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	eadavis@qq.com,
	davem@davemloft.net,
	kuba@kernel.org,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	pav@iki.fi,
	syzbot+b7f6f8c9303466e16c8a@syzkaller.appspotmail.com
Subject: [PATCH 5.15.y 2/2] bluetooth/l2cap: sync sock recv cb and release
Date: Thu, 17 Sep 2026 06:00:04 +0200
Message-Id: <20260917040004.21041-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260917040004.21041-1-kmehltretter@gmail.com>
References: <20260912065526.833703348@linuxfoundation.org> <20260912065546.976652519@linuxfoundation.org> <20260913202907.3100-1-kmehltretter@gmail.com>
 <20260917040004.21041-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Adam Davis <eadavis@qq.com>

[ Upstream commit 89e856e124f9ae548572c56b1b70c2255705f8fe ]

The problem occurs between the system call to close the sock and hci_rx_work,
where the former releases the sock and the latter accesses it without lock protection.

           CPU0                       CPU1
           ----                       ----
           sock_close                 hci_rx_work
	   l2cap_sock_release         hci_acldata_packet
	   l2cap_sock_kill            l2cap_recv_frame
	   sk_free                    l2cap_conless_channel
	                              l2cap_sock_recv_cb

If hci_rx_work processes the data that needs to be received before the sock is
closed, then everything is normal; Otherwise, the work thread may access the
released sock when receiving data.

Add a chan mutex in the rx callback of the sock to achieve synchronization between
the sock release and recv cb.

Sock is dead, so set chan data to NULL, avoid others use invalid sock pointer.

Reported-and-tested-by: syzbot+b7f6f8c9303466e16c8a@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
[ Karl Mehltretter: applied in the form this commit has after
  f1a8f402f13f ("Bluetooth: L2CAP: Fix deadlock"), that is the
  chan->data clearing in l2cap_sock_kill() and the guard in
  l2cap_sock_recv_cb(), without the channel locking in the callback.
  That locking is what caused the recursive chan->lock deadlock.
  f1a8f402f13f removes it and moves the lock to l2cap_conless_channel(),
  which the previous patch does here. l2cap_data_channel() already
  obtains the channel locked from l2cap_get_chan_by_scid(). ]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 0b51c3e0f469..bef6a948d7d5 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1237,6 +1237,10 @@ static void l2cap_sock_kill(struct sock *sk)
 
 	BT_DBG("sk %p state %s", sk, state_to_string(sk->sk_state));
 
+	/* Sock is dead, so set chan data to NULL, avoid other task use invalid
+	 * sock pointer.
+	 */
+	l2cap_pi(sk)->chan->data = NULL;
 	/* Kill poor orphan */
 
 	l2cap_chan_put(l2cap_pi(sk)->chan);
@@ -1519,9 +1523,13 @@ static struct l2cap_chan *l2cap_sock_new_connection_cb(struct l2cap_chan *chan)
 
 static int l2cap_sock_recv_cb(struct l2cap_chan *chan, struct sk_buff *skb)
 {
-	struct sock *sk = chan->data;
+	struct sock *sk;
 	int err;
 
+	sk = chan->data;
+	if (!sk)
+		return -ENXIO;
+
 	lock_sock(sk);
 
 	if (l2cap_pi(sk)->rx_busy_skb) {
-- 
2.51.0
