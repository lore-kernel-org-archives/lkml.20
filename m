Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFFE18CC13
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788585998; cv=none; b=fkFEd9ieGiyA5EfUo1svRMt5uCYhzg1TPf7Z9eSmwcgMywUNa5PipdIaemg/lcpbtOCk+wwUhlDHONBsN4JVySyuWF+/R5hVgHNmwek82Am7Ul2sFDH659as3+6v82N32ewgU270s69sXki/xMahaXmZcGCsQC9hA4t21/fBZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788585998; c=relaxed/simple;
	bh=jjflGscwYtudxdZnHYIMwnz2V64NNA/6DVxhk1ezhhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZrjW4/k2jdeejXLIwFRgiuGJrWaTYBW/U3B3nNJGZEyhYwYEtxWY2E/Pl80G+EHIPoDzzRK+QYB9vBy+AwBiKEb4rzMiBE5fHUVXDPvoqyDjbbLQ5UgBqqei5TC3XVzPogRhHqTu5UcQL83mV+UlGoaCysp6MBbWIrvs7f0vR7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZni5SJz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZni5SJz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso14805405e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788585995; x=1789190795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHKqV3GoiDC8ykENHF+0la0g7JB/SkIgxNqVg7j65gQ=;
        b=VZni5SJzcJZvmPbZupSwSQdw6cVDDYjTUm6t4HpWqcnINqLhgiBZJp+oQL40ltuNsm
         wrv+cmy+ocGttAvmRbmRULbc+c10lNpCbQ7E/FtGlkcEKRWLuHpd1RZJi48U0c1wQ6rd
         RMiXefDQwjVjHOQ3yTh+Ji6cWjmSYwTUDnlldOFLHcQmvQZhusGvHT4FZU6sQmMEufHS
         ofcd1hflIxZ6cdH1gCmLdoE2FTVIIxcinugHBMaBaS3G3VCHxORc5rUgPOveXk8ZTZe1
         QKiWRXJoLLHP1DX2jARaThCVpBCXBwi7aG0NB3U87od+NO8FU/V+M2HSlyDnXosRKXws
         u3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585995; x=1789190795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHKqV3GoiDC8ykENHF+0la0g7JB/SkIgxNqVg7j65gQ=;
        b=bfKZAaCX2rPEav7Qr0cxZ1GcsJN4PZkFobkmWo5ntKnW8v0A1C8B9fOWOu4TnMusOf
         ViC3XEDpfp8Pk8F8+NfZY6e+uVIE1Za5JrxvC9TdvVOJNKsSg6TQmPEXbsRu9ICAHKem
         ytqgv/3CQdmAhVNhLMB++cLPOfcVup4qQYBarqR9m3OD7s8x4vZfLNMZZztWCV9wQ5g0
         /ZY+E2pQZCRiWhC2V1LEr01kzxqdGtWRFB9nIDZL8hs/R9/U3O6vgQpefQB5VVUxsdBX
         4u1jX6io01X1zyzWwPqQa3g3U0YKS/KWwwgHHebCPujovwJyyB4P0u4RWUBl2faAWPW6
         HM3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy67JFt+QgtVC9BKOWrBW6ozD+0d6Csh9pQGtUQu4SPRshbMyx2r8oNuJWBZmhp6vzFnJ3HPnZErEDEj/A=@vger.kernel.org
X-Gm-Message-State: AFuF++nShMV+b0ROJ57ZS9UYxs4jAs4x8oFrfZ/NwGtlNZ4EisrnVoqE
	+B5Cogwrpw2JaWDWV5FwUql/tbpZnz0H6+Lx2ucxXKyzLnQgoqL5MZMh
X-Gm-Gg: AYBFou1JaO6Kn0JAw9mevfWIMmWdS7wx9NKfERBt9VeM10F9/ULRC7/YfGmLAB/u3qt
	+CFgUtKiK7q3lzDg8K2R1JwC1DbMwneX5eIbTzJWR2guva8GlbTS7N22JNW+DTNpfW6QtwW5MVb
	UMj+3RzV7k7pifwtfeKTMTgjU3eueLCqFZc9Tc5bosQvxdhgXMfnwpsPC1NGRLW42jhE6XlRVI/
	1WusvdgWIwr8auvVK7+6VDVJDza29Sg4Mck7bFwbNcrPWCZD3GYka3MyfvboJ3oNWPL+WPReEh9
	2pXDBhyRTSEGQk/izZc79S4n9T6VBIggSMatbVEOSIOwbHSq1lP7cui/xNaBKTNIOm8AkXblBHw
	hhHZDEgfLd+zUVazbukp0Y0WZXdONIDraM3awPVDlsybyNLZ75PbzHueltAsmse2CQHW4zVG27+
	1QNnQHkemr3uVRvoJJpSsTDpjIuz78vP/4eT+M3/vL/jIMlhdxZ4mvkd8=
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr95872415e9.16.1788585994655;
        Fri, 04 Sep 2026 22:26:34 -0700 (PDT)
Received: from zeph.. ([154.192.250.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm66073735e9.4.2026.09.04.22.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:26:32 -0700 (PDT)
From: Muhammad Israr <7israr.work@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Israr <7israr.work@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_pwrctrl.c
Date: Sat,  5 Sep 2026 10:26:13 +0500
Message-ID: <20260905052614.8201-1-7israr.work@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch tool flags msleep() calls for durations less than 20ms
because they can sleep for much longer due to timer granularity. Use
usleep_range() for the 1ms delay to provide a flexible sleep window
and avoid inaccurate task scheduling.

Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8..5ef44a3ae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -410,7 +410,7 @@ int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
 			return -ETIMEDOUT;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
@@ -561,7 +561,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
-- 
2.43.0

