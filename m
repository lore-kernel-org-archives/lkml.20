Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EF647A868
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049206; cv=none; b=UrBaL8gHpx4rOxlR+5l0Wx2MUsKDUNZf+zTd347VQo3pMxZ+ukJFnZ7x9W+pzJ+LNFcy/ugRh+qoTxjMADN0eHZvNjD7NfA+8fO63yqu9x+aaIrKlzpu0Z6uqCmF1l8BWobOKJAiqzHc/IwaVG1dFXGSas+uJ43z3JDfj3a5RI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049206; c=relaxed/simple;
	bh=cLnGrFj4fZ5QbMee1ofZJxYlwDb4ml+Hkm+YEE7tfAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDXmZREqL2IZHGCiBNUE/k2AcV4/2vqwv32RCTUUebv0E8ch1FW1FlSnQ6AkG93/++gMhwy5/tssMaZdWlzdqvEtoxCvZ4S0eoevGxJnNEu+prKDDVC1C3KRtZq4washufm9BYX0D2JskLpo2bvwnGJeKz7dBjXleLtNsZFT8r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Pk7wIxIU; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Pk7wIxIU"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so1226640a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792049189; x=1792653989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG1zhfPiMXRFUFNZwJgHDsR7OhzfKqj2uZPWv/pDLsM=;
        b=Pk7wIxIUJJVaUiksAKOmdYrq2W8OmYoKRenvc926fRBZPfECfFaEFVFSzbYeyYevwg
         P6JYsEbZPr2b9NDPh6GC04SEla51UYv7KUckg3P8iwPbRjgi0sFYrUqP/02nQ9fkRdPd
         mIbHlDgbvEdEqp+KQ7juYbewoi7djGgW5CdIVJcax5bItX3NFtl80vVOK1+EGVPIzcAL
         OHQDbcXeDwrZjabBJn359RahXociVYmN7MB3lJ1GBsxSK4KwjtFQkfxfUnGjlS15PM8J
         4hmlfVzhBSag/rbkl1WhwwSS6pT7wQ4PILZhBaIhh8bWcMZGExHpBTO1z70CLbIN4M02
         oQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049190; x=1792653990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG1zhfPiMXRFUFNZwJgHDsR7OhzfKqj2uZPWv/pDLsM=;
        b=P7/UceAGsgzFvzVkZ2fdoI0MHH21hjqoEx5UpZfCYvS3g2XofM8PP6QNNM4lNfq+oh
         dudtPU0yTdyjQkSaNzAcgOJfc+K+UsJEEN2u9kKKfQ61dCUMPAjWMM37TPYXPMScEaWz
         amCQU2mxdxZOZahB0z33wn7FE/8j5hRMQnWWZ51q0Y7GyOzt5fE7OP0qCso6A/YPKxBk
         nBbb/qz9IGtfnTqZIbuU8QRiedZ6qOgDCmmMFxnxBptHGVbYlxOcMn7bPn3AbuUZLJ1a
         /hOOpTdCCCUYsPlKx9EUCgf39EZtwRNK0+JV+6FkiMwPleg1KKeBPY+so4lAV3SFgKkx
         Ey4g==
X-Forwarded-Encrypted: i=1; AKwUvBwo4oVCum5Rjzxvm3IdPO7K9nYET31wSe5886BMJN9XUyJSSQdakJASm2QclcrFZZM9nJBIiqA0RXp/uqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+iSi8Obg5/5WlfHohEy06kXTrOW1KqgtrATels1SIOs+JKv16
	Sk1+027eXS2gggNJPaFx7WblaxjPmFmnxa7cvcvyTEuysXCu/VNYPaBDFGcDUVBJJhQ=
X-Gm-Gg: AYBFou2Dma/r38c/SglvGouvOkAyN53jnrHQejThI+ticZ+6ydJVvbqYues3z+y1WPa
	bY34uDGmQbgdrrcfYyPPIjxj/JKinF/0LXOyWsVAfXNfe4eFaPzyHxagZPbUluRKEsE+Vwy9vAw
	1Rz/D09j4Ap7nLeilvE1D1VLsF7XHmM1Re/TjfrDHP1qhqaCrXf4hJTdwqSf57nBU/RbbpD8xtm
	CXIUI2TXrMnUyqGK7YulugBfsy/E5a2fkrdtDZ5F9jGFkOTvbBwJsyuLvLnyeVFMz2PHx+jVsVs
	WavotTC6OhhfWMEmBSJG0C+hHM8BHfnrWRXLMGZwu06YtqXYgsBysY0jVWSprffhpba2qgAWsti
	DYXPy5hIE90xkVVZnX7dpUp8ITrNXISSqIBdu4ggqhCXNvydPBcv1mvN7cRorzdJea4ixMUnlR1
	35NqENjXz1uLfx7XAzVffG8qgATOfBVRj4y7P/yw6IQa7vjf4QE6CZCbnG34fbrksALDmizzpIN
	P9Iouc=
X-Received: by 2002:a17:90b:224c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ab3a9a8dbbmr12756043a91.18.1792049189573;
        Thu, 15 Oct 2026 00:26:29 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac937c4e7asm1754279a91.3.2026.10.15.00.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:26:29 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 3/3] scsi: aic94xx: validate the EDB index in asd_get_tmf_resp_tasklet()
Date: Thu, 15 Oct 2026 16:26:12 +0900
Message-ID: <20261015072612.4144043-4-yhlee@isslab.korea.ac.kr>
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

asd_get_tmf_resp_tasklet() extracts the empty data buffer index from the
done list status block exactly as asd_get_response_tasklet() does:

	int  edb_id = ((resp_sb->flags & 0x70) >> 4)-1;

and indexes seq->edb_arr[] with it unchecked:

	edb = asd_ha->seq.edb_arr[edb_id + escb->edb_index];
	ascb->tag = *(__be16 *)(edb->vaddr+4);

The field is three bits, so the value runs from -1 to 6, and the first
ESCB has edb_index 0, which makes seq->edb_arr[-1] reachable arithmetic.
asd_invalidate_edb() at the end of the function uses the same value
again.

Apply the same check as the preceding patch and return res, which is
TMF_RESP_FUNC_FAILED at that point, the way the lookup failure above it
already does.

The caveats are the ones on that patch: the sequencer is firmware loaded
with request_firmware() and nothing in the tree describes what it may put
in this field, so this is not a claim of a reachable out-of-bounds
access, and a response dropped here leaves its ESCB uninvalidated and
unreposted.

Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/aic94xx/aic94xx_tmf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/scsi/aic94xx/aic94xx_tmf.c b/drivers/scsi/aic94xx/aic94xx_tmf.c
index 28ac92b041fe3..1ee6009d83051 100644
--- a/drivers/scsi/aic94xx/aic94xx_tmf.c
+++ b/drivers/scsi/aic94xx/aic94xx_tmf.c
@@ -282,6 +282,12 @@ static int asd_get_tmf_resp_tasklet(struct asd_ascb *ascb,
 		return res;
 	}
 
+	if (edb_id < 0 || edb_id >= ASD_EDBS_PER_SCB) {
+		ASD_DPRINTK("edb_id is %d! resp_sb->flags is 0x%x\n",
+			    edb_id, resp_sb->flags);
+		return res;
+	}
+
 	edb = asd_ha->seq.edb_arr[edb_id + escb->edb_index];
 	ascb->tag = *(__be16 *)(edb->vaddr+4);
 	fh = edb->vaddr + 16;
-- 
2.43.0

