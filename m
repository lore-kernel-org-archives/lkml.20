Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8BD346784
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788665926; cv=none; b=gkqsCfkL1hAVBWZjvWc5kdFrJ3cjFysj3r5X/tFWGUqVwUt1PEotlkKRD43VGcYCGeTlOh3eeCEYWA6gbxEvpwHsK+rtk9IuJSoDEhd9DjjMG1qRo+0tRv62/rBV3L1LhYJKRkYGXwJ8mbhranOUcvoU0zRitHhLSWj8TiIN6aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788665926; c=relaxed/simple;
	bh=DP5EChUjvMElWBr6Hoc5QOkR/xA9psAm0mayBR7tG1I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZF7ssTHWXvg+0GPcXXT5nXIlqGJQQCDwPtL88ZNhootrbFwBEB4/0dVVSTftZYzbdtyrnfjLqifbw6BWFjPWPJSZ6E9Bsnz4o8OYMD14CPWygzHpu2t7dUCDGD7lOO1JZncUQUc5XyJx2W+p2vKYRiNqRUb+uPwy2DPRSdfsZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1bf511988so3303961eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 20:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788665924; x=1789270724;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1ZkAdZeWNX/3IzDnpvZHGKPk2z5qI+LcROY5/hQLU8=;
        b=YhkNnyMhCWg7yG/Py0q6wL7Z3nWLPc+PiMxCAMp0XrUukUSfzST1am4cyxo/lPJahk
         jaLCFUasZr2+EMo1HVnLO2VfXVzoqeup9FTpALDz9g5HwNL07GiH+nDG10kzjVMPYPAV
         pcTVY2/f/ymbr2nZ6uFFESZygHOgbMCdBNqNmxN09IjgV5hDaahtja2T3GMMDDFDxde0
         4EvztYfM9tJY2nPSaZ30I2bCSl7C/l/OGgjdZ5p5wVOshcrIl4V4VNfARFpYcoZPoGmy
         nxVmhmkk/WNKip6YhBiVb/AuLKNpRASMEXEGWfpu9oP/IkB1Bv689FLkBDU8mcj/65pF
         xLkA==
X-Gm-Message-State: AFuF++lwVkbMtMMs0WXZ5XjLVfHrgddqEvCdRVPT5IEZjoBCBczq6kXQ
	Wks/l2+B+Go2eUGr/6KV+3CcEmAOUJwn3cIV8xBkAi3UFhBYvBf2lvg50oeuf19g/pegrzkO/4I
	M6kyr2E4WwBNlCMFtVeY4znI7c/WuzTGHG6Lv3/THiIkQ/HmkAQ/jZoG8nRI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8108:b0:6b1:b771:bc43 with SMTP id
 006d021491bc7-6b6fc5ce9b6mr9896973eaf.23.1788665923573; Sat, 05 Sep 2026
 20:38:43 -0700 (PDT)
Date: Sat, 05 Sep 2026 20:38:43 -0700
In-Reply-To: <6a9c207f.a6639fcc.23b8b0.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ce043.a6639fcc.23b8b0.0005.GAE@google.com>
Subject: Forwarded: [PATCH] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
From: syzbot <syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
Author: kartikey406@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

frame->ccid.datalen is read directly from the USB response frame
and used, unchecked, as an index into frame->data[]. A malicious or
malfunctioning device can set this field to an arbitrary value,
causing the driver to read far outside the received buffer.

Bound ccid.datalen against the maximum possible ACR122 frame size
before using it, and reject values less than 2 to avoid the
"datalen - 2" underflowing.

Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1853daab1a47603d4678
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/nfc/pn533/usb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..d08d3b0df988 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -322,6 +322,11 @@ static bool pn533_acr122_is_rx_frame_valid(void *_frame, struct pn533 *dev)
 	if (!frame->ccid.datalen)
 		return false;
 
+	if (frame->ccid.datalen < 2 ||
+            frame->ccid.datalen > PN533_ACR122_FRAME_MAX_PAYLOAD_LEN +
+            PN533_ACR122_RX_FRAME_TAIL_LEN)
+		return false;
+
 	if (frame->data[frame->ccid.datalen - 2] == 0x63)
 		return false;
 
-- 
2.43.0

