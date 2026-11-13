Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567900;
	b=w5yu1e0loepDSDi5QvHM7zsOKyHoSdCV/S0pCky0GHSl1g6MF2jt05cw/zW3KWShUfXz
	 DOv/EJO+BRig5+xDT+g3v3Mh2cd1Czb/ME23YDRwJkRv0jrI9gxjxrb/PeB0HKuoXOdhs
	 QKs0AGoAFMlO3YK6O15Et3X+DVjE7eb3HvgZ3QtgziRWpDmz77hlaodmhJ6gpqncgS2Ti
	 p98Kmi03/QGdNr08dOqrJkjyG7BtE2Hs1PkDXynWtOvmsTBtOce4y9tFkW1ANW3z/HLCx
	 nXv6zYLVqg0FVkxgL6U9wAiK8T+CPXMC3VqXOBYOs/f6XbqZYM+sEMPheFCevl3SUtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kAtCiR0ZuKR2R9RouzclbymoG8didRg2rOJs+0NjmQg=;
	b=2T8sgonfEZ0NLMehXzB1P8hz25HpwdAEDznqsP4F952+qYglR66nAY/VcB8fmioPsyKH
	 jwRC+88DtkLlGsDS9tstzmFqnAg0Lztc7T+3FGeczR7Xp5/syo8djuf2hcH852NpLcmd5
	 kJ825dvWSkpIR1W6ncAlUeZUvgKjcZbjJzlU1TVjAtdG3e3BnoyFP6tUN+HQKcRJWkeu0
	 0zuT8cj7QNUV70SG97Y4w2BqBhLqfe54gBuuX5BB12jbd8PECp+inFJUb4CV8KBvYOapE
	 YIveJQK/6vlGxwzCVoMc4sr0APxn7r/O7NTbgOYLvW23CpdK9apmHef+KxM4xI60g2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxAi4yMD;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BD606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9BD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxAi4yMD
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed1414df17so5923645ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567898; x=1795172698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAtCiR0ZuKR2R9RouzclbymoG8didRg2rOJs+0NjmQg=;
        b=qxAi4yMDoGkIQPY1NoRL/5crFrECSYUzazs3YEJBhVFjwdzd2zTJE6qXin5jCIWUxd
         kGjY71s18FcTsDnmtdKUCdgmf+qc9xUPOfXNReHdx5wytcfYoi36SzOdfvLMC0La7obJ
         ad2S315tQe2zNpmdi6v5He14nqGmG3tokxly68EpNvezE7aCzjXMUzJhRbuga1UEDQx3
         wYkuwpEJyi7QTEwjlH4hrTXn4E5xXok8iY0clBFZFdrzCuYhRWe1aH30gk+G9NlA7CDu
         dkUQIWSRCVzgF5EfS4KoqkSdvgKcXRXWS6cPqW8wTn9R0C3ZtxxucqbRDbtaieRRibqE
         2eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567898; x=1795172698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAtCiR0ZuKR2R9RouzclbymoG8didRg2rOJs+0NjmQg=;
        b=oRIOhg1G4VBqiv/Hf+Mkgj3DRwqbp6WYUoH9YcFJvxLZmQYe+mAFA84ZUw0sq/LWZv
         s8jZ+HZUre0DvV1sT9QEv0zRRq5rk6v3AJiOWI67VVIxw+n6RTPp9KolafsKwTSsVPBz
         LgXTrIMHeTVapYRPci1PRKNd3cDmwikZ90hVowyY4geA1E5Zu3sZ8+WTSUfWVc5e2vx1
         trsrSZ4MBge/GrmHVFwohkEl8GcZ2vYmj4VgEKSdtXwQBu85XtvIgyZ7n/qaakvzurJa
         aO0pP2XG9iGtcUHOtoU/xjf+igbNp8jOL+K7FQxycMBVtLkvm/8WhYzAKt8aQXpYCnbs
         0ATA==
X-Gm-Message-State: APuU4Z8sygC0mnjI/IQ5UHRLzDQzUdQDkTBFWGxoMx9rb2U+YJ/tzB99
	klTXMK83x3JIW0pd/emRyCLfwjhl46/MiMO5UUx2QK6L5jl7xOhNPeXf
