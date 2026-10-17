Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819A22E8DEB
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792253334; cv=none; b=FigS+zlN5R1dAygu68TtPaBRMHOZuGOKopqofPKw/OTuv9HM5jFVrBhaEXHioi1apKqb1SfAtNwrzUDwjnjYK893VeK2UgF+jbWgQrhWWxEjHYHZddtNLMoUsggwmcaR5SztnrFX77FaFBV+MEjW9l6/agJL52JvVqqk8MjPmyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792253334; c=relaxed/simple;
	bh=DWCmY5z7z4vq4G12qv/hRWrXt2RrydGaFmtxVM/Sg7c=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=fQvOvOh5oAfy53blS2NImN2ZUK/tp+OZHKJOmr7fqYII1ZsEj76Lws5ndC7XrYfIk8U78gJxCTeed0+/7ly1QCZXGm2dlZwSsKzJ0pHpmkYfsrNIQ9l4pyWricaL4j39k4CdrrIboe/eAnqKspYBRLFz2xetd0VaM0fcUwvcJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgJ5G8sW; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgJ5G8sW"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso676479a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792253333; x=1792858133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cUeaEgu4p26tZrZN56rXhHr90NwI8Pog8folKw9Xmw=;
        b=mgJ5G8sWVoZtRbteR6hqdKRBd/svddwH70mq+8vEfAJ5233Yqs5fX0++rEDG5SVMI3
         1EZUBmYlYJ3S496jqxehDNh1rSfGkAN+4s70eVkWLG9L072BTTl1emeECsQwZyRRildY
         fiiJj1ifqs26OpWFWBZNgoNxG0Bs+XpXNhFFrGEM7nUWROfFAaXz4+NjpnQ99C/2Jemw
         O2ddVXxuhSLkWIv/G41/jhX3bfbPm1MjSM9te1bR/BMpPB7QW9ZX9hRIPGatcNTJ0wog
         JcOVPdPECqoWiy1Uqe/rSriO6BMj6ybQFCwcAmuTXimIOq/e8kRQBo3Dp1VfiysdjQn2
         goKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792253333; x=1792858133;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cUeaEgu4p26tZrZN56rXhHr90NwI8Pog8folKw9Xmw=;
        b=PGM14jXvbcxgefh0bvDXq/kyKBp1bXULAzlLQYvJMMXx6m66wIHFGz1roXPzOgnL7y
         A5UqtXmBIixM+ysMvtMEEKlg4H/pSMRxrh3w7HHwphpAib0O10LS+02H6+uLyXkf1Lhq
         9LAkyYTozEGdpcqEAjh9b9VzIFjCfhfHHXbf2CbRlAvVvI+zaYK4BiFxtxBEkh8cF6YP
         MgOxPni1dUpeVOFym60LCc8Ywe/hIeBJbwU7E0YebamxbzD8iLfaCp8QzZwX16gTcxf+
         AYsvDjSbEa+Szw8aE8Id0dJnTPhygj75GZtVGq5LfKMBqE1yu9YfkXh0RM4U3ZN0AGW6
         Zx1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFaWTHu0rExq3cs3VzIEdMovjzxP16i+yVByzKqEMCOA7tPN0TDFwTgPiKidxkUK/gusTTEdKFkeQKjrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2RS8IQouSi0wIeWir6rh2fntMLhpROlHBCR4NekfvZ/1loU4P
	GuonrYwESRctzZKuw0rsxdrqE6FAxEyvOm5mOf3PFzVXN+CTq4YrWVm+
X-Gm-Gg: AYBFou1wtnDuJ2pnw7g2eMh/PhWd1JgKlb1StGj81r5gYZRalSfT1GqtWEFAYRMGMSB
	SIIzMoxmthHL4OaKSPbv61f92zFCC93M3XlgqB7UQSMdxL/kGgONzAceRsp8YzPUY3sGJQysufj
	2jC50U2hLeC/nm0TN/I4a4gqfQE5BNUXdCCQbrCV8udF9ZZ+vd3thX0WU5pG2t66N69iFQwRD+4
	5K9N++vtjKxUDrgarVrYa8+oaTuO2yQjSYgLQUjrjbRPaHaa5l0B+mRSPmJxnpVrJkGtVGulHdJ
	fPxkm4y94YgwpJBpRYl7XEID3ZeIOhMZ2byJvUsaSK6EqqFh6jL+/sjiARuuoLhh/SlICB/R26Q
	ktmiJO6MqOAdsXbQiJ6b3PGmtdOGRxOvu0ucuU5WVLfmk/sEdnfVa9Dif9fZuG4K5D/fBDgfKmh
	/kdjLZjl3gFuaB1GEeGyg4mzm8VEVbENMltO1rLfrCMQCFKpa4uTILqNx0OgJyNv2jFUwMi9Xei
	F5qhL+hbZMIAljWufNDAhlcai6jSMj6xzz0+JwyjA/JaxCnbwBYT/xE+/ZuBYbn
X-Received: by 2002:a17:90b:4ac6:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3acee277119mr2806327a91.6.1792253332865;
        Sat, 17 Oct 2026 09:08:52 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc49c263asm8349666a91.17.2026.10.17.09.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:08:52 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/1] Documentation: hyperv: Update information on guest CPU offlining
Date: Sat, 17 Oct 2026 09:08:48 -0700
Message-Id: <20261017160848.14730-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In Hyper-V Overview documentation, remove the out-of-date reference
to explicitly reassigning VMBus channel interrupts before taking a
guest CPU offline. Instead, reference the VMBus documentation, which
is already up-to-date on this topic.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 Documentation/virt/hyperv/overview.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/hyperv/overview.rst b/Documentation/virt/hyperv/overview.rst
index 77408a89d1a4..63489f73a299 100644
--- a/Documentation/virt/hyperv/overview.rst
+++ b/Documentation/virt/hyperv/overview.rst
@@ -132,11 +132,11 @@ Starting in Windows Server 2022 Hyper-V, the ACPI tables reflect
 only the CPUs actually present in the VM, so Linux does not report
 any hot-add CPUs.
 
-A Linux guest CPU may be taken offline using the normal Linux
-mechanisms, provided no VMBus channel interrupts are assigned to
-the CPU.  See the section on VMBus Interrupts for more details
-on how VMBus channel interrupts can be re-assigned to permit
-taking a CPU offline.
+A Linux guest CPU may be taken offline, and subsequently brought
+back online, using the normal Linux mechanisms. See the "VMBus
+Interrupts" section of Documentation/virt/hyperv/vmbus.rst
+documentation for how VMBus channel interrupts are automatically
+re-assigned if necessary when taking a CPU offline.
 
 32-bit and 64-bit
 -----------------
-- 
2.25.1

