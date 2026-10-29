Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266083;
	b=URj6kc1y+aEhPs1fZeLtNoKny5pAK7gElGumQF65ktm7zlPiKwJZDUuSDgAeYxyaVG3Q
	 FHOaNZlhjVlmNJLs7zvSbhOBe7CzgzR/OA6Rm6MYgNG60YlCEeFwqw7LnfPhLjX65AkaZ
	 8GnpzUcF7+GB2MyXhs1KCr1YQgReCmt9zRm+bhLHcPtT5tNXwMlRpzMf/A601T1o2R1A+
	 o8kK5KLU9CCefpSSiNNT5zNTIdcuwUey6KdptIwD/ZyV2Cctaw440VAvZH+lqoF4D/Xo4
	 yFJzdYSyrpovDFkM4cY3QsTyXg0ucQ6/nbC7r+RdE0jUAIdfaDbIZhrVz7UIzByUzGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5zdr5q0MxiovcRnfzUe2SVTt891ZTRt93a2yHAzSjag=;
	b=qkx79FHptSjOVD5dErxSI0QygVMXBzN6RBUgPmH2jPs5LIbf1ZtKsgbfECLRPiXWQIZw
	 tzik2lAE/+Qj3iVcAmql60M0DxfYzhqah2T+t8ZxAHVLUN01GQKtnwqDXTnxdKWOj8YjQ
	 UFXx173rLX/hBb6t/a34124cxjy5Y0PcOwQYFnW/caIWqTXJTWe4pHjMCK1X+IkJcgnJd
	 uG81l6ZXXa3tZyoydLhfqldscsNyo6dNSqvFMLE19zxl9R7ZoFYc//Q81QVxRX7P1VecA
	 ZDUGVjnEldHttEMnhIzGQqV+zcGNMZ4yrhwigdNdFiuycYXSxCqiX+/qD2xumXl0zow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rx0KOKVL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1687606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1687606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rx0KOKVL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so16803365e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266081; x=1793870881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5zdr5q0MxiovcRnfzUe2SVTt891ZTRt93a2yHAzSjag=;
        b=rx0KOKVLhXOLtgkh6gm5uFMNwfyeKaEo149+rYwz88BtAbZ8e3yPhQrXF1NTWVh0Op
         6TY6jVOclWcQrolsMh5kSjW9VNgK1PJ4MbQpX42ACCuI8kUL5W7gWpSHmitQy9i7dVe9
         uftGbXy+aQwN2hgmSkaZJb8fi6bxo37JMHp+4dwa5TmLIBUXiBcC11irG6AqbNv8hNJK
         BDhXTZXrLBlYa0ViSrm1sRInTYFIKrj27jaRbOS2e+cYF7biFWFO7qquAhFiLWGWRSpr
         G4e+H+hHQMZxz056vUVrvygzUOqlRtek7Eu8NmaMqVtOvbmLp+x/eGA9CXq+QvdMrEGu
         xbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266081; x=1793870881;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5zdr5q0MxiovcRnfzUe2SVTt891ZTRt93a2yHAzSjag=;
        b=rEc02Psv85aphW3lvU90RRYImJdRlOM1uz/Yz/sK/YRA8ns+oltd/qGnbDEKsB+I7g
         RpBEX4BxUgU7nAgjO/l02HLkFSgfgY95q/zt1KYD+g32h5SJwiFdPjCNxzLvR5hBFwq1
         /+XZW6/LgsDYVzDrnqF7qBmDQifDOLWIgF/8ly/gReUQeVltAyYwXM+xCX5GkpA/a79A
         1/8BVD8rYVAfDTKut4cvFBwdHsmA7T9qpvXmarchv8WGaziJ+ZbU/PZuQ8ibqSpc5JDT
         Q7Ec5a3N5p95BCxow+DzUc6IhRUisElmHVWB+D8NJp5NYcb5SkmQcn1q9Q7zwRBRmH19
         IYLQ==
X-Forwarded-Encrypted: i=1; AKwUvByW97EEDxHKPrGe7ceCXdK4C3SM0yANK6O2Rdh/wQStD6m3rXaU4RQSN5mJdF8erWrNqOEd0P8+Z27gCQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYItBGGO8kvsL7mTV50FxIIWnV4+PhhqzclcS/tCATs/aJSkTazs
	dheVDallQkyaVbRVLZUl1HB24bcP+RN+lSdrOq2m/M48Ypwziuy+AP2h
