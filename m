Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E9C3DDAE9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872914; cv=none; b=upPSp6+ynf2TCgT8kT+1NRATwW4CrtxULLPlyUwWsd/idJzSbIiAxScerME6bUQbRvPZDy2faQLJ+09MeV2136Siqj1TRAHv3BbZh6vrxklRy1eHLu4MxfiBj5nQz50kz4dPUBKn1We1qfJ8UZr3n3AIDM5bDDuIufFy3y7ao9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872914; c=relaxed/simple;
	bh=/kD8Dn+Vjj/4MegsD4HTU4Nit4nbFX6TZSxPnGiAjgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opEONTPdSm2c0lnl2kqoTLfsTHEb/+6rJHlsLvQ3AbdfD2HnXN2gri47645OSU++7T3w/SakO9tkmdK45LLScQn/J6E01gNE1j1qZ3HCRBmnbsn7S0TLaNexcsZIeVc1UcQIgULetxdQd7sHlp5ihJcKU+rL/l8pNyqFBd5vdQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=howMAKdC; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="howMAKdC"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so526721b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872911; x=1788477711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opegbFI85ijkW61XNldND7ey1Wsmf3PxBxL8sOVvLZc=;
        b=howMAKdC7LAwFWHdAPF5hRUagsznDnow/xQMMBBQ3h96qs62FUaNSVs5BqQwaNwyKY
         dAEQ8lnYI2CpBpBQ/WvFb4V0D1n3Ae3jOsiEBSwZa7Yq0uldLZNLB9dv4q5KFGQz96km
         JgGyO/yvwZBOsjC1C0H80LwCK58/0KZ5IIPoK7u1ugw0lVs6gD637la8spnQbWnzTpoK
         54uqwQYsO7bUq0UrJKp5RUwi+2yL71u18Qp5HPGJQ33dHhz8sDJPtNpQIs4lWz9qeGuw
         wp1KNjtFb3a6VcESWgt8/qlOul9heOlMRmr2FuezA9Ov/zhUUMG15k4AXU3hNXcGzuiX
         Gtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872911; x=1788477711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opegbFI85ijkW61XNldND7ey1Wsmf3PxBxL8sOVvLZc=;
        b=r8Hpde4w0TlhFwTjVvTNmrgVNkFy4i1R7tggMX543pw7Srg+RShQNj4914c8qvKcrn
         SZKLiQ51HVGcJjhPrPlhTpaGInnxvHD25xcgDUFB3x00UUQSQImloNKwPNeujhMBg0jd
         QU4hdDOCtx7/D+xhaMG2VNfAVVlAHRPTnqJoJmSPyJnKLGO7s77ZQDmDZm3t6TJICkzk
         YX8kLNwivgpMN88qr1kt8hY7gBdWWLT322Gu1zc0FIg2+5LBh0KqAYMIf1WRa7IQ2VRp
         bVLLgLgHypet8cKe8PkKTdyxavjvhSAmNvNafYPHVZB5R/BZM5GkKm4cR6X5kEAsTbrq
         jBOw==
X-Forwarded-Encrypted: i=1; AHgh+RoJKppOcOu/JekWtIJxWHf4iUqmg058/Zi0EHnsFKfgCHKkQTOusITCaLn7rcuA9wa68DGGuHGcW7h3lNY=@vger.kernel.org
X-Gm-Message-State: AFuF++mpOaqJaIczt5RJU7HM4/MmsOjsDS3oupPSHvpyypxQLHwJGwn4
	GNr++SdzF/R4gaBHwiWxnGYmJGGawpDuSmgvDV73ZK2Yc/Q28+9Gyujz
X-Gm-Gg: AR+sD10snksboq1qPUZG8NKRqVU5SABlOv17xd+m5jdNei0BdjXKvjJjkM5Pcw23q3A
	hrbbqp3iKMcti0gD4q3MfK8np+qxGPL6WOSy/pyJCatxw1XLr/18XLgWFRnjdMnM9HHEOkJIkVH
	Asgv7/K1d+Lt2hj3VAry1sOotRsG6HaLivxdJigDuLsnPiB8/o9cbHiOXd+MepDc8PTEV0I2+tu
	ya7c04G06zRVLnj3/K5HjF5x/H4Fn9WJYM/m3gJcH5C4WxiWl1lx2mFFAqZKrb3eKlsquD6o9JU
	Wn769i+UFiFyQdA8h7xaSfW0Mw6ufOhTbbCy9ruiI7Rr7QulGxOHTPDhwNUyqmM2LGjaCc/uWNU
	j9WC9CFGwHF8jOiZNJBx/fDNGGWSLvxZICLaiCYao1dmAU3zLCPNY18tWCfgLDhiJtoW8VAN9R9
	tKhE4nbRWfGzTyKpbr+KbzDWnN/FBWDV1VbilNXBcWzG5lAaYF3wJO2ndIAfabQ8+87U6yyFBi8
	xkPTw==
X-Received: by 2002:a05:6808:c3ee:b0:4a3:3108:866a with SMTP id 5614622812f47-4b3982eaaefmr3092039b6e.17.1787872911304;
        Thu, 27 Aug 2026 16:21:51 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:21:49 -0700 (PDT)
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
Subject: [PATCH 1/6] ALSA: usb-audio: Add PM guard to Studio 1810c controls
Date: Thu, 27 Aug 2026 18:21:38 -0500
Message-ID: <20260827232143.149197-2-mrwillporter@gmail.com>
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

The Studio 1810c control callbacks issue vendor transfers without
preventing runtime suspend or disconnect. A transfer attempted after
runtime suspend can fail because the USB device cannot accept
submissions.

Take snd_usb_lock before the driver data and USB mutexes in both
callbacks. This resumes the device before either the state read or
control write. It also prevents disconnect cleanup from racing the
complete operation.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_s1810c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 2e5a8d37ec57..bdb5e3aaff3b 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -474,6 +474,10 @@ snd_s1810c_switch_get(struct snd_kcontrol *kctl,
 	u32 state = 0;
 	int ret;
 
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	guard(mutex)(&private->data_mutex);
 	ret = snd_s1810c_get_switch_state(mixer, kctl, &state);
 	if (ret < 0)
@@ -504,6 +508,10 @@ snd_s1810c_switch_set(struct snd_kcontrol *kctl,
 	u32 newval = 0;
 	int ret = 0;
 
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	guard(mutex)(&private->data_mutex);
 	ret = snd_s1810c_get_switch_state(mixer, kctl, &curval);
 	if (ret < 0)
-- 
2.47.3

