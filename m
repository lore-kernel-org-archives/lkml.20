Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3EE470456
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518966; cv=none; b=eNrz3eqIplrbYpTycsZ4XGm7LfnJxV/eM39Z60zxoOWnqftR8WNhOWp/C8MquOqcxVfV5lXN2Ai6PsyoeR5XBKhybCZxY4RHJYaNxYhEB3RcMku2KPezrWbj4LUu+iD7HhRjGdB1G7oSYMs2bY4PWGx3uIJ68UzSfunw8n93euo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518966; c=relaxed/simple;
	bh=eaDqc+KS2JyPXBBj+soX3Rz5sKCo5S+dz6ZJuOsKyU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ea94hT6x74duON9YGzCBcung247fxagYX6LoOsJlwSvfPYequ6wLRylk5riK8tbj9feZ5CLRBO00R4JMcLP1ykt4oDSy+rO4PtsJvInzNoxgv2NfxvYmyUfly2udh9fksaxxrDemaFuqmd1QXAVU2TZedX0KVeR9RZXusGPDIVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiL0kLQ9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiL0kLQ9"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1c7364550so1089316a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518963; x=1789123763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+p3qhdKCBh5IlPhZs/uQwjI5uPM2Gq0BK3muJ2QsC0g=;
        b=YiL0kLQ9FWlmXhT0N8g0TL7QSNZ/pRTBxt7vzx7ntoG8JHRZ9URY0gYX8aOSrE86+3
         j7LBnM4TlvGqev0h7CBMip7Z1IqVcTi4jMPGnKkLXrtTSYOqnJHCvBclQLSRGU9t0AWU
         fw7OHBO2uGg9KgvpfgB+kBTc68l9/21rKVNnpLnRlg54OfCic4BPQMaksP+DH53epPj0
         jsHQWps6/1gZVPxcjsoLXG4cBsRv7M6n1QUkRDqDp2s8gxZhV0himcpXbY3/3cr35Rlg
         5yhYu5CQ/USouBdk9d0fAcq+LhihyEt5YZN7poODF7BIlTGQEInFwwHTrHnQojfdDfOM
         KnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518963; x=1789123763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+p3qhdKCBh5IlPhZs/uQwjI5uPM2Gq0BK3muJ2QsC0g=;
        b=bGH/UVI65LUa+bknoqsi1JlP25XcTrNEaBsDHjLWN8ZSPUbZn/A8UVmRZHLle4xafA
         uOKBjIEEguSpQ+61flkRnEFYzp0UACaYvxFDOZHRO6R/viCQGzAxmBvn2qWPRF6axb8N
         JQtTtc/ndOy11mIGoa/Mqq43Fgq03dqhtxNQsL7ouisQ1I8Aj2owZ7ZPg2mWN+qPJscR
         MqxTFKhX/q7UNMgzjHewyYmvw4G1mt/lXdMUoesBW5L2zgDtnY+OW72nW9kr2KLskrLK
         eTf/AqNrkbBdF/xIlmTZe2INYLt6G+WWfzhXeDUUvMuZ+Av0X8io8RRYw4rNLVzNiBiK
         2gFg==
X-Gm-Message-State: AFuF++lbgD+pkcWbeMRVOWYKwxacY8JOXeZritzPy6G1xJRIMp3Jh1vC
	lrtOfwjUzlzJ0QBq6FubPApFrgOjxVw5FlIajV75g8NFucFne+m197Ft
X-Gm-Gg: AYBFou1Qf/1emxLxKnvuMlOJ87POoL9Jaqe6UgHseZFyxY8R6lW5XfPLQGQzP6cDYdJ
	XDVv6N6mQJ7/FrrORKDLnlIp5Xao6GQpZIrHubIsTzBaz2yiH0YJSBciRVoDe3JjMNDAQY+dZ6H
	WgL8rI8hewOLiO+ddags/xKdUK7ewQPgCvYGBXANxEi6i24Q6R24hM1zPELYYYCLbJUsvFmO1Pw
	SjQKhi19IJmb//M7SiF3vFTozOt+JSh9OOlsiTK17GYZvPAyZsMZaySO3BlECqbXm1U6nROyGC7
	/CSiyyOD3wI/Q1fd3bBCkKriTI78kGSfdo4urWDlsfe3nLzaSdMu58SJ4RI5yHyfokX5mxAaAuM
	FDbI5podx0KH6tGOv3rO1ViDDMS6mRrYYUF6sfo+jN5KRoPGp858Quh20vMWfeluJ6WjUFTEaRc
	rX3cY/aYenRR25l435+kelspVHIAsVBLpbVttYKIMlwBTvxr0ass60NhsvCRFws+NPD1tIHnxjE
	eY5KXaOnNaC9c7a80MDY7nDtgc=
X-Received: by 2002:a17:90b:3ccf:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39b26101277mr6729394a91.3.1788518962867;
        Fri, 04 Sep 2026 03:49:22 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm8583927eec.16.2026.09.04.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:49:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 5/5] tools/testing: fix typo "mergable" in comment
Date: Fri,  4 Sep 2026 16:18:50 +0530
Message-ID: <20260904104854.25272-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104854.25272-1-hemanth.selam@gmail.com>
References: <20260904104854.25272-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "mergable" to "mergeable", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/vma/include/dup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 4c58487b764e..302a6774fca5 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -353,7 +353,7 @@ enum {
 #define VMA_ACCESS_FLAGS mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT)
 
 /*
- * Special vmas that are non-mergable, non-mlock()able.
+ * Special vmas that are non-mergeable, non-mlock()able.
  */
 #define VM_SPECIAL (VM_IO | VM_DONTEXPAND | VM_PFNMAP | VM_MIXEDMAP)
 
-- 
2.48.1

