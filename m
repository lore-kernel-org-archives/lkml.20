Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850C4BD780
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551857; cv=none; b=unwxQOEyaGxm0aTTh5ZJUTZvu5ey1IwcB36CBQKSrUKHulr9mEJ58OaKDlu95rh3+gJZUvZX1aQgGI9UD56b2np+EaJm5h+LBeEHKFoRR6CN4Eg/br5iA97mrl96nzpisZ+l603c9YgnQgwLpjx3fd/0AUwwnX5wS1fECqmACFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551857; c=relaxed/simple;
	bh=xqbuFg+8iN+2Dyk01REJqG13xwBPoq3m834weQ9pQ3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PciOBI060ie9KqXfMeSFxjtLK1BgtvFBMuxnjaYbJyGXnthp0lJ9RwkzwHQUCsoqem4XNWLgm/F2/NMKD6x+rrtUPmH7lrMPP3AJepzA5iDHnK3mMEJhLmNRJeWFZgrSkqOUMfkLyVoSSWbObjFVv46k4VqpLLASM0SGiI5sKrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjVaA7ud; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjVaA7ud"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b02aab050so3071197f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791551854; x=1792156654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+64FNEEi48NFXXTTwHRUHjafgwGY27f3h1TjpTMjEG8=;
        b=KjVaA7udXItsSQgWtgRHSe12cjpL7dui8JzuwZ+AxL0IoTvo3jSeIdvLcYj4k7bAUG
         wUrJPRrnu/6R3NnHk0WqzaiNh++CrNtn0qi+dz0VuzRQ9+g1ilpJ3n7JDPCrRBizhZcZ
         RVgkTkAL+wJCe1QTRNw/ruXOB6dkq6RfAm44/jHzH6j24jsIylXg6kAEB9LHwxvOfVa2
         Oo80aJmBDyN0t0KkP2F91Nid3gwPkEm3NnZcU378R+5Xtio2vDwM4otxeTVUu9jqdeNN
         IXrTsVg1BgEl911gEBnDJnJ12HywGJwuVhFV25WEj7yml9yK5PZ9TmCaGpIyLUyfc2Nn
         Pb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551854; x=1792156654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+64FNEEi48NFXXTTwHRUHjafgwGY27f3h1TjpTMjEG8=;
        b=2bStxQ10Fd5UBIFpEPEdrzAAl3jTIFxR81yTVHaWmMCKUN259r57NXgWjlV6B3vMlI
         2c7NrshSAVfdPpKyhKuYZ58bULEH3OG7msVt+Exg07hYZZ3vBu51lAErNqJWlhsLpn5/
         h8P5rG4nAKU1mA813VdhBW4DNCZAWrGaxwNVmmp/lh+5KTH1WEP9/+os5XorUKySuS+c
         N5vU0fWQcpgpxfpDgLl2weKs0BBTQkoNaB8AAMx6UVspzFqVI7qSbG/pj/Pt7dZzP+y0
         nvQcwN0ugKrhAqIpCSbJE3B2c4L+AtnTVx71LOygpJd0Atf/XDOn4kgxmk7tGenW6IBy
         ga0A==
X-Forwarded-Encrypted: i=1; AKwUvBzaYsrqa+iLq91KQM0uD1D+feP14LJfIsNgPbN4i1rKBMYfg9k9iunJ3N044ahR90JuZPj52KrRNXCJFRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8Pu0iNZpNLnJaxwaMXNnpWBXT9uCKonNRGa89z6qydHEjkB/B
	EVR0rs/PqplY4T5Ew4PMo0Tc1o2h0ijSf8AbH+1dsGCZnkxJdkPrG+AGL3v2NYyr
X-Gm-Gg: AYBFou3dm+S/tKxuVaGSifI3wxRxbdRCmkDM0enWjMxWr5jOGmxU73FRbkCOgOV4v7V
	2hBfEoYTB/QqpokbIP/0rOXUFDK7ErTITtvbcuIMun3N1QjlZ0pv0FFMlNywGY6m0v8YoR2jHmj
	1XFcqOgZOq1TUfhSl6hmEebv/zsIEqTwLZLcc88U2KvlkBAKgaECaHe7a08mhKm7KJG3X0k8a2h
	XxKgmzQhsEEyaoIoMbLWZpF5Ix1ihO2XlLqwYx8kyFtBVcootr0zs9J4UgkUpB7zOR/azyhWnlb
	UFC9LNJrVfArnWPL2Yeknjw41fWllPXrOLGKs1aCwP9oyzjXdGdS2ywjnzdCBVv1sjsPs1LNfpe
	c2YKzLFXLjo64xfkkYTMr7t65FIrRBKWXxIdL1U9wy8FIPZToNiamQflIDAj0JANyrFn65jWPUO
	1+vFB/q+GxY2h9rZSsPaVYBubU+38S1+bUwHNXIZZXMERQH49Jj+NYDUzYeFvRATJV9fCZK81/J
	5Ss/3krs5SysQ==
X-Received: by 2002:a05:6000:46da:b0:48b:1276:72e7 with SMTP id ffacd0b85a97d-48dba9db139mr2786462f8f.13.1791551853651;
        Fri, 09 Oct 2026 06:17:33 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.205.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm3997138f8f.15.2026.10.09.06.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:17:33 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: haris.iqbal@ionos.com,
	jinpu.wang@ionos.com
Cc: jgg@ziepe.ca,
	leon@kernel.org,
	danil.kipnis@cloud.ionos.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/rtrs: Use strscpy() to cache the HCA name
Date: Fri,  9 Oct 2026 16:17:15 +0300
Message-ID: <20261009131715.39217-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the comment states, the HCA name is cached for sysfs. Use
strscpy() to copy it directly without unnecessary formatting and
avoid interpreting format specifiers in the name.

Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
found by smatch:
- drivers/infiniband/ulp/rtrs/rtrs-clt.c:1906 rtrs_rdma_conn_established() warn: call of 'scnprintf' with non-constant format argument

 drivers/infiniband/ulp/rtrs/rtrs-clt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
index 927e3f30483c..c85e22f670ba 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
@@ -1918,8 +1918,8 @@ static int rtrs_rdma_conn_established(struct rtrs_clt_con *con,
 		 * Cache the hca_port and hca_name for sysfs
 		 */
 		clt_path->hca_port = con->c.cm_id->port_num;
-		scnprintf(clt_path->hca_name, sizeof(clt_path->hca_name),
-			  clt_path->s.dev->ib_dev->name);
+		strscpy(clt_path->hca_name, clt_path->s.dev->ib_dev->name,
+			sizeof(clt_path->hca_name));
 		clt_path->s.src_addr = con->c.cm_id->route.addr.src_addr;
 		/* set for_new_clt, to allow future reconnect on any path */
 		clt_path->for_new_clt = 1;
-- 
2.53.0

