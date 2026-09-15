Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53713A16AB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455724; cv=none; b=i/3EtBhglsbRpDLLiFXDaveYKyj8j7UTdUlWsjarxNeBRTmlcs6RFU4xT1b0P8pL93GdIffnL0g13dxLzR+UAZuEZL2yMXIe5VgHAkLDYo1KMBC3LDKZ9+9p7NTNILJJYds+8aFySfVSiSBVWV/Zhh3qgyGDSUJgAi4uCGi+3dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455724; c=relaxed/simple;
	bh=PnZPTWSMbJFLqmzZylh0ufIhiLD7YCit/Z6WxmZ2+3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhjH2XO6boaRa3Y0ETPgernCD2ITx2wJmot2yZ1L16bW4UViA0npyA8zULA0sou/r0hDpyFMwb+u7qTOyKQgAD5RbXhQhvyx06VOIRcfCAkN2O3bEAoF87t1Pec1mOlCbBpe5odtksihSLtNNT5YL3Ae+vfnnlg/FIMPGHPw5fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftHLJydL; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftHLJydL"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b89a0e69dfso3025264e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455720; x=1790060520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjuyMICCrYkUM++5c14PtDJ8fduutsgs593zdKpvwvY=;
        b=ftHLJydLHKbqIoMI8ODGmcr4U4Y7tBey25YH0zCDeKAINYSlqqSegzs8/cX1pFtCGB
         dNwcZJ8cMXUaUwDIm3hzR/qd9EAxonFgqiXgcCp7cFOGznlkQQCD7HOKszIFuiD2bZ/K
         KpVq/XlZXU3mI1XfCwYM820vydEOZ0D0RhB5L1crZhG2ZQ6rgqqqYfjQV4DXPofIFK5N
         PheSyuR5faFna6FySJn9opEKNmnIW8TCSU5NuxBB+uEZcGYAsV7t6Mm2DrBTKB5gRHHa
         Kj2NgwMbHZZnGUbsgZJU3pUm/2PjM95AKZB0wLyX7xRqJPnyVtx4bJryuQCO7c+KJd3m
         +RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455720; x=1790060520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjuyMICCrYkUM++5c14PtDJ8fduutsgs593zdKpvwvY=;
        b=d3mq701E6nDgv7LRvU1MDzKlZIPLSsDfFWrjz5wmVp1WfgDocWJHcrEamTrsCfmhkN
         dvgMN6aWKFuUrNi+pJkZfBB72+0CxJytq0WZZWlrFsyQM63I8xCK9jIRkgROFgUea3vw
         SgLw+6SwDN/HEnzktLP9pVd4FBYpn4+Kc1ATr66S9qeolRvlc3Tbqs7LbH9qSdnWQqVu
         dXSCTP/6l48A3xfogRNaVlk42uee1d7hA2ig8gtjLyD4yDuf5tcaBvYgITJNI7gRdnwr
         YgiTyA0zlwdRqmE58Qbvo9cRNi0Zoxh2hpV5HBUNA9UmriOxEOTOkPTTGuyNoQA3Kb7G
         6iag==
X-Forwarded-Encrypted: i=1; AKwUvByL3JdgHlP7q6xH188CyGP5737zD4anxmng4X2NPbjpX+fvtGor8tMGyUy0q7UJE66mUPr7WE4hXgvJy60=@vger.kernel.org
X-Gm-Message-State: AFuF++lfiiK2RojvxZR5/iwF8xRciUykkGfwXN106wQTQTezMy23HPr3
	kXfKaeJpwb65tmbj+CaInUCwpUdiTH+J1xSZaNW7pw1pOCqJpBRQWMAS
X-Gm-Gg: AYBFou3cRt7LFAEZajoPFtR881SUVpTFDyEm/aX3XgXcAYxRz7ABLpAfKG9elrRutd9
	lW2aEiSBjT5V5AvBBBw+wWiWuJvX2AERB167lqAMw2JE/ZO4PhUSXci8mf98E+fn5he3ml2HSVB
	hxI2+rG3oxPdhg8mLBwdR4UvPWeW4cwlciNNIxCMLORbXDsg3N3qspj2DdWhfpZpfesPqJHl8F3
	P6pbprLtoRGa9khY8nIr9ZUKwTkl+6OxEMpU6r1Ttww6KiT/PkG1b/u/QTa+sXuDYoGAuSKedfQ
	DjVQc/RIiY7Oin+b1MgIIGxl5tf31a3jZx533WiYIpLgTwgDavLnwKDIcWVdF+PaD6KxPMvICi/
	8YsabzVFSb+fBg1Gd+Ukpee8P7sFh0HnbUdqWo/hGF+E5amLcIW+GwnZslJySSHrAfio1s8IEIM
	7rQkgL4rWMGXvEysrdBNSf+2bQ7/xbNdwWgVpAqu7lNuK82Z0GHGGnoOkHHrtYyhcJK/KrxMWeA
	PmnS1KmDXlc+is=
