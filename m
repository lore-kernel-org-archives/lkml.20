Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982750;
	b=B1w3ROLJLIC8SQClpurK65jLjioTXBuiNak+cnKbdlJYLjznt0V4+lcB4/a8VI8JxNwP
	 ARxp2ZicN22q1wUyMcblh/qZ1nHSxjyaBc4fw8leZVsSlAYDYszYXRwtWJUiETLBgk3Wx
	 LQmG+44gBbHivtRHWIsIe8PgC9236EfRnnTtDMrdi7yW9pDk/ySVzD0eYJm6XU8xInn/0
	 hhCCpBUOtTYAQ4qEqtxwjpCo6zIHqPjq7GoZTFmMYXFItAk5rSE/6v9me4z3YZiPtMXWf
	 WPkB4ww4mQ/qYJpZRB8RVmkxzw2d0tWTGJTOb92ZyGeIIkAkPrzCRARMboE0uZ9fyFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FsISgatNx9XaNtwVu+2hHF27SFxEscMd0QlYudetfiY=;
	b=e5FmcpBa51hh1F2woqgJajWMuiB9FuOVeenNxBzFHVkPUcUa4mzXp/KuKzf1rfNpRCa6
	 nw5Rl8i4otn3/OHyYTo5Q46LZxebuBwWyCXE84K6f4j6L6XBazW7fWLKtQHZTaIZOXXrn
	 uGyil513GMCfb/FLJS1uH2IxDy3zHJOTGnCvhq8gm9bykagnLtz3hjDWsuoPEEyCjrxGE
	 GvZiaXNYvIwpsdoznxta+mj7FjL1ir/cJYSPFhVXcBrknyqMkOc8fgki0JJvMhI/5j2H/
	 m4/a/JnVbE5t2uX78GX4ZJcMLKlHPJNbzxB/eroG2s3XH8wwueliuAqmvVhihpM9n7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oahrWZce;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA010606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA010606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oahrWZce
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-846566246e8so763144a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982749; x=1794587549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsISgatNx9XaNtwVu+2hHF27SFxEscMd0QlYudetfiY=;
        b=oahrWZceGWiYZFLpDjzFydDBqqLTgh20Jvk0ltgSwlv8nFSqBbM05J0ktdW0wp+gQM
         rf5coZE7/02q653QDtNOO6qJamPqv61QVGq1wLUNs1CtQRsHXbiUwW+827VOMzW+Sj5J
         qChUOi8UpWl0pbbLNaod5VO/V8ppROV7q5VNfZhMcyKrTyivFAJp80h1Orztn3GmkpQh
         SUK1saDS/p8iSE8JFJ3dBtVHGjOlqDILKRXuQ5w6dZ37Y0lQxVt97Vn97fIGkG33T08C
         KvyD50QG6yy+Q8YLutzVRd7a0ZdapJp4aWU1KtMfHWtb04hPq9qtyaeQIwcC5GiVxoc3
         zv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982749; x=1794587549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsISgatNx9XaNtwVu+2hHF27SFxEscMd0QlYudetfiY=;
        b=qK2+OqaTJVUr7T1Nsnd+Jkb1KsMsWEu7s/pY6JRG1bB6Ili3p9A/rNvC5DIvXPY9VE
         xdJnPcEZfMDzhp4g4MLv/frIdZ2sfNixD5A2GOVggl90Fgc6eAgYdk8CYgqpCU0VFmzU
         HYqjrimZ1k3Va0VSvkuf8njz1TcxmZDcLTgpXwFxcFQ2iwt8xq78iIreEBnunsTkMToy
         Nve5asJ4SKAeNfRsL0wNupn8neNsZr/nFm9q74n3B1TPoPZNxCFlRtH0X4UtJcNQCSt2
         QHxcPjsuhfveSUOH2cMEIiQYBSo4KO2KWq/GYx6jwCSx1LpfaC8Ab2Nl12Yfci69jXcA
         Semg==
X-Forwarded-Encrypted: i=1; AKwUvBy0ns+nLJccnzJgHVrTmYnk9gotrsHKz3gEGLPDs8UW2QfQeHr77rTd06XohCP6uTX43HvT5HPSPyJrL28=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6dl+qbY3ai9KgNOsksOEpO8aqGw2QkLV74svPAwkWhjCaOTb1
	klY3Ef9665RVUzGY1eemcUanSpXHp9Oltgw+MJ0/JnWIIk6br2JH0iR6N6W7Nw==
X-Gm-Gg: AYBFou05kkdQMUs7nGZRhU8WbN9CfSwAfMQL6rN2G6yY7KiAat6Cnle1aJVdtBRXXFR
	tDMNZjifbP2ohNGA5z9nVmO2ljOfEvEaXJUBbzuZWQg9C5rwrRt0XRU1PpuoVOXFjy3YvkFLexl
	4YARbj/FRxQWnBIyT95r2dWA0hPtR18tLxo2d/Ok0UsV9rjW+707TGxcUcBODm9Ky2+te0iTYCW
	IBbPX4JAbXwnRWP5QfdhdH11cobyJLdAE93bGL7EUu1OohUjXw/oNg767vfmnTzo3Fz28zj8ncL
	xmfhe0J/rFFcaR9ZGDZkMBvEOT5uUsk9QYRx8eju3CS8y4Z5BhgFRRnhQ32gaj1lJrlWUtkUTCo
	BNPDyxCZ7YJ6qJn/axyGM/eMkClyAYSClnww9dwB+aSgJzx09UBy/6l3EEutWOEMkGwNJbkRs1F
	0CyfDoXL2tjnNyG1Th6CfJnUO+3yT7XA6DfC+DDzdBU6ue1Q+FhJbkJrWaFTvsRCC1ujUynXb1I
	RsvMV/1u89FouVCl5TWKpWTihsXkzwIm6sE9AutsbH4uECJgVAKPUvKqfdWWUxuKKCJ2RUPPiWv
	ozCBd1Xds1GerxjN0KmAaFpAc0/8IYy5uws+ejJhkuevUA==
X-Received: by 2002:a05:6830:442a:b0:846:9414:ded with SMTP id 46e09a7af769-85f0562dab4mr3897698a34.5.1793982748814;
        Fri, 06 Nov 2026 08:32:28 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:28 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 04/16] ALSA: mixer_audient: Add length check to USB transfer
Date: Fri,  6 Nov 2026 10:31:17 -0600
Message-ID: <20261106163129.1006907-5-mrwillporter@gmail.com>
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

Check USB control transfers not only for errors but also for expected
length and return -EIO in case of error.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 63714d00592c..1f3744a7c10a 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -244,9 +244,14 @@ static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
 	const u16 value = U8_U8(sel, cidx);
 	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
 
-	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-			       UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
-			       value, index, buf, len);
+	const int ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+					UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
+					value, index, buf, len);
+
+	if ((ret >= 0) && (ret != len))
+		return -EIO;
+
+	return ret;
 }
 
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
@@ -258,9 +263,14 @@ static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
 	const u16 value = U8_U8(sel, cidx);
 	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
 
-	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			       UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
-			       value, index, buf, len);
+	const int ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+					UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
+					value, index, buf, len);
+
+	if ((ret >= 0) && (ret != len))
+		return -EIO;
+
+	return ret;
 }
 
 
-- 
2.47.3

