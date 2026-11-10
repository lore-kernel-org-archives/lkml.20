Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297518;
	b=HR5lgDmI1eM7mPzsvNb4bE1OVpd6k7z4AhW6KcRtYr+JOg9EYfNAZNz28LSYhg579WMv
	 68YzQa9+0GS0QKH3z8ZDcWpWIey2IHSdc8Jd2tmPUXug7XWIGV8VUYlooB+fFesFVF+hs
	 B+WGWLUw09YD54Qz8UD9WowEXFg3m5z84gfVv2+XvxnJQueztFc/aJQk+sCErl7sQLChB
	 5kV48fNeWLwCi4uoGsMEfuE/WqyVNjln5bI7MryW+xOhjGyDAojJWzi+HPozVbdk2zdFl
	 lVSQ5AtOqJuUx51xK4oOyMx8H0O/6vtsIqgBZVpVBHiazOsLEIlhTMmD/z5m8wX517g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297518;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=08m/CEG1mSZXuOS69/J904h6YS+BrRhpMZj5iyz/fEQ=;
	b=0qLbIIAYKk7iGUzJZSCSgVucqKmGYt5N3RHZsI8u8bvCYCZGlbhgZywztrtrDC+Da9Sk
	 ICJbn1ilD2Rbr2dd99PGrPy9Rv2gGI18/vUqZgWjOaxV+fZWNHu2pjunsU5ee0zyNV1KT
	 7SOYXzMENlaSMFyf+Pw3srjRiYczaC9aoDnUG/CeC9pTUViZ8bKBEuuTNeaFixmwBsZIH
	 ou1pO3UMi+HnES+R6FT0zIr+y41OS9+F3TmRfnTInVg1edy3qhvnm/g/NeWuUNXeQmCVl
	 LkNloKCui6FhbgcaQSjIUoX2fZbn3hPMneWrByqSbVpW3u8odv/Jki7vtc84+hL4M+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V7ZqLlhK;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F229D606A332;
	Tue, 10 Nov 2026 07:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F229D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V7ZqLlhK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=V7ZqLlhKgrwwzfYJMEZyK+E44hMbH8hZF49acH7EXVRNNfJHC5tFkmo680hggBF1MZchsa7uMw5mZ
	 6Hm3B+MOQJI1b8fCV/N1qBBpb64WbsDG0d55/iO3ymb6PX/oNjFrsf6xzJabPzXQai1YBDJ86pGAeB
	 afJC8XXZTcCjcrA8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2cea8ff3-a83e9;
	Tue, 10 Nov 2026 15:58:36 +0800 (CST)
X-RM-TRANSID:2ee16af2cea8ff3-a83e9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acde1;
	Tue, 10 Nov 2026 15:58:35 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acde1
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/22] usb: image: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:15 +0000
Message-ID: <20261110075825.24946-13-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/image/mdc800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
index f7caa1c5cbb7..72cab4bfe01b 100644
--- a/drivers/usb/image/mdc800.c
+++ b/drivers/usb/image/mdc800.c
@@ -59,7 +59,7 @@
  * has been removed.
  *
  * version 0.6.0
- * Rewrite of this driver: The Emulation of the rs232 protocoll
+ * Rewrite of this driver: The Emulation of the rs232 protocol
  * has been removed from the driver. A special executeCommand function
  * for this driver is included to gphoto.
  * The driver supports two kind of communication to bulk endpoints.
-- 
2.53.0



