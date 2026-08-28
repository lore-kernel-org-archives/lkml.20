Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CF23C2785
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895116; cv=pass; b=ku071vHoDAErkcMcZYmm3JIT2MX6ku+N+2TR3rHEIzqSap3CY75NlGgrWxZ/w0N+9aJanqAOewMdP3nd/pM1VTlIaDzrUf3NS+jY+g9kgvcbE5cXeV9LSPJCyizG+nbbBn45ovar5xXD0WfacEhj8B49LEjSafV2dUP2dmcIRDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895116; c=relaxed/simple;
	bh=yxuunkrMCzjhTG9xtHvbfv5boTd3Y3kfwiIMXc+VbsA=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=e2ZJY+Rvk25j8WSBI20UUWHP2AUgOa/+KuiPI4bsEMPIMqXhz69yNHa2Q49XPgHHVfqcKkcPTOJPTt4nSq/TWtFzaFSHNeK/QbhLUbofOj28P7i4CaULeA4RILngEKbIy8SrChPggTuJhwXK/3SQwaqNXVjAV5jTKb6/26xBqEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=R4h+elCL; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="R4h+elCL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d712281f8bso7348965ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895114; cv=none;
        d=google.com; s=arc-20260327;
        b=hzGX0m5JidsPwvh1tFeCci2cJeYF9QW8hCOF20uGoRUKeH3Gn+3OE0jOWYIMPUMCJW
         hLd2sGv5s/AYLj1tGovb8IXpE9JEb2/vll+DMsMltYs6zOxSQ3huMDyGxFgrpi0YhzJK
         mAE5ywn9ZF1xhDHhiyKwIWba7wIDwSX468LYTSuTEhlDh4PMxjZjk1h3jgE7H2seCWy2
         0Hkk8rmS/qiDeBjVZsQKQ982GS5HnVlwtgm6DPi0MpY+JnXOCdD6m+pXteY7DJk9LZbD
         62qXk3+lULW0LxpbLbeTcmSep7LmgSsqkkIyeE7mclNQNLIurtCCQTOwGNxvxP5WzF2U
         O7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=/rV5wL5QxIwuoSfzmLGFHVm670pUqzdREIV4+LvHIJE=;
        fh=8KIA934SulvTmY8B4m3ekPywiD225rDu6SJgdHKNqOw=;
        b=EeXjssq7jKEyp8eS4W5dt4yN3JAF66g4yxFPyUOpo5fmgeeFBvxBza0GUAqGLt/KvE
         6+q+8+VTuB6VSgm/Xmx3NegQOn4xI38MF3w+zcny9h2GEsbjlWEAmEJfbFVtD0Sf1zmk
         7LLkn9jSrq+UzkPCDc2B3NZyjAvXnFFmowQqJKS+422WNCuUrwvzHKklXHryg7NNIl7A
         ahk9CVmUpW1KwhmLkm6sdp7cdFSTmlN4JYSfmRw647C7ZgPW2O3CALDCmWCbt4ykn8Ae
         jB7NWJrB8pa21HqDZuqqWpJc96Ii7RZ7itzVDypY3QfoZbv2EvDYS+jx04RUrKep/fAf
         7QuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895114; x=1788499914; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rV5wL5QxIwuoSfzmLGFHVm670pUqzdREIV4+LvHIJE=;
        b=R4h+elCLRgav65UwarTVwwkm6GHT1C6loy288wcZiMcGkpR/OZaJVaroMeJKkHoA0j
         jrvCqOodSn5reMSSGsjJU76ArZltGbsuBvWwF9Wo0uvFn71AedmlXdNV77bQ4M1Y8jOH
         Jh4J+CLsRm8dMZCVnXsfBpRE0rw7OBvmeJ1qUo5SDH99a8abA/3SPXRQH0jqvU1GEark
         IladaaXsteQWWGYD0ERRI7QK4XPrDGx/QvtBGW8XyyeSQXombzOfrN5DVA/Uv6dBmCYB
         3nhwgLDiCQZFb0y3im9rD21/A7czLXxkDz1EIE//ol+93r0xYtfTt4guyXORa65Z9Wgy
         oYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895114; x=1788499914;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/rV5wL5QxIwuoSfzmLGFHVm670pUqzdREIV4+LvHIJE=;
        b=KK7BerkU9XaI24Asd1helFlR4kRM8kkiK6QgsWGchJg8Ww2LMwYhzmENI/HYT+Pwkd
         y6qsIHQzFbsXvomLC5jMnsPkfmkmi7SwOtmbzg9deoIknuztIdrqup/N6OnBO5lZd8kR
         /PnyhHZp3tEE/cODuplU8+88RUZLTzFkD9GK9ZQ1Ry2XCxacClWTriYpEZFClU5F2POV
         S87+k7DmZnrZXK2mp0izDovdWHL6x/Oi9Ehx/DWT4pi2XjYiIjeOVkCy2vZNgqVepptK
         T4+scnbeAB4PQRp1CDAgS4Te9RjaVwaD85ZhEhzJDN/TsqjMMJk3y9K3Li7o6CohkuAA
         L5/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEJgaQ3f2eBTEnLOCNBiklbzZRncU+x60KYfp/wYO0K06XvFoEhqRfXhe/jGBNzdZER71WRRaCXsiHwZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++k4vPU817hN6KfHb4ZVSsJ0N44RhB0+nUMqTEsxMCJ7Kn722RAr
	/UxnQbrg1m+jwe1vEu1l/y748m7QkhzCrBAEZyFIR+CCe6lu45FMiF6rEFqkb24n/36Dz3tmW6J
	dn8guqyj04nte3wTiCR1kAxRwUJWG6fd0QTkxZ6kW
