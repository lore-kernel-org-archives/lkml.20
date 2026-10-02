Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F235C6B9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914135; cv=none; b=Ndk7/Q0+fYhxNX7rIby22ImNG94m9QyIzzJkmVtLgirHL3A54HRj4dKQNdHvS2Lk6S0S8UxVoDCQycc1rF15pEvTN7sQSDf+CRvaSm2hq8XqOdZWfzW6BE5cS7FPJQnlBisjg+n2ArM8AD78FOqbor0lKvIkf9SDQdHrCsBDfjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914135; c=relaxed/simple;
	bh=exTaw7F3OobWYcwyFrrXr9e3wYrNqRET2QMDSQUyVW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktlMTg5AKntMzMjSGoEyxoKSF1p8hQC0xAui3WBMBAmwlR0p+JD0v3e9Mi1G12MjWp0ETYsuOQySxLTyeA5ymu4boIvXjptEWlnqiGxys+T5z8TE5FLgk1/QPSTuEBuKUZ/mZPAVSTx7bYJbZcNZy6NItEltYxu/8mp4s0nQfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLaj9a6f; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLaj9a6f"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso4604010a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914133; x=1791518933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=708/R6aTK88LREMdk5KzZq8mEqWh1gKpczYWgyOqNNg=;
        b=mLaj9a6ffVazLplNaUUH+YEM8JRxIDoZxYi5pmEV05u/LBYIYYmsTraZ2H+1NSzne/
         MkzoDdB/3B+6EiDnQUVDDF7RTYRt0RGgx+BcWQ4wbIFNl6us2Zh2JJHSp6chMWm0DdqK
         xLDxDVIMKrGL7oCiEQ4wHGzWkpjPwrMsMMxW9WzhLTRmOh6sl94P5N4w7LiKGjKAGvQb
         0om5a7i+SJk3mX8CXdGnsNmfAROOKpfhT/SMlvv7Pm89ZmWLynrUjq8oMOJQAMuVsa50
         Iez+On4karyy1lMgXaJgqnAGLAZCf1Oe0R60s5elyR8xTOAtfjVLFWqbLIq3EvF0jdf4
         g68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914133; x=1791518933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=708/R6aTK88LREMdk5KzZq8mEqWh1gKpczYWgyOqNNg=;
        b=gTXmUuPpp8R2v7Bbvotvi4oACbCwDZHiAQqgpnJl5R7LU/UkUU4Vdu6WR5J9JmgBOB
         RBnrdyDsJewRSJj9kX1f/NK/H6XuSMWvl4Q2WfIkJt7TzjPe/CcqfftLLPow9w5cA3tz
         yGrSrtGvew/P3cZr/C0lJnWt4HGRx4NAO73lkCR24thpvqS4q+fSnDQX+MNwcA0uVkMQ
         wGyXJ9nZXFXKpFD4QSL0dj7yGkcAdaNORIZGsjGvJnIrI/Hje79MVIImfl5lrYxL4BuL
         Uc1DGyT+CKvk4v4vkCxJ6yOdfUDOF8Xm2vrpUjEqMaMGlfyK4ey9tQoabwbBSY15KUTY
         d0AA==
X-Forwarded-Encrypted: i=1; AKwUvBw+xq6zLd9ibJCb/hUAQ/Afu4cawC+5iwIP5dfP8yVUpd9Mc658ZMTJU8S2GIF9sPztL7C0xndxESqlivA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKueDouGeqEK4UDtpLUnEtsRjzcvQVVEIo2AMGyimriCJ+4xzpm
	ryJETEkVBTr11MLNOxUfNw65BSlKXpgNFEgWZKC/X4ymoTLE9tvlo24i
X-Gm-Gg: AYBFou0s5V9eORQhlbsrZfYmX0En7K7zO6Kp4iQ4yrYE5h0OLdNE3gzjbmWRU27YVQF
	eok/xfXVSnfUTXZ8QpguGY0uORjsUed5G+mxzzxo2L5GPxDeLnqaFV00Yjo62Dny+ZrEoKt/GMr
	1sbW3xbKtvip1UoYXzSGlFF0EJyzVyYKO1LXUHR8bJ7MPLEdyycUn4uyxreRa6PjU1tC0e0ch7e
	w6BINFYq0slwpUlwsTIBwtYyzInMBbXWLSgA6jrAY+iLi5UCwyblaPsjO5/ARV4sQa+8H2jj3Pk
	bcPrM6xS49w1dVTdOclwlr8InDfSI/WdQUFJjHde+mavUYn/4+97Gn4/fsPivWdhEwtnjGhus9q
	ewjlCnPE0pKl8BfMxQa+2p2In0kWbqcA+2mr7gK4F6cpd81ImgaVLIIQ6GiYQO3KCsOMlMo4Ym5
	AH8Ut+Kf/at9TnUbSY66sBEK26nAMKo8sew/pdUmvR+gC5aKNIDEXP+9kqjTx2viXOGa1dmneOT
	BRUYUzIlR7yLraYjX29nizl59jq6XPsHZd4NTsrsh6nbufL
