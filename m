Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A003C0A0E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895690; cv=pass; b=a6efrDG9jDOkJntBCCkahHeVl94bISQa7kPr7xRlF9rYtUYceLyzB5c60GFE7GHGCn9zd/Ym8S+JnfVchzuaO8bF6aYCVB44IuQ9+pjugxXn0EoVIxgUXOl5s9iGOH6cvwzB9LCsd0u29FMR6T7V43g4VSw8g1hLUFDBHcZhyCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895690; c=relaxed/simple;
	bh=FpRfL5lfPjmS4t3BzabtcAEE79ezROlAJhTYTRP4nGE=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=W2qfEMITn0ztKHoH19xvvrG6d4z9BCtjMWq/Y/+IEVpYIRuUuniU3gG11ApTw2UpvQmOb9dUZ4wDYMmKQQXGc5V6F98RI4NUY/518mNfp5aT5DK69gQRtnxeK6S3Am9bjvc8hscCdQdsdEXnS3J+J+9SEAPpkSRfBhGsYZCfU5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=DDgiRwzz; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="DDgiRwzz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6e954afbdso4633615ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895689; cv=none;
        d=google.com; s=arc-20260327;
        b=gX/HTiqPrsNnUt1zhPKiE1R5WE+AOhE3+iRMVFAsMfFfHSY/t/Bs3zNkxOQzoa+svj
         VFaQ/aW7iuOIdX2H5hvGrAsvX3zo+Bcwn8mWPwe35fRtIY38htkq3oqStaQ/QpyAURUu
         qOCMk6qCcDyeqV4Lr2SoQSBDgI3PEboe+OEbqZk4494EKfzqT/GY0bowMHv+KcBJu+wT
         Lex+JKHgb/0hTCqcS/GRmkgwnih7ofE9AJbIhkl5GXD2wV7Id6WqWStAL63biKrY8Ij3
         TEqIVhYnMq8XUalvF6YKoaBZAaDp5EwVpXf+CW/tdVmOF0hv7iXZbvyDZr78rkVtjiH3
         UJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=/MJbseT+p7zFpGuCMqD+oQVz9Xm3q5SOETrehnTvJUg=;
        fh=db2c3F8w4ueX8zlI9SZWSLKVoTXwIt6yXGng0QnxMDk=;
        b=c+T0m7Z/b/WEDxMA3ZGSzSu0jCz4l+vkNRplp7IbGj5m86xc455RMZ2k0yVOcTl19t
         liV/5gQYH3+8hgUZIduy3YgifIOpwd/f4defjnV2I56PMkD8TinH6dnyXMoLTOoqLmbX
         /qIb6nCUfqFPfJ2eTC1Th9Qvdkgp9r7ubvR949qIx3oDNfek9bPb5b48JNe1akreqqKS
         Pp/k5D/P3wxR7T8Bze+Ngh/Anlr1iU2tMl/91i5kxGAnnsV9/zDVtrTPxDLFAF78QKNH
         4UMJfQcpqWOX/Z0O+RXvxvzxezzzcCCgM7pZH29WzIqXsIPyJASMQu5uiqvPmACN4TJu
         n4cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895689; x=1788500489; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/MJbseT+p7zFpGuCMqD+oQVz9Xm3q5SOETrehnTvJUg=;
        b=DDgiRwzzniA2prhiu9lNTzqXEdGwx9MvKGlXd1RDEy1ipdw9XJYUojwcKUYWyHQdAy
         SFBztF03rkqnK2hweahDll2STWpHzeHOBHRTFoN19Po2qNWF0+gKFnfY3KA0ivI1vWPA
         0MoZ0Ppt7Yh/z8ZoCR51Tv48yX8LV+VjgXOIpDWq8NOk7mnqWxX59Lqe6lF3DpSqFFT5
         66+NZ3aHGCBJ4xgCI6XhE8vf9GkmGMmED4E6/UWoIw6HRxCrZIAKzcA2DqY32f80qsQo
         5+LQQorqz3zG8GjfjOKB/8A5zTZcLUrS02lOqmSoju57MjZf2cBvducLsi/VSLTDNch7
         8nZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895689; x=1788500489;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/MJbseT+p7zFpGuCMqD+oQVz9Xm3q5SOETrehnTvJUg=;
        b=jektSKQuLYDjeiL78CVMQNvnLBs1zqiCwVbZXOuUJNtU0NWnC17rmoMbRzZBAuVilW
         uCPBexTlRmjTi4sJ5Z0kJRZMqVKORAoNmYK6EO4Gs5gGAc8X8O3IhCeZbskr9nW1Q20k
         5tbKWosEwDD1220bLAFwG3EniQi5pNjwD5LP1ng2LG8OlKpfjiKN694OpsBzpdgyhw1p
         iECBUNyO1vo2PIkHvdcUskY7tju8zUCtSKDGPr8Y8zdNdLs03tpd3b1NPrOe2nT4oX3A
         xc1h5n0PZvHOq6j5+YyY175Nw7IvhpnerJEyebmHAKx0qb+Z5r5jLV1VS5kQUxfsW9A7
         xd3A==
