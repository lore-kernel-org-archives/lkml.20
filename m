Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7AE4854F4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503665; cv=none; b=uNF4SWen/AdEWVxlI05Co+XuyIaKgJ+RQmDBl7VClWfkxGli6Px/8b8fw5J3FJLpYeiPfnIzdcbYaTBxT28cZw3cAfMZwnqfXsK2tEi0qtF96rCVOR9lSMyPzPKklKBHt4X/kgB7mXJhxp/W95+MPVE7QVqK5a+NxxoDq8EhOWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503665; c=relaxed/simple;
	bh=u3mdpHm63NMciZUxyZb2tyyjBHYBnsglAuR31W/GzJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8WmWN6K8yfSSU/suG4TbICV43umAIaXHXvsj/d/+XMHLFRrxLp5Q3BnrzV/9J41YCIJsrN///XZeHOLdcE19vjCJWTLmtFxTl2Hwa1VhWqv4qA2H6JHi6Oi5BOuSr+4IPRJSVUqnDjr4vCkb/5VI92spAO7mxDoUCZIcSJjBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VngPppVk; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VngPppVk"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91234bb0008so1308746d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791503661; x=1792108461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wogysuar2t6CIwSyb2S0JLKktNfZleR32/9OzbUkzlE=;
        b=VngPppVkXb2mu5RKY4vYhCsw6dDqNb728+i98WsmGyE5Zeemvaa4dRJZObWBjWru6O
         jhrInJu9iMOGjcyeXdGOukwXMnBONeaJf8JYIgFIblfg3JeiCtLZG6tUPrfqfJVaht1W
         BsDf8t+NBCpfFphT5rDmDkTdSwkGsuHRi5u3AN5EIsbdjrdMZCRTWdsbTCPgnXnNw3l/
         nrS88FBYiBchVWrZsNid1tEim+qudTANn0QyUbYMuRX1nVYiCC0vY6tLNfgqHQGkij1U
         OiDUBl+aqTQiS+uU5JcmzDeD8kIXRg/yMT1dnFV+DX2i14PN2rqIQ1moQSJjjgzq8sDD
         +UIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791503661; x=1792108461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wogysuar2t6CIwSyb2S0JLKktNfZleR32/9OzbUkzlE=;
        b=php3eyHxUKG6IvfIFXLHsXa9oRIetthEjcOWVAprAaTH9zKulOmZsS18snnn/hVIaA
         k+MeWQpNmXyVsos6CG2uKObAudlAP/FH5ovDVDuKPqMzRGrHJ+LN4rPZUlp1JltefLDR
         zjknyPqQyidfZ6gL/Z37/WqZWz2A9TQX5CFgwguvxlntu1tIemqhGTxSpfWiy1BiFLNq
         1/s+x4QENW8w0UrXJWGgXL2fAKfDuu8p27eHAnZXzfCu1wooXar0IbcpSRyvE50FiwSC
         U7GeYhRqdS+5rIjx23D5DPNAOtLVJz2dJK1+GOxE/sleqzTV1A2DMkRQarsTR2f1r1l6
         bmUw==
X-Forwarded-Encrypted: i=1; AKwUvBzdurmbzs9PY48e7NrzPU70CK+V4KgY0z3lUHGRD/OXYgqA36bPlMcX02/mGNuhtE2r1zhv1AhZ+Yg8y0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLohEHwigfqYSwU2f5iRY3hdIcafIK7H9CsKx0oIvzpIw29FPI3
	lP8rNqhR2U8AH3qtOlPYx45pAJHGFx9chLB38d7sNykClx84DvVfBy40
X-Gm-Gg: AYBFou3RHF53hgW7Ozw/rSBZntnuw68q7Gtv1SlxTfSVEgjhWoURNzMfstOK9/mgwEw
	SkUuxyYC3xT25W5aOv1NfSeE/VTQxpyxYVPJaJExEBxK8MtQkfulXD4r0sPJhDbmpiX004NAQ3u
	DECBba09iYdlAt/hJcLROnyR9ik+jrs3yHs6E0GwjL71+35a4xJBOS+nRx0vvF4AQIbCWy7suiL
	WgysM7B88z7hpi7GZHKJdIpH+YBCX4+WjfN9W6BMJAptPogYyir90P3tezdepyXWKGSd8dkDzpL
	r1b66CD07Vj5CIfIzSyp0KBKFb0Mneibhtoh0afT/NBdlNh9qoJGzjqgo4VGffuEwmqb15VBS9p
	dhB7xpPNfIpVdEfjh8lMxmN/QdEExTncRVt2JN3Aay+AksfLBinjvvRrzWv+/7vX+jglfkZ5PEh
	03ewQv2uuO6CvUiQubUGiStaYdkHEb5G/IGHz1cRUKZKDbLsp1o+C1Xq6+3hlnJyXS/QYo8xCB5
	AGnsjtFz4nTeGUR2NFxV7oHpjWy7Bnu4KiQr1U+PeICfCry1H/EgqkZIvhuzhxzcoamoocw5ZOx
	Nc3XN1AfHn0eYVMxUqM=
X-Received: by 2002:a05:6214:4118:b0:919:847e:ccb8 with SMTP id 6a1803df08f44-91b55345787mr7524496d6.1.1791503661318;
        Thu, 08 Oct 2026 16:54:21 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550e6609sm3451586d6.43.2026.10.08.16.54.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 16:54:20 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH v3 3/3] scsi: target: rd: Don't invoke the OOM killer for ramdisk pages
Date: Thu,  8 Oct 2026 19:54:09 -0400
Message-ID: <20261008235411.56641-4-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261008235411.56641-1-sanan.hasanou@gmail.com>
References: <20261008235411.56641-1-sanan.hasanou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

rd_allocate_sgl_table() allocates the ramdisk's backing memory one page
at a time with GFP_KERNEL. When the requested ramdisk is larger than the
memory that can be freed, these allocations do not fail but invoke the
OOM killer instead. The pages are not charged to any task, so the OOM
killer keeps killing unrelated processes, and may panic the system once
nothing is left to kill, while the configfs write continues allocating.

Use __GFP_RETRY_MAYFAIL so that the allocation fails once reclaim can
make no more progress. rd_allocate_sgl_table() already handles failure
by returning -ENOMEM, and the caller then releases the pages allocated
so far. Add __GFP_NOWARN since the driver logs its own error.

Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>
---
 drivers/target/target_core_rd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
index b73bdd733..7c53d8a72 100644
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -150,7 +150,8 @@ static int rd_allocate_sgl_table(struct rd_dev *rd_dev, struct rd_dev_sg_table *
 						- 1;
 
 		for (j = 0; j < sg_per_table; j++) {
-			pg = alloc_pages(GFP_KERNEL, 0);
+			pg = alloc_pages(GFP_KERNEL | __GFP_RETRY_MAYFAIL |
+					 __GFP_NOWARN, 0);
 			if (!pg) {
 				pr_err("Unable to allocate scatterlist"
 					" pages for struct rd_dev_sg_table\n");
-- 
2.48.1

