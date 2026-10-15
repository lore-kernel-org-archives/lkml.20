Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3064CDA3B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052402; cv=none; b=rAkuzGRh/1FnygQGfcJ8PN7fsulLktxQxzx9AZTyCkcjowdOSEfxQwe4y3ZevC2nHHIU7QV2ItUOWtczgzJb1mbVFy+IY0ATN2TlmNmw+2tup/K4Mhtx1EcmvR4xVVdCMh2A/DMcr9xQPyyY2GFxhiU9UeiM/fEJoV7XRB6dR/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052402; c=relaxed/simple;
	bh=6oCmofZdhVK/JtuHeC7Ybfj4Gu03s9WOGhjx0BuI9MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ssq6D2ru3fmeeJW2/XemVU270UN4MXzPZpA7ppLbBEDh3JWsDQ/qTN5AUqVPuQILzHXzhRr8YmMOoJhJeEyERubDlWf2aCCQGvx35NRnyi0L6FrVsc7tpmMiLXvYRCuAQTvlyUJWL/Gr+MecU83l1SFS1mJxHeBG3czzYBA17bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Us+CwUsT; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Us+CwUsT"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so3678467a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792052400; x=1792657200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAUL1kaMNkehBeLQFdV7k+ayEvBauEx20W/t7X6WlN4=;
        b=Us+CwUsTxxH2UmVAbfR+da0aG2Zkafz14OCgJafZVwRM3K028dBR+2Vt54LsIWAmkc
         Ur/cMyyI0eYeu9hFxPA+Q0TLKxVofMpVt+eZFFJ9EWEK91Xmul22L774uOGntRDwp4e3
         vhRYROKmb0GjkZjQWwQFn54lQ5g0L6dalwA5aSypraVtzOKjoMbSYJnwc/epDNgv9jRZ
         Bfi04hkkeWcO0IM4fe+/FAp5VoVia9H45Tp6XYhK2Weu6C7pt7MwC17PSMDMva3I9uS0
         47RcHFcniQpRcmb5JI+Bvh/SHbZFG65hSQQWDeUt6XAtD6Vx6jVF4rL9L1BBlthgUKVg
         f+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052400; x=1792657200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAUL1kaMNkehBeLQFdV7k+ayEvBauEx20W/t7X6WlN4=;
        b=Lao7c6Dnb6M4L+005lyOq4BINTS3BDN4TnSba12gOnwE/NdK7MaQT53qbmvsJinmNz
         WEmzH6bUAF1FfFp6ir3MWPIPwCM57+pqKqyeBlYoWOreKVQFsH3EbPKIRbmUli5cOKBu
         wNGdZbjTKpSTNlYm5OBDjlUBywd7Uk8GNObd9Q+jG0zHFJUXIVYGJVeQyvKx9+ZTuTAd
         vUCCi7qCmUKoO6XCkTZGrAadPt6VSEemUj4F3aod78fvU2v1esKUvKIVoDP0tN5Fh/CR
         kAMb0vbTi9WH7Xn/Pz6qvGkVABBkOZ6eyjlxEXsFwjLAHGXb5fcSgTExfvNHT1M6S4WN
         t7lw==
X-Forwarded-Encrypted: i=1; AKwUvBwm/SbUsKinOgAn3JBAavf9PW57LaX+zrjUe5PU8rPiaIoL7/18r7eRc9WU37c96Wy4M59uTueBfMgaFTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiz4k485CfhHRzrGNLGiefykm/d1zVN37qrVJwmVHnPs4TgQWT
	R3EgzvViy3gOcYKo70BiEqfWEDXFe4RExuLsvN83eSuc5SRDm9C3ezL8eo1I5MMAPSp1O5qVqZJ
	TKAng
X-Gm-Gg: AYBFou2KyJPGzJPfl0AFizbwgcGuenhKoxOyiqYvQf+ZPKaWr6PFjLdWpLH6WysL6Lb
	Agb3fB/o5eLNT2nIQmSno1fhKmymsoHT1bubZAuSh+hl6I6SQTVPZJlKftnklNiJeg3U19db/sV
	Pi3fYnXn5qMe1yUrITWz4kEpC6o2iziq9DqtWEypBeu1F3FZzxuvShWLMTwgtEiADokUDF2SRRm
	VhYcR//VQ2Xx5e/CTloysdDV2/a39AJ/V5TyedXyJcQr88Yg4MgpeaAwNS/iWyBq3DcUv20DfKl
	MYaYPa6HOz5B14O2odvj9ibznDGdAVawbqD3Ip2LWIeca14v4TEaIUp3/vh9xeIKjc7V4a2sSFN
	SAJ2iR+Cjrg14k1qE0DMvUcaFWvnal5++fxU4TTsdWat1U5EcnlANxsdRvCX6arHCgrN4TUeymy
	PgMdt7G8e7DRGjhqGCdCFchShuEmnyr9zxYsjwwvgzQj4qv91OZZsUY3u5sHpKeG+3072OIIR3B
	lGnCw==
