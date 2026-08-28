Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F923B52E1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894841; cv=pass; b=oJsn7rKO9WVPPLmKAU+0U+IfNmgPMbtGcBo8UCzK2jjogwZyAcABNilZZDTb+j4yxsT2ZSlQdVQmZMRtXCJeoIblHxc7q3ASheWhF7Kywzf7CIB1/xKMiTnG2A3wkqVo89PxzuAefW/rGs9DeD1BnUlnkMv2DjDkR8lklftEtdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894841; c=relaxed/simple;
	bh=qknhTVvrNWiUFYoeUVoxKM09N8GNhFH0uwvqgFGoYFA=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Pd8yWZCtToe9rSQa2qYSI+DJocmlZRa/zLR0T2Xhp/cWONTaB/djqfEtDP5RBC4/6iKbr38uTPMTJuQEBgDzEqUnMgcXaiuBezwSHjs6z8YNkwCcs9x38q7mLu10BAYR5E18+gL+7p0kVnmlzwQujD9Y4g+cQEFeNEpwXYhz32Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=qWw5hx4v; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="qWw5hx4v"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d710632717so4052415ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894840; cv=none;
        d=google.com; s=arc-20260327;
        b=HfJYENnz+E1qUIPybIl2rtoPg/SWnXViCAskh39/eSQFQdgB5rziAdXzxVOIjCOBU1
         wclnkzzm+2T/HbTImLUBloPbhk3uDM8D8xtYNEaXul7hQFit5Yy9SjDGdH0J2BoeP25v
         pGw49tM9WecwMt3ooktXMQYgiJyQAOPHDf0CDhTJpj/coc68bf6I+UX4NvkSYqrANRAE
         FXiNP+HQUKfpVGkD4VVdO/EIoINNuESvrrtujwYrhweDfzAQFbQjCLM8KE9HdyLjsNdR
         XouzR/Wpl9b3EB4Tt4w/VI4D277qQDopVZE1GdIPKnF1pfcqs2TAHqqmE9sWr2qMVdVL
         cHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=QNqYqbr6RrNLG0vHTLzh5Dr6ZclFSCwh9zU0WwR5q3A=;
        fh=QRxzSgGBWWV9HeQaZJndaGvxD2NwYAZLpHyBUl/JtxQ=;
        b=XZU1ssFUOzrm3SttRobccFujiSLfy8AtjuH1iWoYUdic2O/HUp3bRPpnYLU2YLdgW8
         edpM8F2Ve+VURG6Um0Czyy05TWIX2Y+vfjcAk2CKLftuw+27qLJ76Vhpp4YWApyV910F
         K+cl7vfAWOxaG3r4E6ov7uXlBaBfMmnPOR7u7/wL2qj9TtLxjAOaf2D+2Ma8ggiBQeO3
         d9KGy1+Dh9FZVsLRLc0z6R2r1Ir3Vw3zroUJ+Yg49FVzJp+ByeJUXL0N+KdysZJ8Bso4
         oQMhPMOw1t0MXu677O2U9QF/BnYhKaYqLN+cO8N/cd803uywoohPoQPQOau360m9RvtY
         VAVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894840; x=1788499640; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNqYqbr6RrNLG0vHTLzh5Dr6ZclFSCwh9zU0WwR5q3A=;
        b=qWw5hx4vsq8kCCPDp8vbWYAZeg4hkxoACcoIBB4STxmwYmFFVgOtLKIJtHWhlFAY/e
         V47t9V3rgB9b0H1hmGBHj30RLJSHg0+5P3vGkR4AJdhmLZYjMQE5rVBBMaY6S6mR6DnP
         jrCxxJTYdaLQPWpTn3Zwg/2unQL0UaU9EGc+njUfXqFItD94NXeJoJ1BBWn39u+Gfpqv
         33hAzCOyitaDlHbdUYY9MP4y7kWki+HfZ50oJayPPhMAssC9iG+2iuyN+WlR3aUZHN5M
         fqQsDGiHQ6G1Fbo6fSSEXbCRQ+Kdb5fYLGj/EjS4QI9rKPCpTyZkV3PsAE+8Lpv1xQF6
         dKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894840; x=1788499640;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QNqYqbr6RrNLG0vHTLzh5Dr6ZclFSCwh9zU0WwR5q3A=;
        b=JsKsO6K4y4ZPE8PWytar2JY7kgz62G8o/zgNRIStAJVdnwQ+96bivo/oIyl8ICI7z8
         jxor8vDVhuBWMyFky8lZdsfrMnD7Xj00JEvsUmDfTHegbFzXIOD86P5C8w+DPKD/mZ/g
         z7dCYpK6tHDl8RJB2OGBcNsagLN8dB8PmoaLpom4AnFux8+ptjxjrrp2PNd5StV3T79Z
         Gu3jQWCO5b30xWMKr8B2NRLDZhKeVpcUeKAEsa9o3oUvBNlOMvVkPz27HqbPn97lbqll
         p3HRL+JDPp1pMo7tlPvVdjUlfoOmxMSlkZagAc2lX0j3GQ0RUfNnGeli2webWEBf6/Vl
         MgJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp46WcEIlv9IYlJVbD5usGw8K2KgZiq5w+F6Sr326phGAvDnTeqBWuVVoul4iuym4n1jR3lDB7mwJjXOuk=@vger.kernel.org
