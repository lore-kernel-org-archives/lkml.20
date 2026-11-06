Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958683;
	b=mZ/rNAAn6JsQibwK5lb2i8+sXLhT7IBbqULmuUMhOB9Zy0l7byXbsGh6mHE/S4Kn9Ju2
	 gH94lxOa14KuvxRVy7KCrGQiN0NbRDUvQl0UOWgHW/mJaFcdgaubqz1r5rKaLONlVCvtM
	 5Yo2Sz0YJdJm8qjSlKIvv4+Wv4+grLcojhidn5a0s7kly5WBvPJuZA3efon0Z7uLYyoJZ
	 f37SGshaZ4pwQqfs5hJrdDayhLoLoIqIltFHtNR8Y9WaWzR5pouU2RtViwH2QgOKDTQGr
	 MC38epIrsk7eqInb5VERjXh5hgzgH/pScSuBeaSlO06QCpeLFDE6Uv5PbzQczwRQaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZKuqEEIUloaDKks8AnObg5jLkIg+139qL0t5VZAu9ww=;
	b=0c56CFWFtRhrQGbuJ3Fb+o54sbDo2/V61Mw2C96LndygHjCli5PvAa7lI6QU5Dm5MWl0
	 8ctZfX1cgBYBtpLHvUV9ukPkNzE55uF89T9Towtic8GuUaDcXVAZoWSBkW5a/G/r0sCWN
	 hAgVuNFUP44At1THeffRQKXjcgoufZw3PuC9WZFHbrf3x/Jo9XIABQtTdlmikSGf/RCaK
	 neGs0iplT+aJISfvVlI9MJDMnrYgLuVL1+Ur9EJCcYdnu1CawTNOG8LbAuaB2Nc/cxBEY
	 q5WXqC8w1POoqNn/32wjhNJm62HiN+VSYZhFfImabIcoCBV0LNOHbiNZFXor3VJtthQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyNQbxxD;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F5606A33D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 235F5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyNQbxxD
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea7190aea1so1567005ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958682; x=1794563482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKuqEEIUloaDKks8AnObg5jLkIg+139qL0t5VZAu9ww=;
        b=wyNQbxxDUhMGZu0OrP5JfdUttvmMPzDHm5uw8oxiIXO3EhaRIMqHlkcsxfh2QQ6N2R
         Pu9FKSbMZGG2yR+Og3T0JjclKeUrgRE3g9LwHN4BLt0gQ67NmwdmaxnmxsV9PyAHFbNL
         jhyT4do+w7ezAk/bwDT5vOo+4Us9AohdwPLm3qHWdqfGIwzSwYU7QngYiFkFsRdUpX5b
         6F3CJWOE39aFkHa/LHbxT4vF8t/Qqipr21PutfvU82VyZXsYkSWnP4g3kMEY3B2/qU37
         vjjB3GMYcFXjCQ/1s0K4kYEu4GJjEHN2o0AvEqEUyFMTA0Wndzv8QrwtIKaxUCZI0bj/
         Pbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958682; x=1794563482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKuqEEIUloaDKks8AnObg5jLkIg+139qL0t5VZAu9ww=;
        b=r4tp+8VcNWQPMPthwN9/GQivGod4YA3177hPIr06UhedTLpA2ikuivJaBAyuzpm+IE
         iI2wp03Q5/Tc4bL0pUh64DhsUSCAeoy8pP9qq6ZGinPYQ7/it7LiNIyev6nccLWrrPUj
         2+ouenP1Zi8Ja7D6fGV7BuFq6QVrdcnAL+NrZ299LGNerXOU9PqO1Zl2klphFiLOLT3w
         vCzF+Kg4h7JaQO6Mu6pTvXBfwJG44D3QWbvT71ar6ccKIA8ElR0q1rJl/WPgVkyvZ0rj
         5aKq7GcGqpRWNMqdL2/w0PDdjlEp98cV3fF5V/lpj6IVnsrGABhwwILVCQeogD2sTWXZ
         FjWw==
X-Forwarded-Encrypted: i=1; AL+hErFieMwYVFrdCD/rFgo7Quw3d0ThJSWXE3eG5JtaeSauwsRZGL4uGlY5h0BUvbXtL3ItN24e4RSTRpLgy/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qNnPcv9MRMc5Tmj8qUpqXnl/6Ty9YWr+RV69uD+KoMsv7YP8z
	YpiOUr20ul1wabK1B/xL7aftC1+0WoQQjb1VE2zCCHGgRF+iQlrcw/TnifOeO+yG
