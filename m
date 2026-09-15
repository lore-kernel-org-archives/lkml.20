Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E583BF679
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474469; cv=none; b=pIqoLIPiCNm36b0u3AqBFWoILqgjDaLZHcTrJ8ZecALlCIvegPkQPB7VBtNMpBJjGKSrKHzhx7NzwzbPkF25UfpJyY2jmYaSEEbaEoLigZEfhx35m2/MKB2XdyAPE9eEcY0NRQPsqbTJmICBHZqYvm7M//s3KIJzwY4xwNuwTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474469; c=relaxed/simple;
	bh=EovFhrzEm4UbLIRzD5IxllAuM1l+CaRbk9aBHpANUd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMq6mUAtcnNjGSMZpyldK9Rhv9B4IVqnLklhwsrBMzeDgss0r/ooVVXJyDy8a0cWc0FgB/xkYOeReKK5HROUSItUI2TUBTuwzUmOVKrEU5wv9MyBQsmYeUaPmKxz1mcx1gk/gwrimohTyY2hzCWoS7JPsPuI93wS/pAywGkMsr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGU0a8a7; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGU0a8a7"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so676048e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789474464; x=1790079264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hT109/DKD8D3ImrzvgTZ3A2CRXv9GUhxcQttm3TUwyQ=;
        b=QGU0a8a799QbpC+yG1vBkbb3Pii6sUVJmCr6wwd9nTX+6hUPh/+7VvedIp5frHAgHN
         hEfXzeBiahG28EORQ0x5s/NNabswY+6PezapCURZ9pzO95co8VT2aXuMsKB6NOEp9SrK
         FLAAn1kNRZ1AGqncqdJH5pxxP10r0OQmk/ZPRJzkZj0PDI4fiNQILmvT2YkTiwTH782+
         7HkEUgHn/VcPnDO/CgjHvKJSBGIuwEpA8gXfthgR+skficAsiEzWp+2Dw8pgFwmQc74T
         qYq/hpbdxdcFD5UOuoC6whyszpKAo43DuRbOjX4jREpd8vBpO7ne2YT3W2Dg96Cuz+YG
         dJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474464; x=1790079264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hT109/DKD8D3ImrzvgTZ3A2CRXv9GUhxcQttm3TUwyQ=;
        b=QEU/hmWGpVAzMDgyy9FfXlbCwAlFw+5RJIQ5ajZMM6nC6IW3InjJVUT7cx/9RAuKbV
         ZATJgNtdc71bcxwArUURZFLVxb3OgRbhQDeAg1lf91cHzgfud8ROdL52ZnpA1IXWV2w1
         vapTEqm38i+F98T6VdqQ1IaV7jQ1+Bv14JmZI6/D4Tnpy9xydJqxwXlZBRKBOXSR8S0t
         o6vpnd6ohS8z1qnk2z3vpqYcSC9xFIY2YQ3HnRcJCiKlk8jn4gXYZVAOXOENoCfCacC+
         Fhzzp3wN3mcRfjrBEkG0JQDJnHPIS5KgV44AH6/cSMx4tl0x4cBReNKSzRPBAhmddwIg
         VBGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrxD20v1jXJR4ANlM7LaNrDwiFeJQ4B4nuiq0fzFFQsQfuaOH2rdfDurEBcdu0+IQ82u0uWZZr4iP1mDs=@vger.kernel.org
X-Gm-Message-State: AFuF++leCrThnr+wCPkfc4v12i/kjMPwDDT9cN9woGWytN3BbZX+NqVI
	lO7NjE35u9NWLm5sO1qbJElvaN6hN4KvxRNr48k7SCajzUcEG9+RAyiM
X-Gm-Gg: AYBFou32/X7aXgF0kIVcHks99ysTDu4wFztr4Ev5KiSDD3m5SiGUZOTNxensivGbb9u
	hXOWj/vouR2fDHfpYGjh2StQcJ5Ih2u2ZrQbIXz4SyStlBra48mL0xvQ9gi5RY7mtW0hm+uaIRd
	J554ir/1NhiuObbaxzaN8//zprbGeHXEp14abiKMe9d4MaRaM/+ybDbx3VXtELPDStzVc/9M8wR
	CPPmWXq3Z8FSN9FoSFRwXiRO8xDqaJo79jvHQqZrGbOshaQ3z+xBN9lQVS6x1Wh786pLEl3L8R9
	xvsf1pG0/GalilK4H+OgscdWrE4tznaKslyUKyNreehjtV21qNqOrX3edjliD5ui3V4EcDzwXDj
	DNknFrVSIwh6tvF1g9bUlpf302G6B9ItrLkKkmFw/3RLzlPwPvOnNefmKmz2vjyUhmL8Q2N+xOh
	8m1s1T17m/TEFlheqUiIS4OKT4m//Xl21DhZSo6IwEybZ0LmzRaJrcnNQxGmVhgmQ5jOG/j5fQ5
	K1kmbsbxvDpWbJI
X-Received: by 2002:a05:6512:6ce:b0:5ae:b5d7:4b99 with SMTP id 2adb3069b0e04-5b8b29d4641mr846404e87.0.1789474464385;
        Tue, 15 Sep 2026 05:14:24 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b3a58fdasm446114e87.12.2026.09.15.05.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:14:24 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Oded Gabbay <oded.gabbay@gmail.com>,
	Kent Russell <kent.russell@amd.com>,
	Amber Lin <Amber.Lin@amd.com>,
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH 5.10] drm/amdkfd: Check for null pointer after calling kmemdup
Date: Tue, 15 Sep 2026 15:14:03 +0300
Message-ID: <20260915121405.107068-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiasheng Jiang <jiasheng@iscas.ac.cn>

commit abfaf0eee97925905e742aa3b0b72e04a918fa9e upstream.

As the possible failure of the allocation, kmemdup() may return NULL
pointer.
Therefore, it should be better to check the 'props2' in order to prevent
the dereference of NULL pointer.

Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2022-3108

 drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 86b4dadf772e..02e3c650ed1c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -408,6 +408,9 @@ static int kfd_parse_subtype_iolink(struct crat_subtype_iolink *iolink,
 			return -ENODEV;
 		/* same everything but the other direction */
 		props2 = kmemdup(props, sizeof(*props2), GFP_KERNEL);
+		if (!props2)
+			return -ENOMEM;
+
 		props2->node_from = id_to;
 		props2->node_to = id_from;
 		props2->kobj = NULL;
-- 
2.53.0

