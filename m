Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793132988;
	b=GG14gSOOAXU4+pmyN/Ftm1p+96WDQVDd9uDR3rXtcw56PNRo5rR6m+jE23PVLUY0Qt7K
	 72jPhmp54/65sdYmyxa9JO48gSRjwWpr+BPX4qN1r6XTWoWqAC+nNYxOgUhYe/GCq7PYK
	 UPJjvCSRhfFO43xwiYsl52Gd6eWfVfc3vO+Zgg3ZonXM9I9BLJeeWPN6X+PKvZGEkT+us
	 kMBbX16rnlrktjUGTcKd2NlUmdVknqeXCfuH3xlgPy33HZyUyRTOard+inoOMCV8z4pEB
	 DNi/t4ePJxZ+o8ka3vVGMiYEUh5KajiIbX6ghCLWTqRZqI5BVX0TSBfcTj1tYPpUVDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132988;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=AyVK32z5B5Pj4unDquiQhRrEdn3raP4zBUK+ARpmv30=;
	b=UN4W7tQl0g8liml3gnpP8HTKxGrtnu4KcfAkuR8ko2aQg7Oj1TwM9wnRXtx9QfiKMnSZ
	 0ZCBSTzHk7mjyKI4hvu5Jvyuh05Pztbg30XjnQauFya3MsnwFaKvFdhHYNgxbXSjWUqHI
	 YxZkImFXLk4LmnIiY1xG1FX6xL/WyV03Dmaypa4M0Ew6efWjCEgp0xYpUSBsme7o2O/EP
	 U7oDR/R8/yIu6p6Wv4/duaoxGe4K+rJ6cNhHwfWu2Lly1LWpgxyxT7le9HXaa6ouC7hD9
	 vVoli1fL/zRLO2c9tXBs/NWhcJBOok9sjwOqhNbNiMSSTptQ5U70JLsAiJM5U+9lMow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNvYqS3P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6C9606A31A;
	Tue, 27 Oct 2026 20:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNvYqS3P
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793132987;
	b=x3zcFhwT9SBgjkus4zyA5xKnFEJgN3M1BDerqpXIeF3dKirISUPGyFm91Qda2z9n/pWP
	 pzp/TBTHy+5g4sSBCTmNzFfRpzqX+/cNXxano04R39H5BRStc6bZlomiMbE6aleJQdyac
	 uRN4Oh/KuY55GraodS/MhujEGLgEtJNMqyrbCS2jCe/0+OfirycC5ULQQ2sFMMy2Zy/LB
	 wAPmxEnn9FYOSsf4bCuu9Uf3fzdTjYz3sYsMTmsdCWg8iy9dx2zJvaq3tlkI8yymBqvGH
	 BvyYYrTozKHO4qCss/MXEknOjPGZCf47Cj24cbOgQ8SxQOf8zddABjqJt0lQV5PUwVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793132987;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=AyVK32z5B5Pj4unDquiQhRrEdn3raP4zBUK+ARpmv30=;
	b=v8IzmdNNYVXriQS0z6W7Y6ZZ8fo7MiQ83s3zE3vQxK8CvEvxzYlVE6SLEWZ24079fgOc
	 869uO2klysXZ0/In+Va7zSpGeU/catmSC8fC9ZD0YCciN39n5Clw2B6J4vtAVT4KkRTzp
	 eyJrktJ+2kt91NGKVmIvzq5/elP0/jkVDQFVopDYHLXHLYaOaoKb+Pnds5e95OnzDWaGf
	 Zl0OFG/ukQIRQzukyrtys87Tq4yrhx7JSFcejOeylkPvhAu+eS7ZSnfzKBxqgD5SSl+Su
	 B+g0wG4bdTW/w7Ni59dQT9Rk9MDEElfcp1Z7RgQRaYtZ5PzpBI+V/OEWj2XPE43tL/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A70F11F01825;
	Tue, 27 Oct 2026 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793132987;
	bh=AyVK32z5B5Pj4unDquiQhRrEdn3raP4zBUK+ARpmv30=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=JNvYqS3PJemCJS5UGfgrUgaEQUJCXATHsHw44V/+IeKFzvwOCadTv3bPLlJaqRuTF
	 5NVS2jJ3s5bLT4zjfxFwi3N/HpL8xdnF5tBxknRRl6JMnW0kle/EynvW+JPcsCDrud
	 nA3rFlPiIhXLIy/HF82vjvrzaQFm0AjkmiIkp2G/juEtHaxTv90HPybQy58EsPpBX1
	 DGeP7OLw7W5Rxf4TBoawp3ZH0s/QqbYcTqsB627+0hz0vhL6mg1NpQCgTI3dJmI/4z
	 nSFqfQu8BUL5m6B1f3VD4g2EoU4rKhh3FrM6Y1YRc/mHoCJm2q6MNVrxfgr5ht9lUf
	 uJXFT6zMcFZxg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0B7F0451F9;
	Tue, 27 Oct 2026 20:29:46 +0000 (UTC)
