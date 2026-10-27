Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064155;
	b=TpFRw4iFyWS9ZCBRV4pjlUOofA010w/Q7GGD1KYuDgBozp5fd3E/LbgwUfAvdMgwQQQy
	 wKbis2vUl+hakMxncA4Tgev+gshhMaGBi01OsYmWk+PwlhpxF7E/lLByir3fbOWuutDUw
	 pcFF8FDtDLGZAYDVYudRShGVvRvK4OhSPNh/MmzCV4fcNZjyfaV+w4K28Ivrkj/k2CxQG
	 Z06wXA06CRRBqgJUNBRNlvUl1EqXYmc2SqvjHQXhzyGXpKXsoyPI1ePu/NAGVTVg7+xQU
	 pSWIrae7lOcwW5PbGLmORJDaFoQhenRuaPeQBUT1eVO3ztf5DHYzpEg1EkSQfiSPB9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3v062WaNqqHrG8TV7QOmtJEfeFfDWBddTs8mnJTpAC0=;
	b=FbneIm5ZWF2LxVpgZ5J8Qk05xbbYFbwEadpla1L8OkfIKPBeUQgX5DD1kNgZHVQOZKmW
	 lbEsWcvljgvckB1wVsCM039EqalBa2XZMaVknMVFUOdm6BK6ShqeZzseUm5P2sjkxHJw+
	 axa8Sd32MfVgu5cV3vXgAavSghiWsu5MfZuTXydqGx4++tFyc/k8zP20SZyGGA/mDV5sa
	 385JA/MIoRQc4/rjZrawTeeetkknRfRuK1KkT8t7R8LdGejfnMzVukuf8lSJKoy38cyYB
	 HCl6DfSMigJLNDzVU6Rvcq7pQFaBJnbANVbJzSX4UIwPTW7MfVlYC3yQUtrWKtRbMrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKrI6TWf;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A765606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A765606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKrI6TWf
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35f1f76ea84so6030048eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793064154; x=1793668954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3v062WaNqqHrG8TV7QOmtJEfeFfDWBddTs8mnJTpAC0=;
        b=dKrI6TWfjMwv27rDwdAKpACbXRnFm0cV//UKLzx3lLzKIo7YDfu1+47HlAnzL/q8aV
         c9fFcytFEgOunSwctjlgJY5sulwhTzbcLus6gq22/GKxdUG/hDtsJn6piRTQcgOFtkr2
         58cvf/jb/x9Ni9aTcHbLP8tROFeaCToLyLmoE0CSA9BJQZF0HNt4l2xWbu3jTmW/SnY6
         IPn97ReWrF7Up4tKDnZ42SR5Ek9nO/oKwQL0lw8itf/niAmaJozo6pWeHDO4FpBmKHr1
         Dp3PIZ36D+NuF5st18YVa76RItL/3RXWWMMGLkIWbuW36NUooTETWY4/ZZcM+Y9tQnlB
         cY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064154; x=1793668954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3v062WaNqqHrG8TV7QOmtJEfeFfDWBddTs8mnJTpAC0=;
        b=KFXC7mTCQawvngwVi+yQ3P5Fd3gopAtjMa9OVWZIiRUuODfLADIplngD32hFpr7Kee
         FG5yvlMfsT3qV+MjNHR/AMjzW8yuMFCLfFp41pLEY6JvFTE5mrnpZ2Y5X84FCtWnryN5
         i4U5/ZNwu/703LrzUlXS921RsNoB+AbTS9yQvSSmDfYQBDvQPZ/bUF9OXFSoVfhLEKuE
         5ZvtrzvM2MX/wnVr3JHX+HbMJ+rx00QDA2xP0wcsNVFT67hpntOW6qaaJ9DoRhQcSTDA
         QodVbYivuqnFPZT3DRL92ggwTpoIAjedWRml/lFEA5cd7w/FWSNumKvsgHY6Z4JSl3KI
         zcYA==
X-Forwarded-Encrypted: i=1; AKwUvBwlyqh5tKMTri8sm4hjLvz7pPOIJ+AedSJSEktG1/GjnOCeSgt8YiNcU/aTrk4LBPmuxShNTzIMqpLevdU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgsjmzY018JwoUxZzTHQxOEjvaiGi+A4NC+FcDAt7KMQ4x7gZM
	nHQxu2ZhgYmv+9vCl3beF5GIc/Gt82pHHTMgdD1fmv24By57iIamHtHw
X-Gm-Gg: AYBFou1waKOKLn68JSiF3i6/jQ0mVWzG22e9ZAVENr20IasO0lXTuUVNjSu4S7UhNJB
	A/th+8kSzHe6SRq5Rf6q3cefVpfuDUSzFIpR+46ZmT1EjZM10dd/tcOUwaB2CGxInD9SC/enoPf
	GXIWFKPDKnTMIMT4WCQ+4MSJed+JqFHk8l8oC8pMYALzE/fqulTcPeNwkopxzKrrO8rSRZO4dwj
	f5XV3P8zqdlGK7cwjKR7zzI8lWUqFvATWRbywVr72pXP/r1ZOE/pGasZlpdx49c0SbMhPbYl6Dv
	qrlsnWmtGdAU/4M5wMrnXoRsG38PBrKug1KWKVbQjTYRcRSjZLF0u5hJdcDkkTlPtXnWDwow+XQ
	Xd7LSKgmbg0FK6RZQkGWCLYo46TCSrfCQzMJ+t/xIleHDWQT2BPrfj1OS5DpsQc45Fn4zHmKjmu
	nPtcqJ7zbcbjryL0pHBR1GELlBAHlht7S6bVlpefB9AEl5Fyq6J6OBVV/y40VBL2KbSqDiEvoyF
	SHRu6GqI3NR1oMRKihiyQKk8KxMGEesIpt71NSOteZ6yP0DBQr61s1P6xzwFPx/+oVaAAwp0Xty
	itvspBYBMidgA6OQjH3LBej6nKtzl3J5673drXM/q49/AImR6SV3IFtzJyHfkF8BSG/IWQ==
X-Received: by 2002:a05:693c:20ca:10b0:35e:ebb1:8e5a with SMTP id 5a478bee46e88-369e86165bdmr12131853eec.26.1793064153891;
        Mon, 26 Oct 2026 18:22:33 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm34844823eec.24.2026.10.26.18.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:22:33 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: pcmtest: Honor the enable parameter
Date: Tue, 27 Oct 2026 10:22:27 +0900
Message-ID: <20261027012228.3797565-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The enable module parameter is declared and documented as "Enable
pcmtest soundcard.", but nothing reads it. Loading the module with
enable=0 still creates the card.

Return -ENODEV from mod_init() when enable is false, as the pcsp driver
does.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64: enable=0
now fails with -ENODEV and creates no card, and the pcmtest selftest
still passes.

 sound/drivers/pcmtest.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 422fdb10f237..66bee8a2ce34 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -712,6 +712,9 @@ static int __init mod_init(void)
 {
 	int err = 0;
 
+	if (!enable)
+		return -ENODEV;
+
 	buf_allocated = setup_patt_bufs();
 	if (!buf_allocated)
 		return -ENOMEM;
-- 
2.43.0

