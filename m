Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96732F7F07
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169738; cv=none; b=O2/dLE55N2dlm+1DcI7/l1imSfUwYR+GWNARJmyj3oxTDa1tqz8W01VJaOzks8zL3lMpFq6x1fcDnjddrYUxlimz5MJJ3OhoH+AiS5j2KpZY98oQmQxdd4fede/SraGVLkSUqOZAXBeQkFhul2pJwhkvdNC/p9IinRkgsaw1Oa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169738; c=relaxed/simple;
	bh=idtG4BIfN1aJLK/ksdnNSDY49721gEMSnNu4pwKBRUI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OdXt4vynMr2AQTcX1yGOWn5XMI0+SnduON1cbqn5O/GxM9N4nltR5cldkWANC9W1lG7q6B+91zfwRpXzHbWcBuanNbxiQxEPWrCCZQES9QwWCGIatlHMHQwuKx5Zyd5GQFrouv9LUIpLqmkp9jAuSjPrPGrH/DBBZer94y8meiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhlkfC1d; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhlkfC1d"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so460765e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789169734; x=1789774534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppxFABqW1va2B/u/vT5bBn5AGNi29bq2r/je6ReMZpY=;
        b=UhlkfC1dU9xzfybg3KvN9q2bF/upCbIJ0l4UwXSTc/hBPhrFuaveOgb2eXoX7H12ME
         gL5rS7rHcpQQ2/z+PIkutyx4jXLMmDLWfR3ku7teddwRA+PqDlOTXO2jfLung7v2aUxT
         EuAe1jyyeNTFG6taHFSF3Q3XchrymEty2pd+unfqsaMbQbwn97UY9hlEepcCdskVOCEu
         VHd3/WygCfyW3gArQ9Ri1b6baQQLkHL9fw9jr9vAH/eEWBUAy0YAnt7LN4ISL9RHPdCo
         XwNHYqLNZM2TmI7s3abuBJK1wL+9pNmN961zkLE/RScJBkIaMjhJMvdhuLtrnrXOPolG
         TsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169734; x=1789774534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppxFABqW1va2B/u/vT5bBn5AGNi29bq2r/je6ReMZpY=;
        b=AR5S3t+TxNzfw6RPARmEoVFClLQwKxzolpNH+YOR3NewHLaJHA3CZkRdRNcIJiv88Y
         FWV3E00BKOTxAO2H3YHQUWGreB04Yfao6+7TNq6ij2WQj9Lqv11wrCowYAd/rx4G1PFR
         GNmf9oCHMbVyWqyY48f10f6Mon4seL6Kbu94DM9rwT8/jpQztX1pYNUehVc3/euLO5J4
         tRi8wHojvjZxgexYmLl1FByi8oH25w6aBfeKqR267RDSChMiyCPWa9qdZE6K96m4ttTb
         /lPgv87iukM0juZDlyVQAsuAmx8A3TWaN0ASkBvUQNVIO2UNXoUhk4kRdZxFcH4ecEZd
         aNrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSkSoVftLrWWM1O+hxZX32luImT/JJeVEbbaTjKl6lj2EpHNjKNY97pAXyMtA+Z8Iff99csOEKDIUMwUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n6Pu51K87nzksGg/UFNsZtO76it0wI3eMHV5Yx+ORNEaF6bTy7
	EMMYEdze5QcFbbpVbqbHRiG/vQM4nli0Bbgev73PoDua04vm5FEm92vg
X-Gm-Gg: AYBFou08WqVoq/dWF19Hhfgqw3G0+rwKM2byQuYdehcj4dprbmhu8BS6h7XA9PB+ig3
	FjGr10GlKplnN9iumE5IzmLDwGv0oTT/6YVpJVqJT2R93lo7cdyKihKgz/7bzy4Byv4cBYE08Yi
	vRMtT4ujQFHnTIO7Eu8I+ZNC2X4h9rdmjy1d1WclXebTlIPTGNCefLtnUZw1fQYf966a+mNhj1B
	obeA/p51YeOdBtDjXy+ZpB2900GlyfoQ5BCwZ1Q4W1XQqZuLxpG+bkOH2fLQdPPcpRBBMLQeAfs
	Lidd86P7SPnjP5wznyQ95pvmBl8Y3KWD2eCgBC0ZU+Ozadko9tvjkfF6GYMivs8HfzXsVyhw6r/
	seVJ8ETbS1M9RRrDRdL/Jde8TsuN3TmamCub6tH9ZhIooDrtrjKIH/63Ki8RKIVS7nun7UVvYHj
	Ki862mu7Guk79/pjADsEhcCuJ/uaVn6aCT2NLh6O/q6S5vf8l/vsi1RflrLpocZvK0QQZstKl5n
	n0a5zyfAPCS+aQcK6n4TqYQMUu93TJae8kTJO0cjXgYPhaPGk8dSHJRWpsJPpBKOY3GcPMvWues
	8iPlFWwTGuyng6I8AV4bbxU7EmleUsLkHQw/
X-Received: by 2002:a05:600c:4f87:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49e6cbf758fmr3040445e9.24.1789169733994;
        Fri, 11 Sep 2026 16:35:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm172107795e9.10.2026.09.11.16.35.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 16:35:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] block: Fix the thaw_bdev reference in bdev_freeze() kernel-doc
Date: Sat, 12 Sep 2026 01:34:14 +0200
Message-Id: <20260911233415.31271-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of bdev_freeze() refers to thaw_bdev, which was
renamed to bdev_thaw by commit 982c3b305843 ("bdev: rename freeze and
thaw helpers"). Say bdev_thaw.

Fixes: 982c3b305843 ("bdev: rename freeze and thaw helpers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 block/bdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740604da145563aa8e7b55c4f627467..fac74319e9fbacc9cf2bec4a4b043b837a9678ab 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -292,7 +292,7 @@ EXPORT_SYMBOL(sync_blockdev_range);
  * The reference counter (bd_fsfreeze_count) guarantees that only the last
  * unfreeze process can unfreeze the frozen filesystem actually when multiple
  * freeze requests arrive simultaneously. It counts up in bdev_freeze() and
- * count down in bdev_thaw(). When it becomes 0, thaw_bdev() will unfreeze
+ * count down in bdev_thaw(). When it becomes 0, bdev_thaw() will unfreeze
  * actually.
  *
  * Return: On success zero is returned, negative error code on failure.
-- 
2.39.5 (Apple Git-154)

