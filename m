Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ADC39C63E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636586; cv=none; b=CCb2yq9wJ3+MJAyU5Gg1lVJE0vJOdBFo/H0IHCg6e9PqFLtdP/FV8kYOwst5UZ8XS03XFzEHYOpVTm4s8oGJ3M82pZU+SxJhp/8Ugp6rfWtj6XLs/xDq2JWbsNX5p1POLHoVqI6LcGxQYXlmPepQzu8w1II9NhINXMNcbOv6UqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636586; c=relaxed/simple;
	bh=d64vrkzV8SwOJMlfAMFEdEJjMT39PCBSfivQv0NFu/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3hheY5P8eSePqupmmYIbX18mpMKap/TxnQhYWxaZtQjPyK6Ek2GySI+9CAxEWvepHMhpIb1+/wK24hsXjjMsqSs/ZDEglgVkzrV6/412PGkVWmKqyL0TO6+Z1dOUyvam3fbAeu8MUL9QVvcIczusgItdqNxNrw+sY/tvK4x+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAxC8DJ1; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAxC8DJ1"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66fb8a78ad2so2341385d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636580; x=1789241380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JdpH8z6Rb7sleDgNsPa+IW/WQmX2mRqnvOWICUv+Ss=;
        b=qAxC8DJ1oJZprWRGoKUSueX/DlAhcE+NuMXLAsk9BHdRXX8yaVbHQ3MzyRiBMmSimv
         PkyBxif8MLuX1LP0skZhoucKFX50HDgDZ+S5WkwCoduBxtQHwW0E7ptlG9W/HP5LOH9M
         5yVeLlE7V8TcPFAj+kbpJDXTfAjWSC/5GDpXO5kIVf6dAxBzOackN3UfgCfINaTTXe/s
         Gx+juww3HXV5O+jrJLrRpTZ3t125Q3kCnohUHCnRocgel+CcABF7lMb6IEvRK3MTjlyc
         TIBrzYoY/j/jR9vHiAKtN3SMIR26aFBgO7yzH7R883Hrihl46OlVP5hIgNbNufrEiToP
         Cmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636580; x=1789241380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JdpH8z6Rb7sleDgNsPa+IW/WQmX2mRqnvOWICUv+Ss=;
        b=TcC3sSkg8SnCSNonIUNH9mO0nvVcKnRxJadQh1DFVIc292vVwWqjypd0YbocB9BYPp
         /wK1khclzbOUYmiODsSjQZ4agK7JSBz1iFN//VlG3mJlSNo325AOJGa7+jKgyObvE5Mg
         ckbWabgPJJDGp9lKE7CkrBHQ+gz2x9iVQ9Mikccq7AmOZZ2BZJ7FpFsidvWeDN/UmOoD
         +HuI6xx1cdMvEcwrJH/M4SBigikG4/+8YMQ4Bx3AAvcc1Jvy5T9ee4K/OCWxzoE/kI0j
         Tb1KGL8jqc9Tf3ThusYbMgS8Cs3juiuNJ4vrUSvSCTAFJc4RPtMyW1I/dbAe4aJfdHH1
         EZxg==
X-Forwarded-Encrypted: i=1; AKwUvBzs+afTBOKuBE1pv/4AR5BngzgKnYS4h0ndAnVD50XtIKRPfBKxaDTzfHmJCLC3fcvaS5EHbC7lj0yfkP4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYq0Ffcy0FMKAgFpWegPTG9BhKNiOugRA0hcSZlzxjoI6gfGCg
	wGjntFrt5ey1VTQ9TxAey2TWvm1upSmpOdPDSAg4V77Se80MaZwTR3eu
X-Gm-Gg: AYBFou0tt8LnTYllJjrMX5vxRipZhjuE5mPNGUC4pNSdiRzmAN/MFKfM1qaBjxyoTYW
	tEn+D0J9ofIx4Y9wONVpbkjWUNY6tp/aT7+GkvwiuznKgAn03w/7OUL3oH/GG8Wbs2ASiwnHNQh
	tyf48VPQr+XfovNJO12+YxMOB8iyodF9VzygJDK0Jmy+i66IFw/3VECOL+SmtpT+012SkYzT3+8
	cV97oXyTrJKh+nfqpfP0kzDyoHwidGuqZYxbtqMxD+lRSchOEVKBqDI04YXH/QzMjDMXjg54787
	bpACnL5KiiBOfoSW/hf1fjpwveA/B3/IAvHZbiPvLBwXbb6nzUZfqgkXxrk58A4KnBUwMKoL/kV
	JhX1ecThiG+vLrGO/zJcXlPWq8cW4GEM8uuCXcaLvkkaAFcCL7huCisEGcdJOo8RCSS8WNdcIYr
	sxDW1DmMGxfph+0XmUlScm3Iq7CWotcDefcdkdmy1GKyM/eC8WQJqrNyFJ1/ss
X-Received: by 2002:a53:490f:0:b0:66f:c1bc:4094 with SMTP id 956f58d0204a3-66fc1bc485dmr2007771d50.87.1788636580506;
        Sat, 05 Sep 2026 12:29:40 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48fb6d5sm4938594d50.11.2026.09.05.12.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:39 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:28 -0400
Subject: [PATCH v2 07/22] alpha: select ARCH_HAS_FAST_MULTIPLIER
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-7-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=d64vrkzV8SwOJMlfAMFEdEJjMT39PCBSfivQv0NFu/w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E52OS953f6VlMGdbfOOiZqUx+b8/qvsEHX00sZJp
 28vXqD7v+MjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCuMVRnZHhVdITDzN
 X1/ZZT7/jk5OsuOnjyCsousnkdKlJ+fmvWU05GhlWLgz6/ueSyxFBtt1aHXZf9g7iqWEbJAzp/n
 s9ceDK2hwUA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

All Alpha CPUs have hardware integer multiply (MULL/MULQ). EV4 and EV5
implement it in microcode; EV56 and later have fast single-cycle
multiply. Since no EV4 system is likely to run a modern kernel, select
this unconditionally to enable multiply-based fast paths in hweight and
string routines.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index d039b7135d18..2672971b83f3 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT

-- 
2.54.0

