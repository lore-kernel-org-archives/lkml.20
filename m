Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4333D647E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790222762; cv=none; b=DztQw2pmjgNushVSPitTf0xsrHCEeTjGsBpLXNdTk11YC1xM2f9/0S/uj2SbJkzRLyAuFuINHDe5TA26R+T3bG4KOoy9ALSlKYaVcQ7HaY8fuf6sbbWSG1p0qDkxegA5LVFP04dgCMsp4MVGNI7dqIlQHeQootCPyqCeDYT6j1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790222762; c=relaxed/simple;
	bh=VhwDNULfRsTeeYNpUUXF068Y8WCwNp3CrlFHi6vQTXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dh7L4S4dbg5BTIhzSnYCrMj7aTBzQW+HeqC+GNa/9VY8dcY0Hv7ApqasRG2yNLSlxNDnOwyDnkwhaEBCFE4GT5BzYQUiiKOiGMHg/+SaWmkXk8/C/2VEdEHCrhNpo2vW00s11W8bGm4+9RWv6meGd3a519PtqOLhCzKKbyJFIBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IM1jF3Ch; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IM1jF3Ch"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so521652a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790222761; x=1790827561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhZF8mPv+fRcVNjbFSDLsT1qu+MWxdYp9Nch/L7zjGE=;
        b=IM1jF3Ch1SJSP5lcp/+aJJ0Dt2dnzKRD/RR+zaViSZmfFXdEBdWxHu8TVhs6obz4Cp
         hY/dR+9TU3CNJspwZRUcdY6vG+GPJ9tm3aygGF89YXNrEar8B5Q0ITq/0Ra8R7uSbD0l
         YSYK+PGISsjjGQHebxAL63rnGAwhTJqwdNhbFy42MvNlsD0dmn4GGF6ScAttobhceV5a
         ojXZAKpBkuPqDc/gfqNhlkHUbztLPGL4wD5W8mQ89nYApExZrp+VI6ZUZrWRhP2zELPC
         g9qpt39HgnopKcgH72zdQKJEL/0xZtpQKS5wcQMH0mybYtPBWELJHzO7/HocI9rrn27X
         kvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790222761; x=1790827561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhZF8mPv+fRcVNjbFSDLsT1qu+MWxdYp9Nch/L7zjGE=;
        b=jUrPFj4i1YLo7IIdUCle4FAd42WXF0b3DOjAMlLM8XC2R5C0+fvppym7Avcc0+Ka8S
         BKCDp6pCQbZ/F5Rnn5xH8XY90UYhXXf9TSEH0GHPud22XQpRsR1dpPWBeeo5+XxIX2oh
         oESyusBQ0Gll3k/xaEPX6huvTPYVq3nkNrCfNuBfq/nQtFQtvGhNcPoGPYVI+h/AdiT5
         qdDXK1hxHkuMOSKnEEAo6oqTdD+Nk91Jfh6i5HGWF1UgoC6BcJaT1g2BlH/+0jeuAMNY
         2zjkW2Av2YT13AuCIDgxGVPU2ZFuA5TJB64/ro0WT0O4moIh6ioYlfDVdSSJW0MOpI3s
         ZlLw==
X-Forwarded-Encrypted: i=1; AKwUvBwPnP9PKWHiVQu7QGq7nJJ0Ly9ktwgfQw/SNQ9Jwt6djDLbokk8hr3+gIK9wLFxnc4ptTn0fj1ofeoODqs=@vger.kernel.org
X-Gm-Message-State: AFuF++mbLwecLEkP4r1bsaNmKAWAmZuIw4BQW0KH03t/NkGZ8UsadZhf
	RvWbQyFPBsmZcY7/34iKLpip/k9wc7lZAMiVKRz6kVno5N4uoYQfXjhj
