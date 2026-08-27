Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A53D6CB6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787870161; cv=pass; b=Ql1cCBjboKoOXEF7qKRxsW6P0U2iKjDHbumvm6KVqtsHKl7pATlGgsovL9UnNZy4eJZmxHFSvJKrXRzCzwle3b7gvZDP2AtB0CAS+xKVoBYrLzHaWwPlJvTTdDveAAnU9RCgbjm99funoq/ILuqoGL1tiMb6uVpBzrTY9V2AhtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787870161; c=relaxed/simple;
	bh=u1ODhvNFMmxXNrG0OJn2dGP7Qu4N4k2hoIPT3wVtaLA=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q/csWQpGqZR+YDmmEa6S57NAd4SXKiiXkUwKWPm1dkqDfNCKMBikUHR1nX/wWs7zHPwm9Dzj86RI9vzCIP+pDGJoT24NP+RGhEIaXq75FrxnUp3eK+rUHqlmbVGPW/3AsOAsmNrGdas/xhgUXFWDCsSkMvq9K3UCkJqfYoBM/MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=S710XyWS; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="S710XyWS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d58efc7356so2300125ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787870155; cv=none;
        d=google.com; s=arc-20260327;
        b=EKGLq5qf4Di1R29xMcNH/FUF3ylMVmxrbJjpkW5M3P4Pz5ZEykkbKDymOPOrbPM9Ex
         QBLKyS4lhRct5xnOOepLp8RYze29lmv0cILcN0cCwfc7Yy/HkasTeqhuCTJLx/AFl6LX
         tJsGExYvxlrAWkU46jf8VADyklbKzPRTPHEyAnpjk5WORLsQrL1lhXZtxbLkjIg1W5pX
         zTkJlWg2h0WRv45hAJuzKh2b6HZKJ/qt4V6QaMpgaG4jE/vpwqAW9fPWb7atKtqG/RrV
         AZAoPXdvPeIbg2BcBFD/bm/8eAXSr29hs15/N8As8V6qtHK/RllELQ1ZzcKvQUr591uZ
         B4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=MoeD6WLey2iPImsUR6TLXDfulyi5sEhqEwHnTLrN3cQ=;
        fh=ITPkkJs9WOtBAEzG9cWrFr82yIpKipPcZ29yD2+wnVM=;
        b=TJ4GkTtv5Vp3ewLhtxA2VmtHwNtUiEh7Qrq+4A70Atafzcocomq3Wg2S15UC8QDFbx
         ybQv+/WiE0ki0du8j9dJevxE6vLSb4k8k0gMXDwpy3RncdAcB7SjIHbT/yxa92wltAjt
         E+yo6kPq/sGVBbgXIHKCbzcWBbazlr3oeTF67x0W7TVAbuo+29NsjNNXYntP1nKfpIuG
         wOhFopgw2+qZvPiHJ0CL+nYRgbj27KdvVC293MTtRYLPw1WcAlOemnK2FAfuASPXeMGU
         RA5p11a0oZN6NdZvLKN+mGXfgd6qItxZBieA1+IXF+Ovv047VQuU8Ead2aZ64fRWnspO
         XW3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787870155; x=1788474955; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MoeD6WLey2iPImsUR6TLXDfulyi5sEhqEwHnTLrN3cQ=;
        b=S710XyWSFsf93KeUf0eS+4dhyi1LtREvf35xlXw/ASmP4Et/duyb9vpyrtyoyjnZ26
         buVXFoKH2mxX0O+1166c+CrxsVG0X8X2lTb6T4PAn8c/fHFJk5Re0qQ497BsOqhGzBYA
         /POClQSAF8brokxIDHcUbrincV5wklsTtwPeOJAFNpn8PvIUPQa9j9UKpIZJxDfwrrQU
         0X5IWt+Znnzih4TBNdbYCqMPx8bhWOzGgtQ9yFXwMCEWjLe0+b33IsUnF6vgekEL+h/1
         ckYMtvAGKYOA9oYhg1hVpOo/m35mR70I6Xh9wpR0n81Kw+ylfnB9tobtbaQOsIxagGzm
         /kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870155; x=1788474955;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MoeD6WLey2iPImsUR6TLXDfulyi5sEhqEwHnTLrN3cQ=;
        b=ImVKujO3bx99x78Yfh9DVKS+qymugUvQ9WKmQqevq8s5UtU8bqA0WCorGUY9XQUK9u
         sL6oqfawpd25XhwyAAQuf44SkPbnnDYhEXk0Fods1QWwcWuF/CBmzVa1pacEa+GX+OrY
         hHoIdA6VWyLvGvN1gS0byompRL9Okms5qvkmeVsOWAyosal0Jp5nGMlatq2NZCcWDc1a
         G9Du1818Ma/b/Sj9ksgnD6xkYEJEKvcdNXY94gGIy/RH2eedCDi9L/KFJv2zvUpHVvfc
         650lm2xQ51fzIVSm6rakXQ1PP8iOuaLBhiFcRGJEl9jGYyw34maKCsTDH9FgQtXC5JkD
         kPWw==
