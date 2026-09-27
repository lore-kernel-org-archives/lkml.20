Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C9C3803F4
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790491522; cv=none; b=kdI2xoppgzLoyjZdGpOfyZIwiyiBXlfen6v74RY2XN2Hv9mwyVejh5T9VoSC0UUMexURHuziIkzlmg0ARNCWQvQUe7jkRyPba7IvfzAp6jZ+s9Y43jo3XqyboPYD3ziv4lU1yZD/2+0xGInPlt6PZkkQECOEG7zSHELJSZKbCQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790491522; c=relaxed/simple;
	bh=IusPeKAJrDZ46U2jETL99MVTQOKyVY1wsj+XwyjWn8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnVUmmOZVlskejn+K3pthBVY7uRmL1IBNk+9mfin7FdXlNUvtNcf95ioleEh/QyxOU/OhrdeODBRpAz3pVefrJdl1fPbEbo9bZW2JKFrTlKZ7Dpy9DbIhVwAH+1h4JMm1OIpstpvQXZxXJ14EmlkavDY1BJCOlqoNfaakvosXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjpfP9VC; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjpfP9VC"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-141a5d476abso84668c88.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790491520; x=1791096320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzB52n2hHJSMUa77CwTdg5ONrHIeWBM2nfC/CVriigE=;
        b=FjpfP9VCFTI7RhrRfiv+teakNo0FXor34e2FnXr5S92AP17IkceCIpO0uBmFXZwY05
         kbRiCxxAkWo1gDQK/l+HqGnnYenwbRSjcC5yP1+oJF6wTkp/t09CuUIxd0rJK/vNsRuu
         KoF+85jlxO6yInuPL4GfVGevAYENNGdVC2LNLNEAY+2siIwg7CdrObMvE3ZFcc++mUYw
         G8MQ+ogFmbyldUhRzEK5lRb/Dcbu+OW6yNY9Eu8HFlgYhEp6cyKiMZ0fgivHLS/gRk1w
         UK5MhChqSfWEgbHTUFTvx37TCTlg0Wm89BiZ2sWwsAnmDRJGQkE5lC0qGrKGRadw3okw
         mJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790491520; x=1791096320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzB52n2hHJSMUa77CwTdg5ONrHIeWBM2nfC/CVriigE=;
        b=EUq+T/aXzwDDtrWyCuX3H/M94KTStxK2KyUE9wk4CISnwWz5Yw+wDDD2z7hYo5mc98
         M0nL++Lq94/2SFl8tes52xq4NU9fsJtu51HYS2LhmZF3ghTy0GYOFjBDDyHzq5DLJBLj
         GgKQs+cROd78wTDoof1FRQ9tq6Xb5KY3KaMC4Mse6ynH3MFm72YemjSSHfEhS6nvWcR8
         Dsld4wYX1LRtoK/pMoM96Tvexbt4IzOWKaJTC8tr460djY+EenSKMDWhdens8FA8UB06
         5W+H5Bsg+K8eyibNJo7sNBZmlYGLiB9yxpDvG3Byy2t0lKqt/34HkukrrVAQanXPNT3H
         5nkg==
X-Forwarded-Encrypted: i=1; AKwUvByIUQK5BUCV8CsZ5Eha5pUbiYITXJDLICDRvaDcc64ayKXNKNNk8eXWfILR5qyHBb1vNMoxjuymYzujEWc=@vger.kernel.org
X-Gm-Message-State: AFuF++lYeRNTiKIgRls1eMcYm87SYF7RXRHyJJzi/hI3ow5kak8qNbdF
	f5JYqyZqzhm8NsnZ0hrN9kJ03TR55qEHbau9KzbEcsosQyX17nSiaii9zaaTCx0AMl3wwQ==