X-Gm-Gg: AYBFou0yqhBCMND8UJa9nqHtwCqUoAlkmyPa40sjocaTdfbev3cWEZAW+DvurtzNsYU
	dJ5uHIeLvYTBdPDz89TlDft4IL16GNgtZM3fo0eJlg4hFWMQNSgH+VSOuM11F6qHpZHjAHtQCvx
	0qj1wWTJh72S5qTKlrgpByOu7zPtVwmgMgIqJ2wocwh2sh1SzXYuEG7KBGVZiNPI/gN+ydVa+f/
	UfOrpyyj9E8WiJIVwlxKf+M8/dn2FLotScdz7eGjaDsJyWdmMujkvCNn/mHjfRVOibJb6T9cwQE
	z+HpgZfPkZdAJhRoTb83w7xlVjXMAXQwi8t03qV6fW9vGgSVc9ZCXv8RTzS1/otFbbPiEqQwwza
	2Zns8LMTfuS7lo7X/2AH/BRqYEfhiyLqWDs7AqNfnfFnGmFUl1Yy+rIQswEClznLX4A+4Xz3CZt
	BkSrjPmN9ImvzG8z/Wskhrf8i0wJ34Q/ORmNsD9n/AbKcLZPdf7FhMnUEMzlx6DQdqkCiRxOUkA
	6qzfFn0reDBFNUfbeJs9uv+r9lGarcWEuUW0sc=
X-Received: by 2002:a17:90a:d410:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-3a098651f1emr672367a91.14.1790222760570;
        Wed, 23 Sep 2026 21:06:00 -0700 (PDT)
Received: from thangnn-Dell.vingroup.local ([101.99.23.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09e359a9bsm259410a91.3.2026.09.23.21.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:06:00 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+1075f6dc93f398c1857e@syzkaller.appspotmail.com,
	lkp@intel.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v2] Input: serio - don't sleep on serio_mutex from drvctl_store()
Date: Thu, 24 Sep 2026 11:04:30 +0700
Message-ID: <20260924040430.711439-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Writing to the drvctl attribute takes serio_mutex while holding the
attribute's kernfs active reference. serio_unregister_port() does the
opposite: it holds serio_mutex and device_del() then waits for active
references to drain in kernfs_drain(). If a drvctl write is in flight
when the port is unregistered, the writer waits for serio_mutex and the
unregistering task waits for the writer, and neither makes progress.
Interruptibility of the lock does not help, as nothing signals the writer.

lockdep reports it as:

  WARNING: possible circular locking dependency detected
  repro/4908 is trying to acquire lock:
   (kn->active){++++}-{0:0}, at: __kernfs_remove+0x34c/0xb90
  but task is already holding lock:
   (serio_mutex){+.+.}-{4:4}, at: serio_unregister_port+0x1b/0x40
   drvctl_store
   sysfs_kf_write
   ...
   kernfs_drain
   device_del
   serio_destroy_port
   serio_unregister_port
   userio_char_release

Use mutex_trylock() and restart the syscall when the mutex is busy, so
the active reference is dropped before waiting. Once the port is being
removed the retried write fails with -ENODEV.

Reported-by: syzbot+1075f6dc93f398c1857e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1075f6dc93f398c1857e
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/input/serio/serio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
index 54dd26249b02..5b650421e066 100644
--- a/drivers/input/serio/serio.c
+++ b/drivers/input/serio/serio.c
@@ -357,7 +357,8 @@ static ssize_t drvctl_store(struct device *dev, struct device_attribute *attr, c
 	struct device_driver *drv;
 	int error;
 
-	scoped_cond_guard(mutex_intr, return -EINTR, &serio_mutex) {
+	/* Port removal holds serio_mutex and drains us: don't wait for it. */
+	scoped_cond_guard(mutex_try, return -EAGAIN, &serio_mutex) {
 		if (!strncmp(buf, "none", count)) {
 			serio_disconnect_port(serio);
 		} else if (!strncmp(buf, "reconnect", count)) {

base-commit: daae2ab46e0cb612f50ca1d86cf50e5962461ae5
-- 
2.43.0

