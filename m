Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D7385521
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407068; cv=none; b=sP+sbhSPXvTe7qHgbxiBVK6Bk3vnKz6U7+9ujx4H7Xb8UuDa+Vbd0QC06YG3XJctHDIlfUk0SdHgPbtQMAq3aMso18CGepcBRk12dtf0/H77oUDYW252c9EKK3TExU4uoFBy87kiXTXZFmf5Okk+5LlGWpTw/Q7ujxrvfeh4NQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407068; c=relaxed/simple;
	bh=qHFSpRikwa/nn6MFHRYhx4cMrvlGxbQe1RFuOZb4iI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=enzsOUq3V5KE1AuMuvwpDRi3lB8iX5eCnwcyvGr7z0fJKUML4RSGaxxuUrwRnQc1AzwEvPZAeBAWpynVW6OxpWtC5/wBrPgPwYVA1MrrvPqq45t/8FGQYtVxbuva8YNWB9HbgxmlN8UE+ujP1NktrL9qnSMjj/Zmfy+wTwzRtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwuP2ooL; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwuP2ooL"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a318299b93so17623611fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789407062; x=1790011862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uejRUvyuFcc6D/L4RGNRyiFIR0zJDJV2e12Q9seeuxg=;
        b=hwuP2ooLLZmSOUk9fVY+YoFXzpVfQGMeNXomBnAeswGCFze2WNQCjuJGodl9JvwejN
         S+RQC4C1e3gBYet9wRCgGHnN6LeKNXWYCUJlFDmWs/q5rV2P/aFovQ9LgYZ5Z3aJ/ZqJ
         N96nu813pfACKKYDOplW+TBFry5q/FT9daS7HixJKMqlb9IpRDG/Zg6kkVNztyCDRL3K
         Yi6Z0ENn3tHMzfgn/YZHnZSkbSD9fKpfzCcH4E2tQXztf1gQDmQFf5C4h6ggrxrIIPqU
         PD0ExHT2jRFCxvD5eGVHhW/rCWa1XU5H/ats1Pj7RPtcwL63ydiUqLDX3SvIHZaUtmQg
         mRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407062; x=1790011862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uejRUvyuFcc6D/L4RGNRyiFIR0zJDJV2e12Q9seeuxg=;
        b=jSmSkYTxDe1LbisXmvxBSAZz5Jl+GlDV+GIGjaWy7HrgIrj8EkS33FuyQjvBXK+C+e
         jNMBz0WSrNcHpuRjWvpvHtE/CuRIOGQ94dYUZi6f0GhezaK+4gUTIaMcMGPOLUCxQVnA
         U5+yw2jeiy/aFZqgtdFA4XzRVHA+bOXvLSgONEh9HGhcPMQ5w5rSpTz4b0J/ycMwNCjr
         Wl8b2/Osw1wdDHn+eRah72KZCV2GTDvIrU7LiKbl7nY1nXlxQz1ym32H0G5XBSm0VuEb
         F5Utt049s+gVBHvzqcsr455bhlXzAvOZIwoFPJ7h4WcCnRPWihTgIKY1UfwYt9KknRkm
         Tvug==
X-Forwarded-Encrypted: i=1; AKwUvBwQl+AUHCSfRcdCSjvO2hT7WsGQhJZpSY0Wda1zDV/fmp8UUycpJLviZmvi9+nePLd8HzBQQE7ulQUi7ns=@vger.kernel.org
X-Gm-Message-State: AFuF++nBHwOIwD3nKktWxN8EzsglN2i2sfIMrN5BFzU2iIfZytQzPOpq
	B1T5upYPOMeJiNiCZxtNBmlghoueBNvaxYIx4bmA/j6ochkmadnLDuK5
X-Gm-Gg: AYBFou11fkhXKgbq1Dt/yOyqVSsEZSBOHFciSUpwQS6lAYgwOLqDnVTStQBLh9xYmqm
	UjfA+oCEeVfBrx0mBm6R2AdsWW/dHSqb6zzz3f0my4dBRCAplplfDi47TAFwNvew5WTO05C5bjI
	KlbGldJqk13JyjmF1M7SBtJNKmw5snOiGK9tMcIK+M1dXmRxxKRTXSXevuB8FVd6VhcesH3yRb3
	24vmIvy58pIvGDcNJKFtrED55AXD4wLkzBsA2voV6JsqgereyoyK4WkO4LUISnrmiEzSYawJOze
	kmGy3LlWCisKI5ywCPfSKLixyYoLcBHfk3ljAt47MmJuiIPbtF2kH79d2t2Nx/GZaQm2e3tykN9
	IA/zxLlviYCoFnzP5TXiB9Rdk8jGWytYc3i0kx3TwZezKCPsx6WsoZj8dZbKhgd+mQKUwpdr+Gr
	7SuqjD4UU3CalbUnAOHgvb8Sj6fHYDFS6yAE/BXbvwPJGW/v+/+IJ+wIHZCJfcQRLY8gYY+vaWf
	baPd2ucsdvOZXqw0w==
X-Received: by 2002:a05:651c:31c8:b0:3a3:74b9:8a7a with SMTP id 38308e7fff4ca-3a5c896409emr5494961fa.19.1789407062008;
        Mon, 14 Sep 2026 10:31:02 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.121])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3361f94sm25781391fa.32.2026.09.14.10.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:31:01 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mikhail.v.gavrilov@gmail.com,
	Maxim Skokov <skokovmaksimevg@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: RFCOMM: free the skb when the DLC has no owner
Date: Mon, 14 Sep 2026 20:30:42 +0300
Message-ID: <20260914173044.5249-1-skokovmaksimevg@gmail.com>
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

