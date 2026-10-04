Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B6430F81A
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131165; cv=none; b=CxhWBxfSOE7QIH0PUbW5gbGnwNd5c0WnFdOzTqeG/6dTZizgXDS2Ln1xwaLWKzcY7W8PA6yJ9GikJnwpLViBtXUYAxck07jAcU1mAuU8c/6pmXBipz+DOSWn7+H8Q1ZQkpsb61Xmt/kwMhuqDgX0ZptqJ4SH/eWN24CkGBAANcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131165; c=relaxed/simple;
	bh=amK8ElqSX7xxn1c3t7Pk4XyCHGO72+Mj5UglIjSJuJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUTA0BhmdW3DOb5e2mQjNkRvFALyGnA5Sgx6h+pJ4c3rQ2W99tCbqIbS+d1uOPezgpqxsR6znr9KzwLw25eVYuXxXPsKuRcjmNpIW9RPsGL/yPjmdLDsuLBGkGSgPZBCtj+/JQ783l2LZUpoQcNHbdbCYBsBRE61hRrj5BQKFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8FG3ZPe; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8FG3ZPe"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-351258e7e9cso27449eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131163; x=1791735963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZ1eJoTadH6bv11VGShYOIfVRmew2zzu4O74pMeyNJs=;
        b=O8FG3ZPef9jFyyxb6yzCGWm3oJKDaAmbrSZo7WpLSOz0hVZRI4JFAE/3AGzw9lzy3D
         bREy/c48I0iOEQAu+RUHKEvT0ibRBziQW822LI6R2rJ4/0Jx7ebPDO7VM7fwD8+KC57j
         p4x9V8zQN52SGuKyVGnBaaya9yKx2M8ib4c+8LFypciDRsJaf5UG5kva8+g3pkt3n8xO
         Iwa5KsjHcg6gk/iJZD0GC4qXF+nGB83i7Ye8qLOkJ3mbYDEnV2iSuZu2brfPYOS8YpwQ
         l+tGpBr2owT+mHWlhS6PssJVMk88YevVp+/JQYOjtRflGdqCcd9vOj7qn4UX4hY9qOqW
         +FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131163; x=1791735963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZ1eJoTadH6bv11VGShYOIfVRmew2zzu4O74pMeyNJs=;
        b=kiZ6Zpj+RqwpxMvEi4U113Ks4QbBcrslmlJLQTif/nvyqMLmqIhB4LNoJrtzLb1bFP
         eUE8frWLC1sEr2JK04/iZLcCw7eDJpIM8lFeBwRYWARLFKi07TQHNlwl7/YmJXZwYD11
         VNLzj3oLeQI/yDSJnhh31gd1seQYRBHTopmh25o9RrnRY82dMaf45ryuF9ozGiNb3AeB
         Jr2OKjm9S0+SlR2JnGejdrw1T5plMXt7HjUjeIeBZT9oNcuFX92uFaXgHICqgXMKPfZ9
         Zsayq+ptOcY7oAn6GaprsvQPchEBCTN5pj/4dQR8/rDfWqIIRtxAgC+UJVp9L8FEi0DW
         IGrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqQRrWab5uGeM/nRE4lbLlIp8PVjTxLAtZtPv1sO44az+zWKS6CX0f0dPtVOS2EFAKX3tlxdGuah8PEZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw+fwRKSjaGnaropOQFarmO0vh76/l/aEkMJmklSoWdAcF3Kfc
	7k1TucthVYZky7rAFO1jfHorWTwNm+yZFVrj5DH6b4KZVmUATkG3NIpx
