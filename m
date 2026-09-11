Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DC257F756
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156159; cv=none; b=jAFPoRm2qv8GzYnAn9YTTgJYGr1oulmmfabOYuPSTpyXmvbMXuoW9plVoCK5QAfgbvb6Ic//AaEg2CMiiueD4WpaOIovXoMrIRPSZxhj8uJJXYXyId2QLvxDbZ1td4YdOt3qrwKbeWiZQ/2Oksj8vaglDoH0Tn2rSF8dSLH4/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156159; c=relaxed/simple;
	bh=+SJWB4l3ge5XtEN0RK3yZRvBmVaW5KcSPPi3HgVmSOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lk0rGPnwZZOGG6z3k0DGOEY0Semq0Fz9O4GtQ118N3HiD1TfIdFYoIOfJV93SUcfk940gw34hR6u8cjX+5uABdjlLIn0ikhJ7WWAjzC7hw7NjO44dyKKhSAEkEgp9dAj7NxyL6gdjQKisw8R+I6wO5+/2BMegC7pNPclnk5F2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFdvc42t; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFdvc42t"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-485850cf499so1049539f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156151; x=1789760951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmTShhSF6HV793ZXQHXV05vHnnfk3kV8meDt9FBDDzU=;
        b=KFdvc42t8ZUdjXItx/t+uH+0K2gtdRxbT4unl1glwTpH7VVUN5Kvg5ezfaOeeyGqwO
         GA5UD/gr4Kx+CLiW5I6awDgVMljZR6L1GbquYWEJ212hSTgTVe7dtH2azD5iet8N76Ad
         0r2vbHs2zZbCkkSJruqHsAqV2oChiuVewRpEFvvcoE3muxzJfAqCKdYaOx6UuW8OmCfW
         YdQcVblc6eGk/gOEG5xnsjm0HNHzHfN8QwFWDj0SmnpB9V2IirsvCcPfWY8VqbqVmhQ+
         MkZg53e6Czy/cuA+PMa9E2MCE5SSWtf4/AE5XCSQR2U/JzxcKfNrOmnN4X36wU27LLKg
         o2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156151; x=1789760951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmTShhSF6HV793ZXQHXV05vHnnfk3kV8meDt9FBDDzU=;
        b=f+fjGULad7KEsuiCKWzu4VsB2MywiHk145MTzefvTSqW45DcX//2StVo5pK3AxHqml
         nKy7/JU7+SJnIgHrr22pcE8GKUoHqyMD9uIjBqDjd/xw7xY4ySxpx/Mqh7/P4uT+xLNl
         K1Yxe2IupbDMY1hZHRETwAZn6XUMb0bLuSJ7H9A7PtMH73h84IYazH+d9388EmlpbrWZ
         eQcPsAYFS3PrOcagVSq1pY1lP5p2nHbH4Inn53qTncTK7pr+w6WqNFs4DJTR+nJYE7hm
         ijz8tlDhLNsjXwRVRwlUSPQ7tA5mfwERNP6uvzIHz1/tL9K5SpORbPecrTb4ALpuODBt
         ounw==
X-Forwarded-Encrypted: i=1; AKwUvByNLkIls7lQowWPtiMVlHeMk+ulD8LmLycsqUw2aelkaJAHzaJR/ltZtg06I2k+qWO7DumWIrloH+pTqTw=@vger.kernel.org
X-Gm-Message-State: AFuF++k5joxU/NEFxEUWmg/AMTW3wK2RMwDmaENiQ+KLh6F3mH5u6jXp
	Rbf694z2bffTYasRuCvZOF8l0CjN1ekLJAkN55jk8SLr/MSTdB6lJglm
X-Gm-Gg: AYBFou3mbpqub9rnmkA5BR/JZoJjQYFz2D7P08xRZFk5nTW4K0x+/sV+Cb2J+xIFcXc
	R0zHUF/fC2TVFpgDyr3plSrPkC285JuLtKyL9RL09FDEpWGxSdqN4KyUtCQ8mS6/FkACXwx+/Pe
	fDSkQYXAmfEzxUGJfM6ThJaR03a0vrRUeA35mr3MKQNwhZ2MO1clkbTcRpAkFNoUW7od7Ji+vep
	08MYjt6ntTLQyDbRNHJ+aGP5yh43qCEU9bpwCRmZrL/F52QAbuc7GBEwAxCsabYyT7F62SFEWfs
	UgZuAFn4PnpW6px47dTzLR6Zvm8ZLz3AbSJsPUOa0nIZZ2cVDBuIVXXls50sJvgT0cuwAYlsybf
	9KHFO9ohrG4L4BP8tORuaBYk09TTAE2eHuPPytI74d3BnPw9v7wUEpzXixQEinCsv8dbLnxiGm1
	+gUj3oEbwLpLxC3UxzHVm6omtHskBVTDga7Yo4y3JZ7LnNSxigFxUOjv8nfYZ4k8g4WZ7trbNJJ
	A9WRpq/zxGAZGGN0ZTQUBEZ4SX+J40pyYAxC0nOwBcJQ1zlJFan+LaWmnZrO9+3QSFKV5F5NpDV
	lvN6Ls/Rt8tBfLE5t4gPp6rSxW8Qb7Om4YM9iUscJmyP3vFQCANvkThtOJiSZIvbf+dun9UcsRz
	xX2sxfD6faz9fn45yZJcqYCiFouNGylG8O1LUD34rHJ5dFfOZ
