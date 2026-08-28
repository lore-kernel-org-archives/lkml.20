Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061538D018
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895833; cv=pass; b=pLKNcF1RrB4EbI1kW094jKC7/CJROdNTZeKn14LWsf41b6As2D2XwtM+1MvotoIXmTY/RVKWL9h451WMzggtf714fYUakagvFwXDLNnsShz0sv+RLzjl/cThsEH3zJMTRNfOLqRm/M0ICON+EqmQpKq8ljcjrEWxkudC1U6FQYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895833; c=relaxed/simple;
	bh=OuEHLvGRUx9/ZH5V5W7zY7+LezTrW1Y3O0sg+WP8pg0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=V2JlCdo5+T5wKLPikZ+ACbuFE0A1Ig38Mu6i4kUvFYQha5gACeQN45yQqTusVKozqJEwm7Ns2hxEkL78Uj4k2WQBtb2J/xbWU2usLbPvfX93rDnnGpsKuyb9P6CWr3VkF+BApk+5mP7d/ITTDSLmDxL34sTF1HTR5CMb7LpUpnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=HeV5xWgA; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="HeV5xWgA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccf2360620so6083145ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895831; cv=none;
        d=google.com; s=arc-20260327;
        b=lnekppIKZUaypy78wcKOovE1TOrKR6ckyCvNzQjLjXeHVDmTyv6JtCe9KAQuO0DKIb
         3tBfjdOTwRFZcrtPVhMsSDOrtVDdykniLktoWRk3OtTwdL+KXYEMZ1x3drm5XGaYlruK
         NDNekreQuKWPJjFkRj3fACXJbXO7NHf0SbfoQVdD0gbQch3TO0u/VAzcBzH5GQfRu25o
         8Yccs/QeTkTYXTp8dqCD1sOBIivn0ZvRtksRC43PAlmyWm841HZ0otfg0yBN7DeCXFrw
         zNAdn1qdPI9TcNcYfV21S7kmOSi+rtl5yZXYu0/71g0nc0V94InKJRycIUrTR1zoFY3w
         n4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=9eNCYriSgP0ZaoHft5uMkSy9YgS1eVYLd+4q7aEFbuc=;
        fh=pH+zWJ3Rms7yjfeUDSDKufb7aRhAxLRDV5vbrsGsax8=;
        b=E5lhoHCKSpq0R8fcVpFbVqHEUrWlwlNqqkCjNxCcqRP1t9haznzMpsG9cH0v2L8oFF
         TO/VfnjZCbdhUxmtrmfBMysPEN3sMu4ox6x9xI+og5yfD8mekGJ3DszTvdIIsho1t1fT
         TCNn5+SmIwUH9vHaD6ONIAcf0RcftRbhXAl4i4JU4WJ0vMh8aegy6xQpDa5X5jIjsA+D
         kBE506Ls7j/f3749rx6znGC8SpJDMwxPUAWpVb+bAFztFDhdNaLIVSyghfSG/vQWYyoi
         nvqW8SJ0odCx8bkFhrMxpltU56EO6Fnwx+PAQM+L6Y+7EjMHoBalOMuzUr2HylmIrHs1
         BESQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895831; x=1788500631; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9eNCYriSgP0ZaoHft5uMkSy9YgS1eVYLd+4q7aEFbuc=;
        b=HeV5xWgAprGTB3JnB/aKOizrmHKAgs80sP1+KYYDHQwsENd/dE+MG1i37AWj3a9gJd
         YgT7Tk5gOPxKQeRj33xR9VU193/tofvNcHoel+eu3KBoP+KWjE/ambdxtO3rI7Sqv+PW
         oE45ZblyB1ckmjXmNt8WaLUsesixAb7wbwQBmRDGyh+KnceN6g0GXH5FcPUdxe+tYX+p
         3QBMgUcehVSkvzfymJ4M5mftwjAgZixJzIfZThVfHuANsyVUYd127sc5GV9MYDFjGFBl
         nNZLuA1hzhMzw4Bn1sXyr4RmydMnH1VpAV32vjNe8elVS3j06lsnlPg9l5R0cE8q2tuL
         bugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895831; x=1788500631;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9eNCYriSgP0ZaoHft5uMkSy9YgS1eVYLd+4q7aEFbuc=;
        b=gv2LAH7WTo8JE55k9YuuIqwmlXhdR9QZi478FbUFKcVcah40GbiplZCMVTFh5S4LpF
         Gaetu5URYZc/H4Djoc916xe9+2JZ8V2T5EpRLtmG6v+RB/+4zXViZf0grqWw6Bc9jg5L
         b1BwiK5D4ft0hTXuPgYQNqgdsY/VeZE2o7YeTBvBh24tIVCVOJTiKLozpyrv7O8feT/H
         6MecuUhKo4Cb4DD4vFAvu7zrNgX4apSu8tDAFmb8aWsAVTxET9hzs+4Lppg4pkQR0k+I
         DqojwcR09IC7flXb4/cDOTwe3twNCmb4OcOK0j3eU6TCYVTI77If5+ODgg0eQy/DwBpt
         RVew==
