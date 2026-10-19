Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2889A4B8284
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404114; cv=none; b=bIK2R9aU2RPQxfsZEFQa9AiKf4HSYkTmk6UhCQ+PftJuaddeLmNGRujlGm9ayouLNZU7tfgwRzj0P/M+GUegBPdwE5hF2MVljUWneEOM1ccwHKf09ZNSXCdpIrOISdt8ppftKM4uPU9j13o8qeU/FcmVOsDKVMIt4LF0Xq68Ytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404114; c=relaxed/simple;
	bh=PQN8fq7DDGv5/6wf3znNyQeVm8vhBsKez4YYRTcWMcA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=X7+PjHh8z/ukqJLRFbk0LntL2JCk8tt2j9txJMPrH6M7D+6NE3pt7aZaeQVnrQE/p+r6ModJlIrxESuKJ+M1HLL3mU7Ghcn1ddPbtXgst5oyjONMGLQ2xfyb0j6/Ny0UmfMM20woIWGhm3B1147yghYeqh3XGBIKsp0xOmVjHjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQDpNDIb; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQDpNDIb"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso539747a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404112; x=1793008912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/d0F+kS8lSmSGUKzwGZH1bspW/vpIAyRZ3tyTuBu4U=;
        b=eQDpNDIblHFOFJMVFsSSvnMSZTB2PxgXqj/qF+ia7zgiDDJ2HgPqd7Heq8bgUmkCAk
         +w1x1MNk4Ltvmaw+A7m29mKReOxyUwtNuNoZDsTSV5eU7U3FjN0jkVOjE7TPkv5lHRpJ
         BH+rO/U6/KY4fmItCxR5MmIDsqlHK5bXLUbulF9SHNYakac/n/PWohFhguyy/SxtudCV
         7iSodzLaYmYQ56g3TjB3AY5CbNaRo92SQyvppG23DrVC8t4aLI93E3DeQ846OjhYhBUc
         q9q/KoCmp/zllbDzfLu3S8dT0qrURUulaK1P/nJwKf/ES6VimE1tx8wcpLOIEl3q14s1
         YRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404112; x=1793008912;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O/d0F+kS8lSmSGUKzwGZH1bspW/vpIAyRZ3tyTuBu4U=;
        b=ijao53p98gX4WSTecvIvBkPKqT4cnkiCAMhpM49PC5CsdBTDX7p+zLYzAmrVhJgRIh
         POcoAcTT5bPI0t9K4Nm8pWjIfVd8cQBFJx388QIzVYNIJdF+Xle7iMPc9pt7IBb3mkZd
         4d9SkS9/UjaRvuavIcJpx7x/FjfuB0CJ4/5/LVAg92GZ67z28+LkB4l7G/07qbtxkIQH
         ki9s2AS1YsFlh5UTBXVadCRj6jExNDZHUU/3bmwTEiJKRJALoNkJLH7hlBQEqJ6Nhy/h
         iFSEOsrN0G9sfDgCySJbBgzEV6kBi/P4JHZFoId6Gxl3pWxq9+YuzI9HaqS3N6mPcFuH
         K3kg==
X-Forwarded-Encrypted: i=1; AKwUvBxNMz9vSG5caWsv65l/xeDlmFzvmsesJIocJrr0GQd3pz6csjfwUEdmLH1KRjhm57jaRAOGEzKFvxoVCjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYItfQhqPa2sXXFlmEyQIRJ47pnVGnHfydDQ06TP1HtQ7nUpkDfR
	X3DNTrZlxj/O5ulKUWOHYVCI/skhpBzOCwP6hHpuORTNnLWaAIPzBCe7
