Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792789888;
	b=kUd7l6Ek+orKAxS/w35uD3LS4OjMYq+bgucRwWUw0zr+TGJtWGZe1Qz6Q/FuKT64ZyW5
	 Sns+CpRZzcOOkUcdcZB0x3oXATsotR0zNWrawNTFwFLEEA07ECx4dBkJvVlsETEL/va4t
	 uPxf3S5K0cacBDZp83MUOgIXXE/U1h4hhs7dd+24UML/O/NmJK1FLmgna6e/d3WFFvfBp
	 lI6mzKSZF4M9kO2Ubp/QiDOnkoinm+kxqkWwZ0Kq3deo1WVaRAVtoybSBHqR7UxuV6CrC
	 JpbdK+2p1n/m+EBqNzyvNihyIHXog1ifUNfdhxvo4sdbT2TEkn5OVJkxfcmQrDea+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Z5W3YqAiuEHHNgCmWNPu2h0CpdPIOg8Syx8Os9bGaY=;
	b=ffDNBvKb50Xm+Y8jjFgEIjElwapz4OLYXGnvmXUn5YeOiH7X1PHKIymOYkUDXyH+wTry
	 suJaEELdSavvDt1cRCT5BJcYBsLARKNWmhujj1XN6hQBBqZ885oZhbCICb0/CUanr2ANe
	 Z/rYUWVcfCO6MQ74Y9tTIUqvAyKjadHL6Bpr/xbJUSp+8UGlkGLGvutpkPOsJ+zM9fr9l
	 Y7VpqT7UpvVp7Zn2qVwfWgjLiesLeY9yLiSdpnCKEa0Z7L5bBT8vET680J52U+j0rgbOl
	 y6DTko00lYX61kmyjz+YPjez6pt6wwe+XmntMnz7lsUlGAEK7lK3j4q3G0g0H/MT03A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dp37n/MZ";
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF8C606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF8C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dp37n/MZ
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f1cf92c9eso147204385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792789887; x=1793394687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Z5W3YqAiuEHHNgCmWNPu2h0CpdPIOg8Syx8Os9bGaY=;
        b=dp37n/MZgj7A1eeYByBqhUWFPzQVyoQz7k+DAfUetz91bczKXNyjxgvWpvAlqTDCUj
         oBXFal/JZ1YDquCo56cFjSsP73VW0umXjhc4+SIHy9VrknZfDySfws9bZ3erVuwxQkey
         4obB9o66pgZAidNHx32EWJnPi91pSrEvzWs2NMr5pkUyoOzIJIl++cXcjMBo38vQFpPe
         aMOHthTNhDDXpYUaJiLjjUYwgo/XWb5O+QbAFrSUBJBPyKNtXo9oV5eofeXu7lXp0JoQ
         41twTQhWrfGOZXVyH/4sNOnwVq+xxQT/schkKtT1URM/Msg2hIT8KFSFdqHa6vY31Kf/
         kJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792789887; x=1793394687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Z5W3YqAiuEHHNgCmWNPu2h0CpdPIOg8Syx8Os9bGaY=;
        b=UgRvfT8P6YEqICgOvVZ7mjqhXjRfhVfS6MXuTmo3kwAiEamUybuMdoqIh/YK2K6zI8
         NxdFOJeA4XPajuBVg5uKHHJ6t1YjndLq6XAyba7tQ5rL/YTxDi3EfaBZB8+sWx9595bU
         aMqA9gCEj3vWtEUO99lQlYj51Jy7IheQBGIoSQKVXkt2s49bzJg41OO8BzIizzIUJQHv
         nBPy9WJkbL7yfzJJFg0L79aP+fyvg6aOzPyRIhLy0Os5lSi8LZhOj43oRwAUoi4Auma2
         DUneS4m+/1+WIc1o7KXKYlVYJYd+y0XcKBDjzfSaBx1seUpMhcqcyqMSZtK0J41Had26
         fsgA==
X-Forwarded-Encrypted: i=1; AKwUvBye6fWsRaDOW83dUTIPwbE8zc8Sngeam33wW3JonBwqeNV7dww/YBrZrEvZebFkvC/435Txh9SHFWVTpRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5bKaHms9tFqS9Dai50rXUUvmL+KLucH/LC33zC008gRBa1MqY
	lkDGVoOxx/F9Euz8iZvpq69YPkzYMyBjXIVxeoGQrGBI20lXJRY4ceIRCePDke78
