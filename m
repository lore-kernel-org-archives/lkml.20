Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B2F23909C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434424; cv=none; b=c6FVsbbDLkPWTqqBHBbJljMg6CcZyU12cpuVxsfl6BR+KDfU9wLRo+qd2epGYZFiaOATVMjtu5ErkLMV78xK4rG6WULmQo9toHmkyYONGt+0r5oLSOFIn1L59HPXgXLrJMwLoslWU+RncsR46H65te3PfkBLsgcH9mQdIw2IOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434424; c=relaxed/simple;
	bh=iIyopcp0Eg/79/p+GJ1lsh5nK7teNzKfmi2LjYujHxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/angolljadvAj5ljt7J9OVWFvkqaMTuSOi5Anu/GQOzKQopndTdijg5eFqqhUjsA39sE6Th6MVtXIw8bM63/TG0MJkkdfx9OJ+zuAfekGtoVopIF8N11JN+StJXTjXJ17uPxn7nQI4xwhsq6SLFHqXq8vILurAnnNaGnzpv5Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOSFGeoW; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOSFGeoW"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so2119387b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434423; x=1790039223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVj6epRXvsPg58PK1Nw02taxzApo/fNJ7ozze0TGnPo=;
        b=AOSFGeoWvSDjDyLnPU1zsuYbTRxJsY8envzx1tP0fWXzOGoHDsbQOKZaNN7RVaqnkw
         GHrb3zLL60BbWZu/DPsvJ9Sos9QB56byniLppDz2qIL4bAbIH5fZH5HupV+VuLqGmaxd
         C/MLJiJr/ELLS3e49sXURewhStHW8b3P8M1/oxkZeaV0ApM/kSwOugxX399k3Uih9Gbl
         7VE29RfLFuKGRFbJ4qvCdxzhqapBLMwhneWVTcTIiJy6dUWkgjYIyE2bNemRyz1u5PlS
         5ySiX2F3Zoj5zVBVb6aroquiniDl+U9W3RC70qNXWOSxfWHtChyu4sOMUN8N6oPcs8ha
         xJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434423; x=1790039223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVj6epRXvsPg58PK1Nw02taxzApo/fNJ7ozze0TGnPo=;
        b=XGRO/wx9XG8oPQMpN4SNo1QCLQx0P/zNjJwdQwstndUxa0HPxDMr+OUTzgpU77atz7
         KyAVkzqYIODYU9m6o4edL9qafiHn2OkldDlcJZagcg/ZaFgWVpNET9yPQw9w2zLRakhC
         xbWZ5fvcmmbho3lkyeNOLNYbB52njrVCSQ9qdnAh7FDTzoDoOJnD0JYzmjT5FPCmdbHI
         L9Tz9WZnovf+xwZcfrsdexkmhMcLiaYZ7OEQ5/aZx2AsKRVQ8TkRMrTjK5IyD6Q3CaoZ
         15GV/VPc9mGuAj+1dPODkoBRLGPyhnc+u6/3LehWret8FPW0EJ1X2p0MnEKVmMnnC6OJ
         l97g==
X-Forwarded-Encrypted: i=1; AKwUvBz5nVgSYZ+wvcvQggcUa5pdc/9nfnGr1Tx12uWAwlIIaz0n1WQaGS0x1EKebhSr2N3R8+MuAlff32yVVbw=@vger.kernel.org
X-Gm-Message-State: AFuF++lpU2oMtu57YU/i4YRSFjuuFZFQ77zzvbuDE+zp6bYyW2q2TSrv
	1Y3faKSuEwlnvxOQnrcy8+9NhGVpiccKN7MSZV03LilAjWCN0iWXU7IV
X-Gm-Gg: AYBFou29dBm9zbyt2ENKTHFV1oytvagOCg4Z2hzj8WCgUwUtssuPJ9aq2unoPThnWAt
	ebizJ1H9PRgKuCcSQ5XMrLEuKDZiTwGFKlY6rNNzS1jlkjD4z7A9m+id1M1XSS5O5TZbz1mJ+VW
	cZKDteeYYnJwFh8Ys0sFx7ehRU1tgU5zmBgESlIVs88UM1XIJG8XsnlV7rGiQV/94Up5EYHgeCB
	mq4zVs1rt93qWZspmiR9tqR480QNHb3AnBkeYhbUBc7mOcxdX3d9CveGT4ZThL37JZSE8GQDQYA
	4ZcnScplspxO11ZDGiN2ORmqJxY0f7XbrzCAJK7AAIa31DPimooCD7Tm1jBZlgcfjSfqMmlXy6Y
	vY8T+r1NiV6BZhCjGygBdS7Y1Pg6s6mv+jfrtHh14c2Caafggzm2Yxqjw7yrsguu0ikfZoaMHz2
	aHxsSqmoGBBGbdrwbvaL7FXmBHv038lsDt2kxEPY7CE81i3jFtVelwUbwmtJRbDD/RxN6LffcdO
	U/GC/9tKqguUwXpWgirheYmayQ+NHvOr6cm+HP/EOYY5TfDicCE/YoX2nNjU4UuZedlkggUd4XJ
	DIR6lUDjMc0hDmyMe2BkSvXiA/THcTd96R3qBipxF25GTvdItc5af5Dr2AyRCxnz
X-Received: by 2002:a05:6a21:3a94:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3db404f44a7mr13467755637.12.1789434423035;
        Mon, 14 Sep 2026 18:07:03 -0700 (PDT)
Received: from rithvik-nitroan51557.tailece47.ts.net (23-93-86-111.dedicated.static.sonic.net. [23.93.86.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33be20c67b7sm3077346eec.15.2026.09.14.18.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:07:02 -0700 (PDT)
From: Rithvik Vibhu <rithvikvibhu@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rithvik Vibhu <rithvikvibhu@gmail.com>
Subject: [PATCH v2 0/2] ALSA: hda: Fix Acer Nitro 5 AN515-57 mic switching
Date: Mon, 14 Sep 2026 18:06:55 -0700
Message-ID: <20260915010657.36140-1-rithvikvibhu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <871pavol7n.wl-tiwai@suse.de>
References: <871pavol7n.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thanks for the review :)

I reworked the fix to use gating in jack.c. I believe this is what you
meant, and will fix if not.

Ordinary gating still requires the microphone pin's own presence bit.
On this laptop, pin 0x19 can report both false presence after S3 and false
absence after reinsertion, so gating alone does not cover both failures.

Patch 1 adds an opt-in mode that takes presence entirely from another pin,
using the existing gating relationship for callback propagation.
Patch 2 uses headphone pin 0x21 as the source for headset-mic pin 0x19 on
the Acer Nitro 5 AN515-57 (1025:1539).

Based on sound.git for-linus at:
c9e6e5f38bf75276605f1952b22285f5f3abcaff

Previous submission:
https://lore.kernel.org/r/20260904231545.33505-1-rithvikvibhu@gmail.com

Thanks,
Rithvik

Rithvik Vibhu (2):
  ALSA: hda: Allow jack presence to follow another pin
  ALSA: hda/realtek: Fix Acer Nitro 5 AN515-57 mic switching

 sound/hda/codecs/realtek/alc269.c | 25 ++++++++++++++++++++++++-
 sound/hda/common/hda_jack.h      |  4 ++
 sound/hda/common/jack.c          | 83 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 110 insertions(+), 2 deletions(-)