X-Gm-Gg: AYBFou1eq6bOvCYpYp/Uy57QrtuiQkC8dG2FY74TXoyFcQBMy/VVz6Lj7/vI/S86vpN
	ylvHfnR1sw9YBFKv4pLypbMBA7nl5gUpLh95AONSeW8N/99yUlowBPYgR9NP7EOliBpBIqLt8V7
	KGiBDM/WAOUo3eokUPP3z0UcAzUrZ9+oWsAuUjYyPEFgGeEx/tmVfUHMdxYcX8+ntlqN52E/m/r
	vlhdJWFjsZgrpvwG9PfSaL7JHsNl/huZD7nNm4xg4xQKTNPKwtXSI+SdXvoL0sQ+7srXv/JDVDB
	8k9obPrYAXv82vTTN+DNMybuxqYTCRgxyDLwOMANFqs+y0LolYVvuV5zDeK9mWBHUs2bs2le3q/
	YOXOPUljsvET+0RJAY7ihkSpf9BMaB9cI+49fX2BMCLOL5R7Ez76y/gFvmgd4CuplheGABBhcff
	0I/ooi/hX8SXm25rZx8fSzZcH7v4C4XxkTbx/9tXG0wPJNhpsQUkGNf1fla/JCyYotfBRDUwUe4
	7XuCka8nTusLUKtmo3t+r5E1VqRkN97UF1wGfXMEdAHLlzUYmZmchWczmPhj55jswb81UlsI+zf
	7GgUm1y6pMNh4Pgvfyonpzc/I0PZKeeYvZ3BP90kujYr9oP3
X-Received: by 2002:a17:903:191:b0:2ed:188d:3016 with SMTP id d9443c01a7336-2ed40e228dbmr21444695ad.73.1793958682380;
        Fri, 06 Nov 2026 01:51:22 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da40absm3636085ad.75.2026.11.06.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:51:21 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] jffs2: validate summary offset in the XIP scan path
Date: Fri,  6 Nov 2026 18:51:07 +0900
Message-ID: <20261106095108.2405364-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

jffs2_scan_eraseblock() locates the summary node at the end of an
eraseblock and derives both a pointer and a length from the on-flash
summary marker:

	sumptr = buf + je32_to_cpu(sm->offset);
	sumlen = c->sector_size - je32_to_cpu(sm->offset);

In the non-XIP branch this is followed by

	if (sumlen > c->sector_size)
		goto full_scan;

so a bogus sm->offset (for which sector_size - offset underflows to a
large value) is rejected.  The XIP branch (taken when the whole device
was successfully mtd_point()ed, e.g. an mtdram-backed MTD) is missing
that check.

On a crafted image an attacker controls the bytes of the summary marker
at the end of the last eraseblock.  Setting sm->magic == JFFS2_SUM_MAGIC
and sm->offset > sector_size makes sumlen wrap to ~4 GiB while sumptr
still points inside the mapped flash.  jffs2_sum_scan_sumnode() then runs

	crc = crc32(0, summary->sum,
		    sumsize - sizeof(struct jffs2_raw_summary));

with the attacker-controlled sumsize, reading far past the end of the
mtd_point() mapping -- an out-of-bounds read (KASAN: vmalloc OOB /
general protection fault) of controlled length.  The preceding header
CRC checks are computed over data read from the attacker-controlled
flash and can be satisfied, so they do not prevent the over-read.

Mirror the non-XIP guard in the XIP branch.

Reproduced under KASAN on 7.4-rc1 by mounting a crafted mtdram-backed
image (the XIP mtd_point() branch): KASAN reports a vmalloc-out-of-bounds
read in the summary-node crc32 over the mapped flash.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 fs/jffs2/scan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -495,6 +495,10 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 			if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC) {
 				sumptr = buf + je32_to_cpu(sm->offset);
 				sumlen = c->sector_size - je32_to_cpu(sm->offset);
+
+				/* sm->offset may be garbage even if MAGIC matched */
+				if (sumlen > c->sector_size)
+					goto full_scan;
 			}
 		} else {
 			/* If NAND flash, read a whole page of it. Else just the end */
