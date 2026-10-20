Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463373;
	b=CW2pnqUmA81iWq4LW2DM32Rg10tCk674MJksAPFukAocW5FXuBLfYr7G+IP8rJeqHYz2
	 ooAxJ18l0tGmscdgVSIy6VahQPspGE5Qz/4YQ6PoWOIoNNSAPzxPPQrruc9EZiU7f+E+b
	 o51Rhi/zleKFIsfpjvmmBbLCVgAjFF+gDWDQXoBPYEI9Z7kLv+o7IVH9+XLBgZyFnol1e
	 dR7DbzlgtyELFnm+t/AxPJREUcetyomumaMALFpe67G6u3YHTtvPIAPv2USum82cHLscy
	 +dejn2qYxFBR/bRNyz2KW7kCPbnOqrOX3qKlhsChbIMZoZQw33zEqASdQNL2p+z7baQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hxsyEcelzfwAgBR4zNN5oG01/wpUWW34zbIR80jT05k=;
	b=aCe7ztkvsEkKa8cgkLHHrq5Wb+coYfSzlXZZWVHg7z/DVcLhJN9fhjVFXa0AHYgGWKTC
	 NQcfue2cMFAEQaIYCBh8AOMgfhKfoolo/mAmxwlpLgR3obijDzauLFBlBrm+wzTJse6Ea
	 npvmlTpOkkpsE/4SqrgKojPJjxqMNrF7AF9mjIBnq/V3pQiXK6JGQzEA0iljJ5lCsjskI
	 L03PJ2JOOi5pYKQu/WhbJdLjD6aKJXadpPqL7Plx+BVD6fwZcDm4WO3lA92oG6QlmO/vm
	 SoAgobNpxe00qAsJIN0UA3Zc9cdou1IbtgAzdyC7e3rqAZJ6asrHxNpPDJ+u39/a9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kncVHfTR;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E245606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E245606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kncVHfTR
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso14289915ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792463372; x=1793068172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hxsyEcelzfwAgBR4zNN5oG01/wpUWW34zbIR80jT05k=;
        b=kncVHfTRKCcj1KhIOQ8ENNpt4TZYhM2PX1iQq2AMonZkG8eiNDHgIq4Clu4Wt92HUi
         zxIZIe3WafztLTtIxsRGDvynWF7M7uBl2+BBwgQXOaVQlxvVy1/qmPKHCH9ck1ob5Kow
         Bp1HfBr62bmeTRuiibfA9eB8VXFBlvLuQ7AF2Y5VgCZ+zB+zmGhWFae2QBBlDUUnEXUw
         FwSPL9F1tZVC/UggYKognImwM1j+wrPaoPMJ+mUCeGEnXfiw5tcvaVuJjZ60xyNW1tiL
         NQF6ruKDkdkfAqZSLVcbec9Bt3gMDqE6LqG+1qI5alkn4abHFlp4S9/4dc5PpJQ7t+7Y
         mN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463372; x=1793068172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxsyEcelzfwAgBR4zNN5oG01/wpUWW34zbIR80jT05k=;
        b=ruIXC1N5lG1FyTWaw/SkvY6DYDUH6EgDydrOCFv1JvU+i0OGOhsZ8g2Hdjc2Zmb/UU
         2YfBY1vBoJPXh5gmibkV9xiOHb1EcLhWMvORsNW868QVL3vt3Fl3xRqbA61RKC8Rtwda
         SH13p4JldE1vTbQzajw7VrXYUWNpZqNy0/Qv5na3WPjCqn9M5ctoG/UKowSagxARiSrL
         ChGHHxoMX9D5OWmJgZc+i4igZCzrr0SPdSkhDqbdkC4n4SEHYq31eFsRKSw/lIdavx3J
         HmDFW67PBnqhYroLaimQj0bgIH0vFe0C/zEe/zZPndiTSg0COg9o9chbyTQOtTVkqMhF
         mMzw==
X-Forwarded-Encrypted: i=1; AKwUvBy+s3hhJDvx4Fy4xf4PHekbjpMk76Auooe2YTH2O/n9fqTf3xdAdXCxH8iswqIDGXw1h+XC6157YlFi2uw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgCWVuRWGBm+bYVAOWuvH3GHaxfI5QEAIO6FGPUlLvBR0/0pG5
	Ovd2reDCksXDukEA2HfKiGcgNJnWnvPoUvqYMWUM+9/zS1zg8OuEK5lv