X-Received: by 2002:a05:6512:32c6:b0:5b6:183b:d218 with SMTP id 2adb3069b0e04-5b8ae6a7786mr1558561e87.63.1789455719335;
        Tue, 15 Sep 2026 00:01:59 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.72])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a88a5sm3002566e87.8.2026.09.15.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:01:58 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mikhail.v.gavrilov@gmail.com,
	Maxim Skokov <skokovmaksimevg@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] Bluetooth: RFCOMM: free the skb when the DLC has no owner
Date: Tue, 15 Sep 2026 10:00:46 +0300
Message-ID: <20260915070119.45143-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rfcomm_recv_data() hands the skb to d->data_ready() and returns 0
without freeing it, so the callback owns the skb from that point on.
The tty implementation frees it when the DLC has been detached from its
device:

  static void rfcomm_dev_data_ready(struct rfcomm_dlc *dlc,
                                    struct sk_buff *skb)
  {
          struct rfcomm_dev *dev = dlc->owner;

          if (!dev) {
                  kfree_skb(skb);
                  return;
          }

The socket implementation returns without freeing it, and the skb is
leaked.

A connected DLC can have no owner: rfcomm_sock_destruct() clears
d->owner, while the DLC itself stays on the session until it is closed.
Data frames that arrive in that window still find d->state ==
BT_CONNECTED in rfcomm_recv_data() and are handed to the callback, one
leaked skb each.

The leak does not stop on its own either.  The remote runs out of
credits only once RFCOMM_RX_THROTTLED is set, and for a socket the only
place that sets it is rfcomm_sk_data_ready() itself, below the return.
rfcomm_process_dlcs() keeps granting credits, so the remote keeps
sending and the leak keeps growing.

Free the skb, as the tty side does.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Closes: https://lore.kernel.org/linux-bluetooth/CABXGCsPe5wykd8Aj-hm+SJ7SGQyb8yoGNnx3XDpPmBathj+EGg@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
Assisted-by: Claude:claude-opus-5
---

Notes:
    Noticed in the v3 thread of "Bluetooth: RFCOMM: connect the session
    socket without rfcomm_mutex", where the same leak is described.

    Found by inspection.  I did not manage to produce an orphaned connected
    DLC on hardware: it needs the socket to be destroyed while the remote is
    still sending on the DLC.  A kprobe on rfcomm_sk_data_ready() over an
    HFP session (RTL8851BE, btusb) counted 31 frames delivered to a live
    socket and one rfcomm_sock_destruct(), so the window does open in normal
    use; no frame happened to arrive inside it.

    Built and loaded on 7.3.0-rc1 with KASAN, UBSAN, PROVE_LOCKING and
    DEBUG_OBJECTS; HFP and A2DP sessions behave as before, and none of the
    sanitizers reported anything on the RFCOMM paths.

    v2: no code change.  Removed the trailing whitespace on the blank lines of
    this section, which git format-patch --notes adds and gitlint rejected.

    v1: https://lore.kernel.org/linux-bluetooth/20260914173044.5249-1-skokovmaksimevg@gmail.com/

 net/bluetooth/rfcomm/sock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index 958081adb9..82aa38715c 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -48,8 +48,11 @@ static void rfcomm_sock_kill(struct sock *sk);
 static void rfcomm_sk_data_ready(struct rfcomm_dlc *d, struct sk_buff *skb)
 {
 	struct sock *sk = d->owner;
-	if (!sk)
+
+	if (!sk) {
+		kfree_skb(skb);
 		return;
+	}
 
 	atomic_add(skb->len, &sk->sk_rmem_alloc);
 	skb_queue_tail(&sk->sk_receive_queue, skb);
-- 
2.47.3