X-Gm-Gg: AYBFou14R3DGQ143/CyV+FDBkGaUmysFsEDetI99g7987qNQtJ+oavcEpo5ID0dchq0
	B5rRQ3RzufnJSil3TbBZw8qZJ3XRgUQKfnismSSyoW2I6ydjbIxFcDq+Uv6kRogXF/3xL5bBx0V
	KJ/mJN2WwT4kRV0mmPZ8qcKdnpVR1C72PP194KLD5qtxKEYTkXg9vG1DGsVIaYBxChRP+QeCPgX
	hO7VsiifnNdOal6CPsg+2ZnIEZHgpaLhbrHgh48cM88kGMnSSCySZZO4cq3iA2WLn0kTAciJQzV
	9c3OCsXLEtY5e6QmuXfMg9++xvjg/ayoVUuITnBk2akjxmdLSg1f+94wHjXmZFHjq28J4+E+O8C
	FLJZ2qCX3OMe8A+cGAcbh+Eo/RNUGtGF2JMCR3QZw2pqn/mnhiHrd8jCVvPhiYnwMXGgdWvgvXs
	xEZTzUXiKQXAV+whQOZ6yZK2Re/sIf49MaRZpdbsb2vU1NGyA4O64xWA5Uh5yebJswV43eJkY0T
	ncj1bGTrDWDgJbRNJ298sTG359BqjK6my70OvYKuGOdWZfcg+EtVCVQX44itzYqwdf5VQ==
X-Received: by 2002:a05:7300:24c9:b0:343:fdea:9a0 with SMTP id 5a478bee46e88-34f15028c8fmr17583068eec.2.1791131162529;
        Sun, 04 Oct 2026 09:26:02 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272ceb02sm11517960eec.25.2026.10.04.09.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:26:02 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Iulia Tanasescu <iulia.tanasescu@nxp.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: ISO: Reject concurrent BIS listener setup
Date: Mon,  5 Oct 2026 00:25:48 +0800
Message-ID: <20261004162548.3968712-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iso_sock_listen() drops the socket lock before calling iso_listen_bis()
to preserve the hdev->lock ordering. Two concurrent listen() calls on
the same broadcast socket can therefore both observe BT_BOUND. Caller
A can attach connA and release the locks, then caller B can acquire
them and attach connB before A publishes BT_LISTEN.

__iso_chan_add() checks whether connB already has a socket, but not
whether the socket already has a connection. The second attachment
overwrites iso_pi(sk)->conn, leaking the connA reference and leaving
connA->sk intact. Socket teardown follows connB, so later events on
connA can cause a stale socket access.

Recheck BT_BOUND and require iso_pi(sk)->conn to be NULL after taking
both the HCI device and socket locks in iso_listen_bis(). The connection
check also covers the interval between attachment and publication of
BT_LISTEN. Reject a competing setup with -EBADFD through the existing
unlock path before allocating another connection.

A recorded KASAN report from an instrumented kernel shows:

  BUG: KASAN: slab-use-after-free in iso_sock_hold+0x119/0x1f0
  Call Trace:
   iso_sock_hold+0x119/0x1f0
   iso_conn_del+0xe4/0x270
   hci_disconn_complete_evt+0x351/0x8c0
   hci_event_packet+0x71b/0xb20
   hci_rx_work+0x293/0x730

  Allocated by task 93:
   sk_prot_alloc+0x113/0x220
   sk_alloc+0x2b/0x6d0
   bt_sock_alloc+0x29/0x370
   iso_sock_alloc.constprop.0+0x19/0x300
   iso_sock_create+0x94/0x100

  Freed by task 93:
   kfree+0x121/0x3c0
   __sk_destruct+0x42b/0x540
   iso_sock_release+0x29d/0x340
   __sock_release+0xa1/0x260
   sock_close+0x10/0x20

Fixes: 168e28305b87 ("Bluetooth: iso: Fix circular lock in iso_listen_bis")
Cc: stable@vger.kernel.org
Assisted-by: GPT-6 Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/bluetooth/iso.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index 7657c2a0abbf..2e70c0df9ef3 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -1340,6 +1340,11 @@ static int iso_listen_bis(struct sock *sk)
 	hci_dev_lock(hdev);
 	lock_sock(sk);
 
+	if (sk->sk_state != BT_BOUND || iso_pi(sk)->conn) {
+		err = -EBADFD;
+		goto unlock;
+	}
+
 	/* Fail if user set invalid QoS */
 	if (iso_pi(sk)->qos_user_set && !check_bcast_qos(&iso_pi(sk)->qos)) {
 		iso_pi(sk)->qos = default_qos;
-- 
2.43.0

