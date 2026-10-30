Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371694;
	b=AQKaqu7xPyyPGTxBKAdJegbiPR/1q91I9yByVRB4FvFznbuabnIGSH3cxmmOgwqJJwvj
	 HXU3WfbUkU+SPIZhSdUQN6U47ukUYOEVr//ef4X8wSSryKTaOdvikF+Eq98lgOnEUiKC2
	 rhUIkOTsq+LItP2Q7Z5ai9MXnrnx+n7mfBt3EjioDF2GD1YuReMlsFUONNrslM5H9R4U/
	 aOuQPd3vZQHEggL6Hd4jr5fu5jq7LPU4TKSvJLtkL4mYtaI5MaPFWX7QuYlykSpp04FcY
	 W0/nIbsBbjRBrJqQ6VLWbpK9BmDE29BM6BBMMzFX8aB6T3TS8eIkJNpuGMfDKcShW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371694;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G+MaxjkUeidY4+zYblYhqCLTKks1mJPYKCMlazWE3VE=;
	b=uAAUo3dacTPvovkVvj9fixqH6jb4URr/Jw44myxnl0OIlkeiH9CGyEV3y3TxnsaY5fE6
	 Pz0YMFvd+b/IcWpWiBdqUYP2x0wBJ1poW3cnm1XanjcVStKS8GnRh0ejqk+xFOYbMVPlm
	 7L0qosYAftMYgmKRBB6Q+1ajTfnfDyrTFDAuueTcbVTcGiqs5sA5sfD9uNuMRQY52pAA2
	 l8V0+mUhvEdp6neAGuBPjQqMl8nwPrdv5vEdwAg2ydx5mNLPqRDwGP3FSZbde85/xqZp1
	 DehLaBllTCYyeb8223FeFmrQuAhpuxVs+WzPM7+aFx+HYvmOA0sNB+C77UDQfRl6Y9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QQOXJ5Ll;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994C2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 994C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QQOXJ5Ll
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E181D1595;
	Fri, 30 Oct 2026 07:48:09 -0700 (PDT)
Received: from e142607 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAD203F673;
	Fri, 30 Oct 2026 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793371693; bh=w1bVLEDs7iBLaqHNXLwl9XWIsA00y3UI/2zBxQ6OK5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QQOXJ5LlJkNTS1obVCzKVLhwcsgjYbJBIM8f/HPSn2jND4g/pJ6faTri5Z1DVUg0P
	 2WgGDd4s55HW1Zbia4U1THCgA1hxXoJMuEuT/973+ceI8dgjLuxQ+VCw7KVc55hGPd
	 ZB84Q5LterGQV5hHYZJs69mvEcbnbdJHyjO1oNU4=
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
Subject: [PATCH v2] drm/panthor: Add more reviewers
Date: Fri, 30 Oct 2026 14:48:05 +0000
Message-ID: <20261030144805.667158-1-liviu.dudau@arm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030144305.666845-1-liviu.dudau@arm.com>
References: <20261030144305.666845-1-liviu.dudau@arm.com>
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
v2: Forgot to add Chris Diamand to the list, fixed.
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 89ea35a35c680..ef92c462a8381 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2321,6 +2321,10 @@ ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>
 M:	Liviu Dudau <liviu.dudau@arm.com>
+R:	Akash Goel <akash.goel@arm.com>
+R:	Karunika Choo <karunika.choo@arm.com>
+R:	Lukas Zapolskas <lukas.zapolskas@arm.com>
+R:	Chris Diamand <chris.diamand@arm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.56.0

