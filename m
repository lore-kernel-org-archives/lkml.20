Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D04756DF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523689; cv=none; b=Sv/RtVpZdaNDzE31/MYuBsqAwHLagt1FpRuqxtk/RVL0eKW74nT002sFTGxMBuTiJTD/9Vqz0TzIbLcpd7Qb/f/AKjnngioM+1xH8ItcAks4BCuPNwwyOUQh67ZL9JjluN7WGhkOl+n+myhCFioDWFpn3X1OWzscoD04DKovE08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523689; c=relaxed/simple;
	bh=bF50Es5kGsFGam0ZPrdxd02Roywei/KYtWPC1GUsuXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7RU5Rxs9RdBAzvychiKSS33FKQC8SiiUF2HHMIin3QDqL2wgSqg7JYAKZWPeWggUZpHSZbuHyf60rRaGDKU/zuTHpMWqKxZRwijJQqqPM6cE6HaBgZ7ffRx2bwkz4tOrAK/UTTls9JgGtQJ2ocTDaXZnGssueZA735QhZjI7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUFA/CqQ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUFA/CqQ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso791559a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523687; x=1789128487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oM8aQZbXCDmc4eXXQM5oISEOEFtAiLdVsWjbUkmQpuA=;
        b=NUFA/CqQeJkOMUD+1VDAuf+uJpzYMYjhsXps/IkbQYxZqmX45ybxtgPB+ZpSSf1IUg
         RdC28Yt+j3tpxSaMj8bHC0QSD5pba8Biv7AmlZiDOcbup0KsHoQhwq7Quoe6raQMjgyR
         IDgq2nTZbydekOem6A/+VZW9TMzoX0/VHgblqVdSE30lwa3LUMTpXOxwQQBWpy+e6Wo6
         vc0RE0nT0bp2ZQ6ozJU5D6rGHYWCXRQixnnU9CtoZr1/Uys5vCTXLzpUBMQIrO9PMOtJ
         CTNe3bRMqMIDQvLOkpJCqdVK4fkPkSYUfAtP25kOHu1DPFKXekKdxP5LZndHi9N/1RhO
         cSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523687; x=1789128487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oM8aQZbXCDmc4eXXQM5oISEOEFtAiLdVsWjbUkmQpuA=;
        b=q4awxhhWbUGQ2eMsO1gpARmHXm1taFA9FNpB5DrAx6ZNsreVNKT7zu/2oKVVeQjahv
         NpSTAEQKaGJFGWC5DHdArJUUjTwS3HkSX4cRyT3R/sXTpz5Ii9wjrKLw+PahQ4c8jnaE
         +zvQuQTOZbIJMrSmiWpcM7/lUMiZb7udgMCRw9qMBLOiKcNMdi9L0HYl1wz/BeR2hHo4
         QcJuau9+MMGB+FXZZkT9Eu02Yoej8LK+pM4oDTUztv39H5q0eGL8fWKzuaYvWaaMq3YN
         eJoDAZRHI1W08r0fhuPE7KzocQqrrYt6R/cOiuxJPP9IwRcpR8oQnIM04OX1t2imiOf8
         Q0LQ==
X-Gm-Message-State: AFuF++l8unkxMK5xKjnfBKQK6U6IWt6TJQO75211nDNrjLoUS6acx6zt
	B5+KGRoQkKzor/zqCNRWqz0DTfUSFHCru8N4lKsJ4UG+ZjXop8+eXZ8ph5hvWSwFIAg=
X-Gm-Gg: AYBFou0iFG16as8fJVJ8lt7Zd3BarLp2iVEVVRD+CbT1IrUdIuEyhqfIpoIlF8uyNot
	HdFkLPvecsSQ+ZEzYSYJ8iZ29lXbKNJTv5DFx+6BY77hNZwFgJwifABPq/avNC62GL+dMMP30Rd
	6kFGVgpgjxmcnvPyLfy/XAXWd5mLDsO3sbcPjfkVjLoB1mo4HlDv8Uxyrli0/CcbZ4P8XYXAYuB
	E8k2F+IwgN3sTHPJxH0TCuVqcy4wEsIJHaqAtwmiWWB8rkzZ60OgE5ebLhlPXtDhrM4nq83lgWA
	t4J43jE02SxjBe+qiITeMqIHEEh+CAMqpb9/kml2y5E5vjWdT0teaAVxVIZqJR5XaVfQlnwWBGo
	wPZFM6CUWNoaLzlNfmRmMpe26WrkT1GWdj7tNk9ajPHl2VPA6jPDKuJRSAEMl6sB2tFENvRpEhg
	4JWHOiInleQmlAVhzobGdB9eaWi2xGTjZrR0K7sPfXT0HRxx9sydbZiEsMyNCqc6BuvSsBJ98ms
	kMI04D/+66gbno=
X-Received: by 2002:a17:90b:56cf:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39b262aa580mr8973172a91.17.1788523686832;
        Fri, 04 Sep 2026 05:08:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf44ffsm5831087eec.28.2026.09.04.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:08:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>
Cc: linux-kernel@vger.kernel.org,
	devel@lists.orangefs.org
Subject: [PATCH 1/2] orangefs: fix typo "overriden" in comment
Date: Fri,  4 Sep 2026 17:37:57 +0530
Message-ID: <20260904120759.19755-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120759.19755-1-hemanth.selam@gmail.com>
References: <20260904120759.19755-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "overriden" to "overridden", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/orangefs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index 42591252e239..2de49bece1b2 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -490,7 +490,7 @@ static int orangefs_fsync(struct file *file,
 /*
  * Change the file pointer position for an instance of an open file.
  *
- * \note If .llseek is overriden, we must acquire lock as described in
+ * \note If .llseek is overridden, we must acquire lock as described in
  *       Documentation/filesystems/locking.rst.
  *
  * Future upgrade could support SEEK_DATA and SEEK_HOLE but would
-- 
2.48.1