X-Gm-Gg: AYBFou1GBjwHNZw4OcPgt4/eplkbWQqdJkIg1dfMmVtDEPswVOGupQTk6ysIaNdhucK
	QUWX4L23RsQnDTyHEOeChffhGiNBe9grcHYAb4VQstyI7mmKfr/v+JV6+1gKKUZEuz+z6nQE1MG
	dtgSOk+9XJvAniWH2GbeI20HP64uLMhXYuDZMWc/EQrnJCFQXHakntZFw3/JhO663rFdMKpGIMt
	j3WIiUrMTr4BGMC4q0HaJqFuB52wg49b8JfGlPQ59OyzKOY/6d+NtumTv4GZSpcKdVbQ3N8IWfy
	NO/LsfpJUakK7P9ohcX1sBVrV4O+wkYhpb9Si2+NpEnmWFCzZGKLzrv1Koe5KQn/JSt3MR74OUt
	NwKbL86CPGUvyDKa0bwjpB+aB7fwUryFYqi7Ddt84uN6Ur0SG8MaxWeBkDKbrb4yVDsvgX8l3dO
	m4aJMtJAvEAaMw6mTKkSlYe98aMCiojE++ULDup7PdoV6la6dVWqN0M1V+mF4RUvkaNA==
X-Received: by 2002:a17:90b:4d0d:b0:3aa:fdad:7d6c with SMTP id 98e67ed59e1d1-3acef5b08bamr5967293a91.58.1792404112061;
        Mon, 19 Oct 2026 03:01:52 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e87836bsm37464495ad.47.2026.10.19.03.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:01:51 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: pcm: Remove channel-map controls before freeing substreams
Date: Mon, 19 Oct 2026 18:01:46 +0800
Message-Id: <pm-pmb-4a207d9ef3a3597a74a4-v4-80b0113669b1a62fbbe9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A late HDA codec bind on an already registered card builds new PCMs
before registering them. add_std_chmaps() publishes generic channel-map
controls during this BUILD stage. If an earlier chmap succeeds and a
later allocation fails, probe cleanup frees the BUILD PCM while the
card's control device remains accessible.

These generic controls are added directly by snd_pcm_add_chmap_ctls();
snd_hda_ctls_clear() only removes codec-tracked mixer controls. BUILD
devices also skip dev_disconnect. snd_pcm_free_stream() then frees the
substreams before free_chmap() withdraws their generic control:

  Late HDA codec bind / rollback        Control GET on the live card
  ------------------------------       ----------------------------
  hda_codec_driver_probe()
    snd_hda_codec_build_pcms()
      PCM is BUILD
    snd_hda_codec_build_controls()
      add_std_chmaps()
        publish an earlier chmap
        later allocation: -ENOMEM
    snd_hda_codec_cleanup_for_unbind()
      snd_hda_ctls_clear()
        generic chmap remains
      codec_release_pcms()
        snd_device_free()
          BUILD: skip dev_disconnect
          snd_pcm_free_stream()
            kfree(substream)
                                       snd_ctl_elem_read()
                                         down_read(controls_rwsem)
                                         pcm_chmap_ctl_get()
                                           walk freed substream
            free_chmap()
              snd_ctl_remove()
                wait for GET
                                         up_read(controls_rwsem)

The control read lock cannot protect a substream already freed before
control removal starts. The failure above occurs before
snd_card_register(), so the PCM has not transitioned out of BUILD.

Move free_chmap() before the substream free loop. Its snd_ctl_remove()
withdraws the control and drains readers under controls_rwsem before any
substream is released. Normal registered-device disconnect already
removes the control, so the later call remains harmless on that path.

Fixes: 2d3391ec0ecc ("ALSA: PCM: channel mapping API implementation")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 41c2cab7a52c412b7c68374059cd305a6b3fe3d7..36c3b7cc742abeff889a96b452a88d267763caa4 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -819,6 +819,9 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
 	/* free all proc files under the stream */
 	snd_pcm_stream_proc_done(pstr);
 
+	/* Drain channel-map callbacks before freeing the substreams. */
+	free_chmap(pstr);
+
 	substream = pstr->substream;
 	while (substream) {
 		substream_next = substream->next;
@@ -833,7 +836,6 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
 		kfree(setup);
 	}
 #endif
-	free_chmap(pstr);
 	if (pstr->substream_count)
 		put_device(pstr->dev);
 }
