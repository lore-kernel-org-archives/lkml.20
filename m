Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32D839B94C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895391; cv=pass; b=JBk25QvQ0R1X6Os6JIzWdOfcU5j+6kTYQ9tRQP6jreB+z7idYzaIvzdkFA5QB4uywbqQFF+lXxOeg+DemfWsycVrNPi5zIwhm11n8jSR+Ba05rn2ivotCbSB5txMXsJSe3me9gtG+A+yV+0jvtb8Jtz13Israc8we9zA+06C9Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895391; c=relaxed/simple;
	bh=HhdfVWdTcT+vi7N3ZCsiVPcTL7NCwYSAZ5je+BcjOQs=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=e1i7o/b+VxJkw1K7Cx8ksHijtTNNrXkmZUO1vL/KR5KsbOQvdWAuR8rDXRmClg/LG1IIf76VcxquOANDXWrLaNi0QihpaOuoIKi13Z7rXNCLSqcEvqbbZCADhubFN525bRBSQYAsfK08VxmsDFP8zDGoTOEr4tHcp03oYR2f1aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=nTsJSv9f; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="nTsJSv9f"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceab75934dso5316135ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895389; cv=none;
        d=google.com; s=arc-20260327;
        b=ruI9jmRDqqse5nsNOlmrCNLma3JiA/KMWHffHD2lWW4sthANJauGe3Y57veao9hfpM
         VDhVMhNbZHYBjDCsoHgTinTf7vYE6zCpG2oXF70i+75MJ4eogO8SxKMN6RcWbBXNmwjk
         6ErP0HhN5ImKiqxc+y7apmOTpJfdN3gPAIEukeK6oiOzUrPFjONTkrpP4N7usbHQa1jY
         rwKFTHkSgaJ4vZks2U4YX8Ajt1Ji1aorXfSf5hrOGXfTBOCBgQ3t7rM4ZCrlpNn7O6DY
         /sN4Q5KSQvBkLy0jsYX4kgJiZ/CBEYixYJaHPLmHeUROFqJtZIW0trC6ruqdeDLTBO/y
         c08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=JtzWPQulGkhYvLui8X7NukmC1Uvg0CKXqxWfiy7U+TA=;
        fh=mg2ZY749z+U2aU8W+rudncpf8JUOsW33en9vFSQaqC0=;
        b=eADale5lYrnqoVOfvXvWupPa808jSyd3EP+oYJD1ELzjbF6yNVKTrCGLMQZE8/4p6v
         7YqqIBS/bkfkd6aX0vc109c2tgUOU/h4J5uOig0qQcRP4eLooh7phT8OO4JifKW1epdZ
         XWC5nk6PBmi/4kZqyfU2ZjQcM+xTvqegWLstCS1W1bW24KEcXYgXUGzN+ShFM2ipqSHP
         Wjq/XFKD3EqEQn6/hScvd1FsMYackYaKnnotCPRbIcyeMNQcbZspY5W0R7HU5xYd5Kt5
         5/mZ+yAzUeuzQWlkngTZVcpcvujYQNjH2BgObp+lcAUNX5nST+kNzTdcstlP66r69lN7
         csyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895389; x=1788500189; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JtzWPQulGkhYvLui8X7NukmC1Uvg0CKXqxWfiy7U+TA=;
        b=nTsJSv9fykORSZd9abt6YBnk8IvHXql4UszHk+Cwwpql1TcE40sXhbfXeaQ1LvKBgg
         HKmo3yIEFOSZGhM2YX408M/eZnDIxgh1+QwIzAB7U060WJiQDt4a4iCMECsxjBX/LFQg
         SGQbjiKNAt52wVqTRUXObgH428mi5CX5Hh9jD9PWVuIq1n4qPHjjoa8knYuIqsO5/JGo
         hfyqSNBdDfvIbluxyeHHskMCZOheE958MU79dg/RHJz/P7LB9Xk/rQaxBy0J4ID/SITi
         EEPR5b1ZtAoyqZuOH48WuOMmgoEk2NtqPJgZLAtKybc6mlIT/qr44SFQDwuQpwwD8bet
         6sKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895389; x=1788500189;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JtzWPQulGkhYvLui8X7NukmC1Uvg0CKXqxWfiy7U+TA=;
        b=laqthb9PFavSQwgqx5UOb4sWgYApesvBG08oAIUh6yZSTMMCRAC9tmEv5P0nS1WKaH
         Cl4YN3wUtr2aEKrD+7eXVesgA3mXTeb5ekYefUqJJGf2z77FMoHUV3OdqNRi/HFLSkfS
         C0A/cLS5iK/Au73BUlWctsnDjkvWjRaE47cISClI+VlIjZigD+GVWm2haXwjTuFS6kug
         NeeSPteJE+GZXOhGZv02rWy1aC2FC3laRn1GAWlYvCYzAVVsS1drLAFyjZgXG92TkOQ1
         4nV8ZCekGMI6/pjJAn21h5TH54SPAJZ4K+OdljHPgRrU7upedr9Ut8hipJC/kqZdNy7J
         4iHw==
