Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627491;
	b=KVWJslKSG2T7lRXfr5Qr1TyuVwgvPbMN2hFXH7rZwv6kU+M5Z4/iFTcsjMvu7QTX91Je
	 x4bxY7zTq1CJHmco1HdL/JBGJN5goMBNviAZsSzBH0cISHDLe2PrWigYQ/7T3CeH7K28d
	 ptSk4o2pKE/BYkxeYZRa37/tkyNDRN/QKW154GNWJmkNgc+TiewB4dIYNqT9plMZh5eRn
	 ANDE0VmaLOnhOwwujuGHTgFe4/UaecHLofnlxjG4lxmZY6z9xEV+/FWOUKSNrpkqGl89X
	 Idu7tIeywSNdjeTx+bLqtom6L11guEnFYm9ydseXq1F44D0G2/2Vtv9ODgtWv/nA+yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KkViRr1Qxpn9LLhb4kMwqtknFYRFzwLHGukxfnQUbrA=;
	b=Kt+1/lzpumKq/tg0zAn4gazlQiYhQRKAy1/V+p0qFKtau28X+CkGe9D158CwrMJqCE95
	 jC5KYs5/yBNvnC/oJXCEMWa7aCo90RZpoiq7D2m+pIp/Ou6D22NpmcDqGOlfC4CT9IWUZ
	 U5VHj/ZNCqHk9XUJ+yFHy5KqVYjHrHZvKTPLhFhdT3Vee1+o7rubyTqhhz97LNnNf14Ky
	 Y31r41ssbc0S2wc/q6B6hj+iSZ5GUJ9O5hVPpMVEX1vPROhGsMsb/Na0rtGFvCW/mPega
	 bvHr+U13xdEAEiEmu4fHUdBQGc5eIQmUOyD6/sZ9oevNnEqFC2PXset6OeVclrODfMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jajE8V+p;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AAE60A6F46
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56AAE60A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jajE8V+p
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a2551d7b5so5079526eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627490; x=1794232290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkViRr1Qxpn9LLhb4kMwqtknFYRFzwLHGukxfnQUbrA=;
        b=jajE8V+puKWvRXqYysJKyK+KkvuPz7FISda/lccWgIr5rA5YT3YKiet0VXiU5NSjFI
         iXJoS6SEiYqvPJ4iscz2fVcZulI9p1WNJM4KXGRlHuuQMB0k52hPHFHmnCSv6cmA/pa7
         2fT1RgPdH3Npu/8nD6SQgYaj6xLEFcPUC4rih+d+UWZcj3cY+oU52nr2f4lsDHFDTk1c
         smER58QfM/Q2jmWaqCZP39u9mcE22NmPc+4H2jMr7xVq32SZLA+JB6JpU8OQlIey/Q0x
         14td8my62u5pHslTJ4d3kAVA6oz/+ABjysCA+ZVtuImqa2EO4hSW6EO/DuaVpSChQUna
         guGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627490; x=1794232290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkViRr1Qxpn9LLhb4kMwqtknFYRFzwLHGukxfnQUbrA=;
        b=WismztUpSrhUzZzbBPfiuwBrElHmdevyh+xuhxWihl15qMJI13vJI20WHDgXWeCSJe
         CFNsEJ7B3QotTbNCDMghhgNBDOwYhJiscZqKjdnwa8uzvIKrRJi867Kf/XF9AaETjwJ1
         qLWEV85Q1ftCPOHiDFqVpierCMqJBLOYyKLMnjUT0Kpax0AyxuN35Cy47Qn5uLLwfEOu
         BBXSx7kaWEFEK/o69MwJhfJlVyliMiZPY2tjwUSDFt1SagyTnMqREAFh3zLtx/07ecI9
         elDXuTdKfbY1jHCucMC1BkW+SFZx6xbvQ7gL3PY+ZWKZuoYuGVFQlLLY6lguSzQ8fqqw
         vE+w==
X-Forwarded-Encrypted: i=1; AKwUvBz1X/f+qZ2GOId8+WT53J549qutG4+cXK3g6TppoPtWrMM9BWF3NBYBGv7y9mb+UlnJA/Ku8VzoX3AZPFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ7ZHNbkEUQrOvRjhPI68BXNOmVh94IXFoTcbvaJHsvdmCMwa1
	l6K5GuM7Gnw4uUl0fV3Iy4XnS/ljnr5ZsOT/nvYomnlqEMO3qCDjT0Yk
X-Gm-Gg: AYBFou0UhfvD/+gZPWemEHetzZAxID/h382m2/doNIXHr0iulI7Q4HQdu4Wx8IvQRor
	4MY7d6mPysNUyk7gE3FpFn0nue44mxxSb6pOFmdC4fGt//KI7V7GJKnTBga/1NipxATpDZz1o3X
	fegTLCkVL/tX+ebTHrNdrBFesDrSMefSxv1OevkCmsnWLkW+k9tnLX110i1zZz41t6ofo0t5PLn
	t3k1cScdWy0f+R6FAtv/q4qQdVqRehOnqSvLMI4Oizai1Je74BNzgP9ZEah/bF/UDidkhUFRZOH
	yEg9671MJdUK+hWL9AaZIQ7HoCQCW6umBH+sTay0SSF58vazi1Twf4WkGEt+XG7wxANn8QLa73+
	t7hQdRvT+KUEDB90Tp95RrWh2RBYzABRtUjooTQ1pK8Js3+J8t2jWBWvrAnFVn4D4hZNEg2w7mf
	OwhQ2IitHoOK9ZTT+Vx3t36SCSNtSiAmlF1LgYxavQWyXV2AMSgCKgMNB0WBoHbE9+4D8qy+eJI
	q00hTmar8iuNTfTVgqI0f+1NlzhYDbHjCvYY++v0B70oEbmDLYPX43QeukcB90fMa03YVlGN2AL
	ctEcLdoZHZRK9w7FjvQBjshiLKnf1Xbrqlg5vpZ1z5xC/16C9yU=
X-Received: by 2002:a05:7022:b889:b0:195:8fa1:b447 with SMTP id a92af1059eb24-1a9494d8f22mr18903679c88.12.1793627490224;
        Mon, 02 Nov 2026 05:51:30 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm33682841c88.5.2026.11.02.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:51:29 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: cezary.rojewski@intel.com,
	phucduc.bui@gmail.com,
	kees+treewide@kernel.org,
	cassiogabrielcontato@gmail.com,
	mstrozek@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Clear user-provided numid before adding a control
Date: Mon,  2 Nov 2026 13:50:34 +0000
Message-ID: <20261102135034.2751-1-sreekuttan2156239@gmail.com>
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

Clear the user-provided numid before checking for duplicate controls.

A non-existing numid can cause the duplicate control ID check to be
skipped, allowing a control with the same name and index to be added.

Since the kernel assigns the numid when adding a control,
ignore the value provided by userspace.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/control.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 535ceba294ac..42f16d2d0e79 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1759,9 +1759,10 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	if (strnlen(info->id.name, sizeof(info->id.name)) >= sizeof(info->id.name))
 		return -EINVAL;
 
+	info->id.numid = 0;
+
 	/* Delete a control to replace them if needed. */
 	if (replace) {
-		info->id.numid = 0;
 		err = snd_ctl_remove_user_ctl(file, &info->id);
 		if (err)
 			return err;
-- 
2.55.0

