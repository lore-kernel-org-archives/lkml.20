Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371396;
	b=2LF0Ha3q+ATnz9SYX3iIEP7P65K0BRF3/XiivlgTOwKaTJAlwlxINGFM4Z7NdcxvLEt/
	 YGZe5rvOoZaotuFh/AYbucoBpp3HPBJIXsTVJ+RCo3WIO7/Tb46ePnrH9HczVa4DCsdyX
	 3+8pnu5yA/IQM1TtAU2+IN6BXO30tfSoYVaHnTa03rRHqzyZ0l0STArG3JC2g/qv+do10
	 QI/B8g3snxAy0Bn63WGo9jbwosI4RxroBRB9spl2iLvZs/PFI3JUVTjkD7yUSvqsvfN9D
	 IpJotVjajXKDYndlYoEGl/msF5O2YRzSGNdXL1Xk7osVCTI5sXwfNGJolaEAHR/TIIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371396;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cO77vwRXRST1a7xTguxBxdPyGvTO5AU1Xnc65UzOsLg=;
	b=AXGDSTuX7vhrYulaas5HOuiqZcg4ANZUPeAbNComFPmBMa4J0dVG/RuW2T1pk/Sqdrch
	 Yo7CJqVxENKYncZN8dTmcgwh4JCRWMtujsw/Ps+9rfyjvpY3t6Ew6pz4EtVBq2d5xjNye
	 /CnHWIoXpJLZwPSHs8wqMqnyJqmpT3B3VmTtLCr94QzC8RyDmFYs6P1IddKuZiMRp4Rt7
	 syjDdv2Nh4i9GLXQRndmd2LrXuxvaoemmaI4x2rkubVXzL/AEMup4g2ktT5V1d7Gknv2v
	 dIH7j29k3PGJJKomLepM+03zuPuSKPpk+SiXlTpG9Ltee0r+MqLCWsPM9lGLb+LRLfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=i8Fgptog;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3677606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3677606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=i8Fgptog
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B421576;
	Fri, 30 Oct 2026 07:43:12 -0700 (PDT)
Received: from e142607 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A180D3F673;
	Fri, 30 Oct 2026 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793371395; bh=dLtAOHIrhb+jZsvJV1kIt1cJHp/Oe4aKSNgWe1XTIzM=;
	h=From:To:Cc:Subject:Date:From;
	b=i8FgptogBX7jKcj0YP9efSP9VNkQJ0EbH2Gvzhy9SWpVVVjrW/pGgdcwKvSi2+MG4
	 IqOkvuxMM6t03Ad2ih+IEKy2oRkfA3yOyRtXsiimvQ0FtiOlBvy45PXPQK/c64K2vS
	 XQtuGVar2KstguWWZbf+tEdeiDjwtZFtSqPHnP4s=
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Florent Tomasin <florent.tomasin@arm.com>,
	Daniel Stone <daniels@collabora.com>
Subject: [PATCH] drm/panthor: Add more reviewers
Date: Fri, 30 Oct 2026 14:43:05 +0000
Message-ID: <20261030144305.666845-1-liviu.dudau@arm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We now have more people that can do reviews and contribute patches
to Panthor, so add their names to the list.

Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 89ea35a35c680..2f75078b970c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2321,6 +2321,9 @@ ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>
 M:	Liviu Dudau <liviu.dudau@arm.com>
+R:	Akash Goel <akash.goel@arm.com>
+R:	Karunika Choo <karunika.choo@arm.com>
+R:	Lukas Zapolskas <lukas.zapolskas@arm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.56.0