X-Gm-Gg: AYBFou0AbhFVTG9LJtuSKBWFtmsM3A7xFoe4ICnAoOMiJD4BHBg22I/4bxEEAgwVaXj
	BHFmHbLJ1CjtnqcrKzwkz7QGWOJt4AhIbfJ9Q3XTA7C6CUFJy2KEuq1QwHN1jCPpbkLcSgmtreY
	Tdgcva/STOL8iaYzhVYLp1O7IUetZziJU5YwI42KNrgR5Pi0M37zu3KGaXvOZxBpHtDlMo+Vgri
	TD+/nbW1z8hE6vdhtvrcVD2E1jIlIZkg5hdvXJZyibavO04cW+ZdLyM0N8KJGRx8k999Z+wH6+y
	r9kPWDg4N4vmGyanzqQucuYRIvZb51QIpyAU94qnIC+B13RIwxrwt4++VcDmvQsJ5Wd793Z19zM
	oTtEMi6htdTQtwHwvDweskpadUQuKLtgbUC6JeHy2mIbwYWVcGMCn/53SCkf6ciWbF1DwZshmZU
	B85m1DpXmc6vd/IPN/HG7YZxF0fYJQxTc/0cXyZR4X5VWolINJbzOz96vLDM09QIwblgc1hbKmw
	+SNI9u5s7Y1GmIT+X48Rn3xZC6ajdbDgDUQJPCf5Njky/LjxHtuNceZyE7elDQYz44SjRbVs2v8
	9gqeSk+q3AT0OFh6lj4mhTbljdP2os0tz6MnwHCakb3BbotaWpym
X-Received: by 2002:a05:701b:2402:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b503193011mr2018955c88.46.1794567898410;
        Fri, 13 Nov 2026 03:04:58 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm6856653eec.0.2026.11.13.03.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:04:58 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Fri, 13 Nov 2026 11:04:27 +0000
Message-ID: <20261113110427.4256-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113104518.3951-1-sreekuttan2156239@gmail.com>
References: <20261113104518.3951-1-sreekuttan2156239@gmail.com>
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

The task creation path allocates resources and installs file descriptors
before copying the task information back to userspace.

If copy_to_user() fails, the function returns -EFAULT without releasing
the allocated task, DMA-BUF references, or file descriptors. This
leaves the task registered and leaks resources.

Delay fd_install() until copy_to_user() succeeds. If the copy fails,
release the reserved file descriptors and their DMA-BUF references,
then free the task using snd_compr_task_free_one().

This ensures that task resources are properly released when copying
task information to userspace fails.

Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/core/compress_offload.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 5e5e0f78f26d..432717d5d433 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1124,6 +1124,9 @@ static void snd_compr_task_free(struct snd_compr_task_runtime *task)
 	kfree(task);
 }
 
+static void snd_compr_task_free_one(struct snd_compr_stream *stream,
+				    struct snd_compr_task_runtime *task);
+
 static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
 {
 	u64 seqno = ++stream->runtime->task_seqno;
@@ -1132,7 +1135,9 @@ static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
 	return seqno;
 }
 
-static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_task *utask)
+static int snd_compr_task_new(struct snd_compr_stream *stream,
+			      struct snd_compr_task *utask,
+			      struct snd_compr_task_runtime **runtime_task)
 {
 	struct snd_compr_task_runtime *task;
 	int retval, fd_i, fd_o;
@@ -1169,12 +1174,11 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 	/* keep dmabuf reference until freed with task free ioctl */
 	get_dma_buf(task->input);
 	get_dma_buf(task->output);
-	fd_install(fd_i, task->input->file);
-	fd_install(fd_o, task->output->file);
 	utask->input_fd = fd_i;
 	utask->output_fd = fd_o;
 	list_add_tail(&task->list, &stream->runtime->tasks);
 	stream->runtime->total_tasks++;
+	*runtime_task = task;
 	return 0;
 free_driver_task:
 	stream->ops->task_free(stream, task);
@@ -1185,6 +1189,7 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 
 static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long arg)
 {
+	struct snd_compr_task_runtime *runtime_task;
 	int retval;
 
 	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
@@ -1194,11 +1199,24 @@ static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long
 		memdup_user((void __user *)arg, sizeof(*task));
 	if (IS_ERR(task))
 		return PTR_ERR(task);
-	retval = snd_compr_task_new(stream, task);
-	if (retval >= 0)
-		if (copy_to_user((void __user *)arg, task, sizeof(*task)))
-			retval = -EFAULT;
-	return retval;
+	retval = snd_compr_task_new(stream, task, &runtime_task);
+	if (retval < 0)
+		return retval;
+
+	if (copy_to_user((void __user *)arg, task, sizeof(*task))) {
+		put_unused_fd(task->input_fd);
+		put_unused_fd(task->output_fd);
+
+		dma_buf_put(runtime_task->input);
+		dma_buf_put(runtime_task->output);
+		snd_compr_task_free_one(stream, runtime_task);
+		return -EFAULT;
+	}
+
+	fd_install(task->input_fd, runtime_task->input->file);
+	fd_install(task->output_fd, runtime_task->output->file);
+
+	return 0;
 }
 
 static int snd_compr_task_start_prepare(struct snd_compr_task_runtime *task,
-- 
2.55.0

