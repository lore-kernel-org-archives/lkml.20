Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648439;
	b=zhLxkJ4seU8hijeIV8EDC7TICqcBPg22a2jJWS655DjZpjZK2/iOm2zOHDM0uBAAqyYp
	 UnP2nXfhGqWwG6OHKTsdbVxTVRsHI/svFtEfpiBkcHN3AWxVmSfkOxmsW5I3qBKZ2XSc3
	 kmJSIysfJGKd8rPxZEJGgAZE9eJ++AFYW2fKnlheEwdtIKEpUP58Nml2y9SalKkL8NMK8
	 priNriedrWQcEYWNNQSVPjJ760a3nqFFwh3UeeP9x2/2jehetEH6crqYQYeqNxk1+xckB
	 AABElYGvnfWlKTR5t7Cp4cMo2W4jIc9AXCjIgBJvkOJM8wsTnLWVFaGIaKFk7P1uRxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uXk4plWW+OCeCf0/xrqLno6+gljAR6KSsv1QLQj6fLU=;
	b=Lzo3k2zdwUEYCtsxiZbfEGa9Kwxu7sQzR7PfyE/xkg+XiKmSsrOFCmRQQprCEHHBRuqf
	 3EVM1gFpB7k+3OaQQzdJaQdpYIcM/h+qQEJ37i1v2a4PVwugQh2sKCVL2HsvQCbl9asN6
	 depitLPGSk1VTTJaXePX7yH26Dy2rlI4kUcT0pK8DetMaKb3KySC7NXE40qDNxZkr56OR
	 uwl9UsOq23ByPxdpc0K4Nz64N5XXFnpegGHcs9uXqFuQVUyRH6OMCaP58r1d8kinRSGRs
	 +IOdO3NTyNPa4RDZY2/K2/k65JlCo4m9JgmcKgL8M4A+u+r1+X57UEGop+C0Si9U16A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="t2JR/Sx4";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B228606D834
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B228606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2JR/Sx4
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1765304a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648439; x=1794253239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXk4plWW+OCeCf0/xrqLno6+gljAR6KSsv1QLQj6fLU=;
        b=t2JR/Sx4sJMYwDvDzpQ9YMjcdffNhOJN+FyTfmsz9CXA7Eaz/03qVU5KXCi7XGPF5Y
         Y65HzX+WXMi0gkL307AgpkEdyQz92ZHssjBbGHmEcAP6JJrrrsF+B7LstnFCD15Xzzu/
         keIERGAVOK8SVowCioUalNnj3CqDWWnWZKsd2UTCcsaJpifOCZbYPGiQDvthUA0WwIan
         jvoHMLoF9l1v8IaoOMZtr8hfJCRDqTEDBajoO6U8VGTKJVD9jYIGL/aSzHmb8VRNqW0l
         D2MsH002qRLeTROUKOZv5adGP2ViWjUIaHkD3A3oVDgE4eT77hz+7FAuP0mANFmtvvH1
         BrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648439; x=1794253239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXk4plWW+OCeCf0/xrqLno6+gljAR6KSsv1QLQj6fLU=;
        b=iwp5fYk5eebM0XZI+pViRP6tBF8AMoASacalr5W0MgAGPhq2wEzb3wMMF6p75FGZC1
         Cfl/QoC673caNiJzph8fp4JoKP1g7kkSZU/cZv4npKssaDr+cItV0rJaGcHsWv5DW2mH
         uZbQC8iO6NsZg0Ra1tF2B2/fiUA0hBrBzIdkzjOupGXmi9s7VgsmIxL7Qj/3xy8dENjB
         njSXDF9oamo8NF7ix6TP8cDYxoqYHUdGzlN+a/deJJXBODWvPbL2Lqsz8iZzI7LUJqTW
         bDRSdl604TdSaK2ALdtCv6g9Oyibr4e3JOYXAcO/nBLYCDCx0U4+kJO57XFkG2z/2ZgN
         6vXQ==
X-Gm-Message-State: APuU4Z/hDY/tQ8trsb5VWyedjd/qtbSPl3VjuGjSYY4r2W1i61t/tjeC
	9aRrsXJUmkdanRmgpRDC0Vfht3N954jdeG4a1oppnBLnCfWAiiEDBOpkGVqNfrSP
X-Gm-Gg: AYBFou0fEEOI90K+ww4xz2deDygnCfDyH+vdblpC4UNYVe4igVklmDdG4oStg12rsAj
	nVqpU/wTLNKcmb2ZP1YTvfuigK4BqdtY+uN1UI207aksHteSFKYFgGCqt/SN8Za6iSisXocX8Xj
	D/ExdmeR7kBytxDSXOWLX2YITyQ9iPNETkWggJ1tE8RTwEjIgCIRJIsk80E6oU0JdYWdj/4rBOr
	9SSnivoiyxKm0vlNrXJqNUfPzbxY0S8mSXkNScw7kgLK3/uL3d5N0clFq704tYZFquM6xNPdho/
	eZnmv+tvEkmq4JKRHVK/mrdA08DZczioBrvx2UN0AtqlsXqmU/3S6qyHsTE+qbvzeMV7Ht2LSeo
	k4BIkdfTpRPJcQILtPfO7AUixbBCNOrTxJXvb6Ixfysr3DfqrUkUpqHj3+2O7uASDHY32gvg0i8
	K32GxLqpGRv2FpillNou7fUgMDabxVhd6/JQCv3XNDIUlYafI0l3DN/PlvbDaHZjCRKN9qz1Fs7
	yW1Xxf6Iny3eJtbVqFtjd+HxfjNFrGjEwdB9icB67SxH4VYR2qUKls8AVBuUOcGaQtRWAYu8Wk5
	8aIxvwGVtPjioM27USrWe180m9M9ap8MVyHyPql+sl7EUKO8AyVFr34+3uuy3tzBmMdoBjimkfT
	9cGaFW1phNXMr5AJcO9JzdYALXuZ41U0j5dmNhll4ZcQhTw==
X-Received: by 2002:a17:90b:3148:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae897364c0mr8466891a91.22.1793648438705;
        Mon, 02 Nov 2026 11:40:38 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:37 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 17/20] f2fs: support subpage blocks in online resize
Date: Mon,  2 Nov 2026 11:39:49 -0800
Message-ID: <20261102193952.3002018-18-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Resize works in blocks, segments and sections, independent of
PAGE_SIZE, so remove the -EOPNOTSUPP check.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 91f792cf879f..67ed6be8952f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4250,9 +4250,6 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
 	__u64 block_count;
 
-	if (f2fs_has_subpage_blocks(sbi))
-		return -EOPNOTSUPP;
-
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-- 
2.56.0.317.g454f8302e1-goog

