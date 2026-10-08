Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72893392C2E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479634; cv=none; b=utklv0TcRoPQ2Q0Zq6u9d3j5/dFKKuFQSvRf7lFc82p1IjPewkJD4+8g2mMqH0maZE3MlfeRgxuO9wt2wvP1pKjdTnMhP+0HofZOS4CwR9lJeOS0ZEatctOzvRhZs14PzpWUDErhfBgzoyqWopQci/xdSfjf8zVT4p3JsSLCt78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479634; c=relaxed/simple;
	bh=zyl3rjwI/SVIkAcHQJnHlvBX2sQuJv91dL4UcqEKTX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iitmFxOI+2fn2DiEkcjm+u1UWiDeUX8Tz1LyILxG4C6BEdamvvYkfnLmUGPT3GL+lQH/aQHHHM1e0P26j9x7rkl61MvpsOHQSmUh+rWpZIoIH9HGJ2xo7edufJ/Zv1g7jia/CbtynL3PzximIBG/nzCV02+GtWWx8i+iNJZPY3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=SoxsXxvJ; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="SoxsXxvJ"
Received: from eahariha-devbox.5bhznamrcrmeznzvghz2s0u2eh.xx.internal.cloudapp.net (unknown [20.114.54.184])
	by linux.microsoft.com (Postfix) with ESMTPSA id DFC8820B7166;
	Thu,  8 Oct 2026 10:12:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DFC8820B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791479575;
	bh=5W2n9DShcQIUpKORkk5Vb4Cs1tY++EjPE7xgk+b2WuY=;
	h=From:To:Cc:Subject:Date:From;
	b=SoxsXxvJi6bZIi4ELJfl40kctUu3ORsPhL8jggtA6moj/ZzdUs846o3YDME687+xz
	 rJnfmz6PGoG5GMD5zdH3R3Qs5IfwOBwHQiRo5yRGO1qJ1OhxMg/fOrLtEz+MSmPW+X
	 mPJZue3ak/6Y/CAJbnI4IUymUaTZRfAkXY/EVTd0=
From: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	linux-kernel@vger.kernel.org (open list)
Cc: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Subject: [PATCH] MAINTAINERS: Remove KY from the maintainers list
Date: Thu,  8 Oct 2026 17:13:47 +0000
Message-ID: <20261008171348.91738-1-easwar.hariharan@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KY has retired from Microsoft and his email is now bouncing. Remove the
entry from Maintainers.

Signed-off-by: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c1..f263ac010209e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12161,7 +12161,6 @@ S:	Maintained
 F:	drivers/media/i2c/hi847.c
 
 Hyper-V/Azure CORE AND DRIVERS
-M:	"K. Y. Srinivasan" <kys@microsoft.com>
 M:	Haiyang Zhang <haiyangz@microsoft.com>
 M:	Wei Liu <wei.liu@kernel.org>
 M:	Dexuan Cui <decui@microsoft.com>
-- 
2.43.0

