Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772224;
	b=oDTF/NuBLTy3O8SXwHwF8DMPS/JIHosFVpQ7ryKnt7XqEMArERmPqZNOZyo2dJaMcP1v
	 ykSdjZcMhS7aDIvv3uygDoCmlrigEvIbIoTSGrUl7S1gDyjCPLKq1AMiMdcGVKiFw86Os
	 aLfhJsFJfc20ExZ11D5sQ8rMbGWm6KQnWD54wnM9s0EzHorIt1tsewSATOwiNDwNa0xwd
	 qBXtWGaUN7udvJIpr6UaZn0eDQzjK6ZAuiqF/BajxP23GaD6eXnBiCLP6j/knQqgsKcFl
	 ZIw7LI/We1GBC871K2fxOGgqUTxRWozwOXsolEoegghALklR3hQuj5l5D0vdJ0SEpew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pgZj8XAsyakdaOHd8NPgcTUkVlwW76G6Kenmml9Zffw=;
	b=n5RX/4LHzx68jamQkAjM3Oc2Td/C/EreDAF+PevPDea69GeuYHUG8Sycedk+U7SZ1xCb
	 DCHeYGlnO/DYKilV08Q0mwq8Y0mdv6VvhonztMPOcYhakNoUXnqddcrFfQkmZhMvauUHc
	 jiOI6RmumViLZ1O2yh7+sXWg7JWzuqPsKY66Hw401VsDtE/NQR++T/bZQg1tYp8RwNNeV
	 Frbd/t6LzGQybdFgFasRy9Tq6r+UTkPb8XqDeplv/ZfIjoTgsH9tMUpRZqPo0Xs4J2l7k
	 iXTkl6WhszG5NusxQavabRGEnoWsD0jKCMgfwKm10KhBVZX5cUU6QPiqsC/C0zHLU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqG4JhFk;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B20606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B20606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqG4JhFk
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a822463a22so227139fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772223; x=1794377023; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pgZj8XAsyakdaOHd8NPgcTUkVlwW76G6Kenmml9Zffw=;
        b=zqG4JhFkhH5bzOPrOjJsWJuhK855bf+RUDVNpzokBjL3q8kabski954R6Gpkt94lXF
         FCGSwx/IIg5M+l0zT2lsMO9U7aY7ADrTqDMZYIbitCJZyHhvNKKyr1LX1HFLeq7jQOyl
         0oa6hQ8iepxiLvMkhwaJTs567j/Ta1BoWC9hUtTs1DSfDDkA5xJHEQyLVmQISZuFTE8z
         jtB21jE4ygOdGXO9vTNJ0jLQxgCEq45VLUI8kDUvwhIa4fw3Hk6oyz8egy97X4QyDPtL
         w5qByIjJ7slUwva0f3kwsTfHKOsJHG90iwKfhxpqxOTOaO69lGm3Tfxi3/d6t0y4/0/L
         GT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772223; x=1794377023;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pgZj8XAsyakdaOHd8NPgcTUkVlwW76G6Kenmml9Zffw=;
        b=1jf+d1s8VWKnSKAOQLMfBCAoL0d4iw2L/0EFnlntNFGc2Tlb+KpzOz0Qfhet7jjTMU
         53jhhvmz1e57u1QFBGjbbFE6ZEyuAKLqSGIT1C0AOqvwmi7iY+GsipC2A3+V7Kuwvby9
         yzICcKmgXd/TDxVxuy9XZuIkihKRJ3cjumarlZSt5QRC8ynOvGnfdJGIeDMq/RhXG/CJ
         pt147hq5u6dHowC7I2j3xo3X1FTi/1I+oaWP/H1OZSTmrfYc/M0bZXg+Z7IeuWcm4Qvq
         A29MdVOGFE2XBZ/POhXGt0sDjzm3h4IVxsYuqPpDw7FklkHBWjl7uuITaQh4q6+KN/K3
         lrmw==
X-Forwarded-Encrypted: i=1; AKwUvBwtqDoO6YAOExQLuN1jDoJlWhgSRcIhA/OnxbRdvi5JsdBIyj5+0RfINX4gNyQTSh9m/BiFsRVONpuAgdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jvCMfMFzdw2TjtfA25LLD4DyqVLErdycY+9hQZAXxgi0EGsWM
	A1K9PgMZ4uq+rvmW6lB7MwBv3duf0voALwhjCotsFv+D72jVQ7eziLDEpjMJ7qYb
