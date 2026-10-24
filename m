Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860611;
	b=my725RFTa3osRWqqWg4jmu9qg7z3aWXK7u9m1ydTMOf9lhkop0JrWrd0/pU3j0Qf2dk8
	 pYvMkbMzm+iiclIMNWKGsAsRHD+kS47D7OXzVgSx9/1+u4RVZGM6Eq6GX1vF1nzDSDWNq
	 /CGjVx89qKaZ3hm4xVhmVIkhofAb11Se47kGRwJOAQNt9bXhEs1rf+EfPuckmF5vPU4Dr
	 xGu4ZUYOc2nJBY54zd2aDakR6yalHNHm7O2CCdD5wd6oZaySzcmlxybZPTUN7TqTBJCnJ
	 srAwM/um0ahiQXHWMvd7tGauK0mcpfhrbOE4q6ZckVgaD5WL03Grh6KOvwmBBhOKDjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
	b=h3LeWSGQU0M7jP0tRJz8Hg5W1TqIgjqG4wzN6L+SRs3YEcl9t9X8LmCAn+cA9GAp6Uxl
	 KcpRVG8yxn+1aRFWSbZGmrYpP2I3762Gd2nLqXohZ18rf9wf8CdMU4lbRAVlogGYM/oor
	 RMQTrjJ5doN1Wo+J0J0GsT558CGTc5xvwzSgJYYfOGGtfTIzAj9W4eViymg18F1qdT86i
	 OzLQG4cWRzBcFWV/9viUA7KG9IKYFDDluwVH7GEzlt0ZZfkejA7vDeRLMFEwiqRvEmiZI
	 isLjVAy8LGZOrDjAzXt9YNg76bsLHlotyOKIs8LicPdLrVdAIfT0qXn68IAXB9lanrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gLFXYVsr;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D8606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42D8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gLFXYVsr
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so914729a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792860610; x=1793465410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
        b=gLFXYVsrqS1UC9bDz4QKdvN9CPjybXGJB5xvbbVhzas4MZm9Mkp5um/ooqqBXhqn9N
         DjB2bw3gmrt77YlZJglNIpuJcR9AB9w1RM/aePTGilO4IcocRe7nMSRQSyDTQRrd4/US
         t1JcGiEBnfyxYOBIFyV82bRrkgAvLev19Zfi4v80VUyp+t2i9NbtGz9BAQQDBy80H/Pl
         p6teIDi2srczCpUDkv6EngZpm4KnaobvBlZu1JTefbkfgGWK033MRKSW2C6vqSMw1NZN
         2qjCe/BuRoJVjSW132LKhfwJx5sKoEweQJjlULqe3fyaj826S5IrlmPqC1eX56kRtdYY
         bs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860610; x=1793465410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
        b=fY9bAPPWiqIx5aUG+bI7510+upqFvg9i/VDxkowHLEzWJzuoF8SjXcq2Zpiv2N5/eQ
         rP/N5DkLev69BgHMfXzfbr+zdOl2Ouekwo+ZmB68ztQn7llpDq00IMBkaxvLBED/G1zC
         IKUpw6DROfFeDqNLOM8VQCwESkUUvqlDkl58OEQNH53nJMKnol3WB+gGsTu42HADk+YB
         IKtI7p3JjXl3KYutrHpAcX+xxivb4ym+38vCgj88nWdP6b3kf61ynLCWDtL8L2sVxPLo
         yIKm8fiAYO3NMaifyjVO3OdB6Thv4HGtR1X5sOdi6aD2BJQ4NEk4KBKlK6ZnQykuIQMb
         K3ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI6Y6nuBqIKh1eM717ZZWQeUsYkXYq5iGJpCG9YEsdOEWASG8wvbHVtTAY9WV2VbtlBU7CfqHZx/Jjv7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtTFhq1rA73FIFtj47rXBPnHpTsE1Wx64OdGuO0+vwQjRKu7Kn
	9X+0aPH57vNCwfWGpY4yRCbUWN5pkZ/IXv5xY+uR6jC0+ga7Diaj6dOk
X-Gm-Gg: AYBFou0A2TWXARtJP2xaBZ/rBUL13+aMxe6OFjll6p8GtQ0heUTPmpDX7dwCBrEXwO+
	9wrpHXJfpN/oCYg3hUoDES3b9U52Iuf4SfDuozJlZ4uvAXvNEp0O7JYYB4dPp1Ni3VxPuGQksSs
	Z9zO1xLF1JLpZP/Ad1HP1judMI8uN7a/AiFGvZWMmAZd+JK7kaCXWKB2sskKQBP6PNRZ7u9h6MI
	JvpwbtuyLdj7TdWwKVrzWHZgYXt9nBu7EYwKhsh3gHhO6/TSdX+gEFw1H7qqnQFN5VMopa9Nowq
	28oHwPNIN2rAKHfxMuhSgv59xI068zw1PWl3heVKOfVkV6aTePhS7SAtDfkOHfIi+PwkeFbC3+Z
	EflO5jfnSdsr+j1I6RYMNlUjxNpTx8ZSccPkANPCnrSBdBZ/cg9ig0rbp+2ugIl4GMuDId9rzBV
	76AH+XGicI4qdt2LiHZLvd2J55q2VbOUO79s4TBtvzYsXyItbChELTETk/Qggi8dntXRRlngfiM
	G3NVxTbd52q0g8skC/f+JPKwKPcRdzumavDe5Zei631u4YwouxmlTEBQ26UxPDbaioSd4BO
X-Received: by 2002:a17:90b:50cb:b0:3ac:9706:772c with SMTP id 98e67ed59e1d1-3adeae83414mr2117625a91.60.1792860609893;
        Sat, 24 Oct 2026 09:50:09 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm3406683a91.12.2026.10.24.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:50:09 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 3/3] ALSA: opl3: Shut down the timer after draining sequencer ports
Date: Sun, 25 Oct 2026 00:49:51 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
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

