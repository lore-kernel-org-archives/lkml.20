Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521B388E46
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887056; cv=pass; b=LePDlcsdbeSrEoErDlq56H8GOHOiTTbPqlxu4+HUI/A74e+nQoPKbnzPlUPo+5kFpu8IIdwauSr7cc3o/YgiEX31CjLzR7EiAuqivuGElurA0nDexFtzCKPOzd91MA7GdAJdh2i9ZEfkdLHIDObBqtNx7gOp2/4e3+lDYrgBcjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887056; c=relaxed/simple;
	bh=S6BJDPm9RZGBFT8WPPhx+61JG7HYMFtmnnPKJ0tFTh0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=BwUKjxwB6IEs8G4+8kMkQOfvtN3kPwmNldUGsteSnH8CrajefR6QZRcSVl0h0Zv9Lgj5uG4o4hlbDkvMz21sdBeDv+yLEQr5SPxdSTmQBOg0kvhzhUJbQ/fuKn7Q0QsbZLHHvVEy10smlDfZtvt5R5NJ4s2pvDIkCndzJL8TI+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=cQK4O4zh; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="cQK4O4zh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d58efc7356so4544875ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887049; cv=none;
        d=google.com; s=arc-20260327;
        b=mDmS8+QNV+kkoKdj6CA7U3wNUsAY9u2udQzxeeANEUbi3qoIFo7k8OGojJ6otvc/ol
         2mMCZIph37PxgRQcnRxkBo88By8PbkBFj4UydchxSzvNT1OjkXwvW+NxKjMpfuikUkd2
         GeLnDhX3qpenMcPadIsik7qDYq0vovzvAvIJxOW3vyzq59sISLuOoZlLcKnmQCQfIsms
         2ab0oCfL0tN6kC4lZMQL/vNvUFrGKixnTTskp7DsHx5PChBGxqBwTQN/ceqa+dVvqVIe
         PEwiiOYBdrsPvKjp1u+4bQi7yOZJooFLlmugE2k066B2o6SQ9pRmome4N7zYRcmd8X9W
         nuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=tEC6VFBLKBdB4JV6CKJb9tbv6iJb1aKmtvza2AxjDL0=;
        fh=XsbA62UjXI115yoAPfZiZarl6Kjwhf/2T2M2bw7o8Yk=;
        b=fnRzVT1+ncNCJQx7xHm/0ZtIbeAaPhs4nn8q506YiRngVbvMXi89qfOllfbRWpm4sx
         Q0hPMjOz4/TAZ7CRLXZfzmgUPTfjkT0yaW4atQpnym9jrN44GDIOra/SkHDSRU+pfT46
         Erbasj6ee1iFcrZV4CvrVUrnbyTm9VEBgCnnBefEiNj+lVIHU8NBHS1k/qS6fbhBThTQ
         dl4VGgZF9PQwhQPjDARrTE5I+hMy9d7cPnjutdeCNFO9QiN19Uvr0CxZdEcw/PXJ05su
         svEHg2sxeqvNcpB4HCFO7UlaI1Z2n4Di8XQPsNb+h8pczWN9DXgbkO9ysvUHXH9em5JK
         juGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887049; x=1788491849; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEC6VFBLKBdB4JV6CKJb9tbv6iJb1aKmtvza2AxjDL0=;
        b=cQK4O4zhClDt/ojD+tu9FVF7tPPpd9YiV7bpLH2/BuwPF6A+YMEDiLEDne2qgHKolD
         G8wEVoef0qAe20pqROIzf7lNWxpBwYDHm2sfJjPnZIfmNYafj7d+jwRxx3N0ycW6nFrU
         B8NCbrORvkb4Q+3vmq1Jp1Q9k/WYBPAy4B4c//i+wE4/gf4PU5S2HCTaBMgi0uDP2O/o
         aOAca0hwlhIrTvieq1kjbZ7e++qAceKOx5h6qquRsQNWjXZzKGxHnSZ1r8V/d9TAsihZ
         noFvw3WKTPnSfCLKbmnS3tOfFfx9oXH6HxBWSeFY050DyXdxj4O4au/EI5yvQbDkYSaI
         y8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887049; x=1788491849;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tEC6VFBLKBdB4JV6CKJb9tbv6iJb1aKmtvza2AxjDL0=;
        b=Kobhpw9Vx86/8VDh/zmwG3nrL9aICaUvp8RdplPfnhF70r9JcMTVWtEn1mTxmgN3Lf
         CxxI7eai4fqkj+OuA+DDaHFf4A8Vg/8n1s2YSg57Vo11qxmUKETzRVEJSsNgLiYCWSG9
         wwBjFDlFanI8PveyXPlnnrmFjAy7ojUPu8PQiqtm+2sI3mROWFWvcFm5bzVs7See7NME
         oakQc75T8HpDpWjUcjE+wsZRhYdJy1+26jur9XC/oc3k5S+1Yg/HN9IomRgpRVy4/XW/
         QOZO72IQ+7R1ButlLxpUN1obe4u06SkTq3wb43Kcux7n7IcXaAp/kGvZTJaJNODT2/cw
         3uzA==
