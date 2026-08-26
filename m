Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E63D9DAA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747749; cv=none; b=fMD6lwvb43yylZrY03S9mECwsQHkBfTJrA3A9woUJqyT+t2P9dYwqqalNhvdxfwi81LFh98PGjXD5DZ8SSl5aoemaQvFG1dd3cBUio7F1rpAY0AiWfNOwMG2buToMQW6cGAdFlXQjQwZPuR5hHbZNt0NGEbkI0TR+ScDw9GITbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747749; c=relaxed/simple;
	bh=b1XP2EZBzAusaBaT0wsqTEKyyPDxmInZ1zEKysjFqU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePias21APRWIlUjw6WSmUXQiycRZ+7W2yKk/8cn/BM1Yq3rGFprt+PaP/zX4RBcTNYbR8Pdukjqd4zUucbSWL8kLTEbV2OfN3BxpMtrQpWIeb0b7YcEK8iCu1MohNvKWoX2No9gdG0H9+sGoNVg3RSQdZZ2nJ1y143Z5x1cmSlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=zjiJNM+i; arc=none smtp.client-ip=61.135.153.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="zjiJNM+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787747742;
	bh=0axnn9YrfmP9AeRoje/6NvDFokNlTRUJMzjcBecfSiY=;
	h=From:Subject:Date:Message-ID;
	b=zjiJNM+iS+X6ljZjNHsq9PU+7lx8+oeZaRRzsNiVQnobrVjtlQqBvJlIG/vuhx7bA
	 TfUDYSnNrBWL0Hkl604TgETjJFNCB6GCWJG9RyqM8YtyIQEp3NY7yLgbVPbCrpOQgl
	 KmIede11tj7Jo7lQHaDrAU4cnuyRJlCrbmCu1Xjw=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6A8EDD9100002662; Wed, 26 Aug 2026 20:35:32 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5720124456962
X-SMAIL-UIID: F620E76BCE574A8599E3A305723D3EC4-20260826-203532-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: stack-out-of-bounds Write in append_midi1_out_jack
Date: Wed, 26 Aug 2026 20:35:29 +0800
Message-ID: <20260826123529.120359-1-eadavis@sina.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd

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
