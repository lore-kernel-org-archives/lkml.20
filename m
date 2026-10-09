Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181D2DB7BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514293; cv=none; b=e0JStWTbrgDfiVaE78AUHdqdnOEdExzZO19XUF4U85E0cXFu8oJQm2ijp4JzTrOfWWrR8p9TBsSaWtoakZ4CifbtQDCvGgWMCSgHZJz1bhUctRQ3emFGYVMxvqgs/HumnaguE0ihjRMxLkbCbSckU5VVgQmN5vzG3MLjm04SLtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514293; c=relaxed/simple;
	bh=z2aQvVP3h/SKLEfh0UFs999dp+NOnSePu79IOAVzSVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYVEBPZJF4RcLoow7L0zX4At0D46Wmj7S/enNn6lQymNcu2tzmZ9fo87bjrzE/iO/jiReOynyIR4R6CgNh7qXZ6sMZEGRGV6wonBKPcVVTQINz6i5yutf+A5MqpgsgGkmjr67pAL23bpXoflc8rs4GRdstIC6HBgncql3JAr2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQHH9IBR; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQHH9IBR"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e507e778e4so1272618e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791514291; x=1792119091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RltOJKgCcU/1lqOOLjeda5sT6T8hfY7f6K63B+K8aO0=;
        b=rQHH9IBRr/2MIDbw4pCz6BXpl0QBJTeK7XSfBW8PNtfdeAGAGPm/Kofn9JxFq9qSQQ
         o2Vtl26fCd9bmAPofBYgXJga+vJLnAlVZ0L6UTpOLAnpn0UYy5HFshL/sa5UxzEp7U92
         1TnvvRNXyyvW6gDOcm/LkcaAZZVkbp1YuLAzAf4L8o/fjzOtJJXfwICwvAmKSY278M0l
         qERbHqByw9OfiSi3tABSt5bJzr5+AbzUG0ypccvR7P595UhUWEtGWgCgWCkyLdyB8HAV
         JlOEj12d47QrVR3mwY8wmSUhw3XWU4wEqygz0pKdy9wrhioNM7bn+h17fLdFn7xDOCL8
         /K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514291; x=1792119091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RltOJKgCcU/1lqOOLjeda5sT6T8hfY7f6K63B+K8aO0=;
        b=pb8/CU76iK0XTGSPKfh97GzQBD2Y1lX/6OP3DJI11C8I0DPrpya9luhfzUszgoSSR2
         4LxPI9+U8MnCzHM1gYphkHsuJWjj9HMi9EBgVx3G9BJKvHx3mc643PrUFAERgtuD2yLm
         enpKSSkZXuEUfKyNcw4ID9EB7EnwfNU8E9GDDpnYVbm3FaJrhC2Sr2mYzMQ2JizmeenZ
         18EzByzmy7Zzz0TIAP9IOnXH0Oz1loKbE8pwzB5aA4xw5SdzZrfiNAkozwQqRRpsWai9
         lAPbtadoMBMDaCS8ExI9zEPRY8VM85t6Q92iSEEjHZgI+qW1uILGL3cnsFjjryDU681n
         AS+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBf/q6fQKPKoIMOMDVaPoS8jcXgDK9c9vxltEDzP5r1p1oEOQ0NmToxNEM0Hjhz5XhzETXWDUHJhnXid4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1SD52+J3THQhZfT8zgGkSSh+AxYwqJs6GNwICBDsZDrcxep/E
	NP58pnR/CvpPNsGch+no8Jxic4EUojm2RiPK89XlkhlkV9Fk+qpKn/Dq+nO/40a7
X-Gm-Gg: AYBFou1WtSUIi9k9/EzneQEf4yeopF1Py1iX0DJgbR/Ygrb/T9pU53ZhCTskLYfuSUl
	RIDrYxDvqMOp6baHj69JbVQCrqEYxALU4x8oFzjJQvxf9OvAirZSKR06xwWdoUTwfg+Dux4qei+
	WfEfn1viAyW5vpkCz+GLbwTq9TrN6NEQ9WkkWdYIGGn7R8ThrfWe4l4Q4zC2ZXGQ+XzYIPy4geD
	4/abgsSibfxjjjDZxy5YrNkOsxol9a0aUdr3dZdzdI2JI2G1KzyDHVDFS0qfi++jt6IBcdA4JZ0
	0XQQtMRZjXFz7F09TM+3gsFrRcV+9Tmvl72LJ4fqtrEGUlX0N+VzS+6ftO5K7jvsyWiGB01bx7B
	LthHp8Z0uaM5GaaAZY4sXVbB+JfvVG94GEH01n9xn+giBVcvh9LM7VafrxeMw/HjBeC2zTDlaKb
	FEmRPzDRRA094KlvGn3nv4yXD02riNvfDMOkrplgzbwSGhSkg5JY2Iv1S1tTMX656UsKchKDbzQ
	nKWKBtY
X-Received: by 2002:a05:6102:5122:b0:7b2:7490:fd75 with SMTP id ada2fe7eead31-7cb3728257dmr170852137.7.1791514290745;
        Thu, 08 Oct 2026 19:51:30 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9900490dd07sm661866241.3.2026.10.08.19.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:51:30 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: d@rrell.co
Cc: bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Extend Apple Thunderbolt power quirk to Alpine Ridge
Date: Thu,  8 Oct 2026 23:51:17 -0300
Message-ID: <20261009025117.16225-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008185543.85892-1-d@rrell.co>
References: <20261008185543.85892-1-d@rrell.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Darrell,

Thank you for testing all three patches on your MacBookPro14,3 and for
such a careful report.  It's very good to see the same results on a
second machine, and the details you sent were useful.

On Thu, Oct 08, 2026 at 11:55:42AM -0700, Darrell Gum wrote:
> - Real S3 resumed on every attempt, about half a dozen cycles
>   including lid closes on battery. noirq resume is about 16 s, with
>   about 11 s of it in each upstream bridge.

That 16 s is the ACPICA problem you mentioned in the other thread, and I
see the same thing here.  One warning before you try that ACPICA change,
though: together with this version of the quirk it makes things worse
when something is plugged in: the controller with the device attached,
and sometimes the other one too, is lost on resume until the next
reboot.  Even with nothing plugged in, the ports came back in my tests
but the thunderbolt driver logged timeouts.  I've explained why in my
reply to Bjorn in this thread; v2 of the quirk will handle it.  Until
then, I'd suggest not combining the ACPICA change with this version of
the quirk.

> - On that cycle the empty side's xHCI logged "xhci_hcd 0000:07:00.0:
>   xHC error in resume, USBSTS 0x401, Reinit" and recovered.

I see the same message here on the side with nothing attached.  With
the quirk, that controller loses power during suspend, and the xHCI
driver notices on resume and reinitialises it, so as far as I can tell
it's expected.

I'll copy you on v2.

Thanks again,
Francisco
