Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33AB28DB55
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121229; cv=none; b=DVBgf7Kla0Ki+UVVtyrrjh428qGGRR8eJw4Mj4AVMAzQPDNn6Xe4zwLbny2O6RjfnOPEp7gTd7ObmKxu2syFOSrO7+E3FkK0u1ZGqdGII1Isjza78/aZ2mNN+xDfs6RgGPRNCS1+ngLqwwAqZJezjOR+XezqePRtW9qxO4x+GJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121229; c=relaxed/simple;
	bh=/VlbzGT1I3JhT4kb0vmmrNMzk6JfXiX50KYaXup3DEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=piBKkEawqT/dAWDmRvT6TWehJyH88GGwHX4ULPo4LVNRl64AGXoP8Gtl/OEzCfAuPkzLFuNpDLpXVOUPucHR8aUh8z6bBdMz1UBZQY2ZB3M8MYxIKKfrrRc/BG/IgOl4MFKmWw2OX29zPPrZGZsSWTCnces2UJvIjsv7jG7Wdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOEZI/6u; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOEZI/6u"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-88834d30002so3089729b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792121228; x=1792726028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y837x6zsLDY7Lr6OWbl3JVY9ardcrHQBqEd20U8eVmY=;
        b=aOEZI/6uYuEBzCmL/qo3vZLbAd2DvnZRQ6K1uPz77J4R6gxeHkqNC45Z2nhAamMAul
         CTKwc0IdckT4floa+zCesYjin2tKEFeiQZIIkyMuRGCCY/pZQYfhMyUxKBGRU2jal3/K
         A1V1S6NjwHP/kfkADahCdnzCYdnQHyB39frqhbLeE7j0exzONjoy/wiyiA+jf1Y8fJvo
         0f4eSbEttlV3wzTjYNrfhZTM58nzFmFIm9Q5KIHpxyTtKn8uQkCh7VBuaZ3jeIreTGWI
         rNc9T8IpOZAX8Uj84qRr0TEuDmEdY8dqAuhOPsFOkHNAZZYOFFL5BaiH2mV4JLqBh+Up
         mXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121228; x=1792726028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y837x6zsLDY7Lr6OWbl3JVY9ardcrHQBqEd20U8eVmY=;
        b=UOVaB1NSLLBthi8s7ID4tLoZC3/n/EoWRSRILvMpP1+1iQvo+7fpvVBn4nWTbkzeUz
         7KwzyEVIcslgI1/u0x07W0ArKDfSFFRec5u6PKan5Xv6jQvCdWd0VH4t6KLBXzDOZQle
         +YLD9oC62AqUyuPRukZTG6Jh56c5/g1YgH057x0/e+8bqEUqDrZHb/9MpTesJLERWHdl
         GsOECjUF4iTxj0J2+Br8DwYjlRMPwqIPuBmi63KhBsQeNFMAvu1g5x5jBI/galeFmKfa
         WYIwTni/jnM/pkbmXkr43xo2imDYFyrwb3GQ5L17Rtx3JUunj1MfhvA/uN+kTB4esmLI
         7sjg==
X-Gm-Message-State: AFq9FYI7Crg5MaSq6p8yr9ujgLFSqcx5NDsgNQkdk1tGJjzT9mZiVyZk
	LAPhHm7xUasgRoRgQH/d4toPz3VbTJkt5H/IaMmCq2jSdcpzLm70fEdF
X-Gm-Gg: AYBFou205KKd5BOXirErHx1+dzA4aMvANEYFEJpiPg1z0ImHSycjg/FUK6zRdbe2brP
	3SfTEBD/zPiyj+phyMneifw5LNxZnbZvuYOdJaO4SuFl5gCvVNb8W+Mpt6bIcsSBbNvRa5wTfpZ
	sN/wyczbWD0FY0bstThOeKpt4gUKh6fkZ+RienFho2XvGJi1SOVPTzspf6ojvZnENGmGNrosxzX
	CcMLmNoYABUIX33QA2Twj+TvW6X1MxsdCb3fYRfEbwvgnG1eDqvuj+YqXa2980qr1zWrv6ACFI6
	5Jb792MlQJnxIoQcXjVs6NP3b4h6eKxFecTu3mwJQg2iI+NiljklAAQkIX4w5FK5qPzIfIGEw2q
	9J+orlSC18BKxfPaB97c7zjtxOAg2KQwtQ2rch2GZ/QvQgMi8B60dtMhYxqwd5AFKeLVOZyVZ/4
	m0mlofFzDuYcg5h5Sx5Apec8qfYAQFixYUvVaW2ig07eDbmB0ODWq+9CAX2P5HDA/b2VGee09Jv
	Z4L1ABa
X-Received: by 2002:a17:90a:d2ce:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3ac99259edbmr4024010a91.31.1792121227907;
        Thu, 15 Oct 2026 20:27:07 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3f3ce5asm305110a91.3.2026.10.15.20.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:27:07 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Check for dynamic_events before clearing
Date: Fri, 16 Oct 2026 12:26:32 +0900
Message-ID: <20261016032655.82009-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trace instances do not have a dynamic_events file, but
clear_dynamic_events() is called during initialization. Check for the
file to avoid a "No such file or directory" error.

Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 tools/testing/selftests/ftrace/test.d/functions | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/functions b/tools/testing/selftests/ftrace/test.d/functions
index 826141e299e5..4f2abb05e365 100644
--- a/tools/testing/selftests/ftrace/test.d/functions
+++ b/tools/testing/selftests/ftrace/test.d/functions
@@ -84,6 +84,8 @@ clear_synthetic_events() { # reset all current synthetic events
 }
 
 clear_dynamic_events() { # reset all current dynamic events
+    [ -f dynamic_events ] || return 0
+
     again=1
     stop=1
     # loop mulitple times as some events require other to be removed first
-- 
2.43.0

