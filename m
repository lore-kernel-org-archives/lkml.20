Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29C3D75D1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787870064; cv=pass; b=XSmMc9F/whKFNr/G9/UC43PFzONxVDGa0Jtl+UD8wCK5t9Y6fAgpIe2EmqIuPUQy5ALGW+2zLJlLUxmLoDQDbYhI9xSNwZYOywQfVZ/O/yBganLyheByZxDdDEhj+AgGseHae4pMNl9aQgzYvDxxv7/pOJnOU2Q/8PF39HoJ0M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787870064; c=relaxed/simple;
	bh=jTT7whqRclQt7kghPv/9oOUawR4JyN6F5wmXBtdLJ4A=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=qK9f8vTRyzqvb30mKUIpqRz7BdY3Est/n2tVP1ZnOkrKqgtCS4SAMLwzilu2D409NVvqb10XSjpseKqeT5gTyGjjm5+qv09QseJQ9rcmd9dfj8Rh/v5/8Bc7wDSj4IIJWP8FVSN0MSc//CD/u/QLoa7/7UYceowv5U3AyhAVUk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=ChtBLJvp; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="ChtBLJvp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5335cf904so3422115ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787870059; cv=none;
        d=google.com; s=arc-20260327;
        b=MBm4Me6ghiDuRh5hhdxmA9If9+A4pWmCNcXqblVUwneBVZtIL0o/dpwVONKhmzVJti
         k9P/nWXfngG98bABZLcEMaaQKZOvTmODckLE+QLHGWE1S1OQ+8TFAN9Kq77uhjX3OMVM
         zhtekRKn5evF4Tlq0ub0MDsUbksTGWDnHS73qaxXE6FLBMy4o0hIPYhCdxprL3r303Vm
         k9NsvWKqg3o7xB+n3Xv1gh2pgnffUeJ/qFlh5IXGPCfeqw1GIZRbBlzAUK/eYmePZT8l
         vQ/qjcszUnYhniqxhBjV3i86y5WGQM4qgH2FxwttYew7eU/3M509ILNMe2iCsGpoTc/q
         5i5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=DI57I51j+Focgn0V4hRZn/s0X9Oen4m8HFBxSjHiQRI=;
        fh=huLld52JLBRqUHyK5P96TBoxSGNll676Y/wngQBkHJ0=;
        b=MPOAEZJVjPXp/AckWERvmz/usJ3SmPgG8ByG36MEIs93bQI9leuUggDEEM5agVeZce
         gS/SPGvwbFNhKM/QOvNoF48BUtV3ZZwc6YK7xkSUI/4L7Ys/Kx0czH/T5Obw/HowAEfP
         e+GkxYNS1KBUc30a665Suzwn80UUvjfAfx5UxBZIwq4zk/IYVmJ4KD1n3XY8Wr8jCB1R
         Xhwf6PKgfQw7u65xD1z30PmnI59ynTfFbsextuuoqbNAhbcC47v3c60IZlu3qr/jHY9R
         YcN327rsi4plUZd7zWaeSPJtF665MivZnwWSFDvfq7DTvcXwEZCH+Hndag3M/niIMq3C
         rx4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787870059; x=1788474859; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DI57I51j+Focgn0V4hRZn/s0X9Oen4m8HFBxSjHiQRI=;
        b=ChtBLJvpJjalJqijI0fVeJMmO0/WqVq9h7oiSkpyz8sqVWty5Z74aoq4ebljWkaEp7
         TCmcxZOlZ9ze/zwmGrhcpqRy1WsV+x0jzdQ0rUuYxYXRy1Mw/hqZjWqA3qVuTYRs9hH3
         ZBSp9WEvQf+ezujpmFeSZipuxlFdHdIQoMGtK7zywJC9z9ad1d/iDUqNFIYaSHbT+nAf
         /f5KlIbZ8VGUf5khvm96q3vR6lcInZO7IxLdDgz+eOFFljGM4VFUjjZRkrz6IP+cF2AM
         HSxAXzKeVlewJRgRvTvN0Jl3bRWJI5hAh3+UVhVlltw1dOsRYRM+2GrN6cflMv2mRuBB
         KdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870059; x=1788474859;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DI57I51j+Focgn0V4hRZn/s0X9Oen4m8HFBxSjHiQRI=;
        b=XCm6+UNhJ7GVT7GPe0ppY29WE2Gnb8HKxChMNrk/OVzT2rQmAbwK00lnsTXFE6Y0Af
         wKYh7QaTY9Urp8CHKJm2IlwnEkYovPJ3A8O+iogpn7UqOsVjm7tWPlIX02UeF0/xx0PJ
         OVxOILLv/V7jzQOyiQGejhMxKXKq+ZpdZ2TOTXVi4QErDINAwqlznw14puyzda3ifmik
         f6W0f/DWzPenyct+BGU5c78ABGFglNPb1IAcSf2nKbxt4y4wVjm/MGhWOCjl3CThnaQv
         p3cYZzWJFXsu2LlYl5d4eX4CAxNMfQ/nRQPifatKjwnkeuj7LdT4ZGkI9dYM/29oPfeO
         /MGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp51U0pVDj0F/c6FKASahXWsfPRHVLdQR1KouW7VoYA6U4IK6QD6inlR3DDnCIBmldDG1DM9Z0Zmw6w/n8=@vger.kernel.org
