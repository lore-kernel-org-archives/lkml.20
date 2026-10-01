Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82300476684
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837876; cv=none; b=QUh/o1HW4Lpen6ST4L4IjhuFWLKT/V/8L/jvG/5Kvs3vEfP8tktMlGegjMAUXR5D3SCctuoXn2F6jvfdoMkTCltHGIihwcb0xw+qYy6E0dxePHmVCnYvSXf40n8dGL8JTWSsk7WlfZsdtG9WqqEXi2d0IFLloSIE3D3Lj9FtVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837876; c=relaxed/simple;
	bh=oyGxfknbD70hR315BZAc8UNTJemd7B5UNz5z1PytFcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ami38kzPQ1JHrPjahTP2ZShG9ZYZSsRT2FboSZLWpVF3snPwVeqBAkejvG2X7SXMGvBXlxoqgBYOdEB5NLTbQPXSME1QvOCS92mPE9r9gjY5NlHeZe4kQPGYHlOpnzUTvlOqPAiZvSnUF2/ByqVMbjeCf1PVtl7Psx0JtDzylLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJTibrmi; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJTibrmi"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so2842110a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790837873; x=1791442673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbv3x0usvUQFlT6gSLII0S/r79J2R+NYTfNWLq1Zy6k=;
        b=SJTibrmiCoS3k9t8Dy1JPkRuCAQLq2L7rXf3FTzQQv1Wro7Vdc+bm2D8c6s/c64fGF
         Z4kiNTwS5ag64vIqXolEil7NAVpbniZRrnDMyzNcnC73wmHziiphKtuy3AJu53cwMUFz
         m6WQqZ1OWJPFtVtijBODow1avTk9OYBjpsptJpX5gxXJmhIMNSQW5C06eADlLzPXXQk6
         sD71ENbWAAZuQtSJZM/CLP6pc3Ky1RrqQKdCembB+QfitGIscmgXw9ljQzcwkTFRecT7
         uDkVuDFIR9uQOlDPXdr2awRFeWmOGVWpz/DyIk4WosO6g5aHOhk4/O/JKQG3cnAPg+tG
         P1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837873; x=1791442673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cbv3x0usvUQFlT6gSLII0S/r79J2R+NYTfNWLq1Zy6k=;
        b=z6v6y8GDDL8JsrMX0OQB+B47avZjZUsr/q9M/plgxBIe0dGZ/E1i/QPDQ6XBc01Wge
         b0oReDOqMjS5aL+S8iffNu+J6XTXx6aVFMcdCNvZPlBxQdcWY1ZSFr4cg0BZiwcKBcPN
         cGKtTTLeHdtW4BYUcmLz22WXClaH+RrZSJBzMxR6XyYsJzvUFu+ZKxk7hJQQDW9E4aAa
         3AIfHq0vT/OmHiOVdApymvE8D0rQziI6wcVbe/WmDeAaFRyrBWg310zDBotbzSnDf3/T
         b7i6UwB9dCFPARK3tg039RHSSR+agO8FpC7WUiO1qhs6fuXK2/6nqZO+VPE0ZCLAZ+WH
         QFRw==
X-Forwarded-Encrypted: i=1; AKwUvBySB1M0HODwXRgely2YRRVDbKsSs8dVJcluKbuzAJg3ojdeDVg4wBwCwum+8NX5TEiXr2ZdMLQIzwlLJ/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkeYQak/9XeA0bwOcsjCORsB9r5ob6VnAWSLKx+lAy+jlg/xEe
	BekCE2YLirR7NiN1lnrF+/zUul5176hKt7XhXZm3msrO5yhbp2ZSAodj
X-Gm-Gg: AYBFou1KA3jdBIYC9mQPAX1rCeBD2lOs6SSDCIejARq9R7pY8PxPNicnOv9teXkZEcX
	09mw1smYVoUKf78eZvbgI6pYrsW9USo0QpIqmBs8+ElYKPt7JdrSorobgcz8xW8Eoz2cyMnY2D9
	8awZ9DIu0vYS6H7p2woDDAcUw5bXfIsd3OTbgpf/6D+GRhN/0KWTdCGK5GC8jvePG9wt7Qljhbu
	4azJw4VEGM17QeVwmdk4WJ9j92F8PaQPG3yaFO8T08wtEB3xB8Fk3rZXleAJsihW1tZmCU92u8s
	03v6yAYAriJclbe5xR6JiniMywRuJdGSvnYI1T6H2QWNeI4y74IvayJjDhH3x6NScv9Q7OZvX2Y
	toIOLbMo/IwtBWgnenraWM0ExFy+pcQXEq+mzhEzF2nAH0VDWMM4B5y1tHw9oLwGVMJr8ABkzWZ
	jKBIssL5KwtzLs7KwZ0GLl2N3U/9OqED/+Zm423MMNGIdtG7coYzlUb/cUdkJ7WkxuBzix/uUPg
	+Ijr461uJ5mWbpnt032sk+b2H9SECPA/Py0Pqn6H/LesZrO
X-Received: by 2002:a17:90b:3b52:b0:3a4:e31b:9312 with SMTP id 98e67ed59e1d1-3a4fe5a7b0dmr908773a91.25.1790837872858;
        Wed, 30 Sep 2026 23:57:52 -0700 (PDT)
Received: from localhost.localdomain (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44d0a30sm2873138a91.16.2026.09.30.23.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:57:52 -0700 (PDT)
From: cacioandpepe <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cacioandpepe <artem122novak@gmail.com>
Subject: [PATCH 1/2] sh: guard SH4 no-FPU compiler fallback
Date: Thu,  1 Oct 2026 00:57:35 -0600
Message-ID: <20261001065736.753215-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001065736.753215-1-artem122novak@gmail.com>
References: <20261001065736.753215-1-artem122novak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SH4 compiler flag selection falls back to -m4-nofpu when
-mno-implicit-fp is unavailable without checking whether the compiler
supports -m4-nofpu itself.

This breaks SH4A-only toolchains which support -m4a and -m4a-nofpu
but do not provide the plain SH4 -m4-nofpu option.

Use a nested cc-option so the fallback is emitted only when supported.

Signed-off-by: cacioandpepe <artem122novak@gmail.com>
---
 arch/sh/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 7b420424b6d7..238c701ab14b 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -36,7 +36,7 @@ cflags-$(CONFIG_CPU_SH2A)		+= $(call cc-option,-m2a,) \
 					   $(call cc-option,-m4-nofpu,)
 cflags-$(CONFIG_CPU_SH3)		:= $(call cc-option,-m3,)
 cflags-$(CONFIG_CPU_SH4)		:= $(call cc-option,-m4,) \
-	$(call cc-option,-mno-implicit-fp,-m4-nofpu)
+	$(call cc-option,-mno-implicit-fp,$(call cc-option,-m4-nofpu,))
 cflags-$(CONFIG_CPU_SH4A)		+= $(call cc-option,-m4a,) \
 					   $(call cc-option,-m4a-nofpu,)
 cflags-$(CONFIG_CPU_SH4AL_DSP)		+= $(call cc-option,-m4al,)
-- 
2.55.0

