Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871383;
	b=QWXA9dGpKZowO3KZbKemf2ZETJ/c97KrMxGP8bevFiig2TsZDu7arRlPATb8vGhO3EtZ
	 8Xvvdoo9FfSDdjZZmxliXr5vSt70+LyXXpG/hOcp7rihnIxv9SIc94ulB5ZKGaAxmhuNT
	 YchhnIWc3GHXEgunLWpPLitquOaotIRHOID4l7+Xplr/2XoJSyRG5i/NdqNw8a2ulP0sz
	 +Q3ucPjS1rm4aErzA3AEu9eUl3ltSjNHNHjBDlI3xIHbtXKQ4LAztrh5TLbXiBSeFE1t4
	 a/fP2crglZn13lfvbtl6hwsmsK3EYW3K+3GHZo3esWYUhr9Ftw6kgowWpB3FivTMU5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=bUmMuvID2ld5jATMeQfYWENf+3/lY3puiHjow/VO3i0=;
	b=zOuFh8vN2OHFPOUl0GnPwO7LxcdYoi+IuCJHh1YSw78sVwLvJCSQAVJODAGFRguL++gO
	 hSPGvw4vv84OOM8QlE3cxDNUhQfgOP5xYra0KvpZXWPwzzdn7UUGsMrYt+GEIcFRpUHj/
	 hqBBg4zCPFiq9mOx2XHXlkss4cW1bL45F6wM20/nDShSPCLsiDSFBkm+IsaQbq4Kgh0Qq
	 j5pbU1WgC58F7ktGn7mo9eps3Y2iI9Aj+7+OYG3qVk7GktA8327jpGeMAoWQpWFpnSbKk
	 t1GrI+mdb9qgOSQRDrwZTcojURj6wAAYaUdhM2UARe/j0Icvvh6/gCSlOjBolHPOS1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQ5ti9YB;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D007A606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D007A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQ5ti9YB
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2832241eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871382; x=1794476182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bUmMuvID2ld5jATMeQfYWENf+3/lY3puiHjow/VO3i0=;
        b=GQ5ti9YBhBLI8rca5O7j3/fF5QvsVbW6Z4RDVHVtwtvTmFEQlkMueeEQuY6zWQMgds
         R+Y8kJ7Y8f+ocmBcJaxc+drcuvEy7wg2sfmsXWgYdkGRWEhEbWlUIPKLZWwpKM/yCsJU
         tMOriLanhxNqfrNHNy6yW9IwrFam8I5vrmBgk5zp3uQwrk3nxkqyilWJK5HdfhZZJq/u
         rZBvmIlYo4DtB3ViM5Yi0RnmqA9ygHJR8S7h6ymb6H3T8Yt7nor0yN0BXZFSBXulNzMX
         AxKBl3axpEDLlqyz0BbFDyL4jaU49iiXtuw3c4+x1uaeDrUzB3oskEgAOlaV1Q3Lo8CK
         g/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871382; x=1794476182;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bUmMuvID2ld5jATMeQfYWENf+3/lY3puiHjow/VO3i0=;
        b=qUopWPspyWec64qiBvlnomi9kWwj3VLCexJeWpL/a+a6fao3gDkJ6amVSWY65TNIYj
         XJOKtiv7NouI43+yc9gI4+JgHLktnbu+H9VIKaegxCub3sFhj33xGf0doY0jnmG9SJja
         zyacRbdEUoYyRtn5urjLqtBZF49ADS/WZeKnGZdUqDlEUAVOhJs85OfUNUmKrCqlinom
         5oFNPmDQe2AkYd6WRYrCrjy/2pFKbbdJIuGcZMlQ81RLm13znY+EKENdUDMF4UCdtIxM
         901n2JLoekkVFn+8t/AekN2aaRnzb2ajF7NhiWhjHNhHEC30M1EeDxBlkLweTRlAVFpE
         rQgg==
X-Forwarded-Encrypted: i=1; AKwUvBz0bWbh5TRm+HWYg6cZzR4XWW9bzIlpamUmHGOYRHMQrfDjDwVZJ2iXqcMivER8T9JKUsbLvWb2N6IU6CI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a3WXwqAk/l47h0YcmHK4u0PPcoPCA0gX28/CIrehfQKadAk88
	BjdkEG5cdfz6Gq9fCwa0ybtpsK4GUeruKsQddBzlCzH1wO84/0laIxF+enx3HrGst3hbAQ==