X-Gm-Message-State: AFuF++kBrV84R3M2o7Z0NEPVCeTRjNVRbxhEZoL5vJrP72DA0bzWrsfy
	kHLuUydJAECG0mQpqn4xEhyFkdIcWOsJKs0y15BKW9bi5X77dTWn2vrq1LIvRsO0mZYSje/NPAs
	/Tx7/ejpbVMe44HQAjIz1nRIA4YY149V95c92I1KYOl9J3+oIDyY=
X-Gm-Gg: AR+sD11phgX+eOlzUr2s8LNBNUZ5PoMG7UyUU2yG1RfEbix+gLalFauv1HZYXHtsJ2H
	ZuJ48C3S1Nzqb9KM4vulfR1hAx8nFjQTue1GfODHeCZZcL+/GZNXjt/h1XosaE8bx3tQRTxojvg
	AeKRgJiC7gbjimy+HAXsGmyKS1FXCbr7R0MUa4Ln819zTjiufvGZf+mks1OpNyghOYPBkkIn7dZ
	6cIFZtrWRIgDp40p7K0X+BAieQcQQA0Xtv/MKBsFVD8nSkgH1XI102XP/HjyUEQNZn7RI8HKCSY
	odVQaArpSQnfm9z+FI0OOyQvGEExkA1xhKc9TB4PyiYA0oXxn1FR4ZhO1awVeSuoK/u84beZ1Qk
	pgXghUGI9zKVsMrL4pjs81a96DNf1toGW
X-Received: by 2002:a17:902:d591:b0:2c9:deec:f564 with SMTP id
 d9443c01a7336-2d74df52c1bmr43303475ad.13.1787870058622; Thu, 27 Aug 2026
 15:34:18 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:34:18 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:34:18 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 15:34:18 -0700
X-Gm-Features: AcwNN1UeYwUFYJ4SEKlzJNcHonSYy_dKU76J3YshUs7BUlrXtVgNUCgLOwSuidw
Message-ID: <CA+0ovCiiEbjTc_ZirZ_PXHWFjc8SjCEtZ4p+G2jiOwaYq6nU4Q@mail.gmail.com>
Subject: [BUG] can: double free in unlink_all_urbs() in ems_usb and usb_8dev
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>
Cc: falemi@asu.edu, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Marc and Vincent,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/100-can-usb-double-free-unlink_all_urbs-ems_usb-usb_8dev/

  BUG: KASAN: double-free in unlink_all_urbs+0xc2/0x740
       drivers/net/can/usb/ems_usb.c:713
  ems_usb_disconnect+0x83/0x130 drivers/net/can/usb/ems_usb.c:1088

  BUG: KASAN: double-free in unlink_all_urbs+0xbe/0x660
       drivers/net/can/usb/usb_8dev.c:840
  usb_8dev_disconnect+0xaf/0xd0 drivers/net/can/usb/usb_8dev.c:1004

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
