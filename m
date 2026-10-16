Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB5D38330A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125885; cv=none; b=dV3ASTv2bqgOmZM8ZgT9zism6SaDXVxcxuKd+oYQ9QIl/4m/BCJac6TiF4FVXn1Y8nNnJY7xEHgls2GgtGrioXa1iZXIHWWQn7OUw3SzAIBBl2VisxNwXaqZiAanSzKDhSiBC+9c6Yoyreqrw/AeReRkemJTwFB8/A3p3UsJfI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125885; c=relaxed/simple;
	bh=AjrjMTpYbeAK4JI6FtEtzk9rlqw3yHKLbp/+E2qvah0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCugB/53KJjHGpvod75qc1GKGIEA1cQ0F3c7LQjQ20YlzARtffrOuok5Y5ta1qvWAm+54726qLMqiiSLovNUscRHioPEC5xztgLY6zd+qcWbKf8UnbZ5/HucSaOrzGaVpHlY58+E8eEAb5NSLuieeLghJMJH2AvntHSHIojHJw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q8TjByhi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q8TjByhi"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e49fbf92aaso35899465ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125884; x=1792730684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekUzfSCWNq1Ng7vt6OtO+4tAJn/2muvIGZQLxicYOuQ=;
        b=Q8TjByhiAeQt2n6tvRO8KD6s+dDLPFuveUuxposNl/5T5Z8yvI6jFAPFvd4k9e8gYK
         FJxUNYDKra584ewXTicTVZ4xZda+eCKRayvzAHzi2AS06uFQs3cCXzDyDBhEwmrPlKPx
         a+/xgIA979XynsDEawKVyaM3Neua+Jp0HownQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125884; x=1792730684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekUzfSCWNq1Ng7vt6OtO+4tAJn/2muvIGZQLxicYOuQ=;
        b=bC+p8LET1UogEwC7sW1DoVlbOKqPsU52yDrYMPWZe2FOSB6FVTfgM7rSjdzbHAXhnU
         +uUkw+iR8nphZI167r92bqIJnfflgC+TXh9ASbPKXCfnpnvUgvv+GL9H4IdDhEr56f3L
         IZwPwTQcSQNaQ52VuGU3hc9qFPAI8inU0+321ITlWhoGk42vSoTwllCRE85LjWX61vP0
         CgxNIvB+8J/23fW0c95bSlIoMeb1ZPQDg2BcbJ4OO9Mk9DyqzJkQehSVkoZ2rLut7kPc
         6uZkrAVmnmCDdexcdfTXL+pEpC4IL7OfZjIgo0g/yjkpyyzhGW/+A8fePh7b0Hx0M0/8
         VbFg==
X-Forwarded-Encrypted: i=1; AKwUvBwqGxKiQUkeZwOhyyWOaNzg4GiYZKe9as/StXsw0v35PZLQc4t4nrxYK1Bny8MV66u+cB/SUUYf+ndVTj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgZKaJZ4mFITuXh9ZbHtJKVwmd3vu7mNW2TqGOTdsKg9IlihJE
	lSOb7a5zFrKu9hEWlLMDI5Qn9TpTLQ6AN+ggvKgJP/VlOYWTeFH/Uupz9U+BOr28UA==
X-Gm-Gg: AYBFou08c6HU+D4Y+fVxtp3RIaM97k+LB1luZ26KaQFwaqe1Sa3UdQU7P+3xhNF2y6c
	sdkzOmYPZu4ya1C2VNJLB5OZ3qRSvcfH2sVFnD/qNUq38ZX3klvtwEAmgbAsZjJnrCyM0mN9ygE
	LZrgGQeTGUdRpGSUe8lGZg2J33ELs7RsconmagMWjDOeYS9z4AiJzH00THT3S/GI+fP0ajVqO0C
	ky4mm7K/PYrFfEBYwzkD+o1UJXajtydOx4DlVdCI07QPir9AR8hkervGS/EU9q5KSWutJhSTObL
	oDHPCIE2J53pWl7tTNWpt2lWynJp5nVRm4Ednp6/FkYgh8976cUC9Gg1RdDXxp6wFVnyzlxSvf2
	SRz2ndbltFhGZ+JOpC6urSPHY+aqPb9Vb/wfeAlHAh3sQ7dnMpxikjEN8mYSjeRPhatNu4pO7ly
	tdQpeMOjG4E+am+IqQzKKCK6YMaJXSkxkpc/Sq0tuUzxpbX85KG5PXMfGUUvlTmLQm/TVz62Nz7
	zeaOfh6t3Ze8satRd3bt/0QDFrDylNHw3eEED2SYk6fk72G+a8I913IvR2fLtk=
X-Received: by 2002:a17:903:1a10:b0:2e9:7b4f:b98f with SMTP id d9443c01a7336-2e97b4fbaf1mr15649355ad.6.1792125883969;
        Thu, 15 Oct 2026 21:44:43 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:44:43 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v4 03/12] zram: zstd: do not allocate empty C/D-dictionaries
Date: Fri, 16 Oct 2026 13:44:08 +0900
Message-ID: <20261016044429.1304561-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016044429.1304561-1-senozhatsky@chromium.org>
References: <20261016044429.1304561-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not zstd_create_cdict_byreference() / zstd_create_ddict_byreference()
C/D dictionaries when no dictionary was provided in the first place,
because zstd still allocates internal memory for such calls (~96 KB at
default level 3, and ~160 KB at levels 9+ on x86_64).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_zstd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 127976b5455b..b367049f131d 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -76,6 +76,9 @@ static int zstd_setup_params(struct zcomp_params *params)
 	prm = zstd_get_cparams(params->level, PAGE_SIZE,
 			       params->dict_sz);
 
+	if (!params->dict || !params->dict_sz)
+		return 0;
+
 	zp->cdict = zstd_create_cdict_byreference(params->dict,
 						  params->dict_sz,
 						  prm,
-- 
2.56.0.176.g3575e65682-goog

