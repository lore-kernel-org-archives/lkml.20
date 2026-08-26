Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1849D429022
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752002; cv=none; b=PfJ2p3V25EeVyDmWWqVM1tiIeWBCUdsAiSlyZNcZamlvhJUeLe+O+xHrCKbAZH4oPqYW0OCYW+GqSuUaalBIDePGynhzu7oDgwaDePBCqRhimbUP225KNGHo1U4jfDGRF7aJe9xdx8bfvDivWHEGaIIHbt2IY7gxyWTXHNuWLIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752002; c=relaxed/simple;
	bh=vjBCB430kjBJcDqoeYHpDPSeornI00GA9WQkFh4Zs1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwQuW2vQx6BATA+eHhe9znLKM/zUVXtPsD1crYix9JC/5iz1STHNDy9a9qlHxOtJonwRAAvoWClFTMuJEN2aMmYXNawADsIRcsGO748b4IXo944jPvjYnYQvBorpC7X+Cz3G+eBCkd+1T3vSSz2Cp9Q2SnJmzTgHFzq+bJV6N6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=imIfcDDB; arc=none smtp.client-ip=61.135.153.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="imIfcDDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787751994;
	bh=ovGITEti4J9Rnl7+RVVU2fKKifFicuhKM+nQonZVdp4=;
	h=From:Subject:Date:Message-ID;
	b=imIfcDDBNXcMHQeELJ/RznU7UE9MQPsnD/pc9BuM7spzMpaPcvfVsObn8rl8C5JR2
	 WVEjyeOssStWXQ3+ZWknZDfuFtHo3Ju8m3tHIPo2X78V0VMkjKVLrwCqW+87Ik4Thz
	 I7PDcWunZE9Xg9AddiIcxPl3Zhk4KVhPWejwWW/M=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6A8EEE1F00002C52; Wed, 26 Aug 2026 21:46:15 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8075436291634
X-SMAIL-UIID: B3325EF238494AB1ACE5BF025CA54881-20260826-214615-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	kees@kernel.org,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] usb: gadget: midi2: prevent in/out jack from oob
Date: Wed, 26 Aug 2026 21:46:06 +0800
Message-ID: <20260826134606.127250-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a8ed2cd.1d9ded08.62e62.00a8.GAE@google.com>
References: <6a8ed2cd.1d9ded08.62e62.00a8.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The increment of config->jack_out in append_midi1_out_jack() lacked
bounds checking, triggering issue [1] when the value approached the
limit MAX_CABLES.

A similar out-of-bounds issue exists in append_midi1_in_jack(), so it
is being fixed as well.

Before incrementing jack_out/in, the code now checks if the value has
reached the upper limit MAX_CABLES; if so, it exits and returns -EINVAL.

Additionally, the jack_id assignment is moved to occur after the jack_out
bounds check to prevent wasting IDs on invalid increments.

[1]
BUG: KASAN: stack-out-of-bounds in append_midi1_out_jack.isra.0+0x38c/0x470 drivers/usb/gadget/function/f_midi2.c:1713
Write of size 1 at addr ffffc90003277880 by task syz-executor119/6000
Call Trace:
 append_midi1_out_jack.isra.0+0x38c/0x470 drivers/usb/gadget/function/f_midi2.c:1713
 f_midi2_create_usb_configs+0x748/0xdf0 drivers/usb/gadget/function/f_midi2.c:1815
 f_midi2_bind+0x1d12/0x2770 drivers/usb/gadget/function/f_midi2.c:2013
 usb_add_function+0x219/0x890 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xd83/0x1960 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x28c/0xbf0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 
Fixes: 856fa444b098 ("usb: gadget: midi2: Dynamically create MIDI 1.0 altset descriptors")
Reported-by: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c35f34092a4bc9855be6
Tested-by: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 drivers/usb/gadget/function/f_midi2.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index 19fdac024343..06a3add05447 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -1675,11 +1675,15 @@ static int append_midi1_in_jack(struct f_midi2 *midi2,
 				struct midi1_cable_mapping *map,
 				unsigned int type)
 {
-	struct usb_midi_in_jack_descriptor *jack =
-		&config->jack_ins[config->jack_in++];
-	int id = ++config->jack_id;
+	struct usb_midi_in_jack_descriptor *jack;
+	int id;
 	int err;
 
+	if (config->jack_in >= MAX_CABLES)
+		return -EINVAL;
+
+	id = ++config->jack_id;
+	jack = &config->jack_ins[config->jack_in++];
 	jack->bLength = 0x06;
 	jack->bDescriptorType = USB_DT_CS_INTERFACE;
 	jack->bDescriptorSubtype = USB_MS_MIDI_IN_JACK;
@@ -1700,11 +1704,15 @@ static int append_midi1_out_jack(struct f_midi2 *midi2,
 				 struct midi1_cable_mapping *map,
 				 unsigned int type, unsigned int source)
 {
-	struct usb_midi_out_jack_descriptor_1 *jack =
-		&config->jack_outs[config->jack_out++];
-	int id = ++config->jack_id;
+	struct usb_midi_out_jack_descriptor_1 *jack;
+	int id;
 	int err;
 
+	if (config->jack_out >= MAX_CABLES)
+		return -EINVAL;
+
+	id = ++config->jack_id;
+	jack = &config->jack_outs[config->jack_out++];
 	jack->bLength = 0x09;
 	jack->bDescriptorType = USB_DT_CS_INTERFACE;
 	jack->bDescriptorSubtype = USB_MS_MIDI_OUT_JACK;
-- 
2.43.0

