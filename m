Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872DD1EB1AA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887182; cv=pass; b=pbBv9APUtbBCAu8dTS4Qvl5sCC1LOrVT5kvidNmRgDpjth5y6An8/8r01bQAQZbf/r40pVuHpchMvKeBHb+B9srDp6pNEtB76vL1i/bFfVS+lfIFQUEQhwSa7k5+asN7P4ESTCvvDjoY+1hsTC+JYzxSAabI9SXV+KwK9Xdgw/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887182; c=relaxed/simple;
	bh=6v1DNkxiBkWhN44uvEDqQ9d6fXfPP/V48jplGSY5fko=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZfmGmAaaNxXWaLvCAxJVp3Ua230cJGbdJtavbsCIoph/lL4cEv7Gx7F9Hx8YHhs2qOmytoZFbzWTv4k9hPtYiPixVlrYUgEGca+tt7OPQTvFXl74jVXcI65oDZQ30Tg8WddH5pEO8MOtkY2Kd087GbGnWiF/ElGyafyzuIu35WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=KFfnmYzz; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="KFfnmYzz"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso772147a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887178; cv=none;
        d=google.com; s=arc-20260327;
        b=o1ZD0z8rh4+RVEkb8Bi7MAeTZMirICHN3v6eYvg09FsMhE4tkdB2tnWkJwAdE9e58i
         l8Jvdk9rh7ldIhIRxqQzhwV3yKcL94T3kyBDLN1BZe8LlBsIsDZdZFkQvd7Hc2fSH0ud
         Zr3aGicbMS2GHO3NB69zy0xrPytVqeH7REG1cmZtd9pqSxNg/cloYTaezRQQRkcCkBZc
         25XvR0wYvj8lFdelr4rq7TZ9E9QPJFbqNH29AO7WBigILyJKEQAvjhGEmpECmvABi3BR
         fkbjGlRksuI0GToPwvPVgjdB8akCZAd2t1CF9xjn3xnf1yBDL2nSvk/cI60SzSjo7e4d
         AypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=EWxUj5wO5aZ/OtfFRw5HR5XoEpR7VsjOUdZML27dcVk=;
        fh=TqSFTFsGrR7IbA6hzI6iQtLTzA+fmxaBtBttSI/OzXk=;
        b=rUfX2DHES+lMO0NfLtnpdd1eOrdrtnEtzmDZ9Fecwn5AO+ZTIXYWfML+zy7upwf/Yu
         LRuJldfjbsB3N9Cam/kgZM9fI7dWz9+lk0aSyYKxavlUNDohIR5y9PLhR/JokpnA6iKo
         jrdkvDAvkFWokqDoSWj1/Rlmh/ePUAxUNJDwkfMRxztpbzz61vGcwD97KNVe4w2t7pmx
         iUx/uOtV52znhy4/AnQ1XdSuZ5H3PN+kFIIu+/3HfXxot4OlUZAMp9rPlFJzTdpMC5TM
         4DpYCGgbyGazPRsFMxhRfxbWa/PMnnS33m6AWWuavHYtAF3JeGs83Ysw/Cx05IX/cbHC
         omig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887178; x=1788491978; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWxUj5wO5aZ/OtfFRw5HR5XoEpR7VsjOUdZML27dcVk=;
        b=KFfnmYzzSMMfGiU9a+k2k0zZhrfIno/l3UJlAFkTPfKm0XQj1FcoviWHtQL2wAy1uT
         GyMeM+QjpcRpA1mgWhmJweH47Q+50H18cDw2clyM/3Rd3kq66EA57zUY0YB4hw0QALK1
         utF+gb4B7JZ2YZL79YwH7AryubJjBUVbUza0IL7iycCzJBzMlAWyOU/DNfvLmcP+z66a
         teaYGsS0b89CSEmddh/uIr6yHkKP5fUfPCQmYZI1EQH5OwpwVnUw0PIkf62MOmtHTHlW
         Sm+heGB+26Nt077lFv9U8nypAwDSOOziFKj0aarNTlWAiETeml542O/N8unfGphvRJC9
         Rxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887178; x=1788491978;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EWxUj5wO5aZ/OtfFRw5HR5XoEpR7VsjOUdZML27dcVk=;
        b=cxBN7UrkUWMACzprxjL+DAvDjVQZmXUn26yr8tqPMwABG0R5q8UUJWk2SKIeLzqxDe
         moMVNV4YE2V+/rfsiPTYY0lNpulfuCUe7h652mtPP2DJBvEr+ft9SGAsXkh0bmesI2A4
         rArvPjtb+9/x5Z33n8mmqnEE+MaCYJI0rJy/p8c4UYtkKJwnmWDFKuWFmPiEAD8rf9YI
         VbUCdYeSzKSLgx+kGk4ZTfNFqD3byRh0Zrpi7iMO6rP58pXUlWIbGHdpZ8ngwQwzkdrt
         E0h04g7gaPpNmlqN6EQRjpPBQD91s2JqYklPNuf3oLVd9aVtlTF2MiF5yaxMPZ7Lns8t
         xPHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOJo0HpWdejY+FdW3H8IYrw7DBNp9vacazKA/O8ClP0Xf7tvVbXxRxPtWPZViLVzoaWXSg6DX84DgIKqE=@vger.kernel.org