X-Forwarded-Encrypted: i=1; AHgh+RpO8h4DK4oQ+Q8dhLxQRltHkGh8T2CQpsfQNnP08uPGUQEzFNdgMLaEUS99eOQNYWyuQumEsVbk7i/mFBA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjchuuTsYRueEEODP/STmwbk2yrDLRVTtQLgIxCXQa9MIMM1ta
	amUta2H4mUL1w8yMhaNH5Fwbu4X4F0BmtHiX5VsOatOn45s/ib7nKgmLbfGD+FNO6nhjgO9Ci71
	/dPJPfkV5G+W10ssyEZccEaO2jptVQT4f/SaAtNR9
X-Gm-Gg: AR+sD11MAQ0yQ0Wm/QvsB/9vTICNnGXRkFOHwTraHXwXn0r2ygL5kY7LIL76CFvCU3E
	qKHtKD0e1H0tC/MSUGm0exHXjkKaYvLE635jO6B/GtpuxK3n2wW50PY74XXlBwLousqiAY7X1N+
	dvd36wXzYvUEw86Kd1B+FHhrrQk7aB/O9k4X1hhS5Yu8HN+wuxt93N4BbcCqkeYcBeEoEEZqM96
	Ja/73KJtn5t5C+vbOjxqcxMe+LxnT1uS0oqlyIvjpucEvDnUiewEZiU6sSzy6r5juq3guOqvw9o
	banBpsYlA+/UgyhqtPM6EW8sU9oED6NeveOA3MctaHV1z8lwftTTIMKicioC2Amo+Ss1YIaVYaj
	z9k5b2apmfJI6cSFERb/JmUXB1xJnDMVm
X-Received: by 2002:a17:903:286:b0:2c8:248a:5dbb with SMTP id
 d9443c01a7336-2d74dcbe867mr76376515ad.7.1787887047796; Thu, 27 Aug 2026
 20:17:27 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 03:17:27 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 03:17:27 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 03:17:27 +0000
X-Gm-Features: AcwNN1WzhnOCli2SDXHrwUn5J_lFqhLJhoFoqpoitatUkM71A_90zZS9tLQkUuw
Message-ID: <CA+0ovCgZDiT-7gRM+VtvwRpjycqDMkB3J6Qp401NyqvVbjMaSw@mail.gmail.com>
Subject: [BUG] WARN mc-request.c:528 -- vicodec request objects are never completed
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/126-media-vicodec-request-never-completed/

  req->num_incomplete_objects
  WARNING: drivers/media/mc/mc-request.c:528 at
media_request_manual_complete+0x173/0x230
drivers/media/mc/mc-request.c:528, CPU#1: syz.9.775/21126
  RIP: 0010:media_request_manual_complete+0x173/0x230
drivers/media/mc/mc-request.c:528
  Call Trace:
   vicodec_return_bufs+0x246/0x300
drivers/media/test-drivers/vicodec/vicodec-core.c:1527
   vicodec_stop_streaming+0x48/0x750
drivers/media/test-drivers/vicodec/vicodec-core.c:1646
   __vb2_queue_cancel+0xba/0xdb0
drivers/media/common/videobuf2/videobuf2-core.c:2199
   vb2_core_queue_release+0x2f/0x150
drivers/media/common/videobuf2/videobuf2-core.c:2677
   v4l2_m2m_ctx_release+0x2a/0x40 drivers/media/v4l2-core/v4l2-mem2mem.c:1286
   vicodec_release+0x94/0x110
drivers/media/test-drivers/vicodec/vicodec-core.c:1947
   v4l2_release+0x1ad/0x370 drivers/media/v4l2-core/v4l2-dev.c:468
   __fput+0x435/0xa40 fs/file_table.c:510

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
