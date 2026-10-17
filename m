Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C7241D12C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792220519; cv=none; b=HTUjcWtffWIBTmpJ+bOvZSQnQQhvHJKke5VnqlZdcX1JvUu3lanziAWRYVkAiySOGyVAXI/baMQt1k0koKqCYF1EaCagSaaBxm5I6/1m1afmlKudat/VD75N77aJx6nfiTQz+O6FvR3f4HoI0Hl3XEjpfZzuwwCOrg4iWRAYfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792220519; c=relaxed/simple;
	bh=aw0MPoxuG1QOoV9BOTq+Prrg/+S3pi689Zo3XQROyX0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VauZwKk/vERiK8uVYTt3TLiZfjLL7KP/LkEMC58t7yzz0PPCpg2Jsbl0BqPZcSAysOsI8M6d/aMrwjfAA/l0GymzcBt84bJ33Ee40XBsB0xqxP+cmagozlSTvDONYN8VvRsqBhIcV040jiaPayRSukSNqJk0XdNlB49/f70eEO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGiqAIM6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGiqAIM6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so3082205ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792220517; x=1792825317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GG2ifTQKbsTqni2SOuwEWnUWLH2Ni+EYe1SzZ/Lm0Hs=;
        b=lGiqAIM6Ntm8gAU4SI3RkBmnTTSLVmyqaTIOsHoxG14OcnxJ2tqSO+gZ55X7lemvkU
         Y69TCcyNftamnBrUpwy6ahNhHWvXpUGfGlR0s4TrvPrY/eNwpzn0mBofdEPmQ82Fubor
         rH9jQMeTuQOG1aIk+9IBndmLVRdxyfL53sVp9d1b/UxpJldcpjLkFiZBaImYEpzPzLV0
         tC7cV7G/ZPRBauurImyN6QVCM9VhsTrw/aSXB84R5yoc015twUblhYCD5DPxhGUsV1bx
         gCHu9I35q41NCbaQ3QzzlVQtCKjFEoeqqvx3LDBvblnLHxLel/mzv30UuqIcUbbnacni
         dVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792220517; x=1792825317;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GG2ifTQKbsTqni2SOuwEWnUWLH2Ni+EYe1SzZ/Lm0Hs=;
        b=JLezsplskcIJx0lspMd9p1313gApkB3r7EqeJJL4nwJpkKo6+2+i5R6JWdom5cBcYo
         ywyi6yUw8pvvBFS0Rn3QdxbmHewgNfwqMgn7hnTIu0+fJIl5M4i6uQ1NEcZ2nALAJ6gR
         4YQ/5Cb6Fk6Sz51hWim7N6/Hbj/XqGLBGNTzuzNSsKJtlULdA0KeUZxeJmu/iyf0YYkh
         a5llxC3/dV8sF+t4ZSAa55eyAb62uA6WF9fSrhcAzB6ENpIOA4GZxJkO1ROv9QqjBUXo
         bXcrIz+/svrL58edyQSIFlgxtOu3Y45qd/p4BhpjScathRiaNAfTkkYm6d1SyUtRuSDI
         WG5Q==
X-Forwarded-Encrypted: i=1; AKwUvBywZGdQ7IwhaG1V6lKtRfjaMpYoS6Kfq0JgroMiD2BdVHTcjCbA96WoSPjBJ0rJUEhY7KZ615/hTd7WRBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5VInWL+QY14PQW1ROMP5AqGC4mWMfU9tmGvseE8bWl4/pfQwY
	0FN5wQNxyun8OCZss5Qf2K4nzC7ycLgvhmdFAZFEF1HOVnhXmQmnX1q0DME91XhB8iJpXA==
