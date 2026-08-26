Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D33BD657
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747453; cv=none; b=fSLlTT+55RM5oyYXsEZEgSDWlIJ2Qw0aI0ZblGNqYJ2PBgwYAXfDPI27NcpRj55D1zJ6xUGsBXEuqzWx3AFJ3bLDftVbqDpNo6LFyyVhQzt5J+YZsM7FMd3vmyqgrS1iYIy07ldwUNCWnXp3owYLPxwnJ1RU/X4GF5JYUO03itY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747453; c=relaxed/simple;
	bh=5DciWciSrQJFH+XRgXgvjIeTlum+q3DQX972xgzoFFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxSoabRjFW4KA9PQF4nY3925CgZjpkZJTif40wPErRq8w4hQ4bAzMuol908yx1QHh5JBkLs//absXOYv8F/dAHYjMHGXlpDMoNu+lPCyG/xE9P6FOIJszIitkA3WyIm5W6IGi66Y26mFGhGxv1R6hZLpsU+glzALQ5ud3VjSYSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=xtbtyuhe; arc=none smtp.client-ip=202.108.3.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="xtbtyuhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787747448;
	bh=jJ9i25ef8OVcbCT7xX7GxC/N4PvXilxLSqhXX0LrwvY=;
	h=From:Subject:Date:Message-ID;
	b=xtbtyuheOhkc3P5mD2ivCRymvuzb9oKS9qU0Z1QVPfy5rdzOtm8oDHrmcwccouOk4
	 VicqosBJsbFYRgFEYIh4ZJwbG4m2cLWCcFhIxezelavHcCXbu9QSWBy9wVo5ldMASu
	 cZ2KspasPeCmvtxEWOMDtFx4Vosqoux3JkaUm45s=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6A8EDC6A00003FC1; Wed, 26 Aug 2026 20:30:43 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7911724456641
X-SMAIL-UIID: 5726DDA31315406D9FB76AEE46725207-20260826-203043-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: stack-out-of-bounds Write in append_midi1_out_jack
Date: Wed, 26 Aug 2026 20:30:34 +0800
Message-ID: <20260826123034.119675-1-eadavis@sina.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test

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
