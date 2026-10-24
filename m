Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823465;
	b=QKXzcbwwR3MfFYCbX6vDs5SvO1s9Yj3WKdulQZIa0Pa/TOsLJqSJqTBmTCHKIf+wA33T
	 mWpqXJyT4IQAMXJ5GkrW+HlUCK0vW6Uf9lpRId0/1khtPuqqVzyJL6iUHUTBKMTIlEF5y
	 86zvMQvwey3XMfXs7lr/LfhbnsZnG99OjVU+46K6x7xCPbX16OnhUaCMExULADWdomXUw
	 +qOzF2rRhrmWZd79py/sqEEaPZ6ymNANIDh5XrfUZ2uoUxRB2EDA0uTSjGsRKm2cR57Fz
	 G0hP3RqlzTqXUtkxOWXTRLKTK0G5RbNgPUVq6JZ80S2RSSFvKWVKKNG/fifqsuqd5Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
	b=vcBBWf0EOwsUN6uD6abvL2SaRauxIpruW8I3HzZqCXGD+UZa/lQ/gBBGt6AF0k9ct4t0
	 WoUEmhFu8TxtWM+CH1bT38CmVC2RZVbK06U5x1pjyWZgsR66j4Ko5xisLMeGL+zuDecos
	 343xH5Ug9OWgu2SbMijY7oMBkuW5IVJc1fNtxr7P6Qxy+NuVMlv7/Qg49PJT545fnc+Du
	 n1hT0VXExlyqkVkPZrEGIfeCXp2EZTvXrsmxnmnWdiXb9E3j8GNfGgrUqsd09HBU7aA/C
	 r0byfKtb/iSnpvmt2mgHTnu1CxyuBYBilF01m8JLl/G5tKH/bik8wgWCf6chmH+zDnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DgRoTCau;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8361606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8361606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DgRoTCau
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so851493a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823464; x=1793428264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
        b=DgRoTCau56UkmUNgN5n7quLRHJIrsKVW0Lzbb1XnPNNZZT93hrO6alpj9Hxdy7zvgB
         98X0Dik3iN/EqGbknZb9br9Znt631fk84IURtKpaVEQnGMG6D1Xbb49MyzyZ5RgBvYNS
         Gbhb02TZ4jQUxOrZGsn1plCvRwwF72aRuel1UqQ/KpNKneWmSNFUnWKWVMOvtSMfm+/t
         s6aTegbNtMLntxNw4GAiHx5uTFyvO4yGIv8plqQx7+SRWiigZxOUXU7fqjHdfD/TKvq9
         5zOALrhqVKuUgyx9wwm627mlH3pTLnY7TiBvXmT9t1zl0TQrfxm7cb/1JGBCgJWvCdfb
         0sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823464; x=1793428264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
        b=u5Gp+RNqAjqv8VjzGPOgKL+Mi3omu2lOWnI6mYx8k7RrNsYXwlSfsn7bK+PqcdWNP8
         vYtGKUC8N678tLqqvn3GAZnWFmey6z5a7WI82S5Ud0C2QNbmZMEW75HJMnU5O9t/Dmwg
         nNkUHPZtE5G98QeVCXqVaiLMg7RCLVopyQpstxH6YdFe5tQ5KK+pu9CFCI/rK/WvqBRt
         tPBnIr/aS312mTz9daEcNu5bbYfiL6RSwJHnXmNXzTtY0wlaas6ycd99FWpIFYeKheMM
         vVugGriNYQQlUg3nBUzReKVsZzNUWp+EYH4Nbgs4o1uRNfqB97D8vIuW+dJ5pHy2A7wH
         I2Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxlM5nDMmKG1ebuqrzHOgLvsvgXVGp8TcnHnXaplow4mg8ASW0j8Lk+okrWjJxYzV6uaIllUs0YjScV948=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn35FAIzkP3BqcdWemvOt8LDObrP6Awh/ko0yO8qI+7zPDHTn8
	8x6GcVmlPOgMYPTJbqWDLNKmKPa3IbHDE5y933EZYdQrD2De4s+zFHVN
X-Gm-Gg: AYBFou3Eko9dXILCi134nw9ib3YQrtnTj7vZ8eYh+HhkEhVdM2QWk04BIx3kbNLUzZt
	Hx3Ej5ZMGY9g1yB1WgevvEyqf59J84yMWYZNMYh6wolt6YmzoIRVBBSGVGoZ+p4yooB63DC/0+c
	GrLOLTmrCfVAQI76Zi+HV0qZdlNUbf+fmEHo7oJC9U/bC9iIGxHhclzBRBDkEExjqSMBz3rK1+E
	t7L1ZNJyzjaoQohtalD38HEjMEQjCnKQX/juM7ItPaeLNzEkQz3R9lBLJ6qq4ByOs+GCQRkMpMW
	m63QSwz/q7yBzDdxtjuwn8zQDo89OTh4bWPhk/xLF+nUdu9SJ3BTNUo6FXibytlxbq0CK9CAvdH
	iMbQWm3ojoZXipjR8z9B/QsRKyGRr90rRrrJy/gKFa99uSHjSgs7IAKpUpsy6WKN3MZb6mj1CbT
	EcYf/OPJxn5cWOWYcrSROg+bbQKKcaSCRAbASAIKjhTRH0EvZaIFLsBUlDXrIYDzHMP4TM2T4Q9
	cxTvaml8gyiNhfYL9CxUDDGrPpWbYi94w+TTjFC8CFn4LhjVAQ=
X-Received: by 2002:a17:90b:4403:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3adeae86b0emr1230023a91.55.1792823463996;
        Fri, 23 Oct 2026 23:31:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm1248371a91.2.2026.10.23.23.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:31:03 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 3/3] ALSA: opl3: Shut down the timer after draining sequencer ports
Date: Sat, 24 Oct 2026 14:30:45 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
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

The delayed-note timer is independent of the sequencer ports' use-locks
and runs code in snd-opl3-synth. Deleting the client drains the event
callbacks but does not cancel this timer. A direct fixed-duration NOTEON
without a subscription can arm it without any unuse callback to stop it.

A shutdown in only the native port's private_free callback is too early
to finish shared voice cleanup when the OSS port is enabled:

  Sequencer client deletion          In-flight OSS NOTEON
  -------------------------          -------------------
  drain native port
    clear native voice aliases
                                     snd_opl3_oss_event_input()
                                       refill shared voice array
  drain OSS port
    clear voice aliases again
    free OSS channel set
  client deletion returns

The per-port voice cleanup prevents the timer from dereferencing a freed
channel during that sequence, but a queued or running timer can still
outlive client deletion and the sequencer driver itself.

Shut the timer down synchronously after snd_seq_delete_kernel_client()
has drained both ports. No event can then start it again, and shutdown
waits for a callback already running and prevents callback self-rearming.
Do this outside voice_lock and sys_timer_lock, which the callback takes.
The probe initializes timer state before publishing ports on rebind.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_seq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index e03c88377bb6..1004a7df1b8c 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -259,6 +259,8 @@ static void snd_opl3_seq_remove(struct snd_seq_device *dev)
 		snd_seq_delete_kernel_client(opl3->seq_client);
 		opl3->seq_client = -1;
 	}
+	/* Stop the shared timer after all event callbacks have been drained. */
+	timer_shutdown_sync(&opl3->tlist);
 }
 
 static struct snd_seq_driver opl3_seq_driver = {
-- 
2.43.0

