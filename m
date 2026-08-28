Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6103B531D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894761; cv=pass; b=UVfFrFSl8tFxBgHgmObelxLZfMLSzDxGBPsAU8x8Za64xKy/7vInFXSIXMeUllIWKkEr1PB85QVrc5xnijZDemV2S/2ARanUpqM2X93gVgimT0NI8981RiyVhm74rfStbqye4ZGp1zEeF0q6soCKT9KGPmbOgqhKKwTriCLT1HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894761; c=relaxed/simple;
	bh=s0Xpsu8PNZ/NabbESJnLKPzbczhpjr1WEwgTvsXoiUM=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=P787Ql9wHcaZxQ31gv+YLSHGX7EH8BXTZvybAherblqkP36wP8ilUjQgQPma54A/Ug97pe+CZz9RwrvYdqAt1bw7+RhXJ/9lBlPuVKABy2cNLFdHqgKV6c44m8qrLdVrY979MZm22QR/MGt9vUJ+rkAZnUgkxjjzL8/RlADRw14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=RcAldx1Z; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="RcAldx1Z"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39682983a0fso617106a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894759; cv=none;
        d=google.com; s=arc-20260327;
        b=e9KNkBVEmzK8V6bBxmu7AxjUCSsn6NWTZoUVQxJhPMECW+nQ3WVkFBPF+0q8uAm0xY
         ozFNsHPdKbMQYI1ZwQYRefvnPs1m16zDU+G24Wn1lkcFQMPTvdBuwqtNnq6EaO6i6Rce
         r3Wsl1DCzscyy8KeDosY2GzGn92F1Oe3sLxY+5NYFtqWLQbtjaLj8Lw5rB+wmXUCkAf2
         6RIVPnd8+R2b42bWntWyEohEleArtQVo8UDWGULk1qec0T6pX1OpuW2DiGYDIaIECf93
         deVz/MoivtRHNCqj2RWjq/IMDKhy4vmFRDPoe4gzmhmnb17G63jQYv+UpCG/B6BR7JxP
         zN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=lg/I1KrLMSgT8druSaCQ9xBXT+6cIU91C37g0VAcQCE=;
        fh=Qo3WA+acYRITaJhosBIHVoGGg8103SWghCtte68B28Q=;
        b=LRzY9mfnGo71b11Y/IasMoEMXUF0LrMs5miQuG/Jcu2wfkn44o5NujgozN6V2nybJM
         ZK5TDxC5nVHseD65Nx7VY1UWQ4cTp++UpdjxHkuqv64LK+QXw06LLM3BluT1A/5aAgV8
         swz0pFudCPoJny7yG2LPuHfYZtjNOE44kqsFBQ4r0LESsBRH9Efy9R3LSeFW29iyFwfZ
         xeZ7bj16/0xx+EGgCQHYGLIP7SaSExX1Lpk54xSlpy/iUWuf6PPkXlsfiDHk3s8TPFf3
         km1/3KXdI0mLeWv9TQwPN8U7+f9X4ZRGiSDMsTFqlulm0CUoA6a0AQs7iLP7dSklJjzq
         kSHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894759; x=1788499559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lg/I1KrLMSgT8druSaCQ9xBXT+6cIU91C37g0VAcQCE=;
        b=RcAldx1Z3EGEYAnvZiB0P++SmE0vrL1NTlpIIBTjesv7EY2jxvP/qLS+lCPVt77Luq
         rUd1iwE7qJp3eHt1efgDnlu0m22nIiZ91jlM54OD1xzdwvUFRHU3a8JSXNLiTdP1exYC
         oumZsqCrE6QnBplNd8JuO0NKw8vH2quOAa3Nqcd0CVuCcfghzChNMmfzX4WGfuHy4HTS
         2hMajNa6CWxbxCIyMntAa2BxAnCQTADkWp0QrbR8doUDjxWSozUiQukHkH4EEj3NJUGt
         87zVNvLQXg4tqjUwxfFXtMeFYgNgs33ubV0Zz/ecVIad2Zg2YYSh0CQTLNsbP+EG0Mxx
         F5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894759; x=1788499559;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lg/I1KrLMSgT8druSaCQ9xBXT+6cIU91C37g0VAcQCE=;
        b=If1KOSyP4aFIBXtG3ONe6agdrm3tdXARhV6uJVmoODvvUpzAwzyW6AuWj3KiSuAYEa
         3JXyGeQtIXpmiroQgNdQxw32n9RQjfl0I+0Y+1nq3eWaJVGN5dGKjN9xX1hGhaNS9kbM
         GxQGfbv5Qk/rmJDkP49+EDCdHCz6cDTSU7YI5hvIQOAHhBlV95OqBwfGiL/jbrPx8nMV
         vMPkibzbyT9qxR848ZzhuRijW5J7p/SVRx94Rv+XZPtvFCn6CWvZekBt17/diDq2pMD5
         pXQ3LYPiAbADDd7S+Z11adN2EUUFF2Uo28luaGIVknrPYwqgBB7fVAepfKenRYYrXAOv
         zICA==
