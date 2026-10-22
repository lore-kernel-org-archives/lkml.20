Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680796;
	b=fZJSPNxDDZuTpg20oJ2ZC4JGrJGEHaseQQzKcIVMaBBm4zUzx2f+wjHXqenyU3PfIxLA
	 sCTddCocMnsyb+K+8F/QtrOv/QD/bCpclsJ3qx9DjBv0mJzPAthZw3dHYgXY8V9RXIrXw
	 ksIIIomTyJFDiosPlz8QHltf4GhQNdYqR8l1Zpmq880tvbmTpxc3DkEA/NBzqKIf6imLk
	 relBxbWVLhtXCZm5kNAVyGZeSIjWX4PVNtEhCKw8Mmq3h8OseipVcyQsoFYX2y3KifuSw
	 RsFkmcXhW/8gxkQSNFRTBqKZZvxPAnTR89T07SkPAdQvnLdKqIRGtB49cipcHErZCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/yNVkqf3xuwySUyAz6gXRTIRjMa4L8eTvwqGMoDFidY=;
	b=wXNoYn65bPUlvmECLZmcTr8YUNSVNC/ywpfbWEmRso1Cg9sRmR60EakApQqBBPFIuPS/
	 OfY1g9fUDGnUG4uNrI7XNEaT3a2xUBOOakrsjaK15WctJM3+oXYAS/wiNUmj8XPim04he
	 YE3sLnRNJxOlsFD82WT6oGjhG0BS8hAjXZE/Y3A/TiNjjlK5jYcU8wVSZPKU9vsj3sHrO
	 6hFk4XQF1M1KhgKxIWI7CcXE2QGCOEgm+fTRHIUi26bNXuR6jb9ZU22OY1y/C2IUstgOw
	 5KFr2ARjfn2ZhUclzF44Ed9/2idv1dVU2nWqDWCBVmumWSwdhi3pg1e8ksaayyOgUOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rUQH0zjC;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA7E60A2603
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA7E60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rUQH0zjC
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1401077a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680795; x=1793285595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yNVkqf3xuwySUyAz6gXRTIRjMa4L8eTvwqGMoDFidY=;
        b=rUQH0zjCv4zb4xaQFQv7sWsT2TO25jiUvyQXd7+cAR/Hy+YLqB4+WWGyMilgU46fUC
         WUi3GCJoLYqzs1ezDNAAZ50aFJ4dNMbUVPGLNNJZGB2fb2wERPe70uYbeTUbfMMs5Cun
         ZG0n+/ytBiTe5T+86s/aqlQ2jLDHwnFCBSTAp2kEey/QsVWtLEwn6i6b8eKZ813GVjlh
         Zk6A4C4cM6kBXzEyknywJx3eXDOP5CYKZh09ZnctJX1Qyjw/RpVWw0KBSuDlECxgAydn
         jwuEPkpV3OXFyBl+JZR861h8umK9lD9Ps4rplzbS4s+F7H24VLqdqQ4q1/QQ2aLlE9ZH
         B1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680795; x=1793285595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yNVkqf3xuwySUyAz6gXRTIRjMa4L8eTvwqGMoDFidY=;
        b=Z+YFhj2MBHh8+vxW8By3yZ1nk2hfnO5N/uDK3NsbA4t/+tT7JqpXU7VB314WO2hSRB
         fvyNgpVPPQUY+cJd5Q9zHbBYIQz/pBD1PYzDMakJFA1pnkmkuslS7tMawH2Md0TDDMPM
         8BFQThERgeqAEEKyDbw4+CaRyDQ84v0kNqxI57xNKQRph3AF3lSyqEpNgq0XqKnuCEcb
         FImQfsfqvbEXTmm1HwqqjgoZ8QLYi+uwY1a6AKnqMtVdMo+WKUUyzm1KXIxSdMphSJ81
         Vi+3/VFl9Y265prORQh69+jdc5hzJdIlk6hcH4lOwtjrZNooIRjp2pOs+s1X1AdAz/BR
         pThg==
X-Forwarded-Encrypted: i=1; AKwUvBzM0w1IMdlMOFmrIaKndEyeMhuXuP7NpP/Bsj9Re1KUORYsf4A/rMDF6F21KsCdV3IC65LA5aw+mhEsboI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOkr5H4Ec0FaHUJJ5vJaJ4RJo+Lgri61EHvvw/ELxHs3xqccil
	yR5RnogvECl1d/Dm0PX/tn3+UQApKpm7jYsLwwRKwzyYiGT1dk0P8jcu
X-Gm-Gg: AYBFou3QiRVxIS5980yFQmCGSAynNHAB/zeUQ4RGKE0isVxeqfa8zWvlIDLX/KKxfmf
	hFg4miaM7r3R7udgiNSZty67K+3meZ1HZYyQxz58KfBVbFKlaOkNGbCfO5haG1DOfih96lgVt1n
	EC8KzKoTvpAEhGWyS4ACLHHLq0f8g80o5Y+BKSlNUQZ9mVnaYz+DktEAeZB8aQ+UfJsQgjxVlih
	KZt79lUpST2EFRWD3MXM1vh36ieFeq9SoqnCCyCtf1Ul8xo6L/dcl4ihHEhmRXX3UpeuU6VX6R+
	yTpeg+tJWBzdIcP+m98FWwqKRE4uoozL8zLZ+11c0OIKokyGVwuZeDVRTJKT5w32IYUFDVgBxFc
	G8PKs0MTGDt6nTuiYVUGqWwASDh0IbOaKuRnjCKZNSz4xw7l/PKCu4pFGP4qbBqVBOBAM4YWCpx
	eZrZJzjIMxPwYJhSr/9+ExvMndHoX7+W8YXlp4glz6NeLgKl19JzdcKo57N7nLhRDck1bqF47Cw
	Gv3fe/lhOyOrMompQyMKYLoWYeuRfXkBkaGHhipM1N0Er9UY0Z8p7uf0ysyN2H5KLTyOnvI
X-Received: by 2002:a17:90b:2812:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ad86f5ee54mr4870361a91.32.1792680795485;
        Thu, 22 Oct 2026 07:53:15 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4767829a91.2.2026.10.22.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:53:15 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 3/3] ALSA: opl3: Shut down the timer after draining sequencer ports
Date: Thu, 22 Oct 2026 22:52:55 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
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
index f711139c5067..6b343b73c66c 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -271,6 +271,8 @@ static void snd_opl3_seq_remove(struct snd_seq_device *dev)
 		snd_seq_delete_kernel_client(opl3->seq_client);
 		opl3->seq_client = -1;
 	}
+	/* Stop the shared timer after all event callbacks have been drained. */
+	timer_shutdown_sync(&opl3->tlist);
 }
 
 static struct snd_seq_driver opl3_seq_driver = {
-- 
2.43.0

