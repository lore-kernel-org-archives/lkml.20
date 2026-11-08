Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794147171;
	b=mq+Hg5KV9zTvzmGVNaqnz8AVdFlwZXZr9kag3cHY7EHO9fjHXT5+2ia/PDG6OscGjZNd
	 o8vTsRq8ZeJp8mwH8qTbgSI/Bf41hZ8SKaJ3fewzSc360plIyt1Lfv02zeNIidmlfF4zQ
	 8FE3OJjW9Y/Jkge0Fj1Wk8LYja5SlrabECwn8BiP2m43C3ERKiV7xn5idpqJnV2meQyF4
	 IAi/FkBPjYDZ2gPUVhsXsoE9vJf7f5WPpjYqfJTiphXtJhByHu4b0VuZQe8+eyRgkw+ky
	 F0HcZL89tW2BLLp6poZzYbRdL79lNnohRrwKX0FxhPIF77qY0bob78gIUmY00UofS5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uSSk0bKUkcjcG0gJgABgCHhEs7yY+bzoe8xVb1xTnAg=;
	b=n/7x/GmWodfxHT2lBo9LaWy6vHVzqZurX28gsmCfIMtzmAU0cuwqytooc6My23pHR83H
	 8RPiwG5Mj6bXa9ltSma5WkW6BK08YzxQG2Z/jW0mt+Nwf27q9lMcBXAU3TJ2PUuEEwUqH
	 sX6Qoddvbb/eZAJIYzqD26tGSKk5t/+VvMG24eJtWBzJlyMzf2ceiXIjLyvSxiAjy++3S
	 uX0+PieSQaBo5jyJoeJHXRGvs+czgYKJTGxr+JEARx9SUVBWRBlA8pAy2coQApWLzlfD5
	 BSLPMO/TAyO+q7M3Dr+QDbX+OCYMujyGL43mDs1hm2uTB68MwVlC298cQUjPpctHnVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEbMSuHE;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A6606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEbMSuHE
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so220769eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794147170; x=1794751970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSSk0bKUkcjcG0gJgABgCHhEs7yY+bzoe8xVb1xTnAg=;
        b=WEbMSuHES09bwoRhQ7hK4a8ZNXV8IyjAhVxVvjLewgR86byiwrTKX4TgxaWo928caa
         3Gpzhy+gwjrIyMuenvS2DroTwCJM8KoPXsMzbN1jQmgMs+PJzHlxQjnKRja7XcKq5VS4
         qOzWgc8YJsGWDxB4iPzELXhW8hqDnVYaJGjqObZiJ42ZKFb74yOcPth9PhT8hP0INdlZ
         cDYVBGmXmLpIqbx5JF6+EDVyYbJ7TzQLx3gBeBgS4CEUZCwHB75rFWvm+G5YZfJwtJRg
         UN+SWOjTNX8h4JyS2tBWjIKtfDwvcmqLAu9g1+yPg9YWD+9TJ5P8YwOeSMN7RWlxF29i
         r7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794147170; x=1794751970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSSk0bKUkcjcG0gJgABgCHhEs7yY+bzoe8xVb1xTnAg=;
        b=SPXhw/+WJFyaEUcPCvsxc5ugJUr4s0TJkDLk3rdYlAV8zsYvJRM6HQDl3nva3LqOEp
         4zSms98vm3SECwHA4yTBpiamQcbmdMUsIl/V+2efdSlDG3froajlD6FT8if3b0MRbFZk
         lUKUHy/RBiO3MDegT+u/bf3AAT1qfu4CRv2+CyUWkYQDHV6uJA9ejA9eu2dnQtj7P/wa
         gp8pCl9/yi+lZGVrIUpIUQNvRMUowy3+ldtP+MwXRN+2b6S0NMrCS7WmeBUalJgoyqMP
         dRa8+aUg2zalo0h/CoJ9Xxik6Mr4z3GeV2Q7VdeYOlOmgPsH0+/OTjxjnCJz2V6RjRq7
         1GSQ==
X-Gm-Message-State: APuU4Z/2vsFbqLk0UCgbn/MIyupgBTkzUYIfR5IUi8fxWPiAwCkLltPK
	k5y5q4eOGZFXDrNP866X1JLZEtaMCJPIve0QONbY1Sy/9psc51EsiE/n
X-Gm-Gg: AYBFou25FW4qF0/Uz6h+FgcQ/gp/2uBrRVIbEavfV9dfxUb63ncvXmgKJOpy/TqOAu2
	LWqrfb7vABm52OskxaCGLmmAbW2VYjwBMkptY4hAbvLqJ3lxlL/zSw4Vsv2jG+bwhF4d0h15TLP
	2thSRniCsGgn9BQrfF5jMBFhrgqiDfbKNcCS/1SWB5bpcDhELXZuaoM+9QbhEs1QVWaU7pZF9Nw
	GDST59lr02y/9KEiejjH8U1JzhAHaMRHrGBQJFqzyw91a3SKClMPf4RU78Y1sNrzxPZvq3gLBmy
	P74px+ZlhyNe+U0wVRMd4R9BSbsow0+RqqxWxRQWETAWJ75II1PXFZ+4+cczZvnZeng50td9uLT
	rWSi+9CK4Nrzo5gIEn3YPA+zl27dhTtSClaIjGl1rrfKfufMn8rwXJq5IqxF9DkcIdFCWpKWW2o
	f/GHcYLkHx1OIXz2lH3UyvfZnARuwanW5RwW/xi3ROasTYqhcoJbcb2esTZvoJTsaEh18t3OoKB
	GRoiGj2VB29LrbLJc3QKecLIA7kNs/WGwMtDCMUTvc+8u2V8LbT6WbM4Bntyfuow2sbr+UwRf7I
	guWwuW1ORXlTSrhw8dJmVaMQ6KzOrUABVQoMPc7ncRLPc3t99Aw=
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr2999631eec.18.1794147170185;
        Sun, 08 Nov 2026 06:12:50 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm6081353eec.8.2026.11.08.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:12:49 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Validate element info in compat ioctl
Date: Sun,  8 Nov 2026 14:12:19 +0000
Message-ID: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
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

The compat ioctl code calls the control's info callback directly
in get_ctl_type() to get the element type and count.

Unlike the normal control info path, this code does not validate
the information returned by the callback.

The compat read and write handlers use the returned type and
count to access fixed-size value buffers and calculate copy
sizes.

An invalid type or an element count larger than the supported
limit can cause these handlers to access memory outside the
expected buffer boundaries.

Call snd_ctl_check_elem_info() after the info callback to
validate the returned type and count before using them.

This keeps the compat ioctl path from using invalid control
metadata when accessing its value buffers.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/control_compat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 87f7ad5ab739..cad00d4aa204 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -183,6 +183,10 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	info->id = *id;
 	err = kctl->info(kctl, info);
 	if (err >= 0) {
+		err = snd_ctl_check_elem_info(card, info);
+		if (err < 0)
+			return err;
+
 		err = info->type;
 		*countp = info->count;
 	}
-- 
2.55.0

