Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC51437451
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256896; cv=none; b=ARKsAW8GnC/wNSEMCObQqQn2VEBuV02o8ZshpkM9J97x9kJO0Iqpi57Gkk0lShEXl8G2wukUW1hh1BpFJtkExO+xoC9OBZJjPd+QAtz1KwKJO8HcGgoIr0t2EmVbkb6X17iJPm0GKXiHLusUD+xW06bQHncpMSyUrWf6z3o4S7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256896; c=relaxed/simple;
	bh=Zw0pIP5eSJI28ZqgOlOYqy4ScF2vOQAnlGs6UoZ0oSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EKeQdKs+U9OymXQKTwQ9qrWb3ls0yjxI586WHXIeC9nXXQ8QKMdt20afsgYbFC4Z4kpWdJTfa9py8DjwU9LI09zmsS0v/7myXOC35DwrG7C5YW8zUq0+OCJrOm2wqxyPomKsBm+AbM9rPoWiTbmpXYs+3IZzUCGnCkzwoI2DZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZB4v8vx9; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZB4v8vx9"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso1099343b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790256879; x=1790861679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOCGbQf6XP96p7s0OjDQYdkOZWkG2NUg2kYXrHgNtio=;
        b=ZB4v8vx9T5Ii0v14xNQJRScTrcNU9LVmZ0nw6SPPjOVeoti7wLSSwUAVTTzlE+Ds0j
         W1B6bPIpTw9gwbXk5IXO1TYW7FkufQpfMeeugX5AXc+lvJnMadq0Jp1LoRqmoXhUkkMh
         CguJyjIb86z6F5SpgL1+OHdcYXAYNQSNunHeStRoNZFoiwqXCON+/u9acwcOSfTFQA2T
         ik8wgcoDHGEjUixaY6aGHTXzUVryzdnD/gtQM+YgCkeN0GicqMnxzYVVl36tUE0SFuME
         TNh36Hu+C6tvjFVQh15p5EsJcCXw8Fwxnt8R+rUq4EBHAf3ZoHD+HHogoL9txBITgep+
         KMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256879; x=1790861679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOCGbQf6XP96p7s0OjDQYdkOZWkG2NUg2kYXrHgNtio=;
        b=k+08ADxvC/hLJCARynU2ceQ+G0WFCYsSXvQnoxstiycnvojFoREpX3O5LbGKjZ0BM8
         Berh/InPQP37vJLKsKgV3UTZ9Tv0c8pryg22BRZzibjBQldtY+llKROJUx8gHVw1mu6w
         vPr7gbxxRMB6JmpHPkfTvFJoJ6WEb0PVKqm6DFAF4wJjP9zMql9ocIVMMDHzH2da824/
         1gi6LZQMYVgdJ/al4pmv3jtLmyVEyyX+rpYnJBclTscjKl6po3hWX8fkXeRwjpRclwDL
         kUy2edySlmpGtL4BySMlUJA1SW/tzruM9ybHfh9FiIZtAz2xlor+agpMieD6Weq9fpl6
         zrng==
X-Forwarded-Encrypted: i=1; AKwUvBxrVdiYGpKdb3Sbgo7aowzaJSsvaHuzX0Tymvd5f7JUODpLsQQXW0bKrvZQlLEBYL7zFeKReZ83Vyw/xXs=@vger.kernel.org
X-Gm-Message-State: AFuF++lPk2BKLmoEHBojw9Jbcw3FmoGhh4tLQ4hCpoCNaMAu9ZcfXWC7
	q6QzBcx/WkY2U7I+HXWXc6xww/XZ59MXsAs31h+gHsiLIDXi8rGE0f7f
