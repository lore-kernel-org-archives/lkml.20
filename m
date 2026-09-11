Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E455371887
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167542; cv=none; b=fHApM4tHYCwzNuOLahVJqA6LoCiRX+Q1Ygt6WkXzUOB8SyJRcAIRh7a2axk6fMU+NjQigX6KBt+lwHVQ551ZSo0YpEG8VJM37bBUv/QO10HmInsv44RvG2X+4BK5Ud+nyeidB7Jei7wtr8rYhhGgM7nUXCHW23oxqKDw8ltp6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167542; c=relaxed/simple;
	bh=7gtPvIGVRGX7H9NK9fWacujtcKXno+BRlmXcuNSGxas=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qoc3f3nxtB4NCg4qp+ocfeKSVjcX/wzCjg/VsH6gKwEWk8GdvtWPIPHa09pIrJaNdJrsgFDCElR6+fmeZXqbj5NHVjzOLra1D6Qfo1DLGU+YxeWo3ZdlqVgMWEWPm0J86jB/sH43MpAIB/2wwS4/I4FKlmeQavPhS0Z0g8fsNC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGx5MZOx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGx5MZOx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so163504f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167538; x=1789772338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lo/atJ4TlAjfKpAQ23edpHxprTJz0JkYumYCWZqubbw=;
        b=oGx5MZOxDK7y6mR9wtC0wd6E2QFDydmvfhNx11Xp/wuQlHlQXbig+BYeKa8ljmY8cW
         EDfFhu/ACC/Fm/0XUKt0HK6KH2l8FZHmFD5aTqDlA9sdG2jEQ8XnjWNvwGftDX4GDtRh
         PAOYoxiCRJm2tVvwBQ1pL8/C5LRP1Yu1o0z6R5cyNNUO5q1UEvwKdSVY2834RGxDuurF
         RqO1ORXYtrJkVJYUSsXJx0uxb5KHCXxkQu5mzuGUn1rwPJFEuBxNAjwJOJnQCOuY/ii8
         akwKlb4feyKTAYpixU0OrzYwM91G5eHlpdZByoCh9O8WYUsY+B9rmuW2EAOn+NioA3gm
         w7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167538; x=1789772338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo/atJ4TlAjfKpAQ23edpHxprTJz0JkYumYCWZqubbw=;
        b=YVlAD3lbYshdOkUEbYX8ztHdF0LEt2yaThijGzoq3b3iiQ/gtna7kAs1BhfiAZJugF
         5fah3+us30bKVq0bcWkjlGzl67GqSZJfVBlGPI4vFowwX5y5wt1IH6DoakaFLLJxN+Zc
         GmQaOVF9UvL+rBeZ1dxQ/mGr83rOznrqCL6pCBw6QZ+jfbB24wXCiDreBLEdzne6HwaH
         GiTDFWpOuXHIqWQZmypSIlHJJSe9QOYPSZeHFK+8/OO0Fllk7iyKdPI/wgDP3bm6cJzi
         U0nClPyT3T2JkTaRtSLcFdFFifK/slBECzT4uz92mP7lbeAFyrO6PzjhTVBec8ZVr8j2
         tY3A==
X-Forwarded-Encrypted: i=1; AKwUvBz+Qu/aqwx0Zszh03pnFcqxg+loJNWVzxEVhoowlgIRxPSjAdxgDSEaqADfDKC/ma0+7Jj+N8BEmqOqSgk=@vger.kernel.org
X-Gm-Message-State: AFuF++kt3JX7zbiI4oa1YPNR6V+UwZbdJ9l9TdouISOcV92ANN6UTvEw
	YsvdX6c3rUFHJF8SjNS29CaipIQCCaoagNp77O0Wm0Nk9ROM+upcHrnB
X-Gm-Gg: AYBFou1LufJeFoGgYeUGZMaLjsbQ5eDLgUe3vriAc0NUlZ2M5JaXDcpng7xO6VPGDMT
	GbfLyqNEn7h+C6lc2+eRrlh+YdyRYTwTL3pXelOJacfUwNHLFO2lNJB9qtCaB5tYlO306I+Qt+j
	gQpmAt/O/d7N+T7d4n6T/yJ4DwcsnwQmrw9qdDEcDgviRoJEtiGWNgralbysLrLhZ3ZEAeZHjCJ
	G9YOuCNw8cX5TdUn+oqugNYvKgmfoS21FZFDIeXgUKYiBSNV5NiejzZhswr8fl1ou4xHCpip6a0
	NojR6ACbrD5hKGZF3WdKDkzcxr9VSs9dtTrcDbg9NCc+2FN0XpyyO73kGtMRKWGdFWTi8WbHDG0
	ymscm7UbkE4fKQM3/fL0NNpBqJbxmSNkpLc18Mk/v9hi8OtNYFRnf5wsZp1FCPG3Ilra/0wueIh
	nYsszlxOPkg/cj27G6nwvB7BvD/ruFQ0MWQD1TC8swWBEZTsmNbMDUEaSf4ASHVSRg+ffug33zJ
	VMlLEbiriN+Dj0Un8wmITD23PV55LW7J469qjnnUEmcuxskA/L4KJRxoaAsHaFvEXPkZjHQHhC/
	uBCZUbyYHXDaJLSrWdbXgpwanvNZn0DbWb09
X-Received: by 2002:a05:6000:2311:b0:484:3a16:cc58 with SMTP id ffacd0b85a97d-486eb1d99a2mr7038096f8f.2.1789167537534;
        Fri, 11 Sep 2026 15:58:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm9520289f8f.13.2026.09.11.15.58.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:58:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Yi Sun <yi.sun@intel.com>,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: [PATCH] Documentation: ABI: sysfs-driver-dma-idxd: Fix the kernel version 6.20.0
Date: Sat, 12 Sep 2026 00:57:37 +0200
Message-Id: <20260911225737.11411-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no kernel 6.20: the release after 6.19 was 7.0. The entry came
in with commit 8308510b9365 ("dmaengine: idxd: Expose DSA3.0
capabilities through sysfs"), first released in v7.0-rc1. Say 7.0.

Fixes: 8308510b9365 ("dmaengine: idxd: Expose DSA3.0 capabilities through sysfs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/ABI/stable/sysfs-driver-dma-idxd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-dma-idxd b/Documentation/ABI/stable/sysfs-driver-dma-idxd
index 08d030159f0921b1796b19a0fa30e74c96a731bf..5be4e2d5775ff4c6e4bc82c92bf974cb8fdc64da 100644
--- a/Documentation/ABI/stable/sysfs-driver-dma-idxd
+++ b/Documentation/ABI/stable/sysfs-driver-dma-idxd
@@ -138,7 +138,7 @@ Description:	The last executed device administrative command's status/error.
 
 What:		/sys/bus/dsa/devices/dsa<m>/dsacaps
 Date:		April 5, 2026
-KernelVersion:	6.20.0
+KernelVersion:	7.0
 Contact:	dmaengine@vger.kernel.org
 Description:	The DSA3 specification introduces three new capability
 		registers: dsacap[0-2]. User components (e.g., configuration
-- 
2.39.5 (Apple Git-154)

