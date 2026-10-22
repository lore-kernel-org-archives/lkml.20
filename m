Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676934;
	b=bAO5efsKY0pHXZHBFfhSC3sgSkedhVm3Hqup9UBufU5yU2SqctFv0FpG4LeggWAoybEY
	 kCJLMurIQs9dbQKrgPDi8Am3ZuhDbSa/6iEpo7Iy9xoYTV3zXie8Do6oLf29heQfAJcDm
	 Cxi54H16pUFMBQmeD2sBaNW52+6qa0wy5TRig7TjCnh7e9eSaxirrTzOpGsCrwIWSGJFs
	 V6yGmjqmjnhfA8MNBVrd9VG2XHqZ95aNaynF7rqGgyVIFtRtUe+ClPyaS+8Jfxpeiwvtk
	 /waeTHNwlpIyOhi77jf/btAXjAMIEZPfxIAp6vt27xkzRTeDaS+zbTVY2iAAmEfk/+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1rfCY2/4omHsvxu+e2SQ6p3aRjOn1bv24zAN2mL2uYY=;
	b=GciYu/CK6DLWgWLYpnUU4EvVh8FxqE8dhmTX9GG00djHDP3KgBkuIuK7NmeIVGGX+hu/
	 6Dmj4b+vnG5C6uJ9GKf1QCjfr97uznvTCMbZ5Dehtzoo2wTCK8bQGCPg80Be+4voaaEod
	 riNMXP0sQ2Q4z7xOSKZqD6uKkN+WHThrwmo7K3Mmju+8ZnerAH21dRle8KTkVpPwH8jje
	 br4OZ2xGjkPePLKZU/exdMpzt3B7Ngeg67sw19+u69aP32oRsA15Fm9gF8HCvOp1s4vxK
	 PJEtIWYxoDXSJQFbZhKGINjdzyi32NSdwRgQsAEL6ecxKULJiMfECmFQeEdOIHlN8Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZBTIwNjc;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B660A6F6C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE2B660A6F6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZBTIwNjc
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso1468064e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792676932; x=1793281732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rfCY2/4omHsvxu+e2SQ6p3aRjOn1bv24zAN2mL2uYY=;
        b=ZBTIwNjceKramGg0vi7xicqjOFCgdP2xEUgbwlDOvPQfOU1eLz9yd1q3q6ThT2JpGZ
         rfUuPWuOzXDuFQwyQMp1GrXb5venxFeKa3K7m0DPVXK/H3IRyRqQs9Z6BmPXF0rV+UF9
         6G2bT3cRrVtd+47UoAlzlDOgtsyiOEWLIDV5iPc0UGf4+rrRqTY1XUuCSmMX+fDAWD1h
         XI3AdActDYuDTs1I2yw7LMPhHu8lYjdoKxQh7n5Zcg3GmagL5+VmgksPcSWGQKbL6UaI
         lKRG0wuCC5amrTeWc5qONa1MSBXdVkxsWrqnp/J7nLCOT96YorlVjCkpphoFskAtBQP1
         HMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676932; x=1793281732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rfCY2/4omHsvxu+e2SQ6p3aRjOn1bv24zAN2mL2uYY=;
        b=n1oTuHpe/utyOqbrgNYHG4EuwA5M7Sbqm2kUZoRBd7qdoOSnIAfeMueTgTGNVlCH89
         ucP+XNNHmiitzTwvIuVa0zy9e7S3hJFwRDSLZwmwo7m+WUfoEfK+3Rx+g7DGuQZqdumU
         jJScSvuLh+heyCzLFcxM1C/Ft6AH3RNpbqgphIgDd44dTDRaFTqiCrJFebXjEPrsI94E
         Pv+iXhg+Fs/KHhb7kBwfFRRICMjAO3Ls6cgmMaJzoRE4GTnT8ZDFHwKgeBNxtQApDKyT
         IxVvDQjPvkwpj/9/jN6VYAnpb4HoxZDVSH2Hu5knSxilJz5mWuqsso9oTDnTLl4j9Yx8
         7EUA==
X-Forwarded-Encrypted: i=1; AKwUvBzzL8ERWg8EYEHiKu0lSHwkqqr1DyaDd8cTTHH0d7vFb/tyLE4d9y2DLiRlarOuv5Qh/f1vXYNGVAeczPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx/7pA3qAW9jg6++RaQ5R1Lmpf0poy5iIV+MreNQg9PhxXc8zl
	Eimkq1SyfLzAx87GqG/cu1BfCvEGZwwGQTH5J2K2Cuz1Io1z33utTNM9tBJzEG7HwZA=