X-Gm-Gg: AYBFou2P9iSeXsDQspuo2go5d7V/oxu5Y9TzkZ76oy46DQ2U5nRJX0xCszKNTWaXGh2
	F6B+Vlk3fLF1VBBywbfN/xsDyWqjHW4NJ08cid9P58EMnCSyQIxpGtbGvZE6jMxOX7d3kdWtyLU
	FFPWvrT5QTIcc2gZEg28DEEA2uNkwf5MExyxuLcw81ievLq1gkKXgKZVKoIzDJMp3GIg8fhMTCg
	yl9f4FktkqGo7phhotAsImyGPHO3WkOo7EpPSbH4KfKXgEkxYohGbRKS06rTuU8R/1Dr3YjL1Wu
	ItRAMXIdWDi1+3a7dSVeDWDeGz75f4ujbrtGyrHXM3s8+db/k0/5FgF5PjFa+rOOq0upWQFasy8
	ZUR/IYBWDCpZI9mmi0MgHnWpFyE0GnO0r8R8+AgTJZ6ZkZ99Zd8Le5razBTxg4bXAFA5QPSXHyE
	Ys59ZSP7O3yTDTW6mVm61K1PNgkThLS4lTu0THdNIac02Vmk8jCNmE1g==
X-Received: by 2002:a05:6a00:1302:b0:878:3783:8a4e with SMTP id d2e1a72fcca58-87e9be76a5amr2245806b3a.54.1790256878537;
        Thu, 24 Sep 2026 06:34:38 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fbbsm3024366b3a.52.2026.09.24.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:34:38 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <James.Bottomley@suse.de>,
	Joe Eykholt <jeykholt@cisco.com>,
	Robert Love <robert.w.love@intel.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] scsi: libfc: fix directory server rport memory leak
Date: Thu, 24 Sep 2026 21:34:29 +0800
Message-ID: <20260924133429.1587511-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fc_rport_create() does not add FC_FID_DIR_SERV rports to
lport->disc.rports. If fc_frame_alloc() fails in
fc_rport_recv_plogi_req() after creating a directory server rport, its
initial reference is not released through the normal rport teardown
path.

Normal rports are added to lport->disc.rports and removed from the list
before their initial reference is dropped. The directory server rport
bypasses both operations.

Add directory server rports to lport->disc.rports and use the existing
list removal path when they are deleted. Keep the existing directory
server callback and retry behavior unchanged.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 3ac6f98f4113 ("[SCSI] libfc: correctly handle incoming PLOGI request.")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Add directory server rports to the discovery rport list and use the
    existing teardown path, as suggested by Hannes Reinecke.
  - Preserve the existing LLDD callback and retry behavior for directory
    server rports.

 drivers/scsi/libfc/fc_rport.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/libfc/fc_rport.c b/drivers/scsi/libfc/fc_rport.c
index c25979d96808..eac3fde1246a 100644
--- a/drivers/scsi/libfc/fc_rport.c
+++ b/drivers/scsi/libfc/fc_rport.c
@@ -160,10 +160,9 @@ struct fc_rport_priv *fc_rport_create(struct fc_lport *lport, u32 port_id)
 	rdata->maxframe_size = FC_MIN_MAX_PAYLOAD;
 	INIT_DELAYED_WORK(&rdata->retry_work, fc_rport_timeout);
 	INIT_WORK(&rdata->event_work, fc_rport_work);
-	if (port_id != FC_FID_DIR_SERV) {
+	if (port_id != FC_FID_DIR_SERV)
 		rdata->lld_event_callback = lport->tt.rport_event_callback;
-		list_add_rcu(&rdata->peers, &lport->disc.rports);
-	}
+	list_add_rcu(&rdata->peers, &lport->disc.rports);
 	return rdata;
 }
 EXPORT_SYMBOL(fc_rport_create);
@@ -363,11 +362,8 @@ static void fc_rport_work(struct work_struct *work)
 
 		mutex_lock(&rdata->rp_mutex);
 		if (rdata->rp_state == RPORT_ST_DELETE) {
-			if (port_id == FC_FID_DIR_SERV) {
-				rdata->event = RPORT_EV_NONE;
-				mutex_unlock(&rdata->rp_mutex);
-				kref_put(&rdata->kref, fc_rport_destroy);
-			} else if ((rdata->flags & FC_RP_STARTED) &&
+			if (port_id != FC_FID_DIR_SERV &&
+			    (rdata->flags & FC_RP_STARTED) &&
 				   rdata->major_retries <
 				   lport->max_rport_retry_count) {
 				rdata->major_retries++;
-- 
2.43.0

