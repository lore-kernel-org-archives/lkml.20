Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B9348C77
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779917; cv=none; b=s/UtsBA9IDqOk85Q9OpSZK0q2fz1dAUb8MROjQ7Co9+m/Uoh+OO85F/di9GAiXMrZITTHxvcCrYqLpnPqp+JRS43UBDoNpLGn3JHciyrr42FsmD75VgkQvfStm0nQPcL42/9uI+xGBBs2QmnSPduTTVd2uznKWVgoL93V1uRuWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779917; c=relaxed/simple;
	bh=SNPzm5JdOhbwwM8EqeYbuS4iFwsKT5z6aGCH26wH+Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pB+cDCCPyKqb9NFRpZjbNKuryxZoznJPImuPlz7MeBz0yZU5PS5cb797jhjw+dsijo1CeMdM3kU+Qb5KhB/F+YQAzGVOp1UOlDToeHFHwtfWYBO91drnX4nvZP7an8tXFSEXKUGnfDFMI4wzHxZqNFCxFJOePVBSrP2vzxkvYrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL6DNxxP; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL6DNxxP"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1863823a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787779915; x=1788384715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vo+9nPRwdIVHjPr+RVsyNENB5+Bs0JcZeloNo7tg6D8=;
        b=CL6DNxxP5yZJ7d+DLAizHLHLRz4RlCJMIwGxlKZwG4Sa2IJ949jD8rychNJiQ3XlIf
         jtUkB+Y54jEQN8N9A/gU9X2H34SfaZ7GWA7M1oWhV9CfxpkbRTFJVhX0V8vD0ormaokN
         U5zeorSnpeRmRbytKYo73/b1s0u8k4bVaxERC4FGmQMopNxf/oBiso37MvipqdKxzxdz
         cGEeLJVQ4xgHCtcapoleYJd2kILT8Jl2+W/ixGFAUz+2yoTGFyM+m/CYHDF2jjlpXOgd
         /FfHPe3sIZaaALMxrYtkIAEazy1eN8HHl+/TVITAVFbKnZbxyuBs5YaN/JZXaHhQ0Ygt
         erAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779915; x=1788384715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vo+9nPRwdIVHjPr+RVsyNENB5+Bs0JcZeloNo7tg6D8=;
        b=Ib6c7dNh1XyM6odtzMP17IDQNhR0kKW0DGOhB8dwbmEveQUQxDYRK+QHLBziXH2yD7
         y2ZTE64vr/YIBGwMyYaPxkbIe1rpFicqFGa72K0/oli+r394jFgAAbNPx67mVGLUyO7N
         hq4E9eCwcdsLhtkpy1iFggv9MyM5VvwgxjgOf7jNKJHj+c9zWvyrxGHiTB2f7fDUolYg
         4yqGZgxABgeLL4/Zdsct3ZIrDpJ0hb346J4IHTQz3vQ5caHTLSGj2x+acJPNn62ozJG4
         vZlYRKFyrpy7AMUcYx5Mlt0fqqLafwJHi80lkdztPZjeWMh7gSoHsfwv3KecoAgAho8a
         Kvfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0yoTgBvDvCNDaM14sHGtB1sWSzuvVS5xkGVIhBrho6Op9Vm2nz1cOeePXEt6WXEabyvAfoyMQOi1Ro9I=@vger.kernel.org
X-Gm-Message-State: AFuF++lFxd+6m8rAicbuQJgkxbE9a922BFF3nL2qnSm2w7EXyCGUG25l
	DpK4e9ZvMXZG4miEUmtVlEqIx5U0ZaOo4nWEGbk8eWMex0LNpel9zCL/
X-Gm-Gg: AR+sD11Bv84uIdB6I/WnEhjUO256mMAJOERuovGSticWTl2S1aeMCFCiZv78EICkOu0
	7wcwd6R7oUSL5etWWmFKdl+fkgfedE1TQhDZhiPai1DkINF65yFYoeSYPUbRjqMXPjgU1met+nk
	4t/EEVMFd/qS9YXZtmPsJ6faspwwyG3Q7QMi7Cu2rE9P86/SQom/mtid+yBuVwLe8NNtfiVeX4I
	KSxOiHgBbr53FuqM1fADBehfuQ9QUfgJtsW5HN2r47b/LemhIUrDEKLctqIz3ALTar/zwuoDenc
	LHy3X8hTl2vnML0tHFxZeneljHI1NeFyWSu0flCpWi0XvXnJ6i33RAQCJUvZnOSgHdaUocXm4iv
	i1i8OqePTkh2d8+5+0j5mmkPT6AuCLoG+CEW3xPr6BtUmbI8X8ME9oD7grZNKnYdVmNthIreVBN
	wmmvtf4VFFrFFh/hD/O5QanCm/Tj0H0ib5m27c5p1E3jWYRn0ar5Zu2fA6tC/PQFeKzpbSMKuoA
	5eXHk/0EQ8ldphq+08B4Z3V4cN4T7RLsUudGtneIF0Yfg==
X-Received: by 2002:a17:90b:1e46:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-3966d8d6220mr17244323a91.16.1787779914570;
        Wed, 26 Aug 2026 14:31:54 -0700 (PDT)
Received: from ubuntu-vm.. (c-73-189-122-63.hsd1.ca.comcast.net. [73.189.122.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905b959sm10291147c88.13.2026.08.26.14.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 14:31:54 -0700 (PDT)
From: Rishab Madhugiri <rishab.madhugiri@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishab Madhugiri <rishab.madhugiri@gmail.com>
Subject: [PATCH v2] iio: core: Replace BUG() with WARN_ON_ONCE() and error return
Date: Wed, 26 Aug 2026 21:31:40 +0000
Message-ID: <20260826213140.37437-1-rishab.madhugiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As documented in Documentation/process/deprecated.rst, the
use of BUG() and BUG_ON() should be avoided as they could
cause a complete system crash, preventing further debugging.

In iio_get_time_ns() and current_timestamp_clock_show(), the
clock type is already validated against supported clock
types prior to these calls, making the default switch
branches expected to be unreachable. Replace these with
WARN_ON_ONCE(1) followed by an error return to avoid a
crash and to log the highly unexpected condition.

Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
---
v2:
 - Use WARN_ON_ONCE(1) instead of WARN_ONCE() with string message as suggested
   by Jonathan Cameron.
 - Reference Documentation/process/deprecated.rst and clarify unreachability
   of default branches and reasoning for using WARN family over BUG family 
   in commit message as per Andy Shevchenko's feedback.

 drivers/iio/industrialio-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 767a7794624a..819a864d1136 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -341,7 +341,8 @@ s64 iio_get_time_ns(const struct iio_dev *indio_dev)
 	case CLOCK_TAI:
 		return ktime_get_clocktai_ns();
 	default:
-		BUG();
+		WARN_ON_ONCE(1);
+		return 0;
 	}
 }
 EXPORT_SYMBOL(iio_get_time_ns);
@@ -1518,7 +1519,8 @@ static ssize_t current_timestamp_clock_show(struct device *dev,
 	case CLOCK_TAI:
 		break;
 	default:
-		BUG();
+		WARN_ON_ONCE(1);
+		return -EINVAL;
 	}
 
 	return sysfs_emit(buf, "%s\n", clock_names[clk]);
-- 
2.43.0

