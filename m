Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082524756DC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277883; cv=none; b=WSh47Gd3Od8JVcBBaMSjERChpDhnITOV4ils3PY+WhpNK5tl401G+5UrMmkBcNo5JHcZpGAvUHTostUVx5pUTESvMaY6cntMnKq9WSg3nBAQPB9/wEEYrKPQKNgJ5mA/yXf4oSgbGy3Myt33tkVl9Gc9qLyjj6KaSL03aNUckp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277883; c=relaxed/simple;
	bh=pRgZhzX6qbVjRnAwTz9i1o1KI2kS4TJvK2VH3qSJ13k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCd7MY3X0vpwYXjdC91KP1cK6z65+FEr/q0K9PA9yYfqb7R+iQkxAHDAFdFafmQBjAT3ItC1hWASw12ACZw1DfNxlOTIs+31rmZK21ClQ0bh70wLSkAcPjUWdl+dgnhT9rbCqQux74znLZCnRTDDBm7lByRYlfdqvostupqJz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zzzx4Nys; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzzx4Nys"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-867a943b149so1475027b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277881; x=1788882681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZA0Pzsw+qOfFGcn3m/R0Q1PWPp1MfQufFMeWU6cvtk=;
        b=Zzzx4NysXXR96wVENyFhLIcs7syUeDTAHEY9omZJtH73zhrua9uAN0KP8LuXNzXsBw
         kYCS8gYz0ouYJsgszXx8se6ylfpSvUqSuyV0lbuLraUidl9xn0rEvtDghRYcSlKxqVEZ
         sovmAJ+Ho68Rya2Y5gzWwgyUZi5t3bjb2W7kEbUyW7gUwrQUOgvMR429JFBpOW09siTS
         FrBcXGBp4gk//1GlrG0OwyHVpgjZaos9bRvHcex/8alJmgHBR1zl2/v1dWuipaBFV5QY
         9wAdFYYRVeHnEomM56gvkS+E/L9talnA+pVLivQAvrWIe27bJtkUaeNncwAB03yZYaIs
         oryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277881; x=1788882681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZA0Pzsw+qOfFGcn3m/R0Q1PWPp1MfQufFMeWU6cvtk=;
        b=mSUTYh0WNi+PDD8Lnm+84NhTL+E2sI6+JgL/jUg9aaFRMpGsUZspfxS9VUc68NjSIb
         hohIlK65+NpD+jEEsa3Ghu49wx6pn3eLFoY2pNIniY92RPCkHPuR5pWO283yeN1hTx+J
         5ci9vzdDQ+VJP+yTrUUgCX64RcEjc//LgYstdRe+C7+9LEOEP43HCy7jBfEF+dyFL95Y
         Qhw56pn3EmWQdPhwZWkA/w9bris6pvZLnBVeClNT1upLwvIf3n6p7h7jd7aPLfL8r/WK
         kfbqm47dOSoyaZ2t5Ue2sBo5V0MQfL/I7gXCz0GfFJ2RJ/T/nEhW/ruBNJhSSjLXjJIH
         AY6w==
X-Forwarded-Encrypted: i=1; AKwUvBwtiLh6wfFTZga9e4AyC9yarjNizipz7Aug4rYmsWRXkBcKFoZBACnBkiGcW8LZvzNsmUz1ox9LXqyKBds=@vger.kernel.org
X-Gm-Message-State: AFuF++mG/w/BiqNmB7zrP+1NS3E74ApUI/7Mhz5GC4poTE7npMV6dvCq
	NoOvG77Q8VqfZG0ELALd25pnNvO4GH2kHdhhg0MI16M/oR0Ee5ogXQdvBOdctg==
X-Gm-Gg: AYBFou2+3i0V7xXFkx7NKOUp6R50s9wm8IwGsauIpGMNewa0db/YiMNBFqwedeB9dyj
	oBqphTCoO/SDZAqtn3v8ikM7ZTLE96+pDk1UL3uFXo0sQlZgV5uA9h62AWiba/OjRJkOdTP0JPf
	PRuSBYBCTBzQJDa/SwQNBmrG6Oncr+BPAMBqjsDFgD60UPWcOPTLxNHvVpvTJK7t50u5vnkJ0fs
	N+enTFlOho3nS7mZVw4wYC28Ijgd6AFqci2yo7IxmaVpYMcYgLvV9xD6vquVL5QyZ08igo8Yced
	qoGNPTzE4oPZHIx5ZB0VeG9UUxQjrzcXlD9WaSs79lFtLiq0/A6Cm+VCWztmJVPcuyq4/nVL/tX
	wCTcqowdB3lU2I9hc+ypSwZSFv1XTb8k8cl0Y703xvegw4hvFCTL/C+wd9e57Iayw34xHuNXDXY
	ALP9C9RLdUWAAsyl/dXaeFa0IqZzCE2a8W/wD/iV+WwBBLlN3Nv6J6dD0ieFx+V7JWhT0Wvhcvu
	xwF7s9UkOWThVcHm3t/SrPWVsP8/GmloISDsgND
X-Received: by 2002:a05:690c:60c5:b0:854:4fdc:cab9 with SMTP id 00721157ae682-8686e1bae8cmr39361537b3.6.1788277880754;
        Tue, 01 Sep 2026 08:51:20 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e68ae126bsm79282297b3.9.2026.09.01.08.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:17 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/24] alpha: select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
Date: Tue,  1 Sep 2026 11:50:24 -0400
Message-ID: <a24c28c35c32335822ceb977dc3e860609c50ca7.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha has a clean split between user and kernel address spaces: user
space occupies 0x0000000000000000-0x000003ffffffffff (TASK_SIZE), while
kernel space uses KSEG and vmalloc regions near the top of the 64-bit
address space. These are strictly non-overlapping.

This enables optimizations in BPF and tracing that can skip address
range checks when user and kernel pointers are distinguishable by
address alone.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 6ccd03768083..2ae514bea4cf 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_HAS_DMA_OPS if PCI
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
+	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
-- 
2.54.0

