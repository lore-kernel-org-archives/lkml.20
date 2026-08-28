Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14A03C13FE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895210; cv=pass; b=lpRL1FHhK+rlRdoqACRxzOFVWVFekz63EFrBACiG0eQWoPTFj7rK/5rELhtmDVD1X1VGek0dSI88yX/uAElxotY0JUqFvmNauHpUMiamgad1V8j5PG49/jpHCTyqiFVCcA0Y5BDqiaWCjrxNrZhyLL810yXZC5qzGbgldF6k8tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895210; c=relaxed/simple;
	bh=fCXpJWGL0HsRKyVrjB0SFpLwZh2xB5IoQduFHSkNNms=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=jlg8gkM00fT0iD/InTC3+wrwminxLsW4dqtsMColC5u8huSOhX4W28AqUaZB0kGobg2mwPcwwWWMGJ41Zvyfh57FKL9SD993fDQfucKGKNIGqMjjmbgGe9oTZ9O1U3Mvz3Y80O5CFXBzKYAc3t7ssW4Ur03ok9XgLDxOmRewP8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=aC4LK7CT; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="aC4LK7CT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d032846c95so7480945ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895208; cv=none;
        d=google.com; s=arc-20260327;
        b=iaULNc1fuh0lN82VvgTEXS3EVdrCpEuzWjcQg7wP7ZpX7gORi4nOcMpgJE1VBV9f7I
         3m4HZcgKkCvjlQ7J3ca2w8Jku4th4bQUJ1Ur0zzIuQeeuYxKzuNe1CsNzVHR2axFPqHM
         NXmmHNvdE7bjP3Zu845METH7ylSaQ3g/8PvNIDy2Nsq88XiU9I+7I3b5ICpkJWNUG2SU
         vB8aH0OtQnFI8JBQDN4DlC1q52BqXA9P1AKrN55ozCQrNg4WKwMuodz3ujyFGhj7840Y
         rPiuEzGfXAdSiyHiGHnmwLVy7nEzWqU3BYNwtkoWcm6HyqelpCfuDSdQJd3x/SIlWK4R
         ewFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=7O7l+IQrbI/ZxxlPuQjVLXIxWYmvm7xGFp595JbNWyM=;
        fh=J/sAu1JxUiyhTN5t6v9/Dth3Q/LyshghVCKlN5TERgg=;
        b=g6o4umVHecGiSSN3z+itOfhBaGFMOgJvqVuAtmp07a0OmI6+98jbUHAO+SFWs50nI+
         SLBtu/UN9QqxHOduFW7g3Vtd8oqDeQYEBg+t/ygpDIApPK6xVnDZx1pMFblpi/ufZkca
         nv40Cb5TVSuP0YC6qFg6XQjk7dv9y6j1CJBBjyoz8CXXyym2sTlxpR54CdPrSwO6sCOn
         3G31YyB6pgYqgdt1BrOGSpnoOLyvbYJS+r73B/gbBcuXq19hKTdVtRB+tMhAhzyE0+OI
         E+YklRhAwE9Z5jLIayv/hGPoYN/gj2CR3XNv6uZOG1xn5GiKZKLZ3nOeNsolgdigDiR0
         xzYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895208; x=1788500008; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7O7l+IQrbI/ZxxlPuQjVLXIxWYmvm7xGFp595JbNWyM=;
        b=aC4LK7CTgx3artxtgAJCX5oS1JbOWR587WYW/biIwV8lTSw7xXFcMnXWAjq4/i80mv
         LYYHObMeKV7N4WDISfY2OqExO3rTAMQqzRmKWHJfM94H7YzavzujB2Tc7u6mUDoxU8vH
         WYJiJzXk9RyRwXuLJD2f5RXbBcEIOgvV+8e6MMW1Hw5Rjf+aCe2kFFT5FtCdqhnKn1Vl
         m63zQS2p9s28xAFiM/IrvAT1+wQFvBlaXMfOZK7UNG0NapSG6CZ+XHBqP6OzsY/nLTrE
         iHu83+GGiP8HzWOyF6cFVQK6wh9tv7E/gaOnrN6XERrM6+nFYun9J2nL4c6ee7Pb+H/3
         A/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895208; x=1788500008;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7O7l+IQrbI/ZxxlPuQjVLXIxWYmvm7xGFp595JbNWyM=;
        b=Zw6vMEo5nn2a5yZp7OfiWr6IzosoujF1ZxEqS0G0yOENxKQ6Gky96xs9uCYZFZFJeX
         h0jSMFyBKAyUfOtOX6Y/Vnnjr8mKvgkqwZ3HEkGfn8DKDUzcgAhDI3vh6F5KVzE6kYPt
         oitIkIYOf9GtXBcCnCY3D1hSVaDgRgdxbkGoH5mrtWKnFOKI9zBdGIh2b0I+GInZ5OCK
         86eAmf/tadlHI6IXbQMi2iSB8AOaoTWY3aeqYWiJYdaoJWrDIsYBxmKZdzFXXZAyb082
         x/DmY5XoWXI3WIzE6+IgAFTogHXDIgpIQiBJ6WKuu2XTFILc4OLEqcK/LjvLXI8S2Ghq
         mxaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpp4NOkXIPVji7mjJpUFZW/1ik8yBt9jBzGjNw34efj8+lMmb+nj/9oQNjju6+JauIJGlGQV1ltAFn6CtI=@vger.kernel.org
