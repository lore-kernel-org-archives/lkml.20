Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD133890F8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872268; cv=pass; b=m/QO91thagusEyTa907KAcQ3Rs3XhaleGYFF56P0GiKa+7ntW1tlpyBrRFQ7Swy5LOT1i9GDNUb761iUdZg4g8XfYqSWAwC8yBkeDM564yk7EIalhFdmZ7yn2j1XW7qXxkm0ASxPpqWVR1xR9PIh7oFUUAzF35dx9kcb/IjDMLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872268; c=relaxed/simple;
	bh=ykliYNlRp0ZTa9p8bjUi+k7K0Pia3lpKqIyQaZvT8lU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=oJz3hWO3UYbBHoYsvVtFyZhjONXodKa/P9sCfJIyAfO5rJaxxqdrkCt1aOEO+BsiVgENgP+qipNMR4umk9i1PqEZyw5IGUfT1HyOOdX0+38AGpXO9mBUwha93n17BKSOSRmmNRNMREolEMPExNHhfmUDsumIRTUtP5Jzj5dAyoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=Rb25D2b1; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="Rb25D2b1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d7200b2e15so4432715ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787872266; cv=none;
        d=google.com; s=arc-20260327;
        b=kI9S9RlE+0JXgOzjvcQntG5/RlgocTEbdhqFtMoL5DGpmVPhG3uzywTKkoDUFt/5tL
         ym+HlZ+7N4gYCkkO427fg6Q7YNZcPpo7DNCvvYH/rDOtom0Bg0u1dIFXxm4TzIebrzOQ
         oRJ6bpeUFLB/WfilssfT3ky6kjmZxJ+SYWCemHBpYZakke9HSF7RrB7PE4g+0n/f9qDY
         Dl9HgtZw0BrAgNeJ9Ija872kT6VjQXGxnTtBGC9hTrySUU/cXkQs7TPsuwqS1Nigbp3v
         hehYJEdslnhUlku6ZWxPxsVf1PU38AkdnG1Fva2kKg5vyf09v9gDZsY/EjihoOFxvK+6
         R+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=OaOHOksjpEwsETf/w29tNkN0mLCmHUAIdh293WQTJbQ=;
        fh=6npaUtubNPaAf354V2j+moQvmPiAtW9ROrrS3rwc0lA=;
        b=mO7Nn4rgXhKxYRegrhatKP2S79rYVAO4An4eTgmL6rXhQSfYd/b336LtH0OC6SMRQN
         avFdpHH1VtRt5AM2XYBGyGpndz7Qjvo6DmK9yYe3V97mwNFS5fxhJf7s81/rPkXm+eUH
         j5fyPKbA/BgEvkc4gFMEztoarrLsls8q7R36zzHtTskR+HHsNCw8gLlD9S8i0aOC7FIr
         CxyZXtmRJxmrOXsEZP9ULrRgIb+roFT3sx9h60ztkyZ3xhes8sYB0dsyTwXcuX4v5fsL
         VtRIT5PykH/BlYeKDBZN9NszJHeQgPvewRTJ47f0BQQUuidxUZF4z2/SHfMtcK4C7dlt
         ggMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787872266; x=1788477066; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OaOHOksjpEwsETf/w29tNkN0mLCmHUAIdh293WQTJbQ=;
        b=Rb25D2b1kzf45RPgRrJfTIdlRwBYjMWHB+kseMlqvjTDfQZMod5ZndwHZKN8IbVhB5
         EXSuLTERpUPNRev+n5Qln3p2zAf2xi88DYEYwI5TawaPNvBh27LVXicgco+BibU1oTJR
         ZYG+Wyi5g1XT6J15NP/++ch28gqFr7pYB1skfLawMk9VbWjll4BcdqHjndqLeW6NT2+c
         z8mfF1to4UWsqFjWJ8bX3hPu+GWFwz70rAU5rzHorJL9FOZSb3MJ6azjS3Iq1PqeUsP4
         zYL83Qe6abaSL3IyIekQxL4u1V/t+/Zv4RRDXE7eITvBjUOZZu/geP1D2S7AaNSaCDAp
         nuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872266; x=1788477066;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OaOHOksjpEwsETf/w29tNkN0mLCmHUAIdh293WQTJbQ=;
        b=oMWcfmpZt6Qxd0FAlMZJGs6IXXTvT/+ThinXWt+8y4F1P9a2mB11CiTt9JOgLnximu
         Ysoqrsme+7u36eBIwbDWdLUdnei8Xc95DgXQ9wRbHZZbne6PQC8VfphlNliwLUMYHNPH
         Rd4TQozN3LcAL5oO96YTGHYQQf/v3fcXQ2ZUOqmjVjirHGY0nGze8iV/AtJjqqpoktKi
         HX8l0gRYM2MgK3wlj/QNy5lbx28+9APF/JrWlJwZxrMNdOMzPpDM4nMSAkIMR+H0qplc
         M2aa2CE1sgw2EPG8EYIqcKENZpifF/uVCK/fpgUV1GhYN9SSubBg3mzZUASYXZMUUuZr
         1Gbg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5pDhwYiL7JYib7PYDFb3orFiu5GMZzwUOL5SpfunCxv6pNb47It1HVFg1xOL7L+M7Zvm+Mj4IM8HZkWw=@vger.kernel.org
