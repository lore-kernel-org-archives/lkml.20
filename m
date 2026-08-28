Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDFC3C1089
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895571; cv=pass; b=AuFWTku/ivqPvj9B9Hr0umVnKo7cbc5iF5KxYrNXxUhkZWJKODeBR4ufFlpV6Q6+2m/31YJO+RYIQSEc22gDPCmIvFyzV+p3Y0TVAU4ScwEFXH5ZIj6TL/JEOoj5D+nIo6S29zBkJ7hXWtPGdYlcgfO9aG5camekYP7VoaLWiCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895571; c=relaxed/simple;
	bh=QlFU02FBYD0ENAEhOFBlExoO6aYJwlHfJ/OcJVUiWz0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=GLbNTgQjArpY7HUjzAUcetsHuMzbA/HdX/Nlc8AqLYazNeQgZgpPPAlJ/XpkYxGrCy/RLDmqUN/jAv9x6ZG3wroVNGOQk02ZGSUXSp15fhS+QRTV+O0zHs/OCtspNKQNVMKrjDOoe5v0ReTUSWiGVSM3Fw1l8x8LGNhZ4REalsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=prDMfhjj; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="prDMfhjj"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3968e063f84so576296a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895569; cv=none;
        d=google.com; s=arc-20260327;
        b=lAXczZ9RW7KZsmdu5RQrAXdyCBfYRGaEmRFiZs4OtMIhOtULx+8rFYMubqAueWZN8G
         EziPsxivv2wDLM6MSqjTC99Nqt45z+oS6AG2ysdfkr42xyzQrn8qporYPdnE1dInWivH
         KjorqVkeOJYQKqvdoO/BiCc0xHbk0MMfAxScBB0PwPjZ1E4uYdE8Im7JSBKAIS8AmVUe
         vS2nTJ3wziyokvyzwIT0Hniuc4CEK6UIBKH9Qm+UNugu3tw+mKqhtIKP+vUceyOsLJ6W
         8pgQB+J3dxDRc+HomlStcoYvGaa8lOX8PrYaoHZrJb4EWF2gRoW8HXJQdHOEJzvJJayN
         GWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=yd8Qwd8neh8JAjIOJMhy/tdm0ISC2f6EcJu5hMA0lJc=;
        fh=sraqTVeYAUqJ7R7aQqBRQvOCrOmkVRRqAwWUzoSdb3I=;
        b=GaOPinpFlatG5NXzoMo+O3S1iGPvB6HVVRmMRTNxoMsllBgn9lIyrqYZlkGcOijC9b
         WvACkWmI43dOA9EDvJq+R1THJHpVITW4WnQQYplnCb5pIrd4T3Ls9lltCf3GRiA3sadc
         +evExw4+gtj9iCi4iy+TxD3wXVdqlEy/De4QgEuEjYTL8TzERxMroouhIsi9u+6/ipUD
         h6wTyqr4QD2RDCa56jZ/DxVz5QMYuhHcdJ5nfLKF0Urnjj2Iijgw1K6wahBVTS2nV8ji
         2pa/sZI4zAFuNSXN5F2FgS8GyvUTnnhV0IOEgBa3CwJSPvv5dMv8mNj5iinCOHOBSAgA
         hr0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895569; x=1788500369; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd8Qwd8neh8JAjIOJMhy/tdm0ISC2f6EcJu5hMA0lJc=;
        b=prDMfhjjjZa1jNgH7zxJQGeAd/D4Tp8sumUnfbTEUgzCmJxcZgbiZ/RZisSd3sCMs3
         se3UcndmMLDNB0ULHHeHo0utfOVe7DD14B/hSrhMDKKpyi5mbgU0pJMT+orThqHkyZZf
         Qxig81kimbtdNTp+ZCDOOFol4fpNsElLiHCuS5iUoUY4l8DCLcUmMzEekSXOM91pCKCM
         RBNKXAraHEt176TU4jfUXKMGNQFQyKneBFXElKpkh3KJDk9L7lXpgLSeEjcQSdEEntJD
         eSx2AnaJUNUivSLbnk7qWGqYr2f4dcCuxgLLd3AvEIdbmxPopbQQfhuJtRQh5ldsFkuB
         Zpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895569; x=1788500369;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yd8Qwd8neh8JAjIOJMhy/tdm0ISC2f6EcJu5hMA0lJc=;
        b=pBjpnNe/5DifPwWxs37U6HxZxv2ibyb9wEYWMN7s9ZzmTG82pEbHomoC92ygdmUzPc
         aOekbUpiCl5Fx0hmDhjslGf1YJCUHda/N22fw3B8XcVtO5JM0PYdoEBJvcS7oFeKoRC1
         MH7+VTrn8s9EgQTIzt8gLH9zd3j8yA5t4CB9WMpR108JuwHS2fkLEb/Y/sKYZhO9W1jR
         qCZxlX8UAMaEngHTrAtWUkdn9/sLqfGoHP0qyMjJsRbo97vvk/JiDwrRomtiBllQUMH/
         LOKx7NfFm8+S/l6ZiIAuZr3pZhxeV+zOYXt1c6VMbMyUf8cDE7i+E6cVsZg6iIPUH2gD
         Yl3w==