X-Gm-Message-State: AFuF++nVxKpQUG0jyN3GDulXl3q9f8l7NGalFQTn9jSOafmxzAX6Bp4H
	y/D2O50C/Mz6QZq02L1WokL89aDaYaX1AyIMOmVIRCmCTJt4D3t2Dt5m0VtjMJpoR72sQtEq5mM
	rE9zq6Quouo50r40ohqdDLbx2Q+fmpmAt3k6JOK3v
X-Gm-Gg: AR+sD13e4BI3gxEIdktgRNmmJpKW09JibhDLUBP5m3e6psyqj59iIDAOp8qK+e446mV
	nRNelOY3OQX0L5rBIgYfpEOXBpGNiGvsw9S5YbLPnW09T5zL/k4RoxVnC60xCZmVCJ3k6hEtN++
	GAA20LH7K4ysDcfnlCyPy83xXNr48Ny2dk6OQqUStNfCBn8R6RqsB940JaJj0o2WFCfwOQWjSb5
	pqtP1Aitazz40/XZoNe3EuODQ1qpm+jVqsLg5v8FcI/XMDzpGCLavGDAdoHNDNcQAJ/UsmuM/CB
	xHvuYtkXhuL8gt5vjxijDE26yCOk11f7RLnhbzg5uSyb/OjYmAonvg5JzpCHOJmWeUMvbcRujF5
	SGIwPqpxDhH4w+8QFsq00vTuPj1GXkw/QTsN4lVYuwUs=
X-Received: by 2002:a17:90b:54c6:b0:36d:b424:4f17 with SMTP id
 98e67ed59e1d1-396d0e24bdamr8142429a91.1.1787887177515; Thu, 27 Aug 2026
 20:19:37 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:19:35 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:19:35 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 20:19:35 -0700
X-Gm-Features: AcwNN1UD1KOGm6bAvHsZgWaK3d2CH3iFRF8lKNJLK6Psn94h5DYc8vweZSSZ9cQ
Message-ID: <CA+0ovCgforg-XzdODxh9axazFP8M+hFj1wk=XE05oSGz9B2Zzw@mail.gmail.com>
Subject: [BUG] gve_adminq_release -- unbounded reset-wait loop, WARNs then
 spins forever
To: Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: falemi@asu.edu, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/129-gve-adminq-release-unbounded-reset-wait/

  Unrecoverable platform error!
  WARNING: drivers/net/ethernet/google/gve/gve_adminq.c:378 at
gve_adminq_release+0xff/0x260
drivers/net/ethernet/google/gve/gve_adminq.c:378, CPU#1:
syz.0.63/11869
  Call Trace:
   gve_adminq_release+0xff/0x260
drivers/net/ethernet/google/gve/gve_adminq.c:378
   gve_adminq_free+0x78/0x140 drivers/net/ethernet/google/gve/gve_adminq.c:392
   gve_init_priv+0x2a8a/0x3450 drivers/net/ethernet/google/gve/gve_main.c:2509
   gve_probe+0x61f/0x970 drivers/net/ethernet/google/gve/gve_main.c:2892
   pci_device_probe+0x461/0xa50 drivers/pci/pci-driver.c:489
   really_probe+0x267/0xaf0 drivers/base/dd.c:709
   device_driver_attach+0xdc/0x1d0 drivers/base/dd.c:1206
   bind_store+0x1d0/0x220 drivers/base/bus.c:267
   kernfs_fop_write_iter+0x2fa/0x480 fs/kernfs/file.c:352

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
