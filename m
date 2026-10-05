Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED5E45041C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193225; cv=none; b=qXDVBq2PnZ5Eo5N1GHHbFQHYGYGNlAzUec54eYX+mGTM/GgltSGoNwjKJJlpjj7AvYJyHR7ZKcZ5zLvBA9bMPIpPhl+p5B74Qm40clD7Eg0CFumzy26c2Gk89Rwlnd8KL4AJd7DNw6TFh9qQPxqiFHLRXoa1yNtzYHfVW4yprb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193225; c=relaxed/simple;
	bh=QpU3JqRSiHbv+WYWNb/glKUdu42chmOLV4anwr8R0Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msRIiueevyD8BBzZRcaJkwxK6lAXLVVmjejiqwzEOCyfXlJo4mMQb4JcXO0Q0Uw3IxEd36tdYZmI64/+mI2usM8EDvb7/IPmVlWWCefM4YjdQSNFd76/aJ9ln3qFKxG1+8dZ8s9KsSS6FZOz+5vIbGRMWIs3zhJT9EA/AoAV2Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRW4uZkY; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRW4uZkY"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88bc25fcd0eso1379806b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193212; x=1791798012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY/ReaqTZBp6Cyz8uCafEuEwQewav6MPXXeAgpBCLJ8=;
        b=jRW4uZkYitzbntMP/J96QBwj4vr2FrUGptv8efg12D+8ylo9JIgRuFQL9cyH1aqCwA
         vGwZ6MGojoWLipmROTXPNJRaByDXDVBAk1TdMVP2rmC9m8p5cK27iFk8GjOR3+VHVLIs
         ECaHOBhIY8LgvYZ8o4QuYunUB+bKn1OSnTXXBQLkXGRxEGJ3/xg0u+C05+WLnsGnZY4Q
         j163yQBEpX+IgojQmap4jrvDP2XDIEGu+Mj2ETAfCoFgDiYYnuzvl3LbAJzoo17H0OxO
         wuYzcT752R4NNv45ZjUTGsBdwmlV+n0Yy+SljES8tzyqSacKPZXM5CYHiZts0VUEjEN3
         J1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193212; x=1791798012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jY/ReaqTZBp6Cyz8uCafEuEwQewav6MPXXeAgpBCLJ8=;
        b=pGngPLDKpeYQsUAwJLpFTjKubTl3MITi4Rr6wTG59kmvAwdpYsUBxeC7FXbX5zeTmK
         HWeVcQBrdGSEGGV6xp7onZ3Fu5EtdyrT9EMTX+ElU98uJyJj1o54L5OXiMstkcola7S3
         wuidLFHzHrYiu+1q6pa47S+BPVm/2cYNW4+YviP8rm06Caqj+7/DjlMQLEo76+FNppKX
         7mlm50Nz2gERhDWFLiaNaP4TxSvxNuL9LbxismA80myT5Tvh9dYqFTzTooMT6abH/54w
         qiQ/ZpjF/8gzXy9ePYQsOV5b7TwbAr2aXOcR79P37W37EkJXfV1WbR7Kjfdgq2xBKn9R
         U4HA==
X-Forwarded-Encrypted: i=1; AKwUvBzMGsQJ9mSp7nyAiQUU6Pnz+gZbRhydoHJUyl+kJVI68CzP7zz+xuMt+moVV0uwIib0v8iHD+iT/dogcbU=@vger.kernel.org
X-Gm-Message-State: AFuF++miVoLZ7wgcrG0aqCFRIbjmbVKv6yphEcRbcPouOXHhwKsHT7yv
	3n52ZGzvIXkNo3e1Yt5wSATZlZZ0A3+PTmE3Wmsqz1ZGXTFk3hRpACLG