X-Received: by 2002:a17:90a:1582:b0:3ab:9c73:130 with SMTP id 98e67ed59e1d1-3ab9c730935mr7506006a91.33.1792052399950;
        Thu, 15 Oct 2026 01:19:59 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e755bsm3319784a91.2.2026.10.15.01.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:19:59 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 5/5] scsi: aic94xx: check that an ESCB lookup returned an ESCB
Date: Thu, 15 Oct 2026 17:19:34 +0900
Message-ID: <20261015081935.4168771-6-yhlee@isslab.korea.ac.kr>
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

asd_get_response_tasklet() and asd_get_tmf_resp_tasklet() look an Empty
SCB up by the index_escb field of the done list status block and then use
it as one:

	escb = asd_tc_index_find(&asd_ha->seq,
				 (int)le16_to_cpu(resp_sb->index_escb));
	...
	edb = asd_ha->seq.edb_arr[edb_id + escb->edb_index];
	...
	asd_invalidate_edb(escb, edb_id);

Nothing checks that what came back is an Empty SCB. There is one index
space for every aSCB the driver allocates -- asd_ascb_alloc() is the only
caller of asd_tc_index_get() -- so an in-range index can just as well
name a live task, a control phy SCB or an internal command.

That matters because struct scb is a union, and asd_invalidate_edb()
reads its escb member without looking at the opcode:

	struct empty_scb *escb = &ascb->scb->escb;
	struct sg_el     *eb   = &escb->eb[edb_id];
	...
	eb->flags |= ELEMENT_NOT_VALID;
	escb->num_valid--;

On an SCB that is not an Empty SCB those two stores land in whichever
union member it really is -- for an initiate_ssp_task that region holds
the SSP frame header and the scatter-gather elements of a command that is
still in flight.

Check the opcode, the way asd_dl_tasklet_handler() already does when it
decides whether a done list entry belongs to an Empty SCB:

	} else if (ascb->scb->header.opcode == EMPTY_SCB) {

asd_get_response_tasklet() reports SAS_INTERRUPTED, as it does for the
other two ways it can fail; asd_get_tmf_resp_tasklet() returns
TMF_RESP_FUNC_FAILED, which is what res already holds.

This is not a claim of a reachable type confusion. The index originates
with the driver and the sequencer echoes it back, and whether it can echo
a different one is not something the tree answers. The check is cheap and
the idiom is already in the driver.

Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/aic94xx/aic94xx_task.c | 8 ++++++++
 drivers/scsi/aic94xx/aic94xx_tmf.c  | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/scsi/aic94xx/aic94xx_task.c b/drivers/scsi/aic94xx/aic94xx_task.c
index bb5094ca5de15..a8131407b2d08 100644
--- a/drivers/scsi/aic94xx/aic94xx_task.c
+++ b/drivers/scsi/aic94xx/aic94xx_task.c
@@ -170,6 +170,14 @@ static void asd_get_response_tasklet(struct asd_ascb *ascb,
 		return;
 	}
 
+	if (escb->scb->header.opcode != EMPTY_SCB) {
+		ASD_DPRINTK("index_escb %d is not an ESCB, opcode is 0x%x!\n",
+			    le16_to_cpu(resp_sb->index_escb),
+			    escb->scb->header.opcode);
+		ts->stat = SAS_INTERRUPTED;
+		return;
+	}
+
 	if (edb_id < 0 || edb_id >= ASD_EDBS_PER_SCB) {
 		ASD_DPRINTK("edb_id is %d! resp_sb->flags is 0x%x\n",
 			    edb_id, resp_sb->flags);
diff --git a/drivers/scsi/aic94xx/aic94xx_tmf.c b/drivers/scsi/aic94xx/aic94xx_tmf.c
index 1ee6009d83051..e8205e64b870f 100644
--- a/drivers/scsi/aic94xx/aic94xx_tmf.c
+++ b/drivers/scsi/aic94xx/aic94xx_tmf.c
@@ -282,6 +282,13 @@ static int asd_get_tmf_resp_tasklet(struct asd_ascb *ascb,
 		return res;
 	}
 
+	if (escb->scb->header.opcode != EMPTY_SCB) {
+		ASD_DPRINTK("index_escb %d is not an ESCB, opcode is 0x%x!\n",
+			    le16_to_cpu(resp_sb->index_escb),
+			    escb->scb->header.opcode);
+		return res;
+	}
+
 	if (edb_id < 0 || edb_id >= ASD_EDBS_PER_SCB) {
 		ASD_DPRINTK("edb_id is %d! resp_sb->flags is 0x%x\n",
 			    edb_id, resp_sb->flags);
-- 
2.43.0

