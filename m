Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA6339376
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748206; cv=none; b=aZFQe9IorSZXECrlUDGe0+qXnFCpopnv/CQp8bQJSR5ogl8QcXBB5a/mErm/JVwUolmRaNG4LCtNld3dvnPTlNmp7L19ybR3D2ZbR1lpM35eTv2sm7FNX+JKxTR48B3hfZtXjqL1gXmYm2wmXBH1VM9u7E7COn+1GfToDkUkaP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748206; c=relaxed/simple;
	bh=XnUJcfHVRNnP5IaA4wgrJ87Jb/4coQFKv2vc+voL6uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UJPyXJczszmEGEdFcjzLdFAc22DyA/7xiM79ZjVAEqaLg7TIBpba+S2qWpEX1poUbA2lBiwYdn0hcFk0f+3Q5ljOXBPIoLkmylBRBjUjcJ8Fq9pdomvENaBTCODRXaNyUY2IqW/eUMV5IrnYP20Iv3r3vYce7bV6vc+2NCa3A2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auFw13fr; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auFw13fr"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2164165b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790748204; x=1791353004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fONtH76wllyKfu5q3H9rL3giEdo9qYDjcdxgrZ3+2dA=;
        b=auFw13frmQerf/fjeOBHkckfu0lHWrR4lysHBFBiI2kUlw8oinymfvN6zRPAGksJdv
         VOCCqtSozLSOs4YVVVePbXFRf94qO4URm5oIowvgI95ho1HQ2Ei+iFoKZxnEO+5ARFsO
         ZzYSXraPybJm5oIN3qvt9Bj3z9Y75jlbWInMY+k9Dqt5qvnyE7LXkGK+FbIj6cD6U/Ig
         EH5YoTLTYqEoZuo1ddALJ/JfN9t+JNDQfzWpi3gnUjiTIB2rTH4BYtbCNROYWgQ3ATA0
         ee7cw+U+JhiZvSn0/xHnjkuoMb77ZXyyilYtnzhR6KsPMjAdTJlwqSUKacInU4bZjdWa
         rkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748204; x=1791353004;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fONtH76wllyKfu5q3H9rL3giEdo9qYDjcdxgrZ3+2dA=;
        b=dRRJUeVarNqR/tWQWiBj6Q2uZiBQsC+qHE+YMQr2ftQ4toTz5PQAykBA8jQz95rPcr
         UkI9YPU+JBZwvvYLSDAXQQyLwZdct+qAUkWXLbNGrGMLtFgEa3MNKjz3dLbxscwtYhYp
         5PFSx5DT3mIfN5wI5RHG8pqTeW+SQ6pziNVhjtZi8ivAgeMEpQwikVMayLsQz16rNW4f
         sUMZLGobPGmv04lH/B+VVciyDLfaFX6+2Cac2n1DX/hwvXyjseUpSTuGNgSsLkka/znU
         NEEU8WpuJzPawCZK2ebdjFainIYPW2y1KUQTVgYk19Ph1dvfHVnJaUlutE0ah7SUmEd7
         rMww==
X-Forwarded-Encrypted: i=1; AKwUvBwsL1Ki1acYf8k9RVxeDYQVIUU0otbH6IejJwsQtaIQuz+zanMkJFcgiaMOBPLg/ZUKamTps86o82mMsx8=@vger.kernel.org
X-Gm-Message-State: AFuF++nPqVWWfRtRRSiD+AixOuLwjmj9U6WKSdLitp2XT0X2X8aN8JTN
	QolwDuQi76E1USCyM0Ga/19OfQnivYKCN3lvNUfz3VhhS/PXvaTIDbV0dioLne+lhvU=
X-Gm-Gg: AYBFou21WcJccx6pMdxWzEomNAo7jv7GKG/owJYRuWQOVitE5fd4YRyxGbBmACCbT1o
	Nxbf7uhK2rog8Q5qznKNoCYUdcUmEktt2pUneExEOevreh3E4rL68xsC8XAQ6OabFXLR+PKSeqy
	jiiADE2ezBSCGnz7TpLzdwmL/Sle7QvoY5iVtxtz7jg3VRmfEXBAkDUFESL+/iRzREJ6PRQITeD
	1LTf/4PfEVAC4zsxdmtAFMBPl2mvB+bbzi2giHjNxGmC/VHMEAGN8leIvqiMYVyPp1oee5pvhKU
	psBBGwv+UOLTekUM5kKl7EThzD04OyyWf/FR6IeHXq1TcoXOcHzLMInGy+DTVHTn7FXTpW5AgfR
	MB6CbXUvpXhvR6u4ms7pydBiFsdLahsWx4ZHWkxNHB4msqzH57N1k5oieH9WgjdYALup2Xy+zlb
	RokKUpk+wmi5lfzuK9QS/6bpbgsQmKNS09rOjgkGkvz/Ack2vCqZ6g7blG5+vZWhmss34CmVppu
	6BP0SetNapkcA==
X-Received: by 2002:a05:6a21:62c3:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-3de9e008c0fmr434688637.8.1790748203756;
        Tue, 29 Sep 2026 23:03:23 -0700 (PDT)
Received: from omarchy ([2404:7a81:bb40:2400:e077:4928:9847:63b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab46db6sm205183a12.31.2026.09.29.23.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:03:23 -0700 (PDT)
From: Ren Tamura <ren.tamura.oss@gmail.com>
To: akpm@linux-foundation.org
Cc: roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/cgroup: sum shrinker object counts across NUMA nodes
Date: Wed, 30 Sep 2026 15:03:17 +0900
Message-ID: <179074810112.139422.9274126921568167859@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Each row of a memcg-aware shrinker's debugfs count file contains the
cgroup ID followed by one object count per NUMA node. memcg_shrinker.py
uses only the first count when sorting and displaying entries.

This undercounts objects on NUMA systems. An entry with counts of 0 and
23 is treated as zero and omitted from the output, even though its total
is 23.

Sum all count fields after the cgroup ID so that the displayed totals
and sort order account for every node. Single-node input retains the
same result.

Fixes: d261ea23533b ("tools: add memcg_shrinker.py")
Assisted-by: LLM
Signed-off-by: Ren Tamura <ren.tamura.oss@gmail.com>
---
Validation (2026-09-24, mainline 62f4c998b297): ran the original and
modified scanner and display code on Linux against count-file fixtures.
Multi-node counts changed from 0/7/4 to 23/18/4, while a single-node
count of 9 stayed unchanged. This validation uses fixtures, not a live
NUMA shrinker workload.

LLM assistance: finding small cgroup fixes, drafting code and commit
messages, and preparing validation.

 tools/cgroup/memcg_shrinker.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/cgroup/memcg_shrinker.py b/tools/cgroup/memcg_shrinker.py
index e81c3017ada9643de72d9fcb5e8fb6808382a31b..714772449c6ba9142215e88cf9e4526bdbcb9ee6 100644
--- a/tools/cgroup/memcg_shrinker.py
+++ b/tools/cgroup/memcg_shrinker.py
@@ -31,7 +31,7 @@ def scan_shrinkers(shrinker_debugfs):
                     items = line.split(' ')
                     ino = int(items[0])
                     # (count, shrinker, memcg ino)
-                    shrinkers.append((int(items[1]), shrinker, ino))
+                    shrinkers.append((sum(map(int, items[1:])), shrinker, ino))
     return shrinkers
 
 

base-commit: 551c722f40809618230001baccf219193e22fc5a
