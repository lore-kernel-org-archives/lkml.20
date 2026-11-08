Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158800;
	b=cKflJ9ccS0aI/kpnBTckK71Hl4fcbFDLXLQPQ7RxYd1ZNkNUo4xyu627QmA3XkTB0Ie3
	 wYDeqspZZrl0dxpf0Y0DIashotPJN4aGkbaqiaiectsL/mCA6t2fBxbSbk/4tBceUarJY
	 HgGaoOOpKgSAnUKbR1ciBc1pTWFlu/t6aq4e1yz5zI5Ep3MEXTWzPlXTLN7b7qo6Rt3Kl
	 idd2MSLiGa7GR/IIRjS8qw6urSAegHkhpjA9w4algFFRvMqZIJZ9O9p7as1PEeFNM4C1I
	 G1sYnsYXaAsUxeM9Yn/gE1mdeUIu1HKDWbdNb8n+FzU9MgSun9KdUny7vPOjdEMlBZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GimyCLzTK2kHf3bS68Mh0aWkn78dhGyOUtZ1E39mgiE=;
	b=N5STAifgaAOLxFAdxzgZlCoGfme0Vf7PKZFJRUkATwgjkZlw7OQK2FFHbikNyzf5AqmS
	 0Gun0NW0soLNsk+mgY+IcrjS2ibtflDslpD1n2zkC8Tx19p36ueKbSMmQMSxyqHWthv2f
	 88llwVtI3s5XuQ/vksfIRbPaNaHwboxDAFyE4SkBrpOOLjgS+/Q/Q0dDmWXXzOxhxAaGu
	 +OLLcM1uoDlL+55CkNEkFpKJzE6CQ0IbuClB2xB8X943DDRBrHbC5LOkAadfaK6hSAtWI
	 dy6SnctPjY6yoDbH/J2Ge9IRhXRAWG9puLCKn13lJcMU9T/DTEqW41N7wLterLxVeCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CaKRpWSV;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E68606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E68606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CaKRpWSV
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso522330c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 09:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794158799; x=1794763599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GimyCLzTK2kHf3bS68Mh0aWkn78dhGyOUtZ1E39mgiE=;
        b=CaKRpWSVvqYPS/l1YHqJM3ApnlGCZYw/EbUdYXjRucRHuair+2CqHlTfji8HgPLM9t
         eGCQsuT2CPMUoVlz6ySCpvfTvUz25Xr/u0vx9ZqCzBRtRrjOOyQPBFJUSkIDXZ6RdNr7
         JTq4m9PmL1Sqf9g7c/sVZfGfk3E+49hh2xEp88hlKTIdnVi1mvtwS6NPNeFUWmQDtwgK
         0Mq8yqCED7nq9/U4TfOM0gB0o0+rJRmbcFkBiL+XG+BFJitAQgZ2VCzT1q3/bZOXKb90
         s8YfznieqLKOx9Rr+5lBXSmtG4MoBhMTFNvnHyp1o8+Znn4nEO3Muu/QQq0aSz/yiwkr
         pt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794158799; x=1794763599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GimyCLzTK2kHf3bS68Mh0aWkn78dhGyOUtZ1E39mgiE=;
        b=dNGibI+w3im9G01iCQdJeiPkNnhf/6e1sHHtFMXt7Xmcxp0t845q5ecv6EthChb0yI
         NNnVD7Vj9TkhQCKm7t0gv1aXQuxwCtyxY/Og1caa1YLQ33cYI4pVt3pckUQjsiQqOnaB
         xYHLpHXuOS/J62fAICbV0UGXtqCU6b4vz87R9O/QuQ9R13Vw1a+hBCh7XAVg+awTD7VN
         gfCLxHmGTPZpsdZ9ug8TEwgeCIMzcU+WJAY5rkyY1sLc52RXLKatVwFQZurK50pln4t0
         NfhYdIxQHl4V9LARjRdBO9WGhZe7s976js3/4BJKq5Ls8Iz2VmaJGaBSnh0bZ2rWTVMS
         syzg==
X-Gm-Message-State: APuU4Z8k+FmtsowGpkswFwMUs6Q1kRTFbIyMdDPtYMQ0JYAAxv5WFDDO
	o0gwrNSWALieHWAieBwu9AeR62zN6VAhmVhwdZVJ1vScQLBPtd11/27/
X-Gm-Gg: AYBFou2xtYrYOhQuFQYnEpg+I5xe4AZ4niA+p4rQFUKgReA3W+sJaPtQzzBs9RM5Xov
	wK6ywZc00QUBNbWbyu05t9jcN1N+6E+MjBNqtrYUziRlIZEbEySKg4/XTpJ+K19lHaor0aiWcV6
	XeNIfv31Qf6f64oQVuDhAUz9OOm2CHMWHK4ZNL3lkoekBjx4Qcs6lAn596dEZ5n4g+yX+/3oUZV
	7bU5lsLji3OZ5e7zUPD84gI1D3g6t0l5MzwgFdVaZIYObdOiabwPijRSFs1Wr1MlVkjVdCbBxVl
	O+288zkuTRGlhCsxT+OEWvvltM/QseOgpJBaXGCIyG/mFeKJb1Iaj+77QuaS7D3ISBVg3HQN/sM
	b4uNBeQVx09cdJlvFHNmCptPKlbF9buAeCmSRm2Z5yQSCROi/3BDQqdOMzoajbcPYoMyB3OLTGM
	XEnsTWbK6NYlvuxe6Obm/dwtFmMHhg2bXQZVY1Xt5VD1+IuCYx0bAnE9/vpK8wr6AYB5rbRDwts
	puU/Zk7HzRwjR9LHdUbuS3QUNShQ2+2OPg3IGWM1z6BRLyLTnanFkRQaNojoSz+S8HgCkVUBsF2
	KoYdAUAjjzChi8VMcojKHWiki3uhjyYz649BvNHt23o7Oy0AmUA=
X-Received: by 2002:a05:7022:3b87:b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b39feb70b6mr3229659c88.29.1794158798761;
        Sun, 08 Nov 2026 09:26:38 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm8095792c88.4.2026.11.08.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 09:26:38 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v3] ALSA: control: Validate element info in compat ioctl
Date: Sun,  8 Nov 2026 17:25:01 +0000
Message-ID: <20261108172501.2887-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
References: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
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

Unlike the normal control info path, it does not validate the
information returned by the callback.

The compat read and write handlers use the returned type and
count to access fixed-size value buffers and calculate copy
sizes. Invalid values could cause these handlers to access
memory outside the expected buffer boundaries.

Use __snd_ctl_elem_info() to get and validate the control
information before using the type and count. This also applies
the same element ID handling and access checks as the normal
control info path.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Use __snd_ctl_elem_info() instead of duplicating the
   element ID handling, access checks, and validation.
v2:
 - Rebuild the element ID before validation
 - Set the control access flags and respect
   SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK

 sound/core/control_compat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 87f7ad5ab739..a9ee5ef30c51 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -181,7 +181,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	if (info == NULL)
 		return -ENOMEM;
 	info->id = *id;
-	err = kctl->info(kctl, info);
+	err = __snd_ctl_elem_info(card, kctl, info, NULL);
 	if (err >= 0) {
 		err = info->type;
 		*countp = info->count;
-- 
2.55.0

