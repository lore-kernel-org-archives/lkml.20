Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939792;
	b=IkyFs5uUaORfBue/pP7z66bLufCrMOi5+FGzTS1UF7lrDUrA4dPkxuiTOITvjoJVk32H
	 RB+8bEwR9ztpcbOd4agstFdYyaDBde6ep8+b2lHe92MEHI54J4zDtdVNeGHVWDH3V6m6F
	 KSDPCZvMTFBZV6shpF2srp1v3nY7nMOIXV5ZkOeSOIa9ZdW4e7EmyrRBpW55Nrxb2OQaV
	 fhwmIOyLkYQEzZFx4JCwx3PuCJob8KQSRASTNsXdN+dUwO5aSV9KVPGphJlQdJvQ4EwWJ
	 K6ei2WQa5AKG4SViwNLrQRNJhSDMgIkZrbRQ3t+iT9AqxxLD2IFlW9Pu6dgEGbnhUmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8rVnROm4nPnB2HY3REYHzMtEx5AA1ReooCxXqhoYhRU=;
	b=Woco9/eP2dpthKcCMTsfmCPCyH4RZY3xaA05Q7Wdikg4Lreau3WIVLwrZZhPakbHa0bP
	 b4oAOVB6Rum+aowWXzjtL2jsUX1pQ9UR6mVHu5yJpZ2+zTilKQyR1sG7h1aGEQkjJ96jO
	 jF1yJK2x8B+2r/zDSeHnpqdeerUbpU9tLe4IPlvyzFUyn15NN5efn6pW2HeHn8GvgAunw
	 cGWT4a/3Xsr/BIyNhVx3iKM1rjYke0fshD9iKoOZW9Aq92iaTjuEeEqBhF5UCWj9oXNq0
	 0dEdzUgI00PEYpZsqAGDTY51h+gdhdJQejhug6Qw65/F7a50T6H40qfaTeIHXfy0Bag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxfJBlUX;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31C4606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxfJBlUX
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b23182e5b5so182520b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939791; x=1794544591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rVnROm4nPnB2HY3REYHzMtEx5AA1ReooCxXqhoYhRU=;
        b=LxfJBlUX+6nYXj2YfTCYYOBD55j8LefzmrzAmtXLQMhUPex744/2WQQE6uxIQEK/63
         Y33Ep2TfTkkC/DUQx1DKcdxEolX4jkE0HvsnwPahx1zVToYLdA71+UvIIr3XKsMqY66Q
         /cA/00e95bDjdnsWHoUsknGOf5PBzQdOizxCP9nUDP5W9Im3znhHaTexRDK2AW1Ys3Ph
         WuK50FhqgFdlj8fyAOrQKhFs4C/FNy5wSWUNDtnUN6CHTCAENgTpXMueznNm07YXK6pg
         VIANed/VXZodfiq33kNaX52ssChzAdnjujq1Q0W8IbDC5CemW3YjnOO8efdoV9V1aSsm
         ZP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939791; x=1794544591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rVnROm4nPnB2HY3REYHzMtEx5AA1ReooCxXqhoYhRU=;
        b=YJ78I1D4vdJltL9zFMuAtHitV/RWiMB451tScFqtTe7ExdW9g/gS0JXqnJfL/HpJvM
         CN/WLR4X3Hc+JdjVWYd0JJ4JBXlbYmJn4+RXJmDRw7NbcfZos3IozVhnPFH5YUvu/Lfc
         hG0CygEd+zIv0kuqSinRXO7zhpxR/ihUradp/fXN4yWt0gg7thGOP+qn4bBGA+4G8xWV
         RB0/5b18fpih2r7YpWAbYt+jS5I3/k0+13Z74rj8mo/bnz8rO7wgAbYqe/FnDQ1K6GI5
         3udppqpENUGnXVy0DJly3m4MvMcnELMp3BcuLqrsGXRRNfB2yxBECaTbrZVArlofGymd
         2JKg==
X-Forwarded-Encrypted: i=1; AKwUvBzIkZgIJTMlJ68d9BdeSVQqde8TEIj0KVmlYb0801eSOeOOp0GJ3CgtZYIUVoXA278UU58/mldcvljdS28=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4C3nuKnFgO6DezzjBuJKWb/4YMicI4Cj5Y7tpLtX1AVY5JdW6
	qljkT2GGaAB+2U5Z359rnnEdXNPLkJ7yQ51NJydxb0C2nU1p2Vw7pmR62SKfKhy1
