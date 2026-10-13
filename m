Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948A38E5DF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878086; cv=none; b=mxw9OEQeed5vF20EDVW/KkjC5FRzcyBsexZ/ukRekSGBWcuVslN56ERkoMwnQtfukbq5mWIVx1Zgu0x6FcQUOpWutl8a5APaIWMc52xNvCP6zm6QgruvQ+/z/nH05DoJnrq4bDx/wF2qNBGlLh/uYKWsAP3ZLMtdE7Ogbey+T7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878086; c=relaxed/simple;
	bh=yAuq0E+ePKBMFDmMV0+DZ8kqdHN2wT0+Zx0qM1T0IDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YJYYfw1mCIJ3PTfl9zhAuxQ9IZVFASxn42omR19Cw570EOfsRtKPbHHxg98X7zBy8Tp3za3pnj0l1eg7Yd5RfU3gkuu32RIHAki17EFbeny77PLUwcXAz/TdlS+pWmWMFrpxbYHgZav4rhSxDYQK+/4wA64uwlmDxD8MAzfpSdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjCetV0V; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjCetV0V"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso114077a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791878084; x=1792482884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvwjtpUG3RnC1sD8vDRN71tGzJ8uNjm7bPeVXuvV95Y=;
        b=sjCetV0Vkxe3hAAnqzYEblQmXdaTPfECs7jyQe8leuqrse0l+5Sj88x+F8zACPyvrW
         8l4etj8QSmaDkJlOvPePxeU4lyVMsKVYUIpSqHi1UOJZ1MnxpieL7nALGUh1/9y8IlMk
         G6A74q1X8eisggmkf+eXoCj6kWgA5KVpq3lM+f7ODmOdUIni2ydW/TeSq5PpUHR9Qeie
         BJeVtMjJPdDXFEqv6WskSrgk0z/gynTJk8kQMNwcdbZS4O+A2DU+jXt7VkjtU0uLfLza
         iTUMixisuGv/UIl2FN4ZNOpjk/BVswAPOCBwt0H2JNZkVysdPMatfYIQmmHls9oqWNJe
         ujiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878084; x=1792482884;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvwjtpUG3RnC1sD8vDRN71tGzJ8uNjm7bPeVXuvV95Y=;
        b=E/btNmyqyxapDwqCQMVs0A8M9FxLa/mis1c/jwuQAzqlAKd2thLQNnNBHgyhVhw1rm
         8Z1ycHBSe4CX7cEjXJlYaTO3Kqx0T/+WtGJE2c9mPBQ0Mt9NkqSDYYuTAZfW3Gu66Qnv
         mFRdmira4QjYwnDQVMWtcXgxjqKMDZ6W129PIEw/1ZYLAm4r51P/B5gfnCVATFa6qwuv
         xETLWytKTqOjdxYBotpxoW0bx19ltM7qBZPq+Gx+DEfd4p9chC1AxHw0PyxOepTBH/C8
         fGPy4xdp3pNR/JbshisOFIq08z1t27OYgq2heidL/LfpK5yksPXM3LUiywrycFHY9iAK
         VR2w==
X-Forwarded-Encrypted: i=1; AKwUvByAt0Mgv5nBDkDDz7CkbkXgpQfUDivCWjCRl2v1n1sCm7JX1S4c2F9hdB8kF6qEuRCclVoXssBvw4GqKqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3SB7MCdT2I+vC4girV7K0g+u6UKO+ban+lhsa9+hYjl+w9+8Z
	oft/8K+ORV5CXUNQRUgnv4Gil5RwVyvMds4SM03qTmjrQ9BU688D6DKo
