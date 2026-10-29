Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263905;
	b=3FYkV/RgGvhibXHAkFP4aPHUwSP1AigYjdAlOk8RRMIsrUSZmagJt/KpSKvOasIqhccw
	 J1EZwacQvcbmjYZB9bOgJr+RA3ctVYSzfyH+vOl70xrIXiiulcEU1PLn4zFg9eSpWi9jv
	 hkOreXNRMnARztOCLHF0VH7UuQxVBWUN9u6qxcz+VBPbkuQcCQHWgnGPKcxuMET28m4MU
	 AYjUla8nkQx+5pZcLmnwK76ZtnXrWbHaLbitDQ8wz2dUlhVZtvdqkV6GMlgxuMClSUgko
	 sS0H7jQA4a4k8Qri9JwKaTxg+wsWBnwfaejR/Q4ghEgO7bi/Cg97hVgAeIootTFn+Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qJtB5Nvv2DaUdrJ0GdmD6/1pS/UrSmPqffjERrQCjsg=;
	b=qFMwJYdzIs5iezfUPLhObODKKeqjCG4oO27C65tdblrZ/VasPtyT/XGKFwCfz/LMN+Nv
	 rf7HnEByouL0AyuwrLWr4HuYGumuWcvmNMSay1gzoMl1dipvb5wU2JwLBZSfkLE8yUF5A
	 Ro3dvHJyQQQVLbH3fR0Ph2scJJVOqQbvlNH55Dz0OJR5ktP6b2L/tYpkH9FxHeJ3D6DbU
	 PVUeYbVAREF4OixyG1vCUdkt1FccKjV+GYDI+AC16+4gwhXf9Mj/WQovnitPUSM5b3f71
	 8HMuUGFyZg6LuwaMpRHmMJ05ygaYzO89DZsGW7bDBI2iT913UD7Ge9Bro569TiqoPqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mbgJ0jgG;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834FC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mbgJ0jgG
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e96502e447so16485335ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263905; x=1793868705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJtB5Nvv2DaUdrJ0GdmD6/1pS/UrSmPqffjERrQCjsg=;
        b=mbgJ0jgGsigEm12I82XPrk7bqHzRynyHB4Hnr9y2JyxWKssVm4Swq+X/bnOp5Krs8H
         Ni5O4t7c36iDEt9pdazFIDdmM/j2h2T89dO6agWaY++u3N+8lVHCn2Kch5ruxOi+w1Pt
         mJfU8zxwkN3jP3yt5Or9F3aptLqi+BPtwSPdo+ge7gCSKbVHpClLmjRJa9sGsJ1XF5xN
         /wV09fH5LTwzGXQeW8/v709x0JGhEoVi2jXJszoWQN2h+ldfqHK2WC8ekMmWnefO0a6Y
         6xiZstOa/C2IvqG/5Pm/Nm/Wxx7lHk3BDayXG8+5gcdhIrw5fAkM4rUQbuhV2m4C4Mny
         XS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263905; x=1793868705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJtB5Nvv2DaUdrJ0GdmD6/1pS/UrSmPqffjERrQCjsg=;
        b=JYVoz2ss1m5Y2QUYqtJwtTEEHHCwsFrBB+F+sTWX5960Vwq6pD6gkfShsLXRm/PAlU
         +ozd3v5BHubYxLuWeofomulpxW4P4tDDGRm0O5O48Nc772D983pIvET+NstXTF2WaWbN
         L0LkcKwXUcx5G5UM8W5vc0LgGRReO37+AtUMjTay5VMSuTj4MD+iVo5onTg+3xV2qyac
         8lGP7VF7N6502TLnqQKJNkm4PSLGXrFpLZ4HFsPExIranzS8q+VrM3GXpk+IA7aJTH73
         eMspja0AvAmKcOmPShzHVb4KqaUzqw0+ByklALdSCOxQAl071Zwgd/FlG3uy5/gLQcT6
         3xTw==
X-Forwarded-Encrypted: i=1; AKwUvBxgQ/VCS0i1aV6nR8hI5LaqIlc6wLyMOTf3xc4r4gL8sbsKMTRotrIZjYyv0hdk1fWvU3JwL54aA6ytwL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfhv7WLOCy/RGIlY2WakRcf/cm0zCk9RYR+Gp5E1MexLGIEopf
	7G0OR236xx2V/Vo3syabnpiFS2wOUmgc6X2vZvlOXXgFl3gpCvl67LmK
