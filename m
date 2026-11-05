Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864874;
	b=ommUJ+F6haznB0a/R99BU9f6BzGJE6tG3eoxS3r5cffROTec5y9fLmQAPAbK136YmMPA
	 5ZBXTU3i/40gGpDB7MAjqyCPFfCQVT/dE9jbFtR5L6jlxJcs3cV7pDlHO+E3BXXHROjf6
	 nHp1ctPDpWouHT1D4BkUXICV4cMibFImiAFBF0cjPidv+XVOxyzbfOBUdF7gqwzmrSI3D
	 JFKSW/6K/A75glnCcq6twtdiaFaW8XOIXbh4zsnM0JiaDEvdTVKG/5WSnuUVueqM3kbLB
	 5EHyqn7S463WlW8o2qGN4/Lqn5MkrzG048beUx2XAIemQ7f6s+YBmkFHXbn4qTYp1+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864874;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DrbFdPeJVGFrc8E9XpDNvFLxAqYYBIIEWSforRQNQpY=;
	b=sAsBXn3+4khOj+AQjZY9l5evaPLxhHuaQptHZ5YCk0fp72SMsyo1d7wXHOx0Py/eGuC7
	 2W9MAZHEdX5IbGtEOyIz2/2bKZHNgsgG1gXmqMST9KwwnAyidjoDBXJLD6dir8MiJ0DLL
	 IT/1GV+vrqmP+AViL1JMJrWzyhhr+DywG1iHN1Uh1oGkpeEfro5fIyG7t3NCv30nR2sTl
	 qxKDwQ8xqRtsMAkzMeX5QjGmE9Giku8tMvj3qz0CPBbPOtB+uNztOzC1l/5Tvf2a+ghjq
	 xAcifbxY87ICdCG4fO/lL1LCyEFdpTjvAkwXm5YQL/H5ODX+DBvKzupyMYU0ci9mKOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="dm/gVz9N";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1390606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1390606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dm/gVz9N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dm/gVz9Nf120tAe8MlhWS5EjwwciKc2WiFf+0ZxgTAOI8ruwb6vnDkc0y45EJ9i2kaeBgayBx0luq
	 Xvw6CN7YpAeCcadCTiSPKWTlPCT0Q/JRLDNg8ieeKjZyqq+o0JknCSsOdUXymxaTN8hAxAPPJdmTZQ
	 JckOrFpMjiB8zpjI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26aec34a5098-e0a8b;
	Thu, 05 Nov 2026 15:47:50 +0800 (CST)
X-RM-TRANSID:2ee26aec34a5098-e0a8b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100250 (unknown[36.137.216.21])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56aec349f2f9-40b47;
	Thu, 05 Nov 2026 15:47:50 +0800 (CST)
X-RM-TRANSID:2ee56aec349f2f9-40b47
From: Gu Bin <gubin@cmss.chinamobile.com>
To: mst@redhat.com
Cc: jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/virtio/virtio_test: advance next_reset by reset_n, not completed
Date: Thu,  5 Nov 2026 15:47:40 +0800
Message-ID: <20261105074741.2177-1-gubin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

run_test() arms the next device reset with

	while (completed > next_reset)
		next_reset += completed;

next_reset starts at reset_n, but each rearm advances the threshold by
the absolute completion count instead of the configured interval, so
the reset cadence stretches after every reset: with reset_n == 16 the
resets fire at completions 17, 34, 68, 136, ... instead of every 16
completions, and only a handful of resets happen over the whole run.

Advance next_reset by reset_n so resets stay evenly spaced, matching
the --reset=<n> option meaning.

Fixes: 264ee5aa81ec ("tools/virtio: Add --reset")
Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
---
 tools/virtio/virtio_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
index 028f54e6854a..b8deca893f12 100644
--- a/tools/virtio/virtio_test.c
+++ b/tools/virtio/virtio_test.c
@@ -250,7 +250,7 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
 
 				started = completed;
 				while (completed > next_reset)
-					next_reset += completed;
+					next_reset += reset_n;
 			}
 		} while (r == 0);
 		if (completed == completed_before && started == started_before)
-- 
2.55.0.windows.3