X-Gm-Gg: AYBFou3gTgzi276jPzvQpSAvuNHDdzeJdN6IPpvr4V35+7w9vej9DVYuDJ2VBW6yoxl
	vNG94cm3ikpxgl33qVcIS/Omc8Z35Qgfl/jPQUpb/u3chA6FVhDLJq6UXUjYx16i8Qx7Zo51iiA
	EpZehR5o7hq5emfVAPBxEG+u1wI8MNcLhzT6unwAeFiEUu57YZni2n4fyGfFQvANs+BYFXL3kwL
	CvFIbt46UF82Gy+EtwsDL8vnP0XnEE0rNk67MAJlGJPFUJwRfH8+FT0MwEM7PE/Ee95iDAZHP6K
	RmqgerJtVQol9azBHYvWYOAGXJBe+ttC1ksryt1SPY8+ODIB6m4M34GMkYYdWYVdNZZvoZN4Nqm
	Apb9hTTGz0y2PE6A6RXbGSHm9We7tL7ISXKMRSyL5aBRDvHwj6Y/M7dtHxJIG0KwF9fOdzAhWRD
	ZkihChrSl4dM9SoycNOyrhhE6EeG9hfJ+aLinLR5aJ/b+F9jMJm+xpMJep1lnTRuVq3g==
X-Received: by 2002:a17:903:2284:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e9a6d36770mr19636925ad.60.1792220516593;
        Sat, 17 Oct 2026 00:01:56 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834f32sm19029435ad.41.2026.10.17.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:01:56 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: seq: oss: Initialize the timer before publishing the port
Date: Sat, 17 Oct 2026 15:01:49 +0800
Message-Id: <pm-pmb-1295c9b521e15b3753d6-v2-d2f1fcf0f038e0776f7c@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An OSS sequencer port must have an initialized timer before MIDI input
can reach send_midi_event(). snd_seq_oss_open() publishes the callback
port and assigns dp->readq before allocating dp->timer.

A client owning a MIDI port that another OSS session has opened for
reading can submit a direct event to the new OSS port. Direct delivery
does not require a subscription to the destination, and
snd_seq_oss_midi_input() checks the source alias's readable-open bit
without requiring that alias to belong to the destination session.
For a read-capable /dev/sequencer open, this permits the following order:

  OSS open                         Direct MIDI input
  create_port(dp)
  dp->readq = ...
                                   snd_seq_write() to the new port
                                   snd_seq_oss_midi_input()
                                   send_midi_event()
                                     dp->timer->running
  dp->timer = snd_seq_oss_timer_new(dp)

The callback dereferences a NULL timer in this interval. The OSS
register_mutex does not cover event callbacks, and the destination
port's use reference only protects the session's lifetime.

Initialize the timer before creating the callback port, so the existing
port publication also publishes the initialized timer. The timer
constructor does not need a queue or a port. Use free_devinfo() when no
port was created to release the timer on failures.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 6586e07431c35f4fdeb074a65f982e3cc78d0ee5..f1bd52c765b97f54932456f2e68164cb4f02fdc5 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -198,6 +198,14 @@ snd_seq_oss_open(struct file *file, int level)
 		goto _error;
 	}
 
+	/* initialize timer before the port can receive events */
+	dp->timer = snd_seq_oss_timer_new(dp);
+	if (!dp->timer) {
+		pr_err("ALSA: seq_oss: can't alloc timer\n");
+		rc = -ENOMEM;
+		goto _error;
+	}
+
 	/* create port */
 	rc = create_port(dp);
 	if (rc < 0) {
@@ -239,14 +247,6 @@ snd_seq_oss_open(struct file *file, int level)
 		}
 	}
 
-	/* initialize timer */
-	dp->timer = snd_seq_oss_timer_new(dp);
-	if (!dp->timer) {
-		pr_err("ALSA: seq_oss: can't alloc timer\n");
-		rc = -ENOMEM;
-		goto _error;
-	}
-
 	/* set private data pointer */
 	file->private_data = dp;
 
@@ -328,7 +328,7 @@ static int
 delete_port(struct seq_oss_devinfo *dp)
 {
 	if (dp->port < 0) {
-		kfree(dp);
+		free_devinfo(dp);
 		return 0;
 	}
 
