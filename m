Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DF3D47A5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031286; cv=none; b=YqonD4C/mPUL8p62rSHfF2shc4XSoikSNVw4podEcBAbCd7dyg2v/B2MN0v3XR0FSulrLOkDMPGl/DpF+FzkqFJQ1a5SLrisea2WkOhdgBAs8K2wxaYwl6YgQmlKoLQUkYap4lfgCk0j3dBKRMoNj1te+RWz3DqeTNglzowz8Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031286; c=relaxed/simple;
	bh=DvmUcdBGk9Ip3K6aMNLyTsmPzHjEV1WQkSgWvFOcyz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxrz/+1psH74vF0tjz2KvGibtIxYSMfquAK2mbOdl+jvVBZkJxd74lk8RtwLToFC+iqxTMT0OAkfIaiwbYUUlwLbdXflDcfAjSLE7D6W0E5d/j5zWWRd3UF9ndUYhsetB1Y4r+TVpp4nDNST6c4y8DMGJ7An54KS53pBvGQuE9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=bi3TzmHN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="bi3TzmHN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so59441a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792031282; x=1792636082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vTCBryNCZePgMXjmqfRG2WB7QhMRd9mrUtZ7pw310o=;
        b=bi3TzmHNDHqAsfTolKRCa/saVMatyHR75I3UASZeQCUjgSrrip24J0WKXsMznt7BGx
         /xZkhiDrLDn2vT5ufupCMxqewDS9Dr54xQS80JMPWkGQ3J718L1AwwCUnQSegeu6/ixg
         bV8298KvdA/P47SQ7AFPgGIBmkbJg2Nd6eFQ9af4pv6za6xWHcREdyopmqoqNdp0YcOF
         F5TiAA4RatvwLzXBiD2b8RQwcEfzOe8XjygSNwOkTvYpd8dyj99qTmDySTXY/uCD7oJA
         gkmRhyVZSV8A7KxaY4gKMng0DY6verCf4i9KQiDpzPXZCF5I9MZO3GgmhtQKx60zv0xo
         YCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031282; x=1792636082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vTCBryNCZePgMXjmqfRG2WB7QhMRd9mrUtZ7pw310o=;
        b=SkCb5lYL0malt3hStn8eLHOVTdUc1WKCuMRRFQMpF1KmO+4Z/fjmiGWzFqjT4XVsqi
         TAsNCv1jToxID6xK02M2i3umAXjUhkbI1Bu2g5T1fA/MgL0h+GNlvVrPlHX2AEDDrS+l
         bSc2BF8qvOQ5Qg+EOv4rUeX6QK4OsOEAigDfU+5pmcP8/dsCWkf3E8lEX0jvPbWxBBLD
         l0sO8bwe8FzGJedU2CbQVOnUTd869D796mEhknZUEbT8Yh5InEg+hoVR1OBk+eSctDOw
         lP+z6LO71IGRVFzAoR1m32mqKnnnbpIvzL554cESJF76/C2Y1epSkzDayzu5gu65YJdI
         9CdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjpqViANCN25Wxp0TMSM2ASAXOaeYOwHm+DULTXfjl/p18gmqGmpiNJLf8fTCOiZ8WL2sY7T8arRnhgVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE0PG3pJs2gtpcTTgPOAu9pfOX0zrRizHlD3C7kMqDMGU6icTO
	07zf54k8avAZAEMFkLgTbyY3Da4JS1HpnQarTSOiZr7a9EqDoRdbgrLt0yIgkSZ42z0=
