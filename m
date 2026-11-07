Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032339;
	b=hyMgeV3UCIBwTSnaH72NtZ+UQFSiV7TRWrjwNGDQDiJ+nTE/8rDWO/LhNlw6FI8yLtXg
	 qAwL6STeRB4efT/edqxttbkbdtY7MGJfTc3pGCzCpI+jUbFcZFYbW6BDlRBjffQbPYUMD
	 iqagu5iRuBO1qs2M2nm1UmzTdI3obtsrb6YF6nbF4uAl6KPwCq1T1q5EqBe9JbRu0LqTi
	 bIQwN44PLHGi7D6/33hGSHukE/CqAb4dwwUluclsfWIBzCP54D62iCT/6XqakVjtBpxRW
	 vMXe0lXBy3EAgeKkel7fpE4MTA1xAjYLofDC4+xpMVGoTiVkxwVyQCy5OenyCslxrgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PBM2nSAybAfiialNHVzu3HSG2mME3T0XPb7p1fQfDMc=;
	b=lpdqgiZhkEiXlEJQ/fQvzYnkyvWuqqTWrBV97IQjikm5FVfWvEKnMMi+I+XszYK7Ki2H
	 z/XKxU4C5796vjocwBoX4+MjzpK7ftDVWKs5qM8e3z6bW3u3fnkgbGgNVGqqy7+7Qb5TF
	 0sQlwHYeeYk4vPGq9umqYFznaqkwu7f48sXK/Zf92fR/RKJ4azgyuhjSsYCah+UIb+aV+
	 qfDC7kFeSVmiw9+ZkMFaWbFNQot7ZNSNOk1cJOC76SA2hXueYh6iHVpG1/YQ6JlMY5UYm
	 ZIEpZcLKNuu+QxiE5A6WYhD2PxkZcRJ8eeOVNU1rBiYOCHcbGZEnY9CBsw/3fQ28QQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hg67EsON;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4414606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4414606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hg67EsON
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso746061a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032338; x=1794637138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PBM2nSAybAfiialNHVzu3HSG2mME3T0XPb7p1fQfDMc=;
        b=Hg67EsONuRLOXbwkZ4ELqj8Fds30RDcfcrsWI0n6Q+Ndw1mnKP9oTIcOniy7N+k32z
         KsAqvARhONawp6Ni62ppk08abRwkBipsnXIhJXgZZXJQpWlWfjSSppZc77dta1uwv5/1
         h+GPVDh0SVyFWKHWLbUKEr/uVJUuxeJj5V5zgGqqd0fuJ/k8JXxRRGXdKf0zrXypKer8
         lA7za2yi0SEgfJ7XAfUezP7o8qkzg69gft2Y4JCGOm/tnDWBBzp5PDC/6/vNW4kGDwho
         +hVWY0chO/eXjmmoGY2beJgYu/mkREOuQTxbrV1z5OtKLjNqPBopptc7liY+zB2U93J5
         PlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032338; x=1794637138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBM2nSAybAfiialNHVzu3HSG2mME3T0XPb7p1fQfDMc=;
        b=J+F6EY+o7O3HPG+jyhrrhKrSWOYJ4hbY/xjgVL2wqxfS0nFKYtUfFBgmZ1HsnHDhlJ
         Z/0bUeiSvdDVC3gNQiBOzt8dgILnWwevKvfgx50aiZ/SdCBUzk59KUCXn5XbQGrak6TN
         6uhBezQukXz6bqaQcn3TndRet9788Yp8QmHWU0lO2IjgfbEofoazclmjfunJDoGbflZl
         GcH7UBNF6sx1TQenU85iJT3mcV5RSDvWKfhvdWsaYpuN5O8YOQ5eJRch+fLnxpPN4UdK
         HT6Jovm9w9PWN/i/MAr7sarb4UKqU1fMit/5oRgFdATpk/mt2HkB64dG6i/2QPFgz0EU
         cEKw==
