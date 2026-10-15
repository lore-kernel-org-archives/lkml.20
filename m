Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F414C33D8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052396; cv=none; b=Zt1Ys9qxyG7cWDAgfnV5cjJP5kgwqsM2LSM3oFDqihDkOPmBsxwOIePfVD7fyPmZ0pY8zaCY3PkxL56ZTxRtALb715WY2PfDBn5opt9uqTWD2L3VwO/0a6wu2pLbe/yKp+ZFelPkQCZ0QQ6JA8a7iGsNjt+koWI2cXSyB9/dFRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052396; c=relaxed/simple;
	bh=55fngw8U7i276yUTXQntdbIZF4Wd6ep68zhxSVkxCO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrepwMohE/E29NiHtH6OiLk5/Mzv5xEvHrROEwDOfHfio1Oug02AmkSJEd0kbMSQ/AH8oBTJZbhsEcrQh7tThl+SI9LJjDM6z1T9nHk4yGQK6NXCrZdcOeVveS5zmIH+qjrYVKWzoRcgaiiLb2DyEMi9O4LQxzMFOr8SeDqplTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Q1kWCDh2; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Q1kWCDh2"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso951501a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792052391; x=1792657191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6VprNe7yjepyKxDyWl/GS5n+61wlhCAhAo3qvs5zaA=;
        b=Q1kWCDh27bUa03NhPCldjuS+wzOaEOIz1HLSErnfDS93x7VJqbS7EJh5vx6dtqe+UD
         RElTfA22CZ1s+/2nThKkzqhOQFI3YDxlqfRHmKxtT3+BVoQ/q7Y0Hl/lvd1xPkCD43XH
         Jzi6fZdAdXt4vgj+IxaFOCthiB648HDmx9KDRKJqCAyNPQ4gNy+9TS05qFFSPO+4pEi6
         /ob4e9rv6jle7QPo2MvGgbYzOyQRMqC7LK0JcaUTCf/+truXmFC9VLkJGnl3l2Q3jd2P
         QP4N6JE5mrR0TMqrXYka6KKsh01pqEFsexJ8ag00KiYMIwUS7GbDjMooGIx9il6YaUyN
         2csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052391; x=1792657191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6VprNe7yjepyKxDyWl/GS5n+61wlhCAhAo3qvs5zaA=;
        b=iVc563lsEnFj3gRTB7TlwEVqkU/HDOqJdqiVA+fj5weyQXSgxx73QouGBldA6FxEaL
         iizvw/BAdBM57OHyiW6seOfmrQUX5myOCk+U2nQ3T3qad+oMycqR+2FKCx7xG/9SwR+l
         c6oisjaC4Hb/NEVBLYvEP/JeVgGqVZ65CuA2ZvWbc/ZkH8XvxH/oO2phYrZ43cpcEkkg
         Rf+VfMspAUa6T8dFTYw+wHE4MguHjBV5mCiRX0h77j06hztX9cjPncbpAgiC8C2+cwXj
         caloC/dgv3I+BnoQ0RHkaITic6pyE7ubpkuzxZKIdApLpQdMyjVN9kYmFa5b5Zq/xxHN
         hkmw==
X-Forwarded-Encrypted: i=1; AKwUvBxbtAFcVDOhJnRjJB7j/ce9e9LpOn6XaZTOPL9fRXB6u7PqFeLxSGUD8M6JnUFYdaR1LB2A5xBuPAEvWBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfway7AHrAL+JES0ebbgbU8/4U0Z1QI8U2we1Wl4rgn7h8QAbK
	dT0zBwd4bNn3/HD82aC+f/DcCqMzRCukm+4pBv91KQbCqucfcNrfTqIyDIhoxLWD0oc=
X-Gm-Gg: AYBFou1CrHW4r5+bc2ITJjYP+uVQ7E+7Lhpr3wmiklzhQGMfcnwrfwuhHFRKj7cVsLR
	ry60QCo86sUU5oHso0l260SErhHP+yw/GvHwUpeA2cVjhYql31En5jLLc78DQ0Sb253oGOMAtc9
	bEvx/oT3ShdEqmEgPHNqnfk44xwkCSw/j7ig7fjM8AnPv9A6TnC8OU/B8VnpL7Pku83sXmUSTv1
	OGiuy8F2GNIqz0Weyb/ej5ytip+vYrabXDuPHnYUZPDEwGVZjhZ9VWP+w+jhGvzCRjHWsqUnmVA
	dQsHSkZiL2SncYYiKn8cjVm62Vyi99UN8mJOYTBF8843F/p2ePRd7DxSjEtFI1gRv2k8ycrht7j
	12LHRPT+BufKOrErv0/511gHXUQcwW+u+AHKnLr1m6Vk/Oe5tsqtXgcbjBXoKpyuM3D23xmSLpz
	HCjCX5HUsLT71OBZ+F1Uj/tqQECwnwgymmIzbaB6zMynPDnp5xHPiXbYqBIESB93elwthc0SNkH
	5FLyw==
X-Received: by 2002:a17:90b:1b06:b0:3ac:adce:60b2 with SMTP id 98e67ed59e1d1-3acadce66cfmr116114a91.2.1792052390946;
        Thu, 15 Oct 2026 01:19:50 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e755bsm3319784a91.2.2026.10.15.01.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:19:48 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 1/5] scsi: aic94xx: bail out of escb_tasklet_complete() on a bad EDB index
Date: Thu, 15 Oct 2026 17:19:30 +0900
Message-ID: <20261015081935.4168771-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015081935.4168771-1-yhlee@isslab.korea.ac.kr>
References: <20261015081935.4168771-1-yhlee@isslab.korea.ac.kr>
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

