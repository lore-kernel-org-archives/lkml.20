Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59201FC0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896300; cv=pass; b=FOPKdy95IztMu+ekI13pdYdIMn57MvZwk3ii9yd8v7EfqyM65gwBmpSeCt/bzzNzYZQuTIoL5VX24S0fIP1MmV5oTCLhkbEOcDKr/DX02gzBxeD76tS0Y3CyF+mEA8VHFkeU2MfIiHX5WDWEFzx9EiEyydprz5j1Q4Qi4fqyWCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896300; c=relaxed/simple;
	bh=Y2TG9nDzfuPTicq7OJCpPe2Xp11ubXsgTq3We46VI20=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=duOGNsGgd+CJaXKsC7Hpdly/3F1K1U2Lk1GWHoUrvURAiEtjIRdvY1mFRK6jSezN6VwOeLfCrzzoHEapwdTTKbTRdb2Z+/oyK0iFH2jDHUIQ1I5eEzOCqe9KgjR0YUA5cSrq1lz89mktF/Wx+BkoIzX6lk+l1oblApWm2gFQ7nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=injT3boP; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="injT3boP"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso735143a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896298; cv=none;
        d=google.com; s=arc-20260327;
        b=E5QYdSmavKMLUi7XnECrUfRE8orjz8wyhrCYPUR0K7c7kyMx6C9jyvjNffpMrgewU+
         SIkR6D9gxN6CJyvLczaSkcnuHH7vCPLa7Yoq3Ie0NEuY6LTwmbjGKYvHKJuzjiZSU8qd
         XESyJ+uJ+lx94qX7nr5yZNahjsKqESf9V4cYKeXgfVqh/VvykwyWgYy/sZ5cEvubimHS
         CFJjfRBarqdixUHOeHvTLYfCIjdO0ywk32EeXGQg+zYrnf+dadLcjySA/mONQblrgBz7
         6ORnUgR1YQZ4WicxDZ2c3wim+IsOKSLY5X9OQjqfiCambu8M+2ltNxT2gZtqkoIcRNYI
         7CZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=hm4xgC3E24zQaBzzk1libVX+Z8H8hDTIZxZvDCzl7YI=;
        fh=x0ToR2S6eGY+wOvmVnpnNZ61TXYBKuAriaRIQY+AE0M=;
        b=prs+RBYlA8t2hCsdxBkIxLL680SGPIZIk/lIYT19pE5FiUt5ClmR/s5sSYmhJZlD77
         u6a7v0KR/fyeG0d3MF/9mk6RgXf2AdM0KWViX01MrKU+9oZNdrGEq5CBLZasUamhmNoD
         Y6zBsRI+RKdAp6GqfaMZTIvpZYi1HvcdDmmXpOmISPEeSkvzmNFEjTgzLWjl0B1heWvx
         YXtTDDPqsOGYuOyfO2YbDu4MfycoiiF1YYD4L08X9pZWs5LAUhXYv31kQnt5/VYr8nAv
         YA/clJHqq9Gyqw3aoe1kETck+jPBRRGWtOrBTlfODExe3UvErdb/lfPE/l0CTdh+ai4D
         sL0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896298; x=1788501098; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hm4xgC3E24zQaBzzk1libVX+Z8H8hDTIZxZvDCzl7YI=;
        b=injT3boPiuWk2ULsiOkxn/DcKIRpjsCgEHUGZcnhWJdNwsjytduiOijz/IT/R7GU+r
         6ep5AeNNWfVxJGM6lnA+Lbh9amGLSTfsK6tS03L2vjLc08OJvLNYxRQPZQwFaE6sDXHZ
         f69oB0Sx17N/tX6kYrrcrLGC9MYUKxG+ql+RVMLZyHGeffrNvNPZ+oR46rj8A5r3sgPj
         Z8qAj6j7mp6GB3GZmyGf2wVO4SJ9/6YkvxbjovC53fonsIN8yGcpxPIvhzADIDpJ7+tS
         xSO4JLZUKOWjxNci7sikilU8qnO72BVdjJdLBNQ7YrqblysCHH5D4RCvmknWJUYINGM5
         m2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896298; x=1788501098;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hm4xgC3E24zQaBzzk1libVX+Z8H8hDTIZxZvDCzl7YI=;
        b=jbAwqOwU08hlng7O+PL/vYJI4ka4GesQrquIhsosm4LZPLTes6p7EFisqqv5SNQbAb
         w66AtFAYaDfvo4ZjV9dbalFaQNOEg5aS/n1dSB1BwVn9k8sbrsy1R26uRdvEGqt37JWx
         gOkBQLzBsLcPfc9J5BF9ZPyC9yaUWlIgKjJwAvhcoEJM6P9/cgmy7dgrbS/fJp6b166R
         nLU1tWEWnAVFIwyYbk7vi3xXGXCdzRazfrlvzXaLtDMeYv+usNfkCj2QvJ26+XBLt4Uf
         G4BgV8QLwHHLPLOeFvpMQQKmMnz2GXvdH25oor2+pFPjBOfSIh+LCyJhQ/eXjy0UKhdh
         EGAw==
