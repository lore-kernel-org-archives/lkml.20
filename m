Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B383EB0E7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524632; cv=none; b=OyrZsuajb/xqrI35/6TyYKCPV1+mWpS0Dh7KGUUiXenUH1f30ow42XsOE5fN7nwTzz0e2YoIlAHxWUH8mThzU7n3sHlQq36KSTaYGJEjd6LurCuLM3ox9Xli1U0rjyOs++tpAWbxjlPIpg+DoZZBFZmeAVlwDGggga4woTkk57A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524632; c=relaxed/simple;
	bh=JysDxPmjMpNUA6nRTkJ8Z2qVhdxcvDvyicbfAB/9YE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PgGgHofWVVDJN6NCCw18i1BHpUra1QL5NsXuV9hPHOctYEhtLwO9QvZ/YducdajxhDEAvvSQcf/qqY73GydIrSBAVGdWhMqjZWfUTNuYlXWFuQ8ZdfBIN8ftQjM3WYWRVnntqD8A7ALEB/Rm1z98RgdUT1DP9+TK05h2453oHZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9mHtwjK; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9mHtwjK"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aaf3f54dbeso869410eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524630; x=1789129430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=48bh5v3iZ0P6R/HrsRRq/fF8P1a6WmNFbUes+a85bHo=;
        b=k9mHtwjK5HUO42sPgpwigGkIgATiz0llS8w1SorFQ06zw7PGR+2R6Js328w9dy5kVE
         PRunEuIGTr7u4f6fDg+zddEONVnkotOwW6m4d5cfVChtidaTg5wmRcMMpJxCqrt8koJG
         qX5hKJNgUXa3lnkKGQktFGMyCfguFCjCbUfU3zplqCtNjiqxL2ugyPK/4lnezXi0B2Pq
         dH/PrieGGhHi1se4wWcvKLpAl7hLUa+IJL57jECgilNCu/+8BVtc3Nz2zWe3z4CNom47
         8JUXaZfH2VPVdgz7DEgiB3DtBAFa6XfXvmp/sQErafPZmAn3uGTYEO9b1qAsgrmDWsi+
         8jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524630; x=1789129430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48bh5v3iZ0P6R/HrsRRq/fF8P1a6WmNFbUes+a85bHo=;
        b=X44seO2NboN/+w7FVyXD8HFzNGQkCZjhugSIoqHvX5iOGsm/O1tBmUyPUO5IQ5HGU6
         VuTxaQ/JH+t/kdKtgM6Mk8Ze/MqC9MRWNfCjZLbtdy4Er/hoyKSGgeVIsJpF4oQ9ZZmE
         aiIPhPU0G06i1XQGDxo4ll895r+lCaTIkZeAXyK0haMbcg9wAejfiA7XV98UOEzo4b5O
         WkvwVf8j9IRE5I+IBD2GaWNu/VoiEWRy2YXg9jSYbIwO0q8wAstVKnWNyjh0AuqSc1Y0
         kcLD7I6BxvB8bPhfqr7/053HhsH0FqbGrVi9AOfg71rJ2MArDa7iVoThbzWzVcedxFw4
         2pqQ==
X-Gm-Message-State: AFuF++l/VbWgXBjB2vK5n9IXK4as6Yr1b8fb5QneHzVnfxd+dd3AgRCG
	GBa9KMYotvrSLV8ECJUk4yaTACj7me25QXKcMpK6PiXF4v5F9ceWmIWsAbT7LVx7FQQ=
X-Gm-Gg: AYBFou3vYuNbgr2NADSDFsL010uqbdA9OxyCp6it8B9QC3Xi/swCBvWvgvs2o8+xCeQ
	CVXXzkdfF3mlzfmLz2DCjv5GdmPm73UmAEAEN9/qNbXvoTJO38Qk0OiTFcHGyHAd0pq8cNY7kif
	inXfcOmcdrJRbVGdfpdKhAv32ZLlAWQVvsfi1SWN8UrIDr6XLBfSHuc+AhvdmymReBfLeNCVFYV
	3ygXxNySt4Yf97l/R8HpFjiKmIVIWOGpd3bWsGOcwE+KT3qUdQXtgih5e3BKjL08xgLO8r7BmPo
	9wJhCqtEzo5RP951LX/xwTePNObGUMCSpafSDMkS6Ouw/HcNVyzu8zVQb/hu39oG+cNrfzZuM7S
	UsLgkThBbiCktLzNQrpQjMTHV5SkXgT+iQedBF+9aCmjsji+qaw4/9sASoxFAtWHLUAl7LkPw9K
	EtpZozLYWNSJwaCYePSg0wikA9ad4Fo4dXjpXUlKipkoifE5UNJ44Y/c+CiM0xGSCBgvp0cjhLT
	cFVjyrNcr2wPBU=
X-Received: by 2002:a05:6820:1501:b0:6b7:83d6:2924 with SMTP id 006d021491bc7-6b783e5d795mr1513169eaf.39.1788524629974;
        Fri, 04 Sep 2026 05:23:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm6209359c88.0.2026.09.04.05.23.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:23:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: fix typos in comments
Date: Fri,  4 Sep 2026 17:53:39 +0530
Message-ID: <20260904122342.30456-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  ARM: mach-s3c: fix typo "capabilites" in comment
  i2c: busses: fix typo "retreive" in comment

 arch/arm/mach-s3c/gpio-cfg.h     | 2 +-
 drivers/i2c/busses/i2c-s3c2410.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1