X-Gm-Gg: AYBFou32SbVtv3897POHgoRiSOiF31RACvSOrS5GJ65SIENcyMtC0qRfFkIH/Swuj1s
	OeUUqNAYR0LfzVtBKg9j4YuJ2Y34bp9Et3TofKCUTto6xT1Y+HZQ5iSL+VVo+wuTa8e/Z/AAli2
	XkDWgR5pRTrXM/qswqnHnR8aGsLH8WoAsATwtLY5G37UoqqpHGHnwq3zXlCN0q1mR14C5F25arj
	ST6x3gThPY0wO1rRvlDxExkMJ0GbKLdXQjCWUcnSeBE9aFZ9IW6m3KZZ9qcUezuKqMosdVppoFL
	JMlyuA6TV69aemlTnKnLQBOB5bRyp9n121NYsEWQjyWAVW4ti6rzK/5l5rFFjWEzoJxgR8CXtRY
	r9nYOgDPn0s5VTHhQN6kQq9JnKS6t2j6oAluUMvCLCCZFItTIB0HBT3gviFmOkcTZPmo8UQCbJh
	Hyas5G03w9JwVXMppwsqwvX0lMMjf6sj1jsXWwn02aWZ/6Wl2LouZfcd5si6VEZwnRxnIs2hwDl
	KMm8y/PE3vrpKEwlMJl9gVlG3sozB1dikaNNZhXNWIeWBbH1FAOAzhVLsM0BMRl4UjjxH7B
X-Received: by 2002:a05:6512:6891:20b0:5bf:a2ce:1a21 with SMTP id 2adb3069b0e04-5bfa2ce1a61mr1327805e87.12.1792676931709;
        Thu, 22 Oct 2026 06:48:51 -0700 (PDT)
Received: from linux.tail9b532d.ts.net ([196.240.54.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11a8a31sm1092811e87.6.2026.10.22.06.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:48:51 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzbot+61464b62b688791cc24c@syzkaller.appspotmail.com,
	syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] greybus: operation: keep operation alive while arming timer
Date: Thu, 22 Oct 2026 15:48:17 +0200
Message-ID: <20261022134817.1703927-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
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

An operation can complete after gb_message_send() returns but before
gb_operation_request_send() arms its timeout timer. The completion
worker then sees no active timer, finishes the callback, and drops its
operation reference. The request path may still arm the timer, so a later
final put frees an operation with an active timer.

Take a temporary reference before sending and keep it through timer
setup. After arming the timer, inspect the result under
gb_operations_lock. If the operation has already completed,
synchronously delete the timer before dropping the temporary reference.

OpenAI Codex assisted with the syzbot investigation, race analysis, patch,
and changelog. The syzbot C reproducer drove Greybus ES2 under ARM64 QEMU
but did not naturally trigger ODEBUG. In a test-only build, forcing
completion work to finish before timer setup left the timer pending when
the operation was destroyed before this change and inactive with this
change.

Fixes: dbec27298b0d ("staging: greybus: operation: add generic timeout support")
Reported-by: syzbot+61464b62b688791cc24c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=61464b62b688791cc24c
Reported-by: syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/greybus/operation.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd6..5bfee8638c9 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -188,6 +188,18 @@ int gb_operation_result(struct gb_operation *operation)
 }
 EXPORT_SYMBOL_GPL(gb_operation_result);
 
+static bool gb_operation_is_in_progress(struct gb_operation *operation)
+{
+	unsigned long flags;
+	bool in_progress;
+
+	spin_lock_irqsave(&gb_operations_lock, flags);
+	in_progress = operation->errno == -EINPROGRESS;
+	spin_unlock_irqrestore(&gb_operations_lock, flags);
+
+	return in_progress;
+}
+
 /*
  * Looks up an outgoing operation on a connection and returns a refcounted
  * pointer if found, or NULL otherwise.
@@ -766,18 +778,30 @@ int gb_operation_request_send(struct gb_operation *operation,
 	if (ret)
 		goto err_put;
 
+	/* Keep the operation alive while a fast completion races with send. */
+	gb_operation_get(operation);
 	ret = gb_message_send(operation->request, gfp);
 	if (ret)
-		goto err_put_active;
+		goto err_put_send;
 
 	if (timeout) {
 		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
 		add_timer(&operation->timer);
+
+		/*
+		 * Completion may have removed the timer before it was armed.
+		 * If so, remove the newly armed timer before the operation can
+		 * be released.
+		 */
+		if (!gb_operation_is_in_progress(operation))
+			timer_delete_sync(&operation->timer);
 	}
 
+	gb_operation_put(operation);
 	return 0;
 
-err_put_active:
+err_put_send:
+	gb_operation_put(operation);
 	gb_operation_put_active(operation);
 err_put:
 	gb_operation_put(operation);
-- 
2.55.0

