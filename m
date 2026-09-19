Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A9D37C10C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850117; cv=none; b=EfCEvRHdMXBDflZ0uckCeya4DLk1YL4ydOI2m5fpZYWTlI/Jq2CQY6mIy6pjnmh7x5bZLvLeCrelcPLkiAtKDXNxF3LiiYpbGDCWj6nevT2JMR7UnYlT5oNVJYlKnyIFxFO9sxLnrxS7i1CydeVbcJP9CQL41OvSRcxquKFYPVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850117; c=relaxed/simple;
	bh=hvFzpIVLAHgH2LJY2R8rbdYRjXjs88o1IJ5582M20lE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZVzRURU75ignjzzVzwh5np7ei/t7UJj514A89zMG6gpfPCickVvucz029ObJUpNh7hZPJ+GFCPMuW7TUA9VYj8bAZ3FxvLQ8CeFqD5oOHbEV86ck+B8ckfI8eUesLX8harAYlLT8q3bT3kgBl3U1IQhdY37IXqbQt5LeuKeRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dt0ak8n0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dt0ak8n0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1687048a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850115; x=1790454915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QymwKalUenhtwvxSaf2H9k+Rhswa27Psp1ry8l1hIE=;
        b=dt0ak8n0xm20CPTcrVSYq46XmgUXUu9QwpVBy28gKY709ZrSGWhrZjugXbHuCoqpMy
         L/XTKxwh1bM44ds3YFqvXDQpxbo4O5vQlhEx4uCy0aLdQwxo4kQiw3pnYyaRuP4O23UD
         G+qnL+J9kA7ysJ9+U7cIYu0REznAG2tLMGpFACeF7BzZRZA7RiM+1NK8x5lB54EZ+X7S
         eBeqJAQP5NvonjHr8Dxb7xDTRt+ChXUAWzrEWq/QaO0d1o0JQ3fwHBctt44Rw2W+S1Gu
         K2Sh3Mj4+L3SdSPkMt1GygbXb3c5X5JWt5o9Wf3bZvKxiuOenZBGCx2DaUkcYcGnSfRb
         oaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850115; x=1790454915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QymwKalUenhtwvxSaf2H9k+Rhswa27Psp1ry8l1hIE=;
        b=GRwbfEpBrq7yBVpZHeCz7jU2bDPhOZWOdamYr1qAit8DGx0he47NqO+QzpqQRJ6eZ5
         jPuO78zBo2iFjdZzAZef/LD1KuWOfKda+d3mKHNUh6yMmNnAMA4QUv9VAq7JVX74+XyB
         Itg54XCm86l83qM1P5VTSmZPdRabl/a6Yd4do2qUCHzUMKY2swQkdCz2WWUly7OOxLoa
         mDJsnCWEUOgBT0CVj/KZNG8ykvZyCVrBY3SiV36guw18DwHZALks0zife2WyuL3OwUwx
         50kwmq4nNx+xCgpMuZpCCLho6btI9c0H/73I6jeBzpkbj3F6t8AQWLkg0xvgyfQY6Eke
         xGsg==
X-Forwarded-Encrypted: i=1; AKwUvBw3xjiNO5TgGfvx4zvAbDLMlJ9bhqs3AVNBOyrJCLkdxv+QBejFakkLPWWxdq56fl5rp3F8D7zFVaGERnY=@vger.kernel.org
X-Gm-Message-State: AFuF++myJLO4OolBg7LmfhdEcI5sAVHW4ALYODHzhrgVpyGLfE4E6qVB
	eLcnme87rfxaZFLNNxEFO9pri7cUHuhFq2+qr5Y1GajTDpsZ09Oozwro
X-Gm-Gg: AYBFou0bKpcZ42jOm+9KSFCT5XXrFEg8eEti+pyDZ9fhOQoY1snd8Ut+7KWPPbX0kfp
	01Gra8oaIWWyeWuOMrQOhOwYeDVMLmp1Pa1ZcDwDSWR0NShLp7+1cMczqnT7QS07jkuHxpATK3x
	+HS/KfvYZCI9KpYrPbn8giIGDbYgGmlrQMTHLZ8Acil1xSsPMecPyp1EtbCe/QWNvIACwmx/vSp
	SMoyvBWOc1uVSFwkpYKytLUWo8mFXZbKYHqjhkw3/ha6wEQLmGybDytWEZ/pIgJC4CKfsHVkgbe
	GfG8l5XvX/phpwX3FwAmRIIwRYwGruTx+gaSCDKWbQnRm7ZF+aMPZoeg39Mn85JxY7OiTtKgYEg
	vdzSZwS/cFElVrFLeuaQDa4fTNInf9tp/LEa9RJc+ZP4p4ahiwBcImD/3MBMukVZFWzpjgbMCbH
	o8HSBaFKUfjSrZuabBfbHbE4KeVT6NyQjaTG2VHWuFQzPQp+V8e6VWvVOVktTro4FhNHRn4dgjJ
	KkLx43EfvqfkMBDY/iAZJSID/IsKCY3J4XPJoZtcUhKRYo91y/c2p2Xy3IWJpqMaYSmS+ADb8qS
	05je/cvwww==
X-Received: by 2002:a17:90a:6c82:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-39e6a81c9admr4093999a91.22.1789850115133;
        Sat, 19 Sep 2026 13:35:15 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4ba12csm5990780a91.11.2026.09.19.13.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:35:14 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] seccomp: restore knotif->state when SECCOMP_ADDFD_FLAG_SEND is interrupted
Date: Sat, 19 Sep 2026 20:35:14 +0000
Message-ID: <20260919203514.2580997-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set,
knotif->state is transitioned from SECCOMP_NOTIFY_SENT to
SECCOMP_NOTIFY_REPLIED before dropping filter->notify_lock and waiting
in wait_for_completion_interruptible(&kaddfd.completion).

If wait_for_completion_interruptible() is interrupted by a signal before
the target task processes the kaddfd entry, seccomp_notify_addfd()
removes kaddfd.list from knotif->addfd via list_del(&kaddfd.list), but
leaves knotif->state set to SECCOMP_NOTIFY_REPLIED.

As a consequence:
1. When the target task wakes in seccomp_do_user_notification(), it
   observes knotif->state == SECCOMP_NOTIFY_REPLIED with an empty addfd
   list and zeroed knotif->val / knotif->error / knotif->flags, causing
   the supervised syscall to prematurely complete with return value 0
   without installing the file descriptor.
2. Any subsequent retry of SECCOMP_IOCTL_NOTIF_SEND or
   SECCOMP_IOCTL_NOTIF_ADDFD by the supervisor fails with -EINPROGRESS
   because knotif->state is no longer SECCOMP_NOTIFY_SENT.

Restore knotif->state = SECCOMP_NOTIFY_SENT when removing an unhandled
SECCOMP_ADDFD_FLAG_SEND request from knotif->addfd.

Fixes: 7cf97b125455 ("seccomp: Introduce addfd ioctl to seccomp user notifier")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1808,10 +1808,13 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 	 * We need to check again if the addfd request has been handled,
 	 * and if not, we will remove it from the queue.
 	 */
-	if (list_empty(&kaddfd.list))
+	if (list_empty(&kaddfd.list)) {
 		ret = kaddfd.ret;
-	else
+	} else {
 		list_del(&kaddfd.list);
+		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND)
+			knotif->state = SECCOMP_NOTIFY_SENT;
+	}
 
 out_unlock:
 	mutex_unlock(&filter->notify_lock);
-- 
2.43.0
