Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6063CC7CC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787870458; cv=pass; b=jxAkNJ/Ttj1IS+PpN+wjlmErTbxhreBke5lHjJBUJ22p+DqcXDLXmwb2dAqQ1h6k9pPo21NB3+mINm8qtd62mo9gKAvybMrZtP2s3/qns35RVbqHJwzr3sRASDwPowV7UnLmf685R984kjiOGWPJdb/fPxqUvOFncqwgMOuZK6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787870458; c=relaxed/simple;
	bh=xy7WqoU54COvpiw1YEq5PZEQttW+VvTOvnonjxXazbk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=jsFdKnNaNB/9JmPQZ4Bn1KI8iNn6LFySIwOf3JJaU71u71aezn9g0dPneAbHwl2zZUh+N527H9mvP5UNrHTmBrBVGFb/r27AuuYZkLWrcr2VhBFeO+2/2ZMhJnRz6Us2plqtYolOTFMgnsrUr6Qq++qwRK4/gff5HNjHRaVNAWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=SGSnA7/F; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="SGSnA7/F"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so3750315ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787870454; cv=none;
        d=google.com; s=arc-20260327;
        b=Pw5qo/UEiTA7glMLcB+6o6/SKxGpAOn8i+BOJJy13ylmvsTUYuNtRCJzLNnBj4fgTy
         T+AfOPYL1/GQVMlRxDtLWIw7Kc0P8K6lrugAfMFpYFqSu1gS/DVNCX2MhKsHHhPH0bIw
         QaGgCvA+5AvNckyR8kqKMCqHscUlJEXYBfcKwuSeM8Lw7xOtu2wp6z8csat44mNeYhDf
         fG4YtWdfkbub9i2UXsASbl+kCs8/mPxPyxSHqM6irj7kFm7RD4su1PJUw03SULwF2UBC
         oumhzvzDt8ah7OVBLq3/9C3ngCGhT02rJyOIRiIl9vjyS1Qj+Bc4ZeXvntfwJALSXGdJ
         O0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=CIDB50lueAj+PFqBN214GYxWeBOWs/vjCjjQsf4ZfY4=;
        fh=KvdNaIveSvaZkLFg2OA3ojIwH/6vS09qGe4DBqOv/RU=;
        b=iAA8zf2MEiFe5v5tdHmIwTXT7uplMfP35BZy1BoJpc4R45Pf8tU/hOvOTaSyFPE2VV
         PhNhbCMgcO6gNx121LYFjVYpAVzBpeqrTRFWNrksSHkAbmlhCrOvLa5MB5G6EW89J05u
         p1YaF31lif8v9+cyXUKgu9y7PpybknPA0lS/1pl91LJreHokBXlOLsmZ6pmLxJ7Ax+e1
         WtI586x1P37oUmwjdx2zoBSuJiTjER534Cfk0W/RaEetn8AnXwPK6ex5bbCIk9ZSSgse
         kj+TUR/ZVs6wVVd040otDz5JSZpm4n70136FoLVpt3lApg8i5kGw3ChHGh1jnkzEMFoF
         dZYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787870454; x=1788475254; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIDB50lueAj+PFqBN214GYxWeBOWs/vjCjjQsf4ZfY4=;
        b=SGSnA7/FwUvE1RQDcR16Wtxej/KW6lyUHRYM7qykYkFwUxBINQFgnbGQhW6cBlY7Cr
         uOSPsP3sm+JRR76xcEAl2fQ081gxNEcAgsNoIRhu9oy6ru0HUV0G9ItsaJUxtm0CFJsf
         k+rBIa/AlitoJHTGAhRsBupUgWCfT0zpYEqvKsX+Ee1bDGOD5+HYLAFJ4v0FyitNXbD2
         F8cgsZmPuIz/Ik+tB4waMuutvddYSzUsWneNq7lFqPr4e+yBWrCdG3oPtcH+vJJlQFCm
         /ZjKI9IYEn4g8hc/j9TH5DkeyngasX6dMflA3KlO8GY8jdAbR4aA5hqKqm8ggeE+u9HM
         j/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870454; x=1788475254;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CIDB50lueAj+PFqBN214GYxWeBOWs/vjCjjQsf4ZfY4=;
        b=Thv46F2b/dtAX5mdzgdkz381p20BfpQsnlz3QdU4QDI6v4Zp3p+V3oW7PGVI7NzA4k
         MKfMUdJtlZ63pAc610/xDQV3KblKOz2M5kwhw5nXF+8miHeEAT8NLBdWzMHrL1Zr/mPY
         YaQqJZuNET5O6A1o527WC5n+LtcPkMOcRCfLgM5QfGoAIjlpGQgodSk0SqS8DoXxBaIm
         iv3akVb7I8NMEzX7GOYsHx7LRV0oeh5Ua7KIdQWN714rcLurnVfGq2cQnEdhKE+dYeJe
         F0ijZHw6PFh1x8r2mKP8BZxABqnHwzYnFygQcnbtgjhkyklk/ZXmhdyif4CZC3zgSioK
         iXQA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9BTqKsllmJT1Vu1Ci9iZcCaCQiK19LpbfI9vCSTRfoErSHHemF4s71kwiwXwvmlcGnTr2y1y/xCz6yZg=@vger.kernel.org