X-Forwarded-Encrypted: i=1; AHgh+Rop3vgj5gkhHCi8E8bkTTYIDX/VckWKAr1Fv0Knxnyn2UTUoIx/DFq4HF03rpnHOXGdES6ph0XyKRw9Bxs=@vger.kernel.org
X-Gm-Message-State: AFuF++mz75Dcsy29VKV32hGsPRTyBiEwd4EsGWr8bUQ+LAtr9gIJkRO2
	Q0VPPsxUqIegsFkKZC5wPkaMruvawlrghsmpkGNQcgjyyC+l1lRQHNYl6t7DKlxZOu1GTLylCiX
	daT+6/Bp+I4Em4pt9bC/cCDToSGk4JnotYEs2JzvT
X-Gm-Gg: AR+sD13NNFEbyUEEUqKvCcnW++7S/vSm511zRSV4Yu7V9nAwq448vxWvFhrqN6uQx9r
	x5iQye0EbfNc60qaWEyDCwUBd/eUi2Ha4KbGgofDyegLFM104CfcRN4LAuiwlOGcYPXzvVLqFe4
	WP0Jq5iCdZmd/ICBsMWnevSJO+ZydoQYyHkMcGdmcVjmdV0KAZVTg+DWX2wvbjMEOSIBwUVPpYD
	M2oO0c5HXVTVGa8RfTnClaYfQfgy0ixZAldyszZOCIb2QIcUshKBJ7WbljN7ldM306USUyh0wEo
	lJBDjJxjckeM0DSWhEiFFkOzsirMEAkJprpuf2IDJGHwlwPEOJPxK2tzoQpQlqOaRnnHoLqX6QN
	J4CncOQtKhiamiPA6L9vXRc/7EYLGvkdQ
X-Received: by 2002:a17:903:1448:b0:2d6:fec3:bd51 with SMTP id
 d9443c01a7336-2d74dc7acbdmr85822865ad.5.1787895388518; Thu, 27 Aug 2026
 22:36:28 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:36:28 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:36:28 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:36:28 -0700
X-Gm-Features: AcwNN1UpjGgm27LVldX_tkCH0Pbs6HI3qUBV5AFS4DZqpMhtJgjpaoKPylRPpB4
Message-ID: <CA+0ovCgaya8JEc4xmBKPbe5AbrPuaK0tUKxuOxQYMsPTQT1ALw@mail.gmail.com>
Subject: [BUG] ish_hw_start -- page fault on a PIO cookie: intel_ish_ipc maps
 an I/O BAR and dereferences it
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: falemi@asu.edu, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/152-hid-intel-ish-ioport-bar-deref/

  BUG: unable to handle page fault for address: 000000000001c078
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:ish_hw_start+0x41/0x2d0
  Call Trace:
   <TASK>
   ish_probe+0x34d/0x460
   pci_device_probe+0x436/0xc90
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450
   drivers_probe_store+0x11c/0x220

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
