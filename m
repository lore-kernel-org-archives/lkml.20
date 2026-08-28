Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481693537EE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930763; cv=none; b=Gp6lOmpDTXnAThgSxnUzaqV0R2JgPLDsqjswbz/z3vkQ+P1inm4Ip0jDrLAtIWfehRpuyU6txlMf/ZnCCMZM0VnluWfLHnD+rJd/Xa9N6qglI6IDAuboacl1PRI/JA4oRy18HObvBxXEQRLzpzCPPYXPIBtbLIRMWZbxcOVUbGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930763; c=relaxed/simple;
	bh=1j5HoO6Rw6w7CAFZbqcTNA+EG1BhAQMUNIONwCzMFm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSYvsSSYcudXAZwYT05NuxvLxeGVnYDy5+8mWlrIl1XrhS6z1CmmM0a595ml1+4cHdxkMtpzyYmSpwvV4iAgG/6JWEqNR5e6jRQyOFQCDpj+lqmzWELYCnae5U9H4nbFvea0/A/kLipFEeJZziNr5Jw4+Otkhy1aR1NsEmd6dv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lrxer6Wm; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lrxer6Wm"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8200b55dc47so9723187b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787930761; x=1788535561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oIM+ChIl0h+IYty+JJJ/R34I0BvTfYNv7RhSnKuWxkU=;
        b=Lrxer6WmoxXdYAAWjcYgKbTYMH/bF5fD1QALrcqh1qJT5mVisZ3I1vAJepcEA4sL3P
         KXhlK9xKwoFGE5KC7+uWf9goqdlwXquPVv+HNeBPYmrSTiG6Gw+j34PNhzjlQMmzc/uV
         cTTDmiVsMsYkL0eQ9NNfkVK1aEsYwGwylpDqZlLo6FLW4hcWfR0cWdRd+MKNd2J1CzRX
         ZQ4K5KWgb/EEA0md4emDYTsxB8CjSDWNtfeFTe4xeP4nTUMLzRE2JQYGnEyDwpqFb3kz
         P7pQ7XuqbdQU3Ri7vRqNKh7CoY4rn/TBdfy/PVsC2WuVFCiaT9kjHg9OUGZu8+nP7Xct
         eayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930761; x=1788535561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIM+ChIl0h+IYty+JJJ/R34I0BvTfYNv7RhSnKuWxkU=;
        b=BnU98q6uuoji9BocAIxHH3ZP5YPSZQvOr5ML/7NW1jJrxsxNSgH8hcI+td1zrQUG9U
         2Mgtd9Zqx4Jdtbrj1i9c3tDi01nPJIgjqhmlqc0lvNzgqzufCHufyq9SqSdUZrMS+qiN
         lqKiBaHhGac4JmisgzMYqhnpkyo9QzivmUvP85EpDgvean3ki9dxR+Pynj3OGJ7To+Dc
         eHwCIFQ6iprARuSeG1hTcR4v7dTPghKoEPfBPKe4AY1965hw640n7z3tv+dnKDzyu++1
         3qX/oGGOQ6zNKFD+be438Jl0G1gZ8ukpm7kLDiYVw9oS5Wyq7YNnY1aGgLXqedJ1VAyn
         Pg2A==
X-Forwarded-Encrypted: i=1; AKwUvBx0KJDhSv3c5iexfInxgrAB4fUygX77q3ujkm1VmXDoPZEQ1Ll+S/iY6ZZ8HvLuTyFON++1lReTn3WuVUA=@vger.kernel.org
X-Gm-Message-State: AFuF++nH73rQgd3mrXlhDIwHkwWAyahXGGB5k2ydZyzw5zPKSvOzzn1C
	QAxa30myip7r8MK5400vYKv42a41iIG2NLsycFVBj5z6aTHtPWFbLdnTSaWW3e7q
