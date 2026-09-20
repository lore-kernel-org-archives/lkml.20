Received: from cvsmtppost15.nm.naver.com (cvsmtppost15.nm.naver.com [114.111.35.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027E261B71
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912097; cv=none; b=oWsOZOafqNyxjnkB3Q4FyAKpmbiKNtm77qcrHUW+9QuoEv32QUe12zWV5zlgm+4IXm/TN0wzQgk8Sk9vr07Kwx3I76mH25mQII3c+Bklnmy7juRH+bGDniSXP6g8PewTTe+AdKy4+1brfmdohH2hnN2mJ+Gztsa2lfNVFpCHegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912097; c=relaxed/simple;
	bh=VC8vbT+0cXzLFnKMo4KP/MJ2YIhtNWWmdyV0W6R6R7c=;
	h=Subject:From:Date:Message-ID:To:Cc:Content-Type:MIME-Version; b=YTikU511bBsugPZHDE4qt7r+vuHu2GdkdxPxaQYg6HYcBw11SDcFvQJ/N3ZZ8F6Ch+HA74w1OFz3m3BzcCsNnuclaAraq46SccNRvvGCV1k/sm8FBkC7OhE8/Ne2q7pq7neQI9aSg+m4GZ39eLO8ZtdWHRq1M5Lz3/qFHEWYqd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=iiridj/K; arc=none smtp.client-ip=114.111.35.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="iiridj/K"
Received: from cvsendbo012.nm ([10.112.24.38])
  by cvsmtppost15.nm.naver.com with ESMTP id e9ZraELSRPefb+DFw0se1g
  for <linux-kernel@vger.kernel.org>;
  Sun, 20 Sep 2026 13:38:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1789911485; bh=VC8vbT+0cXzLFnKMo4KP/MJ2YIhtNWWmdyV0W6R6R7c=;
	h=Subject:From:Date:Message-ID:To:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=iiridj/K53tV+WYMYnJ4tDXElZv1Fuf+TqxWn9tYUL3ffuRCjOOq8J1EdCoAF49Md
	 P40ouqT+jtfV7zn4MmR5m30+fylYmznO6JPSaZHHGGd9QOJFaq3m+3cv4WyO02iCB0
	 h9LeO8fld2vawiJ+Z03pWxxGoE15uSlRJR4QuufoUHDTyBQL+rOzAYyATodkRH386l
	 eci2l3XaL24jaT78Vx2EtFDqcfIC/0XA/m1wBg1JoKFVrliwsdVEpjGqDtRq71qyaI
	 Gv77AWJXdlPMh/45++rgwayKmtv7IRune1RxGo1vYFCbTssF+wWFAfavdRhvrcnBJO
	 RcE/Je8oGbaDg==
X-Session-ID: 3hEAEuWZRT2xq+O2HmgHSQ
X-Works-Send-Opt: 7mKqaBFdjHmwjApYKHmmKqKwKqbqFxvwjJIFjAJYKg==
X-Works-Smtp-Source: UdbXaAv/FqJZ+HmdaAgl+6E=
Received: from PC2. ([175.193.106.181])
  by cvnsmtp003.nm.naver.com with ESMTP id 3hEAEuWZRT2xq+O2HmgHSQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sun, 20 Sep 2026 13:38:04 -0000
Subject:
 [PATCH] staging: greybus: gbphy: use sysfs_emit() instead of sprintf()
From: ts930@naver.com
Date: Sun, 20 Sep 2026 22:38:02 +0900
Message-ID: <178991148260.29938.9272611738457436343@naver.com>
Reply-To: Park Tae-sun <ts930@dgu.ac.kr>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Park Tae-sun <ts930@dgu.ac.kr>

The sysfs documentation (Documentation/filesystems/sysfs.rst) recommends
using sysfs_emit() instead of sprintf() in sysfs show() callbacks.

Replace sprintf() with sysfs_emit() in the protocol_id_show() callback.

This follows the standard kernel practice and existing use of
sysfs_emit() in other Greybus sysfs show functions.

No functional change.

Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index bdb0f5164a6f..bb9a5b538e6e 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
-- 
2.43.0

