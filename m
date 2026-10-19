Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72054A3F1B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405781; cv=none; b=Ar1IzVSw10TxDgnEtO4aad6ACdhzRdJdTURaMcODSWxNLIMmMWAALt2yF0vGYt4ZXmPnIduVZI4DGBeo5c8M0eSIXX9utWNOM6yMKwPLTmj85gFO97Z1wS9SxuhX6MV+oAwy1TGqpfIFEKtA3sk54EhL6jUhH8MW0OQFoCaQsR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405781; c=relaxed/simple;
	bh=W13c7d5g8Yx/PCNesjQ+Hj1xQt7NJ1OhYFThSmNdOJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WmARlAm6m68c5t1IJWYoRPBuAS4S9j73NXkgdAoHEri4JFsdwbcmcYitwpwX6pWMAvZwJ6MtUDNe5Wg753fUnWWVSYeV9fPwgc5c3U7j5kuWZLbN9umQIuVMgyt+WaH+M1XtDbXvsChV6AZ73Y1cheb1NSLnwjuzMnW87pfevD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXZkeC3U; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXZkeC3U"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9f6a16aedso3289305ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405779; x=1793010579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imqLr57W/P7U1FVAYJ5sw6ff47tbhxpPrkhx1LufKmY=;
        b=YXZkeC3UQmxgMFQu+2VMOKIcyiZ103/0XuhL4vbgdWVJW8VzZh+8rryhNHdm4OtGjW
         xB03RbFuM70+4cIIm4REm7Dx58nqLZ0tFGOYFTjN1Fnqnh9bAPYYYF2DjuBc//lN1z74
         P6Pl4bqEdkR6qP//a1m2G5oZJWVnViY6PSSxRR0FJ+3dI8aO8YXQmbK/QDxfYBop7qxF
         rK2AkYS/NbKETWdnngAWdb1Egip1z4SAPLq5IPqb9Hs6u9vDtzOV0hm0vCxVoUFCWr55
         EnU4KkBr6foqg0L8N6TO4OvyAd+Dj3VF/f6jGYST41RLnOiVqhOpI+0ElGO0i4/0fdHu
         MRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405779; x=1793010579;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imqLr57W/P7U1FVAYJ5sw6ff47tbhxpPrkhx1LufKmY=;
        b=VMzp5s3wn5XBA3U2eqoMAQkrZ0kHLUlP1y1KK/2UxbPs5p3EC0wD+C1toC8lY04A/2
         kZWoESR7hwbw0/wNXL+Gt6n/jTZfoSTvrzrE0MsEWXd7cHkan4YwwDclrFU0vF0EaXv5
         gkrQRFoE/I9qqm/S0bxN4iqYQSPng4RfHQ8DBp2Zyo69jz8s/xiPJ+C/JX79eTWOPE9c
         HKOfhNrS4lM+X8aSLuBfBJblICj6x/hkO3Qe24vXh1iK3LGVAC5CK0PL3+rwHXDKpnYu
         2mR1WdN3XO6x2JBf3QANBZ0PxiucMaBXaohOYO0H82MDrTlxIeAtolkJBEuAmZ0hIp5u
         ze/g==
X-Forwarded-Encrypted: i=1; AKwUvBzlh25JMMXWmoMXXa9UXDKm/4ZYd20cwo5EoRCQYiGqxBaw5M6d3MQPpz3ziNQD3TVMfugWuKjnjPik09Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg6cuG7uW1GqhUkjAYV7YdCA03ASeuKKDBWnuWL/b8sWCZH7FH
	xgq3BqiyKdWZLLY0lf7IDZzUm6IqKLjUpQzV6yXyq4/WqIPZ4kiZJRUQ
