Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0238887E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555515; cv=none; b=Kr9mYyZcxL1PejqvjTu5YbWvruGJTkJDGo6eWC9ACvZTYExng7BvUxi2KrT4lc/12/uSK6pIWLrWqH02D6wGpdHW41lMv1x6YIgKFHDh/xq/ENjw7bga1dKF2KZFYQJkinTMq5cn9/djWk9R2vjuy+e1hLpnwRq8OhyNj4AST0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555515; c=relaxed/simple;
	bh=28uhGPjiJ2KFbOvQJhv6vfgzO9MJUM/PdqW0N3evoOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l6c46+nSzJ7qCiHLyNcTuQ01QKtoKXSM4aBEIpjcyxe0tQGj9/poljF7XUDV/iB20UYy8vUetIDHwYfp/shJSfgDwRnBDMkcfgI9x+8KDefhkF5OOJPPhjJKgggTooJ/pXzSZcqCaovy/WO3ncLrEdfxginjCkk+S+hvGtFMaUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH8V1WhP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH8V1WhP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-484374f54d0so937071f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788555509; x=1789160309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FQ7QnZPMANOssRW33us2G5YSu4ovcViTbmXD59gXys=;
        b=PH8V1WhP4MY8/RkgToK5DzOTP94PWrxluTheX7jM4xFd/4tlkSj5iBlHTTNrGiY+oi
         73OnMu2r3Pxdn4gOg0zeC9stTthceOp7FusjPU5ghzSvwFDRUokBlMj/P6kxu6LgbzVR
         TfMT9ymXggb1RfNnxLKlLyH3Se7LcfRnnpKVtNg0bZq84ptI5vtBxerIEoU4+SwWObGu
         nBD+NgXOFTts79Z2yAi57saCm1oNH0ycr9JOq2GEFbiaGvfToCk0DjYlYIIWcjn4joIF
         rquE4JEEd0QMhfEo9T1fryjnHJWbysushTntxOcVWjyONbeQLGCzLnyneF4YyLwRrun3
         jKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788555509; x=1789160309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FQ7QnZPMANOssRW33us2G5YSu4ovcViTbmXD59gXys=;
        b=Est18ch5a84Vi9Qrgqot6MfjqsmdkyHZyHA/OtoCeHd9ai2Wf7/+k+1R/KkJJKRC6x
         ybKtv5dhdnD7mlQhSfVlCOnjewCSm6WfzNezU1AYBR0GRo1dcphW7geY7FdzlIQOK/8k
         JLcrFF/uzTXxdikOJQ3FXexFjUjAQaahMP/5buTgr2puWP+d74ZeZ4mbQuOP2iuz69fo
         WK4ju7DcMPOECvafyDaMc6y1ARSDG/nA+u0MIl9+9RSSg/2UOxp5+FCmAYzCedbCnqzC
         fnzaKOnwPHAw5dt8zrej7pmu7RL2QHcWevKgKnZKVYbvbo8bA1TGtEPVIAGGc8r/tlUJ
         HBkQ==
X-Forwarded-Encrypted: i=1; AKwUvByfF6+AZmv6x2ncWESfOtcEacV2myr8XNOoDdTszyNH04bDfa0r2xe4kGy7D31NfTXkE+X8HzOShUWTvdA=@vger.kernel.org
X-Gm-Message-State: AFuF++k1UTeVgM7t2JJeyM3mk1HVv5PVHqpXFMvkfj/FYuqvO/Me+8Pp
	uABy5zqKxXA/TYAJf9rYEZBFQMhTQ9v8Er2bxrTLAtwG1sGzavIY3Pc=
X-Gm-Gg: AYBFou2yyg93093RDzMQYIFgqxq3PkiPiTksppi2/7b4y2ImvkV5Jbx/vFsNRHgZvIP
	+8KW2NTFUaPcRE9OTK007QxnWIrVqQYCjbnjZMStGtyZxxhQgGl+aDtVkt4bLfkPeWECEPpQedI
	VjyextIavSeFAAZVPU770HC8k1b6yUusCzlFwMnBKch/SPKBTD3yh+T9FgPX9BTLb7p1ti7nU2G
	s5KzzFGG0s9X/Pi24y8TYq29Xlo3dwVKzl7Br/SkyxFcqd9AD9qS4m3LyEJfQKbxS86HmOAIuHZ
	4SeC1rQCNuU9iqW/pDlnHoCwwdOQhZogpqqr+Fn/5nqLIMKt7w6+o7oSM8z1SFU1s0mVNCfzBbf
	y7b1pC+anrXgmJqxzjTY5vQ37UilcPpLdaEMGXK38mpxhOYYUMw7crY9uSZa+vBZJ8ruDR/k66i
	jXH0lNSVbB7UflVxRKVHhQnLZv2KFQWkvjsTTiPHXp+Q==
