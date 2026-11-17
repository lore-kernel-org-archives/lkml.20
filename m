Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910759;
	b=DfRl9yNGJc6fQNrQ/R55EuTrZRetw3i/fPTsmA6HiJ3udlGbT1M00MTUiEXhGbmUdmgG
	 uW007CazkLfpyHfI/O0SC8BRS1mGtoeB/oFGdV2Utlya5MmtR4+WH8fyJ0nv3ieSL44eL
	 ixwKi9YmsBDTOeMYY09Q0xwz02nK4t35IjH8pFSYh4t0/HiwQ6k6iECqktpK4WgvDQX4H
	 Y1Pyb3tGq2t49jxkjXVVOsJbylO83K3SIBvEXsOPGGtIJJqJ5gL8QTC7lNeXwkRp3zqUQ
	 0ILVzU91bcX/RU+TR19Gin+Kjd5ja2RExoDHfu05wPCejk1KhPYurHA5XPMGzad2LZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6tYUDeaUmXci4DtaZ3KGPX6vHUKyaaYpdht15nvdlEk=;
	b=NSxuACZzKbvikJP4NO6c06TgygRE5b8B3Jf05I/Fn26E79g/YAb6+eoPKSSwsF2z4SIs
	 WX1AExoO4yGDPTbwwB9jrEjofitg5D7tWRLySozIQwxSF2KH7qDawUGV9S5C/1SPuxmPR
	 iW5cwobtHLByzjgFgZOvgpUvX0texxxwO70QYArlRJXWIPBDaoIZdDJrTL1XmAM7wojvv
	 7OAfEciZ1zLG6syX6kJfeZul1ii+aurAx28RLj759r94fVWndeXGfyEFtFuehtr9aWNgc
	 yI/Xx++qJgCH2nhzau/l0TDeUf9/Nhpe30bn8YMoqYwDdDc3Y9Lrd3vGDNnx9uFv4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=hq3XZ0Sw;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881DB606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 881DB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=hq3XZ0Sw
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-949664ee41cso324985385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794910757; x=1795515557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tYUDeaUmXci4DtaZ3KGPX6vHUKyaaYpdht15nvdlEk=;
        b=hq3XZ0SwNMPqXAAFptW06QVzSro3dwLjHjkyW+FcJdX8JacGeM+g0F1PVT0NcnNGLR
         pWIqnoRkRLpX6uT704N9lgLnJZMOXKtfyZAEfepQLPYgdPALZ8exgL8o6AtB8o2dJmoR
         SKoc3SHsCyYtbybxCpm9+/Wlz1hWI9LfcnNS9DyKSNFe7SwwIUMZ2JZGoPpI39/iaaSj
         NXv0MDLiflmcZEdKELJJjgKVXCGHpl4mQOY0L85DyFSj+WTjWsHWS+D7Op7kulJ1s8aj
         W5u5c5MedZ8rtI3CtmQH0CzGl1ejvYoFEpFtBR5+ojk6BamBB1BZQKfJf6B2vQtRhnbV
         0iyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910757; x=1795515557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tYUDeaUmXci4DtaZ3KGPX6vHUKyaaYpdht15nvdlEk=;
        b=OLnVjLR1CJ9GvTNz9fHs+wYOdtfsbEe0IlOo1jkQkZ4qk6+n4Uwdf0uwmPznkIFV26
         kGSTUevR2b9Lf1X2YZAhQOZDd8gx52aCYdeDHhWE9M/092Y8Ep5flhnBWQAiUy+0Gyop
         0wHfeG7n23uHPxXr+3g8V92Re35/iXVAd/i6GfJASOGflJa3Td+Lz8pDSjtYMlIYJZZ2
         7ejw9moqqofWSAAMvMBWDtyzHcaZnW8sN0QYYt1GLAvjbPFcVArgpf6funUe78B3YIWC
         oOwBaS4DQf8HAI2x9BdqE4uaVSKycGGWrrEp9yXfHHLTyyAGO0OeVbhp+hd8HYeUycUs
         U7Ag==