X-Gm-Gg: AYBFou1RHDqWZOqpHGEA+n/POrIfh0TrFGCm1UQrDTNB6hmIJf9GqKNV/DUCTHYJ9Vu
	xOQTaqt78Hik3awZbW2C8YFCxspUQcyNVPFFPc0xntKUfhWrt8ivkanyFX+epegyRbTv5EOLrM3
	0NI0006s54FUxqCQ+8frRFWmSGCnDnv82KVHWWNRNATWsR8NfAjXu/B3V0LsaCoJhSqzc5OyYtr
	t7yBL28+CA37g7fWceeWWoF8zdsqKQkQ7/ZVyh9VEwR2HJ1wrRwBt528gMSgwOvwrPSXAzNFUPQ
	+08XX5rfSLZnkc0ukBIYdTSsS/6hLQN5HccHZyGv0wuIdqnjFINzKa552zGZbvmZ7cRW3HxQw3Z
	U7n5UNRK2oNuWBlgYyLrKYdHXQ7cUsel1CpAyKKX5wgH5+RLG4JaLBFj5rteBgOUMEDk7OKlzlc
	OYoH5Xbpoo9fnn/+vEXuevLPqgQCMDeQEB7QJmIDKB7kBrXJN7mXdffkbFJy8+Q7fRK3DCORq+Y
	IrOGbaKCLMuYv1bq72xn8ig3FQX7AWeBDZ7jcGNhZIrkDyz/mLwdDLysOy5Og9z9dPf2g8=
X-Received: by 2002:a05:701b:451c:10b0:143:8212:a43 with SMTP id a92af1059eb24-146cf7ee027mr8050559c88.1.1790491519432;
        Sat, 26 Sep 2026 23:45:19 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adcc5b00sm16702763c88.15.2026.09.26.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:45:18 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] rxrpc: Prevent reusing service connections marked for reaping
Date: Sun, 27 Sep 2026 14:44:34 +0800
Message-ID: <20260927064434.3692113-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The service connection reaper changes conn->active from 0 to -1 before
unpublishing an idle connection. The I/O thread can have already found
that connection and acquired an input reference. If it then allocates a
new call, rxrpc_alloc_incoming_call() unconditionally increments
conn->active, changing -1 back to 0. This violates the reaper's final
assertion and can panic the kernel:

  I/O thread                           Reaper
  Look up conn and take input ref
                                       Set active from 0 to -1
  Allocate an incoming call
    Increment active from -1 to 0
                                       Assert active == -1

The kernel reported:

  kernel BUG at net/rxrpc/conn_object.c:465!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  Workqueue: krxrpcd rxrpc_service_connection_reaper
  RIP: 0010:rxrpc_service_connection_reaper+0x768/0xbc0
  Call Trace:
   process_one_work+0x5f2/0xf20
   worker_thread+0x46e/0xda0
   kthread+0x2b2/0x390
   ret_from_fork+0x36e/0x5a0

Use atomic_inc_unless_negative() before taking the call's connection
reference. If reaping won the race, leave the activity count untouched
and return through the existing BUSY rejection path without consuming a
preallocated call. The caller's input reference keeps the connection
live during this check. If call allocation wins, the positive activity
count prevents the reaper from claiming the connection.

Fixes: 3cec055c5695 ("rxrpc: Don't hold a ref for connection workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/rxrpc/call_accept.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
index 47824120f1da..87bc3af2208b 100644
--- a/net/rxrpc/call_accept.c
+++ b/net/rxrpc/call_accept.c
@@ -299,8 +299,9 @@ static struct rxrpc_call *rxrpc_alloc_incoming_call(struct rxrpc_sock *rx,
 		rxrpc_see_connection(conn, rxrpc_conn_see_new_service_conn);
 		rxrpc_new_incoming_connection(rx, conn, sec, skb);
 	} else {
+		if (!atomic_inc_unless_negative(&conn->active))
+			return NULL;
 		rxrpc_get_connection(conn, rxrpc_conn_get_service_conn);
-		atomic_inc(&conn->active);
 	}
 
 	/* And now we can allocate and set up a new call */
-- 
2.43.0