X-Forwarded-Encrypted: i=1; AHgh+RqI2G2Y9zqZNeYsxg6U1MUFzgJqji5OXRTTSsV2uVpfjdC7hYEkFrokZhGt14c9GPc3LU7fn+9yvyAHWcI=@vger.kernel.org
X-Gm-Message-State: AFuF++mVIKyLpiFGz0gPngiueFn3JaR38zi3n4UNpiA4lT+5fnQrAIog
	lUjulnh1bC4mwUDZ8FY5tk3xSY1GKl9bmgf1o+JSjFB6GEVHmfBD6fYUm01wyrEd1nCSRWxa9a9
	5lKc+T4olNf7uFV/I3kR2RD9Z8387WGobAygUFDhm
X-Gm-Gg: AR+sD118hw8c1RqoRB0/7E8impDfxRu3dFIQ4FYAKerxhV/XjUDvRdNmfvQBDMxzyNF
	1xnjMf4GT18RR2KSVKgH3scp4eU6X/s1iNXRfasBu9/kOnckaFRyDcPw6hcHyHgM2PFQS6n7TWH
	4dl4DT8FMV0nV744dLfHmvJ2D0CAU0A0Nis8U++FuuXBbq0omjNj2n8F39LQfWGWvai2kEJL6Yu
	IQlACfGVOKx77WCUEEBT/Zu/Qey0JP4OXUDF1E5zxD34ZGNKwJ+z78FcxBHJBrp9VJ7wZGVtNod
	iwuEZ5xCNmzbl9rrb0OCA9CfCf4907Qmiks6niHWlAqXHkqhAmk6XYoHNDIjeJS3+/KoM+5XjX5
	VQXZbxq/FRcfJ7pC3SkTkoFhU7pBu6Ors
X-Received: by 2002:a17:903:286:b0:2c8:248a:5dbb with SMTP id
 d9443c01a7336-2d74dcbe867mr43946985ad.7.1787870153630; Thu, 27 Aug 2026
 15:35:53 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:35:52 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:35:52 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 15:35:52 -0700
X-Gm-Features: AcwNN1WN9_5wnj8R0zXdgU7mM5B_PNMO1_m9fHEFXOCMJ-e7juPFtPd7hxiDQzI
Message-ID: <CA+0ovChCRKkAga2sWaNCZms8Hv=2+5gSpQfkaN0eePs7eWPXrg@mail.gmail.com>
Subject: [BUG] quota: NULL function pointer call in dquot_acquire() with QFMT_SHMEM
To: Jan Kara <jack@suse.com>
Cc: falemi@asu.edu, Christian Brauner <brauner@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Jan,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/103-quota-null-func-ptr-dquot_acquire/

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  #PF: supervisor instruction fetch in kernel mode
  RIP: 0010:0x0
  dquot_acquire+0x175/0x610 fs/quota/dquot.c:489
  dqget+0x795/0xed0 fs/quota/dquot.c:1002
  __dquot_initialize+0x3ba/0xc60 fs/quota/dquot.c:1530
  add_dquot_ref+0x2ca/0x3a0 fs/quota/dquot.c:1073
  dquot_load_quota_sb+0x873/0xb40 fs/quota/dquot.c:2496
  jfs_quota_on+0x2a/0x110 fs/jfs/super.c:803

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
