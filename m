Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F5336B939
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832657; cv=none; b=DzjRCfIHKll8BBxH1aiyfcDyiz+4opwn9E/FqfIOBbNuQb1EvyhwqiCMKDN08y093QyuZ8bjUSNXSEBX3Shf8Bzk+E/xzOPY1uceE5mHy/NXtEaCq/1oCYt60Fb8Mk408ejXRkymXe+esADABvtketvvW9/jSF4Mjmi4farYQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832657; c=relaxed/simple;
	bh=EmA6//KppfeUgVZiV4cMUwGel9FhZCcjp0UJf5p4IKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dDv1CFkHYz1v2WDiOHNNW5PAOfgaRPUkNJlfj1zsDOlsRV04Kd0Py2qCjIPOOJkUgzBLEQS5S/tdLK0TwnpP9t00jBCwaatho3c+E+sBQ7XzL6W9UaD9EOjXl/mDgN/BXbDodGjyH6LfFGExma3FOXOjh39hgjIXVHUckYLQhrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=bw22YXjU; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="bw22YXjU"
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3ED303FDB1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790832645;
	bh=1VE1RYfLq2T8mu9mJjmLt+ict1IadVMm9yDzloS+OAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=bw22YXjUxhQ3mxLDK4VlPrqp2hOY6j2Ba+B+ChVg5uqR+55ct0Y6LBXrv0JNOKnSY
	 9kvqod2OoeI43mLeQ9PqoOYwWX8Xii7UyYFymyN7QEyP5sjhBWHS3AenUZaKYPeKr5
	 PaleHXWHjjx1ULBKXy3R972WGqMneROt7Jn03XA8YZjEMuSrHe6Xmm7n1itwBgZlDd
	 U+aRv+2kqxNVIqxQyL6R+Fflksba/eSLRJfmvG/ERlpBVZtuDx0zgR/QI/Mt7oDn0A
	 iPyDpXMb28yUgVPAuy0O0YNoZTkXsD2dZ0sLQASo3dKxqmKRAn14C7cX6Pf2PRP4KE
	 ASV+BEO4HANdwOVD/kuJn0viXUtPssbyDys/2Luw6IOyisWYjOKcj0zOl7ltUQmej9
	 BYKwOY+iVEl/lIdTVsVXM0b4NuFR2zM84TasUbjK9ge0wvtMKKkQN4tl3WnGG/7b85
	 7X/CImbvqB4+cue8lJxG+HJEVjbHJQEg7dGq36jUk5KwVpJNQXP/GXP6RsaCfVg73L
	 OgZnopTA6fXdGHAwCd9XUkIck32n43z2PiB3CpscMCSTaW+/4Edayub4UN/cAHflZb
	 qYmxpZmUkyMKhu5Vo+uMbhVD+qAWUpef2TJa/OBAVGqALaCMko2IDMl39px8yhGc2N
	 kg/YqXKTmpaPKBYa2SfbKTkY=
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2dc7312e5so15394195ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832644; x=1791437444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VE1RYfLq2T8mu9mJjmLt+ict1IadVMm9yDzloS+OAM=;
        b=XvqQOSlvQkEUBkhnkFYQIB8yFoSbHmhCbL0F0mYImHURHfOUeAuySWD3AfYHi/yMoc
         imy7deJkCCpKlsa2qJi9Jb5/zAtoUBzkU5MOtBEZaRzhI0gTpeGHHbtj296dckspFNTH
         qFpWl10ARYckCAYYLvVF3MFDZkNlUO7pFQZx648jMXLl7MV8YWRr1RcR1C+VBwOz2Py/
         2IS4iWom5MFfenlgiP7jkE+BeQMXUlfh9nJGZ37J3nh9ubicqU5t7XcVZ99zbgpAy5mH
         Y4KEPSDgDyjawnx4yxq9C6/RDVVecSaZ+cFyuhRge2dRNAbi1l2pLjZFsApqYcIUhagD
         jDAg==
X-Forwarded-Encrypted: i=1; AKwUvBysyoxvVn4Fw+arRnyKcD8BO08781s24WGhio3pHbYERaTBhZyXIBzMAnI8XB2qfyK4lfEcGDwGsyYwNL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLcZlGyF6N9OlF6+h6gPVL5bE/w4VUZFSzWgsZX9UV2zLPm8na
	RAcx8cAgpcXaY+YB9NUDn3vgOeyMtcN5bFvzLCFQIadz0WAwMQ8BIBFKELy4T0G1eH6w2fbD5AG
	1GptVUoSPzrmuZmy0uhM8BkLcn/puhD38UljMiqHQCN3vBWTdpHBoh80qHoB0Nyk/8KQO/4jTCb
	Qv8pDqHD51ognoeg==
X-Gm-Gg: AYBFou3ii8dkAebpFlM1AuAG+w3oZvNICY3x4/dl8bMI9omhWgZbboe7dK3pQkQVwWS
	3tGb0nBy5R9HVwdURfgl5j675Tbo/Ydl0w1bwVku74BfIu4MnMoUMDo5ClNRDA1endYy9NmaqGd
	iymSfHAptdJg+/GiBS0sKTELGZvSJkg4LzAmXSu2ux/PhUzOYQ6DB1CZonULBKSzeao3b4wx8TY
	7qO68wIq4tmFFibNtUzp4vokjgNXrJOdG+ZBto7jb5+2VdiOJIeJmCrwsB/Oc9xRa88z1H1kbBB
	qG6l4tHFsgNM49bCAjL+ndg8912w8G1QGVk78zi1k2gi1xuiYORwdUPWVsiADnjXAgpF5zjbis7
	DuMvylaSCnOWHmdAxRIaDr/iPnrPx6YU2ZNywg8ofTPXXwLaQwe3r6GKg
X-Received: by 2002:a17:902:c945:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2e2e49167eamr32572205ad.2.1790832643528;
        Wed, 30 Sep 2026 22:30:43 -0700 (PDT)
X-Received: by 2002:a17:902:c945:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2e2e49167eamr32572045ad.2.1790832643130;
        Wed, 30 Sep 2026 22:30:43 -0700 (PDT)
Received: from resolute-linux.lxd (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b4273csm5205745ad.64.2026.09.30.22.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:30:42 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH] MIPS: GT64120: Remove duplicate GT_PCI1M1LD_OFS and GT_PCI1M1HD_OFS
Date: Thu,  1 Oct 2026 05:30:15 +0000
Message-ID: <20261001053016.76578-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GT_PCI1M1LD_OFS and GT_PCI1M1HD_OFS register offsets are defined
twice in a row with identical values. Identical macro redefinitions are
valid C, so the compiler never warned about it. Drop the second copy.

No functional change.

Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 arch/mips/include/asm/gt64120.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/gt64120.h b/arch/mips/include/asm/gt64120.h
index 5d68d726598a..2ad770ff3c56 100644
--- a/arch/mips/include/asm/gt64120.h
+++ b/arch/mips/include/asm/gt64120.h
@@ -45,8 +45,6 @@
 #define GT_PCI1M0HD_OFS		0x0a8
 #define GT_PCI1M1LD_OFS		0x0b0
 #define GT_PCI1M1HD_OFS		0x0b8
-#define GT_PCI1M1LD_OFS		0x0b0
-#define GT_PCI1M1HD_OFS		0x0b8
 
 #define GT_SCS10AR_OFS		0x0d0
 #define GT_SCS32AR_OFS		0x0d8

base-commit: f552e14f77bfce3e7ee0bb268ab023951baec3ff
-- 
2.53.0