X-Gm-Gg: AYBFou1ffZZx33Ls0xl9C/gXMLmATvH1GSUDpS2LHbiw5WeLdtlabdyzbUN8Gk3ywmO
	w3dSWmRxm8ovSF6JVVpqCfa+cm5WJSg6Gx/FslTxNPTGnEXiTjl93TqWNKSAeUzfO/Me7Ni5C39
	KQ8XzX0l69GRgKKIXfRC4iZeJsBZfyXmBSlLCjOM59L49uNe01Q54c2qvt9ppWbHBRDaKuEI3OQ
	8nlSfwOv4XJ5O1n2HsThBR+Cgjs7IM+bowOFiYMVLXLd/k++/300bY6Rtn8VyY8vgX2g7d3hZR5
	9X6AzS8LAXCD9pIA0UQgKCKA2PgpGZC8AZsyuUEbD9gxoaZ0dGtW7uSKvglPHG3dI0bpxhqdJgl
	tZ1+Sd1cUhT9dzm60mlGNXoFe7g1w1Y3JTq4QQWHgqZKx11hc7u955LoXs/NqZtC6ecRdyqjJHi
	HumwLdl28I2MSrf6wTKLqc5CtA1qtFfkcQZgmGHnMv2jApw+dAaxvMINNqAb3xAl2exQY=
X-Received: by 2002:a05:6a20:3942:b0:3df:dccd:fd4 with SMTP id adf61e73a8af0-3e16c0d6ee7mr10273815637.74.1791878084158;
        Tue, 13 Oct 2026 00:54:44 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e21bcdsm4951770a12.14.2026.10.13.00.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:54:43 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	len.bao@gmx.us,
	hariconscious@gmail.com,
	sammiee5311@gmail.com,
	kees@kernel.org,
	akhilarul324@gmail.com,
	cezary.rojewski@intel.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: rawmidi: Drain input work before freeing the runtime
Date: Tue, 13 Oct 2026 15:54:35 +0800
Message-Id: <pm-pmb-98489078ab56528d8e4a-v2-9408ce8c8f3c70b5c10d@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input runtime embeds event_work, so the work must be drained before
close_substream() frees the runtime. The cancellation in
snd_rawmidi_input_trigger() runs before close clears substream->opened,
leaving a window for snd_rawmidi_receive() to enqueue more work.

With a sequencer subscription to a USB MIDI input port, an in-flight
completion can overlap the last subscription's midisynth_unsubscribe():

1. snd_usbmidi_input_data() observes input_triggered and is delayed
   before calling snd_rawmidi_receive().
2. Unsubscribe enters close_substream(), clears input_triggered through
   the provider trigger callback and returns from cancel_work_sync().
   The substream is still opened.
3. The completion resumes. snd_rawmidi_receive() takes substream->lock,
   sees opened set and queues runtime->event_work before dropping the
   lock.
4. Close clears opened under that lock, closes the provider and frees
   the runtime. Stopping USB URBs does not drain the raw-MIDI work.
5. The queued work runs and snd_rawmidi_input_event_work() reads event
   or substream from the freed runtime, causing a use-after-free.

Cancel input event_work again after clearing opened, before closing the
provider or releasing the runtime's private data. Receive holds
substream->lock through its opened check and work enqueue, so once close
has cleared opened under that lock, no further receive can queue work.
The final cancellation therefore drains any late work before the
runtime is freed. Keep it outside the spinlock so a running callback can
finish.

Fixes: b3c705aa9e91 ("ALSA: rawmidi - Use workq for event handling")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index c43cedb5c12158978054400d4c22adf00eaf6b1d..630d9fc8e9da0a0e7d6a2eded6aed531b094b932 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -607,6 +607,9 @@ static void close_substream(struct snd_rawmidi *rmidi,
 		substream->opened = 0;
 		substream->append = 0;
 	}
+	/* Drain input work queued after the earlier cancellation. */
+	if (substream->stream == SNDRV_RAWMIDI_STREAM_INPUT)
+		cancel_work_sync(&substream->runtime->event_work);
 	substream->ops->close(substream);
 	if (substream->runtime->private_free)
 		substream->runtime->private_free(substream);
