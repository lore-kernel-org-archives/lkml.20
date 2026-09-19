Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84113921DC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856257; cv=none; b=ojF6eLyuU6Dmazs9CXTSf1yv3itis4pKHke+sZiuboN7as8rlLW5QAyGCa3xoehu1MdRDWuyVQAKFO4py+UVSbV/fCAkHpO0BoceWUn9i6obqv10pV1A47kA+qS98VE4qfLWhYk2AdSCKh7lPPvdpvYFTrJ8PDaQLoIJ1+5GmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856257; c=relaxed/simple;
	bh=t642PwJWjojmaMHJHUOBwNZC2gg85Z+KOK1iAR1puII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zq2783+eQsdRKnqTxSBj7OQ+fH295qdugAi7DA7xlmkUGu+p1sKmTlFEXSVD+UJ/tEBtmAbQpQk0DfadkFbWimSGGl4kABGWOevSMpf3qJ0EnQQVl4P2EW3Otv68vqjgA1TKyNm4nctPxCrhSWv6CBA/dm6L9Ht73OliTPCzvGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEgOvEhU; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEgOvEhU"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1714384a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856253; x=1790461053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoTvvBhiuJUSempXXTk5sVn8pgEN3yxhBykVA3MzlQM=;
        b=YEgOvEhUmLfVUQT4Dt/8Qdj+pzc+hcsqSddqBs62QC8ixcBQJxGCx07AiCzZCRkkO+
         lTNCvTOK5YLzh4AMubW+7yoEc5GSymrQ7ZpHutjMu+doz8pm9jU+OTFFgsHXBvJlyaen
         DOub9HZ7v8GhE5Y8qsAikSKp/YAEkN2iWBkAJOvgr6etIWc1ak90Wly0JuL1HU+dqtIF
         cIH0qAZuGPTeShmrJZvuEtLvvcL5ox6/wxUK1KAGzIwz7iSJyshfgh6O3+q59lDiu54O
         fKNcZIMFngX3NaEq6X/LY2AUZHiCBrflga1tP3EHifXZheP+aJ/NfkWa1tBZVVxv8df/
         eSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856253; x=1790461053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoTvvBhiuJUSempXXTk5sVn8pgEN3yxhBykVA3MzlQM=;
        b=tP20BMm7PITCWJJbrkOTWPt7GyJArhrbPO2iUeXVP6FbmUYRLv1Rai1SxJF5Sg6Rgr
         3L8qlKe5fXUX5bwBPEyBeA6lt8D47qbwdQM2O1UySB8aSK1C9l2XDsPwr4Lb+5FsiTso
         /9yGVIjsr2ApmZ3U3Azk+CdEBCwk3tW37gv8kNWQjEZry1/mi//iEsW2V+hfKM8usCq/
         UIx7Ei9cZso+jTpEHJ7my6kyi3ZrfTxl3nz5Zkj1y+4Rg1X2/nTXdYkMDkNlW/C+JARB
         Ee/+K4+Di6kGjMMvf4pQbnSzxg0XjXvZP37l7Wn14NUAU6t5XcP+KHoG2HLjqJdMwGDT
         jqlw==
X-Forwarded-Encrypted: i=1; AKwUvBypbotX16h11XoanK73t80mbEUvyL53PgLoPP9aGQikI4uBCIwyH4HOtoFUoos7ODHcFM/WSk73PisQum4=@vger.kernel.org
X-Gm-Message-State: AFuF++mrIe3vjSFXOpUkq4S4vJD+kGCGEO9vUmhAQDfVQMznH/DNvmIV
	+sAAbGtHhsLx/9LMXMGX7Q8EPlAvcta+naL5BuZSDeSY3eFTxvdFQtEX
X-Gm-Gg: AYBFou3v+yzbd7ApXrEvl+WxCbwd/3n+7swuhL5xa1/9cEf2O7R/Nvv5vOE0tKxkg9v
	2edt00QvBtbgBqzemROnEzBeW41lXuSkg3DEMbtUrdNj8hRCt29rHwqCsezvlI+vm7hz7xcODni
	RXnuVOn+8Jkf+d8poByv6EeD9aC04c6ypnWHTYIrQV+zf9UYYtXR4ou3OFyq57kFcJOO/+vGj+5
	W7tSfRibQSEaz1Dc46gn1ZGPOSrsGw/wFKcyUeUY9K0QOUmYzc6l6a5VvJ+d1X0eFG7QseLQ7gI
	I9DVbsEjnNIQIiV0a7DN1jQir/vqePnws2TesSPRXYS0ewZU6x4jmbKXpiEeIIC4Oa1l3Y6UwRk
	EbGFrr89Psy98NIooala5TIdp2lIlQjaTAbqLAcnPZLzEovgUvtRoQgMKjSrx/7cfZlLTgg2Sr2
	YrK847ycMivUyelGWHvtdvAmsIcNWMA6y+scoYmA0Q7mnc+siP0wBIYfB6VnU40MDxUvo8HuQJe
	iGMpxlsPPdWzyl2fvDjJly5KqlnNZeFOqFqbOXamZiqa0g3DAbUUIE5OCkQRj1vr2Aycq3DnXdu
	dA2wYo8Uig==
X-Received: by 2002:a17:90a:da8c:b0:39e:1310:cb36 with SMTP id 98e67ed59e1d1-39e54d10409mr10479870a91.20.1789856253000;
        Sat, 19 Sep 2026 15:17:33 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb372b7sm6340464a91.15.2026.09.19.15.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:32 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/namespace: reject bufsize < sizeof(struct statmount) in prepare_kstatmount()
Date: Sat, 19 Sep 2026 22:17:32 +0000
Message-ID: <20260919221732.3707664-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In prepare_kstatmount(), kstatmount.buf_size is initialized from the
caller's bufsize argument without rejecting buffers smaller than
sizeof(struct statmount), allowing string offset calculations relative
to sizeof(struct statmount) to underflow or write past the user buffer.
Reject bufsize < sizeof(struct statmount) in prepare_kstatmount().

Fixes: 68385d77c05b ("statmount: simplify string option retrieval")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/namespace.c b/fs/namespace.c
index ae5dc64f8b45..7f7905286fa6 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -5882,7 +5882,7 @@ static int prepare_kstatmount(struct kstatmount *ks, struct mnt_id_req *kreq,
 	ks->bufsize = bufsize;
 
 	if (ks->mask & STATMOUNT_STRING_REQ) {
-		if (bufsize == sizeof(ks->sm))
+		if (bufsize <= sizeof(ks->sm))
 			return -EOVERFLOW;
 
 		ks->seq.buf = kvmalloc(seq_size, GFP_KERNEL_ACCOUNT);