X-Gm-Gg: AYBFou3zgh+tMY0ztyQBYmtjkv72jk6H/hZJqGIcd/b2uJePj9LSRMTgNA7Y+FEShJ1
	Jdi/Xpso76Xv4Nzc/DfeWx76iRfrTL/zVVyeIVkzlCMasfaVCYyZD4e5RQmlT3h4Fwwdr9WXzmB
	8JWKdgEHsKC5SG3zB9EwzmSppjpNjSUWKrGsR1+fo6IpVAXqC4GqYtTPbnlUxX6ex8AlpAO0vBZ
	LGstzcFAZXgR3180oH36UTvqHAfwWgoJqbdWctiTuTB6T4ml3wkqlOkKzDvZMtn24ZqtKelAlct
	KGROYi1bbqv7knMvT6VnPEltwY/u4YyfUuo5samL+vicVlym1Oc2kTLs2cmGZMgtcvDdsFRHhmV
	Q5dDYU5S8dyrkLnSIle70TPR3i18lREPp8g6EHdfbdHKF1hXueZ6WzhG7y3IAwo2n6qj0TJLsVW
	tuursLlOgFB5+AJyhHYp8Kaj8FbaEvYlqMvIdLqWdPRIA9oRtNPxMKSb8eZ6YZJsZbf8O/Yq7sl
	XwPP0hzf3xREsnl8sUFyN0qTUZieyxuhatmt35v4ppbWozwEoHnuWJru0eYb9yiMc7Me6yrJsyc
	nwGZAIgVxDXFBcs77vAM1qrzs/8E5YxKwrvdOpQ9chQ9tOqfXnR/MPQvyCdg0NhljMmGPFVOext
	Y5l6qGsOoAWWBTu84UkCEw+DeZLG3Iox9KdefHErBIbo1U+vGelmW+LRMV4RAnERh00yO49GO1I
	MDubFS8d1F8iFMY+6uc0lbmckN8wSyyKbtDtXK4pFCpO0ECy4Irws=
X-Received: by 2002:a05:6870:e254:b0:47c:2737:edd0 with SMTP id 586e51a60fabf-4a9072fc9d4mr9853692fac.1.1793772222723;
        Tue, 03 Nov 2026 22:03:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea4a360asm1065695fac.5.2026.11.03.22.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:03:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 23:03:39 -0700
Subject: [PATCH] mtd: rawnand: propagate BBT read transport errors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCQAyF4auUrA1MKlj0KuIiM4kawalkahVK7
 27U3fs2/1ugqZs2OHQLuM7WbKwB2nRQrlwviiZh6FO/I0pbbM98twmdX5WrYM6xlQXVfXScCZV
 LFiEd9kOCyDxcz/b+XRxPf0fjpmX6dmFdP8xNmdOEAAAA
X-Change-ID: 20261103-submit-rawnand-bbt-read-error-v1-eacbdd1e7970
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

check_create() handles uncorrectable ECC errors by invalidating the
affected BBT copy and handles corrected errors by scheduling a rewrite.
Other read_abs_bbt() failures are ignored, allowing initialization to
succeed with missing entries in the RAM table or to rewrite a table that
was not completely read.

Return non-ECC read errors from both the selected table and the second
unversioned copy before updating versions or writing tables. A transport
failure does not establish that the selected table is corrupt or that an
older mirror contains all of its bad-block information. Preserve the
existing ECC-specific recovery paths.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b0e7592a2ab7..93c798ac4f9e 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1023,6 +1023,8 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				i--;
 				continue;
 			}
+			if (res < 0 && !mtd_is_bitflip(res))
+				return res;
 		}
 		/* If they weren't versioned, read both */
 		if (rd2) {
@@ -1034,6 +1036,8 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				i--;
 				continue;
 			}
+			if (res2 < 0 && !mtd_is_bitflip(res2))
+				return res2;
 		}
 
 		/* Scrub the flash table(s)? */

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261103-submit-rawnand-bbt-read-error-v1-eacbdd1e7970

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

