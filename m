Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EA14C9E0C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052398; cv=none; b=bX/lOlrGTJQdZSg7ccMw0aLNiljV/iz+aC9rFk09FsvKk+vpFNExhW9YHM8sTX7mESWlmyKvh56abugegIZEtl3442KTOHa1Q6/BpZfwDd8ty1Rl4Z4iCnKo4ZzvyA6LwLlHANqGg+MHXgOybEzeHk2cZGJUvNHMHcDqqroIOiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052398; c=relaxed/simple;
	bh=uslEExDEGp6pVGpAloBoNX7J+MmR0/ayHNO1yyTZjEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBJAUZ7PV3y1gEJeuZBDUx5wnqnPs0kmfMCb6icDhR7otJOzRGhroR9852q/E1IwQSoi7qj/fIr16XGaKw/rPGzX5ewzrvmthflirY/seK0DQT98nzaYjLCmUFdcdre0abzpbwcCqTqBk7h52qxPgnrCLhPWwkp2O6j3Ad4Ykcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=HtzPVSzk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="HtzPVSzk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so4299893a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792052393; x=1792657193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2BxYeiKObMcw2aJTTx5HIivwKcuO9GkYsdXsOu0i4Q=;
        b=HtzPVSzkSnKkmb1L8rmMrRmR9z3OVbcEsyPo5nVuKEpwiB8D7xNE/MPlKXejdfmSP7
         cXVuHNiaUHIXvfwbvRI5kebrFayWvmFSHG8hFLJmJMnbQHAXiKAp7yMIa6mTa/j38TJV
         SfECgKkwoortZKvRF1ToAmyJDRvwHNRn1QjEXsknxXkZX11X9Xj83zx8E5XyvD4/ezKE
         xXf7i5CJHz445U6z16K1cb0J1D/ofio2NDsvkOWM6borpnaDwwGlbLsaX7EopvDWynIk
         PITf0DkYOGlxUrt6ie/x072ZG4j0HlMUjY4n0fJk2OQLesn0nEIvVgpET8mHx1xHp9EG
         e9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052393; x=1792657193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2BxYeiKObMcw2aJTTx5HIivwKcuO9GkYsdXsOu0i4Q=;
        b=bYXoZvVTfASgNZ457WjnQsvtHF8de5lklaSaCY7hKq/3RlZWQbSf+TgH0ApXtelRFZ
         BYQiAbrRzImHC1jjw0+uX+Xm6Mjpv9QLWidF3VvI/VgHgBmJjKcYWh7HwOOlwPOxFfM4
         YoWXhe1JR654QFUYFwK0NX700rQdYpwTYyXSW2ymfDeH+V/zABI487S3QiN0fQFBTi1b
         rJ3L+w7fju6V35t8Gs5EF1Mk6JsqsObX85KWcPabkdnyx+Qb8e09F4Jr9zU7JYIs2B9U
         84YWiP8omYp49KgtkE8I1R5uB+LoYt3KMERXgR4yswB/Bf5EwAa5uT5NBoBuvwfXMavC
         Cu6A==
X-Forwarded-Encrypted: i=1; AKwUvBwxswhKqXaAf8Xa5y5bhV8Evp+MGwyLmNXg/Ow2wdKqNbqF0W4MYmDbCOzMRhmCrFLp5FNVO/iRejvpgKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXvF9pIZisbVskgMTIKEddwPGVWu4MX2jdmF3evcScJlxuEwSv
	mifle8MLTJYxcvEGrsDyqXsw805eniF7jDydsGOfDtkTkcwq4TYt3mH0OrPpNln+TpU=
X-Gm-Gg: AYBFou0I1V2zrnfiUIWAscXx0xaD9a4cuNDG5O1VRCaklSET0Nm9gX0em0rVF/MJyxr
	Jaf5fAjhQ7GfysmZcKX+A+7LqZWHNe0ApQ4KkmZPZydMPe1kZiyUw9NL1xBPp/LFwLEUaZYsda7
	OM4+eLw0LV/sCVGS8E0j2qey1c7WMhvkbXi28vl2FZuyLDOLSCBaQO8FHG5vf/JyupIZ/CmWpY0
	VPBs1Q9CbhDvBAPs37Tabsv3X0WeHZQODQgqjBua1HnFl+SeuE6osHRijun8EMiDzGr6elQCZw1
	x/Eh8AFZrt47PW0e3UrebQVPpgRO66/s/dQFKoFm03/1MR/ma+Ab89gsCR0WC6LoBYbbmBqWuOT
	TpsUE9uOTno3kRhNJwuvR9SZCvdPQQKGr9C9YuoM1A7oA1bxDfLdNp4hbRfyLMYgTzx8WTRqC1D
	LSp49QWJRzSaoeKWRFuWHPGdV9KgTJn6ngfLzL+fQkKex+cI3p+eZsi1BNtJOoJdSvfSP0uUs0G
	+Cjag==
X-Received: by 2002:a17:90b:4d88:b0:3a4:a850:6982 with SMTP id 98e67ed59e1d1-3ab3a7786e4mr16481456a91.26.1792052393278;
        Thu, 15 Oct 2026 01:19:53 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e755bsm3319784a91.2.2026.10.15.01.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:19:53 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 2/5] scsi: aic94xx: validate the EDB index in asd_get_response_tasklet()
Date: Thu, 15 Oct 2026 17:19:31 +0900
Message-ID: <20261015081935.4168771-3-yhlee@isslab.korea.ac.kr>
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

