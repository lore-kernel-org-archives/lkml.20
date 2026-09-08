Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA35B58F096
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886522; cv=none; b=fbmDf9VgYYRuKCkB0XQ4ihmHaZHwUFbp9O3cmEkilbrXuMgn8/DeQSUW6phwZDJnwXYehT1Y8iTxftnUghyfnCSzoS3RlD5zb8SuMDauV9rMLLRSBaofxhF6WJ6DuKFIMV7AMr6V95mE92fDIKvZEyJfFK+u27WopiasvC1+sLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886522; c=relaxed/simple;
	bh=nI7UZDHKHLOeR8gHis7kZKBzbvddfeV62d7kRLq8zjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGPOCVcK1YVvKA3DBH1lCYZOKpeg6UO2lmoqE/sihEsREkCyhrKreSiZXDGPyeyNzKknQbDwSa+Fg+UbbMfqZ9KWoZKXLj9oQaXm/3+dgFD80s3WjkaFMDRwomCU5M5r7OEIECVTEpYRV3iOXSLDQTdZbPhbz3VtcYI5MaGTo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vPFjOiAh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vPFjOiAh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso140915e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886519; x=1789491319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaUxdToouQ436sBgssARKpnXWAtos5uuXm7i5Fmx0oI=;
        b=vPFjOiAh3PIhjxKpyCuEVEVzbKmOT85FVCeym/wCyTNOL3qS/ISPnrbIn4wqiDbMdI
         e9VlrcvB2M9S8fnBlUTceBA/vHasI1fzZIRhIpBxkLwn+3UQPWNHaZTahaUTrQFWT2h+
         h6kEgCTlIcHb0XG18LLCsyhTDR++O2sKYoY2TH0fIvg3cLD/WuUMbkRreT1rUjZfbfDO
         ujhPQF7Z0cXBkZex90iW91OhZGQOztVvQ17lnP8mccLai2ixYpp+Yhja60w2kqKRXwk4
         ONruhpScJDwpcF6xbgYTafUW5tkRZ9TdHGp1RxUWbcxBT6uKbqEAKafpXjZ9Phte4NUH
         0BgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886519; x=1789491319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaUxdToouQ436sBgssARKpnXWAtos5uuXm7i5Fmx0oI=;
        b=sVlu9/LunqWBDa9X1oN9MmveQ1IWhOL0+dOJUZZlbAgZaR0tyHrc38qqkkrh29jHI9
         zGezq0dS3FcWFAoyUL1wvN4spto6/YdvCQfk/jS6wsOo0A6B4Kt5g4VXktGbZjEgH4V2
         xhZLjaMsUlNVVy5MhwhEeW0P9SnCwT8hX8ElyeeiXOE5gGRioZep4GoyzoHTmIzMcD4I
         60aPwOwh23w2VyUhR69iLG+/vHC+W0wrbOjZEoh5ki4mLAMVnr8Rv/sbuhUtXwBb/HQT
         hDM3287eu2iGVjkgd40fb6jSbRTK5/z666Vx65sh/t7bWCxfc0FYDduKvIpnLl/qL4r7
         U9Fg==
X-Forwarded-Encrypted: i=1; AKwUvByr9N7KYyai3ZSwEeSdSWgdjM4CgrkQLtIRodLhxuBljS7iLfNN+9RYvJIn9cyMQYhlX+2uVjLb0Cn+UTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n3Ul7h3UxuCQrLCfgngUBmkAcEBoBZZO40pQVEoduSp3LuX4/O
	yyxcyt9CPGpJAkMoT576qg4WwqIInXo7XuXU3JyZsWhUB037rI4Tta7IvuKiXnRX4w==
