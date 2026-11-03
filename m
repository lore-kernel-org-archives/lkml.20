Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693336;
	b=te6E+pXTP7eGAhsLDp+aYHNZ673sAtiUqaPfEknwwRjlcdhapbcpLXtY+sg5RrpqchdO
	 yTuCqhVlK01ZKHZJg8C/9/kNnbnOBGirDbZNHBSqjDJ3A4RMyA2PhvYkBNSQntpR5N2X0
	 IDh39LtEaOsSD+t6JZp6fqf8Zi1UQgXmhrFxmmnUuaZy1QX70L7iY6b3oS144HZzvQU4p
	 7bAApzPkbzy2TVJ141adcW2q4cgsoL5vxj4sbYvvaxp1mHGBfD9gDSUg+s5gLo5EhA6LS
	 5zTzc46YIXQTu1flVxezciNnFT98gYa2TOdAPl6cXxe3aOy9QrHEIjIREBbHqbS7ZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
	b=sTWnz6R2fIB3uAMytr4jkaKPyq5i1WPQvaReWBZA8zLhZPNTfxGcT0kyGsFMRiotpKna
	 oFtaWB5hXBixTL1rBipjeUeHIDmCpTxQ7+bVz1/PjgmPsTl62o3Kkc1gVzHpBFYWIpX4Y
	 RkEBkWSNyd+1mENpqzzRYwL+EawjU9vFnTV358TJQMjqDsKIEy13WkELUA9glZUT3EaHc
	 oHjPi1hSrgizJ4PjKufpPnyFJFPf4U1C9n7E6eroQM5IM0rekuQ0SBdtRCrC+GC8j8HhE
	 FryyAld29bgpU5RoJyWGc7Z+X3PyQjZBbMUcxeucPfxcWq24GWr6ii2050L0jHWGigQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tX2oUrlf;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4D606D82D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C4D606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tX2oUrlf
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so512898eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693334; x=1794298134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
        b=tX2oUrlfxCV8QeTfT3iFk7m4ZNqzuUqxh98YNYbb9RSBJOBoFK9Ssmtc+isC1v0oWI
         l/PX80ngqmAGgMHbUhtNqyIjrioj64XjdJPSrFRd3rU85W9X2ATKucFSbBFlfHrPhOB5
         fX8n/sdGIfmpVAxnYXamb/XRijIHmmTs9LPwgFa6tRx/uxwV+EfafQ4LvabU00mDtIr4
         FiRu3QJXucLnAtnkmMe/DtC5s54fU2JfsZ0JzstXUWIIskxdHJUMZbRAucNtOTfT8dBt
         wfdjYymBSa4XfZKkJIoQyEq61FxlF4K8F+zcdGpwUZzVcaC40FserKAr8Lox1G2F+zMJ
         FdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693334; x=1794298134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
        b=gxgXjSR/xvuNAViDbTKFykMbY9PU+/bF5LsCVOo9yRZz/EAlFj8KurweGDFHYbR5gl
         u0fm7KX9WxeEGjA1CCseTXebGPvfmZReeMsGZiVZnVObGrMOmHxQFwKxzXkhf6tewG8C
         swF5IUE8A/SAZhCo2FiXYRy1ybJ6051oXmwUSx/sM9IRtL5L+42GwE8Zppvd1J3VskqW
         jC97OoC8hqS2Qt/ekSIhJhKrGx//C59Hp2EN4KoXtVzyNe1RWUsHnxiKUzE+gND+qcyq
         qFbSN5B8GujqlhJRC8a1WxDgxzu36BrOwzXdMXM0RQ4Ane23ptUkEo9MUqZxVWHm+Hb0
         MlzA==
X-Forwarded-Encrypted: i=1; AKwUvBxjo38V94x40CgLOsj5ldiPs8veA3eauTxD6SFY4fbyst8lhOwCh0yzrvjLyiVlG0yeUGZoWOohbCBtJ0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J6picsHLrot5sj8ledRG3UbXhAmKg6gWwksQXstbaP1EJgRhj
	ru08x3HRLLypzB2pRFsIYKBvbOwDx0817PxcdWMJmsh4s50GwpPNHeWl
X-Gm-Gg: AYBFou3xkW2Z8iwndK2JkfEa3+jzSXBLLtQTwcB0+aqx9874tJkjd0ug/L8UbfzCer0
	xXrggYfX2jWSlc67w7vAtTLgJHYpRFe3qbKvRKFmtds1Z6rwYs2ko8kIzonVYj8HQNaDmZPgevE
	Nx3bUXqB7T7qW9nmzlUfnHBQWnHFZnvILs1jSf1qlCnhTS9PxZ6cff6K4ZYyeLqkKxm+lu8Sfup
	zepHmC7CgxdXesTdKaDnHGY6Q4N1ZUIh82sLYcK5bD3rijIh0hvX9/r4qU58hiuIxtRmuB+MZqC
	1mhVpLBtAQsU1ra8qmEk1oq4Z4ZPRh4tcm6BK1fdF62MDtaLh5FMzXIAIAS59+ROW1kbl9DIyOe
	bYNzumPfH7vgGLXIYtxQQUQAuxFxNw7P4MVxafd5GtdV9A4O9xDPR06S8VBcPatKzjbqT41iOxV
	vAmeNbEabJIZMsDmStD7TvPtHjQwNO6k7Kn5xl+lCGLfmXohoQbZV4uZ778EnrCYpNDWtjaeIjP
	XdQR9LbMh3ha+LE7o5HBw6od3UuttYeHLPRjZ9265wuk9kFehhBBfwfkKK+gHH/pYQY4d5jvasx
	jvrae45wG5WFfrlcEIG3Clf1Ot77HgAd6bOT9MvjBgZ/KoELcFuIDGBV9l3SB5kd3sLoQ4GNP1L
	j4gtQAkXbtw+ftpRWVi6e2xHw0+nqIID7N+tgyJEZjtSooMk=
X-Received: by 2002:a05:7300:fe87:b0:36b:c4a0:47b8 with SMTP id 5a478bee46e88-36bc4a04a45mr1387296eec.11.1793693334448;
        Tue, 03 Nov 2026 00:08:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:53 -0800 (PST)
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
Subject: [PATCH v13 08/12] ALSA: pcm: report partial progress under the stream lock
Date: Tue,  3 Nov 2026 17:08:17 +0900
Message-ID: <20261103080821.16983-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring wrap
when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM timer.
The driver must release its pointer and trigger locks before calling it.
Existing period notification callers keep their current behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames and
reported four available frames after delayed partial progress without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
