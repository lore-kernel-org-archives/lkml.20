Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0FF4DE711
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609059; cv=none; b=irYnBD/ajiG9bTYDZCvuQz0ohu0D5rTLeAAFJDrUqsi1Nt4B4DwLnwxXKqXM29YEY3/VHDBfjbu+OAoANrll53SIaZvWOtQNV+1lCIssjAGKaLmewNOd+Sj4yKBqjjfjSnBiUKzP9FanuQdRoxsqeadabXff+uC3NcwP/duqkgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609059; c=relaxed/simple;
	bh=m6NkKfJ2eUMPESEJU4xtO7u1FNWxawpFcIj5o380cfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbUZld3kz8w7ZDgmXw0sBv5HPs4EQ/TTC8ystghefWPrGd9f3J4oBpkf6wDPzDAV3rmzKN5y9cSvl9HwaMA2FZxkv9g7OlDIQomxmeheZHig/b/uCmmO+sItCIb0anLH7l5+62A70UX9fkSuCt/h0Iq23bK2NREhQGuDuBNALp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8w7DC9s; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8w7DC9s"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a7e4be64bfso22754317b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609057; x=1791213857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgb1OK440bU+hweXcuCE9wFg5Dp8qFGLeCIFKDAmwek=;
        b=c8w7DC9s2sT0Bi03a6ZtymfmA4RaSn13A0KXKQRiqqbVBsf6sI0xtSjQScF23mRnP/
         iQsKhUkQ/mSR3VWtWUBb0jDuqCEwTymQXsCsGfqPGJXIxOUsajv6bGzaN5MLVEwRupwt
         3mcOTNT8PnAtGGhCKN2DqGXtSbZo0UEa6zPcvm6bTUIEFBG0EcY83nwYtT2HL6qLrTZ/
         yJbWDc8VecqgnCI2bGRp9rJjCXrRRI1s4teIEsqjgQ8K/fQLseXcTHVG1QyZEct9FFct
         HX7fiZ4ywPn4qDfaU8RkRp0aI4VD2atuA3gQd2Mvl7RIzd/3ULGg5M1hgeBO0vRlvM5J
         O2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609057; x=1791213857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgb1OK440bU+hweXcuCE9wFg5Dp8qFGLeCIFKDAmwek=;
        b=nS+8HGHljIWZaUihHsjDBdvKNscNrrcda+2D9uNtqBg2k3sLHnCs0qRsBAVwRtSGoy
         KkLw6j7OmlwwlV+TnGpCSbnt+e9R841/JTplGCYLNQZY+UUVLiVQ5FMXLG9VwcXT5pNJ
         H/8ZT0TMHV7Gi/yp1OG0kKjvjsDZ1VLsTR8DEHBYkUzhImeAlEfij9rGFz2LFogZhFBc
         AoWunnqSOR6wNsCASuom0/PaY6m0BMpxxdlazq41X8BP+gFJVxoK7CiTg/j7Fjg0Qiuz
         pNunmZj8Hp2gG5jgqRSvHEc3M81eYheWYBRAaht6TWD4jrGsMDdURP2E+4kb0824axqu
         C6pg==
X-Forwarded-Encrypted: i=1; AKwUvBxKMe8Fmuw4fNJbKCpWE3myVkdYEadQM7N6XT8eddLDvZRYPdu5KEjReNqbYKJTKitLW+0OvT9zbl7D87Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuYS3JSu6zqpBsnMDmP3S90g/zwnHIaFbi8HWLjuMIYRd45av2
	N4yOQDg4T4WVVtQBSbZTKMAy0NfmAMP+OmQh7qLV/JCnRLfvyNmAGVZY+ygLdkFOhK4=
X-Gm-Gg: AYBFou0CVtirrY/n6B5h5N696z0KL+UJJrM6siEcy2kcjsS6s6YYkSD2xN//TaTJJAF
	yQIyI708muZ2qp4uHkZTKno9aif/X7JaDYKrJasKskxeS4aF1t97Ldv/wmY5yb9N6Q02+RCgZfd
	CVqxTCOWTy/468ZM9ZR9STOCobrKRonKkf9B2sM5IhXC0oGDViNpSKpdI7sN2oqNtajnrpyRBPv
	N5umNHJxCnlNS3sx2v9ck9s+AqAVrni+lBNVyXVw2eDez+OHs9sgbOr9NF1nqv+HhcI8dE4ws8u
	JUoEMaTrxaugJzce/kKdpAcs9vr/VfBCtzpssqTW8djNpq9AALuqtngtJFjaYqdiJLXrR0ilBrT
	lrfA3xaLyxjUhBH+iIRzz/XAdVnpvUoaIzpnlBFmDRBk9UWzURs94WyWKu5t2KeUyMibhwbXOi/
	KsON3z9kgqMPUrVXSiafxrwfEXIeKu4h9Iz+v59wCXsq+CIL6yxuK3YdLmZN3vTh1x2Skb6W+SS
	1zUkFLoo/oYYkWfo+x5SZ0wgS1TvITBHOjO5PpZ7EzsHZXanIDiMg==
X-Received: by 2002:a05:690c:e3c6:b0:8a8:e0c7:dc3f with SMTP id 00721157ae682-8a8e0c7dfbemr25887877b3.18.1790609057615;
        Mon, 28 Sep 2026 08:24:17 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f882ddsm45777777b3.21.2026.09.28.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:24:17 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v3 0/4] media: uvcvideo: live pan/tilt/zoom readback on OBSBOT Tiny 2 and Tail 2
Date: Mon, 28 Sep 2026 11:24:12 -0400
Message-ID: <20260928152416.766957-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tiny 2 and Tail 2 clear the AUTOUPDATE bit in GET_INFO for
their pan/tilt and zoom controls, so uvcvideo caches them and userspace
never sees the live values. This series reports AUTO_UPDATE controls as
volatile, extends the XU flags fixup table to all controls, and adds
entries for the two cameras.

Changes in v3:
- Add Assisted-by tags.
- Shorten the commit messages, patch 2 in particular (Laurent).
- Patch 3: move the table comment into the commit message (Laurent);
  mention that the device sends no control change events. Kept
  Ricardo's Reviewed-by, as the code change is only the comment removal.
- New patch 4: the same fixup for the OBSBOT Tail 2 (Hans, Ricardo).
- Picked up Hans' Reviewed-by on patches 1 and 2.
- Rebased on media/next.

v2: https://lore.kernel.org/linux-media/20260902002553.34839-1-jordan.mymail@gmail.com/

Michael Jordan (4):
  media: uvcvideo: report AUTO_UPDATE controls as volatile
  media: uvcvideo: generalise the XU flags fixup to all controls
  media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
  media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tail 2

 drivers/media/usb/uvc/uvc_ctrl.c | 126 +++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 41 deletions(-)

--
2.43.0

