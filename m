Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE23B6352
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894862; cv=pass; b=seFmut2Q7EW2yY841YKQEDSYeQHT1Jkl0tbev0IkYpX7wbOIh3kb7pvAfQhUh+0TrpYrN0twGgvf9TrghVsA9z8spkHrVAtssWCmgidno5OHoHy7AK94V6VEHKbYaROTAOcGpdCEzE+ZU/5/CPjZtvf24FMjg9qLPlBadL45J5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894862; c=relaxed/simple;
	bh=CgFE6xzydSpndudikVjnh7MIF34ctjCUCdEOfsSfRA8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ys2svaOrgmNmVX7FjnATSnEFvvLwwInEDd0b+dnL+zJKh1W74LYo12Ty1LU5hIHRhlhUX30rHaxhlITcv3LBcZORnasSQk/DX524GdvXr/CxywrACuAt5dWf9p7XQUINcjgJ8O7MzbfbDHKlON0qYWbsrBTlbk0iK9Yv9YnIcOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=EX2aakxp; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="EX2aakxp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso380094a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894860; cv=none;
        d=google.com; s=arc-20260327;
        b=h0W54QHxwqL1ZmS77tkZAP+iZIoVd6hzOloAp3Fz0m7frR+K4ST/CYJWVqBgkzjys1
         0vTEMKngUFn0EP43Q2OHCopJ19g+ntof3LzHq3+6ixZxIAtYoe4AxypAq8i3T/elce1W
         CIsQPlve9BDSIEuyPwa5Vln+eDqHrmrOujzxcaJeH/hkygtgf4Xc+jVWlf2EMXEuI2LS
         pFJyAStJ5rnodrSpquXUd94ob8BbD8nEkXuBC6NteJx+fmdiZ0WHqr7xxI+9TTdwNym4
         wLuGGRmrsq+blAO2l0eAtp4NaQRqgJY9BLShtH+wJMBwpZ9FHuhEonU2ACJgzFGpWclO
         j30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Z2v491KBTHpIGOUDfEqcZ2UFbfGCKSS8IjSqDZ3SPy4=;
        fh=NwY3T58D+80UHiWnApsLLz6OqsKvE1e4IZFlS7UrvIM=;
        b=gtWyT8q9fLTVw5J3RdeuYm7n5u/FVxBBlyrbKtbTa7MLZWaamdgc9UupX8I1QfrI+t
         yMY8X0Wjruq+o7soq1a0PL07bvne+lR30HxnM0ReCM25SYa+xFrkskDq3sPIEY/pIvHu
         iqOicZH/wH8djxrPvpnLRXL78AAX6ZGCkfTHvO0nrSU5kBMpYXEIyrk9cL+luLvYOxgY
         f2YrBwd8rz7pIOfdkE9HdB2PNPV/ACZ8VWojiRbLw/KAW8/yMQ28ir8I5huMKcZQRcGx
         7PHT9unUUuK4ppqOFxChHCq9kgtuXkB66kz1I06yT5JLR6+2L0fN2cXBCpFPd5e/vgFY
         8jhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894860; x=1788499660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2v491KBTHpIGOUDfEqcZ2UFbfGCKSS8IjSqDZ3SPy4=;
        b=EX2aakxpHxlBtAMT7Q1DJXuBck2GnuvDHG2X2edwDnBRsxNy2Q8yxjlyPiZDbAFTGF
         ve83Ct5UEZEFr9zycsBYHSEof97QthHnigwq2IarpZIL2vW0YJA0mqDbWbgazF58jJsT
         vwXT6etsfg1RbAQ3l8yEn2lUiWxu+lVbmN9IMK5Y8xIzZoqM/0+P16BeLM5VbVBPyAmy
         YQDP+3eaV8m618DDGqaRp/dOIqTpbTZ3D0WicQetvsUS4whpElfI4/mI5M+tmnf4uZIn
         5Wyk5iOei9y+/C/rCEeGYzPe2fo5+tp7H24eg7HhjHSF6lE5WFnGsLEcYRIURo6TZr2k
         Tj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894860; x=1788499660;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z2v491KBTHpIGOUDfEqcZ2UFbfGCKSS8IjSqDZ3SPy4=;
        b=ayaAgFs9/e20WjY+0mwnqQtZuOoAW5O3uiqwOOKVagk26TQteHJlusYIIaULpbn3Sh
         8N7vtozQizLLG1RSgHuee2alsoYhZJYfGWyXnUW1sAXnFBY286yim2z/AcHp8RRbkI3X
         wigzI+lEl56M0wL0EjCRJ2Wti97Vtg1mtC3XVNjRVhMhNvdnuxbmRkV3Ebb55kqMI/MV
         kIcdr/rpSbl35XyD0w+3Onfr6IMYiGcHf0osnGLNhQ9A23Iix63+kll6SAT9hhot/2xI
         JwVxnu46G1hU/IUYFkskk6OXSACv1RdUAaqGH7wsXMC+lqHs7LbFksN8Q8oFx5LnTeHH
         o4xw==