X-Gm-Gg: AR+sD11OPPcfp2Cu8SJq/MF/mu9oBM4cz84u9a79DRYwb/9/sQ6ozm1q2L078JQmVg8
	iwT53/PUOxCQXprDbbtZpGbipTrT9H/G9F4jOKqhBdqAiMP0ukNHNvWounVwYeHhXIYt9qXI7F0
	aHBshP6Qc6phLWuTaqKPmVxOlR7/fsiJzrkSYnazd74Ut8nG6GMPRQ1k8voCTLfbQWmbOlzEhat
	DBzk091s5YJyxslahTBlwQRGn2s9pg8nawhdwdbDyvbD6NayXJqh0i3euPLV9WMbbKDx2bNflYP
	MaV8WCRPhOZkhSgaVaOAQDplE1xIncF9+va7UWVKftXy/P4jLxXWKaNUZnPTXybfrty3i78+m+u
	kcvHa2bQdKCzV1AyPb3uifZjhXxAKzxfm
X-Received: by 2002:a17:903:9cc:b0:2d3:716e:e2ae with SMTP id
 d9443c01a7336-2d74dc5f3f5mr72274555ad.6.1787895113220; Thu, 27 Aug 2026
 22:31:53 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:31:52 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:31:52 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:31:52 -0700
X-Gm-Features: AcwNN1W4BQXiDrdJcKWmHqF4uj8adVeWI4wzh_jjoN2b-eJkUXCI69GFlOOilZs
Message-ID: <CA+0ovCj4o+=Ti0cG73NjoBtQuFcny8b4Mg0CKsya9oWp_Mv0eQ@mail.gmail.com>
Subject: [BUG] media: s2255: vmalloc out-of-bounds read in s2255_fwload_start()
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/147-media-s2255-fwload-vmalloc-oob/

  s2255: usb firmware version 0.0
  s2255: newer USB firmware available
  BUG: KASAN: vmalloc-out-of-bounds in s2255_fwload_start+0x1a6/0x410
  Read of size 512 at addr ffffc9000010e000 by task kworker/0:1/10
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   __asan_memcpy+0x29/0x70
   s2255_fwload_start+0x1a6/0x410
   s2255_probe+0xbd5/0x10a0
   usb_probe_interface+0x659/0xc70
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450

This is a different site from commit 330f2936ab76 ("media: s2255: check firmware
size before reading trailing marker"), which guards s2255_probe(); the read
above is the CHUNK_SIZE copy in s2255_fwload_start(), and the crash is from a
tree that already contains that commit.

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
