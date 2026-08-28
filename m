Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD9F38D017
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895249; cv=pass; b=gEgZKDGEXPHyguY8D1CCkihtWMhe/x9xzmZzVSnnriRRlY1riic7lNR0Iksp5+hrRXG2IkdBajbfYwSt8nT2qi/VriGMM0fho21+QXOQ/7Jg2YRFH/LctgebXGNEbfsidwVhtBGXoI2NCPso3qQnE4+m4F27zit0vMPYTIdu1xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895249; c=relaxed/simple;
	bh=N09K3P1+KVSvOJWHAr87NbAkgNAexvfQjQAdxwhHNns=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=RnbGCTDQ6yPlAIzkJ50qTYl1gRFsFjuWtgvHZNBWhqbur2sy3mIIp8ecmcEYO7arRegB5yzuUcfwWOSvbXPeJLfSe1hKygYERjV7gBYY//Qnco0r9cbXOhp0BKDWkERQepLr6RTGX9H0v1F/yz/dybdlPvrDTN1IWgppcZHNZR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=kvvaRVKs; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="kvvaRVKs"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1425043a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895248; cv=none;
        d=google.com; s=arc-20260327;
        b=gWciDPseBXNr/TS2XajmCVXvr64pE3MzJEiy5IOkz/fZCFmshu7uLpn2OTGbJaeAs/
         8nLxgTNCK2ZNSc5h8HKmQEqnySxn5F1sOSS5vDSxY/Ojf9QGfjqXTSSqtwAar3ndRh4C
         6HgUb6KNnt24+oR9HXhO1GGonMqtrVnmLE7N1KZr5yrJ7YjJk+IzmF36/TsZplX4fQjL
         aicDiwDme851yk31v0MTutJiiHYaUQrHzil5UGrSh9YX+5jr418SNgC0C6+Fwi9TXOd+
         x5eFbH7aEe1UeloJqNDITIATtWiq4C3g+XFzgtkIqh1bX2Vb03WKWhF2sIrwQ3xnxqIu
         jWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=VmykDISYf2pFWYAuCyqhUnCmu71aODjQ/CEgASGxFFk=;
        fh=jGD07WJsDwciqexzmNZKDcvkDaa+jplKcdRRj2WtyWY=;
        b=qdBrNGehB1TAEnoW0zY+a7qISXUWGTwK5NlAJ/fsIfwpF+sjXuD6LfrJOF7viLl2+S
         RI0Arh5+hWV3o64HjjhwKly9qsEdY6f+Bn4bwN0aKuMo6mXrcnNHCkGnBV0005Ik87AM
         hxHnTSqrnaV6YJONX7+Pelvj5J2LdMwXicGnK/3rHSgHptJllAK1WCpOlURwvVee72Rr
         IXJGoQYrBpsVVC0LE7uED6iEPMNajoE9wcgvDgFWmrcTtNy0ysBf+th75JPoqX5hFbYf
         0EgJOZBsyd5OeNOlkmOB8UmtBMThxVXumCKkG7OPGfZCYvNpOUqp9ExIzIrtznXV6b8x
         hxNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895248; x=1788500048; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmykDISYf2pFWYAuCyqhUnCmu71aODjQ/CEgASGxFFk=;
        b=kvvaRVKsYILc7u0HBSPlvAnUkEVxUl1j+GLmRJLlfOWJ0riGoDuQfuKdkaVbw+2drL
         F/40sEvc3oKaCKZU1WRX5MgNQh3wtBA8Ktu0oRnZJMk6q9zRJwoOs5CBAY/QL8b2siK5
         TENpYBRoLo5wm8fA+C1xEKidgQA3YjfW2ds4tzjZTZSZvJGZi6hCAfveFle88aDRSaP3
         FLp0lKOPAWMxouQ/NOnmmuPgfdsVMZPo//VpivJZ2YiDkLcgdKEyEqaAu4EitDRXVKNo
         TUCsmXGhXBg8q9wHpY9X3tVGj6JOaY+ArGwFTvtZRwkG3MFaZkR+Gsd9SOwCZ9RHqpfd
         AETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895248; x=1788500048;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VmykDISYf2pFWYAuCyqhUnCmu71aODjQ/CEgASGxFFk=;
        b=CesYVQKfmkszsCetai+rASwxla26s3LPhRWiruszCfj9IVxr5C0WasTcl4ElS7+QDU
         P5HzsXsEadZqS1ehz40BlqmAZDcquAq+BKWdcwWMbJeNK7Hs1t7hVJzbSxtrye05s6YK
         6/YIxjqgJU4KXuanTFR/vCccmudcxOQ7QrcPFRhqTwVM1xfpsx2F0ZgKRVsBLkz4nn+K
         0Z3EGGai3rYnhk2BsQ8z76vhaFY8ijUwNZaFo0J3QX/AxeOpH7IyNG7Rn8GQ7GF4nx/B
         UoJ9vmDtaeeIehbS/k/0aLQyKzxfy41XXOV0jmJyKQq/bNfHwxY381irXG/jEg1UZUqM
         DZbA==
