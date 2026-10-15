Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1074EF15E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055887; cv=none; b=c1ZQHkrts8KG2bPEF3bBnREjfQs3hziQHYrJ+8wfEck/rT420wafjH+7Oi3mQ4Psc7EbM6V5N5NEQnWjKc7hkj4XWqt15eYo5jWbULJFv0JucCdFoea3eq7je3CsBPZ20TGD2S+wi/gbgueGtst71WHRTj+GxZsoMH2vbLRMgig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055887; c=relaxed/simple;
	bh=uslEExDEGp6pVGpAloBoNX7J+MmR0/ayHNO1yyTZjEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5hV61lk3qLXACPkJqM5ksgXl7AIifCzrse8+AbJ3LFZOy03CKnGduzeayyB/PAkaRXPOcTctSutrx+VuU28vsiUc+fhKHHKHVKbizTz2bUrFLQ7gqBVKWD9ZybuuwbWuLmKZA60Zvi+v9I8ocgtlNQ4aDpoB+9nkYLW2kS20QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=aWeBxTwP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="aWeBxTwP"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd3310348d2so3340093a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792055886; x=1792660686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2BxYeiKObMcw2aJTTx5HIivwKcuO9GkYsdXsOu0i4Q=;
        b=aWeBxTwPWSvCnU32O341XA2boGM4xzaEyxbl7YulZLXaAUO5FfteoakLsepKyKee6r
         2q553ZRlorF6TPCT3nLHTcEn0xkQDimNrCbdJhJKYZ4/VdgNlzk6gfmqOjT2wwOrd0Af
         un8w5K3qAwo+lgT5Yjrg0mNIN9MU3n3OhU6aNLHHudIoWl2QqtURw9GYcng4Izk9b8+c
         XhTJ7KKrsSfUwtOfNJqpef4o+u73i22uLxMKk67jkkGXLUBMN//UptGr4UWK4UU7KUJ/
         vpKLuqc8AAEn+8SnmN7wwashKVR5hfANMWPTa77vdQbBCW4wzGkJAOYLGaR6sUooK8Te
         86gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055886; x=1792660686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2BxYeiKObMcw2aJTTx5HIivwKcuO9GkYsdXsOu0i4Q=;
        b=teszbc3woiYHSlGmQOHfS+hNfh8ZG8ly7u9KbAzMln91aAZPZbf1WR9CDSyrUSifYR
         QO0Ff9pc32jH4y+AzOmBC1r7jkmPwdSueikUwldMvIua07l8DxvUxoVC3m5S+TvlT7K1
         XOrnn8SkdP2dwREcJowNP+BS29Aeg4VXZQkVRuFLKix6mQMt/voofB2gSX9Ydi/yFbOX
         XREEN9+1mv0QFwRTep2dwvFCaXAHrRR6PhAsJ3fsz4BTxd79lDvEs2Ghz6qZmgdRVxnO
         o8amDiAsQwki2Lnb0J2LSXqD9SIZ44Ja0abd/G19oXzzbQQYKFfMiu+iU1yeNv6BKIpb
         LuMA==
X-Forwarded-Encrypted: i=1; AKwUvBxczANeWFavfo7mf2EZAAeN1KeB1n0v/UMxcr895XLZ+UhNFrAJHZP/iyMyz/bY+1vAh8moZkrKPZYuJOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLML/6aLbKV+hBEf7Ld04DRQO1+b7U7hI2x4inEiNMBzkPu2PrO
	5QY6/a9Aegt0gmK04Fmx1KAl2QMVhQMRWqzwLelCkkS9eMv7K9S6X7l3z0I2a02D+Ls=
X-Gm-Gg: AYBFou0n0XOzUVheZGjdxwtNaw3XfOOzuWdxFClXyGXuUZG9lPyvjgpQqZcfaWm9uEU
	+WyooWiQVkWULLI81nK+N9idyoUDDYHTspvTMfuXlYgBAgcXLdYU8HyFjc0Ff/xg2XFJIRyi8Wi
	J1dGm6l/45jR3SKJ8Yh9IMFJ/wg2OrhmPg3NdJ3QesFiAREUpm+FfmgIRr+yBhZ29pWay+AQcH3
	A20UocZnNAB66zTy9cBrkCkIL7nZY5f/vVKqbNA44nfVI3iuECNNYF4aiNspT+eWbeDMr59YLMM
	ulsp5yxe9B8lX9Lb/yFKKiGRQzZJF9XN0o9WfkpsOdw1/4K61XXst8urVxX/exzXi0X6FmpWVxc
	EpUYQlAJoCL1lsxj/p4d/Swwwu9ZD9q9wCXKQ2oGA8v0e3Qj2vdbvrwjIbC9cVzuYMcjXdizc23
	Ig4mtzdv7p6KgXl3yiiXSiYueol0aNLv5tBwNxPTEMaRrWcRoph97+bjueP6mX/eQ+uOBDhMP4t
	FfIJg==