X-Gm-Message-State: AFuF++msRvzorB9h3uuv1pgxL0xC3nM0329jS3PdaVYFcr/PypS4EGmA
	rePyALwWZQVDd1PnghsYiut99qvkstPjqpGeYL3hAF/ZfuDgDoKD9umY3effmmXtkdD95d/mu9M
	temJ+l8kxD86ja+2Dvvov2ElSWdrOSeLg/RpwMel6
X-Gm-Gg: AR+sD12sv0w/n0GzlYwCMC6EPbch4I0pN/WzzaQOVFjHId2Qqfy0LSb1ckh1SD+CXd8
	Giyk4QEv9MOoUSnqoW4uKGr7KwkCmyjVyimH1AY2GF+4GflhiN9MmiUXcKfRkGKGAR+nhfrLXfP
	0SRDtjZdF7axhFRD/QMUn/c7OpGAhpUy3YMAnE0OjsZg2RIGESIy8LknV3YkFnNby/GadWVANl4
	aL15WQDPyvLK6y7N/4k5emnTXS4PZUZT7XKvc5yx++POH2X94/cA+raKKpyZzpn9GCo3lDiAMIP
	UbhR8tHjSAlOFaThQmiyYOeRksQM/aeHbEjjNQ54O7lO0sDRza+bdkMGPkQWFKAa4KwyKxxLhA1
	7wEUUS6owLA4HLwIVDwvh8FlaW0yClEylcA==
X-Received: by 2002:a17:902:f546:b0:2ca:6c8:abd8 with SMTP id
 d9443c01a7336-2d74df45042mr70861905ad.12.1787894839110; Thu, 27 Aug 2026
 22:27:19 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:27:18 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:27:18 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:27:18 -0700
X-Gm-Features: AcwNN1XKQipKkQxak39pU7cE8Se-7vCK8ALFEruuOKEDcVG8_CDFnXw1OSaRaK8
Message-ID: <CA+0ovChhpCfQEm=3=23AbpKnWBXqaPkhG_Z2sTCJA0=iW0bx8g@mail.gmail.com>
Subject: [BUG] cx25840_init -- WARN_ON(1) reached in the seed's own task via a
 sysfs bind
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/142-media-cx25840-warn_on-generic-mode/

  WARNING: drivers/media/i2c/cx25840/cx25840-core.c:2313 at
cx25840_init+0xa3/0x110 drivers/media/i2c/cx25840/cx25840-core.c:2313,
CPU#1: kworker/1:3/10687
  Modules linked in:
  CPU: 1 UID: 0 PID: 10687 Comm: kworker/1:3 Tainted: G             L
    7.1.0-rc5 #1 PREEMPT(full)
  Tainted: [L]=SOFTLOCKUP
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:cx25840_init+0xa3/0x110
drivers/media/i2c/cx25840/cx25840-core.c:2313
  Call Trace:
   <TASK>
   cxusb_medion_register_analog_subdevs
drivers/media/usb/dvb-usb/cxusb-analog.c:1730 [inline]
   cxusb_medion_register_analog+0x2fa/0x1110
drivers/media/usb/dvb-usb/cxusb-analog.c:1793
   cxusb_probe+0x664/0x710 drivers/media/usb/dvb-usb/cxusb.c:1615
   usb_probe_interface+0x657/0xc70 drivers/usb/core/driver.c:396
   really_probe+0x267/0xaf0 drivers/base/dd.c:709
   __driver_probe_device+0x1ef/0x380 drivers/base/dd.c:871
   driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
   __device_attach_driver+0x279/0x430 drivers/base/dd.c:1029
   bus_for_each_drv+0x257/0x2f0 drivers/base/bus.c:500
   __device_attach+0x2c3/0x450 drivers/base/dd.c:1101

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
