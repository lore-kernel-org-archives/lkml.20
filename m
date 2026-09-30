Received: from mail-ed2-f39.google.com (mail-ed2-f39.google.com [74.125.228.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE34D7D5A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781791; cv=none; b=IlVj+156N+ZSSytMi9Qk1yrnyD+z7amanzxjFRNzI8Pomj4WCfyz5Cz1SS9gYl1EHD4CFwAKPiXuna/nuYbKeU1259bXLxTxNqip2MWL/G7GYQWTtFOBgR2U161lCZjlx0IynWXA8slCesQKIirQb5/6C05NafBys8xYguj2wQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781791; c=relaxed/simple;
	bh=9YozpNhCB6RxQb3vSIk33QuUlNnJvEgYENRshldeQTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrUWFR6dwmVyssoB/nIrlfNKjOF+FVwBpk+lps9b6Gdjv0nQVMGH1Sal4B70JIOEwFIcfXFSaU00ClJNwNPVAPB4wBznzSEB8HBV2k+UZ4THByRdMLkLDErRGn75fzL8wsiJoksue9CPgEgUR8OG846ZGfQkhV3V4xPFQXAEotU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=nJ5hOyqa; arc=none smtp.client-ip=74.125.228.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="nJ5hOyqa"
Received: by mail-ed2-f39.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso6680552a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1790781783; x=1791386583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6cn97a2VxefS6h6oEWU5CpS/OstCxxYrDuVNoyCidQ=;
        b=nJ5hOyqaMtrdOhJnx3LQrdR1/EPkFtTMCcMUoxqs+Tga/SjXCFPli4pJnQaQEfpWi/
         UaD/5VD2OuUd/8xoyTKjT8uLp/OCsNwERaAK6T37ViOSXPRKBmrVEVNhgnv/NM/GGyQL
         R9iSMlXACssKNXv9z/KvIqTf9UDhCARb+RZln9tEyb34eqgVvnFDBSQixbsFwVzCkUwq
         yf6GgeA9jJHezubE7wOu3bZJqPXsADGKS2TNEWop/aQdmQ2RxtisSM8+2w0307hI62qd
         ZwGx8pvvkB8MKMyAr/N+CSoccO0C5V93nAgB74bpE/xUQvifiozFna2s3wtS9qTYHQci
         uSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781783; x=1791386583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6cn97a2VxefS6h6oEWU5CpS/OstCxxYrDuVNoyCidQ=;
        b=KCyap02trkLeMj49bkKk1AAh6LoVJqt1dcmGsuZKeZQV8oLTPqcQfgzcWqh+sE7SIM
         6Ggt4b0r1HQ6iRyx6BJmyQXt+jMeJ/gM0ikyNHfJ1X4X3xizsf4FYp5VdO4xSFi22rCw
         mgKuwFYaP7+kR0dTfAK8NsMKJqohe7XTDoutDmPbMcPvYvaj5Mie3anLnfHgI2Ryc/Ff
         0D4GGlezs2Pnid3OLJcx/+Sv2+M+9dHahLQ8xEaUp4jT0fzOjo+wJG4XluDR8RprNI0h
         GDTX75CG8up4RlsUJyL7l1XJRmv/DU5DthADtH8uq3Nwa0DYhlFvw7ieMece++W2Xjei
         wC1A==
X-Forwarded-Encrypted: i=1; AKwUvBz7MBK4zp+JQJYRcMRaNlk+YrhPHbs1Ec5KZ+EDCzfh/lYmnuT4iIc2VOZA0Vh/+N6DHOufSB4cK3w9hgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnJM5PFevRqPifuCjyOG/2FVgMJ7AgMrsSvfvDqtbS8Gw2ImGb
	PbZb1yTgUyJhWY5T6ZFZRopRcBcAj2iZexlhWQfxp20I9Rh83wNQwq6s7Xvxn0UUYw==
X-Gm-Gg: AYBFou3ABrWQJSAZ1wF58D7cE0GxR1dZxh5eBIZEirXDP4shV3qJmn5Dkaa1tg0xJ34
	uHlZ0X6eandP0JiUSQfQ9k6z/azS9VZnR/Gj1eS06CvyM83XiUiCUQ74EmNnRqFCCDYKwJPNGTV
	w6+ubobbYs5Xe1mKuvNTbR6yGL47xPL1ugQJPfw9qtZhPwZJlJONn0VoaG/n4GY85Gm0tyLbRop
	lFLz45jfaafTs2Hsb5ZJNFJdTxfE9ZkROJqgezLMrt2nSGm6DK5KVyDSQVkjTy6/+EBsZnB/Hzx
	QvJwIhcMsPj/lgEg1QcEKvSz5ifSQEvS7PpltGJjP/KI84o3bD+71biKpQMDcS7bf1FBaliBHqr
	9MEcnIewmmvLNrJsV+0m04OkIf+LdUHVfTv/gARdmxZ/kdlB1sqyAlCFgJIsO6KmImEFHgUWOrL
	wMEpq+fva0uB5PeLF5Ji7uCSEAQ9bs0PN52vWL9FcvuVyZnFsmVmEp3FIYLsW5CnSbfxUij3ofX
	A69Wn3DXEVvTTfQ8kd9yg==
X-Received: by 2002:a17:907:3fa5:b0:c25:47a4:fedc with SMTP id a640c23a62f3a-c2e237605f8mr170086166b.2.1790781782842;
        Wed, 30 Sep 2026 08:23:02 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce6499sm23874966b.33.2026.09.30.08.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:23:02 -0700 (PDT)
From: hengyul@cs.unc.edu
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>
Subject: [PATCH net 0/2] ipv6: route: fix adding routes via the loopback device
Date: Wed, 30 Sep 2026 11:22:27 -0400
Message-ID: <20260930152229.1453929-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Since commit 21ec92774d15 ("net: ipv6: fix panic when IPv4 route
references loopback IPv6 nexthop"), adding an IPv6 route via the
loopback device fails in cases that used to work, e.g. when the
loopback device is down, when a gateway is specified or when IPv6 is
disabled on the loopback device, although such routes are promoted to
reject routes afterwards. The commit was also backported to the stable
kernels down to 5.10.

Patch 1 restores the previous behavior for routes. IPv6 nexthop objects
and IPv4 routes with an IPv6 gateway keep the current behavior, so the
panic fixed by the above commit does not come back. Patch 2 adds tests
for these cases to fib_tests.sh.

Hengyu Liang (2):
  ipv6: route: do not validate nexthop of routes promoted to reject
    routes
  selftests: net: fib_tests: add tests for IPv6 routes via loopback
    device

 net/ipv6/route.c                         | 29 +++++++++++++++++-----
 tools/testing/selftests/net/fib_tests.sh | 31 +++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 7 deletions(-)

-- 
2.53.0

