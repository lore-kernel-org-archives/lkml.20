Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809083B38BC
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243545; cv=none; b=M46KIYAIeMJFIy5gDwMqfwDZSi/+F+rwz5ZIaRHST+yzSPYnFKL/fblMxy5ebM/O4n9saIY3MtQ9whZSwdDw025LllzEjGY8esY0QKsMX0qD2u10qFBWxzZW2+f/duFMtGSyB/227CIL1xzcwbTkdISHElzPB/vrszcH5RAfYZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243545; c=relaxed/simple;
	bh=CuZ3ffQ8Hm5jQhayUPc9pN7MNyme//qilaeYwIzrWH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7xwcH/ligeYSRKg7z9EArQort66/Bvj/kTdouDUV+ctWpRjaxC2vR1ERpB6RYuzLyd3RNRAG5t6rKsLwLrfxc3wKrAtJt4AK/PXdnan/3Da84ICmyGlCi1GRUUBoTdbyhC67kjdVTgDGP7r9qrGbGy94q+5EGLaeECUBbGeNNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=LNWvFBL6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="LNWvFBL6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6d28aa26cso15217405ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789243533; x=1789848333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LRU4U2K2fkRgvqWBTzhPzJ23ce9gNrBNZs6QKd0OBo=;
        b=LNWvFBL6tOjZMG2e9DNivqXJyrCbYTNDLEgJDqx1ggCY7eARBMEdZbCQsUEz7P54nU
         9TNLYOETVtR48V+gJ9eWaHpmxOMY1iYnNJqfPDZLVf8fE9i/ooM18ctugS0B6l7UJhf/
         AYtKISq3Hzpwj/eHtXcklv0qC3bvuwSTjslFqFRIes48vt+R7PKM3S08QWKyANH612cb
         axhC+JQMZQqpE+4rbFI5BRfc1Hy6RMtBTDsr7I8iX7Aoih3WRbl+/P0dmdTpvegsNhDq
         xvvy4/Ycr8YAFpjSr7fB4IbTQRJW+0PahCXjU8BJW3w7JoVRGqVrUxy5b7kTQ6ZIiskk
         FcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789243533; x=1789848333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LRU4U2K2fkRgvqWBTzhPzJ23ce9gNrBNZs6QKd0OBo=;
        b=sn+eaIKBnLmnOppGa1zpyRH8EQc9W//bvD8mj8508fB3XwmGg8wE81O1bBAnn4EpS5
         049080Xda8yBD57ZYINvSfNfGOmBtD+JApfY2dJmymjnwWdMsDQGyxEBxhyuDvCEwtP9
         W/F7OAEX8JSBVLX9kh5/+oYhBC/3Xu/yWjQVP6buEqJ5ghml8JbjvJLn2PlR9Eys2Vbu
         OXy5iAZlkt+/zaUbLOJeoAgzr0ooRH6TV+ujzC/fgHSiCBp7Po54K76mTg2AKiA+W4Dp
         w87E5cZRdjpVIjvqlzqcagPFRKbMYgPmFS4zpB/SZvQfQ7iMeSjm3okT+oShzBA+iQtj
         /SMQ==
X-Gm-Message-State: AFuF++kLuJnLy/sBAW/DL0/XeCw3RsLvs+SCSjbP1ZNEDteKCsaA7doc
	jSHDTHBivcByQMr2HZqXqOK/wbJM3V1majFNt7TPEymq9Vd6MHMIr/Hx3buHpDZ4zA==
X-Gm-Gg: AYBFou2wBU0bWD+3MMlp3CZnFiJdCd1spwAjIMzydHATD6PUZJ6GW3kNHVelnLSEkKJ
	UKbW8nwh8w+vtIdVOwjLiVYJQjc1ZwZNpxDDm6dFzQBBt3Aj+9y7Ft8u1qogrrsdNnL4aJwCN1w
	KAZxmcTvjVz9q1Giyr0JOSsmX9abNOiLdIGDmj1FfS/f/pfFoGfHkzeAtdwWl7RjkheFkaBPHYh
	hezDKWm/At2Nhu1UGRqsOnd+LnadnY/NQb08vZJI4W2FUJHwUubDjz0pmLAYP4Bq54uq4YCuzF5
	Od9iQK5yiZ28BCRVNHb+DsT4wb/2eoERvxQ0xqvnV+h3urft/RpRTtdnkU4LZJNrHcyDgbVLTM2
	oE6RAKppkDfXzy2w9tdK8Tx2Qh3/G1XicbTX783UKFG3+osTEBB482uaskaPMJwob0Ua9K+PwVs
	YchCuCGk03Bdsl4qrngXMMSYz7YHPkaEb+O1Aw1eALNuyEP8ykbGiojb9ErDCyFuxHKgR2pFQjm
	uaVCWqmPzaCfLa0jIVQrv/XM/ZvXjL/q5MDsti47oZ63gDo
