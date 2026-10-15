Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7014BD794
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052399; cv=none; b=Nw6H/EOikfjXCG1yTF7mHSyfgdpZ64N+64eNBxy3TLlz9Kw5531Ch4m9VzL+FJ8gZV7qCOY0H80+Cket5QmWZNCNzyOQ6GjcoA+w/LNtlMR1YV3CIsQW7VhDsayVkjuU8THrULr7/3j/JxPrbg5tno/hPQ2uc1f24Qf3PWD35As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052399; c=relaxed/simple;
	bh=cLnGrFj4fZ5QbMee1ofZJxYlwDb4ml+Hkm+YEE7tfAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFPaR1xMQZWiToEGNWIo9pVinBFOrf5OQxqJtOK34jwcYeXHIXdD8WYDl6Rd1wX29UdM0Hsr23toQX6ZHK9GPhkJCJis3in8krL0SRy63uxIt3MDbcT9h8Q4eROdNwP5lYNcf8mobrBVm+8bT9hFHNRGgE1WIy9EoEEo6FU+Ee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=pC1zgxG3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="pC1zgxG3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2756849a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792052395; x=1792657195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG1zhfPiMXRFUFNZwJgHDsR7OhzfKqj2uZPWv/pDLsM=;
        b=pC1zgxG3Bqw/RRp2/Et4Cvqg/mdyORE6JqhA8Qj/5Ci64YxumBvVkA3YyXmRIh6Nar
         yqQ6suPM8GT/kSiHHO41ZEC9CjGywaLi8BoRpMSWF/Wq3VtIfkTPdpz25OZwcame5I8x
         xwuiaf28KyLSwTIBKIrwZwE1N/7ZAKRYJG2lD+1A1+xO4IXqTMhqcmlNBrQN9QDlUWXH
         wWd3zqlhQSMG8F2CMxi9aSUIC6UsmehIuMYJ39j6duZSYiiwFl6MJzRCcTftAes1NzzY
         4YH7St6O+Fp5ZmfO1ai2EtNqjN1MjmnEe3P9dMdcKOOUe7Y6wFIEsrzZEJiYaVmuoRyJ
         Xnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052395; x=1792657195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG1zhfPiMXRFUFNZwJgHDsR7OhzfKqj2uZPWv/pDLsM=;
        b=pC+lN0eXMVnKI/QjBHZv5CgJCpy+Tz2NvWSy748oYhmKXlM7zFr+EQxaG9YpYDB0JO
         Lt97uihi/fVPdETJwX/dgv48aRHl/aq6rREvO5CVSYQjmvEDtqkA2K7WAltGiqhz/S/0
         JfNaTrXtIlHDjPnHcjMCVzUSR8qRlBLEWmqVip5S9nWWjHPZ957yKy/EJeokcJ2rH18m
         7+YItqeh+qL5/i21iDTI/wVz4i0Pj/G+5Z4d5FQQTcn+yW0mDVZ9mnLT/hLtCy1vZDUP
         affp42kub0ZaJClrORiDd5/IezL1oQSy4PEpuastRxqQ/PHy3dHJV1Xdcwx2FZfaLC+b
         Wi2g==
X-Forwarded-Encrypted: i=1; AKwUvBwzsW7SFwqQDQFdSOzwsCONF97/565I3occi5ffrDXmmeSZKlai8LDwR1pSs4Wqt7mOXxAwvW+eI/p1+gs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ9DhIdBGXHv5n4ud8MoRl6Rfne1oDuAo9qTQEUyXofnRpbFBK
	rdULMSTAiDIiYsq45QgjaF7/etc0fWZwAJVS1MuVkK+w7q2QOoP4/+xSb1dXR3KBJcQ=
X-Gm-Gg: AYBFou1mqOCUGVdcCyVXIE0o7koKkn/CpIEK0DcNzy4sR/lSwvFPGgKpBPyPbZGZUqt
	iK+eUAGWyVwmQKGJgK3ehUoOWmeQVrRSn48FtYD6FRu+FLp2kzLDB4Jx66KA6+ZvTas2Id320sf
	5w4v5OmSvAJw5I1IokoWgoy45sSzH2PwBl076s47YeQgcVmG8c1nAgnSAQwB1qCsUKoGzwWwU/u
	gnCrQ4OtxH+QdJZkfgC/CUqBkC1HCGWjjbOAyCqZ46SuuSUuNOH53vocD3jSAOsjgc6fMCDNzn6
	5B2/hT+t7D8jUGz5ghHOxOra4T8GIJvOgrD3cgLNzuVr4qpoNtbGEcfY7c/QXOO74ejb4W4eK3y
	qNjgpFCAL83pCBuuHsHZi7CuA8EvG2Au9rDu1V1NdBs4PK6hamuLD+eV2M4y8Vnmj8M6g1NGfS/
	AvIRkwPfPsbgukd6VEaae/rC6U2e4WTEej5Q2aRZ2pv6UN15Fy50MMVf24RqsEFKbuGmK5zRog4
	naaF0Dek+Vg9Rdm
X-Received: by 2002:a17:90b:2d86:b0:39e:359f:8539 with SMTP id 98e67ed59e1d1-3ab3a90b5f4mr13911476a91.15.1792052395457;
        Thu, 15 Oct 2026 01:19:55 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e755bsm3319784a91.2.2026.10.15.01.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:19:55 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 3/5] scsi: aic94xx: validate the EDB index in asd_get_tmf_resp_tasklet()
Date: Thu, 15 Oct 2026 17:19:32 +0900
Message-ID: <20261015081935.4168771-4-yhlee@isslab.korea.ac.kr>
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

