Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310F4AD4C1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965757; cv=none; b=D0J/sNc7FUIgjXVg9yzUzHGf7hcCoDz7uhP6tJ8wtxn9Fh8LiXqppo2Pjh6lgAvPqlywQ7mzts1/pAglZi64LlRPspnqGmHdx/6lFZYYAjnB/LHiG6quFBRNtNafMIfhqmXKXxdVkjN6eVCrz2QGdwDR6/kxF1cIMWCFVcSGuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965757; c=relaxed/simple;
	bh=zEQPV2lpDdrKh8MYrhmPIHVTn/gyRcVcSODlK+MQT+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRTgaf4CU7dOGO22xRhT2A4Zme2XtERIi4Sbw5RdS6fVhR9EC4RqJZr4njHdbJwS8egLMvIyJRYl8zP6XpXg+UfvQM7NoTG780R34qR+lYxtaIFr5F1eE33rUWi33fd/dqgshTWgZgbk+nHiHUR9RHx2zy89Bm4BZYZnER5f18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtIgUhR0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtIgUhR0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3155669a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965754; x=1792570554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AfArBK3+cusn3HmvPaqcUDFD2wL+m3gUZKnXKnxPxrE=;
        b=UtIgUhR0JCgsRkozU2ohGmvQWGv24rRrhxmQZR9KKgMRcB4pnpUyytIkEBlHaYkYw+
         +D5fqGiytoq1DAYIoL5AfNlmE3qEWMWYYpsLBixfraWreW3Ff5eWW86tbE8fJ4HYiwG+
         kiBPQtalZwN8vfac8jHT57cLFmOd/bv1VF92rIxs9YzX/oZAP9zw+bVJhkPpR6rjtoGI
         OfhzfyVWFvDGzaEGMF5z3N7e7JeHYC0VSR2ika2aIBHO4h2zo71dcUeBcDSjS8zpPvTc
         dN7PGerP3fyg2zM5KO1j4O/BGblTslCk2+m9F3JVw8kOvbrm3xNUyyI7Ho71Agl1AZK4
         igmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965754; x=1792570554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfArBK3+cusn3HmvPaqcUDFD2wL+m3gUZKnXKnxPxrE=;
        b=iyWcBpV6QewS08KLXbbetgA6zI6bispKlyJ9888+MDQvoBAGCSfV/8d5iSKEIslmKk
         y7WqfZxKZ++y4S+LQcALdOF7By+O/s9DFiLmMiDMj5ztxkLZ2vW1uUDhPglhHOtxjVCe
         FhNqGr1j7obDfBr/SzkR5Seo9WJ4aFEnO0weErmYdMP1fm0hpb0/rjBvvo0ifSg8HjEd
         7IzNvk3X+I1u6ZqIG4hXjhKUDB2N0edW1mr7jwpCBHr6xe6wfEYt7tkcdFSQuQW6MsQx
         LvOjZ2fMbG46uQm58uB0880B+8jHO2EKZaxZAiTFam35woRjH5tA/t4E2jIHpN1Z/wlL
         2rAg==
X-Forwarded-Encrypted: i=1; AKwUvByS6DG1vAvWgOM1oaZJv/VhuPKUAWN2xED/U9tNSdb28UQAM3XvipQ7fm9VLQ+vSA872K924At1GhVRUQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm2XHP7X3ArBXmQWuSg7ATMu7LdcOJ8UZAZp6Fy3I9O4fCms9U
	u5xYsjsHM+PMOJD7GDxW0qH5oapLrHwa48pAgUPyQuUVQJiSHyp0znJ1