X-Received: by 2002:a17:902:dac9:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2dd2a35cf96mr174633375ad.18.1789243533241;
        Sat, 12 Sep 2026 13:05:33 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm15351412eec.13.2026.09.12.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 13:05:32 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	co+8eacd4fa193b1b28@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Clamp implicit feedback packet count to URB capacity
Date: Sat, 12 Sep 2026 13:05:30 -0700
Message-ID: <20260912200530.1955491-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

data_ep_set_params() allocates each data URB for exactly u->packets
isochronous frames, so urb->iso_frame_desc[] has u->packets slots and
ctx->packets is the driver's only record of that limit. For an implicit
feedback sink, snd_usb_queue_pending_output_urbs() overwrites it with the
sync source's packet count, which is calculated independently from the
capture endpoint's parameters. When that count is larger,
prepare_playback_urb() and prepare_silent_urb() can write
iso_frame_desc[] past the allocation; their existing bounds limit payload
bytes, not the descriptor index.

The reproducer uses a high-speed UAC2 device declaring bInterval 1 for
implicit feedback capture (8 packets) and bInterval 4 for playback
(1 packet). On the first capture completion after the stream starts, it
accesses seven descriptors spanning 112 bytes beyond the one-packet URB:

  BUG: KASAN: slab-out-of-bounds in prepare_playback_urb (sound/usb/pcm.c:1560)
  Write of size 4 at addr ffff88801e696ad0 by task vhci_rx/178
   prepare_playback_urb (sound/usb/pcm.c:1560)
   prepare_outbound_urb (sound/usb/endpoint.c:340)
   snd_usb_queue_pending_output_urbs (sound/usb/endpoint.c:501)
   snd_complete_urb (sound/usb/endpoint.c:1834)
   __usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
   usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
   vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107)
   kthread (kernel/kthread.c:436)
  The buggy address belongs to the object at ffff88801e696a00
   which belongs to the cache kmalloc-256 of size 256
  The buggy address is located 0 bytes to the right of
   allocated 208-byte region [ffff88801e696a00, ffff88801e696ad0)

Record the allocated packet count per endpoint and clamp both the adopted
count and the packet-size copy to it. Fold the Format Type II delimiter
into urb_packs before the allocation loop so the recorded limit matches
every URB.

Fixes: cf044e441902 ("ALSA: usb-audio: Update the number of packets properly at receiving")
Reported-by: co+8eacd4fa193b1b28@bugs.sh
Closes: https://lore.kernel.org/all/22xPn8drvIUtYgVeQnBiNqXuevOTpBAjepLz%40bugs.sh/
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 sound/usb/card.h     |  1 +
 sound/usb/endpoint.c | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index e34d92d576a2..8299ac241c60 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -116,6 +116,7 @@ struct snd_usb_endpoint {
 	unsigned int phase;		/* phase accumulator */
 	unsigned int maxpacksize;	/* max packet size in bytes */
 	unsigned int maxframesize;      /* max packet size in frames */
+	unsigned int max_urb_packs;	/* packets allocated per data URB */
 	unsigned int max_urb_frames;	/* max URB size in frames */
 	unsigned int curpacksize;	/* current packet size in bytes (for capture) */
 	unsigned int curframesize;      /* current packet size in frames (for capture) */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 0835943d7b0e..b72ce1e9bfb1 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -492,9 +492,10 @@ int snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
 
 		/* copy over the length information */
 		if (implicit_fb) {
-			ctx->packets = packet->packets;
+			ctx->packets = min_t(int, packet->packets,
+					     ep->max_urb_packs);
 			memcpy(ctx->packet_size, packet->packet_size,
-			       packet->packets * sizeof(packet->packet_size[0]));
+			       ctx->packets * sizeof(packet->packet_size[0]));
 		}
 
 		/* call the data handler to fill in playback data */
@@ -1242,15 +1243,16 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 			ep->nurbs = min(max_urbs, urbs_per_period * ep->cur_buffer_periods);
 	}
 
+	if (fmt->fmt_type == UAC_FORMAT_TYPE_II)
+		urb_packs++; /* for transfer delimiter */
+	ep->max_urb_packs = urb_packs;
+
 	/* allocate and initialize data urbs */
 	for (i = 0; i < ep->nurbs; i++) {
 		struct snd_urb_ctx *u = &ep->urb[i];
 		u->index = i;
 		u->ep = ep;
 		u->packets = urb_packs;
-
-		if (fmt->fmt_type == UAC_FORMAT_TYPE_II)
-			u->packets++; /* for transfer delimiter */
 		u->buffer_size = maxsize * u->packets;
 		u->urb = usb_alloc_urb(u->packets, GFP_KERNEL);
 		if (!u->urb)
-- 
2.43.0

