Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB23346A5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789605364; cv=none; b=eLPKaqtJ6nDQ5Da15xtAqkZaMNBMNeQAQWkg1t1tfRoHpm8lagDldxExAXTTfCPOO09TWNNbGOUUBrs375VMyOAqTeaqmzxfDbZcbAE9ddNXGmu4ODhTl/jcz9gK6uzVnpR6A1QBs8bdwBQtyyKzMWakb7nMC+arOqUVsli5Peo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789605364; c=relaxed/simple;
	bh=uJKa+EA5s7zr0a/1+eXgcUZRVzW4K3hs5659/g48Bl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2O23ZpqF4HosGizbMzl2PdwzWaoEBZnB0CgV6SfU7+uk/ow7/A1dEq7Qv+vhfpl+hKnjDEC1ArAjM/rSXCymDMgrRYT76/9DS4cYKlOD2omte7EjTpzMTbgyukz+Y/v5omRvac5wp6KXRn0gdrcdNMXtVUqsvfvmB9gOtWzX8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjkAWMhc; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjkAWMhc"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so253459a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789605360; x=1790210160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VEj2fyxUopAvzTBRoq/IFzzaeRf7xOyxSUgSKR9PaFA=;
        b=QjkAWMhc4Lhbhrl9GgEWaMLI8wup1VLtCOB0wwORLh07vjAI6X40WS1UfMLOGw+fm3
         /wLbdD5MDzieOBwYkDtQPCgMS5jxj93/l/Jte0J2R4qLbDmEzKrzI9u+DrHC1eDz64fs
         XlppY12f6B16jBcjtk3uDv4+BhjyeRb/e2uZv0zMObrkPgYE0htt+CzGB9XR4bvdkpF9
         RkahfkzSZmVleK7nfr5BKX9Es0qx72bmUQiPB4McNI40sLnPFMZgiU6uraZ5aTRodeAp
         dgBz2lmoh3uWaHsZo/L34WSxrI2w6ddtXjlWNzCuw/BlYde8JNkV2fgGGDSnOekwV/c2
         KDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789605360; x=1790210160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEj2fyxUopAvzTBRoq/IFzzaeRf7xOyxSUgSKR9PaFA=;
        b=xE4p3foSacUJ+P7yjoAxm6pNwgTwuFchI0zea0slJzmNY8Te3xHlTqNecflWu1flKL
         Bbmwds3z/tKYUHlrEFt1P9jiWvEAWg51ogMHUUOhlEjcect5vrvKwSbaajj/8YwgRg5N
         PB3eIQj7yaGyLJw26GFl9w7qTbl9I4DbdjZpG8dyiOocTQcAIOYFKRDsfSwviaDZEaG7
         R1Gs6x2qIlqWB1r9aty9oFvtgk1v/qH+iddkoTUL06luICIHgSFhtvpEb3H6Uak5JiCh
         vIGGVD9W1Qb50VVNggXr9ZaO3IcwFD6KE+bfSA6I7v7WBkS6MYWovJyhEcD4lKoc24U6
         4nwA==
X-Forwarded-Encrypted: i=1; AKwUvBwhDL03m634dH44XmADo4E3q0nqifA1v3HWOgtizKsYKHUCV6OxB9i0kXF3rJNpKueoC4MTE3bvWRsiJyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ltPFJkEbi408vtMAxkM2KLOti9nTcosLpum/LIH/03mxd7GDhh
	wP5OsJ67PXHHP+VTy6s1J27SVKSOetqJ+cILwSm9zJrUOPNm84sGX3s=
X-Gm-Gg: AYBFou3eV9Md6/2tpg9Begvrzfz3z7fldAtG6cC8Tik/fi36rVnU5inf6CIvKmxDl78
	PChJIQ/RJwIV9L3lnOyimAbjsIr7qpwQgffHtTxb5vQbcmkf2XzAxT/CvB2UWgPwP+t5MHndOBf
	qC3bkrbEzz3HnGEgRfrwZCZI1X21lCCMRBgZLNZsWvqU35KV8mQQPycE12GA2NPmC2crsDjY3o5
	XTSYBDmv0s7Q4uSGbLtouxLLc526Z1YY739BzKYQsCMhIzRTBy0ndRvrkBS3BQSct4wiNNoX+hO
	HohqVBbkCSIB09cHFeGr0XItcbbUYukANzlkiQC7SSrx4fOqP4FjsN2/DgJgAK090pjNoinw0B1
	iR3e+4I9POdOoBj8cMMmyTsUvoij/tDrTSKgwic+92JIcXNwBjS0FQAFTzLtyo/H7+rRwIFASCS
	Ar588QRjkpfNBaUPycCcCdrcxwmHNLen3FOhE4+pb8b/4cUnVBy4hlG0lUSlf/r33Mof1QaCWq3
	R7EJZxZIAWR223GoL924jvt3M4=
X-Received: by 2002:a17:90b:4ad0:b0:39e:3559:12df with SMTP id 98e67ed59e1d1-39e35592079mr3560740a91.1.1789605359950;
        Wed, 16 Sep 2026 17:35:59 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:3990:d106:a51f:be7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36115cc8sm1722374a91.3.2026.09.16.17.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:35:59 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v1 0/2] mm/damon/core: fix the size charged for a filter-trimmed region
Date: Thu, 17 Sep 2026 09:35:51 +0900
Message-ID: <20260917003553.2465523-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An address range DAMOS filter that partially overlaps a monitoring region
splits it, so the scheme action reaches only one side of the boundary.
damos_apply_scheme() reads the region size before that split and never
re-reads it, so the quota charge and schemes/<S>/stats/sz_tried account for
the whole original region.

Patch 1 re-reads the size after the core filters have run.  Patch 2 adds
KUnit coverage for what the function charges and reports, for the trimmed
cases and for the cases that must not change.

Donggeun Yoo (2):
  mm/damon/core: charge only the part of a region the filter left
  mm/damon/tests/core-kunit: test the size charged for a filter-trimmed
    region

 mm/damon/core.c             |   1 +
 mm/damon/tests/core-kunit.h | 316 ++++++++++++++++++++++++++++++++++++
 2 files changed, 317 insertions(+)


base-commit: 892f5b3b07e5b07f2f29c87750ff94fa58dcab73
-- 
2.53.0