X-Forwarded-Encrypted: i=1; AHgh+Rqvy88tUzHsTYg+48YonvPffYNSc57YhvYuogFejx7QSIGsJ4br5w+OvsPtY7DEm1lFYZMcPg/nYp62J4k=@vger.kernel.org
X-Gm-Message-State: AFuF++l6aa3jl4IpFDcUrK/PyLA77EBI6TDRJkuthoRGPTdhty8slGgY
	KVAk48utQ/9H8UHk69TNkqRf2SrbWti6G0zJh12tBi3gJ+4WoVkMq4xQ1HxhFMZ0FZjAtfZQotE
	52oDmOi/XcpEZd5UsFcRnGZg8fchLnx+2iQmSTgdkz5X6K9xgGtTGCQ==
X-Gm-Gg: AR+sD10LhRg4UQXazv1vFJkwH1/Hlaw+/oEAlnRTMybQOffDtj8lilHCmZ01Iviwr+8
	Kh5jSXoJDs66y3Y6R7DWFBBOa9Lt4YWmkomS+2QrbZm4J39XD+LAceKp3D3RaaIpJVrptY9XZel
	5VCYi2/y2cIWS/byvSSJ2YjLGyZ+HDBrx0Hw3SB5a/q+isledwtzW931ArB7aUboDX6Co9rOq56
	IMK5ZfDEEk5E/eszbC/ue7NQbek94ucuKZOTY2ega5VWgkU2spIi1x4Y6w6XUXN2v2AgeWJOz4H
	TQLmC3l2JNenphyH59mdHC6HB545MODa3apxb9N0fucq8x/nj6z1Kuh49GPhmmwzuaYmUYMIcim
	opF1cKT+XZhr+Lr3eP21cHhlim+HftR6B
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id
 98e67ed59e1d1-396d0e71ad7mr8017597a91.7.1787895568571; Thu, 27 Aug 2026
 22:39:28 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:39:28 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:39:28 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:39:28 -0700
X-Gm-Features: AcwNN1U4A4Ylj8SXf-cbazZXGr7do-xqISWUKchmfzBIts7bvvDX9NmKXUnkglA
Message-ID: <CA+0ovCiUbRrx4rYhmZaRU9ypM8rF-Ug0YpnzC9VwL_-B7rM6ug@mail.gmail.com>
Subject: [BUG] WARN videobuf2-core.c:2210 -- go7007_stop_streaming leaves
 buffers ACTIVE
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/159-media-go7007-stop_streaming-buffers-active/

  go7007 3-1:1.0: unable to reset the USB interface
  WIS Star Trek or compatible: error transferring firmware
  atomic_read(&q->owned_by_drv_count)
  WARNING: drivers/media/common/videobuf2/videobuf2-core.c:2210 at
__vb2_queue_cancel+0xabd/0xdb0, CPU#1: repro/9514
  RIP: 0010:__vb2_queue_cancel+0xabd/0xdb0
  Call Trace:
   __vb2_queue_cancel+0xabd/0xdb0
   vb2_core_streamoff+0x4c/0x140
   __video_do_ioctl+0xadb/0xca0
   video_usercopy+0x876/0x1450
   v4l2_ioctl+0x18d/0x1e0
   __se_sys_ioctl+0xfc/0x170
  Kernel panic - not syncing: kernel: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