X-Gm-Gg: AYBFou0/t6JTvj0TXLlrP0cnkQv7OkUN159/P7l95r0CTSWVElz3/0QYDkoDRKltdmu
	ehkbs0n4fR6HZNGj8Ur7np15a/QVACvA+2PpHfau8LMyIxxPxac6pq78yC4FN7sRoDUwkCXZ4Db
	qGIqE3Lqd1mq6W7q5RwFq1EBuBr3ESaCmv0NlWktVVp98XDIgUVX4SARaoDq7GZP/tivVycUq8R
	FtoTp7O11jeQNnIOzLHjOXp74eunaMaO0wnWHndw+OtBgGM/MqJ98xm3sAdb0GfxmZPjEwsNPlW
	mdPW8UqFmDcO1HMlA0LatQ5/uwgRG4SBoDiXefoN4gMVFjKKU/Db1S49FnfPrdGwQX7dzNHiyIk
	3EiNooP6ThFBQWN6Z5C2M5GmnyFm/UkDDNaSIkq6mNdA4OdX2fp4kt6xDK/z3kMr4Zn5KoydC8c
	CxoE6iwc66zbY6KRmGL2GCm3YORN7299/aG7GjtDwkRgpQ25ID2elrFdKwsm4ZvuacYrrT3h0mi
	R+5al3alIMTQLuQhjXs9jE3wvQw98efzMvi1tCrnnr+QnfeC5ic2UAL9DyIsiOmZzJFvh1S+YAM
	URjz2SWJxkoi1s/AckbEdwayHZzReYsV62dwPdhopyNJjszvBZXhj8oXCycDbvFpJIalUTmrlSW
	TzMtD/QNnKvBnSzhuF7utwJImy30fRhEAkVElFK2n+C9QbL+fp5NtMYM0caz507Y5tqDq
X-Received: by 2002:a05:600d:604d:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a966c3f65amr108419745e9.21.1793266080986;
        Thu, 29 Oct 2026 02:28:00 -0700 (PDT)
Received: from PC-Marco.local ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm50821065e9.11.2026.10.29.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:00 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
Subject: [PATCH v2 0/3] media: i2c: ov5693: Fix mode changes, flips and
 autosuspend
Date: Thu, 29 Oct 2026 10:27:51 +0100
Message-Id: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBREf4XctTV9yMuV/2FYlHKFa4SaFhsN6
 b/b4trlycyZ2cCjI/RwLjZwGMiTXRLIQwFm0suIjIbEILmsBJc1s6GsWsVu9EbPGjSyrUvZtEp
 DUp4O9yAZ1+7H/tXf0ax5Izcm8qt1n/0viNz7Mx0E40yZRvdCo+Cn4TLOmh5HY2foYoxfC1YBg
 LoAAAA=
X-Change-ID: 20261027-ov5693-fixes-8ec29752893a
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266079; l=2839;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=ZMe4p5t2dBD1+hxYPT90U/cvW5WSFutzIjG2Y7t8jxc=;
 b=ttIGzE4etY/Ud9k80UAK0aM7yjY2VE/UPFzCAVoLWFPTkRbm2HMK2Ad3n95MlggIP5h+1IX2e
 jP/jfMkDdIzDLgUG5d6ioLRCH6wKHKpodH6ifBe9zwHcN++3zAMhqaT
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

Three fixes for the ov5693, found while getting the front camera of the
Microsoft Surface Pro 5 (IPU3) to work, and since tested on IPU6 and
IPU4P Surfaces as well.

Patch 1 programs the mode registers on every stream start instead of
on runtime PM resume, so that a format change also reaches a sensor
that stays powered between streams. This is the ov5693 counterpart of
commit 4e1446ac169a ("media: i2c: ov8865: Program the sensor on stream
start").

Patch 2 keeps the reported SBGGR10 order when a single flip is enabled
at full resolution: each flip moves the Bayer phase by one column, so
the output window is shifted by one column when hflip XOR vflip.

Patch 3 drops the usage count at stream stop with
pm_runtime_put_autosuspend(), so that the autosuspend delay counts from
stream stop rather than from the last resume.

Patch 1 has been public and in testing in the linux-surface tree since
2026-10-23 [2]. Simon Kruse's active state conversion [1] made the same
change as part of a larger rework; he has since dropped it from his
patch and will rebase the conversion on top of this series.

Patches 1 and 2 were developed in the linux-surface tree and tested
there on a Surface Pro 5 (IPU3), a Surface Pro 7 (IPU4P) and a Surface
Pro 7+ and Pro 9 (IPU6); patch 3 follows a report by Dario Manresa in
the same thread [2]. The three patches as posted here have also been
run on a Surface Pro 7 (IPU4P) and a Surface Pro 9 (IPU6) there.

[1] https://lore.kernel.org/linux-media/20261027074933.21921-1-simon0x+git@proton.me/
[2] https://github.com/linux-surface/kernel/pull/181

Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
Changes in v2:
- Patch 1: move ov5693_mode_configure() from ov5693_sensor_init() to
  ov5693_s_stream() rather than calling it in both, and shorten the
  commit message (Dan)
- Patch 1: Tested-by tags not carried over, since the code changed
- Patch 2: unchanged; whether to shift the window or to use
  V4L2_CTRL_FLAG_MODIFY_LAYOUT is still being discussed on v1, happy
  to switch if that is preferred (Dan)
- Patches 2 and 3: collected Reviewed-by and Tested-by tags
- Retested the series on the Surface Pro 5 (IPU3)
- Link to v1: https://patch.msgid.link/20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com

---
Marco Ziliani (3):
      media: i2c: ov5693: Program the mode registers on stream start
      media: i2c: ov5693: Keep the Bayer order when flipping at full resolution
      media: i2c: ov5693: Use autosuspend when stopping the stream

 drivers/media/i2c/ov5693.c | 76 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 14 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261027-ov5693-fixes-8ec29752893a

Best regards,
--  
Marco Ziliani <rylos78@gmail.com>

