Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C24756CA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049195; cv=none; b=rqiBpDj2OV1dgZaQMxh4VzAZmERdf/ayct7bMhYrgMptASjPDrOqG9eoW6BimhPeizF+nyCkIl5oBZDZg24f46jHH1ymfmAsXbV4IfZyAJMEJVw+EGI/W6+aqeyvjoI3xPFQPrwRoiWbvdWylXU35apq3TUaaHnGhUMw/3DSo0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049195; c=relaxed/simple;
	bh=55fngw8U7i276yUTXQntdbIZF4Wd6ep68zhxSVkxCO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWZIWORBCkn1AlylpwgTaz0368nVDu5UB9Gd9sAaDyJ8N4ynkZnVJW7c9DROyEkAoPhxM6wu9VqJ73Q0n+EaYsfqrDvvbgQFeGVb53KG0jGbJaHb09ROfCNJd6rRWRHFi87/BWG4HY6Zudu2WxRK1c1hF0QxwXUBEYL0i2e+xWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=GJI3uEIH; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="GJI3uEIH"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso870406a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792049186; x=1792653986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6VprNe7yjepyKxDyWl/GS5n+61wlhCAhAo3qvs5zaA=;
        b=GJI3uEIHj20+6V+mGjtCAY8MK4iFB8mWOlPqtEMJS/ilIx/Tpk8bb7cAMCW+Qgmns7
         I+faRk1YMn3Bygc+hMZTQGFdp7s7mk0jKWXTiF3ANdHFnDeBjrfmzNMvhKyvaeaK+2h2
         RKVFjTkXPMLzFovHLSePSyMgebS7a5XF1bsDjCBFjW7Q+g8PzxJjwMiZCWBn9f7QcGw7
         +IJUicSt9v3h4Dgba5PqLZYvWMiDxRkJ4ALUdc7Ef3Il3BrlDayMIPbhKPnDVoLrXrT4
         f6R+EkNN8vH0vQMxCFzxaUfS2d/ltBca12OgDFtmlg8D7GJwKCfmEgu5mmbZ7ioRWjOz
         LPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049186; x=1792653986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6VprNe7yjepyKxDyWl/GS5n+61wlhCAhAo3qvs5zaA=;
        b=es84Cyk6aYkyvT6mNr0P58+5b83aOsIj2+IHh9lOhEFTrT6rXi3faW8krnGuyKGKMv
         XY3v426tzoPwd9rnr3/rHph/28Ni4GKPvPVxaQJYweNMMjYzHGN1Ue351MVpAcSkfotx
         TYdgB509OYhuHcsWDHz57hCNsTUqOvxbpGu+SwZrc2aoMBn+IGkJiiSBtSXs8j7QqhZ1
         fKwb9CPYVkxJjxKFbEnfNpKR9e1LQNf9ya2AZdS5+qY0k08yJrhXKo0scWTzhvDZCXAz
         lNEBMsSPKwOCPSuF6bwtvtQhxbvtKBH2o7A4nliRhEOe2C7bCoKHyfGiYtF49UJ8WY/X
         ZoiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzScybVZfaQnoikyNDOiU5JP1hCu4mtaDMEkcAoUGLnAFvjbfd8l87cRTlLzA9WpC1s3Wji81MDu2+c0xM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcwZMOCdLNsrDYWz49aIWwI85skK4Dmd3WfWkLbOYaiWQWSTPf
	A6iiafTB2pQsrdP+sutBRvSkwCmuu+0MYbyJLZlVxWbzegBj8jBGZjiyyJAot3zCMsw=
