Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532726;
	b=1OOdPwohkm7YhFyQ8QuUdni3tFGCtfxMtfd40Iq9R+qGRvf0fAJo+ez2/wHl8SXRWmDj
	 8qEjHeRBhVpSS33IQ61kUIfn0AynPL5E4+fZBmGtVCGqBerrh9aU2h8mYOMKt8+wLQG01
	 TrG7XLAtd2tMFeANZb1GDmTryY+UKGaUNwmXFNqq8HNx0gJ/SCtn7RwZzbM7YLgnSSZ8f
	 0r3+bLeW2RiMahkGWfa2YJaO4xdXnhwPP31w98hZ8RhKbSl7vGpupua59WqZrZKzn2pL6
	 IJh9bhlUg64aapTKJCzKBJUFqBLuNC3log9yuW1+ly92YC2UxgDLTcUxoexKv+aEjjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VasWpqSUZYD0V4VYxxbwomWuyZegnnIz6kc2wFLpprs=;
	b=gxCppA84+rUvr7tc9nvnqz+ZqjusAlYdLcLDbMwJzMb+m34AFxm/jSSNUVRylTqDun7k
	 OSACD96B1wzJpUfUyGWPww2xw3v1gW4jPsu3PStlMKWNGuoYrdzU1wlxzLz/+YCLiEcrp
	 oWwDTmHzh1yOT5YbU4Bo0oLySmPvjh3cE8clb8EdtoFUliGwqM+eKtwb41u4HslklSzY1
	 o+E/T5RrTbEN2SHDRk+K66tsKsgj4Qs/gUJH4q8yimpnLlub3qcAjfiP4aCoT/07vLT6V
	 8uTivd37hCcI7EVpfLKsqxTfcJrjVHlJIEJURkSmy40HFGS33r4mF/RvG8DFrcWAf4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gbwr0IK0;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88E606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE88E606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gbwr0IK0
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843cf077f10so861684a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532725; x=1795137525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VasWpqSUZYD0V4VYxxbwomWuyZegnnIz6kc2wFLpprs=;
        b=Gbwr0IK0qd1Y/y7HBMuf9IUXwTm1GD3GcGNZPmJ1lAYZJxS9CEQryMc6NhKoIJE+Bo
         d/DETRVD7Yr2TJ8MnzMvwdJDeGO9PKieWKkwVjxjdFHx0x19ePXKYdMSqKnWlb6hb9nH
         HLwKuCTlpOhDLIIzPqad5DgqCy+q7YvwdAH1w70j2nhoeD9L0veIb9fe7xqnNpLV+1Ro
         hoy7/e9qlNO958nQJ5LfomK6a1419t6AZ6MEdEbyJ+YqNgg9rTUe1pRbBNLpgzyJt78S
         wqm3q4S8sjeCQf1kBhJfKIWq/4VHU3brAqcQL8gYfp06+ntjJmGtD9NBGWRPEOwhXoQ+
         ytDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532725; x=1795137525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VasWpqSUZYD0V4VYxxbwomWuyZegnnIz6kc2wFLpprs=;
        b=c6oQPbnkxyJrERniRk1w+b77aTvisiqQEcbLIXTLWUuISQ8keX52lvFf1BcGKd+lJt
         nuA7dORZRsPp9POKgW/BEysETdRAjOofPyLYa8X7oTQkzzqQl30b3tx4xvz4Sc5l0Hmr
         WxqSzfQiVayJWazFvyUeJEhcM+CqmKvgpKVxtgMI6TmhYPL+UQJsQu4J00B8NjZQoC8q
         AEBkCGjkhWulohg7Yjy6NdKUJKTdLrXGV7kHGiWNXA7jAnDkNoZNCZ7RJ+E21KxdhjKC
         yGXUQHC4O1EKvbSkf0eyOcpwqLemJqzSr+ozTDiHWJONnR+9WUlae1OEbMo43SfMEQFJ
         wh6Q==
X-Forwarded-Encrypted: i=1; AL+hErHo7Bsa/MHfIN64KppE46Q7pwiy+Bf209LX0teM1Jq430bToWXSxT6LNuOXIg9j+ZFpyXXCjkIcAPBMSbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JIp0oaoiF3OzwVR9ZR58Wdrme8AadIatQ2aYJmOP1d/QuIaSC
	UIFUck8WTW6meOuqm2YsCUgEAJxc/Iwzkxd8T+zvpru65OAI/+WJ2eE/
