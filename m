Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA6C445ADA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818105; cv=none; b=isi+SgooXdXrIWwvPFwjTEQtbfjnidZMJLu9PFc9jfiKF2NGblG0nUVV44u88a/vjRP36rDzFPP9j5c46Tv2JfJAhXy3HcTGlEUQQVr5aTp4n9MpqYQbo1tP39FI3zQS8Ph7iWhnBaQtPqZJ6o73HExygBs7tCWkL2ZWUoY+J8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818105; c=relaxed/simple;
	bh=5QSvUUBEwul0t3wOfYWCRctJgwUlnqFBztayCoeh9K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evHGI9kx6CqmV0E0NIHzKuldO29ORoShB18GJqu3hpqHMTC7h9cqWXdM8ej3WSmI89hY/wlm9S0VfN0gHmyzbh8LPrGkhqtcegPwSrN56PAQ1JJOnSK3QDgXRi1VSfoZbD5TN5yJnOSQYu3zZbuKOO3gK10cmvqNaeVH+8x8xP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghWEb/Xn; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghWEb/Xn"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-867a943b149so59828127b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818089; x=1789422889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kb2gmiVIlb5vlxpKkwwNuzRtWNaOFk2YDHgZ7G5RM8s=;
        b=ghWEb/XnNyy4QmDPJ6GZIOY2NBsnV8RtAhU7Y3YaeS+VYJjDZyvQh6LE2C+50My4g9
         +yXdJphB2Sd2yolBWiyE6e6h7gDNhCjTrPhoppjhQOUDoEnRzIe2bokaeDnDv2tLvIvu
         AIQIQor6M4n/ikeOgcIDVCPlhJq61TvzWtsYGf9Z2HFvkiOlu53dkIhto9bF0aVxK2W2
         wSZi1qJFlUIpX7lM/rAV4JM6odFIQktAV+g4KkvqIrZxrQbDHvu9I9HsQ5FeqPgVeU0W
         hatk3X/z/J05tREj04viygGS+rgnX+c0IOFASyhpJAhkNLcKq+wH/0VHMzjUHDyIaaWO
         GQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818089; x=1789422889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kb2gmiVIlb5vlxpKkwwNuzRtWNaOFk2YDHgZ7G5RM8s=;
        b=TLAznckWB8lWgZcG+cn0L9pcnbh4gVqeISGeIraPzSjKy3Ob0oKSe6CUQ6U488r4BH
         Yr+FyrLEe+2YUYji20IP1b6fG4wdTcByua2LHnKFfU6KRo+l0JXJ0OeTg7RdUTUXWaan
         DbnDhGgQwrahRiJI3yY6iPxpJXiPXFrcOWK/jKp0ZvhpvbZrtCZSuy/Cjj1Jy4/e3LTd
         7bJ2emUuNq/yfDXmb9FU9Jt8OZwQgBIHzbQOCASFM2ovFVqFYWu7EDfv/NPLv7+zBABj
         LBJgd/cPjX6aKXzKZFle5X6INV/NVUXODUMlDpD90SqOsFnsLSbKxD/ic8Bigw+IpVF3
         Mtlw==
X-Forwarded-Encrypted: i=1; AKwUvBw632cLxzWM8nTra32syyZ9Tsih5BKLqAsNF2WVLUXnrBORkIG5Hi4z1c6RJWbXqVNSNNWK0huJeT/ovww=@vger.kernel.org
X-Gm-Message-State: AFuF++lpOpjA15DcNkknBgxR1d55tjVvQZRnvirChYkvSfTRpiexZnWS
	+hzxOHB77Z/BmTYVohVpsoduf59wKeYIpwuX5gkjoOS1V23HbGYus4xr
X-Gm-Gg: AYBFou04p2K4UwS/CzFF5okyiCs6ux/eO6MY0tcwEHFCCprD+R0adPhfsVliHgWsz2j
	a1WkXuSnPx3FXKpXkYa4R0jCjqKGhiZBDjN8/QQ01gNpcbXVMpEXViNRE1UhZ59ytV/Fyp0wsx9
	OtZu6HOX3u2zcTeD+mXx4a1Nruc1Jh8FDETa0AQLYczViPJ6WahNALhkrQjtLCJJceX2/5Vk2VP
	Rxsc8hE6DI+HqhBsQgN1cK3FHhRRgYiMmoCZxyZEdlVTrtnVmyfTP+J6oLQIwtb/Bx0lQAbT2Ph
	7MM3Ek6JDFzKtL1VEfGFWhFekoNjzd9Ai8D63W/K79nYBuGZ/bg8xutnsLQDg+4D3ODBU4uKwxn
	CM4AZYzmJbUYjgLcOB7VA7i8kYXkCqRI8bkCzjCTe+UOyDy4hSWd9iUo5YeQpwlo8J0OK1idh29
	MItu/ioLZckj1cPU5YnqRf7IYVxAXbC/ft6UZ+vh2p+OoaBEr0ZSFCXMOtoF4dcGe3uzEKhQ12F
	cU77sX/lyijEJl1xA==
X-Received: by 2002:a05:690c:4adb:b0:873:5bd1:98c3 with SMTP id 00721157ae682-8735bd1a0damr49302177b3.53.1788818089522;
        Mon, 07 Sep 2026 14:54:49 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871439bcb5bsm78484247b3.3.2026.09.07.14.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:49 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 9/9] MAINTAINERS: co-maintain linkmode.h under BITMAP
Date: Mon,  7 Sep 2026 17:54:38 -0400
Message-ID: <20260907215439.409858-10-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907215439.409858-1-ynorov@nvidia.com>
References: <20260907215439.409858-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file is largely a wrapper around bitmap.h. List it under BITMAP
section for co-maintenance.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..b78f0bccff54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4646,6 +4646,7 @@ F:	include/linux/cpumask.h
 F:	include/linux/cpumask_types.h
 F:	include/linux/find.h
 F:	include/linux/hw_bitfield.h
+F:	include/linux/linkmode.h
 F:	include/linux/nodemask.h
 F:	include/linux/nodemask_types.h
 F:	include/uapi/linux/bits.h
-- 
2.53.0

