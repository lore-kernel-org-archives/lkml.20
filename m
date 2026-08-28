Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91E3B531D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894804; cv=pass; b=MovcjAtyqzg8atAayJqy9jqJ5HmQ3w9ZTRFpX0l/TS/RNrJS7IeDuLPNbsQYqTKlc60TbmDshe/zhELKCz+joJkX9MzcS2YZmdr1DTY81lRqwLGzkzJmHjt6LPZIhX7LIbyhtL79EJyXd4Z57vz0SxXebIFkdYSn5btxUOUBZ00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894804; c=relaxed/simple;
	bh=ZveIcFp7V32Z1aM60loB944S1YN9fcIoAB31WiB5Qns=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=NCDQAnvMAltfhiLzs+XrQegiIPkCxRzgb3NQLSVhh4+0N4xB0evM77HWWvYVg6ThOwIOW1o9uVSg+1/V8s5Gak/DylRKsGpZZFV9HIx686bjr4fN1wR+GewMa+rMmu6asBU6r28i9w0YDP402gLc4IK9m8lkMpMBijZWLDY845s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=W2VWnFZV; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="W2VWnFZV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38f620399a0so728390a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894803; cv=none;
        d=google.com; s=arc-20260327;
        b=lvHEj3JL3yMJFOH0Um39mkyJBCBZbS/wI9m1xO2O57J2zHuwpLwsWwu/PLsOM+yR3M
         LZ1wt0ePS9XUOKKTFCUi3aWwZEfyJBV7m4qU7ZURMmwPqtnkfVbkTcFuKQ1zaQaGG9dH
         LCcePepsSXU1tanrZsFtuhk4hmfGjoB/FW3h0MrZQBfIFNMvLPECHU0xdztDPsR9RqKS
         Eu295Wr2jVRziEl4ZN5Ph3uJwzPyWwhEcAC4jjDu0YgQiV4KxR9bYM7PANTupnYB7CGn
         ln9EY+1dgTCigcHgwC4wQhFbU2OSddRdYcQYsbkySe8qlQtzH8eXd0EgRIoHn82+JEhf
         9xmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=qXhvfTPGzkg+Qu4rqQvBhzoE3FgD8zp6UtjMgskwkcY=;
        fh=1hvTuWygnUS9+GFHGABoIAlv3TI3RXlGRfY6jRl92M4=;
        b=HtPRpeoPWGKNT/n3YgyQAiQZ66zC9Hjh1fHrA7BnmYVo/+2y3DiMLdmB1fO1JGPEyc
         qXqRV5I05/mkNZKTNk0YlcPbrdqWppnktiVyIYXxP61XFpEFgbjBjnP84PLSExmQK4rP
         pjoOCpoxCGXJlb6+ELDh3Z5p45yaK1FM9SQ5Fuq+ZhshVWpzllvtzdO1CTWoZ0qN56ae
         rS6txdOy5Q6359uaeo3lbfCC31I+ekLOPqeWWNfyDrDcyZK51S2L96HpyoUFzcn98A2z
         gKI7CE6krgn4Z+DJ1boKHMXLAR42Ziu6OucnWpILo6OU6IAjPPVLfoFn/bQcM4AMT7K7
         RzLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894803; x=1788499603; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qXhvfTPGzkg+Qu4rqQvBhzoE3FgD8zp6UtjMgskwkcY=;
        b=W2VWnFZVKME3AFkm5Mgy97bo56ltYngd5nO8J7TDgtQvY0vh+9tb7+dUj57/haCwFJ
         BFHHtV7w6GNYc6GNzAu36AnGu1H4qTRkHG5vSbZtg6gRxoWChue/WmtTr097194dGYD8
         2SGsJBswnnJV3o8ev/L2AohDm1r84U43C8uabwDFq7ewHvLIX0KAmABJXIEis9SWWhsZ
         Mniz98MA/+aCzeDhzc5pAW5dTph6YCG5JFK1q3Lq1hkg/lhtYA2wz/mWmUONR2I5PYoz
         kO68BcyZlo0hdkv11++OZQ7WZ+h2epkKQiaoOoi1al+1FiPC9g6UGukQDkkQkR3pCxGX
         iXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894803; x=1788499603;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qXhvfTPGzkg+Qu4rqQvBhzoE3FgD8zp6UtjMgskwkcY=;
        b=Q+n1NsVpzZbxeVw2kjiddlYPZXEhNB7y197uddhaO27VosevLHCMFmpHbOj+rqfQm4
         uweUcs/IBtor1kQCQyae7L+uwcSKdleQu9f0jqnqqw/O63/laq+uiDv2OLVEDxZkM8Q6
         9hVH0XAfoH1PQaaA9spZnRAOCYLUiHxo31dXNpIn5er6LcPGAY0ZENmaXZSa27Mc1JH+
         08SREplMq/3GbwzOWk9iiIsO0aQzW7KAsreYTJ72yEgZCN6s4ESyDciXLdzaHdvVz8WI
         oeT5+cAczmyfczkvrEQEvuiaE0aRWi8uS1QPUD0BFrQrCz89RKb4luTN7gFutOl0UV6+
         +NHw==
