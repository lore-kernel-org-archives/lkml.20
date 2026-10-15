Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D462DB7B9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024577; cv=none; b=e2J5SOD2FKGj4E2B6XBti9vOFIXvQMrjiiFI16z/AqIzuftPHgIxOL6wtGzDPEPZChpPZVntdFQEHtJ63RRrVq4OfWl5KxRYEqV5BagDm8m9Zj81znq2G0Ztj1G/Plsm+/tzziWx3betG4oLEn2z4S/FMWRotkpJTe5ETlPVKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024577; c=relaxed/simple;
	bh=zhZzBea2Z86kYNzBM+LKVA2YIh33+o5OWhnjTOptYMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O4ZnQontP+7YUvsRYbKLmQLNNYXF9Y2I+pVlbIcsB6OR/iYTdlzwZxNemYmhKT6bh8MRLPzPtUKg+mxvrps6yyqs6SyKKOjLMWgshFj5UbfVLgHd09gqAOzNNNLDSecoHUub5MS6Xm+O9ZnO5fRWnpyA3mkttDhvjWLmUc9Bf/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k80u0pV+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k80u0pV+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2632355a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024575; x=1792629375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qAZ6PZV9tCuDC2ird36Pj+1BXdLr29r1ZE5dTwgZds=;
        b=k80u0pV+iOCprYN2/z4AjThtInWTF4WELiu8ikGbkh+4T6twnk5Se2/sqPLwONfiCS
         rWQkRfTq8indfl+hJLukvLcXlUii2gcgSupdFMP+0KeaacObDtykMzShCJEilsB/8GdK
         thfN8viBWv642H6/3xRcIEjmqzapfsCClq3v2R6WOhkDnUnh+18JtGOHOi9uTT+12Oxp
         NxuToSh+YbZwgvW7kCmtWSYeTeYbnYidmmY3EXxaa2zPIov/SVvAUbX0YPZF/604NEQ/
         RKeDXe+sROubvWqERtq4E+8Gzr/gt3tYRoHFLxITU09LxZYmyAJxw5SEoQD0zJZ37y6F
         iOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024575; x=1792629375;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qAZ6PZV9tCuDC2ird36Pj+1BXdLr29r1ZE5dTwgZds=;
        b=npXCO1Sl7wS1yPst7NbskVtvI56a3aSi44lEAzuK9TSPmaoFgiI6/upZcNoIEAor0+
         4MpsW3o/RAJGaC5kF2TwXuukD0JQ4ZruAOK/lBY410pU4DF4uY/MSJ+HJ98DC8cxXv5C
         3YCENcxW1Q2eG6VWx+c5/QjvoKaRXfrav9muZHUTW/sC2WWDzsVcE+BUHnkbL4AiPrpV
         qajfdgEt2uIT30EYgEngXUfsZ8jaYEneCZP2dpPkNh/ZD/GyQXzQq1Ecv7Ee1nFE+FJU
         hzIA0F4FSyCEZqmP/voEXwGR94NQbZBhxgLrj2NXKO9/JPfMeCYSHz4iGu/qKqzBYAb4
         9e5A==
X-Forwarded-Encrypted: i=1; AKwUvByf4m6zU3l6ZPg/u7xVQc3nrrvDaDlQxrJWkh2gWeiGI3dVxmHTao3MRJ7ULP5XlPNVVPmnP3yKexvpc1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpUwfywUBzlz/tpEyzgFUO3etQCIm7O6oybmI3HdWlj5juf69A
	VGKIVnvpG+AltVzwv9I8ZUeuR3QZRWHQO0JsENp76ViPXIithgpIxinpcbOWxg==