X-Gm-Message-State: AFuF++mQVHbP8SN48xqHTaeVzCnuf6D8oefNE/YfHVx9KXBqlqxSY0z2
	ozzp+S+DxPzFepz8ztZzPGY7YiwY65V0Ests6HGnpEDv5lGTI79LBfy1P1tqhHG7xUW2hAgWCBj
	5H/iXQgRBJDb7rpMlzV7sQzKgMwTc2bQGmNRZ6OBP
X-Gm-Gg: AR+sD10Pxub8dM0hFTl0qvWuVo8DpeaXr2w7/zIIBkOYSn1MgYwGD2sr2kEDJGfhhCm
	yzllDt5IvWcVJnXM6dJkw2yQwf9bZmynfVOp94+SGxJxuJwxHbFD5oDovhEOhSH8ZqKhbIwhwYs
	t6vEExHCFeBPL1dJTqxKtt0XD02utMN7DnRH1A2PuEN7EeMCBsREptIVPFFmB1FjZ73W5Kbtm0L
	M2Z1kSuPQ3QUAec6Kc4pJ5hZjRu8iGj1OgTOWicscRPYOcC1IHrqmz15Odn+7sS8Xoowor2bny7
	/XoerherqACCg/ciLlAa6KY08fwzV1OWnpFBV2eD56LBwc/HITU4ADCvDyoxmJRIx95HEmY5pdx
	q5FlhSPt0sgJr4DkXXyCu6CzBghPQqPdc
X-Received: by 2002:a17:903:32c4:b0:2ca:2079:91cc with SMTP id
 d9443c01a7336-2d74ddd6755mr30757195ad.5.1787870453225; Thu, 27 Aug 2026
 15:40:53 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:40:52 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:40:52 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:40:52 +0000
X-Gm-Features: AcwNN1WXhFsG_EgHVDcHVZ0DL16H_NxHubEG11xu328J6Gx5EpXW73V67Xs83UA
Message-ID: <CA+0ovCghX57DY5b2R0RcSQOzqwS7uz32KoSyMJ0P+mL0xmev6Q@mail.gmail.com>
Subject: [BUG] mtd: use-after-free in blktrans_notify_remove()
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: falemi@asu.edu, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Miquel Raynal, Richard Weinberger,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/112-mtd-uaf-blktrans_notify_remove/

  ==================================================================
  BUG: KASAN: slab-use-after-free in blktrans_notify_remove+0x8a/0x160
drivers/mtd/mtd_blkdevs.c:451
  Read of size 8 at addr ffff888121a4a208 by task syz.0.894/19075
  CPU: 0 UID: 0 PID: 19075 Comm: syz.0.894 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  Call Trace:
  <TASK>
  dump_stack_lvl+0x94/0xd0 lib/dump_stack.c:120
  print_address_description+0x55/0x1e0 mm/kasan/report.c:378

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