X-Gm-Gg: AYBFou1UWBLLWuOiy+MzHl+sbTGSNkwua4Rst+yZDVGSN7Ccwv+tk8nuNgk5fuBPOgA
	6+f7ODsBy/767+OzKAud7snF1sBI+BgVVmL4ZXF3ygbG2lk4ggVoedWboS+3W5K3uqmFt9Nv5Lh
	oy0cj0S6FOV+HhP3UX0jPgluEW0KK22EmDwrU+2vT/jNuxEBIhx9yK5/acrvAkmMODpQ2dgjmW8
	4gTcECWn4TIltjBXRvsqzDU+7Ts3DASgfxDMY/L55E1nSNDs1CuA8hZ+vlm1s6uV4zpBoygFfqc
	0w0oEi5s6624LvRgCBQIk3W1ZAuifzHu/XRx8Jy7CcNrpePc/IkwVF1zenjrHDuLSF1K+eeJRzH
	X3QCFBgUzE9R1evHp+WgrWRnyRTfMZ5Dnys2B+TLQ81T3ATvLjN/H4sLFtUQXhUtZJ9RtYUdB0U
	bSTyqq9KCpo5fZtkpbjCqAq8MIqDFfyEYm00oy5XWWH5v2P6IBn04PLJpNIG/vrO6OBtpMHvuq+
	ASi8urO1qk5KoIR40Wv7hFogy0iSqWr9auh72W42zYpBQQt6QO6ynJ6qQinobWu5lRFPBe3wI2w
	dv5EMlOzmQizyDup7mTt5sM/NclZxBFC535jzIZVc4Tyi8qf5+NfMw5NgPJBbpXSmCQOgdXR+2G
	n4y5bQAfGJ5KqtsesVsXsHCtoDJyNiBgWQ95SIOIPMQ==
X-Received: by 2002:a17:903:b07:b0:2e9:66c4:1717 with SMTP id d9443c01a7336-2eb005b2f5cmr44424035ad.61.1793263904985;
        Thu, 29 Oct 2026 01:51:44 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:43 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v9 14/14] ALSA: virtio: rebase ordinary capture accounting on RESET
Date: Thu, 29 Oct 2026 17:50:32 +0900
Message-ID: <20261029085032.70689-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

Keep ordinary capture's indirect accounting in step with the core RESET
positions while retaining device ring offsets. Select the operation for
ordinary capture at open and preserve the staged capture operation.

A refill failure after the common pointer mutation must allow the core
to finish its matching rebase. Latch XRUN, stop further transfers, and
report it asynchronously, including when the stream is paused. Returning
an immediate refill error here used to skip core completion and leave
inconsistent positions.

RESET therefore returns zero for this late failure, with subsequent I/O
reporting the error. With the worker held, the first nonblocking read can
return -EAGAIN; later reads return -EPIPE, and paused resume is rejected.
Prepare or reopen is required for recovery. An earlier error returned
before pointer mutation still follows the normal negative-return path.

RUNNING and PAUSED, managed and free-running refill-failure tests passed,
including delayed workers, 48,000-frame recovery and reopen. Deterministic
MMAP capture tests cover position continuity around RESET.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -10,6 +10,7 @@
 #include "virtio_card.h"
 
 static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -398,6 +399,9 @@
 		&virtsnd_pcm_capture_staged_ops :
 		&virtsnd_pcm_ops[substream->stream];
 
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE && !vss->capture_staging)
+		substream->ops = &virtsnd_pcm_capture_indirect_ops;
+
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
@@ -1691,6 +1695,62 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/*
+ * The PCM lock covers indirect accounting and core completion. Once lib_reset
+ * changes hw_ptr, complete the core rebase even if refilling fails. The latched
+ * XRUN rejects subsequent pointer/ACK operations; the worker publishes XRUN to
+ * paused streams too. RESET success therefore does not imply stream recovery.
+ */
+static int virtsnd_pcm_indirect_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
+	rc = snd_pcm_lib_reset(substream);
+	if (rc)
+		return rc;
+	if (!snd_pcm_running(substream) &&
+	    runtime->state != SNDRV_PCM_STATE_PAUSED)
+		return 0;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting || !vss->prepared || vss->stopped) {
+		vss->xfer_xrun = true;
+		virtsnd_pcm_schedule_period_elapsed(vss);
+		return 0;
+	}
+
+	/* Pausing does not move the device's fixed DMA buffer positions. */
+	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
+		runtime->status->hw_ptr =
+			bytes_to_frames(runtime, vss->pcm_indirect.sw_io);
+
+	transfer.indirect = vss->pcm_indirect;
+	transfer.indirect.sw_ready = 0;
+	/* Consume no application delta while returning discarded RX space. */
+	transfer.indirect.appl_ptr = runtime->control->appl_ptr;
+	rc = snd_pcm_indirect_capture_transfer(substream, &transfer.indirect,
+					       virtsnd_pcm_trans_copy);
+	if (!rc)
+		rc = transfer.error;
+	if (rc) {
+		virtsnd_pcm_transfer_failed(vss);
+		vss->xfer_xrun = true;
+		virtsnd_pcm_schedule_period_elapsed(vss);
+		return 0;
+	}
+
+	/* RESET discards all samples through the observed software pointer. */
+	transfer.indirect.sw_ready = 0;
+	transfer.indirect.appl_ptr = runtime->status->hw_ptr;
+	vss->pcm_indirect = transfer.indirect;
+	return 0;
 }
 
 /* The core holds the stream lock through the matching appl_ptr reset. */
@@ -1790,3 +1850,17 @@
 	.pointer = virtsnd_pcm_cp_pointer,
 	.ack = virtsnd_pcm_cp_ack,
 };
+
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.reset = virtsnd_pcm_indirect_reset,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_cp_pointer,
+	.ack = virtsnd_pcm_cp_ack,
+};
