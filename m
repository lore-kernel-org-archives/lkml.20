Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982747;
	b=j0fGnU3huake71+RSkDmAQA/5kh7ObJzc64pbfi8en7LMRf1fVZShmZJZYbQwmFRbStz
	 as86yb8lpzeYvjbfg9JlCPB5IQDbVcRnDXBgC6HWNHhrC982zCQ62MfrrZL+BeD+TdwVs
	 qS8eAaJHXITZJ3dbxgCrxUyJvVSwfQdnEvUYB8ladTioBEOTbLcSNQQOCcmztV4VyYNgq
	 hrTrlT2s0tuJ63iuZ2uz2FXn+Bot9XD4sodcrNHyOvXXEm+0E0hegtNkfxt6mvc7SsHjf
	 JAuDFUJERWttyPdhYxB58F1LcolixyKUaTMjNP2d6erOofwBpEwnZy72x7NdpSchL3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWFJz4Q8qG2Ws8Hqzbngo5MJbP2uCsetJ4sQG1p1VLc=;
	b=nhqmQ//RE7V2wfYAV28PbSupLSDoYtmkUKs10PJhz9firLWG5t6yBCmGuIDVk7boLx1V
	 A1Sy5ow0uzX0qJIS35pDgnPd9klSvEtvseElwJ4VBsehNC9yUsQwv7erJKO4E5TVFbeRZ
	 8qJ3NDQBV8JeRLPwV5FliTkDU7JWoHgVGLT1NzXPc6P3PTC8gXtKXUhs1moFwKoJNAzBd
	 q6ZbQU9+QAzgOC00EkkSGZRmg32O3bPDxcoL7wa81c5dvo4FobAjLASNPEGWAjF5oipie
	 svMiBN9AokRf+qFNl6q6tajU1TE//WLD1KMz5wdAY+rdkOOb0WmwOspMbweoQcBXA+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh9669dd;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B2606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934B2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh9669dd
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8253bc5a613so518513a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982746; x=1794587546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWFJz4Q8qG2Ws8Hqzbngo5MJbP2uCsetJ4sQG1p1VLc=;
        b=Lh9669ddVbNQ1uvfRlAKudMMS/D6pZJyImP5ALZfde2MZ7l5VVl9ZHAcE/dlLN+QBU
         kDKXwPrS0/Zm8pwlbofo18KovbucASAuSZPe8h82wEilP9MlspWxRyWsCZYl34jJlubM
         yMOq4WpKHrzjTssKPHTXtcKSJLReL6bRwYLJXRoL1CEC2QybZETKVTkFau1WfMS/9WDj
         T0w9on9KItSHFfZkxoMSnxxd7Opwcjl3rE1cYxtiSXBQwH1io2Q1INKNHY4jg7hMHZnS
         h6a98jbAswD3vxWb4GvR5n5r1VwKhreUSpgFotR/4zs+DzIu6O0GSvIjtPy75g6/rnTQ
         IBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982746; x=1794587546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWFJz4Q8qG2Ws8Hqzbngo5MJbP2uCsetJ4sQG1p1VLc=;
        b=kzPZNB9RNsxWqB7ZqFBPVSeTmbtguNwubrUKmGpESWvsgc0rAE4R12O4VTnz9W5vu2
         5VfO4XgBaTcXdnpw2UKJgEbeOwWqMVPvASaT8ILCOIghFUmf9XMkaef/mKZjsuxuYfF0
         YJuaYEi6Dix8+JrjnhLMLJ/CCmSvNaB0IzhzclmKJTC+3eWoIJtr99byl0+6hlbg5C7b
         JQ+jCET4Flbn6jO0EoaKAlkUk6vbLTxww9e0fx8Xt9t4VSvCcry5n8WoB9/vodJYW1D1
         Qocdxug6eMP0GJfl6XRhOkrlBMmqQSYIoHvmQxnB9+EXShtMOAOVKu2hmTXPITYrUc6s
         w1Mw==
X-Forwarded-Encrypted: i=1; AKwUvBz2//rjDfNNny1ACzCidTOPr2bl7AG336ShUoGm9R4jWFOBJ0Nx8wfO6S1J+4VN5+RRfSk18FLWFk2w3xY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vn3nyaxUqV0qs0BgpPDgErGBbySy1fwXx4aOqnAVw81mdaqEZ
	gVF5xQW8DPQKDx3ptCx+tQnJYb8ZaDY/ZjPzEq4BTfDrmArOFbXfTE7Q
