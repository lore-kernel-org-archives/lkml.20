Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792828976;
	b=nWXf6sl5m1EQWM5LUvZbgBuhweQ5cPYjAStr82sQP/dNNGcuYLp8vJfylHrVjWqj3vuz
	 nY//zQ/CeT0D7O5W7S8L4Aauff+lQNxiA8AOV3+4qWUkJzMqMOSPH4E7+czGStLC1j0Qm
	 KACwNcQVTl8XhQ7MBRnm798RARfiSvxw88bECL6vRE2HMzmuxQcoiO6cKlFCke9uONvsV
	 QULzhiMcLeR/LNbsOtGIWgYUPvEHWpXHQKLSzfPoD1eULRPkKA7ya4bR6SDe2xFUAEL4x
	 Z/Rd4NOjfL5G9pLtCy19dYA0L/IMgH8/vOy4CGV/abjt+HD2+cXemPQD1EoLi2GPGYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792828976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iGPDflQ29hN9DpB+AG4dwXiSXq5WMrVXLrMlXqVt1zc=;
	b=wQ5Dcl7IuoLfcrc0Iduglhax5VE4TOqZnihSAOEEiYrXmLGO+UW1ORHZF3lmJMcubuE3
	 M9WJXV9LcLXPkLYjFcA+GS8vXeyaUDoytguELPkgOQjEEC0xik5CO3w22a1Ub5M0nsjdv
	 l2wM3Sm4cwZRNSWSRxSkGJiXhP04cl3O0TKmVOBjRP7hTcDaadd7NLfmqxo5SLpCA4lrG
	 Tgd5+BpoKFojDOZKjwi2s3syj3qbyxJvkQcV3xh54/tdyRrgyy6eFroNqaZevDn99Xu7E
	 YUISq1U4rdl/pOidjlHhzPo/9BCIoIQTsu8D4j8HSpGHOUJiu0L/afLj2Spjq4lAbhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJcyHknf;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA84606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA84606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJcyHknf
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso8416985ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792828975; x=1793433775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGPDflQ29hN9DpB+AG4dwXiSXq5WMrVXLrMlXqVt1zc=;
        b=WJcyHknfVxtwONWz0C2eZIcqfVroXMvC5ZmqUQ4wnUCtttz8GHXhbn16B+vMjIDnkR
         0N2lUydC0u3M67u0awYw6MuUBDHgrr/t513A6e84/44JBog+KHJd1gwmmMY4UGIT26Ex
         AYKGH7VBkjPA2sy4xrdnr7NFuBfZsSh124xGBsTP7lKsnfCT7uLmS9asoCZ6+AcnuOLv
         MQBRAnmGWC2ZLpVIUrBWcv+mwg+IdqXr+4av8FRb8vV5zuoeV4qSjSyoK25y42IGLrvS
         CnARgun4G8TTPude5TisYyv+3erRhi2xrAxC+6y/y+rilTqnEqUH2CTUN8kU9kc4DRu8
         32ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792828975; x=1793433775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGPDflQ29hN9DpB+AG4dwXiSXq5WMrVXLrMlXqVt1zc=;
        b=FZKBo7IXJ7O8zFS7YxZeh0+bN/dPym5xbPgHGcnDz7uqBhiU/UfWh/e9pFJeaEVoCw
         TcnBxqZQB66DeXjjLDZCuGJMUEG47x1j6VHfXdI89FT9nd0cG3meC5+G2IM/pKJL2Pgl
         D8VozRV1aiE7NasroRbA2HPDCEqUfqonuTCNdpWYtM5Ge34VG56/c/ImMAIuxAxzQ5ux
         ME9Zi5qNWeAVCcrJMafJ4UxIwZSQXIwoEP16zVypTn0C7dY8oLHLYnwR47lcxsYSHk0T
         uF5KwVo32hyaJD6CZaqg4mXWTOBVhe1K2xpau6vorF6h9KYDXAZCm0a8gJHPLsU5kKS2
         YcmQ==
X-Forwarded-Encrypted: i=1; AKwUvBywI5fh4+6wrLqPBT1AgOkCVM+GlFrutsrJgzWca4r3xpFTujwaJwVlIfmUguVevh6gIJqtcZNKxY+25Mg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7wcx//qwiZbp/+aJWDtVoJ+8y0dK2Ox9c/vcEOVXnVdiFtJAS
	F7vFlAT9ibdy1fNcmMySkcoozN+0Tj7947206IlrJNv4xHtOK9kPXv1g/YS+TmuTnZBOhw==
