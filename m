Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00273B14C9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408219; cv=none; b=i2E8P7keW6agXermXqj98s05mzflpLELg9r5QkURxBjhUJuOn4ngssvSMooyX5N7DsF87JKHexm4L6xiKIY3LB5CQzFwNWjO6nP5hHdkWvtVtkaA32GmgGI6eoqN5degZ/wN8BsQhXebyGnLd/E46wlmJWphFt1ncqrY+E5fvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408219; c=relaxed/simple;
	bh=3ieiHI/Mp/GNcGFX02Qg6gwoLtt+hpQKuZUcqNDGkSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWlIyCrqmpksosDaUtmsO6KPrePOYIUd3+k5UVu3hJPltzz4twWFKaESjctbdui06hK20NzqADcp58LUJpL58adonF5mMJi3bH/weJpbynxOF53/sZYKgemrgQo5ljj+mfcgAwtkSkpCnEJNxX4HS1+E8060ZXzjRf+3l8hPtA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+4bPP9k; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+4bPP9k"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso17538845e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791408216; x=1792013016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOHdvDth2vK4aVaNOG+jUkLGd78RtGCVNS/yVM6geL4=;
        b=G+4bPP9kssXIg2LigkBWmvG10TxDgeyqCH3mjwQgy/49QzcLVxH908HB0v+JIKvW4A
         IQbj3q0pUblFRSI1n3HAM9hMvmWOyaX0OEB8TTNmTfl2u3w6Qmb1Ac2VfdF8PTZB7na8
         52x8F2wolIer3Urv1sExr9d6Q0ItYv/scdfIGgmWMzuHuxqwvYdEX+o/rHd/fnqQ3NPq
         jdS7nxWcTajbgmNa+L/3+mnAF035+hAcMBcXXJj9d+43k0TBpORK6L80hMGS6D4u3cw2
         1QDPD5d+FgnlMFA8/AO238HItRWWA+vXpoy6f+dCTIciXpNvdWwos9mew0TTmgn56Ai8
         CvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791408216; x=1792013016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOHdvDth2vK4aVaNOG+jUkLGd78RtGCVNS/yVM6geL4=;
        b=H4yavWCXyhbdVyTB/zeoBzuvIlKUdTxqZ00xXZjW+t8dhXsvz1ROsONx8AgiiqFPYG
         oYArd7ActfecZWhNpCazRr828zdSAYZ0RbJi9p0sHRoagANw6uKh1of5fPFzEjSFnmQj
         xkx7n2+ihqQFGCphE5p+MBQdv3HrRjzSn8W8uMn8Si2tdZ1GFcK0Q73yRPtDFV3nPKKh
         Nkm5Ob93la+tMz8DQI365H4v55yFQzU3kGBLhbbYWTgR4bXMxrien5pJpk/VBEl4iHsR
         fd88QUMXkfW02jZ8vUnanTBfdy02F3IidlopcUtOxAG3NH0bZGNTEVt3txqfqGO5DINw
         gP9w==
X-Gm-Message-State: AFuF++n3uEq6w7vk4IaFTPm59FVExYIQ1rKSQ9zYEfed0Z0dYX5hMFs8
	Xb4GgFwCFq+TzJiYzGqVD31vG3hcv1HAgcMZhMTYtMJSOANkCPF3RQIQ
X-Gm-Gg: AYBFou0JMVHuj9/DXf0DYe3979pleDNs3d7hXWfI0oYoKbM7DH0N1xKzb9BwtJGsSgC
	olFf2z6jiArWm4MQFfUw62qYoRznitLg1X/ZKr55zrdZnNtO9Za0quX1A9nNVxx54zduthd4yC2
	AuIvyKMxi8exDQuOxXMTRr6UBgMxH6EWOEcgexPZ/KkV70VN+ZOOw2t1SXFNwRaWi1UQ21eRDaT
	CqNFSubKq/xfnXUHPf2WmCEvnNnnqlXFN5L1DLdCMY4hqjBAuWokmuKTqzM0QB+Q93WZ0Z3xwX0
	0Jn7QokdZY3Tea+ny0UxMeJVYIwkrqdqRtFjDW/0gT3IOwSeevnzVOg0IycMnsinvEn1FVmQVmE
	lfBl0GDG9EF5ljcuYL2jtn0szqG5jA2sWu1h9rI03xv3HulSYvO5Qnn/A8b6pIYzV+QYvV1nD4M
	WPV++tTFz7xaIrFTJsd8nlPyXDe9hIvSMCNqa+Qh6wb4HVmSFP1UZNRWmiClLhJSUbSG2fcHLhr
	wEio1liikGpYN78SiDkSZ73/o56qThvmPmkxa9vUUfvFPoL86xERVPq3P5RvHDSWJsLi5P/
X-Received: by 2002:a05:600c:5252:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a18041c4b2mr61608045e9.12.1791408215819;
        Wed, 07 Oct 2026 14:23:35 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd59:2b00:37fe:a06c:16fc:545])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18445b6b9sm18424395e9.8.2026.10.07.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:23:35 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Matt Turner <mattst88@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>,
	Kent Was <waskent6@gmail.com>
Subject: [PATCH] alpha: remove a duplicate line in Makefile
Date: Wed,  7 Oct 2026 23:23:14 +0200
Message-ID: <20261007212314.969336-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant duplicate line.

Fixes: 234306038064 ("alpha: Fix bootpfile and bootpzfile make targets")
Reported-by: Kent Was <waskent6@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222101
Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
 arch/alpha/boot/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index d8dba85e606c..1ac823d93801 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -99,7 +99,6 @@ $(obj)/tools/bootph: $(obj)/bootpheader $(OBJSTRIP) FORCE
 $(obj)/tools/bootpzh: $(obj)/bootpzheader $(OBJSTRIP) FORCE
 	$(call if_changed,objstrip)
 
-LDFLAGS_bootloader   := -static -T # -N -relax
 LDFLAGS_bootloader   := -static -T # -N -relax
 LDFLAGS_bootpheader  := -static -T # -N -relax
 LDFLAGS_bootpzheader := -static -T # -N -relax
-- 
2.55.0