X-Forwarded-Encrypted: i=1; AHgh+RokPxEh2NML1cUcBj0mH+reX5Dguv5U9WyazUGslNh1G9Eakp+IZ0S2o3oKBR5bolThVbrM+svmsNZWgPs=@vger.kernel.org
X-Gm-Message-State: AFuF++mwYrGSPlCFihrzqEWN2Tejwf/xh9mvnj1FFWS9GZGuf6fPWgrE
	uFQKo1mi+vqnLXzC8HjG7EiUs5HG8GbWNmE/SK7GhHKDDSj5diSrTfqiGfppiCNqsZyWJYssNfC
	B/hYwYMq7Inf9WygFjOHqHiD4e0WhKmlRmxDmO3bgux8gbt3AEPefOA==
X-Gm-Gg: AR+sD11uo5Sa9PIuUc/hnzEKwc3nrw36Z4HCMtKHZKXZblhqVugt7twLsXdVB2FaGJ/
	3m97lhFExtaFzFIKcZFs8foL6HIcMdg0ymtd/4uzLcOo5fKajscDvx90+Yb5Zbt7QlQEER2IDex
	bVTjcqkbg7i22+TlTImVRyhQ6ePencBRpxNB3hWUvKt1PTCs59bxldEzDrvUQZvUCq0NocYOJEU
	n3K03O+SDxLFCCF22MVjVF5MaQX6tc35jHtTpbW094nJZY/mGfukJQSA199i85zSViVB7ODkkAR
	xrFZzLXUaoM9NID2BG+aY65gt8oQrXwEfohrfPdxl8pCXP7C+2A6VSc3JGuA1p9t5ypf8c1Inqv
	IwGLQWQt9YtawJ4h+1+1P0c75+v7JsQFShr9myseVoKM=
X-Received: by 2002:a17:903:388e:b0:2d7:44c5:1a13 with SMTP id
 d9443c01a7336-2d74df17b06mr87476375ad.8.1787895687710; Thu, 27 Aug 2026
 22:41:27 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:41:27 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:41:27 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:41:27 -0700
X-Gm-Features: AcwNN1UEe3I79OyOh0sr31OMDciwR0shZKMq4zBq51ZdhkslxCU-eJN030psQAU
Message-ID: <CA+0ovCh1hKPQ3DSXBdaf3MHGZKv3-mbSNiWrAETr62mDd1weKg@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Read in irq_migrate_all_off_this_cpu
To: Thomas Gleixner <tglx@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: falemi@asu.edu, Radu Rendec <radu@rendec.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/164-kasan-slab-use-after-free-read-in-irq-migrate-all-off-this-cpu/

  BUG: KASAN: slab-use-after-free in irq_can_move_pcntxt
kernel/irq/internals.h:305 [inline]
  BUG: KASAN: slab-use-after-free in migrate_one_irq
kernel/irq/cpuhotplug.c:57 [inline]
  BUG: KASAN: slab-use-after-free in
irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181
  Call Trace:
   irq_can_move_pcntxt kernel/irq/internals.h:305 [inline]
   migrate_one_irq kernel/irq/cpuhotplug.c:57 [inline]
   irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181
   fixup_irqs+0x18/0x1e0 arch/x86/kernel/irq.c:527
   cpu_disable_common+0xb27/0xd90 arch/x86/kernel/smpboot.c:1354
   native_cpu_disable+0x2f/0x40 arch/x86/kernel/smpboot.c:1366
   take_cpu_down+0xca/0x330 kernel/cpu.c:1282
   multi_cpu_stop+0x227/0x420 kernel/stop_machine.c:238
   cpu_stopper_thread+0x259/0x3e0 kernel/stop_machine.c:512

  BUG: KASAN: slab-out-of-bounds in
irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