X-Gm-Gg: AYBFou14EfdY0xFLCfqCigxD8e0dUGUOD8/6b3dEUUVdk7/2fjzyXQCwh/g16Wpcvex
	pzII/dlX2EbbJnIz5dMiUp+7P+xBMs5BAfOhmpIoi4WuemTeqHpM98qvRPUu/0VVaG0W7LYKw73
	1KbLls5xlbmjUWiZfXsfenfPJvC5sgyPtcSehrWLv0iQkQb1CCMLE3O/nIzrH7pcuTRYJvuUI1Q
	Lfb1GNb0QFlMQJLUzxVl25ibV/uu+BlgGabV+HdZxQ/DkFegirZ0X8x7opUZ5SamC/B/ZhTx7SW
	k2VWXuIlAzXK6x6cBQSwLPw6Z8PB+VI5PnJJD/giMBM+pOGt7iszCohSjavnIrFSWAczyrjPOG0
	DPnKuZNhrud3Mb1cvYXYlIM1ahTDYLZmTWVymvs+DqH6YAm+vxe45GIF7ruZozSsa1iI2JrdzO6
	XukacvHdpFofFkCD5ivBgOY/eJdfkljS27KVDQbkLCK+E6aXxbY+Lcjc8t/Qdqw17ZKEmWJh4ah
	XVKuA==
X-Received: by 2002:a17:90b:2d86:b0:39e:359f:8539 with SMTP id 98e67ed59e1d1-3ab3a90b5f4mr13828970a91.15.1792049185606;
        Thu, 15 Oct 2026 00:26:25 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac937c4e7asm1754279a91.3.2026.10.15.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:26:25 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 1/3] scsi: aic94xx: bail out of escb_tasklet_complete() on a bad EDB index
Date: Thu, 15 Oct 2026 16:26:10 +0900
Message-ID: <20261015072612.4144043-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015072612.4144043-1-yhlee@isslab.korea.ac.kr>
References: <20261015072612.4144043-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

escb_tasklet_complete() derives the empty data buffer index from the done
list opcode the sequencer wrote:

	int edb = (dl->opcode & DL_PHY_MASK) - 1; /* [0xc1,0xc7] -> [0,6] */

DL_PHY_MASK is 7, so the subtraction yields -1 through 6, and the
function already says that anything outside [0,6] is wrong:

	if (edb > 6 || edb < 0) {
		ASD_DPRINTK("edb is 0x%x! dl->opcode is 0x%x\n", ...);
		...
	}

The block reports the problem and then falls through to let it happen.
edb is used twice afterwards: asd_bytes_dmaed_tasklet() adds
ascb->edb_index to it to index seq->edb_arr[], and the out: label at the
end of the function hands the same value to asd_invalidate_edb(), which
indexes both escb->eb[] and seq->edb_arr[]. asd_assign_edbs2escbs() gives
the first ESCB edb_index 0, so for that one edb == -1 reads
seq->edb_arr[-1], one pointer before the array, and dereferences whatever
it finds.

Finish the check the way it reads: return instead of falling through.

Whether the sequencer can really report an opcode that makes this zero is
not something the tree answers. It is firmware loaded with
request_firmware(), the done list opcode is described only by the comment
above, and there is no Documentation/ file and no MAINTAINERS entry for
this driver. This is not a claim of a reachable out-of-bounds access,
only that the driver goes on to index an array with a value it has just
decided is invalid. The intent to bound what the sequencer supplies is
already in the same file, in asd_bytes_dmaed_tasklet():

	size = min(size, (u16) sizeof(phy->frame_rcvd));

which clamps a device-supplied length a few lines after indexing
seq->edb_arr[] with a device-supplied index and no bound.

One consequence worth naming: an ESCB dropped this way is not invalidated
and so is not reposted to the sequencer, because the repost happens
inside asd_invalidate_edb(). That takes one empty buffer out of
circulation per malformed opcode. It is the lesser of the two, and
recovering the ESCB instead would mean choosing some other buffer to
invalidate, which this index cannot tell us.

Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/aic94xx/aic94xx_scb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/aic94xx/aic94xx_scb.c b/drivers/scsi/aic94xx/aic94xx_scb.c
index 08c8dad9ad621..d050e5325b943 100644
--- a/drivers/scsi/aic94xx/aic94xx_scb.c
+++ b/drivers/scsi/aic94xx/aic94xx_scb.c
@@ -421,6 +421,7 @@ static void escb_tasklet_complete(struct asd_ascb *ascb,
 			    le64_to_cpu(ascb->scb->header.next_scb),
 			    le16_to_cpu(ascb->scb->header.index),
 			    ascb->scb->header.opcode);
+		return;
 	}
 
 	/* Catch these before we mask off the sb_opcode bits */
-- 
2.43.0