X-Gm-Gg: AYBFou3RxHMpalf6MZH/42NjCv8VKtWqLTDSKfX+5TzM63WaXG7HOWIsG4/RvBeYXf9
	l2szsbRnhpQgqUcwpF1XDBD+cc1nxIVp7RVivQoVl+KUeLthKuC6I+/8hurwWi4hA5h+UHMagEj
	Quf+t4soAhjw8m8HASi3E84CVRqUhw529soYZr7Cl7dScgA5R30B1JS1GwsE3qbso8uxBLOn3Pe
	H6mu4AcVOAc6tjhbJ3bumr9OAOVv2JAsqyW7wQ1KiXVo2VOMNcOUoPO4l6vng2TBIJghssyoTpY
	8QfQOk6udGgBzyd5A7g2grsY1eoVuzGtibIa5ytmozv7RlSreeBxlRHZV4GMoSijffxEE4gEtFO
	VtGC1hN1F/nydjx0l+zhvlALtNSnRCzGCXOS3xzU4gY6bKMPRaALrAYXem2d6v5zrgpmOaG9Jn1
	zvB2aVonhUA4EPVi65+KXmfmhxiMvwJUcWpIfgI3m/NyxOOvAXts69WxDA+8ODxyrafQRl98IKB
	U3F
X-Received: by 2002:a17:903:2ac5:b0:2e9:9c65:1af7 with SMTP id d9443c01a7336-2e9a6e525dcmr67714845ad.45.1792405779150;
        Mon, 19 Oct 2026 03:29:39 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e87994bsm36054495ad.60.2026.10.19.03.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:29:38 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: pcm: Protect channel-map reads against runtime detach
Date: Mon, 19 Oct 2026 18:29:33 +0800
Message-Id: <pm-pmb-0b5d6bc7124d0b921f2c-v4-b9738bdeab8823999181@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Channel-map controls remain accessible between PCM opens. In-tree HDA
code publishes the generic controls through add_std_chmaps(), so a
SNDRV_CTL_IOCTL_ELEM_READ can overlap the final close of the same PCM
substream.

pcm_chmap_ctl_get() checks substream->runtime and later reads its channel
count. Final close clears and frees that runtime under pcm->open_mutex,
while the control callback holds only controls_rwsem:

  Control GET                         Final PCM close
  -----------                         ---------------
  snd_ctl_elem_read()
    down_read(controls_rwsem)
    pcm_chmap_ctl_get()
      check substream->runtime
                                      lock(pcm->open_mutex)
                                      snd_pcm_release_substream()
                                        snd_pcm_detach_substream()
                                          substream->runtime = NULL
                                          kfree(runtime)
                                      unlock(pcm->open_mutex)
      substream->runtime->channels
        NULL or freed-pointer access
    up_read(controls_rwsem)

Reloading the cleared field can fault through NULL, while retaining the
old pointer can access freed storage. controls_rwsem keeps the control
alive, but does not serialize the matching PCM close.

Copy the channel count under open_mutex and use that scalar for the map
lookup. Use trylock with -EBUSY because snd_pcm_dev_disconnect() takes
open_mutex before removing controls under controls_rwsem; blocking in
the reverse order from GET could deadlock.

Fixes: 2d3391ec0ecc ("ALSA: PCM: channel mapping API implementation")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 4d665b4148d7059402a55abb62fb24da8ff73f69..1ec7db324196f60d8c72a879c62ddae0a90ac0ff 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2496,6 +2496,7 @@ static int pcm_chmap_ctl_get(struct snd_kcontrol *kcontrol,
 	unsigned int idx = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
 	struct snd_pcm_substream *substream;
 	const struct snd_pcm_chmap_elem *map;
+	unsigned int channels;
 
 	if (!info->chmap)
 		return -EINVAL;
@@ -2504,11 +2505,20 @@ static int pcm_chmap_ctl_get(struct snd_kcontrol *kcontrol,
 		return -ENODEV;
 	memset(ucontrol->value.integer.value, 0,
 	       sizeof(long) * info->max_channels);
-	if (!substream->runtime)
-		return 0; /* no channels set */
+	/*
+	 * PCM disconnect takes open_mutex before removing controls.
+	 * Use trylock to avoid a deadlock with controls_rwsem.
+	 */
+	scoped_cond_guard(mutex_try, return -EBUSY,
+			  &info->pcm->open_mutex) {
+		if (!substream->runtime)
+			return 0; /* no channels set */
+		channels = substream->runtime->channels;
+	}
 	for (map = info->chmap; map->channels; map++) {
 		int i;
-		if (map->channels == substream->runtime->channels &&
+
+		if (map->channels == channels &&
 		    valid_chmap_channels(info, map->channels)) {
 			for (i = 0; i < map->channels; i++)
 				ucontrol->value.integer.value[i] = map->map[i];