X-Forwarded-Encrypted: i=1; AHgh+RoT2XiJQZAgshhifHAc9D/rzKI/ncDHF2bH4WNFmMZpAcyiJNEOoqv6KdGrhX/lK+19FP0pMOUwtAq0vIk=@vger.kernel.org
X-Gm-Message-State: AFuF++kh+yMQlVR4/8bGaHlLAZaX3oRQ30QsLQwcwmeutXc+lypPx6+S
	QnTFOL9RI1x3mu6TZHIiCMhT3AHebldMLMNcW32jUOvO2A9VWmhJBEtkAIBBVj9zPxr4poskyM3
	piEuJBK3P0I+QM/oWg34FUzvtJKcGhFROmmJAyhxy
X-Gm-Gg: AR+sD104UYyUjOI6Ut9xFWCBufTVr2jPPei0IgSDWGm9eGNHYpLfBqwVrrYc88XAa8R
	i4Z3v5LeiPC+CNcNKbbuiTETYSXMAuJezYCKTBwOTHx5iag2gjjxAK9784AsaIXrgxIlASVTwRk
	4DnkkReHUhJqwblytdSg/brgpNwHc6v1niskMVF9bbC13zQjO4wu8k1ZlolSVJbD8bm7irvtYba
	EPhtnKpBo51rpARtUg+qZ/71ZtuoViQtqXpr5oIcsvfWiPdeiDB9ksC+w6tq9htEt2p6M5Sh7yh
	b269zhZQnP5gGY8ZMlFQaILHhj7oXRebpFO0cw9V9PVMibkNjzzPQLWc+v15FBBHk7EV/nVlTb0
	q8uaqZW/oGuU8MexXVXImJtLfIaNlk+oe
X-Received: by 2002:a17:90b:1dce:b0:38e:5b59:c2ff with SMTP id
 98e67ed59e1d1-396d0ea8b47mr9762281a91.3.1787896297232; Thu, 27 Aug 2026
 22:51:37 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:51:35 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:51:35 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:51:35 -0700
X-Gm-Features: AcwNN1VWv8aVvRqurvOTERaQEJoSi8mJ1UC5bMOE-DaGb8jyYaB-qud6ia5EklQ
Message-ID: <CA+0ovCjSR_YcGORgj8Ydab6HtzJDxjOHZx9OU1L8j0PC-KSXmw@mail.gmail.com>
Subject: [BUG] UBSAN: shift-out-of-bounds in dm_integrity_map
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>
Cc: falemi@asu.edu, dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/193-ubsan-shift-out-of-bounds-in-dm-integrity-map/

  UBSAN: shift-out-of-bounds in drivers/md/dm-integrity.c:2106:52
  shift exponent 138 is too large for 32-bit type 'unsigned int'
  Call Trace:
   dm_integrity_map+0xe14/0xfe0 drivers/md/dm-integrity.c:2106
   __map_bio+0x5e8/0xa60 drivers/md/dm.c:1426
   __split_and_process_bio drivers/md/dm.c:1760 [inline]
   dm_split_and_process_bio drivers/md/dm.c:2034 [inline]
   dm_submit_bio+0x73f/0x2900 drivers/md/dm.c:2090
   __submit_bio+0x475/0x880 block/blk-core.c:644
   submit_bio_noacct_nocheck+0x467/0x990 block/blk-core.c:755
   __block_write_full_folio+0x7ee/0xdc0 fs/buffer.c:1830
   blkdev_writepages+0xef/0x1b0 block/fops.c:486
  Kernel panic - not syncing: UBSAN: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
