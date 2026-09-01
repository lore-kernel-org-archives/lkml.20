Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099D47CC85
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277911; cv=none; b=FfZRA1Yi+yUffqK3Mizg2iQGYazlZlyenpdTQFJnYNykeHU+s4N1Ma0SNyUgLBujtYR3J6pDmrkdFoitl395m4uexcmm6fvIKaP7UBkEKrcv79hIqorMEomw3GLpf+W+/YKP4mcao/r1S2xcx6skoEgk4YCx/bP58JgwuOx0MDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277911; c=relaxed/simple;
	bh=0QNZxHXN9MMGOG09/8uDxT/8FMsHW8l3OQA/bGpxRuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIe2HbUvaK6/xXbJewZdVxf6lc74gNDWxAh+XJIMtKm9AOA5PFzRJZynKAZwREVzY4KKDhjl5SNpXvxdVg16f5XfhoG9BUhBMQ6vpCFRESN2LO+FIs+buJ8luHU7O7I2hbS+bk49a4DTxZuENko5hX5OdhQCibveAYXsGHFaDDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MopFpUwh; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MopFpUwh"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-86162c086f8so21071927b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277909; x=1788882709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6pvqgRtqPmkfJNnlR7H2vHgJ0BYyIge/mCHYR1mNHY=;
        b=MopFpUwhcOrg03woJJ26CA2a8loqXMPmXUctCGTtdlFYujZWH0ErcDUV/X6S8mTUuP
         Vmf4+SLAnY235/rDxmMljoobRstZCffe+PKENbJb3yJs69HNjxXiIrnSIoShXATNflpd
         DGt9lS8EmJRTXV6KgBYsESJGUyU9UJJwxv0Za8ENr5ig4fa6PliJXj9g0n0UW86Tnjz3
         DaNB4psh3G2LSyOD39rNBFhAtZZjQm7+mbMj6ap+4E7xiNyOcf3Ppe9GNW1xhHXNcX49
         ZVYumFt8PDUp0dAZy5DrjxlB3OXhNWSSCGXxQ/vdisIkuExggaCnZ6xrOVSGZAnBLdno
         3FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277909; x=1788882709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6pvqgRtqPmkfJNnlR7H2vHgJ0BYyIge/mCHYR1mNHY=;
        b=Mu0Z+RxzyUe21nJ5D4loT3IEFzxKeEEo+MtXtKb4LMurNABzrvLvT+qv4ZxwL2+hGy
         T6ew5y5H4exj1mi6zHTvxbycvHSDS2UM7v72adogvpvGiSTNqRfteF1dNHAAJq74Bfni
         z4QPk+p1xUahqmpgm7jpa1FZ0JQ6PTAH+Cfv/Gvq8D8mo4i/De1RZsjYsRifv1R4a/jP
         t+5aAGOtSfkPwpRStgLbuNB6a3uCxjuYRke9rx/l9vMwhjf9djGWzS0nB1Lz2YMZe2WX
         TPMqGcGJIXdute8zgVCKRTRwmOZ1opegSVWi3Bv9rH1V64rVFnq9z29WvvNuaz0H2yyH
         2x4A==
X-Forwarded-Encrypted: i=1; AKwUvByzs2cvGvLFVwt7HrCVq+IE0IwgoSzP90ymSh5db96P6Xgiyao5+I4nWRVnRQmWERxn48sEVyGaddwFl6k=@vger.kernel.org
X-Gm-Message-State: AFuF++lln5ul4ueFx6pDg7WFarZ8k18xuLP9eLk/5ogSnWArlViA+J1f
	70kwI8wZqLuD47sY7ckp6Wj4wdnDM78bTw+gfuaOCCy2FCLSEjTEdrfA
X-Gm-Gg: AYBFou2J04IRgtKtO+2ZSvxHmUBgQg/e+ZEd1Y1vOrnhClcI9jTGO4hY3K3exQtrl8r
	o5lxNW8/fuEH6HC0iFSq4nZgsQrT8a13IGw5Frn6m2aEtWkdkgz/QfisYv7ubpIJWsEOTDw23sP
	UuTaEIALkdwzwaEfYM9hdO/tK3i2dnYTzrbGxLVnB/ZaKcNQt1gb0/CwvwUzO38bDTOxaaJfzxJ
	VSj/chGuSwp1QQBDq9b7OG+AIo575aDQE53zMRIWIx++gFAmti8Ha5n9XEDdG5Pk7ASNTt0s0Vt
	X/BHE287CKhZsgCx18dgWHr4T5mGji7KoQ4XFMUEJ2N3qFHj0LhWqoRSi7miX6ZUS3/580Nyyqw
	erA9bZt9hjEAWRrb7FM0EvcP6XwAHIQSPBA63XbmnPj4iSRu7/pLRxyqS6jQSXJP9i63nAaLmaa
	q5lIpa55+LQ16NwLU+d3mNsottv8s8TuK/8/Mf5+XwKY1fGtoa7jlt6hxZMReuDqmyZO5HN3gqc
	WhlFtApB0Hvl4yuC8CW/jOfvHERTywQtG+F9UOm
X-Received: by 2002:a05:690c:c043:b0:81e:d001:e0ca with SMTP id 00721157ae682-8694d6bfd6amr22479137b3.17.1788277909383;
        Tue, 01 Sep 2026 08:51:49 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5e18114bsm77134827b3.7.2026.09.01.08.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/24] alpha: discard .eh_frame and the relocation sections
Date: Tue,  1 Sep 2026 11:50:32 -0400
Message-ID: <7f44a90b0479bc98b15fc5ff4095ed555d33e805.1788277742.git.mattst88@gmail.com>
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

gcc emits .eh_frame for Alpha even though the kernel builds with
-fno-asynchronous-unwind-tables, and nothing in the kernel consumes it:
the stack trace code scans the stack for text addresses rather than
unwinding DWARF.  It was allocated in the loaded image, so dropping it
shrinks vmlinux by about 1.1MB for a Marvel SMP configuration.

The .rela* sections are equally useless, as the kernel image is not
relocatable.  The linker was already dropping their contents.

Both were being placed as orphan sections, which is what drew attention
to them.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/vmlinux.lds.S | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git ./arch/alpha/kernel/vmlinux.lds.S ./arch/alpha/kernel/vmlinux.lds.S
index 95704e64b6a6..c44941d3b874 100644
--- ./arch/alpha/kernel/vmlinux.lds.S
+++ ./arch/alpha/kernel/vmlinux.lds.S
@@ -76,5 +76,16 @@ SECTIONS
 	MODINFO
 	ELF_DETAILS
 
+	/*
+	 * gcc emits .eh_frame for Alpha even with
+	 * -fno-asynchronous-unwind-tables, and the kernel has no DWARF
+	 * unwinder to consume it.  The relocation sections are likewise
+	 * useless as the kernel image is not relocatable.
+	 */
+	/DISCARD/ : {
+		*(.eh_frame)
+		*(.rela .rela*)
+	}
+
 	DISCARDS
 }
-- 
2.54.0