From: Marco Ziliani via B4 Relay <devnull+rylos78.gmail.com@kernel.org>
Subject: [PATCH 0/3] media: i2c: ov5693: Fix mode changes, flips and
 autosuspend
Date: Tue, 27 Oct 2026 21:29:44 +0100
Message-Id: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVhpKWuIhbUYCyQDiIRd1csv
 7z87wIhzyRQRhd4Olh4mQPSOAI3NvNAirtgwARNmmCulkMbm6meTxJVkEObayxs1kBIVk/fEIq
 q/i17O5Hb3g+47wc/tte7cAAAAA==
X-Change-ID: 20261027-ov5693-fixes-8ec29752893a
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>, 
 linux-kernel@vger.kernel.org, Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793132984; l=2340;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=b+xs0p06/qWDzb+PB6KudqXqlOojT5He/NY8G0f4Yus=;
 b=bYnjA7bQi0B7AN/cS16FsNuFrp6oV/gD/3QR9pnQNOLPapiYWOIPuY+4LmsWbtgXL/pv4DSPH
 uGv30dHlRncCXFdCozIgweW1w7f/f/XW6eMuOEalPLB7fbGmteQCh/J
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=
X-Endpoint-Received: by B4 Relay for rylos78@gmail.com/20261027 with
 auth_id=1333
X-Original-From: Marco Ziliani <rylos78@gmail.com>
Reply-To: rylos78@gmail.com

Three fixes for the ov5693, found while getting the front camera of the
Microsoft Surface Pro 5 (IPU3) to work, and since tested on IPU6 and
IPU4P Surfaces as well.

Patch 1 programs the mode registers on every stream start. They are
only written on runtime PM resume, so a format change on a sensor that
stays powered never reaches the chip. This is the ov5693 counterpart of
commit 4e1446ac169a ("media: i2c: ov8865: Program the sensor on stream
start").

Patch 2 keeps the reported SBGGR10 order when a single flip is enabled
at full resolution: each flip moves the Bayer phase by one column, so
the output window is shifted by one column when hflip XOR vflip.

Patch 3 drops the usage count at stream stop with
pm_runtime_put_autosuspend(), so that the autosuspend delay counts from
stream stop rather than from the last resume.

Patch 1 has been public and in testing in the linux-surface tree since
2026-10-23 [2]. Simon Kruse's active state conversion [1], posted this
morning, makes the same change as part of a larger rework. Patch 1 is
kept here as a small standalone fix with a Fixes: tag, so that it can
be applied and backported on its own; should the rework land first, I
will rebase patches 2 and 3 on top of it.

Patches 1 and 2 were developed in the linux-surface tree and tested
there on a Surface Pro 5 (IPU3), a Surface Pro 7 (IPU4P) and a Surface
Pro 7+ and Pro 9 (IPU6); patch 3 follows a report by Dario Manresa in
the same thread [2]. The three patches as posted here have also been
run on a Surface Pro 7 (IPU4P) and a Surface Pro 9 (IPU6) there.

[1] https://lore.kernel.org/linux-media/20261027074933.21921-1-simon0x+git@proton.me/
[2] https://github.com/linux-surface/kernel/pull/181

Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
Marco Ziliani (3):
      media: i2c: ov5693: Program the mode registers on stream start
      media: i2c: ov5693: Keep the Bayer order when flipping at full resolution
      media: i2c: ov5693: Use autosuspend when stopping the stream

 drivers/media/i2c/ov5693.c | 71 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 9 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261027-ov5693-fixes-8ec29752893a

Best regards,
--  
Marco Ziliani <rylos78@gmail.com>


