Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31AE3C3F41
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895952; cv=pass; b=N1IuJ/sTw1aBD/MLNE3TpPiE4nA9mdUAMGZNy4i+wlEYz2alwQyl4wAvd2U5Ol8VLJ0tPvhmAm2Yhk4l2ELc2PqdFlSWlCMy/boqQtYnbELp4ysKu8oztXEJ7RVouQ81JT5ksceo/r/ckHtkCzjGYHxU8TgQ3FO9MxR77j3nqY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895952; c=relaxed/simple;
	bh=cxQhQPjuyAaqzyCBfonmNYD1ffbCWqyFbRydf8j6LnM=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=RM9On6bzGZ5HdGdOyNV9reGIgmik/8gB9PoJXdSesZGjOEPD8hPQx53vMjyDHL6E/JcibSiVlFO2XIbRC1r5iZY1M/3rPm5j92nZDp6hTAfhgvszZJUWgKmmfTIrLNMOYod+2HRbJvw+NXxG87dHdskHn+U4PWOUU9USgBeENvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=Pv5hweAH; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="Pv5hweAH"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca7c1176317so474361a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895950; cv=none;
        d=google.com; s=arc-20260327;
        b=CQqXH23VTqO5bGl9yiIrm5ro1Hj3NQa/+l+Pw6coMpq6znfeLJyXFbSYFffyFkBuWT
         vBUyGfl32zgb0U3egYzSlmrs9Mf8up9OT1N2OXAare80X0ul4+gHcfgHRUKxuNUc36zD
         qlhcH3sPhlA7gJIrviqSFRdAAYAZ8daRhpC0/cw7FuxqlurYvTYx95i0VPHBzqh1UmPm
         aBdS0BcMTviiiYrfPf5o7NkLnBtVTpgjP6sGnutEujYwKiX6qllp0JVLeZQt8QVUXbVB
         PBMUdNvZQXbEuN2egWVW/pDfUf0T0KhhAGKdLsbNPICFLtQsXKxTypU1GtiTSu5YH4kV
         NM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=coT/Fcx2iJMJkuY7BZDQNvtb4UWlhVH/ROP4nEGdi94=;
        fh=Z7hCLx/HctAMdo8LgKZOBwpqpyYw4yOvQ6JwzQG2/IE=;
        b=B6+lknZm11Kj0tS99V4sKRuV2mgq3nSq9ik83q1k+c0WGle8HR28jCUxTt7+IOSXRT
         gt1culkopRb8ZaQKv4DsyX8S9D/KWKOaiSLNj7e3x3GhnXHU3SpdgvGfuKlmRPCtScto
         IU28jpq3JjTLoDjcCxR17hwnM+biv+SWKulczXyW7CO6hWBMICLDvbJf4QGKKq4IcQkW
         O2CQfSQwk0VpytvKuLAchs2vX/SigUH35nGdvzDpXilqHkXmht70E5gBBgI6H8Z1wiSW
         J2p2EFMb4uQvtKdpzjBCg74Z6iR2aoeEuyplswvdXLYgXVz6/A8TLVytXjJJ5mgUCj1y
         DVIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895950; x=1788500750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=coT/Fcx2iJMJkuY7BZDQNvtb4UWlhVH/ROP4nEGdi94=;
        b=Pv5hweAHgzKLOxEVzBT2oWV/JXnZHHno9mtmCRnst0pqrWU/S3iTWHM3d84Em1lNEh
         FIrdHjPYnq/1XnN2q0M05vvEI1Z5oqb87aJI6XszCVc2cjl7DOJOt3dY5GWHhQIg3x3Q
         U9WqOvWyu46VYH6ngsNUDPCffGruIDKu9hlAPd7tBbRSIBodRjAg+mYsAQrkB5Nh6awm
         au0YDQPjZBZVeNupudLSY8HUCQKy84j/A+DX7YvwZVfMeg+uznabfs2ofu4cf5se/48w
         /YoQsPxKUWj0ejl6Z30w3cSaDVVCkDF0mJH01EifwpczkjpYEV1LEceD9LZWFTQ7GZR3
         wB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895950; x=1788500750;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=coT/Fcx2iJMJkuY7BZDQNvtb4UWlhVH/ROP4nEGdi94=;
        b=UjjSYb51BSU5S4coPkhIwJusfcnQtvPWBaPaLO1BzhRHfY/NUH2f9fa4M4QZ2WjVOy
         7ovBeR6fgCkGz/u22mU484ECMDdvkdsAUS3ULrEvyZYEeEoNky+nTT4r2Y9MIymqT9Bw
         e24WJpOYmLuVS68Acojxl6fP07CzTnZc8ebJ+699OqXLT2F6rTDtbEKdYCzA88pXd3+x
         7XrfkT4pF6YL6Aw0YkNST/9Eu8sy/ZhE3CbWMnhY1cOpof96errh5eKBnC+nvI/bdX1a
         DQF95dN6xfxJvWeMjYQab31+Z51axud6rUpxfY7fv9q/J3S5ZZX6H/q9Pj/4x09uYsOF
         rkRw==
