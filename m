Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1722FBE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787973408; cv=none; b=pG5y7OgNw1TH91oh2s4LECZJjLMhzWbPnsnsMJAflehBQ6N1xQSXk5uedQekt4a66Ys/UbW2/lH4r0g0yoFBzJkUtn8MCo2rpNGDzEFQl6QWT6tr0QcapfY/nfnT7salxvHKMNbWeTAC3Cbgvi+q5Sj6Jy9l1vDmfOmalJ3kFJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787973408; c=relaxed/simple;
	bh=WUEGV5HF3ThaiyYltkmnXGERvnAJNFIQd9pi9s2PIjw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Xk3+MPIARtTsU2HME8uR/MfCWNWnYe+HT8UooA/Kjs9XTucUUbPhzziuwKbhZ1Us62qIB6MwIcj6zRFFVD4dPUM5P+XZATfkaBNySYG8uuwj/DPiYigHBTdMbaFplWT/a8kayPYATc+Sn+/SGy11VYcGsZjVyLeZyi9+jxHrPp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0ytShct; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0ytShct"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so4461848a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787973406; x=1788578206; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVja6zuW7QsFITVkplTnOYnERjjD3g4u4emZnu55F2o=;
        b=c0ytShcts32QYbW15r79j4aQAVyrcy+Y3n/BLqIUskNMVVUTNofbtgkKE08L695lbD
         QB8FVHTDKkTC2jqycEHYuRZcjBKCqYpcXJ1N4BbDyf7YMd8mTYhMUMWzXlOxIlmyCLvr
         B76qcxyQgVw72xwgNovet57CmCj+8pGVpqES2PJj6IXGCRICcBkXRtSzhjZSoy+hNYYF
         8i2K9ns5bk7BiG7EWagHkLd2vRpNpk2PNUzylqKJBDdaJr9/i3xseUqos1GPDSE96Gmo
         pHOjEiQbVJ6x9BEXy4kxTzJBD5FDY0N8FuaPa+IUEOBpBEb1cET7rMKZpujaqaE7EY6B
         2HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787973406; x=1788578206;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVja6zuW7QsFITVkplTnOYnERjjD3g4u4emZnu55F2o=;
        b=IlBj5UNMo0E/LrqFwzolsjmKl0uw+sqYcY09O0RJfMrjCwkt7Z2F74Iz8AaJuhTegK
         9oCneTQkPCHGGdw+b0CMBoP9T9o+vUks/PIWEgJoheb7A3JycWBY/zYqtePQ3vUlH8sr
         Ilwbw5qXSGfcyS/9lDnKub8EGnGi/OBccJ6cqWDBrq3eYO2Er2XTTLZuqljZMLzKvlri
         fFPEZf4u1RKoPNzAzeUUVfFlH//zEWixgJUpMkTw4C8KvBbhoBh34krcQVNSvSJ13dw/
         hL1WYBymYWq8QK+K+YlnnZCJkvp2kTjC8OU4UencJcmZfJweN8ZuyL/f6yiN/UdvSZMs
         c+HA==
X-Gm-Message-State: AFuF++ntTBPdY9ZG2Pq/LoYKwUC+tbunBi1NsE+UAAE9pgfnYd3AYzGS
	Bn67G9i3AEtZzSZzdrPftDfKiNU85hi/jqfVV1JRXXErNgwHfCjtH7cC
X-Gm-Gg: AR+sD10tCucv/ZKtCPNaAEdBgPAGHEwvau5tNdOWgRSqYV64ANsC6FYeJdgRgtE8kk+
	Xc1Lkr1ZMktdQGNk7vhQQwDmiIXdhQ9EAvmwpIvJFNusikTxFaQJiOKHjmUFBNLao5n7+NyXDYY
	av6/KKU/KciMm4iVpva0F4bKRnvkyWDll1+Lg7LxR3lcnHBFMlE7sCN3MCIdYTVgz81wifokmF1
	a3OGlFyaFmnZlu9OrPoGxTthPFtcwmp6yq6u3Vdz0Ti4SShJ3ddL3ccGxM/YaKVGJ3Q1dBpjOdV
	ey2MtzKWtijiZ9equorFwy6RVrtd8zZwRy+mAl3I8rxBohyD2O6D/sSaU52kacvwOpkXq8GV0qO
	kX/GxlTCTxRLCcfJobHb1kkCD3f5IsdnrK0DU8BiXjsebKJjb++C51QLB5xW7Xt12pUeVnMRZZu
	quUKFpjGxOup2C9g0bu1GdAf/gi70kWt8m/aOhub7KbmK8aGwm/2AO73IhqtQ=
X-Received: by 2002:a17:907:9495:b0:c25:35cd:fdb2 with SMTP id a640c23a62f3a-c256dcc3778mr285085766b.7.1787973405643;
        Fri, 28 Aug 2026 20:16:45 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2865dsm163950566b.25.2026.08.28.20.16.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2026 20:16:44 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: apw@canonical.com,
	joe@perches.com
Cc: linux-kernel@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH] checkpatch: check GIT_COMMIT_ID for a maximum of 3 consecutive lines
Date: Sat, 29 Aug 2026 03:16:37 +0000
Message-Id: <20260829031637.27079-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Following commit log would report git commit description style error.

  Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
  with __GFP_NOFAIL") remove a warning on allocating large folio with
  __GFP_NOFAIL, which was placed there by commit 903edea6c53f ("mm: warn
  about illegal __GFP_NOFAIL usage in a more appropriate location and
  manner").

Because the second commit description spans 3 lines.

While in commit 4ce9f9704578 ("checkpatch: improve GIT_COMMIT_ID test"), it
says it check commit description "for a maximum of 3 consecutive lines".

Add the missing iteration.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
Cc: Joe Perches <joe@perches.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..0d1d0986c0d7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3431,7 +3431,7 @@ sub process {
 
 			my $input = $line;
 			if ($line =~ /(?:\bcommit\s+[0-9a-f]{5,}|\bcommit\s*$)/i) {
-				for (my $n = 0; $n < 2; $n++) {
+				for (my $n = 0; $n < 3; $n++) {
 					if ($input =~ /\bcommit\s+[0-9a-f]{5,}\s*($balanced_parens)/i) {
 						$orig_desc = $1;
 						$has_parens = 1;
-- 
2.34.1