X-Gm-Gg: AYBFou2zRpoIM6qIyWISrilIXVhJGp1UxJReW5UTc4D6kewH3c+92PKAVUWenomHn/C
	nZZNm9BsLTCkmzLDg3cxB+WoTZ2HTvZXABhrhrxGBvk+pzY0OWgxw7KhV5SbNChV26Vd4xFwaFu
	C1zBWMtBFXg/bSrCHOFyqeqgM+FFkuKJGS01W5OwtpT4+BHj10lmAfv0NYWvus1UyOsH+W6BPfk
	rntmIXEqM67zjsR3SXPhakFcYOyCUC9cBcA1UjjBbD659E6Pw/RL3YkUhK8Q2cmlZiqKUY5scPE
	3rxrI2zLll7NIvpBA6M7UamPtXMTe5XhSxIfpySOBAwyoPMc0/w96kuhMzgBQ2SZUD2MSguyp+2
	Ebh6/G2B9RMsLu7TOe1jme1VKIddPXwZcu5tBvCUZnmCEj3tj5ZwW1NvoqWST+ABVZfxOFXY6cd
	CEADrGkhijaileUoMmMQNFmCKMjN3oixVjCabEfseksWNVYKI7rSO06Rw3aM9WfeoY4IiZaNYoV
	b+CsjPTIXYfK57XrMzLEAKdJYjbKXWqXOC7zkSjUOyStMmCaeYMwmAAOHyMYkh704RwXpdor8kZ
	xGfqod4LoFDWBLoU8IsrEMZQ6siv5tjU1txP/rWSWXYiZq1tVIYoMUy1dszEd34/RXfySw==
X-Received: by 2002:a05:6a00:18a0:b0:881:750f:b142 with SMTP id d2e1a72fcca58-8b37dacbe3amr1414853b3a.55.1793939791041;
        Thu, 05 Nov 2026 20:36:31 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c287a8sm250728b3a.3.2026.11.05.20.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:36:30 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: cancel work on teardown
Date: Fri,  6 Nov 2026 13:36:21 +0900
Message-ID: <20261106043621.1903211-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

fc->work is scheduled from the extcon notifier callback
yt2_1380_fc_extcon_evt() (and once from probe), but it is never cancelled.
The containing struct yt2_1380_fc and the extcon notifier are both
device-managed on the serdev device, and the serdev driver has no
->remove callback, so teardown happens entirely via devres unwinding
when yt2_1380_fc_pdev_remove() calls serdev_device_remove().

devm_extcon_register_notifier_all() unregistering on teardown only stops
future notifications; it does not drain a work item that the notifier has
already queued. A fast-charger extcon event that races device unbind can
therefore queue fc->work just before teardown; the work then runs after
devres has freed fc, dereferencing freed memory (fc->extcon, fc->dev and
the serdev device) in yt2_1380_fc_worker() -> use-after-free.

Cancel the work via devm_add_action_or_reset(), registered before
devm_extcon_register_notifier_all(). Because devres runs cleanup in
reverse order, the notifier is unregistered first (so it can no longer
queue the work), and only then is the work cancelled, before fc is freed.
This mirrors the teardown-ordering fix used in the axp288 charger driver.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger).

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -148,6 +148,11 @@
 	.write_wakeup = serdev_device_write_wakeup,
 };
 
+static void yt2_1380_fc_cancel_work(void *data)
+{
+	cancel_work_sync(data);
+}
+
 static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 {
 	struct device *dev = &serdev->dev;
@@ -163,6 +168,15 @@
 	INIT_WORK(&fc->work, yt2_1380_fc_worker);
 
 	/*
+	 * Register the work cancellation before the extcon notifier, so that
+	 * devm's reverse-order teardown unregisters the notifier (which may
+	 * queue the work) before the work is cancelled and fc is freed.
+	 */
+	ret = devm_add_action_or_reset(dev, yt2_1380_fc_cancel_work, &fc->work);
+	if (ret)
+		return ret;
+
+	/*
 	 * Do this first since it may return -EPROBE_DEFER.
 	 * There is no extcon_put(), so there is no need to free this.
 	 */
-- 
2.43.0
