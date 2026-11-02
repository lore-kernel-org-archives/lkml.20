Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628904;
	b=QA3ga4TLj3Rsa4zfh1FfHXDaZ6/sN9pfHYipraywYvWk25pa2ta2FKIk/Jg469hbfeCt
	 XscnUTOlr9LKIiOE3RPDYXAm0egcTukPygR9U+UOiYb0VpUQpruM8BAQHUN5sagBIAHOF
	 2fer9B7ojnGp+E/WR2quoa7hDe2RAEKoOcX4NHDN/ncL387ndttnZIrYMD2zThd6TTdZe
	 ooYO/j1/sg1HgmI5zfFNGX+DF47shpVTzivaYiOwR+aC/XcOeUoEia79DyaaMZYh7I0rS
	 QQn1Z6ymPgPxk+xiZm28qjUujOaBku0CgW1WPWkyhQo1KQplHoWH01wtZHEmOVPPWuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fFdoADdkdxRr75FQJBJurymI/Hlb9VRlM6nlg9L/Oyk=;
	b=tNlOf/pW8Vlc6EhWGwnBUG4NQlEHyvxNCdEDz/ayzwcAbyimHYsPQjitdAOS0ulpZEaK
	 ztYhhdAICStaGbwUeHFD9FhrzHenkC4a+sxsG8rNoYmiSIMa3KaySdML4eXrS1hbUYcfl
	 n1REJwUykC6ZlSZsyQAqA5SIdch5D7aNy/JiEVMiI7qV1nCwAWjD+RrscR3gFElYgkDRd
	 i1k6/RfJzjQ9qHypKOq4zKY/sy9ZgfMI0RcM7LW1wC98DWF3mTZy6kf3Tf4IaKHp2G/E1
	 87wIBf481x9ObBiFEU3eRebqxm/S9yP7Zhk8Jk8DLKO8cWQlR03CrKoBWTcIRBplfDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffq66S3b;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE32606B5CF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE32606B5CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffq66S3b
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so4738182eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628903; x=1794233703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFdoADdkdxRr75FQJBJurymI/Hlb9VRlM6nlg9L/Oyk=;
        b=ffq66S3bMi4CNLYwXNHWjxzDPa40s2nFxTfX+qSjFTubPxW4qTDL6YzMdIA5HuzMtW
         I3JUDikrgEXXkk/lZAZ5Blq3jxrfcnUUB0ZNdRo5h6sJ51TGk7zbfHxXcubeOTo1FfIs
         ID1LN0ajhOYBWqjMXtsyuTPPrp9VX0tToxioFGDMiKg5zj6gwzc83lEUEY4YOiyljkLx
         4doI26Go6XwPjRHXB/hrSQOzoV7abkHcJDiMUIt/w+l0+uI+/DEcj9wKDnQCCUZ3thtr
         LsuYhbPY9+jdedMTwns+ezO3dyKVLu7vCYLGLKSFi/hCSqgFEgQU5loFe5uPIg+2L6Q5
         IbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628903; x=1794233703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFdoADdkdxRr75FQJBJurymI/Hlb9VRlM6nlg9L/Oyk=;
        b=PX7J7w/ce1kBO3WHSGCuUdhnWF4aaBPKkNnevcJkM9O9MkdiSOlStAyQpuwEcfmjrd
         F4ZRsWiLtkmHxoCcvJP2fDFk8kSX6MhPP+Gs0mvSMh0NKMCy0nm/UpbinBiHhu6qHPN0
         +oGUwpIjL7u48mra/a6loA5v/Jbu0rY8nxVlHd7aeMmu+D+LtX1Kr8tRMSA+KvwXJgkS
         XKKoHT+eKZGvDbg37P8XPIfFyKWk8PcpIVBt42gQkyDxuFICkSS9LHccZhgy/1oOjDi5
         euqp86wjvMEV02EXC8IWLmd2Lsd5Lp4EJpwLse2D3F3bdJgBZkMJZeTIdCMZ4TW/AioZ
         jKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0xV7sMjCK2LyguRa3NQqhQtcOagWhStKnbOu7vgCZuwB8VjdNcVWsUsD5e+GiIAhuFNTscPAavkXLTyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tVBT7+gPX7crPZNkfb/zonS7i6oTPLjO4pLFAUSTKODu2VzNq
	T95tFC8aKJKGvJX19rL+znb+yMKptbUIGJ58q3IJ5W0Hc/fmMMyIaheH