X-Gm-Gg: AYBFou36/j+cj7JrO150XLUJ3zi1KyMi9N2M1CPuhWpu/m6NxhRW+P8rktET/LF9p2v
	IiUH9VTFQPdATyfDQ0g0SzpMadwx1ofnmaMvuFLd2CrFmg/bLzLkUsLnFeCzOI1R9xBwFdu/RwN
	FdTvSBqaT1CRVouA60Bi0kgT8nXq6zKElxjQiQ9wJrCorkn+f8VltsPFcZlmo6Mspe8/sHPVZ4p
	9HZk792XzikRJwJmR9RFdfPDqqcIOZHiJ0YHAsaV5ikmzoXpURqlKVUq/NkTMtmoLWxNDZTy6BK
	doTSjxXlc4rc1ZBc/LMTs+zMzI3GNnEoRrEZUOqZnoz025kCfBYChQYv+pnFmEOFN7fGvKIkWBw
	Frj1+OqvoacsjZ3f+AA/paa9jXD+y/nXdSSPF8eycS3bNiK5ajBJt95NhDO01UJCbPGYSy98ObW
	XrYJPxwx15bhhNDqlI3vxRXDxb99U9BW8rwNe1brzHGswechx7ZmwMXdhQdMXcP8B9g1x/PU8OL
	AtiJskvehGy4QAeMxNPynX4PDi85K9dCnM5zg0sjQxb3THhVp1D+/nWvxUhTkcVCXjThv15
X-Received: by 2002:a17:903:1b2c:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2ea9c6c8d4emr11590295ad.16.1792828975089;
        Sat, 24 Oct 2026 01:02:55 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c63sm3814815ad.47.2026.10.24.01.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:02:54 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: ump: Drain sequencer callbacks before freeing their client
Date: Sat, 24 Oct 2026 16:02:47 +0800
Message-Id: <pm-pmb-00625126b81966d1bf1d-v2-915f6bbabe1fd458c3ab@gmail.com>
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

seq_ump_client_free() cancels group_notify_work while the endpoint still
publishes seq_ops and seq_client. A received Function Block update can
enter the sequencer callback after cancellation and queue the work again.
Even disabling the work cannot protect a callback that already loaded
seq_client and then resumes after the client has been freed.

A USB UMP endpoint can continue receiving while its sequencer binding
is removed. The following order uses the same endpoint and client:

  Sequencer binding removal             UMP input completion
  -------------------------             --------------------
  cancel_work_sync()
                                        load seq_ops and seq_client
  delete sequencer client
  clear endpoint binding
  kfree(client)
                                        schedule group_notify_work
                                        read client->seq_client

Cover all calls through seq_ops with SRCU in the UMP core. Withdraw the
operations pointer and wait for those callbacks before canceling work
and deleting the client. No producer can then queue work after the final
cancellation, and both the client and callback code remain available
until the last in-flight callback returns.

Publish seq_ops with release/acquire ordering so the separately stored
seq_client is initialized before any callback uses it. Use SRCU because
sequencer notification delivery can sleep; no callback needs to change
its existing execution context or allocation behavior.

Fixes: 4a16a3af0571 ("ALSA: seq: ump: Handle FB info update")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/ump.h             |  5 +++
 sound/core/seq/seq_ump_client.c |  5 +--
 sound/core/ump.c                | 59 ++++++++++++++++++++++++++++-----
 3 files changed, 59 insertions(+), 10 deletions(-)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 73f97f88e2ed..387143783a9b 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -66,6 +66,7 @@ struct snd_ump_endpoint {
 
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
 	struct snd_seq_device *seq_dev;
+	/* Published after seq_client; calls are covered by UMP core SRCU. */
 	const struct snd_seq_ump_ops *seq_ops;
 	void *seq_client;
 #endif
@@ -126,6 +127,10 @@ int snd_ump_receive_ump_val(struct snd_ump_endpoint *ump, u32 val);
 int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol);
 void snd_ump_update_group_attrs(struct snd_ump_endpoint *ump);
 
+#if IS_ENABLED(CONFIG_SND_SEQUENCER)
+void snd_ump_detach_seq(struct snd_ump_endpoint *ump);
+#endif
+
 /*
  * Some definitions for UMP
  */
diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 4c1e81db376f..ca9dcec19883 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -353,12 +353,12 @@ static int create_ump_endpoint_port(struct seq_ump_client *client)
 /* release the client resources */
 static void seq_ump_client_free(struct seq_ump_client *client)
 {
+	snd_ump_detach_seq(client->ump);
 	cancel_work_sync(&client->group_notify_work);
 
 	if (client->seq_client >= 0)
 		snd_seq_delete_kernel_client(client->seq_client);
 
-	client->ump->seq_ops = NULL;
 	client->ump->seq_client = NULL;
 
 	kfree(client);
@@ -523,7 +523,8 @@ static int snd_seq_ump_probe(struct snd_seq_device *dev)
 	snd_seq_kernel_client_put(cptr);
 
 	ump->seq_client = client;
-	ump->seq_ops = &seq_ump_ops;
+	/* Publish the initialized client before callbacks can observe seq_ops. */
+	smp_store_release(&ump->seq_ops, &seq_ump_ops);
 	return 0;
 
  error:
diff --git a/sound/core/ump.c b/sound/core/ump.c
index f6482a9bfe61..20cae15e76fc 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/export.h>
 #include <linux/mm.h>
+#include <linux/srcu.h>
 #include <sound/core.h>
 #include <sound/rawmidi.h>
 #include <sound/ump.h>
@@ -18,6 +19,31 @@
 #define ump_info(ump, fmt, args...)	dev_info((ump)->core.dev, fmt, ##args)
 #define ump_dbg(ump, fmt, args...)	dev_dbg((ump)->core.dev, fmt, ##args)
 
+#if IS_ENABLED(CONFIG_SND_SEQUENCER)
+DEFINE_STATIC_SRCU(ump_seq_srcu);
+
+static const struct snd_seq_ump_ops *seq_ops_load(struct snd_ump_endpoint *ump)
+{
+	/* Pair with publication after seq_client has been initialized. */
+	return smp_load_acquire(&ump->seq_ops);
+}
+
+/**
+ * snd_ump_detach_seq - stop callbacks to a sequencer binding
+ * @ump: UMP endpoint
+ *
+ * Withdraw the binding and wait for all callbacks already in progress.
+ * The caller can then drain binding work and free the sequencer client.
+ * Must not be called from one of the binding callbacks.
+ */
+void snd_ump_detach_seq(struct snd_ump_endpoint *ump)
+{
+	WRITE_ONCE(ump->seq_ops, NULL);
+	synchronize_srcu(&ump_seq_srcu);
+}
+EXPORT_SYMBOL_GPL(snd_ump_detach_seq);
+#endif
+
 static int snd_ump_dev_register(struct snd_rawmidi *rmidi);
 static int snd_ump_dev_unregister(struct snd_rawmidi *rmidi);
 static long snd_ump_ioctl(struct snd_rawmidi *rmidi, unsigned int cmd,
@@ -348,8 +374,13 @@ int snd_ump_receive(struct snd_ump_endpoint *ump, const u32 *buffer, int count)
 			continue;
 		ump_handle_stream_msg(ump, ump->input_buf, n);
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
-		if (ump->seq_ops)
-			ump->seq_ops->input_receive(ump, ump->input_buf, n);
+		scoped_guard(srcu, &ump_seq_srcu) {
+			const struct snd_seq_ump_ops *ops;
+
+			ops = seq_ops_load(ump);
+			if (ops)
+				ops->input_receive(ump, ump->input_buf, n);
+		}
 #endif
 		process_legacy_input(ump, ump->input_buf, n);
 	}
@@ -699,8 +730,12 @@ static void choose_default_protocol(struct snd_ump_endpoint *ump)
 static void seq_notify_ep_change(struct snd_ump_endpoint *ump)
 {
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
-	if (ump->parsed && ump->seq_ops && ump->seq_ops->notify_ep_change)
-		ump->seq_ops->notify_ep_change(ump);
+	const struct snd_seq_ump_ops *ops;
+
+	guard(srcu)(&ump_seq_srcu);
+	ops = seq_ops_load(ump);
+	if (ump->parsed && ops && ops->notify_ep_change)
+		ops->notify_ep_change(ump);
 #endif
 }
 
@@ -797,8 +832,12 @@ static int ump_handle_product_id_msg(struct snd_ump_endpoint *ump,
 static void seq_notify_protocol(struct snd_ump_endpoint *ump)
 {
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
-	if (ump->seq_ops && ump->seq_ops->switch_protocol)
-		ump->seq_ops->switch_protocol(ump);
+	const struct snd_seq_ump_ops *ops;
+
+	guard(srcu)(&ump_seq_srcu);
+	ops = seq_ops_load(ump);
+	if (ops && ops->switch_protocol)
+		ops->switch_protocol(ump);
 #endif /* CONFIG_SND_SEQUENCER */
 }
 
@@ -893,8 +932,12 @@ static void seq_notify_fb_change(struct snd_ump_endpoint *ump,
 				 struct snd_ump_block *fb)
 {
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
-	if (ump->seq_ops && ump->seq_ops->notify_fb_change)
-		ump->seq_ops->notify_fb_change(ump, fb);
+	const struct snd_seq_ump_ops *ops;
+
+	guard(srcu)(&ump_seq_srcu);
+	ops = seq_ops_load(ump);
+	if (ops && ops->notify_fb_change)
+		ops->notify_fb_change(ump, fb);
 #endif
 }
 
-- 
2.43.0

