Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ED73DD86F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860915; cv=none; b=I58YRslEsApSnSiB7M1c6fNxjYAZz1fmOlVp+33SoZfgZpkKvKwFlJCd0Yfp6I1Ra1OL8irCYx3UzxH1t66ufB40EchqUQMPRIiMv3A+iP8s/Q8m0za53Khfy65Obk7uX+xGzKQawRGpcpG3n02UVdO6QfsNFGkMMoiHG9MC9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860915; c=relaxed/simple;
	bh=alXKlejZ3rjbqbavz9evBznlUeY1CvfBnpw+hhl51Nk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gMNrJB6V87PaRBenC7EOhXKb8ik83vNifPSwocIARZJ6x1eI5BGELwTjRl3KjGFiN/m3ka5T7jOSnW9X+1rPSIciLDpL7a1oS8DeSHRrLvoETlm/h8Aegcz8NdWxCLPk+p7ztxRapD6E4QhJehCrQe8feVEV8ffN2HI/ciqXfLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPBqoE3j; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPBqoE3j"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e812e2b31bso12588245ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791860913; x=1792465713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsQluREAsaidaH9yxQg+zSsmSWQvjbWvelg3Usb8Q7w=;
        b=oPBqoE3j8NAXrmlfk7OsPSzH90Yqz9xTk1y+ibFfMC4H55JHw7KeKgI7x5Pj6vc9Wn
         5LCQ/BC0gfPN9b+U7W2TBFDv6x0nP9I6/xhXg3zEVuiDJCYLr/LDPlKnpDTARxFQY8pR
         cbY3fy+jRS3qXqRBAS07PUSybwt5aMK2UYBdfcSo2t0bmxgBq8thiSpa1l4rA/kwC60j
         FOA+Fo82JtRAtXp+5A/pR1cP/ZZVg8HJmbjXRdS/KCueRkMGFTEa+764Jsxq17mcq/w3
         Qryik+AWQ1SKQD658/17YxUBI8f6yPj40D/WLy0WwjoxD5JPq7MB/je2FkjZ2CjTKesk
         uvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860913; x=1792465713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsQluREAsaidaH9yxQg+zSsmSWQvjbWvelg3Usb8Q7w=;
        b=hLmPan3OG4DEovo4k7k5/TOeh8h/B2RI7EZIaLohqL7pvHG8xZOIso/JVZGtPkvUwp
         97yl/mr2UQx9/oOdYov/rr126mE0CWj8DAdWtXVGy9PMGWyfOVwqHmvhdG3/9z+74PRg
         6e6YWL14BTop+be7OdtndilOzHCOjhG/JAIM1LZVPTH8fl6xyNGIZitoyHB+LqeFhctk
         bNakPP04cJZMRp3oaMR8PS0vtk7MdKuSrTRnD4gKfPHC9rI/VQDtVnKB076URjianstp
         bdwdUDVMWcc62oJIvyA1Ez/u74MpPvm1UGc2dBO57W+tu56bDIqZJ3lbRdt/mZgDFPkG
         mqqA==
X-Forwarded-Encrypted: i=1; AKwUvByrOQ6ixA8cM3GumKqJiBhdNUkXWxq4aQ36FpmrqnMMvDWoBJ2ERU1JvuuilcRK/x1ST24UQ8yu6Ah7z0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQHS538yskRjRts+MToVtb63gHSuI57arOVZNkMVOTNbxIxnDB
	dFfLmqwLgvABvEM1c6VOiQ/UpEHGOFidJANfo3H2VIvxgtLlx0Dt/ZY=
X-Gm-Gg: AYBFou12JMO0LxdML2thBLmM7ovanJNMbOPDD3AtrMrgr9WLQ+1ByY3o1wnq6DTBJSY
	ZkmRhKz7v9V0MY7jFH0hnh5soYEQeK/hGiINESHopvcSAu5FoEwU2P9BDiy8I8syaUVq/vz+k+x
	irYewO87ssAwdTkqTtDmChukfvtsE/l2NZm5t6BnTyc3o0lMTMtoX7nAdDbTezYzm9eBpNrcOdk
	aMuJ9ogJ/iV/70lkAFAtzRwYMOucmMozQnkO0IIDk/ERDxIPU3lhFGDbyA3ErVohax1jSBL04su
	fCHu8mgovxVDIKQYVdiGXOej0FKN/vhcg7Omu/3ngkZypq8wHb6OwXtqSOFzMX6mmjPWfLm7yOv
	dhMkjp+e0rx1MhdL2UZsf+qeXC8hvm5QX48ajljGTzM+IaYmU5yCrVgbh4a6Lr1vf+WEDtum0P6
	kWBgCxhS2jDFsHZu2dpXzKXSb0Jl4Rn8R1pHNhP3JEgzm28aCqRPxIPL5LO/a534HqxKkz793Jz
	Pth/Kbc7w==
X-Received: by 2002:a17:902:c941:b0:2e8:486d:fa00 with SMTP id d9443c01a7336-2e8486dfb5dmr98051075ad.29.1791860912306;
        Mon, 12 Oct 2026 20:08:32 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2511sm48584505ad.76.2026.10.12.20.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:08:31 -0700 (PDT)
From: wangyibo <szwyb123@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mustafa Karamanli <mbarancemkaramanli@gmail.com>,
	wangyibo <szwyb123@gmail.com>
Subject: [PATCH] staging: most: fix typo in driver_usage.txt
Date: Tue, 13 Oct 2026 11:08:24 +0800
Message-Id: <20261013030824.329969-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in the ALSA component description of the
application layer section: 'can by used' should be 'can be used'.

The same typo was fixed for the networking and V4L2 sections by
commit b114ef1efc49 ("staging: most: fix typos in driver_usage.txt"),
but this third occurrence was missed.

Signed-off-by: wangyibo <szwyb123@gmail.com>
---
 drivers/staging/most/Documentation/driver_usage.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
index f1b6977f4543..32a2e5ecb48b 100644
--- a/drivers/staging/most/Documentation/driver_usage.txt
+++ b/drivers/staging/most/Documentation/driver_usage.txt
@@ -109,7 +109,7 @@ following components are available
 	   driver via the V4L subsystem.
 
 	4) Advanced Linux Sound Architecture (ALSA)
-	   Standard sound applications (e.g. aplay, arecord, audacity) can by
+	   Standard sound applications (e.g. aplay, arecord, audacity) can be
 	   used to access the driver via the ALSA subsystem.
 
 
-- 
2.25.1

