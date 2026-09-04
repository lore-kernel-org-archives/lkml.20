Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F388501F46
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542176; cv=none; b=FiLSDrajSc0MWmVZlTjFp4CL1W+82rGUUcH9bnkNcxbxWBrf44FvU0AckyeGzGfpN/8SG9xCegN1YYAtOcFRcqsS6VAdKkeLzFAY1K6xChfeDnSGB3EMiO21zePYi6R4y7/PfdS5EDTcvuZil6ZsgvqHsELLwUfL0M1QzcFcP+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542176; c=relaxed/simple;
	bh=cw0qxhsf3j5xE/+GnK43vOR8JPASjbwHV+e/hSn0PcA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nBX966d9aoOQxlUkfaDkRazrot+nhp9DLRllXaq4+i5wHOhdKP0qVbuExfHDo+CesEMbhrbdxycW7Za+KTPIs74oNCLNPK3faQvhuYuCER0bFPZrOZPHOzRxnDlsqyx7FDIC0wpgKyeA/4dMisay4ewvRVd5NG0lDCtMVf8pQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Su+GW9s2; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Su+GW9s2"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2192b12cd6so107799566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788542173; x=1789146973; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QsLUI6iuIsDgESFlcz3ntuSKxj+BnKcu80wPoUNQMsA=;
        b=Su+GW9s2xstdRhx3ZUWnPRzqMmPBkFEAcywgyEmRd4FpVJB8me63Lm85dXhorMMCsP
         vfPCjcQzM6i8PXRx4EBk63hdHMakQwyTaC3XGngeTF7nz8rW+stkmv/HsuhoiXwOV5Vz
         YQo9JoBFFXLV7lcY/L4GOFawEjiHGjBt2bVe1wj5L9Rh8SNGMavN1gGm6yWwEMfz923i
         f5nO52/3b6Jcf3uRni+ZzDDXB/tqXToU0Tn6/xnzL0lhtGFBfD2rs97u3TjY41Hwx0i6
         F5JtLD6icdJaPd+QuwOPw5vVUxFP3aRwGxI+lMbCeRBSX20/zVbfTEkE/g6e0KiQ/B/9
         /7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542173; x=1789146973;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsLUI6iuIsDgESFlcz3ntuSKxj+BnKcu80wPoUNQMsA=;
        b=PaZyHxtxWa5lzGLdPiE8kTv/yYICM+JG5IlOnOBqNtBFWUgqq7BiSDqCBDCnoBz9Vi
         vf/X90jal8wUs6pPuYb80i9CEe/DnJAXVtad18MpI5JOqtbvAO0Cgzt4pSpl16xY8dRf
         cRzJr9GyS59GbPcciV02XOGb7SlvcP/936qQO6nCiBbTeGjE3YBFfDjBjhyecsj1bUoL
         dqCF++De8rPFjh4l8k2zDXqu0i0dVCd4r++2XhnPj1108IKto0VzECMFv1BNrwRzKDPN
         gxxQoAyqitR+3Kk0RMzi5ivOQBlnUdlhj9VghruZ/HUpKZ3zEeSjwBFVAGGqpM1qQ4OY
         RKxg==
X-Forwarded-Encrypted: i=1; AKwUvByiVaaZ4x31pGr3F5N/3uwnLVSQEQNBA1Brsue6xQmd53ib4CpRqiguv2X0QoV/n3nZW3ONFNmTK2kJ6fs=@vger.kernel.org
X-Gm-Message-State: AFuF++nqoM78rvSeCZfMedWMDmVdsZH0OFw+hWd1SuE2KGKd7CrUyPnb
	/BM6cmAt1LqQGHg1+BFbCnQCBa4RkPvJRnXtPzAzCtSq0gLRXqnJMPEKXCSunxr+YhIm5esMpfT
	66Sl7XOWW79AI7J4/0g==
X-Received: from ejcag13.prod.google.com ([2002:a17:906:9a8d:b0:c15:cc45:3883])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72c2:b0:c25:2e93:289e with SMTP id a640c23a62f3a-c260ca19c04mr527353766b.16.1788542172819;
 Fri, 04 Sep 2026 10:16:12 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:16:06 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904171610.3342398-1-tarunsahu@google.com>
Subject: [PATCH v4 0/3] Convert manual kfree(dev) to put_device()
From: Tarun Sahu <tarunsahu@google.com>
To: Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Masakazu Mokuno <mokuno@sm.sony.co.jp>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Mackerras <paulus@ozlabs.org>, helgaas@kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	sourabhjain@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

As per the kernel-doc guidelines, Devices that are tried to register
with device_register or to add using device_add, must use put_device
on their failure path (not kfree). This series contains 3 patches
for updating such instances. Same for kobject_init_and_add or
kobject_add, call kobject_put instead of kfree in case of error.

V4 <- V3
1. Added Fixes tags
2. update commit msg as per the suggestion on v3

V3 <- V2
1. Updated the commit msg of each patch to mention about the kernel-doc
   guidelines.

V2 <- V1
1. Removed patch [1] as it is part of another series [2] already.

[1]: https://lore.kernel.org/all/20260810162814.1398016-4-tarunsahu@google.com/
[2]: https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/

Tarun Sahu (3):
  ARM: locomo: Fix device reference leak on registration failure
  firmware: edd: Fix kobject reference leak on registration failure
  powerpc/ps3: use put_device() on device_register() failure in
    ps3_system_bus_device_register

 arch/arm/common/locomo.c                 | 13 ++--
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 drivers/firmware/edd.c                   |  2 +-
 4 files changed, 59 insertions(+), 41 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.979.g7e5102b832-goog