X-Gm-Gg: AYBFou3AqNQm528jW17npRn29h97fe4FjTl2nFVRI5CHVft/rtfRLEZmZTH70O3M43F
	kct3HAOwlJSgsDxCGQbozzh6Isw3Dm2rFJLCFfFvdUGTYNmRQXqHNT1+99fWUGUoeuMXK4iLRub
	+zZgl7eyoJP5qCRnrxP5+ubUIg7bx8XJ42j75DVPGNR1U5qDlPBOjlSMT+uIF2NZ8wkTc1GpFkA
	itQSSj/EPqaBywOtKDEBfqvTyJ3cE2O2q9wybERoiA4LaSu/XDwKsn0kEx50Mkd+czhIw4ofr6f
	2N5myfs0NSxiGteAeRxa/JFgOWMMGRkE+LCZlJmoWRmfpn6lZ0YFkmgIQvU+pLFLH/casc7faMg
	jo+yMdMVv3qc+QmOLrVRGNuP4GVXjHiAU92MBGU/bJZlXcRGdxIb1RyFGHvRwY8WJTmW9mY5TN6
	bCVWoLSM3Pluxn1y7WKHHYe2xJyvYPIk+xAa6qqxvSaL/qT0ATuZB5Jo6bOzWSMUt7DvyoSuUm3
	iNU1A==
X-Received: by 2002:a17:90b:4e8b:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3abbe66dfa9mr7610333a91.32.1792031281033;
        Wed, 14 Oct 2026 19:28:01 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94375f3fsm1997383a91.4.2026.10.14.19.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:28:00 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v8 8/8] scsi: mvumi: stamp a consumed outbound list entry out of range
Date: Thu, 15 Oct 2026 11:27:28 +0900
Message-ID: <20261015022728.3936714-9-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
References: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_receive_ob_list_entry() copies a completion out of the outbound
list and then writes 0xff over the tag, so that the entry is rejected if
the firmware's copy pointer brings the driver back to it.  The comment
right above the checks says why that can happen: "Copy pointer may point
to entry in outbound list before entry has valid data".

Nothing ever compares a tag against 0xff.  The only test for a usable
entry is

	tag >= mhba->tag_pool.size

and tag_pool.size is mhba->max_io, which the firmware supplies in the u16
max_io_support.  As soon as the firmware asks for more than 255 commands,
0xff is a tag in range and tag_cmd[255] can hold a live command, so a
stale consumed entry is no longer turned away by its tag.

What happens next depends on the controller.  Where request_id_enabled is
set, mvumi_check_ob_frame() still compares the request_id left in the
entry and rejects the frame.  Where it is not set, and the MV9580 case in
mvumi_init_fw() never sets it, that comparison is skipped, so the entry
passes, is copied, and completes whichever command owns tag 255 with the
bytes of an older completion.

The tag field is a u16 and tag_pool.size is an unsigned short, so 0xffff
is >= every value the bound can take and is never a valid tag.  Stamp
that instead.  The store is the same width it was.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 2 +-
 drivers/scsi/mvumi.h | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index bd1a8c1d54aeb..67a6bb6536950 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -571,7 +571,7 @@ static void mvumi_receive_ob_list_entry(struct mvumi_hba *mhba)
 		}
 
 		memcpy(ob_data->data, p_outb_frame, mhba->ob_max_size);
-		p_outb_frame->tag = 0xff;
+		p_outb_frame->tag = MVUMI_TAG_CONSUMED;
 
 		list_add_tail(&ob_data->list, &mhba->free_ob_list);
 	}
diff --git a/drivers/scsi/mvumi.h b/drivers/scsi/mvumi.h
index d20eea2b61a31..f69a0807100c3 100644
--- a/drivers/scsi/mvumi.h
+++ b/drivers/scsi/mvumi.h
@@ -133,6 +133,12 @@ enum {
  */
 #define MVUMI_MAX_TARGET_ID		255
 
+/*
+ * Stamped into a consumed outbound list entry.  A valid tag is below
+ * tag_pool.size, which is a u16, so the largest u16 is never one.
+ */
+#define MVUMI_TAG_CONSUMED		0xffff
+
 #define DEVICE_OFFLINE	0
 #define DEVICE_ONLINE	1
 
-- 
2.43.0