X-Forwarded-Encrypted: i=1; AHgh+RqTXPNuMq/7AmRWqLL9pfTogIwGUNxvrfc3dRKLIAHx0f8RZODuZycKgErH996fsQ1SNjyoP48Z753BUZk=@vger.kernel.org
X-Gm-Message-State: AFuF++lIiwcCMQ1A7L6l/7SOOCdYSkXUawkcuvkeLRX9ktsc29nv4Ctn
	u2VChbJUoBmnLvA6jvg5YJ8lSlVVjijK2xNMZnWiiryQNQHKd1c0vhJuJNynUgDsifAuO3WLMsg
	dbXM2TgBe3KX9uqKg2pZv8pmtPOFROSHfKslVEnr/BxdkJFedtEDe5g==
X-Gm-Gg: AR+sD10v9fPplP3AlZzWX+pfNCSjRFAzvwpdz0U6uIlwhT4SDJywFF6nQKRyS2EQLsH
	R5SLkPouBD0ptg7HhWPgB1YjfBk0dvwsLaLMpad7OsU3XmYPN84RXTSXiOJ9MSag0qltRDfK8Tt
	0ia8KR4qNwweFy3S3OjlOwvFwIa6hn2t0VazSZ4S93D/qqi7rIqR/svvjD3Ez01RroWD966I1d7
	vHhUN3FiSaqZVAQFpZFugyShKfs2sFk4SFCUPdKOZJZnWLOHRHaqyPUAfuB1IaSCMzP517MKTW1
	LxBsRXpJ+PGbYUWhi4nfrbLvmgaeicVutPQdOt0VcvG9o5RRjRxkNTAIyMLmMtwvwGyLy/cE1uv
	G8ujMl6v3icXq9aUkyMh2qsV7ibzYSON3
X-Received: by 2002:a17:90a:da87:b0:36a:5d1f:7b6 with SMTP id
 98e67ed59e1d1-396d0d4c42fmr9563046a91.2.1787894758191; Thu, 27 Aug 2026
 22:25:58 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:25:57 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:25:57 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:25:57 -0700
X-Gm-Features: AcwNN1V4QqjGk4nAEbmFvmEZJhLWR8irifXvEm-WOqTp4ehBPl97ZxhUjAj0Tc8
Message-ID: <CA+0ovChRy63DAXbxzSqmSQ+QTsGe1=GrwYceenJM1m0ebUxQuA@mail.gmail.com>
Subject: [BUG] ath6kl: WARN in ath6kl_htc_pipe_conn_service() at
 htc_pipe.c:1314, :1342 and :1347 during USB probe
To: Jeff Johnson <jjohnson@kernel.org>
Cc: falemi@asu.edu, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/138-ath6kl-bmiss_enhance-outside-wmi_ready-guard/

  WARNING: drivers/net/wireless/ath/ath6kl/htc_pipe.c:1314 at
ath6kl_htc_pipe_conn_service+0xb46/0x12c0
drivers/net/wireless/ath/ath6kl/htc_pipe.c:1314, CPU#1:
kworker/1:5/11133
  Call Trace:
   ath6kl_htc_pipe_conn_service+0xb46/0x12c0
drivers/net/wireless/ath/ath6kl/htc_pipe.c:1314
   ath6kl_htc_conn_service drivers/net/wireless/ath/ath6kl/htc-ops.h:42 [inline]
   ath6kl_connectservice+0x16c/0x6b0 drivers/net/wireless/ath/ath6kl/init.c:291
   ath6kl_init_service_ep+0x21e/0x2a0 drivers/net/wireless/ath/ath6kl/init.c:398
   __ath6kl_init_hw_start+0x8d0/0x1260
drivers/net/wireless/ath/ath6kl/init.c:1753
   ath6kl_init_hw_start+0x16/0x80 drivers/net/wireless/ath/ath6kl/init.c:1832
   ath6kl_core_init+0x7cd/0x10b0 drivers/net/wireless/ath/ath6kl/core.c:191
   ath6kl_usb_probe+0x1b78/0x1e20 drivers/net/wireless/ath/ath6kl/usb.c:1162
   usb_probe_interface+0x657/0xc70 drivers/usb/core/driver.c:396
   really_probe+0x267/0xaf0 drivers/base/dd.c:709

  WARNING: drivers/net/wireless/ath/ath6kl/htc_pipe.c:1342 at
ath6kl_htc_pipe_conn_service+0xbdf/0x12c0
  WARNING: drivers/net/wireless/ath/ath6kl/htc_pipe.c:1347 at
ath6kl_htc_pipe_conn_service+0xc3d/0x12c0

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
