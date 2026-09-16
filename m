Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272A9371868
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529079; cv=none; b=gJ9zJ9r+oAglXNkAZm6JvpvGZLI3JekYHppxQn5aE2qdhynUD45bc8IIfxCuP7KcNtwp+pXtszxxopfA67NVRXEgcs1fDUxx7Y8r4bvbyKzLvYza/SI0O5TjvY8nsfcIt2nhg0WkmPowO/O5ud3PX/B9LM1cHn8CEnrZR19RjPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529079; c=relaxed/simple;
	bh=iDthSQqefFrOLg0kDxpCSPIAK7dnv2RUYvXiwlkwsRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mggc3N2zAJfSlbOQggLBRIIHk0MHJ6SbzRff2j9eluK4fbEuyonygR+hraji5XCWRdn9oHcHAYE8gKEcIvww+3UOVJAsqZClyKJcbBPIyws8Znx21Ug+EVgbfSdk0LhjAW7VXDixwcETC3GARsJJ6ZMBME6OnFJnsJFzec0gDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pwsvjzma; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pwsvjzma"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so366815a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789529077; x=1790133877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hewLRE41ZIFiAVylPPAMUN536cPkfHAC1jqHJ9IalwI=;
        b=PwsvjzmabTVUzalQ2cu2esCbIhvgN7baFnMCGdxz8R9HspexJDJaPZTl0zZLaB1ymE
         1z3erk0KGJyRLR+Vu2iZPETmHfqxJiEvCGXZ5L60fje75hxM4IFKo3kI8CAAX7Z4IhJP
         75DPW5VT5+wZ7Z5aDCUo+C/n/EsIHuYVAaC/ktoaQ6PET7Xdfl/KmBeyoVsnwwYg8Esa
         +vNqUNdDeTMlHKsIGXQ6uER8wEHuDv70yjjwAoCjyDH4p1SABDOrdwCqJ4iLZuRceaV+
         rpJvSYGBbJNwlJddcfnUTA+yTPHmMeoj3Zc3XW5SX/thYB2cngk+D63TJKv8TUx0CUgS
         Q5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529077; x=1790133877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hewLRE41ZIFiAVylPPAMUN536cPkfHAC1jqHJ9IalwI=;
        b=gMpzT8Z0X6dEYGWEzzRUmU8m5+CKGZkaH1PS/w4tUIZI15ZzNhk/iD3ItIAvSZrAlT
         DLBJ0c8BmIRKwsQlCunUaD4UD6L8beJvrLgv4Z6VdhShRYR3zV6Q7hLyUhxIUsvOPuJa
         klRWa1CRIKwklRChGbSn+ayu9d3BQQs7SkGtFgdvQVqBG7sj2XwvkzDSQUurbX3cl8WE
         Cq9pTZmbXOtUG1Skvb2IF9JizCjAQWuzGi4jZMx0b+86+aunMMQfXZnyy7eNN4PCw3nJ
         RUyrsiCVf3NnW5kqIEEDWzyaC7nr1om7Huwb/m6TMj7V4aWkdKMoBPla/GmXuFjsa1lg
         6JJw==
X-Forwarded-Encrypted: i=1; AKwUvBxIIhzCr8nm92NEfBklLC9OGMmHxYKGXJELDMogRheJsi/WJ7t6Siv8nNw8gt/E9rV+HRR/4cFiORJw38g=@vger.kernel.org
X-Gm-Message-State: AFuF++mguBKM8ru00xzqx0GXSIbn0mfVbcOAPAvc6Qi7gcS8Xyfpk/3e
	gZwbFZXJZdgSgufoP+02hKRruxoe1jpeP04lxYUjE/uip6swzC53kdVs
X-Gm-Gg: AYBFou3S2xAxZ+/pvazuOXBdbTKMuIjgqxaTkQXqR039K4UBew31BoldYaIQvdaOElm
	phG0wtKY/X+toKVhbRTygiRkPESggzP2sMeK7fJDVTkQCDrTwYe29IfclimCGcCMCpQdf0BFHxp
	Qg630dJ4ep4rMnPxgDW5uGNww8WDqtUExGtYIPO978bKwDFC7DblhRKziBrJZhUK07QuKY6cj+T
	roI6ExZ8+1S1u0k6ZlPWeKCJRc/YFAW2cUBEzTQyDZTFRiv4Z3KvBaAT94UPCTH78qpPFpoXKYy
	2gNcuE+OI6mBbiJb0wMA9YSWSZZgn9p5W63QGm+b5S/FaX/ta8FFUCuYZePe+vjIv4t15FGEhX5
	6QbQPNrWHnJn48S3xE2LjdJ1+Uod9MicN+IjMOdOdxyHV4MZT2HKbq0GXB2B9xkOGgiAKu0yaA6
	gLiWNZBAiK4AmmbJfEFIHdgRn/ALvuPytUGOE9+QWVwx3qUQJtoUwy9Tv+yQIIGiNd
X-Received: by 2002:a17:90b:390e:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-39e1e424a7dmr2098764a91.12.1789529077349;
        Tue, 15 Sep 2026 20:24:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bb234c3sm1772473a91.6.2026.09.15.20.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:24:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Fan Gong <gongfan1@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Gur Stavi <gur.stavi@huawei.com>,
	Xin Guo <guoxin09@huawei.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: hinic3: unregister event callback on remove
Date: Wed, 16 Sep 2026 11:24:27 +0800
Message-ID: <20260916032427.2899987-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hinic3_nic_probe() registers the NIC event callback with
hinic3_adev_event_register(). All probe failure paths unregister the
callback before returning.

The normal removal path, however, tears down and frees the NIC device
without calling hinic3_adev_event_unregister(), leaving the auxiliary
device event callback pointing to hinic3_nic_event().

If an event is delivered after the NIC private data has been released,
the callback may dereference the freed nic_dev and netdev objects.

Unregister the NIC event callback before starting the device teardown.

This issue was found by manual code inspection.

Fixes: 17fcb3dc12bb ("hinic3: module initialization and tx/rx logic")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/huawei/hinic3/hinic3_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
index 0a888fe4c975..42e2ad179a9f 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
@@ -499,6 +499,8 @@ static void hinic3_nic_remove(struct auxiliary_device *adev)
 	if (!hinic3_support_nic(nic_dev->hwdev))
 		return;
 
+	hinic3_adev_event_unregister(adev);
+
 	netdev = nic_dev->netdev;
 	unregister_netdev(netdev);
 
-- 
2.43.0

