Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862526;
	b=WF5aD1paX4UrmShg2mvBPgSGeIhOIXGpCm58kTucW8vwlvMIr5d8RVR1NUkDCFz2sUtg
	 J1r9jaKx3s5D4r6Ctg0aoccMZORbuY4E5gaGNo49EwNfEm91xCyZmoVg0P3FggH9yDbLg
	 Wj60a6shZCQ5BpFwTJ+lSuPx6m/y1BEYvagp8x213eH8EDNavTlfQ9zFskBgUJqd1ewya
	 /1JxzdrPWWAAhhuBsNTAWp7PSv63D0aXXkvOqRJmrKTAOMD15d7jTlsZ9Lh0VLylqiLTL
	 n0YnmalhhlnuZAcHTiE85cXlill1ekvybRhkWHcIjaBO28bocUx1oVFgIf3adjumQcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wS7NPyyHVOmXQuTlG7y7+HuqLRti0ISrh6Jo5BYNAx4=;
	b=l/KOmJPMBdRbRPO+E56sPGnJtwOwrKEsIJEHxPc/40hYh/MYiZUVzlo+BlNzuSZ4J1vu
	 o3pyZVSYgI6AFkWotVeSZEMMpqo5ynAlZ0oqxsnp0PGAo6SNbI9No3gOO74D0h4/j40Yg
	 W7KDa4Eo+z1qfZQSc0JCGgNZjbeD/lJalonwFqMdTjaG/MMjllufkoTS+ZT7NKxlpNq3M
	 7jxWm/t2vH4aTHGl1ba5j92TjQWzSlJMt3uruN5aOS5nKwTsrCj/IqC7PG+9QBMwMLZYB
	 DoRUv/mCi5OhE6YG5+CUmfeyn/hK5t8pGIkUSXG84Rke4jRIHdXSMP0fEg6grO+sFvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QhkwdHBU;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57691606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57691606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QhkwdHBU
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2670757eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793862524; x=1794467324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wS7NPyyHVOmXQuTlG7y7+HuqLRti0ISrh6Jo5BYNAx4=;
        b=QhkwdHBUmS5nl1dT9PPvptTAGiNlZtYsksCHjzbMXtF7BltLhskfhnsFQw2cjZ+pSr
         Ec8VScPTpIu9FK4tPMA7l4DRmc4VCIlB6SCwJDYg3mG5nKjwQdsGeI9KzXKWV1dVEDvt
         lwlDvvJ/m0jWu/zxjls+csQH+sRPMLKHOgaqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862524; x=1794467324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wS7NPyyHVOmXQuTlG7y7+HuqLRti0ISrh6Jo5BYNAx4=;
        b=w6+w530ASjXgW0MfzC25uX2pkVzXxXz0ns0mQmkMin/gayzk9Jedmf4LN2rMjv664Z
         QvFK+yky24VRZDV8anVfOeToR9QYaiIWL68q5Bzg2QngjmAZNzfqjf/FC8QmLnr3MAXa
         dJ7qkrKEcJT7Vi8HKCdVPu3C+3uZ7gxiV2mlq/wIk4aTPGtylsxpGXzS6MRqESgaGlGi
         iBQvkDxNrdJ7I+uIF525ECeE2XZcokI0Sl3EJ41CsnoY8UlbuE4t/92Kt8ZSOr/x1Akv
         gV7Rn9/rLB7KwN+WXWjyRANd620g+GXMO3yANbgDyUz5nVi1T2poJinSK8FaVmqK6ii7
         ULjQ==
X-Gm-Message-State: APuU4Z/raRB9m03diHqXK4HmoIdsd+/gAhyEixTm3o4NcCczxgxkEc5p
	zLNiW6CFrqFjtr3xE0zKuemXk7JMApjw7wZTlQO1Y1Q9y0As9aWo77raV8HNLjyM2Q==
X-Gm-Gg: AYBFou3jXOJ3qlbp21iFCI/vmnuhPiPGE5tf1Ab9vMz6SjlBOs3rIpO5qiM9J3+sPQO
	oOsKsAD6rzWMsHCMGW647Uzn63LV4HVfmRxX/twd+0EHQbpdXAZ/zKVov5dWkSjd4QnsfjBGkGa
	HfanKA9S7Lkvxc2x7eHrcln8QJN627zxL/EjVlJtcm1j3v9LkCzXAYDRSK06f0F884iLBsoUoBD
	3dSALWhL+sLqDmBuKSUZQvyTydX8stlI+Oo5vHFYNAvx9lXBCaShc/y2oXG10bz9xUi3rfAWXk9
	6PH8llMWA0sOHxQsWlSb8LuFapJLgOb6VEpOxHJu8AOaKcNAUHTrI6U9OQLBXVj0bw+3clUV9vO
	9wJYSz2x6r7td5wIIzRzjQdJql7/Va3JR1bPk9RgEAtmbP1kzNUClssH25LUERZpAyiY2mlftpy
	sbir4dLtkzd0o76H1KJKYopuabMMmDeZXZVrwNQnyP3pegRR63nwCYBPrFSA9IpIjwdCdsTQwtJ
	0fXEM2QGyYYsk3GtblVgpCaqoWc/wzZRzTL3YWvf4wPUk9MJR2I9FwPeJO2Msjq+EOHzZfUp6j4
	sYgMqlDpim6NxW3OmHV9j5V3JeQrepvwD8JtGoJI/KPA5wwk6KngXCV48l56G3D5jEHPHtVyLGj
	eH5d68i5s8A==
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr36995719eec.32.1793862524055;
        Wed, 04 Nov 2026 23:08:44 -0800 (PST)
Received: from piwnica.c.googlers.com.com (13.53.146.34.bc.googleusercontent.com. [34.146.53.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm19703210eec.3.2026.11.04.23.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:08:43 -0800 (PST)
From: Tomasz Figa <tfiga@chromium.org>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] MAINTAINERS: Remove Tomasz from VIDEOBUF-2
Date: Thu,  5 Nov 2026 16:08:28 +0900
Message-ID: <20261105070828.1992653-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
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

I've been working on other parts of the kernel for quite some time and
haven't had enough time to follow the development of the Media
Subsystem, including the videobuf2 framework.

Please accept my apologies and let me step away from the maintainer
role, so that someone with more time available for it can take care.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..af302622c849 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29512,7 +29512,6 @@ S:	Maintained
 F:	drivers/media/platform/video-mux.c
 
 VIDEOBUF2 FRAMEWORK
-M:	Tomasz Figa <tfiga@chromium.org>
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-- 
2.56.0.398.g882cbad275-goog

