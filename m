Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30524503E2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247108; cv=none; b=Bk7Ohv5xhazis/LBjpXeBvOyhWrNlMxOln25pqn0Au311FKIevgzrtuaq7xGgUSHum9h52Pwp4/zMUmRCly5qIV6b4E6Jj82r4llIPJlFRI8HciXbqvhemIltD5VXnyiFuFtYfqrgWslmghlCEnkMdEorqFKvJI74swffggnpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247108; c=relaxed/simple;
	bh=yC4P/yh2u6N0eaFhC0Fsy+SA1O55+YNOrHYw20bPrds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Shn+TKZdnXTx8JQ/aqoE3ZSBfPkGZM6HyghKjVvT0K50GQhWJkHtqk9ZjL8aeO8sHK1SfyKFFlus20Ak+02A58bYZ79bLx0gHOE+YtOs9+7hogs6nda9sPIuWg5T2pM5eFiaJ7VQ/KI+lIrIq0+QVTUNtM7dKf5Fv1rlEtc1Bqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iIgRZ/fP; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iIgRZ/fP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7h
	c4RjTJa1mQMum7UHgTTSoMSHAW3N3SxLqa1lSqhwU=; b=iIgRZ/fPwFZ8S8jee2
	HhGtumAdoplziqLo3ec2XLRBUeYjbQA7Fzmbb5JP//9qyLH1sV4cr9ZNxAWw2enf
	98M4bt3x086qlm8oF0ucjd0zAhX3w83pVpNGlfP9qAUtbze/sJ47lG0uT6xaDLiK
	55GJ9RZ+j3vpvOteJeKu3iNGw=
Received: from ProDesk-480.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCndxiOALVqItz+Aw--.7249S2;
	Thu, 24 Sep 2026 18:50:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: alex@sverdlin.org
Cc: akpm@linux-foundation.org,
	cel@kernel.org,
	kuba@kernel.org,
	martink@posteo.de,
	linux-kernel@vger.kernel.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH] mailmap: update entry for Andy Yan
Date: Thu, 24 Sep 2026 18:50:33 +0800
Message-ID: <20260924105052.768760-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCndxiOALVqItz+Aw--.7249S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4fuFWfurW7uF1ftr43KFg_yoWfZFb_CF
	W8Gr4rZFs5tws5Grn7Zr9xZr42vw18Gan8WrnY9r43Ar12yryY9a1vkrs8Ka4Yyr97WrZ8
	ZF1rCa9FyF17WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREzVb3UUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7hMsimq1AJOVkgAA3Q

I will use andyshrk@163.com for future review and discussion.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 1f5540bc33f1..9a2ddcf1c7da 100644
--- a/.mailmap
+++ b/.mailmap
@@ -101,6 +101,7 @@ Andy Chiu <andybnac@gmail.com> <andy.chiu@sifive.com>
 Andy Chiu <andybnac@gmail.com> <taochiu@synology.com>
 Andy Shevchenko <andy@kernel.org> <andy@smile.org.ua>
 Andy Shevchenko <andy@kernel.org> <ext-andriy.shevchenko@nokia.com>
+Andy Yan <andyshrk@163.com> <andy.yan@rock-chips.com>
 Anilkumar Kolli <quic_akolli@quicinc.com> <akolli@codeaurora.org>
 Anirudh Ghayal <quic_aghayal@quicinc.com> <aghayal@codeaurora.org>
 Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
-- 
2.43.0

base-commit: 93f51579e7df248780214094418f205253383cc5
branch: master

