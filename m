Received: from cvsmtppost23.nm.naver.com (cvsmtppost23.nm.naver.com [114.111.35.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAC3264C8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912703; cv=none; b=L2npnlt27WM3V9gYC+QZcd81MVrujzy2kR0Ae9JopO7OT6MDT1vGQQ8g7tvhIQu/nx/OhnmE1SAmuA8tj0w0jaA8QGvsX5E4MA9jYI6uTwbhoYSK00zOYHec16nkM7XjzgsbuVHF2biAmIg18pMMLhAQP1f+uYTbDoEZMGXzRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912703; c=relaxed/simple;
	bh=LJ6eEu31p7j1K8Wt9JFqtrb7eCGng0uHMbHr+GnZ8G8=;
	h=Subject:From:Date:Message-ID:To:Cc:Content-Type:MIME-Version; b=qOGPpg0bUd96IkIIN94rZsFP/ztKEJH5sLveB3lnowpC2u50dNoIMlDaG5+2gUQMAu2ej43pAX/e4N2CRX6EDi4wTCNXc0E87SfgRWswQZlVS7ePF4e7xYfFSNQPSxZH18jhIZOQS8pAHKpnQzz4pju2GGTAit9vs1Gx7nplY4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=tHsikILS; arc=none smtp.client-ip=114.111.35.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="tHsikILS"
Received: from cvsendbo009.nm ([10.112.18.55])
  by cvsmtppost23.nm.naver.com with ESMTP id P6biQiPnR-ihHxDK-iaHvQ
  for <linux-kernel@vger.kernel.org>;
  Sun, 20 Sep 2026 13:38:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1789911485; bh=LJ6eEu31p7j1K8Wt9JFqtrb7eCGng0uHMbHr+GnZ8G8=;
	h=Subject:From:Date:Message-ID:To:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=tHsikILSgzjKYEH6Tiyi3GV3RvJELs5IEmMYK9KVEBSsv5wflOinWvpzE9NIzhHjh
	 H2cxW1WdYZc5ZYEDRknNuZptLbYQdBfCbh0PLAGSEEyAPbcaaNWG0xYo6h8Npv+h4b
	 ET4l063BvPiLpcmqk6Y4MMBN+TFSW/NdDRJv8KB7P5EolXyi8f6EOhyxe+zTawf0pN
	 cfmg4aPKo+uWLt0h+73M2duvdzseHIwxd656bzJSpmScBgdHVT5r6k41p2SYv6pB1P
	 i2xNt6ydQLHXtHJeNa7EWXS8nqhQJQTAYKtnDqdb3qHTUIM//Yvj/e5x0ja7T1kTKf
	 NSYbDw78T9xwg==
X-Session-ID: JjO9X7IzSwigMDTZBvpPVQ
X-Works-Send-Opt: 7mbqaBFdjHmwjA+YKHmmKqKwKqbqFxvwjJIFjAJYKg==
X-Works-Smtp-Source: UdnXaAv/FqJZ+Hm9aAgl+6E=
Received: from PC2. ([175.193.106.181])
  by cvnsmtp003.nm.naver.com with ESMTP id JjO9X7IzSwigMDTZBvpPVQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sun, 20 Sep 2026 13:38:05 -0000
Subject:
 [PATCH] staging: greybus: light: use sysfs_emit() instead of sprintf()
From: ts930@naver.com
Date: Sun, 20 Sep 2026 22:38:03 +0900
Message-ID: <178991148304.29938.6850889942806082479@naver.com>
Reply-To: Park Tae-sun <ts930@dgu.ac.kr>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Park Tae-sun <ts930@dgu.ac.kr>

The sysfs documentation (Documentation/filesystems/sysfs.rst) recommends
using sysfs_emit() instead of sprintf() in sysfs show() callbacks.

Replace the remaining sprintf() calls in the fade_##__dir##_show()
macro and color_show() callback with sysfs_emit().

This follows the standard kernel practice and existing use of
sysfs_emit() in other Greybus sysfs show functions.

No functional change.

Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..2689f9a7524a 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev =3D dev_get_drvdata(dev);		\
 	struct gb_channel *channel =3D get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct devi=
ce_attribute *attr,
 	struct led_classdev *cdev =3D dev_get_drvdata(dev);
 	struct gb_channel *channel =3D get_channel_from_cdev(cdev);
=20
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
=20
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
--=20
2.43.0

