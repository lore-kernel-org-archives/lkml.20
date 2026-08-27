Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7AD3DC4DD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872918; cv=none; b=slSPXw7xpXHn79jJmYqhii/nqHzegtxk1MreCJ0ZS7QWNa7+3p2aWLFL8uoSjOxkQ2LcTgWBmpBy/F/SonUd1ChzF6G4ii5VXS7MwmhJ/e+WwCI9uDdaQv3AU0BxS+wZQWN7IEjfP4Lmydyw2ZMLmgXLRLh7d7wiB9YgwDlq1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872918; c=relaxed/simple;
	bh=ePzkJoNpPalxhOCXt5PVJAtsXVveyLh3mOZy7XB8YIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hr9soC8+8s+5YGQ3JPYCavrNuaKl4N5o1dofBpICQ/ybtDDuLePtnf57uF3tUp+kQTwC9iNDexHYY7q9+3Yx5By5Oa+v6XjxZ7kdoUziB/wsQFeOVVoVrh5ibHm2Q6TYzfkAi/ujv33SFhwb34AiMj0MPSbthLJH6D2+ZUmar+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npcxS452; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npcxS452"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b21f09ec76so522155b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872916; x=1788477716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6j+81W5sTdSzj/6qIi3uJWGbH2J1mlEvsG2WkACG8I=;
        b=npcxS452B5JRjqgAxq6RBdGnfPKIrfGVkgMZgrz2zOj8YsyLjT88zY1pb74w2NXVDH
         Unw9wLCX+w+k2SNCVJj84AtADols0TirCROJUNNK/fRgFBysbEoqaZ/doMYubsAEWfSh
         pZVLeK3lCYr2vAeYxCATWdYyV2kFECO5uDZ2ciX8iyWxaYHnh+i+VRU0aZPP3MwGrQOJ
         6XiKvou4iFa/WRlhrtqIQpJKt9WEIjdBtNfqG1kdlmAOeqzGRJchHurPFFq5USoYUiM/
         17VG/jHX/YyhA+rcSflb6sg2Zm5RQhk44F3xm9gG+e1pKq17bY1w29fPN0qCkYA8x1Mp
         C0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872916; x=1788477716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6j+81W5sTdSzj/6qIi3uJWGbH2J1mlEvsG2WkACG8I=;
        b=msvtEycvqkmhDh6DKM60Qpfarl7ep2BXM94h8TsVJFTp+D+UiykgV0z4pnMhl0Y94D
         i6Ih/ymvv5UIEds93tyxa3kYGo1kb4Gp8sGQ4MGaMsmXH85t4YBvwS/RZBkHAISxzVV2
         DVvgGlzoOUMrChpNg6CuhuFyLtfkMTFimQCinFZXjTDZF22HOQEQV6DJ4ixpi2grhZdK
         FTyRqFNuQliede9i4GlsxQ2YkqEku8I/L71UYiCWozHXR58lLpnILTgwz95kzI1kxa27
         aXcB58mmTXkpzkWnIxUZFE4gXK3gaEPfyzX+TIijZWtgGpGhnVi5z/EqgDSOp+ErdqKc
         8Y3g==
X-Forwarded-Encrypted: i=1; AHgh+RqoocAZPP6XiOskNs43eZV2CSqmJ8O7TKd+Y8UDGu0MXuX0GZVOWzjkGH+S66lsUfgibuoAx1gxL9F0HwU=@vger.kernel.org
X-Gm-Message-State: AFuF++l3DyvNHFJmQklj5G26zmvDrZP0Ucg5r/L58wPoNXSpEk8gwKcH
	oLwY1OYgGwDXVBJE81M3Z3huAdHTWlKlNkpzUv1ZZggVnk02ngYOX9JP
X-Gm-Gg: AR+sD11RlRC+feDG0APBa9rZmcXFliQgr6LfGeYZhRJqEckLD+VegwMZb4BqXYY3qcf
	ek+xhUVH75A7HCZGxzxQekVkClvnxW+oj0Yym4606FyhLM7ltlMV2rq3AD8mIQHPSWWdmDQoBkM
	8uHPj8y/0YxvM90X1LajWBo+c6R4vlpd1kXB8FpcAfcbo2nmgey54islCzew++HhVSqKLODKyeB
	TA+ZAWDuBDoFLNO4Qlu+AJDoU4jDrmTjzjDUmAUAezTIfHVHJ1HKk6Z6DaCnws++CQflVPa5BTA
	gaxNsP4Ylf4C1r6eC1qH+bRcLI9LVXMWQRjUMwGUxlckO7BJ3B9G5hnkJD7ocebEBa+J63Cukxj
	WI3AjWkTwyiya2bPTkAqlRaexQknOniVadnO34iu85KeZu2W1TH5Jpd2VtnxaaW7kX5OEkGpUZO
	yw0PMoupdgkhnorvaNO22yu+yRclBul0nbObXe6aShOBBG79TYd7Xqz3RRxNXwal0B/LbHcvj+W
	Nj9IA==
X-Received: by 2002:a05:6808:190f:b0:4b3:7efc:e970 with SMTP id 5614622812f47-4b3980115e8mr2982157b6e.5.1787872915662;
        Thu, 27 Aug 2026 16:21:55 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:21:55 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 3/6] ALSA: usb-audio: Add PM guard to Scarlett meter reads
Date: Thu, 27 Aug 2026 18:21:40 -0500
Message-ID: <20260827232143.149197-4-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Scarlett Gen 1 meter callback reads the device without preventing
runtime suspend or disconnect. The transfer can fail when userspace
polls the volatile control after the device suspends.

Hold snd_usb_lock across the meter request. This matches the guarded
Forte and common mixer control paths in this file.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_scarlett.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index 673eb8d8724d..369968565c19 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -707,6 +707,10 @@ static int scarlett_ctl_meter_get(struct snd_kcontrol *kctl,
 	int idx = snd_usb_ctrl_intf(elem->head.mixer->hostif) | (elem->head.id << 8);
 	int err;
 
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	err = snd_usb_ctl_msg(chip->dev,
 				usb_rcvctrlpipe(chip->dev, 0),
 				UAC2_CS_MEM,
-- 
2.47.3

