Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298993955EB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948665; cv=none; b=ROednUXTofSxANigy6osg7C7aP+enZGfyBZk9rr7D0dpSurXPMS4SLpP6tOoaFmudTe6jb3kOb4BYi9m6jZRIjMwmxC5tmsxjidwfkR63aeYU70c52TTtsLMfG1R5KnmHKHPHAc8Xl4kzUG+fVXOluqLaLdI0WMsJ94Buq1aZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948665; c=relaxed/simple;
	bh=a1zoB4jM644DlD+AKW5E5XGLIlgEJJCaSSnkZ8z3L5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TODGe0FZZWK+7OwZQotcneApmjXudSIzDWCJeOq0AYCBKENF2UFHl9L10nwWmtc0QTrGIJcHgb/t5O4xawQ4ffnWq+n4yco/fwo/TX0OsRF7avGaVVgCD0uYLrtjvpWKYkYtbjJPT9QCPPeQ1kBh3QIo5P1vGmuyVIPlE0Byf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+dh+Yv3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+dh+Yv3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so20311175ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948663; x=1792553463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DeSorT59zvpBPNILOX/JRE/fILGH5zaXMNlr01hcWQ=;
        b=A+dh+Yv3JmmtSdgxIu9QQ5nuq9xS5iYHvdqgR+Mn4zbI5zLCdanmdGSbO8/qEAucjv
         EMH8LIeva6Lq6twAJffs89BGGbk7frpZNzrXG0jZBt4LtUbID/cNU/YmO7Brf7sYyI9E
         5GLxtR2bAAHABKstIO5GVdgDIsP0KV0+pvx7jhs74pw6PKndC8G23WNXtidSTEVizXqn
         Xau0EXqwQ0qKwa4S2q6/xdMqx0JhkWvRLFNTRXLPel0Y4WU6EJuKjH6J1SliqPdf7+Mg
         xe5ugGQoTxq+aIOWH0c8N49LhJ4UM3KYlkJ0sKyZz982GhEKXc83hx+PyKo/zLb8kaAu
         vDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948663; x=1792553463;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DeSorT59zvpBPNILOX/JRE/fILGH5zaXMNlr01hcWQ=;
        b=gwDqbee8sGZqGJOmfyPuSImaD8LRB04c0Y9kR38Q9kzsRUzjlR1sVb9Nm8vlm0qH9q
         ffugf8EgEGcariro/LnzY7n6OVbYoNJVtclXCBcXT8sIQM8Vi4GaSPNTxNk28JldMq5E
         BZ1W6vM0I0VWglSMrPBXD9bt9V4FLUb85j0nXQLAk+RSpmjgEYBbkF4z/1KkpSup6o7P
         hz/hUgLKVVyZwImWgwf1YH9BYrag9jXm/6AE4O8DDwZycPEQWGv53GY0BtSgipgZyWFx
         TnuL75Hrfsccfv1jSPUROdqTwS6PallVPJ4u1gaKjBOqDJzVLg5zx7PgHLweNpME2OV5
         MFSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiTkpM+soLl2fuEwmYIif2T9bFRn0Krrd94MfjAi9KmIETf6ni/Nw5HC3lAcW3qZetiHGBigO5KtIsRx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaQYdUVCznyPwG+wuGFxUajCsMlK0728NqJ4pUIA6NIVpYXarb
	HDyWmmNY4jhKP6N8ninUad63Y8VWkIOwq6ptzEmpfIxlY5bTB1BUcPGQ5i3Ymg==
X-Gm-Gg: AYBFou3QbYI9GNM+aQWU7APpNL9tsGQKxqqPcp/VJiOmgJm8x1121+ZxaHWU2Q8WYOJ
	d4W//fGZrksmIqJ/j8jYTq716Zyo8LoFlw4fzwdUR1pzSVYyFD9MtoIZiE3iDR8mJy/iCXIHs4w
	Xn56gYR6t7aruYchH+iURAEX2rDwvL36httFeBQJj+Oz7JJqOyUxoL4WBzagpYi4iASS1fZXm/O
	9eo0JDGvzb/tTlDqdeN0iM8aXPz6IlzE/DvfocPtpg+F8a/T/VzzemwofBW+wXTvUC2d6l0pyNm
	vWVflki5YqaaYgwAxonZE0GOUE2kfnj4XYKfnIS8JlKjVY523bNwD6bpjz9ITH50L+uc3nzBA1j
	E6eOwBNKzjK2txwmeOoNadNTwYRDHtJG6G02rqIMFYQ5XSohPN+bVScvkY6yRamJLj/cDmbJUDH
	UZVr8boWXUM/ZN3oRYBeDIJzh2vUesDNFuSzFUPMriG0XidREfm+mpStyv1PFd3nNCF6eBeW4E0
	M2snTRsoVf6ImBLVqsgd6b+b2XRGufKihjS9doP3AwVpA/KKPxAeXrYQ+G+dhdn04iEFICA1HZ+
	9PIbDhyqUkiv6fcO
X-Received: by 2002:a17:903:19e7:b0:2e6:1a6c:abcd with SMTP id d9443c01a7336-2e84280a68fmr143697955ad.3.1791948663377;
        Tue, 13 Oct 2026 20:31:03 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4ebfsm65008455ad.78.2026.10.13.20.31.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:31:01 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 2/2] ALSA: pcm: refresh capture pointers before drain
Date: Wed, 14 Oct 2026 12:30:57 +0900
Message-ID: <rfc-core-capture-drain-2.112c40f0e9284eaa@gmail.com>
In-Reply-To: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_native.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe..622ae7be2d04 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2176,14 +2176,32 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	} else if (substream->f_flags & O_NONBLOCK)
 		nonblock = 1;
 
-	snd_pcm_stream_lock_irq(substream);
-	/* resume pause */
-	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
-		snd_pcm_pause(substream, false);
+	/* Keep linked runtimes alive until the initial drain action completes. */
+	scoped_guard(rwsem_read, &snd_pcm_link_rwsem) {
+		snd_pcm_stream_lock_irq(substream);
+		/* Resume before refreshing capture positions. */
+		if (runtime->state == SNDRV_PCM_STATE_PAUSED)
+			snd_pcm_pause(substream, false);
+		snd_pcm_stream_unlock_irq(substream);
+
+		/* A pointer error may stop the group: hold only this member's lock. */
+		snd_pcm_group_for_each_entry(s, substream) {
+			if (s->stream != SNDRV_PCM_STREAM_CAPTURE)
+				continue;
+			scoped_guard(pcm_stream_lock_irq, s) {
+				if (s->runtime->state == SNDRV_PCM_STATE_RUNNING)
+					result = snd_pcm_update_hw_ptr(s);
+			}
+			if (result < 0)
+				break;
+		}
 
-	/* pre-start/stop - all running streams are changed to DRAINING state */
-	result = snd_pcm_action(&snd_pcm_action_drain_init, substream,
-				ACTION_ARG_IGNORE);
+		snd_pcm_stream_lock_irq(substream);
+		/* Change the stable group to DRAINING only after all refreshes. */
+		if (result >= 0)
+			result = snd_pcm_action(&snd_pcm_action_drain_init,
+						substream, ACTION_ARG_IGNORE);
+	}
 	if (result < 0)
 		goto unlock;
 	/* in non-blocking, we don't wait in ioctl but let caller poll */
