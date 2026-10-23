Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766613;
	b=wbD3PHu8bB/NrYFdxKOs0qeJOKfMpJE0lkjEwTMreyEqxLGQnow2GVtDf+pzZpFo/Wz+
	 A/IH3nhVlSbjhxy8CP1D2n7juA81kHR1bV4o4qYtY8o/1cCHIlK7skm3odhBsq1facoyb
	 APaSuFIJG3bpNrdm+nNzReMgLJafX7zOL1JeLDCYAhOC21hjCHCMVYTM1twOf7hYwFplD
	 DslwO9iBg6jKjNLIkTrKwMZ/bFmuOUE7g/zXo1kasXDenzPtTGrqL0B1x6UEdQxi0Jpn7
	 M2smj/osWMFAbydfqRDzm0x2uFA27Uwrk7NOQvEkghpr1ZiiNk9cTaOq7IOt9S1GM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766613;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RwwPunpq+kPgJxZIDu9at6+yilTDRAPfDCSCRn3X7f0=;
	b=wpIja2tiGiV+HUAjeZsYeOIHGy1FUiwrPc5woEs6o3qAj2Z8jH7Bw7rQS3gB9AvMjibv
	 3DrTOJeeq/yeZXtxpDD5zebb4zv5DSJfOmDlNpFM4MP+vwAK9cduibdeZThEPmGD7fWTk
	 ZC2ygWRxefUwQkQuR1cdBAd+6EllgfSgaVom6Ba+ynBxVOtSphDcqkXwaATCNRf8ThVgS
	 hQfcuLJ/XIpktqIZtsoCHsC1O8ORxk/+M/F5jCNdFNxSQgTg78Uu127j3vAQ1+8o3TaM8
	 0134IOHtrkyR1AE02blUj73LzqM7D+CUPBzd4Cyr7u0EYhfM8btmKCYJD3n1Ccndblw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.com;
	spf=pass smtp.mailfrom=yandex.com;
	dkim=pass header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=MBwnqBx1;
	arc=none smtp.remote-ip=51.250.60.164
Received: from forward104d.mail.yandex.net (forward104d.mail.yandex.net [51.250.60.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC9606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13AC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=MBwnqBx1
Received: from mail-nwsmtp-smtp-production-main-88.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-88.yp-c.yandex.net)
	by forward104d.mail.yandex.net (postfix) with ESMTPS id E8F9AC00F6;
	Fri, 23 Oct 2026 17:43:21 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88 with ESMTPSA id AheAQZCdmOs0-mjGP4gYK;
	Fri, 23 Oct 2026 17:43:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1792766601; bh=RwwPunpq+kPgJxZIDu9at6+yilTDRAPfDCSCRn3X7f0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=MBwnqBx1ODxFZVwPyJuBR1by/itNGTFRjxTEWi08jig63QF+ueGJWDkJTMXW8deNC
	 ZqtsafHGYPonyjANWefMw4AckyaY6Lmlg4rZTHS6vnCojwSphtfNyrZ8J2Ak26T+lR
	 GLt8bOJCV3mg/BQwj38LB6p2HF+Y7N/tYY2UP3rg=
Authentication-Results: mail-nwsmtp-smtp-production-main-88; dkim=pass header.i=@yandex.com
From: Alex <xnderv@yandex.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	xnderv@yandex.com
Subject: [PATCH] drm/nouveau: idle the channel before destroying an engine object via abi16
Date: Fri, 23 Oct 2026 17:42:19 +0300
Message-ID: <20261023144219.46478-1-xnderv@yandex.com>
X-Mailer: git-send-email 2.53.0
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

Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org

nouveau_abi16_ioctl_del() destroys an engine object (ENGOBJ) created by
nouveau_abi16_ioctl_new() without waiting for the owning channel to go
idle.  The legacy path, nouveau_abi16_ioctl_gpuobj_free(), does call
nouveau_channel_idle() first ("synchronize with the user channel and
destroy the gpu object"), the new ioctl does not.

Chromium-based applications (Chrome, Yandex Browser, Electron apps)
create and immediately delete probe 3D objects at startup.  If the GPU
is busy with other work at that moment (compositor animation while the
app is launched from the GNOME dash, cursor movement), the engine
context is unbound while the channel still references it, and the GPU
faults:

  nouveau 0000:01:00.0: fifo: fault 00 [VIRT_READ] at 0000000000000000
    engine 00 [GR] client 0f [HUB/CTXCTL] reason 00 [PDE] on channel 5
  nouveau 0000:01:00.0: fifo: ... PAGE_NOT_PRESENT ... channel 5 killed!

after which the desktop freezes.  Observed on GF114 (GeForce GTX 560 Ti)
with Linux 7.0.x, reproducible almost every time by launching a Chromium
app from the dash; not seen in 10 consecutive launches with this patch.

Remember the channel an engine object was created on, drop the reference
when the channel is destroyed first, and idle the channel before
nvif_object_dtor() like the gpuobj_free path does.

Signed-off-by: Alex <xnderv@yandex.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -89,6 +89,7 @@
 		ENGOBJ,
 	} type;
 	u64 object;
+	struct nouveau_abi16_chan *chan;
 
 	struct nvif_object engobj;
 
@@ -173,6 +174,13 @@
 			struct nouveau_abi16_chan *chan)
 {
 	struct nouveau_abi16_ntfy *ntfy, *temp;
+	struct nouveau_abi16_obj *obj;
+
+	/* Forget references to this channel held by engine objects. */
+	list_for_each_entry(obj, &abi16->objects, head) {
+		if (obj->chan == chan)
+			obj->chan = NULL;
+	}
 
 	/* Cancel all jobs from the entity's queue. */
 	if (chan->sched)
@@ -749,8 +757,16 @@
 
 	obj = nouveau_abi16_obj_find(abi16, ioctl->object);
 	if (obj) {
-		if (obj->type == ENGOBJ)
+		if (obj->type == ENGOBJ) {
+			/* Synchronize with the user channel before destroying the
+			 * engine object, as the legacy GPUOBJ_FREE path does.  The
+			 * channel may still have work queued that needs the engine
+			 * context which is about to be unbound.
+			 */
+			if (obj->chan && obj->chan->chan)
+				nouveau_channel_idle(obj->chan->chan);
 			nvif_object_dtor(&obj->engobj);
+		}
 		nouveau_abi16_obj_del(obj);
 	}
 
@@ -791,6 +807,7 @@
 	obj = nouveau_abi16_obj_new(abi16, ENGOBJ, args->object);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
+	obj->chan = chan;
 
 	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", args->handle, args->oclass,
 			       NULL, 0, &obj->engobj);