X-Gm-Message-State: AFuF++kndHNVVNGfiHZpECnQtGbXM/KN9awCfOxiiYrBt0B2Iyh/f6A/
	rt3RH/wUrJ97VYwkU8dl251YTo4VtK3V4qyV9xop2i9W2lhkN4fufV5gxTND4ef2Oj7tV6MUYlZ
	Sg1gCz/sVDA3QC8+jK85ujHlunYlfoZel/uCeVX43wLm9ZWCGUFlJmQ==
X-Gm-Gg: AR+sD12A8sCQwL9YonSSv0HR7FqCUv0tKYqlr5wSojyPeuHbRXj/1G/K1SPPHvt/ifm
	al7Gq/S/JiXQ2NDP9DXC9Hh/kqQPpTELdlbIAFb2Oq2pFjzYijaLbOjHPBubvMBsNgKO0PFZPL5
	Tjf+UQixmBHdfHJxo77MwVd+9MyovAq5J6RcNQcRFoo6nRernXsZo9PUCOuge8bL2bMOTSigskb
	VvxtIycJiS+p8sKuorVqY95WKgm1OYQQUT0r1OAUNrSOUWZU0p76zeLmhmFrJEYSgYISCZ9+YFI
	ervpWoasUm38RxJ+ZY5RtSC0BbuYBWHUUIRtUoNfSYqShv9QmFJQ794hAXtZdbl071QRf/3SNwZ
	lTe/NzqRIzDHSM+Ffyna3Ds8fYR/giS+t
X-Received: by 2002:a17:903:2b0e:b0:2d7:3f6e:5cb9 with SMTP id
 d9443c01a7336-2d74dc910cemr45136225ad.8.1787872264814; Thu, 27 Aug 2026
 16:11:04 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:11:03 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:11:03 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 23:11:03 +0000
X-Gm-Features: AcwNN1UCO-DyGHnolg4whJRtG0xeWHR7MKGEgfF-XdSV1SZOaJOw9sTbLP3xi4c
Message-ID: <CA+0ovCj+WxdpjdJWJmrkjjcK6WsZYg1agfiAPE-CYOr=13kjPQ@mail.gmail.com>
Subject: [BUG] v4l2_ctrl_request_unbind -- KASAN slab-use-after-free
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Mauro Carvalho Chehab,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/119-media-vim2m-uaf-v4l2_ctrl_request_unbind/

  ==================================================================
  BUG: KASAN: slab-use-after-free in
v4l2_ctrl_request_unbind+0x5b/0x2d0
drivers/media/v4l2-core/v4l2-ctrls-request.c:101
  Read of size 8 at addr ffff88803e2ae8a8 by task syz.4.148/13541

  CPU: 0 UID: 0 PID: 13541 Comm: syz.4.148 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Call Trace:
   <TASK>
   dump_stack_lvl+0x94/0xd0 lib/dump_stack.c:120
   print_address_description+0x55/0x1e0 mm/kasan/report.c:378
   print_report+0x58/0x70 mm/kasan/report.c:482
   kasan_report+0x130/0x170 mm/kasan/report.c:595
   v4l2_ctrl_request_unbind+0x5b/0x2d0
drivers/media/v4l2-core/v4l2-ctrls-request.c:101
   media_request_object_unbind+0x25a/0x530 drivers/media/mc/mc-request.c:474
   media_request_clean+0x11b/0x480 drivers/media/mc/mc-request.c:49
   media_request_release drivers/media/mc/mc-request.c:72 [inline]
   kref_put include/linux/kref.h:65 [inline]
   media_request_put+0x98/0x1e0 drivers/media/mc/mc-request.c:83
   media_request_close+0x38/0x50 drivers/media/mc/mc-request.c:91
   __fput+0x435/0xa40 fs/file_table.c:510

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
