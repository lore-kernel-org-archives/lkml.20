Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634830;
	b=db6mUNFzNj/JVqCI0XXIFNOBwAS2m7MI+QkUOpkA0qkGTV21OIM09T3Cdz9RY+D+SmDs
	 t+1dD1mmhCiNLRZ/8O3Bx3xbW9tq732s8p79fp55CDrOjAbMY0XuAHJ6Ci9YodESHJ1KQ
	 1BarUAH/2KhysX+OOqyMlBR1F7aT4++VvmasvXaBvHTHtLEsJB3TAFp9ceANRrWC1omfZ
	 5P0D5V/cAPK0tnJr/WyuJe1AloE6XtuR3weAtijM1aYOKsuc+VXpK/PDNgchVwNThp/Tf
	 4YRW5XlhMLWh3FrW+984sQC7nO4CdAb5hucYTPkXvzV+bOi4rh3XrnhMoA7JKXRVdBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YUOMvaywSnfPxZ52C8XL24limR9Py8D4CfmjHsLDiqQ=;
	b=AeXdGvdVoGkRhuxOXMT9zTQqNoymx3S69DNEkrKiqqAeJM7Cwcke8Kz/FfEUq240mpl0
	 5EZ2SmnvZkZAIA4h2wtHG6mqg6oi7ihVYlETcSY0dlz6Lv9C68lKzoyvTMMJsyFinY1Ti
	 HEBEwy0TAkX5d6vdaskGuhqaxi80UywIwQuZ2UonOn/2SVm8L2c+NTyLCxtjj0/6zcRAU
	 ivq6lKOCUw192DgstNtssX3DvVZBRieAvtD1H9mIknn6b68uut0ZDVw0A9Z5Pn5yu7QSb
	 V8XOiVun10ECKgOT8yqbur9X6hpoUAjQpnnrif8q2wzpx5Q8YddFz+fKzuDvibmcoXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TMMEAWi8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AB360B424A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54AB360B424A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TMMEAWi8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so34087735e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634828; x=1794239628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUOMvaywSnfPxZ52C8XL24limR9Py8D4CfmjHsLDiqQ=;
        b=TMMEAWi8OpwvmknuaspJNf3sj1bU7MxlY242AWQesYlBZ/usL9Bywm5GHfkWtMROp5
         ipLMX38R/AKcGuj0K2WC4C16+/gQ1c+Z+MfJMmMoDP6lwF83DKvqMZj8oGVukOHXAb9T
         LkKj8P89txbMlyStiITy99kS2mDCIPnMsQpmvVmMbRMrObp5iYbiqXiSk4ynU9cnbQ7W
         mliwaabz80QqnFNlleAzFQiU5h0QgFTVucVWFHh7DMhecGwrj37bSeXcV+S8oJ9Y8h2E
         lLdrW/bvnvS6QskO7aL1mGOC31H3S+szj6rcqAnu/SR4MdWddbADxqgne0SGVmpKV+sw
         vfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634828; x=1794239628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUOMvaywSnfPxZ52C8XL24limR9Py8D4CfmjHsLDiqQ=;
        b=vqcJU44A5bp+zrcvT6tVmeRoHhUhu5CRlbik9daA9fX6nAdVHxUToZ3yLOAnQLSkat
         9afNCZ1iVuYwoCwN7kS/atBGaNa2J9kdy0/fvUE+crS9vMjA/tpr50gmc7PSHsWA4ljB
         bG7FVO6a0jN3HlKHaXnON/DBH4FAoFy3lEq/OufZO5QhH/qqTTN7DcRNxbgb08eB6NTL
         6umvD0DFsPnmi7Z9KWg/I5gxmBWKv5mFRTVNf4jXYaA64ZPdVxwQ7yc4YxGJwrCMHiz5
         RN4/UroNMri0W7spoDELRJ6Eg557P3rhthKZpZ1Kl4DHbKql81JjfQIUo0i+bvGuVbmm
         TDwg==
X-Forwarded-Encrypted: i=1; AKwUvByj35IVX7TGvng+BIgnvBYw+5bFJiqP6yeVxUN9R8Es7autUnSW3XBJgt9d+D83/0ehn5EHndc7tpB+wTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoDb4tr48IBrCF/uJGQ3ytUiyAz+Z5rlgZO2ZNhBu57jeUtigs
	OzqnzZC0gLd0cxbxLG1fOJOR1uMNszjwBpvy2HXK5/I+2qDmCKKrCeo=
