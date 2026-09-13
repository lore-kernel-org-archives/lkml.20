Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1948E377ABE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297442; cv=none; b=RJJ4npkF5L2BELIl0mvIg2gBajxr2aVDydpYbP3jQ1a3smEm5ehsszZkF52DHBXVptqa9Oxpi/1DWUmB9k+Xz+sfRRcTP5fgb/VzZpbCwzPZTlI7SPu3JVksOdItPoU9qIsRsoNBZevq16MIE9NniqwF+0HTYzi83MFezDxLjO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297442; c=relaxed/simple;
	bh=S34iC/bjfhcXhj7YY88XiwaqWViELbyiqoURANF+qOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyrPRBU02cHpAjaxS3ahqNiuP+CNLfrH8ExEezXq76YF01CFrthG8NmpRcQEo++r5TVX/KHX77X9+GCiYrg83gcpXTY3u/8CEjzOJy60R/xTRDvl9I32piMraml0vI4v36LoNc7Lh6BPHdeEG47xszrtZeaGc9nkcO3sE/7JbLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrwLGqWw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrwLGqWw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so17863975ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789297440; x=1789902240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyuRqgAnVGwyya8hRF/5ry5xM2Hr8OUc+TIWxjrQB+4=;
        b=YrwLGqWwsPwA0fyZHp4NYNxihB9Xlu0W3C0e0fbKcC8yhuWdgcBJ4j+xj+5QYbZLxt
         hj9q9brqlcgiI80R/omebtpLn+C93RrT1LwHO6nokWnpAyrOWQz/vDpddExBENMfs2P/
         d8MgMgCCNEotQBYqt1rYHZagzq2PYPLTYYU6dAW1uxIbAxf2DoEGklZv6DsX5Yx5f7fN
         KkEE4PLo8kqzorw1JwebhRaqqtZCXLVpr0s56n0UFeHFeXEv0OV/5KnIeoRSVaAlbV1/
         bI55G6LuyPWYT9gKqsBo+bVLUbefRzPflxmTemWi7dN7lgsVnRCfmTXJwtcaFLBb8tqu
         u7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789297440; x=1789902240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyuRqgAnVGwyya8hRF/5ry5xM2Hr8OUc+TIWxjrQB+4=;
        b=YZNx6RPmVf+qXyMgaAp2SCWsOVU1bHAMWkBm07TNorUNl8ezvxZCDDnwbzlFYIbtoa
         JOElGD7R+Ey3WF44OS3yjYnnDpyaBKgmM2XXP0r4EyexJ7OnY8KyOzmX1OROwrOtfFTd
         8IYcDMiQzM49USQ1SvUx7oHE3v2C3xTDRNw6yrcuWf4gshuFP1uULmhDpEZ7WUc2qOgB
         M0vXfrjYDkldAJ6g7Ezk8dyIaT6lY7F622XIeqlXSKY3croVfXKl3fxBjrlEzlzt2GGO
         QiPnZSXsrlnZo/8t++GoR1e3dtMpOqCTOuqHj2Z+tDsCTxysImLNTj4LoLc04OtwHSmp
         hB1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzy+Yk0fMFkAO2vMHMu0OWkAxbWnIW4HRC5X0Nl2mY05+EfHyedQublfsaOyrhOwA4AUA00eOPLSZgNfoE=@vger.kernel.org
X-Gm-Message-State: AFuF++n8S/QKDCShOrWU9VkjJWfTqnKvQGcDfVe18yr7uaud7poAnt1s
	i4vepSWrwDz2mmpUI31zrkQfbN6bxzfCH+LqokQkrydTL0EwxX8FiVEv
X-Gm-Gg: AYBFou1RTgM2rLXOPHSGl0/mAfzrqM4UVKNnyYSvynTCl7ZyYns+r+3VantLdOVhhUt
	FUsPXxoNHdBMzMEck5tA3St8QvfUegV6+5qHj6LCWam3/nctz82xT3BKrW22fQ4KypqUqXB4T3/
	OPqYJnZOmzkUVxR9LRgLdfOUuS/d4aHSOwEfYeP4nKyk7F0vTeQQslFaERx7KY98UXrxKTWRf69
	9LvZ9LIc/pEmIFLG9oXsL4wey9enBpVByGEDYsswYsFFIk2z6zFdLWc2FDdVaB1guTT7Ycx7rdQ
	PoTnWNhZfzdzESH5R7AekqtdOm4iq8cD2fHTZ9gcljNhy+sxHL9qyd29heQMH83j9uChe7odeR8
	O5oXcW6DruLoHKaIuBp6pb6ok8vIV3L45s8+XOG2hSJtnkv8iZ56v1DpE3u4CdRL28ilKz+yo4X
	iUjs20dxamfIQkX9XdcYTrXWVCwOEuji5lwMLr/YkvL0DyUKCGK7E/TQuJFsoRxmcZCi3ouEL9X
	Ak=
X-Received: by 2002:a17:902:e88f:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2dd5f1b11d5mr21545765ad.19.1789297440322;
        Sun, 13 Sep 2026 04:04:00 -0700 (PDT)
Received: from celestia ([2402:1980:8858:8cc0:7bda:d54a:257:22ec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff67aasm32885925ad.79.2026.09.13.04.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 04:03:59 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: 
Cc: Liew Rui Yan <aethernet65535@gmail.com>,
	SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/damon/core: add short circuit for esz<min_region_sz in damos_adjust_quota()
Date: Sun, 13 Sep 2026 19:01:38 +0800
Message-ID: <20260913110407.32558-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After damos_set_effective_quota(), the effective size quota may be lower
than min_region_sz (e.g., when the temporal quota goal is
[over-]achieved).

In this situation, damos_adjust_quota() will still calculates
quota->min_score.  However, this min_score will not be used in this
window, because in damon_do_apply_schemes(), damos_quota_is_full() will
always returns true, preventing the scheme from being applied to any
region.

Therefore, add a short circuit for 'esz < min_region_sz' schemes to
early return from damos_adjust_quota() before calculating min_score.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

Changes from RFC v1:
- RFC v1: https://lore.kernel.org/damon/20260912124406.96535-1-aethernet65535@gmail.com
- Make patch more complete by covering 'esz < min_region_sz' instead of
  covering "temporal quota goal is [over-]achieved" only.

---
 mm/damon/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index ce8c6f99106e..15758525765e 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3318,6 +3318,8 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
 			damos_trace_esz(c, s, quota);
 	}
 
+	if (damos_quota_is_full(quota, c->min_region_sz))
+		return;
 	if (!c->ops.get_scheme_score)
 		return;
 
-- 
2.55.0

