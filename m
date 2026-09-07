Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B3943F4A2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818086; cv=none; b=fedVxajmv7tzCQDg5Yl+V/cv5ODk1tZJYYSQb54MvRLVOVJODJ8p7zOB339nCmD5XyJ53QU6BQSaKi7mG8vrhwDiE0PLYFr8wzZtbD3V6JKCMyXe7rqroIS3bNQmT2y7qmAkxhLk9ivqCJkYWvJUrKpda7ghcWNQtswZn6QGfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818086; c=relaxed/simple;
	bh=6gD9cPa3rk6w/IUG4LaLFS0hBqCw0Ni+w/H83jcmfzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXSkhr7uCJX0p6XGq/9ZvQoSnHbtbI543ijG9FCTXiM8GWG52aFHf8EUFCvepYMwCXLcqzU+wuxHiT/JV89T3jh1m70Q88R7ZueQD0TBjiZkfiBr007lBMBIz+MbwogzHJEbyM64V9GxzF3v6H4OvlbYcYOfgVsXd9CWa1kKWdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIWTHAT9; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIWTHAT9"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7dbcb505578so37689677b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818083; x=1789422883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUuTL8RKq8zctKFBGR36Xkq0F1NHQ5YoR0hZaul99pw=;
        b=qIWTHAT9quXqA0t6iOtNO/cWrRcxjeYDvz09E+AkWcxyxnjPeDjjAYX78vwb5lm3ed
         8Jq6R2tRFlC0+brur2FptO9TJ4RYZxlh0tXE240RPv0oIRRDZ6kIc3wCWbNSd36cwts4
         cGBX9t39xKhAa08SIDlg7kqyrbHFGKFlb3gu8RUOEKxvTv7umHvATMb6yCp50fQ2fVu/
         s136vjKD8FxjBwYh0YiP4jIGtwc5dcZLoyC6oZ2d5miiiZEtjnV6q9VPZZa0+R/diJQe
         WCZKrIZiN1CQXJB50VNU6NxPzc2LW58HahHyF7zntN4TzdACIAwoWOqnDBTonFyqjqML
         0rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818083; x=1789422883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pUuTL8RKq8zctKFBGR36Xkq0F1NHQ5YoR0hZaul99pw=;
        b=hxgFvMPa+mcL+k5VLgIKexm4Dn5JTyj7SDbntPqDYm+24Gpd2CePRhL5uXEEH7WV9e
         cpDNb+V1lw9xtQLGkshhXQgh/pRsVeTHy/gWzABlA0KGPzTBPPWt8lVucolgzVCM10ko
         fWh+H2aUpUDbQ77zxr9AD8Fr4S082F+swQ0R7unuzUdAa43o+q5IvTDwxwMDi8zi2fTm
         O0BwMBfjIOmPfIr01uftAZG/GN3PEGsFYUIRNkFvBqlvgmSb50RqPRgIuGzgCJFMqGhF
         4Y212WJOkttCPWgQENYX3wKNRLd+Idhtvm9VTijYqgghyyH8jPScjaLEKD+c7WPgsMS5
         ilYA==
X-Forwarded-Encrypted: i=1; AKwUvBxCwQz/z9xzja8y6Bfoi+U5iEeTRxhNoOPYR4RfIER9GZnYebAg/3+rLkXlqjf9TaxI/u+E+4gqrWYAgns=@vger.kernel.org
X-Gm-Message-State: AFuF++n1kfOX5N0GxYFvKKC3gWN1KyNL4fSlespBGbG3rGaIWhkztBdM
	EGG7xkbnPQ9Aq4kC2/I3rT7b7PjhAd+nsNbfL4vYZjcBzkeGrvcoNG5y
X-Gm-Gg: AYBFou0dQj8M2e+tc3nKWnvXZ9ETBcDwFM50BHBndZHfQTc5YK8Q+xmI3HVpM+XNd83
	/LnFEX+1gy8a+S1PKkVnGDg+l9b5mK5sTXAn5XZW6S6xO84D7KauCJ3Hev8g+KKRNzssTAT2ZJ3
	RJFdfzbW/SMppfW2sAPg5RhZ69haAOg3LHl2wkAnjeXq+TkZnCYwHSIl3AK6oHdgdOvGDa3YAKp
	J39Wngr8qOFv2eLrVGjxxi0cd42A4F03mv8NoiHnRTdIhVIdpsB3l1cncCyoZU1QB60QBAdJaFT
	bCEtNUuLYoc7i9kcFDIoIx/3ajbkUprJ1kgdu2amoDR3ZHa3kA4vlLOkMN9KiJrZ7wLT3q3qH4D
	vuEhK2V/bIVxXpPEB/Qjf3dJS8GJt7hEuPoZ07Z+5GQ0HX/alF17zlJAVi9PQXfaU1rcWSG8pgC
	65+S3GANHAVAyLLoacIYDN/YxCEYn7dR7WPVuIJ8iK6FfhkFT6hUZMlzIQJtj8PESUBDRPMUPkv
	DPoFymcWO+Y0cz0yA==
X-Received: by 2002:a05:690c:7685:b0:873:5bb2:6c08 with SMTP id 00721157ae682-8735bb26eb3mr43482417b3.50.1788818083523;
        Mon, 07 Sep 2026 14:54:43 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149315162sm78079637b3.12.2026.09.07.14.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:43 -0700 (PDT)
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
Subject: [PATCH 2/9] linkmode: make linkmode_and() return boolean
Date: Mon,  7 Sep 2026 17:54:31 -0400
Message-ID: <20260907215439.409858-3-ynorov@nvidia.com>
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

bitmap_and() returns true if the resulting bitmap is not empty.
Propagate that return value through linkmode_and() so callers can use
it where applicable.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/linux/linkmode.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 3b9de09871f6..c08632c10c3d 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -20,10 +20,10 @@ static inline void linkmode_copy(unsigned long *dst, const unsigned long *src)
 	bitmap_copy(dst, src, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
-static inline void linkmode_and(unsigned long *dst, const unsigned long *a,
+static inline bool linkmode_and(unsigned long *dst, const unsigned long *a,
 				const unsigned long *b)
 {
-	bitmap_and(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
+	return bitmap_and(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
 static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
-- 
2.53.0

