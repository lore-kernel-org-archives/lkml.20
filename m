Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FFC38838B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108098; cv=none; b=ArAJUWg5xQVh99gPL/I/k5H17S1nDrIjdkHLPBVXuKjCAAQaiebU6SSOKb038s+wYP7SPF/hnuk5I650S3zs4l5saZATLoFhA7cVTYr5Cnu4bPF1wPJHuFOUqetf9QE2eUCHzLP23cSuzPdEIZu6PDSkQNL0CLfb2QQdJ4PRy/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108098; c=relaxed/simple;
	bh=PT9ArUjUozHhUUTYiMZwczp/mL27AYQ8/pAM0UOxD9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=itvBwaIyler+5WkCUv4nwu350OWy1PKxBdlgxLI3qbu0FpGTB694idMYdhuNeggRLvU8HbgjAQ6qV1011ZQJdJDyEaoalrMzpiu5pT8rwuW6ryacH8CqamkF4fgRJzk49dVDele15jfJcLMoMMMM7w8vzXmo6V8At8EiH5OAYi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJUKCMq7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJUKCMq7"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8875d220446so3120443b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792108096; x=1792712896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cQYVQp3cNq+IO9sRvJYpEZ43wUtWXqrA+QLO7PX+bJk=;
        b=GJUKCMq7HqiLpUZqJ3nmU+5QQlETGSwHnIjsII6TifYaG5bi8R+80P23RGYsaTlOpZ
         W+1uEbT0RQ37P+/JafAuTLSAw5qbVGuLMXfjmA322G7lmtld/3WmUWswOibK5pRHiJ39
         2tcK/1xe4N579C6WIbEJ9yKUxnH9sGCVuF5ebaSrJzTKDoQYaTeun3mnXweBv0rMwHun
         5twv9TFH/q23HqjVj/O9TO8VTj8bO2sKdRhfIt96GQ07EKa/nLFoWnqQxyqGxojOuQq3
         a3ptxrL7DbBLwpFWEbLHR+VmrHWO04qZvIFuES1HuLuO/vG3h4kjivBgJK1BXAsy6kdM
         msXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108096; x=1792712896;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQYVQp3cNq+IO9sRvJYpEZ43wUtWXqrA+QLO7PX+bJk=;
        b=0au68N02V77cJ0pCpnIoA4acgPquU58fA4kNM+jCLd/9monHcATu3wzQDd7V4/adR0
         K/0sXPgPbTK5p1ZJFGJfdW/9ddnpRs7wEa2EJ451c9rXErr3YBrnXNb3ER33BOk7RypQ
         3dNPWK05yorkedzvTgeRUAl9n9D6O+bxIoofLcKUDQ4hYEz1Yfb0PDjDjXxzKJDDWjxH
         +E7/dVuvJbGbQzWd/F8OBswZN2iYZgo7Sg5L5IuwqPJ8B6tF6+QPzmTVnk3/WZM+xvce
         ZnZsLL8hwIrXGeRO42QaJjRXnp13aajMo1RumLTBSRa1yBw6r1pfxMKAOeSr+lpR+Tgy
         jGqw==
X-Forwarded-Encrypted: i=1; AKwUvBwGisUEEkC63VHL+mhgmf3szWeKvhl/PcqTIiQh2SEeqe5TOTw95VU8tUa0/6X7gfBLsgCzCgHTkmifr/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIgXTew+92NTSrMyh/X1hgcMmFD/qvp6P5NpC7WQD6rZem8nEZ
	+3yz86HNTBcwvae0ZitNP74pEUrv8X8IPLlHAEOSQ9Zu6sOU9qlPQjHpVI64Nw==
X-Gm-Gg: AYBFou3N5l8KGBNaCJF1lZRfFHfPJvgKGSAs0UNhCvPTgAXCzogMoDX399KuHc3+5+E
	EoMaqfbXubVClrqZjWesNO3/3UVR9PGyWVW8sBboBW/J3WvvoiK4NHuj862ba1e/I6seyRhtTe2
	VXiveM6wi4MOzICznc+Q/lKXNw6buGOfzjshKZsJ247L77BkofMbTfzgg5wZJPpidm21AycHz77
	5tQ8yIii+r1gGieYzXgi/E5Cs0hj4Y1RsXlLWxAQslnCqqBUfUP+dQawPcUWk1EaZYLqD/Z1aGN
	Msj7TN/2252kHxn+pxuaaqsj3YRSyI13UGDSjmS9/PNAlNl516rPM6dIyhifZ+SQVwRKx3UkJBf
	MaKp0QQ4okzge2yCmO/T4CCJZp+DovQViFEaI6pnuCUSbHKrgIpx6oHtpygu31EBXcd+s/jkxuT
	kiidwocaDgZcb4rlMh26HwYIZ1yDSOfau+/sP1zZBw1RNOnFH9wvTSfDI+iWc0PLtJ5y5NvqthR
	pRVg55A/W8vDuMyv4yN71jdBKFRm6KTSqBsHcepY8bc8eHUTLZqlOvRfMgSAwLyrcy/Hg/jryO6
	RQQcdF1LCmngvYXm7Q==