X-Gm-Gg: AYBFou0Q1fFSg4L/WwysvlZYtocfqLWlvISAq+4UVfrZzLQ6djNb976+HwFYm3MJBvd
	cXyToUtMEfEgtZXUBpBfyGTI6nX16AUHhLzp7AepH9naG/X2fwdR+07ueKeoU8Apgm34E3ST4PL
	10tfpQmhu86YqyVADD/3WZiLJHy/7xqNfjXysK4hOaldEd7AzAHhpgEnUoIdZNrSsa7SO3K2EtJ
	XT2cBSSlfrLRNGyQhAOF043UiluPLOcMqC+hH3P8C4wSfO1DzqRkKUZewWEGmL/0arexg32PFxY
	1l+Qb/2CSUTbsYiYzKbmDEDL3ZDX8XUa6cMYH7iDWCmzjTyduupUayTDaeRkkGhXizWcb6LlSHr
	mNlpxGpRNvIklreCRUDuA3H3HkF6UBfEewyTIsq4TQTsvqe36cfOmPaWSMlMZl6DNv8wwtsgmfI
	10kASdrpl6WngXGkyMjKwh0t5LIM6LlFoSycDCJBbftGchpm57sDNEABJBCw69Wtf09zZjK+7TB
	u2RS0GpaIbtBfnELx3edu+ZREp2G3knRbdV62q6LEY7cnf4uK8F187xNIEpwxDhR+RahLMFkoM5
	gVXjFjmqLKlbHRJB
X-Received: by 2002:a17:90a:e704:b0:3aa:fc22:8aaa with SMTP id 98e67ed59e1d1-3ab3b0951e9mr14438093a91.67.1792024575043;
        Wed, 14 Oct 2026 17:36:15 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm1629010a91.7.2026.10.14.17.36.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 17:36:14 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v4 2/2] ALSA: pcm: refresh linked pointers before draining
Date: Thu, 15 Oct 2026 09:36:11 +0900
Message-ID: <rfc-v4-core-capture-drain-2.b56779f7976d4657@gmail.com>
In-Reply-To: <rfc-v4-core-capture-drain-0.b56779f7976d4657@gmail.com>
References: <rfc-v4-core-capture-drain-0.b56779f7976d4657@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Capture hardware can produce samples after the last PCM pointer update.
Drain must refresh those pointers before stopping capture, or its final
availability check can miss the remaining frames. With linked hardware,
the first STOP may freeze other members, so refresh all running members
before entering the drain action.

Factor the traversal into snd_pcm_update_linked_hw_ptr(). Hold
snd_pcm_link_rwsem for reading to keep membership stable during that
traversal, and take each member's stream lock for its ordinary
snd_pcm_update_hw_ptr() call. Include running playback streams and invoke
the helper after pause resume so paused capture also receives its final
update. Keep pause and drain-init outside the helper's rwsem scope.

Updating a pointer inside the group drain action can enter the XRUN stop
path and recursively acquire the group lock. The helper runs before that
action, so an update error follows the existing group XRUN path and is
returned to the caller before drain-init.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/all/87jynkcn60.wl-tiwai@suse.de/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_native.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 657e77d33b21..9ee7245f4707 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2071,6 +2071,25 @@ static int snd_pcm_prepare(struct snd_pcm_substream *substream,
 					(snd_pcm_state_t)f_flags);
 }
 
+static int snd_pcm_update_linked_hw_ptr(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_substream *s;
+
+	/* Keep group membership stable while locking each stream separately. */
+	guard(rwsem_read)(&snd_pcm_link_rwsem);
+	snd_pcm_group_for_each_entry(s, substream) {
+		int err;
+
+		guard(pcm_stream_lock_irq)(s);
+		if (!snd_pcm_running(s))
+			continue;
+		err = snd_pcm_update_hw_ptr(s);
+		if (err < 0)
+			return err;
+	}
+	return 0;
+}
+
 /*
  * drain ioctl
  */
@@ -2180,7 +2199,13 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	/* resume pause */
 	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
 		snd_pcm_pause(substream, false);
+	snd_pcm_stream_unlock_irq(substream);
 
+	result = snd_pcm_update_linked_hw_ptr(substream);
+	if (result < 0)
+		return result;
+
+	snd_pcm_stream_lock_irq(substream);
 	/* pre-start/stop - all running streams are changed to DRAINING state */
 	result = snd_pcm_action(&snd_pcm_action_drain_init, substream,
 				ACTION_ARG_IGNORE);