X-Gm-Gg: AYBFou3/+R04LQlaijnYTw+1invtcZvUmBUWQ5UewoVk/yJ6k90o6JKDQownod0OPp/
	jfFXsnXRQbmRxywHgT5iTsXux2nIpEl1vCpY1EPbGiZnyuGcB2J1L6rY5oi4WqyMuH42OPSAF4J
	7YrX3tUwd68pu7VwqgMuRSasgOyzKaRhEIetvFrPWwYWiC6owVV7erylhkBtTYUkY1GcrQXinf0
	Tzjn8Mxpty0NQPMAoceQ5AJgN/3NE/p0pzTO01rs7qdMj+dt+zf2xRuryM29C9OAQzNr9FoYKuW
	qlBcGPxH8dr7NeYK5u7y5NOlGEocH8SsyJ7PK3l4+KVcB+QFf/vv9EN7mumDN0/L32mGLkp+ArJ
	Hbq0bagzg7xeIsBM6r7ngcmos6bRR8OXs3Aq8BL9yWyVK1tU25iasEITpUc7l7q4kxP9pTSdJX8
	SDMA4Ob6JeLLd6x6HX1mBEbu0kkuXbBxp95XpC1vRRPMcC9Nxgpu7qfQZuEpiGpOSiqw8r2AvbG
	q8l4/O5GztH6BxpnzEieVbNO9258vgoJmeoyDATVn5Uzk3cwMV5La1FDOYvstuk7A==
X-Received: by 2002:a05:620a:4556:b0:93f:12d4:67cb with SMTP id af79cd13be357-940ef9c4921mr36665885a.80.1792789886653;
        Fri, 23 Oct 2026 14:11:26 -0700 (PDT)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f066958csm9222085a.15.2026.10.23.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:11:26 -0700 (PDT)
From: Changyul Lee <lcy8047@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] slimbus: messaging: hold lock until transaction is completed
Date: Fri, 23 Oct 2026 17:11:25 -0400
Message-ID: <20261023211125.2738290-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

slim_msg_response() releases ctrl->txn_lock right after idr_find()
and then uses txn. If the request times out in the meantime, it
returns, and txn is no longer valid.

Keep ctrl->txn_lock held until complete() returns, so the timeout
path in slim_free_txn_tid() waits until slim_msg_response() is done
with txn. Call idr_remove() directly, since slim_free_txn_tid() takes
the same lock.

Tested on v7.3 with a delay after idr_find(), in QEMU with KASAN
and on a DragonBoard 845c. Without this patch, both reproduced the
use-after-free in slim_msg_response(). With this patch, neither did.

Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")
Assisted-by: LLM
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Changes in v2:
 - Add a summary of the test results to the commit message
 - Remove the blank line between Fixes: and Signed-off-by:
 - Add Assisted-by: tag

Detailed test results (QEMU and DragonBoard 845c):
https://lore.kernel.org/all/CAKefsHuMzUr6LForJnx4ZQiBUMLQm60_iNEKmjxnGDTVxr88Cg@mail.gmail.com/

v1: https://lore.kernel.org/all/20260911045911.1327413-1-lcy8047@gmail.com/

 drivers/slimbus/messaging.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index e2dbe4a66b70..aa98f5480ba4 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -29,22 +29,24 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
 
 	spin_lock_irqsave(&ctrl->txn_lock, flags);
 	txn = idr_find(&ctrl->tid_idr, tid);
-	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
-
-	if (txn == NULL)
+	if (txn == NULL) {
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 		return;
+	}
 
 	msg = txn->msg;
 	if (msg == NULL || msg->rbuf == NULL) {
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 		dev_err(ctrl->dev, "Got response to invalid TID:%d, len:%d\n",
 				tid, len);
 		return;
 	}
 
-	slim_free_txn_tid(ctrl, txn);
+	idr_remove(&ctrl->tid_idr, txn->tid);
 	memcpy(msg->rbuf, reply, len);
 	if (txn->comp)
 		complete(txn->comp);
+	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 
 	/* Remove runtime-pm vote now that response was received for TID txn */
 	pm_runtime_mark_last_busy(ctrl->dev);

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

