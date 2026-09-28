Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9105C31F9A0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560935; cv=none; b=mt01OfswlChLU4+Btgz+a7enRYYJN/En6zh7j8O0JQx0oUoUyIBPJFUwwC9v2AHvI/V/QBXxVkf8JxGS68i3TbF75ovmNlfirAPl+vKCY+PyGWNcGXgNDxoTRpwGqCfESbee5SU+Zn4ZIKNRRMrgHuJi7Ew3WdU9esgFNbY3Dzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560935; c=relaxed/simple;
	bh=urQbLGCXrd0ZFZeVKewiensfGBXy6svoBuruqY3dA68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUf4U7eRjGXdb6o8DEgOxUkEU5DFyqQOqfGsvBygGrUm1JQeoCjgNIey5b9awyuTIGpZ6OIRatixDmW84uyP0LWY27XXIDDTWkI2KMjAUliM3+99FgMw6sdABfkG5UbG6lZYgOc2W8u0YhZyHOKISitRN/ZtoHVMOj/KGHmXMZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sDS3JOxU; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDS3JOxU"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e22e123350so2047185ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790560933; x=1791165733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ASjAUGOmT1ysmFExBD7PO6pvYBzwb00czBt2hidD9U8=;
        b=sDS3JOxUXnhYUEQ8AWzYnafjzU5CaYdRWCy5KO7z9GP32l3d+CQ3JouXbIIaHnijmV
         ybagc3WuN7c+zt4SawiNjSPmNy0Kje7D9rUg2h17YVQDjoV+RFq+OXlljp2fYsdjI0DZ
         SMfJmOH87mNfgFqzg9nUAZaGHlkqVsi1uXWIosbiGe1H+ccbmTxp+uJQHCDt41i7eyU0
         nMP1kJEmy79W+A+m0lXhaG657Z86k51ZyWicXgmFCSMEoT7GYTOJRxvOdGNKd3UNvIpN
         w2cnNWjhh7EZ3+jkK2L9pHMED/elCkFnxF3g811t74ozGFbnaqoFE7bpa6An/XFPYOI9
         Gwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790560933; x=1791165733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASjAUGOmT1ysmFExBD7PO6pvYBzwb00czBt2hidD9U8=;
        b=IGnNhTbOi7gd106nxouMpnrtoon+pPM93flqAme+58BM1/WYzt0bWtUA5IbUiuXJqW
         TpT1KCmwbnEPSaKy29ycueRdiiG/AcZel/3sHSuFrGXpbqa7ebiscx5sfJDyu9D2ql8A
         Cap+QfYBGxi5PZMXyoDlYibgduvPTkWAshT3gxKjHB0Q/V9PI7PqhMEDzTp16qoGK7Yi
         Gf1yOA6CiXPE0jQJTa+fUNVMqv/P8ounJOdIE6HnOZEVBkhxe+G4K5YjY9EQXV0bmhdx
         w2cGUdG+Jfm6eY6ra9LJXWoXAoH1Y3d+VfpEC0EOgnXKSw66jU+2sv/uFU+DuQOehYFW
         qphw==
X-Forwarded-Encrypted: i=1; AKwUvBzlLknePWjycaVM94TFQjBHHp04V5lJpFZZR8pBCYdBVnD3beJFkFFLAiN6xsHYh49QN8JewhBwcKSz0A0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiRJtuVmM3luCnWmyhV9zLFJfO4mdr08az7Xv1YXfuUrWkybhP
	kU4lmiJ7lauwih3bC58+mp36UvJ0JrilCDRKOSjUEott60j4ggpPDP2H
X-Gm-Gg: AYBFou3lZu9bFdOrnr6BO2X/a9y6GwO3P3SuGh++IkOgIJs7XcyKwl0Ab0qJOOx/SnR
	/6mijg0B+/a8eFBZHjBq04oyls4JwY8maTtmKxNA80dYOAQuryLvv+P4bv010K1WL8vTnS96nNk
	mCPe617gc83BhoSuH7m8JV7EDxKOwliIhzr9WLFQmW9JRIq2zjP/VfWQ8k+/vO+p6e6Zays1XlR
	Z0di08V1XDCIQQRcZpMyOUEBPn5ImD/G/P4mTH/BeP2wRTGFuZwERrHircrpbBAqFKEH8MowNDL
	Ukrms1pqhsd/JkDLvTya2Hu5u+/vaHZgcVv1lEsiRTKfj3cwyr0f0xgD6uhkPEe1+VveWZJ+YxE
	wqbfl5SjvjKSu+ijK47aXTXpwEyquoYe1ldpirundwKum58e14r1uP3Lujxhuo9C/ETI9/tmES3
	hy/o3ya2LQccBwcnIsfejzPVouYSEKz+l4U2ZHJudPqVsgh51rTrc3VZeKFnSIXL8DXc87L4Su0
	kXnsLEaQUT8u7c11MbnPg==
X-Received: by 2002:a17:90b:2b83:b0:39e:6c6a:208f with SMTP id 98e67ed59e1d1-3a09896d0aamr8645055a91.48.1790560933535;
        Sun, 27 Sep 2026 19:02:13 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e05d674dsm4631129a91.4.2026.09.27.19.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:02:13 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Kees Cook <kees@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] sysctl: Two jiffies converter regressions from 2dc164a48e6f
Date: Mon, 28 Sep 2026 10:02:03 +0800
Message-ID: <20260928020206.977522-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes, the fixes; the tests are already in sysctl-next.

Only the changelogs changed.  1/2 now also names
proc_dointvec_userhz_jiffies(), and 2/2 labels its reproducer with the
CONFIG_HZ it needs.  The code is identical to v1.

Based on v7.3-rc4+ (62f4c998b297); applies to sysctl-fixes as well.

Link to v1: https://lore.kernel.org/r/20260922031229.2300283-1-zhanxusheng@xiaomi.com

Zhan Xusheng (2):
  sysctl: Negate before converting in the int read path
  time/jiffies: Saturate in mult_hz() instead of wrapping

 kernel/sysctl.c       | 2 +-
 kernel/time/jiffies.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)


base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.43.0