X-Forwarded-Encrypted: i=1; AHgh+RoP9Vo8/vIMnwCwTSPA6TQ+1Q+qulZffH1YRTxogsrslZQO0g0dDDZ7Otl+k6TU9Brk5FZz7NTKbmx5oJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kIcZ9AIJtuj6LrIeYtSXNjvVvh6nrZQGjRlSYp9snFpWkDUjbZ
	uW9ENSRfTKD6s3CHPRxAujY+/axoMzEDgdKhxD43o3EF3qE8IN+wvL/1SZZrTM/9TjnzsnIR8WD
	eHjodRBA/xZMSJfTLRAzw6hBCM0zFRAhYUExK3ybc
X-Gm-Gg: AR+sD11qfZFTNsWDIiP7J0vWMElqGFheAEbxJZvUlE5XZa+pJ0YwlPqh5axmtSpEzyn
	5nKFk6nkA4KWYfkcemNVnM4GjVuVEKL7H0BMWpoEXq4iELEqQIGWCvbFWCs/Olm9wiRU+IpONcB
	Q6PPfJ7490rqPeoqKRxBwRjU3Pgg6OMO18JiA0re2rSukdWEFtj2w8ZdsnFIWujwN5eyklG58hm
	EFo2Rlcb6g8YW9SuA0gtny3M4dqapDIDPIGHAEOlXJuAxXnmjao5TAwTZCXNm/dPqznO51vnV4H
	mV191BQy6BAWVoThklvUGJKdAtdBLCwiqPCmv1YTzfvOv3f4XwSil66zxDMjIf8U0qVhX46REvB
	kxubpvDi5Ta6XbULmVPcHg3EHSK2zV9ZV
X-Received: by 2002:a17:90b:5282:b0:38e:c232:9d2c with SMTP id
 98e67ed59e1d1-396d0d360e2mr5176850a91.2.1787895246701; Thu, 27 Aug 2026
 22:34:06 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:34:05 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:34:05 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:34:05 +0000
X-Gm-Features: AcwNN1XJBHFl5aXI54BxFgruP2OCJaQ7Magnmr8dXdJR6dIUzDZfui8iSum_LeA
Message-ID: <CA+0ovCh2o46zgc5Be_Z5=6NNJTKnd3W29zeMJ+gBCgL+4fFLAg@mail.gmail.com>
Subject: [BUG] platform_get_irq_byname_optional -- dwc3-haps registers IRQ 0,
 WARN on first gadget init
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: falemi@asu.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/149-usb-dwc3-haps-registers-irq-0/

  dwc3 dwc3.2.auto: Configuration mismatch. dr_mode forced to gadget
  0 is an invalid IRQ number
  WARNING: drivers/base/platform.c:492 at
platform_get_irq_byname_optional+0x1ed/0x220, CPU#1: repro/9498
  Call Trace:
   platform_get_irq_byname_optional+0x1ed/0x220
   dwc3_gadget_init+0x607/0x2170
   dwc3_core_init_mode+0x2f8/0x790
   dwc3_core_probe+0x2345/0x2850
   dwc3_probe+0x100/0x150
   platform_probe+0xf9/0x190
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
