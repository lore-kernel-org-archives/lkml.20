Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984185;
	b=A6lJVLCCxW6S2uvnoIygUXm5hbptVqTEmoUWhhCjsM8tZq2QPKj+0Ty6xgjly82mmisW
	 dy7xTXEEc09BlOl/IXXK6WhGMkA1y+Bvs8J/2HSraLCn7mnZ0EibJ7Vy+dTCar00uO0Sz
	 o5+i0rsXXvaBMol5fL5vD98qfUd2Z63qeFOL0voqAMI3HKspj31W3BIr3v2cjHSzsmIn5
	 miv1RGAU2HTR1KPhevdlrgivJFTHbEItKyj5R9aTBHGdg40rqTao3IOFyfjYSzPjJZeJp
	 g6njSdM/+1pZ8B55JK2pfLpyBbdPIufonbfsyIG1oRnKmqfbjGYctJSXDN17ViDnNDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mildQKcldMkDmSjfhIpmMkbxI9eJlgqNxmqam7PIgl4=;
	b=BtPbAsChdwXfADu7E2cYbVwqCCXiNTvo20AacA8WjBSh74lDlmmc+j34v1nLmvJwp8QC
	 YPM13Wt+MYG/gfc1vr0i8zkhD/jyuJypameCMHLzvnFds0acEbiTmFpp5HBnHK6b+h14U
	 55xSXKluxstD4KcsJEorPOqJ8zQMJUmuzcnSU1fIceNh5gXUyJCa2a4R++GuBFze50bAu
	 mrvE+/Zm84ElnSWVgLKwSLOWPHmQwrlV3EfOYYx0xOqgK/kPVz9RCFpZVi45lU9ycbuR6
	 EYrisb2g8I3fU+XXyC7ajKLr1Raw7i8eH7DoBnih1NbC94GzS2g2MByGxZPGZt3Rqxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeovEfKr;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA2606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDAA2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeovEfKr
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1212066c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793984184; x=1794588984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mildQKcldMkDmSjfhIpmMkbxI9eJlgqNxmqam7PIgl4=;
        b=ZeovEfKrzoVohaBy0IJUc4H9KVlLpncflAbI0M/vM/FEX4ib+VS82nn/U9FhwN6R7K
         2Hu1NPaG1TIKN+Po1IGjpPP00oyTmK0BhXmHKEVExcALNk3UPnOMe6hzhBIKsSpJ3NfV
         JC1tydh3s1j1ZtuhsHrLQ6rDeHnTDi7rrVueN9P6IqZWdi8dzMU7FEcWHRmLYH9g3UFm
         Fw9T+UOA3uMeTaF85MjXRIjQ3d/s7NIwwSOzFMRQ3yViMm9OshJ+jo2bu9Y+7dk/sovt
         0Mqz1Ifc7zUdA1Td8+dWcxH++JG4pvkjNa/MygOcsDsBql/jPXNf4Hpuv8AUnhJoSAbU
         dcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984184; x=1794588984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mildQKcldMkDmSjfhIpmMkbxI9eJlgqNxmqam7PIgl4=;
        b=Z8F0OtQluwfkEyqUMBvzUqkuJx22QtLNIg8yC20JZubX8qYc6sdzwkhPehZFaSU8Zy
         oBnq25XtFNfdwJUIPUS/lHC9S3oOfFAlsrbfeMSnGQF90HqjhY9Gcqv4bgpsDPo+nvNH
         50oFmg05vJvoZw15Kif12gwt5ZMDCCySr+NjTz5P0iNHG3Z+E3PUBO0u+j1XVlg9fY7V
         T4GM0tQnN4i9GCsvc2iuMRtuIm02N60jRDeHRGFsoYixL2ocEZJ7/LIyY7+SXn1prpTZ
         w07z4cpHlZXSzAz0EA+U8/JRnbbh1FwzvFKZjyNt3OSBNYbVl69tG6hpRei/lI69aprX
         d/dQ==
X-Gm-Message-State: APuU4Z/kUbAXZtbDTuKSxCUGSbPN9DyV4clzUzA6vkBeBT1l57DYxOPV
	045CMqCvL27kBw5JIQH8OB1iiie2popIHphGUPsA3gYj39fu925/hlSM
X-Gm-Gg: AYBFou0uNs+KdMxw7iAlhblqa2sSRMCcvI7S1CO99Hg5aPXiV6iIwseNC5B/7cRy+Hv
	+2MTBuXWAGlejih/OWClVcjTnoqr6NwCS7dxWIxAM0/E0p1wmIJllGDS07hHMacEcOp8tb+CyiZ
	T0su3QcAfIOsDqCQv1ySLsUxPfL2jx3I7c0ZrPPlRenXFUuJApQbTaI7rBLlBRRSUZAmxz7zdSJ
	eadghge2oVODW3mkkwRg2ftS7lP7f9mwEi9GIHYsuVgaaTBvS1fFic9AWE3ydhwf2Fy1HNzQFe4
	OgUD8UOZsoytqFJe7GM/3RAv/04VFaw31WjYUUO61R/Bi4sqlNaSTot+0pwg61bFQbZdO28t1CK
	gpCVGbdIAnzWua335rILmO6b7w0nS6myhGDC3ObZ+OrjJ6N/BG5Q9MoCtnN+r5dWnt9fxGL/Qo3
	Vgd7h31m9O7VHYhYtGYx7kPIUFF0Wjnk3qsGscbniEDx8GqosnnIcz1sO0tsWIE1jMYUrtsOdf/
	hadOrn9vnf7eKZUbo8POl/ld4uzQxcWoL4tygDIWSaYLf6zlTqDuCcnzeJziJuiBhBtVAD8yxb1
	QBi8uxFkMy06KlhnNc8yLnL/sZTlQ9pRtwB38ZTYsgac6n6oMppy
X-Received: by 2002:a05:7022:96:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1b25d329fc2mr3326367c88.23.1793984183585;
        Fri, 06 Nov 2026 08:56:23 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4df114sm7329756c88.18.2026.11.06.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:56:23 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Trim whitespace from sysfs input
Date: Fri,  6 Nov 2026 16:55:31 +0000
Message-ID: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The attach and detach sysfs interfaces receive input from
userspace.

When userspace writes a value using echo, the input normally
ends with a newline character.

The parser does not remove this newline in all input formats.
For example, a bare numeric ID can be treated as a control name,
and an unquoted name= field can include the newline.

Trim leading and trailing whitespace before parsing the input.

This keeps spaces inside mixer control names unchanged.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/control_led.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..a640e7835ce2 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -518,6 +518,11 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 
 	if (strscpy(buf2, buf, sizeof(buf2)) < 0)
 		return -E2BIG;
+
+	s = strim(buf2);
+	if (s != buf2)
+		memmove(buf2, s, strlen(s) + 1);
+
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	s = buf2;
-- 
2.55.0

