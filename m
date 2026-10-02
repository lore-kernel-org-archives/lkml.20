Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273CE353A73
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914132; cv=none; b=umuugL9oY/ChinbF8a9oFHUe/JRFMSJF3p0xAAeIeRczG+4FegM9kjt/1WryMIjLMKTNiVTcX62CDkLSU7rWgwICmX84kWeZk7/8YLrMoEqCVTY2aZ28laek2J3E8Wq3REmm6dNuGNsQf6nm6fA9CMjMidvSJSxrzOxAbhnm86U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914132; c=relaxed/simple;
	bh=7XRI4vbBHvoU0c00q1fKY0+7WXPupjkAVjxqudbQDSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pBFDoq8MeDGkfBe9n4uRqa/lmgWigOJBCyfqxDwUs6EQg+nRCeyvpdT4IpYewJSdu8z5nehTGYpCFviwKESWf8RUh8MjW5boWX95DGhN2EdVkJO9Hd3s+CDDL7V2mnkbzA0wuniOBnoPYB0qlFccWGZq1/R/osMCp2VJZF37x6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnUFcrsJ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnUFcrsJ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so2214576a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914130; x=1791518930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6O/z/8/5Yc9n97DG94yFXZDvw4y/3pPf2qeqOHuqdA=;
        b=MnUFcrsJtdWQVFnaJWb+zK58yPZ0DkTHAGdDfct9luuyV01dATgBC4GntKsv2BduGA
         LD5ChDx/7or6Q89Jx+G7UUJvjEXBmwPlbgDpd/QVpVkBZg0PjcqmO8kZhgdaxgtBoURc
         ubm8dWdIDTKOkQ+74wdCJTJt5cGE7XeWdVQj6HJUvjhLy5k4PMWa7eVc9gVuTiAbhgn6
         HeUshb5uCzqybRXz++LL92uei92P1L7KsPmO/s4BFCiBCKlym3N9HZA5q7UlHhjA4Z6w
         mK2pPYopoOOR4LntbuwIBY+posM5mdA7jzKW14PdOCFwhJbHcAfCJQjxrI56wwrdsQqd
         EYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914130; x=1791518930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6O/z/8/5Yc9n97DG94yFXZDvw4y/3pPf2qeqOHuqdA=;
        b=h0da6IKdQhzwfdFqrpUAVwDPin+dhVx745vrAbRtpmlghhMCnhE4rjWrEArFD6TDSr
         IIrcitG98ujOtZXip/Tp045EtzNkKsHdcTwQh1TWkY3bLXRXb8WIn7/xRVNnfJs+X8lP
         MNJjC6HgKJU637eUb42L7Ihm2dxxLGOPgG7l34lbzh1clD/RzOwJ8bz0vPfg1lcY/zgS
         RMYnsTBV24SYvL1MYz4D/Wbdy8Snq6uTI0h8Abzo9Y+YLGehGjibKvvbh35x5RCvUKTh
         lvQdLDlaEGYwibthXq/nsjb0XEySWUtP9CGGFOaI7t3KVALHVa5p91HhTkyz6OYuwjZt
         nGHA==
X-Forwarded-Encrypted: i=1; AKwUvBwF6PpSXusFt0E9gjyCltRrd9m4Dj0vtyw8kCn2x3av9dZiS0Zdej7Pu/aLEc31yeD4ymo7Sl7TzVX4FSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsFVoR9OgvayIspvY+P7+lyvv/xBUCNK5WqPxH6xR6YiWgmx9r
	mz2Ao7IuthleijiKbUHKO9O22j2k3Ww0teVh2Ar2XWWLvT6fyqqcHM1dDOPn4AFV
X-Gm-Gg: AYBFou2QS/TUxjY1N+Kh1l3yfDO+oOdny0Od5JSF8zVjCnGq5wxI72fLXDpgw+UNxsW
	wXIGzHrkbGRyK+o0SBjLD3SWRERSt0reZu08EBdEJz3ZzS3XD7668R6R0Md+hgioK5VEdtH1J5m
	BQPhlLxHxYM++5TgtUIdcfU7o4sMd6UjhaWhC68Mwyk7WXZCW8i7RfK9Rm8eXtycsiYMgQD+Gz2
	g0TnKh/YX7aUgcTnnJHGEVif6Eu4hR2LvTq2IRkm3qpbqpCZy/U+NR19NCuAHoIrXpOKFnnRTzw
	/kj7UltFZdz/EWiysPaxlWNtupEWk+FxFO3k3RhsVL5J2NXk+TQ/iCdfCEzaohqaeDr7pYgQV5Y
	/2ml5ndVcgTkpjx+uiIt3xyod1yCMWBqb1AyZhZo1zxupkZZhyfEYlncE9UicpxgpqOsXbjj+CM
	kiodQ17JP/R1IQdJM9n2oDONaJqFcuBXBjYOMOpppfAQv4uiqn7nBONH85EjW3emLnSqgy6QYLe
	i2ttv6DXCvK+rniHXPlx5a9hpZu+PI97ckx7JzfhOHHF8M6
X-Received: by 2002:a17:90b:134c:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a6ce97cf78mr843635a91.13.1790914130355;
        Thu, 01 Oct 2026 21:08:50 -0700 (PDT)
Received: from localhost.localdomain (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ccc92646sm2119079a91.1.2026.10.01.21.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:50 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cacioandpepe <artem122novak@gmail.com>
Subject: [PATCH RESEND 0/2] sh: add initial SH7305 CPU support
Date: Thu,  1 Oct 2026 22:07:58 -0600
Message-ID: <20261002040800.131862-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: cacioandpepe <artem122novak@gmail.com>

Add initial SuperH support for the Renesas SH7305 processor.

The first patch fixes SH4 compiler flag fallback handling for toolchains
which support SH4A targets but do not provide the plain -m4-nofpu
option.

The second patch adds the SH7305 CPU subtype, processor name and CPU
probe.

This is the first small architecture level part of ongoing SH7305
enablement. Platform specific clock, interrupt controller, timer and
board support are intentionally left for separate patches.

The SH7305 support has been compile tested with GCC 14.3.0 targeting
big endian SH4A.

cacioandpepe (2):
  sh: guard SH4 no-FPU compiler fallback
  sh: add SH7305 CPU subtype support

 arch/sh/Kconfig                 | 9 +++++++++
 arch/sh/Makefile                | 2 +-
 arch/sh/include/asm/processor.h | 2 +-
 arch/sh/kernel/cpu/proc.c       | 3 ++-
 arch/sh/kernel/cpu/sh4/probe.c  | 3 +++
 5 files changed, 16 insertions(+), 3 deletions(-)


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.55.0

