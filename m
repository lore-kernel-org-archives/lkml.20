Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040F436D9E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756352; cv=none; b=ALMSWMBHwomBY1oYkHYARUT3u4jRVL6f1Sgv7U7MgiJc1goJyzgOSAQNma4RgjkPwG8LnecbuRt88FgNl24NQnuxbHQPZrqM33MZC7G6CaEQdICMyffc5T68zDxpiCOPzAHpe439HWxB6zapKWKeMmipc6W6Mclcyw80rm8K3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756352; c=relaxed/simple;
	bh=o7CbGYsOIDmcanU8fUfnUx3eOhhddfQxRpFPLq1F7Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1hp0dlaEh63WuhX9n0tuPdG9ok5jVfJjAAXcqnnI1PxsT0ef4QrFuE2UHrIuPNThBx9J0iq8BE2BoFgXlp37695ybv8G00hUzjyEILULFyxhZ7m7MyAe9lENETMsLXX+5OhSftz9ORIoDi7ImdT6Aq5Rjh5z181+Fb1BSxGV6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD9NSTxB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD9NSTxB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3097799a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756350; x=1789361150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5L23rxTi9KX1MKDBMSVdzl0h+OzIwSK7RKLIboLG0w=;
        b=XD9NSTxBY4/cnkdJUnDz8x7omMSnP5X3VA9zpaKDxY7LuFezIeUySSTYWAnmP+o7mg
         OQXL2QZYUe0aER3BZvDVAVPpC/hcu8HjSc2BU8gEss2FTuauNxxac5IkUdGKAmYQfiN3
         ESaw1EuXmwYXHSq3MtmhOf+g92GbeEH7zlvi3UxR1KkPkeAZdIJ4CZmQuGFAf6/vvRtx
         rjenA8OS4Q1+C2kJOmV+DIbY0i0fzpdIbc2s2wiM3Smp6EGbsrW75I3QLwjKbEK74+y4
         bAoXthv4kNZLb0pLxFBqCm+X0PZP6JPWKBbP3K673zdVsePhRX0Xi8cJH08Qxfsoo+iG
         VMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756350; x=1789361150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5L23rxTi9KX1MKDBMSVdzl0h+OzIwSK7RKLIboLG0w=;
        b=T9mHj1zz/mvMZggsaTkELCy65yfaCQI/i43zZLK7fpp3sAxusxBV14li3FsHfTBsFG
         iKmieEKM/JiqhYrIIC+3hvqHNYqwjHXqXd+cmfh0E+oAr9g5FBBAX2/OX7BNzK/UbWjI
         ksd0g7yb/Y6Z+U06gcJ3rzj/iPEO3CfBDkKvMkuyUwvfj80sKGod3BriOcCphFJHqPJD
         asayj5Dbr3GJPQsjpeEKnlL9wZlGJPDT1oWNU53ujeEsW7uL1ZGFVa5nH9m31Ji12wlB
         45K4aZaM9nzdnhZQ+uNmuxcrRlbGPsq9UjUSq+2/0jrTbu8XBh/Bu1l93iXG4iKdSvRj
         4eLA==
X-Forwarded-Encrypted: i=1; AKwUvBzhV63wVdg6IZLPaGNOoVBF2jmdC5bfel/xUDhQaXLSKtbCprifNAAoZcnK8QovkhLGvrLTMX+vG0tdDZw=@vger.kernel.org
X-Gm-Message-State: AFuF++n7n3SrhMa9WnbF2llu9x8Y19qRlY6HFB7xchg2FxhVlLGrgD9a
	LvoAPOxfVjyJ/FbaMd0mGUS0Yub/f6COv00wlk+6B3q8KnKzyWkKM7j+p1ffaHjzODg=
X-Gm-Gg: AYBFou1PUk4PSR67CY1ncIYvSRAlbmLPGSAJMLUnxL8x8YQ9eYdNtLcO9+NZbHGT7XJ
	DJwFT4KyTEYm3Pu+YEwP5mdeGPjv221DGw6dO+fs8DDsJPHajVopz93JlcQDOS9kw69ksKO7Lpi
	LCQrzz3aVozL/+TqSYhg5hqlZCNOWddgEi8AmstQVXjIO8ePlG2lEls8eoU/qltOAftXtMwU44T
	NQEMd3T1U0NoVvotJZZVmheZryUxixqZXfamj12t0GNzK10RfmXPna3m1ZypfP7EvWRMhPkFP9h
	VMhEvuYMJSwMSf6mVhwCaxXDko0Ll/JbmdLPiggcR6lqZhZAhkYHgck+/OVN9eD3SpFlEvqu6iY
	iuzH6f3iTZkbLAv3jDtKdd8C5lvSMbHSj7JVcggIoGeznGz6n4V9BcPDfK02ldU1W2aQJp94NZn
	Kv3zgNZ3xFdXSgOEG1O/GSocAmPH8+fqMwh4cwBrX3trs0OTslOZWMT/03uVUJpZN1ToQFJRAo7
	q8L/oJv0y5u/Q==
X-Received: by 2002:a17:90b:2b4e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39b261d0d8emr32120271a91.15.1788756350296;
        Sun, 06 Sep 2026 21:45:50 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm25491660eec.24.2026.09.06.21.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:45:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] m68k: coldfire: fix typos in reset.c comment
Date: Mon,  7 Sep 2026 10:15:45 +0530
Message-ID: <20260907044545.6187-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "reseting" to "resetting" and "ColdFure" to "ColdFire".

v1 fixed only "reseting", which checkpatch had flagged, and left
"ColdFure" two words earlier untouched.  Josh Juran spotted it.

Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/m68k/coldfire/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/reset.c b/arch/m68k/coldfire/reset.c
index 6e5f8ab39f32..079c92593eff 100644
--- a/arch/m68k/coldfire/reset.c
+++ b/arch/m68k/coldfire/reset.c
@@ -16,7 +16,7 @@
 #include <asm/mcfsim.h>
 
 /*
- *	There are 2 common methods amongst the ColdFure parts for reseting
+ *	There are 2 common methods amongst the ColdFire parts for resetting
  *	the CPU. But there are couple of exceptions, the 5272 and the 547x
  *	have something completely special to them, and we let their specific
  *	subarch code handle them.