X-Received: by 2002:a17:90b:2787:b0:3a4:f4e8:e09c with SMTP id 98e67ed59e1d1-3a6ceb0557fmr1361660a91.33.1790914132164;
        Thu, 01 Oct 2026 21:08:52 -0700 (PDT)
Received: from localhost.localdomain (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ccc92646sm2119079a91.1.2026.10.01.21.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:51 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cacioandpepe <artem122novak@gmail.com>
Subject: [PATCH RESEND 2/2] sh: add SH7305 CPU subtype support
Date: Thu,  1 Oct 2026 22:08:00 -0600
Message-ID: <20261002040800.131862-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002040800.131862-1-artem122novak@gmail.com>
References: <20261002040800.131862-1-artem122novak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: cacioandpepe <artem122novak@gmail.com>

Add the SH7305 as an SH4AL-DSP CPU subtype.

Recognize the SH7305 in the SH-4 CPU probe using the existing
0x300b PVR family with PRR value 0xc0, and expose the processor
name through the SH CPU information interface.

Signed-off-by: cacioandpepe <artem122novak@gmail.com>
---
 arch/sh/Kconfig                 | 9 +++++++++
 arch/sh/include/asm/processor.h | 2 +-
 arch/sh/kernel/cpu/proc.c       | 3 ++-
 arch/sh/kernel/cpu/sh4/probe.c  | 3 +++
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d60f1d5a94c0..e71b5476769e 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -467,6 +467,15 @@ config CPU_SUBTYPE_SHX3
 
 # SH4AL-DSP Processor Support
 
+config CPU_SUBTYPE_SH7305
+	bool "Support SH7305 processor"
+	select CPU_SH4AL_DSP
+	help
+	  Select this option to build the kernel for systems based on the
+	  Renesas SH7305 processor. The SH7305 belongs to the SH4AL-DSP
+	  processor family and is used in embedded systems such as Casio
+	  graphing calculators.
+
 config CPU_SUBTYPE_SH7343
 	bool "Support SH7343 processor"
 	select CPU_SH4AL_DSP
diff --git a/arch/sh/include/asm/processor.h b/arch/sh/include/asm/processor.h
index 2a0b5713ab80..96321c46ce85 100644
--- a/arch/sh/include/asm/processor.h
+++ b/arch/sh/include/asm/processor.h
@@ -36,7 +36,7 @@ enum cpu_type {
 	CPU_SH7723, CPU_SH7724, CPU_SH7757, CPU_SH7734, CPU_SHX3,
 
 	/* SH4AL-DSP types */
-	CPU_SH7343, CPU_SH7722, CPU_SH7366, CPU_SH7372,
+	CPU_SH7343, CPU_SH7305, CPU_SH7722, CPU_SH7366, CPU_SH7372,
 
 	/* Unknown subtype */
 	CPU_SH_NONE
diff --git a/arch/sh/kernel/cpu/proc.c b/arch/sh/kernel/cpu/proc.c
index 5f6d0e827bae..b6fbe27742e0 100644
--- a/arch/sh/kernel/cpu/proc.c
+++ b/arch/sh/kernel/cpu/proc.c
@@ -25,7 +25,8 @@ static const char *cpu_name[] = {
 	[CPU_SH7786]	= "SH7786",	[CPU_SH7757]	= "SH7757",
 	[CPU_SH7722]	= "SH7722",	[CPU_SHX3]	= "SH-X3",
 	[CPU_MXG]	= "MX-G",	[CPU_SH7723]	= "SH7723",
-	[CPU_SH7366]	= "SH7366",	[CPU_SH7724]	= "SH7724",
+	[CPU_SH7305]	= "SH7305",	[CPU_SH7366]	= "SH7366",
+	[CPU_SH7724]	= "SH7724",
 	[CPU_SH7372]	= "SH7372",	[CPU_SH7734]	= "SH7734",
 	[CPU_J2]	= "J2",
 	[CPU_SH_NONE]	= "Unknown"
diff --git a/arch/sh/kernel/cpu/sh4/probe.c b/arch/sh/kernel/cpu/sh4/probe.c
index ef4dd6295263..7f77fc64258c 100644
--- a/arch/sh/kernel/cpu/sh4/probe.c
+++ b/arch/sh/kernel/cpu/sh4/probe.c
@@ -143,6 +143,9 @@ void cpu_probe(void)
 		break;
 	case 0x300b:
 		switch (prr) {
+		case 0xc0:
+			boot_cpu_data.type = CPU_SH7305;
+			break;
 		case 0x20:
 			boot_cpu_data.type = CPU_SH7724;
 			boot_cpu_data.flags |= CPU_HAS_L2_CACHE;
-- 
2.55.0