X-Gm-Gg: AYBFou2l6o8skbZh7ciFaXZ694tCIDMshFmNcNx1vMM6AQcv8o6qJVyFl64aXuWcp6x
	VKKPs0sDRCdZJ72Xx85xl3Vo8GKv43sxNBh0ADipdHr9EieFKcKnpzv9YQfaGJexv0Yi7wrnKnv
	U4QJJI9wwKlOF4sanvDpZDt34tV7nyvCKH9MMInEEdiYocOs+lM4YRxVdxwOm/NjRyb3nEkFPT6
	SktJ/9yfUyuUT/CheXCmU4gZ7A81ndqb/2eaX99mzRdLl+8YaAUYA4m7cZ/18Ma3SbadW4HrKMk
	aTiYHB65dE4GV+ffgy/ShMaSXWj1fEvEvrjQyq5Ktfjq7+YRWqL2v1NXSBK1f0tJF79PS6WrMsQ
	dEL8aOxM7/Fe42ksobjCDd9Qx8dXOcwEbJQY9LvX9sKJiLODe/pH02g1VSCcZvpk6zqdYKeZN0s
	HInLGFGBB5msEtWv7tS6Z1HZQogbTT1J7CByWofRdKViaZsOzCaNwgexi005/7MqC+WORO5+S/6
	2tOrMM74xAVkaQJ65N7olBjTAx8HpEghsnYcwngW9N2v/YITVkOyDj8zOuSALTx+jnMPQoEI2oK
	bUiApqcqglCs0Qj8E7an0AfawA==
X-Received: by 2002:a17:90b:50:b0:3a8:272a:a328 with SMTP id 98e67ed59e1d1-3ab3a33dc22mr12692532a91.9.1791965753741;
        Wed, 14 Oct 2026 01:15:53 -0700 (PDT)
Received: from localhost.localdomain ([121.137.86.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac752d590csm1628301a91.2.2026.10.14.01.15.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 01:15:52 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v2 2/2] ALSA: pcm: refresh capture pointers before drain
Date: Wed, 14 Oct 2026 17:15:48 +0900
Message-ID: <rfc-v2-core-capture-drain-2.2eddd58a796e497f@gmail.com>
In-Reply-To: <rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com>
References: <rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refresh active capture pointers before the drain transition so the final
captured tail is accounted before reads finish.

Keep the link rwsem held through pointer refresh and the drain action.
Release the initiating stream lock while refreshing, lock each running
capture member only while updating its pointer, then reacquire the
initiating lock before the state transition. Pair the rwsem on every
exit and retain the existing error cleanup path.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_native.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe..5375f8f931d9 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2176,14 +2176,32 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	} else if (substream->f_flags & O_NONBLOCK)
 		nonblock = 1;
 
+	/* Keep linked runtimes alive until the initial drain action completes. */
+	down_read(&snd_pcm_link_rwsem);
 	snd_pcm_stream_lock_irq(substream);
-	/* resume pause */
+	/* Resume before refreshing capture positions. */
 	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
 		snd_pcm_pause(substream, false);
+	snd_pcm_stream_unlock_irq(substream);
+
+	/* A pointer error may stop the group: hold only this member's lock. */
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (s->stream != SNDRV_PCM_STREAM_CAPTURE)
+			continue;
+		snd_pcm_stream_lock_irq(s);
+		if (s->runtime->state == SNDRV_PCM_STATE_RUNNING)
+			result = snd_pcm_update_hw_ptr(s);
+		snd_pcm_stream_unlock_irq(s);
+		if (result < 0)
+			break;
+	}
 
-	/* pre-start/stop - all running streams are changed to DRAINING state */
-	result = snd_pcm_action(&snd_pcm_action_drain_init, substream,
-				ACTION_ARG_IGNORE);
+	snd_pcm_stream_lock_irq(substream);
+	/* Change the stable group to DRAINING only after all refreshes. */
+	if (result >= 0)
+		result = snd_pcm_action(&snd_pcm_action_drain_init,
+					substream, ACTION_ARG_IGNORE);
+	up_read(&snd_pcm_link_rwsem);
 	if (result < 0)
 		goto unlock;
 	/* in non-blocking, we don't wait in ioctl but let caller poll */