X-Gm-Gg: AYBFou1no9wwGf9VcfKTZW6FZ2nip3V37acghPZkj2cq6MO/PAO7dUFytosZ94N6Kal
	SsTTo2qVAPCO+QNtg2zANXdkzc3gcfLMEs6yRpWuOAp2fRN98ita/OvBf8B/Kc8hyd2FWq0RF4d
	2S42WIi2UK4EMa5zkUekuj3p99zkgXWPLJIo7ClRRo6ONnJvvLriLDwuENWUbE2cjljAxNWhMHX
	OKNUun3e7IMPyfZn5W3t9l/Rc55efdo/3eL/VGRBzxRp78Z6FSZFCTCnMXuQ8BpQaf48nZol3e8
	URNyaz5XXPIAC+f2pa1IEws9RbnwivrCsURcZ1j+indi5h6BQ9FG6hC3tyywlhGWVyC/In1jem/
	IpoiUD9r7rmaVYngnuXvShQPH4Y63NfzB2MwiG1GCDRMXXFVSQBhIv4H6v7aXoVsLgpo+KD7qxg
	JY8WXRFAUhtJmD1YKQFR64hDumQ//vZtn4CFdwbmG1k7XuDFGE4jAwlPWOZrFLbj7CIMIwX8vsp
	1IXp9pc6c5/bkBGGFfB/zwPGEu1Rrhq0jUJiVp2FHDUlcWGwVYKApGQxA8uHe5nlcfC5UQYF0Rx
	mFoKnkY/0c3sFLjV+UicPJWrAdJNGFms6eNIquhUF3rL/G/XkYWR7cg+mrp+0iRbj/g46K7wpPt
	WtV14Pv4NnXKlb4pLa/lc05xyu/MWHqaKlcXty1T3COAf4gYqjW9FjRQWSo/ph3e7dgQaGW1Dag
	DP
X-Received: by 2002:a05:7300:fb88:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-36a437a4eeemr22442050eec.24.1793628903178;
        Mon, 02 Nov 2026 06:15:03 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:9626:1a7c:c4cf:3e3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm33556442eec.10.2026.11.02.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:15:02 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Subject: [PATCH 1/2] media: em28xx: clear dev->v4l2 on v4l2 init failure
Date: Mon,  2 Nov 2026 19:44:38 +0530
Message-ID: <20261102141439.13505-2-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141439.13505-1-kartikey406@gmail.com>
References: <20261102141439.13505-1-kartikey406@gmail.com>
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

If em28xx_v4l2_init() fails after registering the video devices (for
example in v4l2_mc_create_media_graph()), the unregister_dev error path
drops the initial v4l2_device reference but leaves dev->v4l2 set.

If userspace still holds an open file handle to a video node, the
structure stays alive. On USB disconnect, em28xx_v4l2_fini() sees the
non-NULL dev->v4l2 and drops the initial reference a second time. The
refcount underflows, em28xx_free_v4l2() frees struct em28xx_v4l2, and
the later close() makes v4l2_device_release() touch a media entity in
freed memory:

  BUG: KASAN: slab-use-after-free in dev_dbg_obj+0x630/0x830
  Read of size 4 at addr ffff888023601bd0 by task v4l_id/6384

Clear dev->v4l2 in the error path after dropping the initial reference,
so that em28xx_v4l2_fini() returns early and does not put it again.

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Reported-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..ec4ed2b0e5fd 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3137,6 +3137,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	 * v4l2_device refcount to zero.
 	 */
 	v4l2_device_put(&v4l2->v4l2_dev);
+	dev->v4l2 = NULL;
 	return ret;
 }
 
-- 
2.43.0

