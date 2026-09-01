Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCE0471CF3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253461; cv=none; b=Q7EYENK1eZS4wUhVXyoHxbn/BNV9bvybW1s7JnykhoC+aEOd/tC+CriRj0ag2wfrlyqA6BzjMgrbF0BGECLcFoz579NVAIG4XunqYExpuP1JeldqWpIoUXWVC5FzE2GhjcdULrChFbwSOObrRyEeuU+NrgeR5esAG8uBlcgXuFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253461; c=relaxed/simple;
	bh=doIX0DQKKAwL94HMKj7Q8UCwjHeiufCnHKuAhPQ8rv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYWwbbdQO4gcc71zQz/wkbkhy5IyhPnDgaygNxupu+iqCOse7KG4PWMqLiMrSJGu0XUCcDc4ZFFIV1wi5b4Z6AjLWUqVvMQBd+wMmuGNOdn6QA2+1Dl0Vndpp0zCB7X/t12RGbobXh4t6zijrcu6q7NyokbduuSZDwL05ZlBbi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8Gj9fBX; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8Gj9fBX"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-854f8068301so419288b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253458; x=1788858258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nmL3qNokOvrwN31ChPqandS/QNdZTsNqkBCTpOqDVtw=;
        b=O8Gj9fBXV6Owy1bUKxQ33chNaMfoz05Jt9NTM1nZw2z8l7Kws8NtP1cnHYEtFzc/xO
         y/vr5OFnleCPMAvgWv5tvqUCpN0J9gpZR8h/nX75zkNL6ADfTuPd1wwOc921xN9pi5VN
         DC3Eiyf6xxFhZTzc8J4Xy4w4xtUlg6FMTPaJvsQZgZSw01VD84dSZWYtaBlKqUIM1GWX
         kLH9vGQdQ9teCN1oTOwgkOhGJ/l80OBVHFnGx04RKMs+0esETyLgbbgBwB2wNbjqOm0A
         TWMwr3vW9SBhdihQm1XlJd9peqi6gLJXWlq7wzf+HbovPPbLkxKVRzXqT1l5ye8IV3uT
         AsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253458; x=1788858258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmL3qNokOvrwN31ChPqandS/QNdZTsNqkBCTpOqDVtw=;
        b=ETXgoQA/U4nOpAoCfXD2DmT7NKzRCEzODAmAV9UVmlWkJTvEUbo0fSMhyGKcJYMyLH
         /Tl7f9pb99HxLGkvju3godnE6xHPPsC8X2RhojxODlPwXey1OIypyZwszuQaXF2roJyt
         MxReyd7PHkpAlYeVDQvtPMvqGbed+1+kOnq+N8fMcoglXBuBpaPnaJB35P8V9fxbNTDo
         wFndn2smaHyUuQblDtuopvnn4Xl1z64MOE//RpPY5G/pqQWERocHcRkpLoFxL9lD2vnT
         TJsFa5+Puvh4SVEPtLT/wE83Le4ZuB3xnGPuKZcNO3rMNwejeZ4mKncWryHuohQ46Qfi
         mWQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2+NUw+d5jEYqluBSpoCG7k5oDUr4zXAHq/KztS/CPNto4VI51SVm4/R9fhyTx5lLgZuCn2MNa8QO33pE=@vger.kernel.org
X-Gm-Message-State: AFuF++kwlD61JYDXuVanJZ1dmrt+ZGPW2wN/GyrjDWuVecJKrZQM7IVe
	ziBGhygXqAyPxHfUZ3OkgvdL/1xOLZ6CccJxlQ5jcTWiweusYGDayOKt
X-Gm-Gg: AR+sD101+YsYuy6+BUpNmR5J7cWHENHtF4vaw9cbsKlSIdrNz/hayro0yybmH98Tew9
	uoa6/2GjASK9zxMX+yb1pghMsOJAhzMX9niKYJgsFHjM4aQrFRRA4c03HkCeNuZlm3GxsToFAFz
	jgeMD+ueIxnGguVg7+j1XcZkAVJHKSc+KOJaLNv9CoeDWL4PU2aIQNI1Q1nsR2I4claHdq+p2Qh
	gw3ysPhOxnaIVIvWtt3wJvSMj1yJCJRXaB/MwplVFLAtlrxPsGyKXDw0pnS74MaVYMH3G+JWAc2
	Wwba95qM53CTMDtiDaSrHApjixN60FYG9GvH1g0TJzShvxPPxthQE4q+yAE7uSytOzN2V5ShZ+x
	gSnhTlFOrbdFerJBU0rnxeW5tXUXCU8JHd3YbNv9v7BdNuVsUHU13l3T0Zmg69Y7Joj0bYgR1xV
	KftcdQeiyMRdC9/KImfR9r1oGPNbE5wXj8ots4S4Yy8ngezGCRI6G5tTn6TIirmFqDO27jqLKVn
	EP/HVche9Qzu6k+z5Syg2wdEuCMSQTbaVwEtzTyw3NJhAkvdspZ6A==
X-Received: by 2002:a05:6a21:6e48:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3d269519d51mr54397035637.13.1788253458199;
        Tue, 01 Sep 2026 02:04:18 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36dbf62sm5666670a12.25.2026.09.01.02.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:04:17 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: clemens@ladisch.de,
	tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: usb-audio: fix OOB write in snd_usbmidi_us122l_output()
Date: Tue,  1 Sep 2026 18:04:09 +0900
Message-ID: <20260901090409.1478573-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_usbmidi_us122l_output() picks a count of 2 on anything slower
than high speed and never relates it to ep->max_transfer.  The URB
buffer holds exactly max_transfer bytes, so a device declaring a one
byte bulk endpoint takes two bytes from snd_rawmidi_transmit(), and the
memset that pads the rest computes 1 - 2 in int and wraps to SIZE_MAX.

Only 0x800e and 0x800f are pinned to nine bytes.  The US-122MKII at
0x0644:0x8021 falls to the default and takes usb_maxpacket(), which the
USB core only clamps downward.

The akai and novation output ops in this file were given the same guard
recently.  Do the same here.

Fixes: 030a07e44129 ("ALSA: Add USB US122L driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/usb/midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index f8996416c3be..1a5210556981 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -969,6 +969,8 @@ static void snd_usbmidi_us122l_output(struct snd_usb_midi_out_endpoint *ep,
 	default:
 		count = 2;
 	}
+	if (ep->max_transfer < count)
+		return;
 	count = snd_rawmidi_transmit(ep->ports[0].substream,
 				     urb->transfer_buffer,
 				     count);
-- 
2.43.0

