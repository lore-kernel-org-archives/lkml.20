Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9BB42D757
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246850; cv=none; b=oKbFQKxN8zze32yxqS5p3RdUhn/OfMqcwUBDrtPAB/g12RJBKHskxn9sZdzRmVg3/BY+vo8S4CyM/sHkZdt81ylCQP+/oxVagNGRMUwdCCEsCv+DijOPn3ik/1P2Th8BHm5rGXaa78qeXDOwLB4ERQH5o7mv6ZfOq1WbEYyCwME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246850; c=relaxed/simple;
	bh=J4RGoZnnRiQoevlGy8lm2wL/d6hz8MOcWCl8s2VRWIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PpN3cTZmuzkNm2D5W+yGn0rNBI58A/JMIplYs7hQnHFHOxp0yUubCdF2VkW77E6bdFRZGF/rSAwuchqc6vUWFCXGwrxgWPZiHuQP4UYdWVZpe8VPCKJUUkgXYviIMPH7kr+mG/iTye37V560yWv0PXiGkrCmrT0bEaB+rHhk2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rx7B2w/8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rx7B2w/8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d942c7cc2fso4923765ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246848; x=1788851648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhnZnMS1zl6dPRGigIwYLk+xKIiY6xljGos5e3aMaGE=;
        b=Rx7B2w/8tRz6cAHeO+mx+t4X0jgQpoQZ3mJ/trWX6JAjl5BpQGu0Ua1xi4/5Ori4VF
         4sfR2V3rbMrDLT7mVaDLNxiTFHPreue8z8QVqnZZ9Be+OGookjnOn2bHtlpWcDlznweS
         hiDsf6qSB7wb0k/c6yzB5zvL2L62waIl8OnLmCtWMVzGTuEeM+05WnLXxYKPr3FMtjgD
         JGdhak87kZib5lsTVyrarLdeQaUeuiGtmyRVeKwviPbO7Lh6X24YMgAk4dwDmFNmX7U1
         MrWWfjqiiNziQ4wGITOmTBXXu643s9mDUT4xVempFU4Oppf5GYovRfyfDu64UmITMNQ6
         78rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246848; x=1788851648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhnZnMS1zl6dPRGigIwYLk+xKIiY6xljGos5e3aMaGE=;
        b=MKsSBieD6RL1wDVY9wKaFWA//da9pzpmFwc7zcKmA/J24Fm/IbJN0hNeScG51yQAek
         gVh+q8pqD4u8xZZm3xOABvHNov6/waWLXHUDNiHP3v8vDQnr6KJIVmt+M+ihcjsq6C3V
         pIKbGyFOoD1P8E+2oD2C7CH6fYWIOHfbCdsq9wyFZYNWIOXf26szSmxtupBouWdY6FDT
         83ZW6erHbOLzwIaHouZgZtFwBiQRzRU7KDJO3NUC+DJRUTTi/rhEFrFXVavVDoCQsdtc
         5XoXLaJJjaRdr4L+z4m3XMr6X5ofSzhjsYs6MMsrakzhAFOzlE3YGzljInHhxZG4m/GZ
         SUmQ==
X-Forwarded-Encrypted: i=1; AKwUvByXA26kwZdzETufRT0Q2KTGFUe6CqwC0v9QpJ4F2gTvrPx/+hfpPYgP5PXhzPVI5Ph4SNsUYGtb3SW2P6A=@vger.kernel.org
X-Gm-Message-State: AFuF++kENO/GvvNiolqZwOrE/IfG4pPt8olhkpxIWQU/LTHd+apKV3Ka
	YoXvxd5MG+hMgVvclV6cZUr/DduNGMriYeKApOs6UGTsv7rOOMuc4GIb
X-Gm-Gg: AYBFou2n9TzUhkyqeosBSiHHV7kNM56l+w3N7zq36AxKiqfzFq0BpM+uRfTFLlfuE2i
	SRfGJwkdicLS62RvBD/Gld+QqNUXsXjNpsHBHzJwMASV+MplBRwvTXT6aotzY9WDVp2fsapGjdV
	+IYePj/Js0+QfibsKnKwibhdTI5sAiidhEcMId6dlZ8oBal3CsGx2decQQ1YgSK/IrWq41Yn211
	BdSJ3djwaoo6QY3+qsYCNF/vaflSLe9dkm6wA5BRbLHAiRTdjgzYYAw8ribyHU6GPXszjF6nLIW
	jtyTaFTW7I+rQcS7liXxZoXlv/dzbXj0YYJheGL28ZFfIioFlj19V5Eixrj+OYpyK+GrVV8HnVJ
	tSy+i5ZnEkBZmvWEOrMimgIUbKuk8sVP8jDRNB5RxvdwSb4IJQpCPLQ9TL6Tl2lCqL7S87Vhlua
	a1eGV7uJV+X7K3zaV4nEr6KqkoJFM9J6ujDuc6s1RcgZT+QR4PZO9EOWAG9Ooz/oY5FmQY2eWB5
	g==
X-Received: by 2002:a17:903:228a:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2d74ddc705cmr412540935ad.10.1788246848073;
        Tue, 01 Sep 2026 00:14:08 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm34374175eec.23.2026.09.01.00.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:14:07 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] selftests: net: ipmr: Avoid memcpy() from NULL in nl_add_rtattr()
Date: Tue,  1 Sep 2026 07:13:53 +0000
Message-ID: <20260901071353.3302900-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nl_add_rtattr() unconditionally does memcpy(RTA_DATA(rta), data, len).
For zero-length attributes the callers pass data == NULL and len == 0,
for example the RTA_PREFSRC attribute added for proxy MFC entries:

	if (mfc_attr->proxy)
		rta = nl_add_rtattr(nlmsg, rta, RTA_PREFSRC, NULL, 0);

Passing a NULL pointer to memcpy() is undefined behaviour even when the
length is zero, because its source parameter is marked
__attribute__((nonnull)); it is flagged by fortify/-Wnonnull.

Only call memcpy() when len is non-zero.

Fixes: 05068eaa67b2 ("selftest: net: Add basic functionality tests for ipmr.")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/net/forwarding/ipmr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/ipmr.c b/tools/testing/selftests/net/forwarding/ipmr.c
index 9cd9f70de132..d3e26341821c 100644
--- a/tools/testing/selftests/net/forwarding/ipmr.c
+++ b/tools/testing/selftests/net/forwarding/ipmr.c
@@ -120,7 +120,8 @@ static struct rtattr *nl_add_rtattr(struct nlmsghdr *nlmsg, struct rtattr *rta,
 
 	rta->rta_type = type;
 	rta->rta_len = RTA_LENGTH(len);
-	memcpy(RTA_DATA(rta), data, len);
+	if (len)
+		memcpy(RTA_DATA(rta), data, len);
 
 	nlmsg->nlmsg_len += NLMSG_ALIGN(rta->rta_len);
 
-- 
2.43.0