X-Gm-Gg: AYBFou1Qaxy0azI67n4ls5pfOaWxuy1HNLIWRWcMCnD9GBq9L0dct1AwUldWf9cunIK
	WSvo+0s2hnjMkRiTimhRIFqRPLUKmKclFwSNvCLb3xAydDLV+YIsAcfGCM2/YXvnOZUYxdyO4kn
	vj0GH1B1cnomkKthrzKH6w1637rxgA7/AV/zRU+uh/6FDWEdajuftsC7xgdqwfJyPTj7xg0bA0v
	1zY6uf83l/bAkeDuLJu9Uyj9EjvLRXPRd6fyDkv85X62RP+aHPCjKwo9KEKD/11vgecr1im9nH3
	dzrhOCJm1iaMuXjPNE+rqvOQDyzgBlxfc4WirmFIcRLi2lHsajmjNa3TcN+oZEIot6qBryV9B+n
	dvxPcTWiraZN15t1o39Yq8GaoDkk1RZpwirimTavfrlG6XkgzliSJkqdhWIFIgMU4uwl8VXKn2B
	WiJ4bxxbH1qjC8ug2xN6AVbQ8FRqTEIPy68Z4Mcf/i1riOlu9AdpHQyBDs4y8BDqiTtiWrtv62M
	dylY/LUXZKnPPkMcRK2Q3iJkPgCZ7+DnBJrFyeRoJlCv6kERiE=
X-Received: by 2002:a05:6a00:21d3:b0:886:cde6:694b with SMTP id d2e1a72fcca58-88c6454a9d3mr6145500b3a.38.1791193212542;
        Mon, 05 Oct 2026 02:40:12 -0700 (PDT)
Received: from casta ([2401:d800:280:3061:5aa3:761:cbfb:f123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a4862sm3156138b3a.32.2026.10.05.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:40:12 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Subject: [PATCH v2] mm/gup: document unlocked invariant in fixup_user_fault
Date: Mon,  5 Oct 2026 16:37:56 +0700
Message-ID: <20261005093756.22709-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004125601.c06953a6f0660df9859b0c2a@linux-foundation.org>
References: <20261004125601.c06953a6f0660df9859b0c2a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static analysis tools flag potential NULL pointer
dereferences of 'unlocked' in fixup_user_fault() when handling
VM_FAULT_COMPLETED or VM_FAULT_RETRY.

These warnings are false positives. 'unlocked' is only dereferenced when
handle_mm_fault() returns VM_FAULT_COMPLETED or VM_FAULT_RETRY. Both of
these return codes require FAULT_FLAG_ALLOW_RETRY to be set in
fault_flags, which fixup_user_fault() only sets if 'unlocked' is non-NULL
upon entry. Therefore, if 'unlocked' is NULL, the control flow branches
that dereference 'unlocked' are unreachable.

However, this part of the code is subtle and can trip up
contributors or automated tools. Document this invariant with a comment
above 'if (unlocked)' where fault_flags is constructed, explaining why
omitting FAULT_FLAG_ALLOW_RETRY guarantees 'unlocked' will not be
dereferenced later in the fault recovery loop.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
v1: https://lore.kernel.org/linux-mm/20261003194846.205918-1-neganhat@gmail.com/

v2 changes:
- Instead of adding runtime NULL checks at dereference sites,
  document the FAULT_FLAG_ALLOW_RETRY invariant above if (unlocked).
---
 mm/gup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index eb898ea1ee22..58fa75441da1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1570,6 +1570,12 @@ int fixup_user_fault(struct mm_struct *mm,
 
 	address = untagged_addr_remote(mm, address);
 
+	/*
+	 * If the caller passes 'unlocked' as NULL, FAULT_FLAG_ALLOW_RETRY is omitted.
+	 * This guarantees handle_mm_fault() will never drop the lock or
+	 * return VM_FAULT_COMPLETED / VM_FAULT_RETRY, making subsequent
+	 * dereferences of 'unlocked' unreachable when NULL.
+	 */
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
 
-- 
2.55.0