X-Forwarded-Encrypted: i=1; AHgh+RqxOyN3aABEIDu8l1DmVWZxI8fsWVl84nFSeCDRrXJn7vFm0Ue6aUxFJwbRiu4aIkeosjTcuSOKMhnTffA=@vger.kernel.org
X-Gm-Message-State: AFuF++nKcA/1RAABHG5ULWgXl8y/hFpm4IcgOiQ5k8XGwzGuZeK3jvk+
	ssBKCU0CitUvcCUmb6T0NU7GAvlgrdQNOIpMDeHu05zsQ5kRM8jMC9cjmsv6GuTWyRL/QxI9rTa
	zVVq5NSR3atMpP+nh5OCAyh5qtAQmdRLaKJQz+s7O
X-Gm-Gg: AR+sD13lrqzt8h0y6boiWOU4eDTIg02e5f0XLpULrZ3FYKyg/uByCkuw0ElV/xuPpaA
	2vqKnigPb+CnD3PPwwAtu6A/IdReYH4esdrva+75dwJ63K43tkP6ZvxgyoFRfiEFQzMQecttaWc
	uehl/L5G+24HKiXWvPuPjFBKjtgO/GpccuNcAzL9DFi2R8M4U3KoL9nfV4Icf1N9azfV24jPiaN
	cMRG7PkzsQiwIRuR053nJnSlbnjX11x6FXr0mkIpxh5bqHVkTiLBiYHNNwSQtG/qd8q2USeN/RJ
	rKQcnSH33dGJBZ1KWrH+kEEdcy3eQUz6fAfb0vQfx5R0ObwAdIctRa4xTDhZF7aCE/Og/XdBD8p
	lOMoZAhaMSSEtSzSbAFDBmcvcXJn3683nPfUGiQ0SGXg=
X-Received: by 2002:a17:90b:5249:b0:396:40e6:f631 with SMTP id
 98e67ed59e1d1-396d0e306e0mr9407523a91.3.1787894801955; Thu, 27 Aug 2026
 22:26:41 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:26:40 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:26:40 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:26:40 -0700
X-Gm-Features: AcwNN1Xwmd-yyYQyLqc0tfzNkQ5nQ8fFVd4Htq1RknelBHUdWcKkvTxvEOwzqIw
Message-ID: <CA+0ovChPhPP0o+9785BjSRyNBTNRR0LiFT+K3T1a787GHyQ+Zw@mail.gmail.com>
Subject: [BUG] sd_init (gspca ov534_9) -- strlen(NULL) null-ptr-deref during probe
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/141-gspca-ov534_9-strlen-null-sd_init/

  gspca_main: ov534_9-2.14.0 probing 05a9:8065
  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:strlen+0x29/0x70
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   strlen+0x29/0x70
   sd_init+0x1dda/0x2e10
   gspca_dev_probe2+0x855/0x1440
   usb_probe_interface+0x659/0xc70
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450
  Kernel panic - not syncing: Fatal exception

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
