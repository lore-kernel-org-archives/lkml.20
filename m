Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193CC403E8A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763315; cv=none; b=eGCe/mZqkrcHr0eL2cLLqhFIgIJ+fq7ErFcEclx3BvFLUf4mg0apLDEwqyT3b/q9Vt2LG3/v/HIzFmaa9Ogp2olYQoILgtpGjVROiuFEvfilDmLKGUlt/bxQI5g13Q0JOnvDSBgllLXMVgGKwkIjqWFzM2GWriCFPVPWKiE+QVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763315; c=relaxed/simple;
	bh=1cJY6sL+Q6oG2/VnhFlaXz7tgv3rZc5fSR5r9wiilcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSGvPbFgf8c2we8iW6zpYSPJek6YzEXp8SDr6E+nKJcxI9x61va8gBrSta/o1EIq91/Zf4WqMRUe0ynneK4YHdD8iP1vO/TrGQvx77+Dph3CL/9htUguKZoEdzxAZ+6O6dCwSThDLsiEqBIRXTFb+DtumSH3CImcWErD0sj7Igo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9QbOWEP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9QbOWEP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d58efc7356so40015095ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763313; x=1789368113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvpO/+VHQl+z4w7f6yOyVn2oZshJZNt+Vlm/SjhRNLI=;
        b=n9QbOWEPubRmudynV5jhJHNME6N0aBKMpxH7MFo7ob+wBluIf59xWfYxptknsKtU7r
         c+zAKNtY9z1SzZT5AKfDujDWOOzvhw9/V/pedX7IvvtVuEzmZz/vg3BSlHDqA2KSLNar
         fAF4SN/iq+xWTW4XORM8IoO7smJOiCMhb49Dd6qi/EL501Q1Ra1pGYpCn8lta5chuoac
         eqxn9kSvTYnVzs1UG22fn+bAG1anA3N92RlXGR13p+rwHEQlhxSyF8GC9ZfKfECdh81r
         2uMXtLI3+8ssDhVgsvxuplUgSfO8SEo3Grei6DwzzdXHmynuhM+Div8sFLqnIABf3Mik
         b5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763313; x=1789368113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvpO/+VHQl+z4w7f6yOyVn2oZshJZNt+Vlm/SjhRNLI=;
        b=aLYJ0nDW9DfkjcZPXjOObQmbENygVMYNswOXjAideqSiAK2WtGQb8rAXhZBXbQiYpi
         kXYcfn7A907OqIwKdi7HrvrnTNKiPLSnGaNMidv4Skc9PKaa6BdwccFX44t6YYFJ4jAf
         +3bDfFay/4eV76lbUncV9Ontcie/u3paCnbNnM7WKzP/L084l8upF3A8dIFIr8zk0tpu
         FiDsJ0f4x+53pwJ25oJATV8H/EA1zHsPt1Kv2rkgrZjS4deV+kw2BhjTNJbj8ojGxbt+
         wtJhLlaFmXYlwk9Yx20Tss0oFfpBEZRGCigFvh8mkfVf4xBp9eNb+vf2yfwG7Rf1mV5l
         /sHA==
X-Forwarded-Encrypted: i=1; AKwUvBzfSWrJ2wDONcqUxUzcY7xp4wcK2Ku8sUjkNcJADf4eDucTmZtevFGqxMdtqvqGWkzO8vZWneuvhEQeoAY=@vger.kernel.org
X-Gm-Message-State: AFuF++lr89cnJdSrHaSz84xxqQzmD5NUgyZdQYhkTD6OUQoKocLbMfip
	nAreNRpBEHkkc4HqqrVRvcIMTeyYChazznw9MSEx+2/r6a3ykp025OYM
X-Gm-Gg: AYBFou1PEpV7IvxIAus1rg62ZerlgCQCy7pYWJ87s4GgcTcnem37qVNLHq6VaTuBYHW
	AteswmqEFQ24cR+sj6aK4d7ibHo0ONVdCcrItW+AdPT66mDJ3OshYYYGwMVWe/Ehf3cTQM0aNjj
	au0Oir1XXDaYud2b88KmIKugJJLl8DRwwpL7ouKJkLjljxTXE+cpfEMzhhc2kp4avPbvyn1/sCk
	yoABUyBH8aK3oplDTQTOR4LulDGTIjgU5s+yfXs/cIBObj4v1dd8dKpFMkv3T5xtcpYqExthqqt
	6t9gBgKTrzVqcavTdH7fCOQZJUgiCkva5DiVCRXUMKyeZ+E1CAVmWNCoDMO2tPKqjvzVD+gk5UF
	rt7RiPksPAXRvkkA9U32tVC+Wjr5yBLNpCmepodyEVaGw7TZ1FbyOe52wxmkQzeoGgzW8sDFtWm
	625tBzBPt8ygMWY8rMoXxE/dfjPuHBeMc1kvAFMhp74ktBAD+QY+daO9R9vOIdwWIDTiCjkoKhv
	NIB7JKpNv3p+776FVwnMyuZ
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr31094553a91.18.1788763313430;
        Sun, 06 Sep 2026 23:41:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm22413038c88.0.2026.09.06.23.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:41:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	x86@kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Ming Lei <tom.leiming@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH 2/2] selftests: core: fix repeated word 'and' in comment
Date: Mon,  7 Sep 2026 12:11:38 +0530
Message-ID: <20260907064138.38689-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064138.38689-1-hemanth.selam@gmail.com>
References: <20260907064138.38689-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'and', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/core/close_range_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/core/close_range_test.c b/tools/testing/selftests/core/close_range_test.c
index f14eca63f20c..88e7ce6ee977 100644
--- a/tools/testing/selftests/core/close_range_test.c
+++ b/tools/testing/selftests/core/close_range_test.c
@@ -506,7 +506,7 @@ TEST(close_range_cloexec_unshare_syzbot)
 
 	/*
 	 * Create a huge gap in the fd table. When we now call
-	 * CLOSE_RANGE_UNSHARE with a shared fd table and and with ~0U as upper
+	 * CLOSE_RANGE_UNSHARE with a shared fd table and with ~0U as upper
 	 * bound the kernel will only copy up to fd1 file descriptors into the
 	 * new fd table. If the kernel is buggy and doesn't handle
 	 * CLOSE_RANGE_CLOEXEC correctly it will not have copied all file
-- 
2.48.1

