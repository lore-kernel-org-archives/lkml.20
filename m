Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ADC3BD22B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108103; cv=none; b=N0CEZN7Cl65YM27098SJocNhXI0vYpeil9TOQrMuwuvcO+REm4daga4ZX6HGsNcxXYZPXFFcfKw6LpJonbbnUW3WtnGJJO4tfh3jhvrPTMwZFdeboKq02Lz7DlY9OEILNm/C6d4/EzCTLOuWnn+1oYQQJFG/ZEgXyR2WIgW6J1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108103; c=relaxed/simple;
	bh=zhZzBea2Z86kYNzBM+LKVA2YIh33+o5OWhnjTOptYMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWFMcVGYDMBszC7HNTnwnhkrFqvG9qC7TiUk70/6M/47atLEPADumOtEHc+513g2aToI0WnOvv5+OywtOzx04EKpzAAkAt2VhXedCjhCXkp4DYeM0YWZPk9uh3dOIeB5UV1Dg1gQxuB0HOX3TF2KO+I/scIC40mb7TI3lHufjXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvtObGrX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvtObGrX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso26083255ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792108102; x=1792712902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qAZ6PZV9tCuDC2ird36Pj+1BXdLr29r1ZE5dTwgZds=;
        b=mvtObGrXNXgNjDpfn1NFvQuMUTvfQAOOEECz8y44MUZVNWVHE6vOd379LxdyevZWeE
         rHcpNZLQtN5TbdCdZN67c70ipOTqmAvC+BKsLWiZJ8qulonw7wtpc/ZY4pPMThMMxHIV
         n/I6vtXqFjBjQcBD9lO+XP0b3223Slxl0hrI8GLfhN7iAnRwCthEhcJ2b+7/fBjGGYhP
         7aG254KZiBXC4dCo7IY+12RvtSpzm5PztDherLZRCWj6zHb2jmO+dpAlm81KBiQAN8Hi
         jleN+RB0B7O477E9+l945OXe6qNGFLd/Jxd23OIG1FEWXnGSxERDU5n3lpZA4npe9ZN0
         zl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108102; x=1792712902;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qAZ6PZV9tCuDC2ird36Pj+1BXdLr29r1ZE5dTwgZds=;
        b=O9EseDTlLMCgfHN1+6X5cG5g31SdhBzcgZVOTGrXV1FnUpTX8Lr0mUGFfvH+k6SRM+
         /YUr8ussNO1K9jWPuD+GlQUI5iEewxVJviT3qATnd8ZO4cQ8VvDKXegeszE/c7Adz/Ik
         M3KyKKRDVFrJm7ED3+q9wUMuzhfLQ9w0ushLGXKXSsN7U8wQ+PMLIg9lijNOvMBqij4L
         VZKnvpmWMOSGL4rl5ulwAjDVvIXLdoqSgYnT0OEmPSl1eCn2nyIegIRqOZVmSWnZfuZ4
         0expuuRWSUwCIWaz/A0xEPrjfbEbtsiXCbsbGAnn/8pKTbiGPm18m3KplPiLZVndTWn7
         QnNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOwz6u5+2M5C0BA/jssuWLDLqz9R2yLy65CpfVa/lkUj59rfArCZnn5b/R1y17JvFLB4MG9v0qANaYL9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQX2HOeHQYHWOBh4+s1AIeCQUJF8LS4p6UeSqp9EAvRwaYN2R8
	RY7dcNFwzI/tt8AK4jyhrYWMIvIGuuaTnhaMQKb3nFM9HxMl8Crwcgtd
X-Gm-Gg: AYBFou2QfqcAs3qAwKYfwEH6hk9gQJtLxSQgvwDr8VXTVZqd7wGxoQQKl5IZu+6SsYz
	R0fU1hwyxmtOOcja4vYPxUoD6GRmaLNqPcbvGfKK4ahGFWpkYVFBhWaLgcrAHaELP+PYq0yNMC1
	j2OR7Z6WweYfJy/5MVsAKEyN7T4+syqbhpLi494ptJ6+c1e4BmK+h7toO2EsRu1eT9X83s8QbTn
	Ee80tYO9E6a0EL22G7BHmcTAd5YFhvaFs0z1CYuyjWGHLn1JZj7lqIx1mGLqvh99I9JzDwSf7+w
	dicE79a3VRH/z6pDtoIFgRyJOZ3tXoSUKDhf3x9dku7X8gxsyqaBrh4xqG6v0wKDHSBZWnYn0BA
	Tya67lZH1xg9RzcAm8bduQpoiE3sZX27chp8sPWPJyIIYViziX1ElKclfGgnZA3W668jQJarw/J
	qvu4lW58oHJWkP/HDqWexM0s4IiczCUM+1Sb6wL9icO+fQP6KQCJytYGsRTKy1uxbgNAzYO2dFf
	dtgk61XRPc+ZY85GxJlgvwnIj/tLvBg9puCfqZ96JoGiN26hZRLmNe94WSmdlB/PQXdEPhDkwAq
	oHnRynw2XScXUkyO
X-Received: by 2002:a17:90b:1b0d:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3ac4e182f22mr8575822a91.0.1792108101986;
        Thu, 15 Oct 2026 16:48:21 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e7311sm6391155a91.4.2026.10.15.16.48.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 16:48:21 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH v5 2/2] ALSA: pcm: refresh linked pointers before draining
Date: Fri, 16 Oct 2026 08:48:17 +0900
Message-ID: <v5-core-capture-drain-2.e9b40d3bc08c4162@gmail.com>
In-Reply-To: <v5-core-capture-drain-0.e9b40d3bc08c4162@gmail.com>
References: <v5-core-capture-drain-0.e9b40d3bc08c4162@gmail.com>
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