X-Gm-Gg: AYBFou13up8iFegaKCBLWOR+OcHSE2hjvPbm8eR+ZrLCkWskqlLM24q3/a0zVKBRlk2
	0AWqHq/VaQVN1rivPo+hAe4l11gnfY+xKdxFsj9DgPEwscxApDlpFJu2wwCCpbYCwMtAe76Sfnz
	X/tzodRKP8pTSiuoOeGNVvA9T+sHBmI2eWSeOlXiS4Kg0I8GUUyAceo8ExrvVURNUyrPaKZDe9A
	8pm4auluwIKHNtVvwmRUanJpHssyS3a0TpvswXRS8gLZEsVKxnHwTMFQfafh86hgEpn5JkihvWC
	hu8C6ITTdfHXD0aLL1+PusW0z53aBVTfHWqo/niDXXlW3jNZh3LKfj5a7XeIC7pRiw0YXchgZCJ
	MtLbG38qvGGJyI0cg7Ze6A8D8wHhQvVeUlAkh1zKVBpqiuLQdef/EgOMUQEEQWLEMQbFldR2uE5
	ZV0xGhsZkMMw+oF1PxuqvOwkLksQ4q3T+dRkoM3h2ChwVQhPlBKHqHOS0+6HGfX+E8Xrf10UkC5
	RZH6UBklMbO2uasp4B1i8oiDOJ+GimAvRBcInD0ctj23//T1CtH8h3A0R+MmkHHAe/pCILOGkqw
	gBJwn2yUzCUCbRA97z1eE96ZcQenywAieqJ7kicRB2tvUn3Ytg8GVKvaNUm5jsV63F8=
X-Received: by 2002:a05:6830:264c:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-85f1cfd639dmr3322518a34.11.1793982746449;
        Fri, 06 Nov 2026 08:32:26 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:25 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 02/16] ALSA: mixer_audient: explicitly define full control names
Date: Fri,  6 Nov 2026 10:31:15 -0600
Message-ID: <20261106163129.1006907-3-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

Previously, control names were dynamically created depending if the
control was an input or an output, a volume or a switch. Get rid of this
logic by simply defining the full name in the control structure.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 50 +++++++++++----------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index e2700b08cf80..2afef52a12d9 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -90,107 +90,92 @@ static const struct snd_audient_ctrl_type {
 	},
 };
 
-#define SND_AUDIENT_FLAGS_DIRECTION (1L<<0)
-#define SND_AUDIENT_FLAGS_CAPTURE (1L<<0)
-#define SND_AUDIENT_FLAGS_PLAYBACK (0L<<0)
 
 struct snd_audient_ctrl {
-	char *basename;
+	char *name;
 	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
 	unsigned int val_offs;
-	unsigned long flags;
 };
 
 static const struct snd_audient_ctrl snd_audient_evo4_controls[] = {
 	{
-		.basename = "Master",
+		.name = "Master Playback Switch",
 		.type = SND_AUDIENT_TYPE_MUTE_OUT,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename = "Mic",
+		.name = "Mic Playback Switch",
 		.type = SND_AUDIENT_TYPE_MUTE,
 		.channels = 4,
 		.hwchannels = 2,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename = "Monitor",
+		.name = "Monitor Playback Volume",
 		.type = SND_AUDIENT_TYPE_MONITOR,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename = "Mic 1",
+		.name = "Mic 1 Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Mic 2",
+		.name = "Mic 2 Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 2,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Master Left",
+		.name = "Master Left Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 4,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Master Right",
+		.name = "Master Right Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 6,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Loopback Left",
+		.name = "Loopback Left Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 8,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Loopback Right",
+		.name = "Loopback Right Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 10,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Mic 1 Phantom",
+		.name = "Mic 1 Phantom Capture Switch",
 		.type = SND_AUDIENT_TYPE_PHANTOM,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Mic 2 Phantom",
+		.name = "Mic 2 Phantom Capture Switch",
 		.type = SND_AUDIENT_TYPE_PHANTOM,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 1,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{ 0 }, /* sentinel */
 };
@@ -458,13 +443,12 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 {
 	const struct snd_audient_ctrl_type *ctype
 					= &snd_audient_ctypes[ctrl->type];
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	struct snd_kcontrol_new knew = { 0 };
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *elem;
 
 	knew.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	knew.name = name;
+	knew.name = ctrl->name;
 	knew.info = snd_ctl_audient_info;
 	knew.private_value = snd_audient_kctl_priv(ctrl->type, ctrl->val_offs,
 						   ctrl->hwchannels);
@@ -486,12 +470,6 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		return -EINVAL;
 	}
 
-	snprintf(name, sizeof(name), "%s %s %s", ctrl->basename,
-		 ((ctrl->flags & SND_AUDIENT_FLAGS_DIRECTION)
-			== SND_AUDIENT_FLAGS_CAPTURE) ? "Capture" : "Playback",
-		 (ctype->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN)
-			? "Switch" : "Volume");
-
 	elem = kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
@@ -524,7 +502,7 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 	if (!info->controls)
 		return -ENODEV;
 
-	for (ctrl = info->controls; ctrl->basename; ctrl++) {
+	for (ctrl = info->controls; ctrl->name; ctrl++) {
 		const int ret = snd_audient_add_ctrl(mixer, ctrl);
 
 		if (ret < 0)
-- 
2.47.3

