Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53207470128
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049202; cv=none; b=OO7JlxOeccJ0uI69SkCuwYZIXKL6BxSNKEbbQ3GevDbNuKPFgzoz1xgTS72i/7P2+CzV4hxlBOb+IjTEluTkb6WIeGZJNZLUk/QEizirDnxQ5iRIwbEWtBit8FY4Y3V2yyRKBWlps3wNMp6qK/b5X8R6UwlIJXhXiOr1yIQSLio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049202; c=relaxed/simple;
	bh=cGUUH63o5s/1u2PafCjlXAA/0SaXTgwRF1yp66SvIyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klyRYjbZkf06wou6ofqb2J6NXqXzUcKT2bTkI1K3UH7GFrpjTPpXPAUKUJ4mzeGtxJ7p2sHzj+AwzwtGUgCodRRzoriBn/vvhu1hmifnnbAWA28ygRaXroJ6QebvA6Jku9wqjemI5j4jUu4RfbUC8+cwq8TH5veInZeft8vRCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=NHxodhlB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="NHxodhlB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e946155442so11396665ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792049187; x=1792653987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uh0z9KlLSWC0E5K2v3qq0IG5YnWBPRtiWrGTJuWPQy0=;
        b=NHxodhlB1HvZ0n/CxK9q+DvGYkzZmdxHjxBOal3jx1asBcQ7rB4/ap4f6ag4I2/xGe
         gLWai+1WDW5n1/E7KEUC2HK3AIg8AqZEGRNRJ2EjklETKv0yKdtzOPxeN1O/cLXuMceZ
         /rHaHPsVux9MxJPWCqASWA7Nk61yNBnqGXyGVo5bt/kM436mhirZLj3ZXbbtBVyZ/92u
         8h0l7BvOzEGbTBoAKjhzxLsYa7PqXOVpI517Fdk3GIwfSPZkSF0QQWfQ4XD0AvxKSn84
         q22S5f7vHz5GyaJWJgu/BLGgvK+orB5rPoBJMW0rT6oOflts/mK/kwViOjaOy3H7VBMj
         Upug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049187; x=1792653987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uh0z9KlLSWC0E5K2v3qq0IG5YnWBPRtiWrGTJuWPQy0=;
        b=VMKMutUGqRNssDX2dKFhcdybkz5dABmxjQDoQogzXtPSPf2qRLMSU8KBKPqyEHNBkq
         QeNRAAcf/gszkkjniZpkQZp+wiPxiLlPhjLzL+dP8hRuI9zspvszazDr2YyDmk59VS+M
         NF3bZWcTqLm/9NnBJ6/ivefXhdLNR9kxwJq2XJPhsAEhXSpkWWvpUtEfYEKJFyOFtWzK
         kE6+gppcXgDEOXnRcIhmsATOrcJaMS8SQs+xJrDsjvi+OjQD6YCJVrGsTHjZWqFJO2VZ
         T0niwgSJmlnAdMpgs3vAM7IQ2WlV4RZyhMr1MTvWmfV6Ngkk3dlGV+CNl4EiLoqj9ELs
         N3jg==
X-Forwarded-Encrypted: i=1; AKwUvBymLNyuVDRdLtgUrMVV/fF/WeQ/cAbV1h59VWs19LdaunQYgSZJAvBuo3NblB2Xc0v44j4B4FZwiPSYbBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgPYwtIUtI5/kV1y9UaP6bauq0zX5A/+CxdtGsqSHwok824USN
	5Rs+wvhxe5eaAV7liVWTWM6lOSewl9GEQTufEgHbewYt3KNgEBN2CMX8HnQUEzt04dw=