X-Gm-Message-State: AFuF++lgBPYdzf+P/TDD9DgNkMTh1FdwZRxV1Vlfp5WiOUasusoT7vT2
	rkCOPW33BY8yvWBJVFH/4wTdtQb/juu0sUh/G4giE3A8Rp3DFCGL1Cwve9hFspmNQ/9c7sA6gHW
	6Q3KVlfNcpeBkPoK+nRmA6fwVaMji1J1NmhHT+SAE
X-Gm-Gg: AR+sD12uHDBE4xG8/eifZ7xP/KQI0fG+pwyKLkxeuI6H1cxJdwBXpzNK4Yg1sugv4gB
	bJ9sgcLDjmRpOdXOUCvTAUMITF4LrDA+k422sGedQifGl5E2D2cHpmhbgETmurs0Ti1Mw7wjNv9
	SnCWd3oZAjdaMOtVJvrkBYzHNemurpaF3j+DMuRsvSYWflXqvlaD3zpwTnr3VSfFpEj5LaFjYAh
	QSF1rk1DgkJnffwjRncCFLMy42kAvpTleB5RTtG40fqSxWPKvCg11SRCZahlBAH9mv9i/eb3nyP
	tkjgGx31hRGcemckd/00BrOXeVOjNkVES8TP4usATv/UmFK8SJyAH3062gqcOUvgxVHkpQaXoCS
	3oWjXKWGgnXEMl/lbKBOmah4M0XJtxYlY
X-Received: by 2002:a17:90b:2885:b0:392:ca3b:370a with SMTP id
 98e67ed59e1d1-396d0d2f6cbmr9349899a91.2.1787895205357; Thu, 27 Aug 2026
 22:33:25 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:33:24 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:33:24 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:33:24 -0700
X-Gm-Features: AcwNN1UwGy6jymCAHOolL1mUNh6Gl_8QUCV28vDSjljrT3oZC7SNgIbgai8Hcvk
Message-ID: <CA+0ovCh_phuo7TsORd9dZGA3joG6rAOyXm=cv9+BrGgQb4w33Q@mail.gmail.com>
Subject: [BUG] nozomi: missing BAR-TYPE check -- writew() on an IOPORT cookie
To: Jiri Slaby <jirislaby@kernel.org>
Cc: falemi@asu.edu, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/148-tty-nozomi-writew-on-ioport-cookie/

  nozomi 0000:00:02.0: Card type is: 8192
  BUG: unable to handle page fault for address: 000000000001d044
  #PF: supervisor write access in kernel mode
  #PF: error_code(0x0002) - not-present page
  Oops: Oops: 0002 [#1] SMP KASAN NOPTI
  RIP: 0010:nozomi_card_init+0x9fe/0x14c0
  Call Trace:
   nozomi_card_init+0x9fe/0x14c0
   pci_device_probe+0x436/0xc90
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450
   drivers_probe_store+0x11c/0x220
   kernfs_fop_write_iter+0x3af/0x540
   ksys_write+0x150/0x270

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