X-Forwarded-Encrypted: i=1; AHgh+RqpPBxKeiYaJj7caOEGpmjl2KW7QgOqDpUPgJn3FZ6a+XUat/QyN29kF+Xum2swNsp2Ybs5ClhKYEJHaCw=@vger.kernel.org
X-Gm-Message-State: AFuF++ldT6HTVIMwmxRnSnjreANcrZMREBxiiy5Xd+0YCtc53KUNw5Hz
	SX6A/Aiw1NlLeJ9OSgK1ZR5mO3Q3O4tj7sUrjltCy6EWv8+jM+kA4abwjHirEVx4G++V+AeU0ug
	wcRrCHH7r7nJQfWvojxRsxR5ayra80O8MeJvAashZ
X-Gm-Gg: AR+sD124/8Q1hWS+zkMO4k9kozUdSavXWZJCDmcIPRuJUL6/ku+MAQWc+BcT6fUKnee
	PlWENeqBzpUIoQVF8LIg+iNbZs9TXBN8pDZB+vVzp/2wD/Xmkdan6VxgSrK13RLE51UZXxUPpzd
	gAikO30wAjcgFLJUlI+xw3W5qCtb6Uuqu3wf88TbGFWiJ4ipKTc+P5bpfLOUU+DbSPaZSJ+ps+q
	hIvS4gomLLSqWBlDuJHiJqYgOqeG786nKKKNTyqdjT4/teZmCwbR55QZ84+c0fxAdJJ2F7nLavL
	+m5/mYNEgKLc7xdI7N7sF4zj4/KMpo0zPCols6nGKSLjEKEMOPi89etdR8YtMY+BlvW4stIBOUM
	FoWKNSu5ltwolm4DHrUZ9jhiXfCeuf1Ow
X-Received: by 2002:a17:90b:4a90:b0:38d:b36e:9813 with SMTP id
 98e67ed59e1d1-396d0f8e9f9mr8680266a91.11.1787895949284; Thu, 27 Aug 2026
 22:45:49 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:45:48 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:45:48 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:45:48 -0700
X-Gm-Features: AcwNN1VdPnnVGgIILuxvEpWACgb0lEUjH2IymnRAvhNewQKszT0MbM0jhqgbw94
Message-ID: <CA+0ovChOY+cRnRkfRWr5X9gcdXsz_L6BkBpXvL6=zdFBWFfUwg@mail.gmail.com>
Subject: [BUG] general protection fault in orangefs_writepages
To: Mike Marshall <hubcap@omnibond.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/176-general-protection-fault-in-orangefs-writepages/

  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:orangefs_writepages_callback fs/orangefs/inode.c:144 [inline]
  RIP: 0010:orangefs_writepages+0x642/0xc60 fs/orangefs/inode.c:205
  Call Trace:
   orangefs_writepages+0x642/0xc60 fs/orangefs/inode.c:205
   do_writepages+0x328/0x550 mm/page-writeback.c:2571
   filemap_write_and_wait_range+0x332/0x3f0 mm/filemap.c:685
   orangefs_flush+0x44/0x60 fs/orangefs/file.c:566
   filp_flush+0xbd/0x190 fs/open.c:1467
   filp_close+0x1d/0x40 fs/open.c:1480
   close_files fs/file.c:494 [inline]
   put_files_struct+0x1b6/0x340 fs/file.c:509
   do_exit+0x6a8/0x2360 kernel/exit.c:971

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