X-Gm-Gg: AYBFou1knXfGflyjNk0AUqTB7YsXM7nhcSlV8IcS5e/Rriq6P5btIAsn3hbsWGMXeGf
	fQohxwsnrhH5/gwjo01xpYrqiRyPvW8MigzZRwHr4D6Id7yCIVbmQpcgng+jgSykQvHHFuXngjK
	RSW8JB6oaZcpjAAbSP/7vGZfUSuNa+3NrP7XLG8FGUnIO9uQcOyHAnmqVEoIYQXDhmiJg4i0FQr
	fnAbf6AHSn3Xt8XlP3SE+RSG7K/KlmRTUcAwEGjXursYA7iGEesLAHX71TEpH6HdmT6EA8/ecEh
	LX1DwRQrMEzyJMHyrgq0TXNmi2zJzdM0ParkNo8fC0YIPF7JVs2HJZzwp+ZDIx5uWd/Rx0xvnC4
	y38RO7fbR6yO3txANdYE/a0TlR0lpjSHc6hPl/se7Szy7m4gFy5V5BGIbLwwqGNmUohEWOxgDj0
	IdVSeQE73t8/mLPrs+Zqu706rPCFuy3zbRkeyDzQUEA4YuZMesj7sjan8sTSE3w2M65ybucIqpr
	UZxMQ==
X-Received: by 2002:a17:90b:4d08:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3ac8fff5fefmr2498686a91.34.1792049187499;
        Thu, 15 Oct 2026 00:26:27 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac937c4e7asm1754279a91.3.2026.10.15.00.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:26:27 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 2/3] scsi: aic94xx: validate the EDB index in asd_get_response_tasklet()
Date: Thu, 15 Oct 2026 16:26:11 +0900
Message-ID: <20261015072612.4144043-3-yhlee@isslab.korea.ac.kr>
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

Reject an index outside [0, ASD_EDBS_PER_SCB) and return, the way the
lookup failure just above it already returns. That check stays as it is;
this is about the other value taken from the same status block.

The preceding patch added the missing return to the check
escb_tasklet_complete() already had. This is that check in a function
that never had one. It is written against ASD_EDBS_PER_SCB rather than
the literal 6 that function uses, because the constant is what sizes
escb->eb[] and, through asd_assign_edbs2escbs(), the stride within
seq->edb_arr[]; the existing condition is left alone.

Whether the sequencer can really report zero in that field is not
something the tree answers. It is firmware loaded with
request_firmware(), status_block[] is an opaque four bytes in
aic94xx_sas.h whose layout is described only by a struct declared locally
in this function and again in aic94xx_tmf.c, and there is no
Documentation/ file or MAINTAINERS entry for this driver. This is not a
claim of a reachable out-of-bounds access. It makes the driver consistent
with itself: asd_bytes_dmaed_tasklet() in aic94xx_scb.c clamps a
device-supplied length,

	size = min(size, (u16) sizeof(phy->frame_rcvd));

a few lines after indexing seq->edb_arr[] with a device-supplied
index and no bound of its own.

As with the preceding patch, a response dropped here leaves its ESCB
uninvalidated and so not reposted, since the repost happens inside
asd_invalidate_edb(). The alternative is to index the array with a value
the driver cannot place.

Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/aic94xx/aic94xx_task.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/scsi/aic94xx/aic94xx_task.c b/drivers/scsi/aic94xx/aic94xx_task.c
index b26a468ddc981..35cf61f541d1b 100644
--- a/drivers/scsi/aic94xx/aic94xx_task.c
+++ b/drivers/scsi/aic94xx/aic94xx_task.c
@@ -169,6 +169,12 @@ static void asd_get_response_tasklet(struct asd_ascb *ascb,
 		return;
 	}
 
+	if (edb_id < 0 || edb_id >= ASD_EDBS_PER_SCB) {
+		ASD_DPRINTK("edb_id is %d! resp_sb->flags is 0x%x\n",
+			    edb_id, resp_sb->flags);
+		return;
+	}
+
 	ts->buf_valid_size = 0;
 	edb = asd_ha->seq.edb_arr[edb_id + escb->edb_index];
 	r = edb->vaddr;
-- 
2.43.0

