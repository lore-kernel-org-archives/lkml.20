Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0040B379
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023491; cv=none; b=sM1vowy+uvTRDKPgS3ljh9M+h3wraFC795fus4p4wrnx6rb4nt3Ny0OkCgDFiJSZwsVItSCTgcLfhz/+1wClgUta6gUYqt8AZIp3Y6wH74+SNgrMXFu+vR694G8fAKRHkuIfiTulz39ub95GLdlqT1ffuyc57hveY+6WbBJfg5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023491; c=relaxed/simple;
	bh=OfUrTqIkSk4Kw7Wg3ir9GpO7S8j2lJn2BdM716gS8Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=St4PC9xB+cozBph5q0iB5BSRvLmbNh/39acgHzKV1zxPn8g4zmq9lGwRmBuT9c7nAotLA2bcQkdrlAj0UEkgAoYAJlR2LGRFCeQ1L+D0Vt2Y5Zp7HRA4mnwZvF+nFzt3jRg7YtndWrRLKbXwcMruT1VP+fHo2ztjSSLWvU8FQzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqkS/ygB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqkS/ygB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48436216a98so86805f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023484; x=1788628284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5baizEik9LVqkqVVxQCllEe5i/HuJak1Rsnjhc2TfXw=;
        b=pqkS/ygBjVApmPDR4JvbltlDsCr1C/2N7lImSd/CIdfXiidyz8v5dt6i+lXgw3z3qA
         5I/Zf5MTt+5ZyY4aNTHw+K+FCH92Z7UYGgW3hHWgkMWY9g9CwcgQLYI5/p7DxM6ARdf4
         rvBhxjlZD7YvaQTTnqaeKAPtaTu/KpNbiBHvF7ob5Z8OJ8QIJcIsOOkU0c0VOVBJf57c
         F/mMkaKSEtfdb5nF9RFMAK6w1bHoTnfd8elA+D4RjUiXzT3ZXO9uUxXmkDsce6TW9DDv
         mgMi/dq2EoGUknI7ues1ZfIEqri32Xxe+d1Cn6CuvbVV+cssUO5us0e/WxTUaqBowXvu
         zx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023484; x=1788628284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5baizEik9LVqkqVVxQCllEe5i/HuJak1Rsnjhc2TfXw=;
        b=DEP6rBcpvqJkxiNi2D066G18WEJR9XK4te85jBy/2kyJfwc5MaoHWM3l322PUTnlYx
         i5hHX56tlvjNbaBHBhWfWioqG2rti7P3Ql0LnXxG27sc+JPsfAM1xp/FFdPN6/rs00hu
         nvlWFCKeHo1YkP8jggmogHfib92xlfeYxFVp6Zsnz0kbtkqUZIxyDDgf9dhLZ83aHT5B
         4/EzKKAeWHy8ULrhYDcE11QS8Exo/wBTijHkYIDawDMXinLKABiREjQeGxMc+sY5zVVy
         JljChTwjSAZUq6TNuMlxLxK+2mfCT+FuQNhP//xVVDUHJ1H4zYGA00YMhZhRLAP/Fz+o
         kwTw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3VgVMkHg9JdjL0jGwnew6ihaPnP44NBEU+kkUo9QwO/ZS1fBhdBQe+r+MkK6/ppUo702LHoW0ciiddtM=@vger.kernel.org
X-Gm-Message-State: AFuF++l6fFKpYbJiToiFnZh8is9SqDaIzMZ64Bm70/8Q1/mE5NlMWPRE
	hGtx2WuohmPVbz7rehcPqHyXB580xX6XS2o+khv2VHs9fP2qmtu14uj/
X-Gm-Gg: AR+sD108MrJ+j4VNPC3G+MCWGm6BXursUnD+jsXg67cC4SPo/7mHUYY/evK/Ha2KZ3R
	aEQDTxmVOGj88fFvHZtjGL2LmG5W2iMy7gKZOzfxcpZA+I562PDIM0tK+xskhwwHNmM8fldThK1
	mYPWQpb2K3uvmRT7NqFDo+J/bv5UBiAEtvjL9OJmBTj9jHlfqAvpVo/DCZ2iUOqH6QZ3JcuyDvD
	q9FwCl3RZl6p2ij3gCPsrsao1NqlE94BLQbDtR6dYQNFlEhthysiQYOSdos9beiCyJ+pTnMsTwr
	H6mgX6qY1FpdIsh7QYimpbeNsgDettlA7zuR4on9WhGfo16JYg4NuAaeS6d9cDfvBod8wjsxD8+
	cIojmDCw2IWJElXnDhRWbUrDY6igIoTHLVPOFXCQ4w1FlAXYYzlYbFtzHitXnfH+8p4rcQGG707
	MKRlzmf+sgEFVbjg2jMGifrWKV4U6dltE2rtZ03EuTduUVy41BApIKrTjV218KGc1SXUZM+gxTl
	K4VWzXjjQ==
X-Received: by 2002:a05:600c:8411:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-49b91c279e1mr256215865e9.8.1788023484059;
        Sat, 29 Aug 2026 10:11:24 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4cef:8600:c993:2682:3ff:b27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm154861105e9.11.2026.08.29.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:11:23 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v3 0/2] mm/memory: improve insert_pages() error handling
Date: Sat, 29 Aug 2026 20:11:11 +0300
Message-ID: <cover.1788022178.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve insert_pages() error handling.

The first patch simplifies error handling by initializing the error
status to zero and assigning error codes at their respective failure
sites.

The second patch returns -ENOMEM when walk_to_pmd() fails. A NULL
return from walk_to_pmd() indicates failure to allocate an upper
page-table level, so -ENOMEM is more appropriate than -EFAULT and is
consistent with the subsequent pte_alloc() failure.

Changes in v3:

* drop the walk_to_pmd() rename following review
* use the mm/memory: prefix consistently across the series
* carry review tags from v2
* rebase onto current mm-new

Link: https://lore.kernel.org/r/cover.1785847364.git.thnkslprpt@gmail.com/

Avi Weiss (2):
  mm/memory: simplify error handling in insert_pages()
  mm/memory: return -ENOMEM for page-table allocation failure in
    insert_pages()

 mm/memory.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)


base-commit: d2aad7fdcda7ae8a726926f2d6de7fe9e8ee7563
-- 
2.43.0

