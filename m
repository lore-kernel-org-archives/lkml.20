Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AC31DED49
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281600; cv=none; b=V9ogY37m8MKnoaz1m1v+MHjuFega6+fvP3E3W4zphV36D8mbspP6cSmwk/Q1ZrVSG8QWtRucV5TdY5Dv1gmSBOtk/emRNOn6dhjKldfr0En/oJEBMH7qF8H9OFjoUCVku+vorciwiT1BFFqP5lxxJfhrmS+anuGXDr4nS2xobJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281600; c=relaxed/simple;
	bh=Ry0Efp2D/w5F0Wft7dAy2fsk5aNUcMOXShtUZ8KWKmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVds+vDyWJ7CVfXVRyiVGQLftRCDReCI7OVFCDB/yfe7ZG53TsBaZJJd+VnvT/s6bCZQvtMn2R7ptILUN67vhXsMzWNGIJajT268aHNWUVB5U4IZMQS2d452NtJBfuO0slnpwvIzwnJLLZ/x4uoNJ6ZDjV/Fv6Xo50fEv7Mw12w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIJ4n8OD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIJ4n8OD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce98cb8165so348525ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788281598; x=1788886398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJjngWo89DVxd6ai/hkg9rTN/tcZiu9r0IP6u0ad9gw=;
        b=LIJ4n8ODc4Kw3wrE7MO6HvBfaxGGcXPZbjxOEVNoZTDCgan9nUAee3+9jINtdJEWVk
         CfKau5KXjJEhyr2IG2r1+T0tk19bm0d1oJZZgBjN5JwdOi1INtqKUdRXB5Gr+q2p5zy6
         L5DyRsbv42LKcLOS3Qcr3NMfiRbnpoAouVUMGsbjMe9RBO+BxbDTwiIqGIbP1ZstLPcT
         jXb+zd+iEkbxeytRUo0/rkj5bdSk98UYn2gViAC9puMXgth0kUTvF9Hl4/3bq7+aYdxS
         XfSCiDaaDTnlzeao5OE+DavXURb+SbJgMKNGWV0FHRLL3/4Qvze5B+FPCaXHnsnj3ML0
         BFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281598; x=1788886398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJjngWo89DVxd6ai/hkg9rTN/tcZiu9r0IP6u0ad9gw=;
        b=cm3lR1SPQw/UI8eX0odt8hTzPxSWa6PvGgWZKe59XX4KJI+Vr//97WoJBi1Yin1JqW
         d975xK0dGL8uhWJToma+9E1DmqUUg32vSPGezF3G3qWfJrLUqBeKR82WjMXr72MmZnma
         1HPQiMD2xV2Kxoxg+r6znrhKXVMIsoSVEyr8ufiEea19MWDA6C6Nvgln5BSmPNoGA4Bh
         Icpxxvu348btDUxrphxKhLoyoNb6X77D4ptJnf1S0s3P2bDnjuTvbk4PrMSXAlJDEv6s
         2fvET5rjrWlDF0HtX4ld/J6EvqQlSQGjh6+iW1I3Hat9nCeMiw3ytLCVIJPRlYUGCYNh
         oE9w==
X-Gm-Message-State: AFuF++kl/ejfJbUd4npCweU9XNi3yj6ILb8B5eoJ9bU8d2ZiidQ6Xr8a
	m9Bd375p+59uBQwxIi09EDOxZiOPozdZCPToNriw5ZFgkZx6+rRuOGcv
X-Gm-Gg: AYBFou2lOEj81BZcB6/9Z5XCBkiY6qYsQgkRz9Sw90ks+VOKhjjir9fgb9+TQlQJ54d
	veJOEl6kiEiwOzIGU0O7HXsGwfNqppvZYr6UcgnZ8hPWoz2jvbclWUm8iUPtoGbkI5KLYqlC39K
	Kc1tiR6Q04oulNArz7QddZ/4pPFSeesnL1tn2KhCEO1P0t52mSr102mpyVJLeCsqp0wgTOVl66F
	L2D2OgdB/FZPBpSEpKXMtpNbw5lAIQSnrwZ73Nsz7PiRmplRSBW1NKiKHuN63aSRCc71c0z+O62
	5t52FWAUDWQF2xaCfBk4EZ2DCgKeWyt/x4HEKYDCTjcdNYuNVigBEAdkkxB1q1Xi7Qd/iy9wppR
	VP6WNBTYylEHRXKKtzjnbOk2Fz3JHf9tTb27v10w9JCBVQIWsysWG4I4qFsU8QYMwl4l8PRxS7M
	d1b6h5ASkfzHxM5kWnCUwznQ2aIhOP0dPQrWGFKX9z+IvQz/6C++F0bAQ=
X-Received: by 2002:a17:902:fc4c:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2d95268a82fmr70377805ad.1.1788281597897;
        Tue, 01 Sep 2026 09:53:17 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357efbsm1762325ad.4.2026.09.01.09.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:53:16 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/4] percpu: remove code with no effect
Date: Wed,  2 Sep 2026 01:53:00 +0900
Message-ID: <20260901165307.1026248-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

While reading the percpu initialization path, I found some minor
cleanups for unnecessary initializations and an obsolete return
statement.

No functional change.

Sang-Heon Jeon (4):
  percpu: remove redundant assignments to bits
  percpu: remove unnecessary initialization in pcpu_build_alloc_info()
  percpu: remove unnecessary cpumask_clear() in pcpu_build_alloc_info()
  percpu: remove unnecessary return in pcpu_populate_pte()

 mm/percpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

-- 
2.43.0

