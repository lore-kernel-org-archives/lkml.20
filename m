Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A52DC783
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909164; cv=none; b=pFRW+MCQFyJ1ZcPKSD2Y6pdTxSvhbqPkrPtJPwNf7ar1DF3wr5V7+Hb6uDS1ejvOPUQogUA31RZSPv4HsjNiYOnrrpAgw1F5V4SUFa+ZoPhpXj3k/h13AEcm+QOligESXpp8riHHahPhbZ4l2XA5KL3+GqPATG6frbDGszjGp3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909164; c=relaxed/simple;
	bh=gHyuTJBcj3JsVOHuWe2Rfl3/wHtTTjRex8n+B8Tm2tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGIFUPKs8ELUcc6jUxQfHvDMD6nfdqAmXp+zsgCUBCIvRlVsXO1RDqU726Etm9URCLATTAk2OFM97nrOfbqP6f1OC/3vCqkX8WsP5N5CKVUHv5EsQCCh+EJovxDT5tnLwLfASZmnJ9VnG2BEUfWXTch5ZUIuIjBBJu4LbGwMb6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=rbFiU43v; arc=none smtp.client-ip=202.108.3.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="rbFiU43v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787909160;
	bh=CUxPlgVv+pGO0+wljBo10WfovuFcLtX4MDPBszy+M10=;
	h=From:Subject:Date:Message-ID;
	b=rbFiU43v93DAw13QwC9awN0lCyyzVKD3Oqu887mGfhhd9atrq3JaVEqCnhrUKiviZ
	 +4sA/S+994YqVjqQ2YvsEQHg+w6UezmtPDpl2/TAC9W7HBfbTZeYvBb+9VmmnogYrk
	 Bhe6xZyW4DsuTaKV175vS44Wn3pG5w89BRwP5c6k=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6A91541500007FFD; Fri, 28 Aug 2026 17:25:49 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8249756816501
X-SMAIL-UIID: 7713830CF74D424F9352C4691841051B-20260828-172549-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] general protection fault in _wait_barrier
Date: Fri, 28 Aug 2026 17:25:41 +0800
Message-ID: <20260828092541.236885-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a908777.1d9ded08.62e62.00da.GAE@google.com>
References: <6a908777.1d9ded08.62e62.00da.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 818bebeb63dd

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..8676b3bc463b 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1692,11 +1692,34 @@ static bool raid1_make_request(struct mddev *mddev, struct bio *bio)
 	if (bio_data_dir(bio) == READ)
 		raid1_read_request(mddev, bio, sectors, NULL);
 	else {
+		int err;
+
 		md_write_start(mddev, bio);
-		if (!raid1_write_request(mddev, bio, sectors))
+		err = mddev_lock(mddev);
+
+		if (err < 0) {
+			md_write_end(mddev);
+			goto done;
+		}
+
+		if (!mddev->private) {
+			mddev_unlock(mddev);
+			md_write_end(mddev);
+			goto done;
+		}
+
+		err = raid1_write_request(mddev, bio, sectors);
+		mddev_unlock(mddev);
+
+		if (!err)
 			md_write_end(mddev);
 	}
+out:
 	return true;
+done:
+	bio->bi_status = BLK_STS_OFFLINE;
+	bio_endio(bio);
+	goto out;
 }
 
 static void raid1_status(struct seq_file *seq, struct mddev *mddev)