X-Gm-Gg: AYBFou0i9gX8X0estb/QIwfJm916+vH7Y+s21yJ++yAq0ZsHaaUVxK9dq54iQE4LrgM
	IiuL02g26EEE2LzZrZgi8WHpeA9rTYhxZ7TMrkk6oIFwYQEx3UY24p8HMzSvWG2aIVZrgc1Eako
	r3OiGa7skO3X32MFgWpTN7gwgGvydDOJRO6zDoluH2oe7cTa2IGS+U5VA9x/bRUtuu1cuBWAZ38
	TLVZv3DqhVpcWUiowVFN1vKMrsGwDdfcuPmJrfWRZN2IxQTnoAx7FQu2RZK1T0BkHZlcqv0yf8e
	q/L+QFH+/8PivNUL7Oqp9P/46o5VPVq9euJAOqOczpGybudASdMmKXr2QP2IgwC1ssLOWrPPx+y
	Rqrv/1Q2ElrFrXwU7RMdDKJpZTYgPjGjGJQ4L6cNqcd1hWDmgigAsftkrwWQL5tA/kacqCLz/k6
	MWCOndzcBgKc2QLhbLxtau4T19GaTAWc/TG+ZZ7QJcyEshMQ+5n9LNF8EojFyGOdt6QQ==
X-Received: by 2002:a17:90b:2ec3:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3acef51e29dmr7744767a91.42.1792463371828;
        Mon, 19 Oct 2026 19:29:31 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5c72df56sm1973136a91.0.2026.10.19.19.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:29:29 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: pcm: Drain proc writers before freeing preallocated buffers
Date: Tue, 20 Oct 2026 10:29:24 +0800
Message-Id: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The prealloc proc write callback changes a substream's DMA buffer under
pcm->open_mutex. Final PCM cleanup frees that buffer without the mutex,
before removing the stream proc entries. A pending callback can therefore
race the free or allocate a replacement after the final buffer cleanup.

This is reachable through codec-only HDA sysfs unbind while the card
remains registered. With CONFIG_SND_VERBOSE_PROCFS, HDA creates writable
prealloc files with a nonzero maximum. Buffer a valid size different from
the current preallocation and leave the file open, without a PCM runtime.
Cleanup reaches snd_pcm_free() through hda_codec_driver_remove(),
snd_hda_codec_cleanup_for_unbind(), codec_release_pcms() and
snd_device_free(). The proc file pins the card module, not a codec PCM
reference, so it does not prevent this component cleanup.

The text write is applied at file release, rather than by write(2).
A close in the gap can leave a replacement buffer behind:

  PCM component cleanup           prealloc file close
  ---------------------           -------------------
  snd_pcm_free()
    free preallocated buffers
                                  snd_info_text_entry_release()
                                    snd_pcm_lib_preallocate_proc_write()
                                      allocate replacement buffer
                                      replace dma_buffer
    snd_pcm_free_stream()
      remove and drain proc files
      free substream

The same late allocation can occur without a concurrent close: the later
proc rundown itself invokes the buffered write callback. In either case,
there is no final buffer free after the callback installs its replacement.

Move each substream's preallocation free into snd_pcm_free_stream(),
after snd_pcm_stream_proc_done() has removed the proc entries and drained
their callbacks. Keep rundown outside open_mutex, which the callback needs
to finish. Both stream directions and construction-error cleanup still
free their preallocations before destroying the substreams.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 1e4e0ecb3dbd..ce577c303a1c 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -825,6 +825,7 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
 	substream = pstr->substream;
 	while (substream) {
 		substream_next = substream->next;
+		snd_pcm_lib_preallocate_free(substream);
 		snd_pcm_timer_done(substream);
 		kfree(substream);
 		substream = substream_next;
@@ -861,7 +862,6 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 	}
 	if (pcm->private_free)
 		pcm->private_free(pcm);
-	snd_pcm_lib_preallocate_free_for_all(pcm);
 	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]);
 	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_CAPTURE]);
 	kfree(pcm);
-- 
2.43.0