X-Gm-Message-State: APuU4Z9nbhEcf0SXw5rVovj518A+7DzTXqKy7uxVRI14TAjY/MIyUMdk
	OecAN3CMcv+noUO8qeGHAQkP7sTnUqmq9F/Xt0ZDpkB45oUP9iKbPQYg6yEAMI3kDzqmJLTQPc1
	acb1z
X-Gm-Gg: AYBFou0rKJfRI7waGUVxhs9s1sf2lEBibJ1Cnhx1LxVig8NB/NG1vIb3gL5zieKCBc0
	zSD/Cz1u7cICntCRC33sJG2hRSlteG6Ikgy7Cu1nIq17Qzp6nzQnCxQBFGih8nJ3+Sj5fc0d+fu
	RnQWHj/IFwCP4k0sLuZRgIWBha8StDJfujqIkl1VmmB6Owx40YBpHBPVTv8dtF4we/FmWTTgmX9
	v5pf9OX++zcR3gGePeeMznCxKz7sUg0GcCWEeYkf4bYco9CLB/doninFxvie3FFWtdNlDRq25R7
	rxC+cRpJAMFbXsHo4YMF9iVASTw2tVqTKZfwmgfwmiRG0VcgK4UdqGRTldnYXh1aqRSGvGgRrlE
	aa0qbK55A2/g2LWvEFxgvsudq0XP0MmEKFEE67qoDSYh7+2JARTRWDYFx1XSS0hU0XWk7Vd5HMa
	6zAPRff4fHoIlAj24woqqXWMiQJLxVEkz+WL7RSJPvR+sq0fdMXhSwhKQaKY8FYXw/j97HJBO3l
	qn8XJt1ileR5yM1uyczXYXIr++PR6yglfcGKNZJwj4oG36N8rmqCPjctUnS3gXW9ClrLOrleDeV
	LLgOnSP2mkPCVkGjk+TfH9RaLmjaDP3T2vXDy4fupaotI/cnLYGNWfUqkp3QXIu5r5Uy68lcT9Q
	4u0b6P45ZML9PSQc=
X-Received: by 2002:a05:620a:4048:b0:93f:dea:3b7e with SMTP id af79cd13be357-9494baf6928mr2132633385a.24.1794910757471;
        Tue, 17 Nov 2026 02:19:17 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9496bfb7fa0sm719926685a.34.2026.11.17.02.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:19:17 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	larips <larips950@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/mempolicy: limit compat bitmap reads to the source nodemask
Date: Tue, 17 Nov 2026 05:19:10 -0500
Message-ID: <20261117101910.1820066-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 32-bit get_mempolicy() call can read past the kernel's stack nodemask.
With 64 possible nodes and maxnode=65, copy_nodes_to_user() computes an
eight-byte copy, but compat_put_bitmap() reads two native words.

A kernel built with CONFIG_NODES_SHIFT=6 reports:

    BUG: KASAN: stack-out-of-bounds in compat_put_bitmap+0x113/0x120
    Read of size 8 at addr ff110000099afeb0 by task mpol32/246
    Call Trace:
     compat_put_bitmap+0x113/0x120
     copy_nodes_to_user+0x137/0x200
     __ia32_sys_get_mempolicy+0x1a6/0x280

Bound the compat bitmap read by MAX_NUMNODES.

Clamping every call to nr_node_ids would remove the extra userspace
word when the kernel nodemask is large enough to contain it, but this
keep that existing compat behavior while preventing reads beyond the
source allocation.

Reported-by: larips <larips950@gmail.com>
Fixes: e130242dc351 ("mm: simplify compat numa syscalls")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 79053ece02cd4..d9177c5504879 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1715,7 +1715,8 @@ static int copy_nodes_to_user(unsigned long __user *mask, unsigned long maxnode,
 
 	if (compat)
 		return compat_put_bitmap((compat_ulong_t __user *)mask,
-					 nodes_addr(*nodes), maxnode);
+					 nodes_addr(*nodes),
+					 min(maxnode, MAX_NUMNODES));
 
 	return copy_to_user(mask, nodes_addr(*nodes), copy) ? -EFAULT : 0;
 }
-- 
2.53.1-Meta

