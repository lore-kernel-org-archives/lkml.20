Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19037E5D0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934155; cv=none; b=b2SyRL1f5qScPL/MfnNvpfgxOyWBNhjkFEYBYGRRBkHcMR7eBfx9b5FbKAtetUOSUaJcPPkIdrMndVOPdqprneckWoyTv1WPJPd08dXuou4m/m/KbqS4ow1XVjHfD1vEgLTe9qr93lCYZqvOwNcpnvQXztQ0nJ4PIll19AF6aQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934155; c=relaxed/simple;
	bh=JHKgvqATlqgL4c6LIX3Dq23kyhqRc51/67ZRNwsmfBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h3ZBqFL2zsksDAyf1apCqBOCyninGYJlD9+qkE2bd9jc1d9QQ3hmNveDMWAgtc1kezaoVlqhG7d3qoIZkezqgHhL1uzk2iyxlJTS5Z8tIKXhQbr1pDVOYW8x+2zT+4Y9JHOAwQwdo90ISsIRQzqGpWFrUMXaDCv/xfE1b3xLSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE3Hk7vZ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE3Hk7vZ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1335297a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787934153; x=1788538953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aA9Oacfcu8fhSxsiDDcK8bFS0EFmdBDgbqZPzNdTOE=;
        b=KE3Hk7vZSCXi9rjoqMUuG45P/0jDPyN7GBCLfcJfCgVU4PPBE5xx8o5W6i5PBU/jl/
         APu8dMak6aIbrLKqWQJ68FhpSrU0PNpp8K2XEqHuyU1HuErExcevCZosqE0bYDWFT40I
         YQZM/o9DjlgavXjwyxlpNbGMp1+FWjzTsH0iRvN+Wcd9dY/j9bjh414KhOPwnogIQNR6
         AuCT0Qld0e8ut4qC9mrW9Tq6iTqaZwt/Hb8B5CgtTLQYaSDaV1aJLFJ3vjl9PQAg7tZF
         JkCVEV1Li3aOK5d41vHym216eCFlD36dz02/9zUNxccxmve+ecn5Iet0MWFEn0lOe2nI
         PH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787934153; x=1788538953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aA9Oacfcu8fhSxsiDDcK8bFS0EFmdBDgbqZPzNdTOE=;
        b=mjcluczjqBr7TbBDTH2ddD/1ih1GMLNKnDgeltK1p2Fpm3cwNwmOgAac2co95GMymk
         cSJ81OJLANBMgEa4V8pW8QM6gRdKgyD33dm9FGQaT4ry+ZcWzcu1C4E+EF8QSmpNc1I+
         v3Elx3QZZQnm8sjwR3M0tAQWQjQCur9g0cxEy2xk3ytbRJhvygleK3YzD55OtCnuPXjl
         2Cw6fu1yju8mXi+gcJl6asPUOVlvnkLjw2w2SUtUNxPqAvpMjxuCJKrIrY0y45gX+pxS
         kLht6wxLGZu6H4DvhVosNA0Z7xKcvIZUYc7QZCxIaMT3g5WbZKWxI4S5qJUK+PuVsH0O
         h+vQ==
X-Forwarded-Encrypted: i=1; AHgh+RpltKQ7VcRMrY8blOQRLbbU9D7TMCa/HGZJhemJ1QLA8j0qUljXN2dkDHAPjjrqb+qdYhvGHTmGpMUeA4o=@vger.kernel.org
X-Gm-Message-State: AFuF++k+4btIelK29XLqbnxF5v6RaKhFxnr21nqxL+ssb1AzrteKAeH9
	7rDECqwyyOM3+LFCDzcxrEry4NAXwJIDIWisy4tXyD4W+VEzuPPFPDPq
X-Gm-Gg: AR+sD10BxB3G3IDeky5h4tH2HU7gxSaibXmSFhfryiJwEpzy7dss++dbOh9C40P3h/r
	TkNeBZjh9fZE17C87rhxQu8mVkIjDCAVV2+cX5qW5ZGEvR6kad+YeBG5fEbIGG7u95k86UPvbYP
	36DH4/NUF7OdRRSvsxbnTqwNpjwBAPYHilNy3BdY+/Ps7M+IKfDkHmxwsIBt+8OnbG92x3Bv73V
	UjhULttGwr2l0L/OJcKKgg5X0oS2WrMnuSzT6gSU7MAX1S0lhyt14SXBd6mORFvLQqW468ra4ZR
	9RmKmWhWVpjYKUaOmffSoRbjC33IUZCWxq8xnyAhKvbaDDnO91nFCKtVD5eq4sk7CCSiJZ8F2T3
	bRw5EjeBVVXm7Bpek5y7mJxkIIvXc5W0BnbI2JI18n631yQ2rw1DfA0ZZiji7qklEscsxqGtsK2
	+LSGBYHGfNfFKXvZ9Hj08hOB1wiWAHagoMK8C8CWlR+eyqa5nLftQjz6sdm5ZrKMgm
X-Received: by 2002:a17:90b:1a8a:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-3989bd135cbmr1461021a91.18.1787934152690;
        Fri, 28 Aug 2026 09:22:32 -0700 (PDT)
Received: from Default ([2409:40f4:101e:9d7e:7e26:7b81:64f6:f32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm7635820eec.14.2026.08.28.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:22:31 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Subject: [PATCH v3] Input: atkbd - fix uaf in atkbd_set_repeat_rate
Date: Fri, 28 Aug 2026 21:52:11 +0530
Message-ID: <20260828162211.149899-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atkbd_disable() marks atkbd as disabled to prevent any work
event to be executed, however this can race with atkbd_event_work().
If a pending work passes the atkbd->enabled check and atkbd_disable()
runs after in disconnect, it could dereference dev which is freed in
disconnect following atkbd being marked disabled. Fix this by adding
disable_delayed_work_sync() which drops all work events preventing
any rescheduling after atkbd is marked disabled.

Reported-by: syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e2ef9bcb29af666b2e6
Fixes: 0ef7a26af127 ("Input: atkbd - fix canceling event_work in disconnect")
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changelog:
 - Changes in v3:
     Rewrote the patch to include disable_delayed_work_sync() as per
   Dmitry's suggestion.
 
 - Changes in v2:
     Added a check for atkbd->enabled so userspace cannot queue events after
   atkbd_disable.
---
 drivers/input/keyboard/atkbd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 5736f4bc5a50..a92a04c005aa 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -963,15 +963,12 @@ static void atkbd_disconnect(struct serio *serio)
 
 	atkbd_disable(atkbd);
 
-	input_unregister_device(atkbd->dev);
-
 	/*
-	 * Make sure we don't have a command in flight.
-	 * Note that since atkbd->enabled is false event work will keep
-	 * rescheduling itself until it gets canceled and will not try
-	 * accessing freed input device or serio port.
+	 * Prevent work from being rescheduled after atkbd is marked disabled
 	 */
-	cancel_delayed_work_sync(&atkbd->event_work);
+	disable_delayed_work_sync(&atkbd->event_work);
+
+	input_unregister_device(atkbd->dev);
 
 	serio_close(serio);
 	serio_set_drvdata(serio, NULL);
-- 
2.55.0