X-Gm-Gg: AYBFou2nz2urtUTOdd3XV7cTktg74imZr6um8p8ruOVnztZtzgO2DRiS9A1lFTLr2am
	Q1z+XBe1gwRr/tR2cCjZaB9iQ8e1c57E8Wj/+FkfxiOPZUlte7XhaSsbVG7+PKzDgGElEW9a86s
	k02RCrtOBsvwxy258AX+D47TIbedRkHALPve66h44/TeuX09nUKZbDiOUaob57ZfSUBEwx+JPh4
	pCOCqji70ItF94dKQXXebvsjyX5AU4IPSRFIF6CFUcWj/MhMr12ce3NWJ+JZmDVYFGaUTn1EKdI
	FfXtdxft2+S4znFj31VQwVpffPHd7aftGTmYJzES0W75KyBRTJGCZcpCkhWJbLoes1RKvr09Oif
	auyme/o+0aMxHRvq8Iym1RK4lqFyRlOVJvFau6Y7n3Y9jBWlR1PYJRajTX6dlvamYKMj6THee2v
	PUpybaXAqxQq1+DhRLIwXLgZYd0Si+DYXQAuwEv+fRp4E1YmA+cEVc2Kxm9xUkaKjsBAoPgv4kR
	wfL7RE5rFTGq4T/tYSIn+oTLEFNmkW/roYAuuldv20Wl7Rx
X-Received: by 2002:a05:600d:10e:b0:495:4593:616c with SMTP id 5b1f17b1804b1-49d1f3bc3bbmr19965e9.1.1788886518456;
        Tue, 08 Sep 2026 09:55:18 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm36061757f8f.16.2026.09.08.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:17 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:50 +0200
Subject: [PATCH RFC v3 10/12] kcov: log old value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-10-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=2312;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=nI7UZDHKHLOeR8gHis7kZKBzbvddfeV62d7kRLq8zjs=;
 b=Lkb5Mmm5ypM1UlMzH2etDVDhjeF5GU8tDa7HVHPAceBtEplvzPo1Dw5v/cbOiOulRWKt0hmfK
 2WnKTrkqFwQBC+8ppvbSQgDl2Y5GEsO75520U6hPrKQqxpU6Q/iJXtN
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

For manual analysis of traces, log the old value at the memory location as
part of the memory_access_record.

This is best-effort; in particular:

 - the value may not be recorded if it has an unusual size
 - the recorded value may not match the value observed by the instrumented
   memory operation in cases where the value is modified concurrently

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/uapi/linux/kcov.h |  2 ++
 kernel/kcov.c             | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 76822d1c119a..235f73e11d59 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -91,12 +91,14 @@ static inline __u64 kcov_remote_handle(__u64 subsys, __u64 inst)
 #define MEMORY_ACCESS_RECORD_RMW 0x20
 #define MEMORY_ACCESS_RECORD_ATOMIC 0x40
 #define MEMORY_ACCESS_RECORD_FREE 0x80
+#define MEMORY_ACCESS_RECORD_VALUE 0x100 /* value field is valid */
 struct memory_access_record {
 	__aligned_u64 ip_address_and_kcov_flags;
 	__aligned_u64 data_address;
 	__u32 size;
 	__u32 flags; /* MEMORY_ACCESS_RECORD_* */
 	__aligned_u64 time;
+	__aligned_u64 value;
 } __attribute__((aligned(8)));
 
 #endif /* _LINUX_KCOV_IOCTLS_H */
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 88aedaf41a9e..ef405940a2cb 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -1267,6 +1267,26 @@ void notrace __kcov_handle_memaccess(const volatile void *p, size_t size, unsign
 		.flags = type,
 		.time = kcov_get_time()
 	};
+
+	switch (size) {
+	case 1:
+		__get_kernel_nofault((u8 *)&record->value, p, u8, handle_fault);
+		record->flags |= MEMORY_ACCESS_RECORD_VALUE;
+		break;
+	case 2:
+		__get_kernel_nofault((u16 *)&record->value, p, u16, handle_fault);
+		record->flags |= MEMORY_ACCESS_RECORD_VALUE;
+		break;
+	case 4:
+		__get_kernel_nofault((u32 *)&record->value, p, u32, handle_fault);
+		record->flags |= MEMORY_ACCESS_RECORD_VALUE;
+		break;
+	case 8:
+		__get_kernel_nofault((u64 *)&record->value, p, u64, handle_fault);
+		record->flags |= MEMORY_ACCESS_RECORD_VALUE;
+		break;
+	}
+handle_fault:;
 }
 
 void notrace _kcov_handle_memaccess(const volatile void *p, size_t size, unsigned int type)

-- 
2.55.0.979.g7e5102b832-goog