X-Forwarded-Encrypted: i=1; AL+hErGaIFjxPeyvhClQSfQ8atU+8sFk2rF3Q2MtaHhcWGfaru9Chro7AtqwSvyOTnHm6nNInlqYxESUantzpGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dvha+ZgXeRi7AiCxa8rfE7JJZqPGqTCFAPjR74jM4r5W87Vrr
	+5rmUtyatlcEG/cexv/JtevsOtUfbQobCwVHomfLkx8yZIa14yhwf3mqWysPMJjt
X-Gm-Gg: AYBFou0sChbwuJKya43IgjTuboC7H1B4p1TJuBosnBp0APPIAm1GD04mCzL8MDaa8iz
	/SzBwc6OEpf0vNSaYTEPGNoQURV8Jl68cIjALJvZI/dv7r71haynYwHRQAplDsftMFHGq3TPPEX
	4e1eKJCaRkVCiNRDHxaRd/5/fSsyWP7gY01jngxGEYnIObuirlP11f8pu2wnxmx1SKI6jxOz7QY
	ImZoKrDTZ+hwOqe1bWPQxgT5TDnbVOvfQKMvfoTPQmI8nKgIj/ZXO5TRzi5fFFafoRt7r15ERD6
	EVA7mvf6OU5nF8Ta7/tGZqG0QIDgU6eZQF+kEN8xHuBdGORpEaQedcp9qPIy0CDqs0rFWg36sLR
	CE9wBh0r8lhbz0OatCDMQznVOeBzxnItk4ECsTt3tsu8xfDqE6rE+sWU35UAdfds4LTqEcygVsz
	ACh2yFQzn7CaFkueAolYi9vml4rHPVkQu7BdcJhfw5EXID5rH8e8b6Nn8ruD2/2u6vf4BOyrt3i
	rMmi5bdpYUI+TyECNeIvwu3v8JNV4iAbturqGeraoEjhuK59vG5+e3jZuwlao0Gde0pJQkU7zRV
	1plUaRUTsG/2hA9wEoPGSNYzJuFONwSp00m10GHhpA7l4LI96wwPnBIMDeWqU6B0zsflh2n3AR0
	XU4rI/IB44cVY1fFluxOl/buft3A=
X-Received: by 2002:a17:90b:5107:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b0db712d66mr4613324a91.52.1794032338089;
        Fri, 06 Nov 2026 22:18:58 -0800 (PST)
Received: from codespaces-2362ac.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b101c28791sm1340220a91.3.2026.11.06.22.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:18:57 -0800 (PST)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: yi.sun@unisoc.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] f2fs: skip further SIT updates for already invalidated blocks
Date: Sat,  7 Nov 2026 06:18:30 +0000
Message-ID: <20261107061830.30764-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When update_sit_entry_for_release() encounters a block whose bit is
already cleared in cur_valid_map, it reports the inconsistency and
corrects se->valid_blocks and del. However, it still proceeds with
the discard bitmap and checkpoint accounting updates.

This can clear the discard bit unnecessarily and incorrectly decrement
the segment and section ckpt_valid_blocks counters when the block is
not marked in ckpt_valid_map.

Continue to the next block after correcting se->valid_blocks and del,
so that an already invalidated block does not trigger further discard
bitmap or checkpoint counter updates.

Cc: stable@vger.kernel.org
Fixes: 81ffbd224e5f ("f2fs: update_sit_entry_for_release() supports consecutive blocks.")
Fixes: a66cdd985532 ("f2fs: introduce discard_map for f2fs_trim_fs")
Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
V1 -> V2:
- Add Cc: stable@vger.kernel.org.
- Add a Fixes tag for the discard bitmap handling.

Fixes tags:
- 81ffbd224e5f introduced the segment checkpoint accounting regression
  by replacing the del-based adjustment with a fixed decrement.
- a66cdd985532 introduced the discard bitmap update that still runs
  when the block is already invalid.

 fs/f2fs/segment.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 51858f64e43e..fc2f0fd8e318 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2560,7 +2560,10 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 			f2fs_bug_on(sbi, 1);
 			se->valid_blocks++;
 			del += 1;
-		} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+			continue;
+		}
+
+		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
 			/*
 			 * If checkpoints are off, we must not reuse data that
 			 * was used in the previous checkpoint. If it was used
-- 
2.53.0

