Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAA5440658
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277853; cv=none; b=YcArhXJAov1cQJmd0nZ8OkgPccFQj239qvOd8RTiVCEDCehPGVxv6s+K2mFDhWC9Ged9sWsUticGa1WGAXTRwQocwzDU080Z2OWjiOb3RJd7b5cnOzN87FLmU8a5cQdf1N2B0qYNoDIFvRHF9Gv6Kmv8C84TEZHw+PelkhFdUdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277853; c=relaxed/simple;
	bh=GH34+TPDV0OH0YGrcCNR5zdbCp0zUqaownPjL3PC5vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftoOzzzXFmHTMKEghEuSLF1XwBja214x0sHbmONzbZVQz4qT8EdI0TyeF/9kM89rGnxyHYb64sk6T+3n+ymaxIMoOhOQR/+EwGak0u8m54NfdZqWU6dYZdos4T3J69Dtot2wa0Oj6LqVo4W3R42upbD0GArFa7RXWI41Hl9/ueA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ls3CeNK+; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ls3CeNK+"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-857ff9fef54so837397b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277851; x=1788882651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WCA7Kpx8hD4vgLR56rHPyc6zmvhos8uYlO0TkJQjSQ=;
        b=Ls3CeNK+dCUQEQ9g+eiKH5lyR6ovjVbNJpTbI3mT+yVdkHddWKZa8nOi2OmhcO18pk
         NGpoK1NNhVsWphiSmOVJ5ihCFuzpu5m6Ky7W6tXUswitcmLjUDG1xxe1t0PCmkIOaftK
         rUB6smdpZ9SNwzpyTsNyxAU0OCF821RJoz9BUlZc/gxuGeSCDGnYywcYMVtcxEF1o5nf
         zhhAQ2sRUk2+2v8BPGKtO48yXJa7LJENlf/ZcjnWyRcwIgNMMa/ldkR3ll7gotcFkBRj
         nQ80zK1zzZ+wg6ZQHXM7nUiOLBY9XNP5xFkg84f4sFd5EBEKeJy3+STVbGznZ6rVbr3C
         UeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277851; x=1788882651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1WCA7Kpx8hD4vgLR56rHPyc6zmvhos8uYlO0TkJQjSQ=;
        b=mk2ak+MkhxBeuJzRtNzUNJgAEb7DQWFtiU2zCZYr1i3QeH//ueEWkOmL+7e8xTh8B0
         xs+kli6OnT8QjgQ0NeGnzRGxTGJPzL23iB2hsZ0bd+riXSmpWV6ETQmBi+UKxAUsLif2
         LazuLAQxVffBGrabaMchEGHA2//VoYQ+rhV4D7wxEwAkMNRYzZloe8uA9HMcKk5qgA0U
         TY9by5tsJf/mowAVlIoLqkVlm6Akp4bfMpkgO0zPjKBQeDaXHBEbayDNQnmduQlXbj4j
         oaJPbhW5cv1Tpj4IuZh5tlHdEWDl3RvTDRm16o8kD3r2eFbwN+b25VY0s1NzFnUtEQ2Q
         omuA==
X-Forwarded-Encrypted: i=1; AKwUvByk9hnD5mfdc7qgNutyj1UDZYlZtRwhiHjn3P6odXksSRzif1cV0+BYBSRj6bqNwjiX51WPvJcl3Gfes+M=@vger.kernel.org
X-Gm-Message-State: AFuF++m13jek0hdH51xnshVMrF86WJ9LYtFzqsTBohpNHR9S4yQBX66h
	u6YDQVpX+BHwPhXVMNI2fr8x6RUo0p/xLX22YRP3Kwkiy+HedTQ5TZwL
X-Gm-Gg: AYBFou03HqU/nrGhRFoTtGT/ayklNMkr7t42EKcideBR5Sty9BDSaeWUvKz783WmSVh
	sN/X/UqWgq0BgRRLhKXjOzU0MrU1TJMlDbIdEzAvUFLpYQIR7t1stQbUw/srsYlMKjPJVkmc0M8
	8TtnqO6+XQNVYDqXF4u/lTiQbsNFeWODnpx/LaogYXtHtb5wlno73bS4tMCMVNE69M7iw4AoeZi
	X4FfPzQVZVl9lXcW/rKsY3Icle/6Ap1Xqa1e3nzLBGT+oxyERvBpLjON+1yoBy8fdZxgQxTkqJL
	hrdBng0kJlwELIP4so/K2Ag1bnUVfByTsCocCaNrBHyWwtObcdobZ226F9hWQII04lLawFGGmgl
	Mi1iIkB/Ba3pgmthdc7dcQWDtpP6Z9SEZlqymsddKIeB+2kesbo6w7jhgdLq/jiPJAd+T8QarCv
	+5PQsuXzmu2kqXDEVcyUJebzmP2+P0eWj0+t+Y2/LM3iU6MM2WTGWNlCKsIEk41tVNS41kYuLuo
	ETbQRvjbxp9AYMmSbK59UbBzqvR84nfdzN0Xhih1Q==
X-Received: by 2002:a05:690e:4383:b0:66c:c640:a7a9 with SMTP id 956f58d0204a3-66e4c628ac9mr8233396d50.1.1788277850787;
        Tue, 01 Sep 2026 08:50:50 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1f6fsm8603269d50.13.2026.09.01.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:49 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/24] alpha: select ARCH_HAS_GCOV_PROFILE_ALL
Date: Tue,  1 Sep 2026 11:50:17 -0400
Message-ID: <6d3dc767a7fe52b5e9fac3d1e4e82944d23a7ebd.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC's gcov instrumentation (-fprofile-arcs -ftest-coverage) has no
architecture-specific runtime requirements. Enable GCOV_PROFILE_ALL
support for Alpha to allow whole-kernel code coverage analysis.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 1aa76a2d9750..a6024590ea6e 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -5,6 +5,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
-- 
2.54.0