X-Gm-Gg: AYBFou1wyE+2nOINRZKYM9mh8TBfEF2J9ot0KN6O9fuf0DqM51Cn+YHv5mlpUwU9XFJ
	bimljB+phacfztwA9HQ6y8vAgjO+PqiYS0W65Qbb3n6HzWVcZvJ6xPRrpLTmRtAiZM6MjbP/Y9C
	orBa2Rz/dREtyf5onSyAA6YElE5U2iFfqTzkR3ZXy5s8wxZd00TX/qTiR+QccVGzh30C17IV7cf
	rf6uBLQ4Fo09b7PXYP9fiKBWMWOawKFDcR275r3pwrBdf7dha9bya/5HWFWg/9mO+Rs4EmAfpVr
	g3vhIgExdhDmaZK+AT169m4e928v4D6d1PU/W5E5pY3ZpAIKENNhWN37utreYJI0YV89nvgA093
	v4Dq/hJWU+tZChwfpZeab5YJR9+6Bp6IS9THK+cll0bDDTPJGL0Uge98++t/UvUDvVcX8OcbOGs
	OkFnhKPfi+/pU3ykSSSQmALmBVrrpdFYU9aFHPp/g+1UpYNIgRLYXm1hsyPsufDcd6/Q/4fKbhM
	H1/sjvhn1rhcE6fQQyvlmrvYHRn8R32b7wBgiuKKW2yqVl25GMhPzRVNcAA833M9Q/5S196V8nQ
	BAKxdVAHNSE=
X-Received: by 2002:a05:600c:19d2:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ac1932a12fmr235060725e9.31.1793634827520;
        Mon, 02 Nov 2026 07:53:47 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm234689275e9.4.2026.11.02.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: robin@protonic.nl,
	o.rempel@pengutronix.de,
	socketcan@hartkopp.net,
	mkl@pengutronix.de
Cc: kernel@pengutronix.de,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net] can: j1939: fix skb refcount underflow in session teardown paths
Date: Mon,  2 Nov 2026 15:53:45 +0000
Message-ID: <20261102155345.1267524-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

j1939_session_destroy() and j1939_session_skb_drop_old() both call
skb_unref() followed by kfree_skb() on session-queued skbs. Since
kfree_skb() already handles the refcount decrement internally via
skb_unref(), the preceding explicit skb_unref() causes a double
decrement, triggering a refcount underflow warning on every session
teardown.

The extra skb_get() reference taken in j1939_session_skb_queue() needs
exactly one corresponding release. kfree_skb() provides that single
release by decrementing the refcount and freeing the skb when it reaches
zero. Remove the redundant skb_unref() calls in both teardown paths.

Fixes: 8c21c54a53ab ("can: j1939: j1939_session_destroy(): fix memory leak of skbs")
Fixes: 2030043e616c ("can: j1939: fix Use-after-Free, hold skb ref while in use")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/can/j1939/transport.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f8..3173936bd6f6e 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -277,11 +277,8 @@ static void j1939_session_destroy(struct j1939_session *session)
 	WARN_ON_ONCE(!list_empty(&session->sk_session_queue_entry));
 	WARN_ON_ONCE(!list_empty(&session->active_session_list_entry));
 
-	while ((skb = skb_dequeue(&session->skb_queue)) != NULL) {
-		/* drop ref taken in j1939_session_skb_queue() */
-		skb_unref(skb);
+	while ((skb = skb_dequeue(&session->skb_queue)) != NULL)
 		kfree_skb(skb);
-	}
 	__j1939_session_drop(session);
 	netdev_put(session->priv->ndev, &session->priv_dev_tracker);
 	j1939_priv_put(session->priv);
@@ -342,8 +339,6 @@ static void j1939_session_skb_drop_old(struct j1939_session *session)
 
 	if ((do_skcb->offset + do_skb->len) < offset_start) {
 		__skb_unlink(do_skb, &session->skb_queue);
-		/* drop ref taken in j1939_session_skb_queue() */
-		skb_unref(do_skb);
 		spin_unlock_irqrestore(&session->skb_queue.lock, flags);
 
 		kfree_skb(do_skb);
-- 
2.47.3

