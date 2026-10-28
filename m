Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156010;
	b=Q5puMQNJupyOmUVozwOA12m5U5ayJpySFzaEaAH4x54vcoLArVaCQxZTQe5G300M9GkV
	 RN8lsw03LB0GPctjgGpWoS6+PMhwBBhMC8P4tzl7k4yqWAM12vgIwmjXlmUM4Y+mTGTMG
	 VUyV40Q3PCYOQMe3JF7e66FnA0F7SiEBWbWEnkrzSfQfI6FjMQyg/gRJQqKak8jg0oIdT
	 6fygE3T43ebroaPIHQJ1SIbxv+4rBw9ZAiii185AmC+P0MfBNjrDe6TSHuy20q1fnHI9K
	 G2T7Siki+Dq+g4fBAYB8mHapFtPmdYAHrDKk24VWBsmVJcZszcx+Wg5zmTTRwLFmJoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
	b=CfWjGzXoQbzNWbmIt1hv/yJxNgq5bgLX2w2PFIZqJyyY7i43GAD9s4iuM+Hx4SjzIiDE
	 R9frYUdMWXx4PjrkbiKigtLAHSUSi0qUV4pUdGP0IsqFZISkce7u1erSwocj1olfdc1Xs
	 Ow6O1Q6AQx1GhsYewUsZNnC9pbptQvLisOzjHAdKOjj81iZgk4qziRh5DwuHKOOL79tJx
	 w4Rdtp6aSVCIF297ZvwVFN9doFDKu8v+F7JkUaW52eVSZX21Xz59Q3F0nYfJ9pgWqdTO3
	 oOVP36E2FzPoJnoF6dtz9BLCUkwtg3aMu885QwD7zi+csziPsxieXlP/PJmWXUac2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kM9tKH2g;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A089606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A089606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kM9tKH2g
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso974950eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156009; x=1793760809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=kM9tKH2gWPbRWI8+dj5Utovl7LVp/4WfhOJ1s0H0KUThXffOKaQsudyJ0d5TuYX+XK
         GkTBq2khJGl2jDOFMfYs5kNp9ZpsDejg1V3KcpOXFHGrbUkx138H58SfNcwtMEF1KZWy
         zWRDZeuIyX4VIXp1W3OnJN1BtyNAF4mpvhQVx3ZGYA6Mcxb7K0pBZhQ9GzA2YVGEv8Hy
         hpPQOssqXb+1Wss+MwES6fzrqB+/WoAmjv2oqcJffNQfrqXRhxKLgnXt+0lprDk5MGmp
         hiEPpv6oaCmGtGqLM5awhYf7sGV5gQ0iCvGjfro+4VRDHUyp/+vAYBDJoqCu/jeI9UD1
         +k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156009; x=1793760809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=SFFvKIxu2eWH1nNcoa8TN4AEhbi4BRx3xFvx3s3Xdd4WnVfyA7+eQ+QhRWOFaGPEvR
         0Lu2dka/+lPdJ69vMsS5vWt+Or9QMjFf1DK5+hyrY3fnsPsGKBz6Ad1ifLCh3LrTFU+z
         dwiUyXxb2U/ZJl8RXg5CB/CNU+Arja4dSz1ulrE2Fg2cNWgdJEXi2vBkIUiPoXrAEidM
         uIYjPQ2IJvCIubmlBrrWET+PnLY3YYuvJpMHTSR001iZ6c3AiVpcRj2IiqV56d67+Z6N
         Yj9njQp+VaK3ImB5x2cqCLHwP4x9+SyLVf4ngyuWrY3LOUDVLicPFi7+nlm8y64sh2br
         MG8Q==
X-Forwarded-Encrypted: i=1; AKwUvByWs2MRHVTWz5XtAZxzQPWpmNtIZptYSAgvdQXAGy1M/Gm4Hk3HCDYfL0smPPIEsNlM0CRztwy/oCCTMQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMzd/RNpq8uB1Q79WgyS1fB5/4GdrJpp7CWbekIqzM0f0efncY
	ttKNgXHBZfxoe4MmXYJHebfuOIqhgebV3Z3vxRJY65cBwrqzrzY1qBTM
X-Gm-Gg: AYBFou1InQ/NEiSCO6/7SCk43+m7r+2IYkkcKpBBsRHULtiFZd6lE+zugO9T1ER5xMo
	FPaaHW8O3Wa/9jLTjcEsS2fUZBUWeOFsdEnO8bgsCMJimkIcwb1WL9TR7nZlLkE5KHUhaRpuvpz
	acrFKfCJFrRvbZS6XqasU8CWoWCJXiIgBH6Rj5VAozyKqyF6jG/u4dwPVRUi8ZjstnpaSeBr5jM
	d9Q5CnzZNu9jqxtQGXz3yIhqiHV/TOzjS/1VVq9lXiTFU55606ljDy75m5viBMJurBQsf1gc8mT
	IylBHUacX4grigHA0If5g0UpVavV7MTJ6u0gejumDANglUKnH04rXufAwmqVZZtQHiIL/j6UgPW
	1oZt0scvmD+bDJ01rR9e7FRWXgoueAhTXx2mF8iYfuT7HrJanYKpnyfKD0gOdOWZVrYhSRzD8k6
	DCGxFz0Q6wJW4AK3/5JgunrEoXh12R0RN8AJZPcPIWDuKcvTp8D15Z5dzGm+nTrvFe3gyBWui7q
	AivFszO7sjLP+zercFwN3D7csb0uk4Jpy2AVPp+GGNuWAzsEzVAAyY9eFSjDhLDL+ZuR9FbhU+x
	AkQt/LQyyZyydwtZsm9UU4DC9tUqIv8Uiwac/0pV9jvgoqWHa1m1+VbuBI1oCmxnuRQAnjxTZ9Q
	OqKDddytzk2WmYH4gly1ceZgybnMi/kjtSm8FGdi6mIIaikc=