X-Gm-Gg: AYBFou0MzI8tmDpGoO4eFieLIHuw+w35Atg0zk726qk2guPrai/Uvql1eNPGSXgXebr
	zrSWG/ly0c17QQseaUTFXlvq8qbj3YJgRpdxsxdEZPlScX7Q1wKPC5n5lRXY3DBPbFRt7RJ6sqR
	HYqtJK1MEYt32BoSDUv3JcD8aI6vMETiiwLu7FfgApT/lFCEzoJmxn2QAmxEsov+neNiTtqLRC8
	xPijQefkpkYwyfZSjN76/VSrTcQ9MEnPxoR9D2XGKvggPeHd4B6FB6ykua4BA4k/J5EzI0mi1fY
	5ZBGbUnMsya77NdiLeUjuoBnfUjyWHPkOTyA8CdRKztlcAeyXO9/wTeKqCaShibmZrGTpdEdhT7
	LgaLtpeGZ00UOJcNDkVQ76vTkyY4iIWhCZr+MNzKZD1WW15QVWedFB1mBVZCvTqcXpdoQMkzib7
	D7C9NJumhLdIrVpfF/0QQ4oJeNL/lLYoOqdhNiJZcXVVSWRBC/VfVJxuEl7nG8QHK/nm9khPia+
	vTvd5cF9BDR8259Z+lzHXuFdNyyXdK+dXfj18ZBEdg=
X-Received: by 2002:a05:690c:e143:10b0:857:b0bc:af77 with SMTP id 00721157ae682-85d6964253amr26650697b3.7.1787930761220;
        Fri, 28 Aug 2026 08:26:01 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e6756e0f3sm8064327b3.43.2026.08.28.08.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:25:59 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH 0/3] media: uvcvideo: live pan/tilt position on the OBSBOT Tiny 2
Date: Fri, 28 Aug 2026 11:25:54 -0400
Message-ID: <20260828152557.653475-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This replaces "[PATCH] media: uvcvideo: query pan/tilt position from the
device on every read" [1], following the review there. The approach in
that patch (a driver-side VOLATILE flag with a separate live buffer) is
dropped: as Ricardo pointed out, a control that carries AUTO_UPDATE
already gets re-read from the device on every VIDIOC_G_EXT_CTRLS, so the
problem on this camera reduces to its firmware clearing the AUTOUPDATE
bit in GET_INFO, and the fix reduces to a flags fixup for the device.

Patch 1 reports V4L2_CTRL_FLAG_VOLATILE (with EXECUTE_ON_WRITE for
writable controls) for AUTO_UPDATE controls, which the driver never did.

Patch 2 renames uvc_ctrl_fixup_xu_info() to uvc_ctrl_fixup_flags() and
calls it from uvc_ctrl_get_flags(), so the per-device flags table can
correct standard controls as well as XU ones. No functional change for
the devices already listed.

Patch 3 adds the OBSBOT Tiny 2 entry, restoring AUTO_UPDATE on its
CT_PANTILT_ABSOLUTE control.

Tested on an OBSBOT Tiny 2 (3564:fef8): pan_absolute and tilt_absolute
now report volatile/execute-on-write, and polling VIDIOC_G_CTRL during
a commanded 60 degree pan returns 0, 21600, 46800, 90000, 115200,
158400, 183600, 216000 -- the live position -- where a stock module
returns the commanded value from the first read. Reads also follow the
gimbal when it is moved by hand. The vendor was asked to fix the
firmware on 2026-08-04 (ticket #8220); no fix so far.

[1] https://lore.kernel.org/linux-media/20260725212332.64927-1-jordan.mymail@gmail.com/

Michael Jordan (3):
  media: uvcvideo: report AUTO_UPDATE controls as volatile
  media: uvcvideo: generalise the XU flags fixup to all controls
  media: uvcvideo: fix up missing AUTO_UPDATE on OBSBOT Tiny 2 pan/tilt

 drivers/media/usb/uvc/uvc_ctrl.c | 107 +++++++++++++++++++------------
 1 file changed, 66 insertions(+), 41 deletions(-)

-- 
2.43.0