X-Forwarded-Encrypted: i=1; AHgh+RrlApOz4YjlvcQjMtR8wW3h0zk160i4CzUbC4lKM9OeKiqd7fzfX9yPT5r2+ws60jRGSBNGXVkrFCWRxc4=@vger.kernel.org
X-Gm-Message-State: AFuF++nsE6GYzcI7bXu0wxuXeNRXcfV2oN7VJ77HuJAWn6z+hSgWFhtS
	6zKzOc/Tx6PlnZX3YKpDa2IBYMMxK/lUO10uKFj3UJ+qITjS3s6yfgytc3k+40Y/qONP+OUq2WL
	UfGXj7XDCHQmaWKR3GHQfCNdsP539A45O2MPDGaW9okB2o3WmDhGZyw==
X-Gm-Gg: AR+sD10KcflTLDbuIItBkrQ1VOLNn+iUFwMe1hcWG372phTr8RFRFt5ivW5KXbpVq+j
	/l5A/gwOqZTtcJb+w6AZqYFZNIn4CleTwyAErbOWnTE9SmycyBh9Zq2BVl9GzSceGZVONHAF9m6
	OiGzdJFvXtd4Pra91qqFNG4MHDrUfp8v+5O9eXdVzRmR/R9sYRUZykD578+1bYVNjD5aq+dw+eH
	7N2wmSbbpHPy1NRUps7hvMrs1fB0u9opD6fHi9/i7nrJUGzjMv641tHYy+IBErU8T0/tWxdkdYE
	YWz/1fT43yiHku74W9cDsB503q3LcDNeSwWtWkz3Yd1anWs+mwmmqR2FGoMeUX9hCbRaRc+NQY2
	+kFHjwOCVN/6UMB1nrgVf6GG/Ed+gL6gdAmClEffwLuo=
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id
 d9443c01a7336-2d74df0328amr94437075ad.12.1787895830415; Thu, 27 Aug 2026
 22:43:50 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:43:50 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:43:50 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:43:50 -0700
X-Gm-Features: AcwNN1W5o4PaGFkOvXMXU5zHCDDj2K9tD9dUw46z_DLB8CJGXU52fNL05d0GLOU
Message-ID: <CA+0ovCiyBFo_gx4UaRN095=MdWaBgKm=TqA1uYdOu-hb_BPt6A@mail.gmail.com>
Subject: [BUG] greybus: ODEBUG init-active on a greybus_reset timer, and
 use-after-free in do_work()
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: falemi@asu.edu, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/167-warning-odebug-bug-in-do-work/

  greybus 3-svc: Resetting the greybus network, watch out!!!
  ODEBUG: init active (active state 0) object: ffffffff92bbc2a0 object
type: timer_list hint: greybus_reset+0x0/0x50
  WARNING: lib/debugobjects.c:632 at __debug_object_init+0x2a8/0x4a0
lib/debugobjects.c:790, CPU#0: kworker/0:4/11040
  Call Trace:
   debug_timer_init kernel/time/timer.c:788 [inline]
   debug_init kernel/time/timer.c:836 [inline]
   timer_init_key+0x34/0x1e0 kernel/time/timer.c:880
   list_splice_tail_init include/linux/list.h:620 [inline]
   do_work+0x19e/0x2b0 drivers/md/dm-kcopyd.c:664
   process_one_work kernel/workqueue.c:3314 [inline]
   process_scheduled_works+0x881/0x1170 kernel/workqueue.c:3397
   worker_thread+0x988/0xde0 kernel/workqueue.c:3478

  WARNING: kernel/workqueue.c:806 at insert_work+0x1f3/0x240
  BUG: KASAN: slab-use-after-free in do_work+0x257/0x2b0

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