X-Received: by 2002:a05:693c:408d:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-36a1ff8477fmr2101995eec.2.1793156008535;
        Tue, 27 Oct 2026 19:53:28 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:28 -0700 (PDT)
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
Subject: [PATCH v6 02/14] ALSA: virtio: Recover PCM state after a failed start
Date: Wed, 28 Oct 2026 11:53:05 +0900
Message-ID: <20261028025317.92450-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

Capture trigger queues I/O messages before PCM_START. If the START
message cannot be allocated or sent, transfers may remain queued, and
ALSA does not invoke the action undo callback for the failed trigger.

Mark the stream stopped and disable transfers for every failed START
path. Arm runtime->stop_operating so sync_stop releases pending I/O and
prevents prepare, hw_params, or START retries until release succeeds.

The stopped flag is shared with ACK callbacks that can run without the
ALSA stream lock. Protect every stopped access with vss->lock. Read the
pending message count under the same lock in open and hw_params. In
sync_stop, decide whether RELEASE is needed and mark the stream stopped
in one locked transition; leave it stopped when release or draining fails.

Always cancel elapsed-period work in sync_stop, even when no RELEASE
is needed.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Changes in v3:
- Protect all stopped accesses with vss->lock. Keep the RELEASE
  decision and stopped transition in the same critical section.

 sound/virtio/virtio_pcm.h     |  4 +-
 sound/virtio/virtio_pcm_ops.c | 81 +++++++++++++++++++++++++++++------
 2 files changed, 69 insertions(+), 16 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 8837dfc12828..8048b14e6c80 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -26,13 +26,13 @@ struct virtio_pcm_msg;
  * @hw: Kernel ALSA substream hardware descriptor.
  * @elapsed_period: Kernel work to handle the elapsed period state.
  * @lock: Spinlock that protects fields shared by interrupt handlers and
- *        substream operators.
+ *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
- *           side.
+ *           side; protected by @lock.
  * @suspended: True if the substream is suspended and must be reconfigured on
  *             the device side at resume.
  * @msgs: Allocated I/O messages.
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index a40ea394bf17..970499fe419b 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -96,6 +96,15 @@ static const struct virtsnd_a2v_rate g_a2v_rate_map[] = {
 
 static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream);
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+}
+
 /**
  * virtsnd_pcm_open() - Open the PCM substream.
  * @substream: Kernel ALSA substream.
@@ -115,7 +124,8 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -217,13 +227,25 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int msg_count;
+	bool stopped;
 	int rc;
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		msg_count = vss->msg_count;
+		stopped = vss->stopped;
+	}
+	if (msg_count) {
 		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
 			vss->sid);
 		return -EBADFD;
 	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	rc = virtsnd_pcm_dev_set_params(vss, params_buffer_bytes(hw_params),
 					params_period_bytes(hw_params),
@@ -273,6 +295,16 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -338,31 +370,40 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		scoped_guard(spinlock_irqsave, &queue->lock) {
 			guard(spinlock)(&vss->lock);
+			if (vss->stopped) {
+				substream->runtime->stop_operating = true;
+				return -EBADFD;
+			}
 			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
 				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
-			if (rc)
+			if (rc) {
+				vss->stopped = true;
+				substream->runtime->stop_operating = true;
 				return rc;
+			}
 			vss->xfer_enabled = true;
 		}
 
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
 						GFP_KERNEL);
 		if (!msg) {
-			guard(spinlock_irqsave)(&vss->lock);
-			vss->xfer_enabled = false;
-
+			virtsnd_pcm_start_failed(vss);
 			return -ENOMEM;
 		}
 
-		return virtsnd_ctl_msg_send_sync(snd, msg);
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc)
+			virtsnd_pcm_start_failed(vss);
+
+		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		vss->stopped = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
+			if (command != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				vss->stopped = true;
 			vss->xfer_enabled = false;
 		}
 
@@ -393,21 +434,31 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->stopped || vss->msg_count;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
-
-	if (!vss->stopped)
+	if (!need_release)
 		return 0;
 
 	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
 					GFP_KERNEL);
-	if (!msg)
+	if (!msg) {
+		substream->runtime->stop_operating = true;
 		return -ENOMEM;
+	}
 
 	rc = virtsnd_ctl_msg_send_sync(snd, msg);
-	if (rc)
+	if (rc) {
+		substream->runtime->stop_operating = true;
 		return rc;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -421,11 +472,13 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
 
-	vss->stopped = false;
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = false;
 
 	return 0;
 }
-- 
2.54.0 (Apple Git-157)