X-Received: by 2002:a05:6a20:e212:b0:3de:5435:3419 with SMTP id adf61e73a8af0-3e16beb2275mr17738963637.51.1792108096484;
        Thu, 15 Oct 2026 16:48:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58208cc3sm255708b3a.52.2026.10.15.16.48.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 16:48:14 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH v5 1/2] ALSA: pcm: allow capture reads while draining
Date: Fri, 16 Oct 2026 08:48:09 +0900
Message-ID: <v5-core-capture-drain-1.e9b40d3bc08c4162@gmail.com>
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

Capture drain can leave buffered samples in DRAINING, but the transfer
state check rejects reads in that state. Allow capture reads to consume
the remaining frames while preserving the playback state check.

When drain wakes a blocked capture reader, return the actual available
frame count from wait_for_avail(). A zero count would make the transfer
loop discard a nonempty tail. Finish capture EOF with snd_pcm_drain_done()
so the state transition applies to that substream and leaves a linked
playback stream draining its queued data.

Allow capture hwsync to use the cached final pointer in DRAINING. Capture
has already stopped, so DELAY and SYNC_PTR(HWSYNC) can report its remaining
frames without another driver pointer callback. Playback retains its
existing pointer update.

Synthetic atomic and nonatomic tests reproduce dropped tail frames,
linked playback stopping at capture EOF, and rejected position queries.
With this change, a blocked read gets all 64 tail frames, playback stays
DRAINING at capture EOF, and the queries succeed with no extra callback.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_lib.c    | 16 ++++++++++------
 sound/core/pcm_native.c |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 4d665b4148d7..e8f6a9da4a4c 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2009,8 +2009,8 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 		case SNDRV_PCM_STATE_DRAINING:
 			if (is_playback)
 				err = -EPIPE;
-			else 
-				avail = 0; /* indicate draining */
+			else
+				avail = snd_pcm_avail(substream);
 			goto _endloop;
 		case SNDRV_PCM_STATE_OPEN:
 		case SNDRV_PCM_STATE_SETUP:
@@ -2208,13 +2208,17 @@ static int pcm_sanity_check(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int pcm_accessible_state(struct snd_pcm_runtime *runtime)
+static int pcm_accessible_state(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
 	switch (runtime->state) {
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PAUSED:
 		return 0;
+	case SNDRV_PCM_STATE_DRAINING:
+		return substream->stream == SNDRV_PCM_STREAM_CAPTURE ? 0 : -EBADFD;
 	case SNDRV_PCM_STATE_XRUN:
 		return -EPIPE;
 	case SNDRV_PCM_STATE_SUSPENDED:
@@ -2320,7 +2324,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	nonblock = !!(substream->f_flags & O_NONBLOCK);
 
 	snd_pcm_stream_lock_irq(substream);
-	err = pcm_accessible_state(runtime);
+	err = pcm_accessible_state(substream);
 	if (err < 0)
 		goto _end_unlock;
 
@@ -2348,7 +2352,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		if (!avail) {
 			if (!is_playback &&
 			    runtime->state == SNDRV_PCM_STATE_DRAINING) {
-				snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
+				snd_pcm_drain_done(substream);
 				goto _end_unlock;
 			}
 			if (nonblock) {
@@ -2388,7 +2392,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		atomic_dec(&runtime->buffer_accessing);
 		if (err < 0)
 			goto _end_unlock;
-		err = pcm_accessible_state(runtime);
+		err = pcm_accessible_state(substream);
 		if (err < 0)
 			goto _end_unlock;
 		appl_ptr += frames;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe..657e77d33b21 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3014,7 +3014,7 @@ static int do_pcm_hwsync(struct snd_pcm_substream *substream)
 	switch (substream->runtime->state) {
 	case SNDRV_PCM_STATE_DRAINING:
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			return -EBADFD;
+			return 0;
 		fallthrough;
 	case SNDRV_PCM_STATE_RUNNING:
 		return snd_pcm_update_hw_ptr(substream);