X-Gm-Gg: AYBFou25RbsNqxrCn1rIrFeVuo5E70jTkLn/ZUuKQplTGvTYVnBvhH5TszNexb7gEiE
	Uz8+ch23UHp2esGlx0GbXaoM+0Cnev/xyukRziA+J1ai5zTrcReURlzgPND6aCneTL8QP+uhrVH
	k2ib6cZ1DC0xFotrp/ialeeWZl9O4nmqiVQXC+ks2wDTWbeHL4UH2odn/D/Awn3DzszJUmTuZ+f
	uU70wXEtCUTnqc/kRrmsowlZ4M8R0W7egUD0g/7Ecvy06a9YNm4JgWSTF3VKOcBLVPaZ3U20U+I
	ij/jWf0CBTbu5X1RPwXyn0ynEq9gE3GpVhxBAv1cGieKiEbesbhdhEMlmRBDR+zJVUSxUuvbS43
	4gLrRKPxkf329iIscCRZnpRlN42uoL629q6XrQJ4smkhM4qb4WKhFtAe4V1LMYDA3VtddCvmeKb
	haXXEsDWKYf4cPUOjO1n/4qa1e7vmRPTwxxYRxvRle7bNvohxKsv005MxhqQyNA9yHKLCnAnUsV
	jTgLmgrZuSX53CBEizs4psGz5HJJt1b6QGB+oMDFn2P/bfUzVRdJNOzSnqjnbKh3n/i9QygRhVK
	MvRShiBGrBf/ZB+T9r4sp50s
X-Received: by 2002:a05:7300:fa0d:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-36d7feb8e1amr4402969eec.11.1793871381617;
        Thu, 05 Nov 2026 01:36:21 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17363207eec.16.2026.11.05.01.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:36:21 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] mm/ksm: keep smart scan from losing duplicate pages
Date: Thu, 05 Nov 2026 04:36:13 -0500
Message-Id: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAA1O7GoC/5WNQQ6CMBAAv0J6dk3baAVP/sNwKGUpG2ghXSQaw
 t+t/MDjzGFmE4yJkMW92ETClZimmEGfCuF6Gz0CtZmFltooqQw0Lw8hwMABONi0ADsbwY7kI/B
 AM4NrpcKrrcqysiJ35oQdvY/Hs87cEy9T+hzLVf3sP/VVgQTdVaq9mYsyDT58sDSe3RREve/7F
 /QtIFfSAAAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

With smart scan, which is on by default, two identical pages that become
mergeable some scans apart can stay unmerged for as long as they live:
each page times its skipped scans on its own, and once both are old they
may never be looked at in the same scan, which merging through the
unstable tree requires. This was first noticed as intermittent failures
of ksm_tests "KSM NUMA merging" in run_vmtests.sh.

Patch 1 picks the skipped scans by the global scan number, so all old
pages are looked at together every eighth scan. Over 420 pairs made
mergeable 0 to 20 scans apart, 329 and 317 merged before on two boots
and all of them after, at the cost of 10-12% more ksmd time on memory
that never merges.

Patch 2 adds a ksm_functional_tests case that fails 20/20 without patch
1 and 0/20 with it, on both boots.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Rebase onto v7.4-rc1-132-g05441d697f7f and retest there
- Drop the ksm_tests -N -m 1 numbers, as it no longer fails on this base
  without the fix
- Update the ksmd cost to 10-12%, measured on this base

v1: https://lore.kernel.org/r/20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com

---
Qiliang Yuan (2):
      mm/ksm: align smart scan skips with the scan number
      selftests/mm: cover merging KSM pages aged by smart scan

 mm/ksm.c                                          |  24 ++---
 tools/testing/selftests/mm/ksm_functional_tests.c | 108 +++++++++++++++++++++-
 2 files changed, 117 insertions(+), 15 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261016-bug-mm-ksm-smart-scan-align-skips-cd01e5a9889a

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