X-Gm-Gg: AYBFou0TiJAZP+Av4ceVLSplisFhLPbYVe/aTs/0Sx6UNdQnUwcAYF4DlTced6clFei
	XsHqoyEhhjA8G2PIB32V+iJTUQumgfFlyoe3/MFU/iOok/+VNehGc4dCOh2zy0P25uc3Pk+NBQj
	MweGyxoqlAer5y34C/ieGih7ICOMNAbZFRRk+4giq84pyELjXWHyHxWQshv2eUPsNxT/EPI/SPm
	4M4/wyzaNKqvaUdBOh7IPvWlj/+8qO3LbfUm8mLe2Z7OQQd/OZP7E1cdh2a7E3R7bUtsT1n7HfX
	33aa7fodnd/zKOzX2aSZt+WwptHtZjwO5fyrrQTYEWn15+8lnRkkc1lTuLPcgFJdim+BtKI7/Fe
	sEPs2caBLM/0vNWfXp35Vo3Sh1un/755DhILG0lzOJLEBomNqewuEjj+3uRgZ6zpMOjeo+AX2fr
	Cm2cs+LCuOBPMUphZ6KlOHcH5gllKpDCr0fvQ0LBMD9/DNanvrSmLY8Hnj2Y64nE62sBaet/ccp
	jvfyuNvEwoQdSESxYzqfTyJ6zvyo69+3Ro+8aVj7yeqyyXUKorpZWIyWNOmSly8i6X8BClwn37G
	QmGjqbbKBJWkIAsZqCk5GAX+nAeuD+zoUfKGjnHShmQ231gflfVtt25/aclL+a47QWPVvCsJsem
	kCXkdPbZ0h9ddc15TE1Ca/hY9655Dxx3bUmlhxxcXwYdHoxau2uPTIUM=
X-Received: by 2002:a05:6830:914:b0:843:8982:9532 with SMTP id 46e09a7af769-8628992d65cmr1277963a34.28.1794532724575;
        Thu, 12 Nov 2026 17:18:44 -0800 (PST)
Received: from cachyos-x8664 (fixed-186-96-141-48.totalplay.net. [186.96.141.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880a5298sm1230599a34.7.2026.11.12.17.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:18:44 -0800 (PST)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>,
	stable@vger.kernel.org,
	syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Subject: [PATCH] media: em28xx: clear dev->v4l2 when v4l2 init fails
Date: Thu, 12 Nov 2026 19:12:34 -0600
Message-ID: <20261113011234.45270-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
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

In em28xx_v4l2_init(), if an error occurs after video_register_device()
succeeds, the unregister_dev error path unregisters the video devices and
drops the initial v4l2_dev reference, but leaves dev->v4l2 set.

An em28xx_v4l2_open() call already in progress (such as from v4l_id)
that blocked on dev->lock while em28xx_v4l2_init() held it will then
find dev->v4l2 still non-NULL and succeed on an unregistered node
instead of returning -ENODEV. When the device is later disconnected,
em28xx_v4l2_fini() also sees dev->v4l2 is still set and calls
v4l2_device_put() a second time, dropping the refcount to zero and
freeing v4l2 while v4l_id still holds it, causing a slab-use-after-free
in v4l2_open().

Fix this by clearing dev->v4l2 under dev->lock in the unregister_dev
error path of em28xx_v4l2_init().

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Cc: stable@vger.kernel.org
Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
Assisted-by: Gemini
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
Note: compile-tested drivers/media/usb/em28xx/em28xx_video.o with allmodconfig (no warnings); not runtime-tested locally against the syzbot reproducer.

 drivers/media/usb/em28xx/em28xx-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..f78325a41124 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3129,6 +3129,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/*
+	 * Clear dev->v4l2 to prevent an in-progress em28xx_v4l2_open() from
+	 * succeeding on an unregistered node (returning -ENODEV instead) and
+	 * to prevent em28xx_v4l2_fini() from tearing down the instance again.
+	 */
+	dev->v4l2 = NULL;
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.56.1