X-Received: by 2002:a05:6000:26c4:b0:485:847c:4c64 with SMTP id ffacd0b85a97d-4858729b6f7mr16087150f8f.28.1788555508729;
        Fri, 04 Sep 2026 13:58:28 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm5789563f8f.4.2026.09.04.13.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:58:27 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 1/2] ALSA: usbusx2y: fix in04_last array size mismatch with in04_buf
Date: Fri,  4 Sep 2026 20:58:25 +0000
Message-ID: <20260904205826.4071119-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

The in04_last array in struct usx2ydev is declared as char[24], but
in04_buf is allocated as sizeof(struct us428_ctls) which is 21 bytes.
In i_usx2y_in04_int(), when ctl_snapshot_last == -2 (initialization
path):

    memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof(usx2y->in04_last));

This copies 24 bytes from a 21-byte slab allocation, reading 3 bytes
past the end of the source object.

Introduce a USX2Y_IN04_SIZE constant defined as sizeof(struct
us428_ctls) and use it consistently for the in04_last array, the
in04_buf allocation, the URB transfer length, and the comparison loop,
replacing the bare 24 and 21 literals throughout.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v2: Introduce USX2Y_IN04_SIZE constant and replace all magic number
    occurrences, per Takashi Iwai review [Takashi Iwai]
 sound/usb/usx2y/usbusx2y.c | 6 +++---
 sound/usb/usx2y/usbusx2y.h | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index 4190227c5a2a5..200b708aacd6d 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -196,7 +196,7 @@ static void i_usx2y_in04_int(struct urb *urb)
 			memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof(usx2y->in04_last));
 			us428ctls->ctl_snapshot_last = -1;
 		} else {
-			for (i = 0; i < 21; i++) {
+			for (i = 0; i < USX2Y_IN04_SIZE; i++) {
 				if (usx2y->in04_last[i] != ((char *)usx2y->in04_buf)[i]) {
 					if (diff < 0)
 						diff = i;
@@ -305,7 +305,7 @@ int usx2y_in04_init(struct usx2ydev *usx2y)
 		goto error;
 	}
 
-	usx2y->in04_buf = kmalloc(21, GFP_KERNEL);
+	usx2y->in04_buf = kmalloc(USX2Y_IN04_SIZE, GFP_KERNEL);
 	if (!usx2y->in04_buf) {
 		err = -ENOMEM;
 		goto error;
@@ -313,7 +313,7 @@ int usx2y_in04_init(struct usx2ydev *usx2y)
 
 	init_waitqueue_head(&usx2y->in04_wait_queue);
 	usb_fill_int_urb(usx2y->in04_urb, usx2y->dev, usb_rcvintpipe(usx2y->dev, 0x4),
-			 usx2y->in04_buf, 21,
+			 usx2y->in04_buf, USX2Y_IN04_SIZE,
 			 i_usx2y_in04_int, usx2y,
 			 10);
 	if (usb_urb_ep_type_check(usx2y->in04_urb)) {
diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index 6a76d04bf1c7d..7b6deed17d4b1 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -5,6 +5,8 @@
 #include "../midi.h"
 #include "usbus428ctldefs.h"
 
+#define USX2Y_IN04_SIZE	sizeof(struct us428_ctls)
+
 #define NRURBS	        2
 
 /* Default value used for nr of packs per urb.
@@ -55,7 +57,7 @@ struct usx2ydev {
 	int			stride;
 	struct urb		*in04_urb;
 	void			*in04_buf;
-	char			in04_last[24];
+	char			in04_last[USX2Y_IN04_SIZE];
 	unsigned int		in04_int_calls;
 	struct snd_usx2y_urb_seq	*us04;
 	wait_queue_head_t	in04_wait_queue;
-- 
2.47.3