X-Received: by 2002:a05:600c:6206:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49e619ec880mr76913545e9.22.1789156151321;
        Fri, 11 Sep 2026 12:49:11 -0700 (PDT)
Received: from localhost.localdomain (host-95-246-9-241.retail.telecomitalia.it. [95.246.9.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm175983925e9.0.2026.09.11.12.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:49:10 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	antti.laakso@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v2 0/3] media: Two oopses and a hang when unbinding a streaming sensor
Date: Fri, 11 Sep 2026 21:48:51 +0200
Message-ID: <20260911194854.78894-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the second version of a series first posted on 12 August:

  https://lore.kernel.org/linux-media/20260812105305.32447-1-nicfio@gmail.com/

What changed:

  - Rebased and re-verified on v7.3-rc2. No code changes: none of the
    three files has changed in mainline since the first posting, so all
    three patches apply unchanged.
  - Cover letter: the paragraph on patch 1 named
    ipu6_isys_csi2_get_remote_desc(), which does not exist. The
    functions are ipu6_isys_csi2_enable_streams() and
    ipu6_isys_csi2_disable_streams(), as the patch itself says.
  - Patch 3 now carries a note on why the check and the marking are not
    done under q->lock, and on what the proper fix would look like.
  - Dropped bingbu.cao@intel.com and tian.shu.qiu@intel.com from Cc:
    both bounced with 550 #5.1.0 on the last message, and neither is in
    the MAINTAINERS entry for this driver any more.

There have been no review comments so far. I am resending because the
series has been sitting for a month and because patch 1 now overlaps with
the IPU7 work; there is a question about that at the end.

Unbinding a camera sensor while a capture is running is a scenario that
nothing in the IPU6 path handles: the kernel oopses twice, corrupts memory
once, and leaves the application blocked forever. None of this is caused by
the sensor drivers themselves, and all four failures are present in
mainline today.

They were found while testing two new sensor drivers on a CHUWI Hi10 X1
(Intel N100, Alder Lake-N, IPU6) on a kernel built with KASAN, UBSAN,
KMEMLEAK, PROVE_LOCKING and DETECT_HUNG_TASK. Three of them are fixed here;
the fourth, a use-after-free in the media controller, is sent separately
because it belongs to a different subsystem.

Patch 1 is a NULL pointer dereference in ipu6_isys_csi2_enable_streams()
and ipu6_isys_csi2_disable_streams(). The remote pad is dereferenced
without being checked, and unbinding the sensor mid-stream makes it NULL.
Present since May 2024.

Patch 2 is a second NULL pointer dereference, in subdev_open().
v4l2_device_unregister_subdev() clears sd->v4l2_dev before the device node
goes away, so anything opening /dev/v4l-subdevN in that window oopses. This
one was not provoked deliberately: udev's v4l_id walked into it on its own.
The window has been open since 2011.

Patch 3 is the hang. isys_async_ops has no .unbind() callback, so nothing
tells the video nodes that the sensor is gone, and a DQBUF already waiting
in vb2_core_dqbuf() never returns. The sleep is interruptible, so
DETECT_HUNG_TASK stays quiet and the process is simply stuck until it is
killed. Reproduced 10 times out of 10 on both sensors of the machine; with
the patch, all 10 return -EIO and exit.

How each one was verified, since the three differ:

  - patch 1: the oops was provoked deliberately on the unpatched kernel
    before the fix was written
  - patch 2: reproduced itself, unprompted, with udev alone; after the fix,
    150 cycles of a reproducer with four concurrent openers left no oops
    and no leaked minors
  - patch 3: rebuilt both ways, same kernel and same test. Without it,
    3 attempts out of 3 hang; with it, 10 out of 10 wake up and return
    -EIO

The full test cycle with the three fixes in place is clean: no KASAN or
UBSAN reports, no KMEMLEAK findings, and lockdep still enabled at the end
of the run. That last detail matters: lockdep disables itself on its first
complaint and silently invalidates everything measured afterwards.

All of the above was measured on the first posting. The machine no longer
has a kernel tree on it, so this one has not been rebuilt; it is the same
code, and the rebase is a no-op verified with git apply.

The reproducer is a shell script that streams with v4l2-ctl, unbinds the
sensor after two seconds, then rebinds it, in a loop. I am happy to post it
if that would be useful.

One open question, on patch 1. The IPU7 series reworks both functions it
touches: "media: ipu6: Split ipu6 csi2 stream enable/disable" is in the
ipu6 branch of the media tree and in [PATCH v4 00/45]. The rework is a
refactor and carries the bug along -- remote_pad is still dereferenced
unchecked in both functions -- so the fix is still needed there, in a
different shape. Patch 1 as posted here applies to mainline and not to that
branch; a version rebased on the branch is in the v1 thread:

https://lore.kernel.org/linux-media/20260903202820.8401-1-nicfio@gmail.com/

Which base would you prefer? I am happy to resend against either, or to
split the difference: patches 2 and 3 are unaffected and apply to both.

Nicola Fiorillo (3):
  media: ipu6: Check the remote pad before dereferencing it
  media: v4l2-subdev: Check v4l2_dev before dereferencing it in open()
  media: ipu6: Signal the video queues when a sensor is unbound

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 41 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 31 +++++++++++---
 3 files changed, 78 insertions(+), 8 deletions(-)

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.47.3