X-Received: by 2002:a17:90b:35cc:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3ab3a369704mr10467602a91.2.1792055885530;
        Thu, 15 Oct 2026 02:18:05 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e821csm3412408a91.8.2026.10.15.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:18:05 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 2/5] scsi: aic94xx: validate the EDB index in asd_get_response_tasklet()
Date: Thu, 15 Oct 2026 18:17:44 +0900
Message-ID: <20261015091747.4184349-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015091747.4184349-1-yhlee@isslab.korea.ac.kr>
References: <20261015091747.4184349-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asd_get_response_tasklet() takes the empty data buffer index out of the
done list status block the sequencer wrote, with the same arithmetic
escb_tasklet_complete() uses on its own copy:

	int  edb_id = ((resp_sb->flags & 0x70) >> 4)-1;

The extracted field is three bits, so the subtraction yields -1 through
6, and the function indexes seq->edb_arr[] with it without looking:

	edb = asd_ha->seq.edb_arr[edb_id + escb->edb_index];
	r = edb->vaddr;

asd_assign_edbs2escbs() gives the first ESCB edb_index 0, so for that one
edb_id == -1 reads seq->edb_arr[-1], one pointer before the kmalloc'd
array, and the next line dereferences it. asd_invalidate_edb() at the end
of the function would index escb->eb[] and seq->edb_arr[] with the same
value.

Reject an index outside [0, ASD_EDBS_PER_SCB) and return, and set
ts->stat on the way out, because returning without touching it reports
the command as a success.

asd_task_tasklet_complete() sets ts->resp and ts->stat before it calls
this function:

	case TC_SSP_RESP:
	case TC_ATA_RESP:
		ts->resp = SAS_TASK_COMPLETE;
		ts->stat = SAS_PROTO_RESPONSE;
		asd_get_response_tasklet(ascb, dl);

SAS_PROTO_RESPONSE is a promise that this function will go on to put the
real status there, from the response IU for SSP or the ending FIS for
STP. Returning early breaks that promise and leaves the promise in place.
For SSP, sas_end_task() starts from DID_OK and SAS_SAM_STAT_GOOD, and its
SAS_PROTO_RESPONSE case only prints a notice, so the command completes as
a success. For STP, sas_ata_task_done() takes SAS_PROTO_RESPONSE as "the
ending FIS has the status" and copies ATA_RESP_FIS_SIZE out of ts->buf,
which this function never filled, then derives err_mask from it.

So the bail reports SAS_INTERRUPTED, which is what this driver already
uses for a response that arrived but could not be used -- TI_BREAK,
TI_PROTO_ERR, TI_NAK, TI_ACK_NAK_TO, TF_SMP_XMIT_RCV_ERR and
TC_ATA_R_ERR_RECV all map to it. sas_end_task() turns it into
DID_NO_CONNECT, and sas_to_ata_err() into AC_ERR_ATA_BUS, so neither path
mistakes it for a completed command.

The lookup failure above it had the same problem and gets the same line.
Nothing changes on the path where the index is in range.

Whether the sequencer can really report zero in that field is not
something the tree answers. It is firmware loaded with
request_firmware(), status_block[] is an opaque four bytes in
aic94xx_sas.h whose layout is described only by a struct declared locally
in this function and again in aic94xx_tmf.c, and there is no
Documentation/ file or MAINTAINERS entry for this driver. This is not a
claim of a reachable out-of-bounds access. It makes the driver consistent
with itself: asd_bytes_dmaed_tasklet() in aic94xx_scb.c clamps a
device-supplied length a few lines after indexing seq->edb_arr[] with a
device-supplied index and no bound of its own.

As with the preceding patch, a response dropped here leaves its ESCB
uninvalidated and so not reposted, since the repost happens inside
asd_invalidate_edb(). The alternative is to index the array with a value
the driver cannot place.

Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/aic94xx/aic94xx_task.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/scsi/aic94xx/aic94xx_task.c b/drivers/scsi/aic94xx/aic94xx_task.c
index b26a468ddc981..bb5094ca5de15 100644
--- a/drivers/scsi/aic94xx/aic94xx_task.c
+++ b/drivers/scsi/aic94xx/aic94xx_task.c
@@ -166,6 +166,14 @@ static void asd_get_response_tasklet(struct asd_ascb *ascb,
 
 	if (!escb) {
 		ASD_DPRINTK("Uh-oh! No escb for this dl?!\n");
+		ts->stat = SAS_INTERRUPTED;
+		return;
+	}
+
+	if (edb_id < 0 || edb_id >= ASD_EDBS_PER_SCB) {
+		ASD_DPRINTK("edb_id is %d! resp_sb->flags is 0x%x\n",
+			    edb_id, resp_sb->flags);
+		ts->stat = SAS_INTERRUPTED;
 		return;
 	}
 
-- 
2.43.0