X-Forwarded-Encrypted: i=1; AHgh+RoA/5sr21dk9NlzL9TG4vKqVl12zsQJR5J/4at5OCyq1ZJnTTHxMEImvVhwp8T4GuWV3eLmso8XiEhbjr0=@vger.kernel.org
X-Gm-Message-State: AFuF++mADL4mKPAzUP+18ydiHhgBLVqPpMruOPvjOe1VQaPm+pnN4DGz
	usKrJE6knqS2sIeUVZhzLlAN72Fh3B4s4vHYG/keBea13Tw7TjZ13CLpAPwlTHQrR28ulHi+aht
	U9CNSnth2KMzpzgT0AUwwXremytuvtXCnPTe9faN0
X-Gm-Gg: AR+sD12YsfsuTLP0rwqQq027rzElNER6FqNsr7iIvgXt5mXbEL5+/63FQELcjaVzres
	8B5tpuagUQIQEKzfhRKLm1DpL7FhjDoXGBQd2bSajffn5+hXP+xYma8Kp/0H6LbOQQwsADPRT1B
	Lk3W9FnvGZVwrK5S6IIS/i3MrRsZ5FLSP5KotyDOotcj7ME6PvIoFBf4n90EP75t/Q+V1rFh7hr
	hUD0e2y03vQKLBeR6XaOeuEVuz1oBM9+iLvD7qOE80o0QMriCynNVqsvHz2Pr7OUptgOBa7Edjd
	mYaCYmQSIrtatKUQBxa+D9ra83pXQRTF0z15kdJt5PbEaGjWKhqZLjdv/xoGwzkV/aeVm9kC3rK
	EUpEC5EvicCuWqUcQvQm+sN4VcWeWHjfm
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id
 98e67ed59e1d1-396d0e5bbc0mr9523032a91.2.1787894859450; Thu, 27 Aug 2026
 22:27:39 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:27:38 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:27:38 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:27:38 -0700
X-Gm-Features: AcwNN1V1XtOMwtbbFljXfNFuTDGO2fgdE04DxiefRUwgFn8oHxIWjYAxDBzqN48
Message-ID: <CA+0ovCgZF_+ThNPAmYv6K8eYi-qNpBDJN+ob_gtp0zWfkBWB4Q@mail.gmail.com>
Subject: [BUG] pvrusb2: GPF and use-after-free tearing down a partially-built
 v4l2 device
To: Mike Isely <isely@pobox.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, pvrusb2@isely.net, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/143-media-pvrusb2-gpf-partial-v4l2-teardown/

  pvrusb2: Destroying pvr_v4l2_fh id=ffff88812f7f5000
  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  Call Trace:
   pvr2_v4l2_destroy_no_lock
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:846 [inline]
   pvr2_v4l2_release+0x3c3/0x550 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:918
   v4l2_release+0x24e/0x370 drivers/media/v4l2-core/v4l2-dev.c:471
   __fput+0x435/0xa40 fs/file_table.c:510
   task_work_run+0x1d5/0x250 kernel/task_work.c:233
   do_exit+0x6ee/0x2360 kernel/exit.c:976
   do_group_exit+0x20c/0x2c0 kernel/exit.c:1119
   get_signal+0x12b2/0x1410 kernel/signal.c:3037

  RIP: 0010:pvr2_v4l2_dev_destroy+0xb5/0x320
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:805
  BUG: KASAN: slab-use-after-free in pvr2_v4l2_open+0x1b8/0x720
  BUG: KASAN: slab-use-after-free in pvr2_v4l2_release+0x289/0x550

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
