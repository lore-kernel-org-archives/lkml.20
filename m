Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C1401A3B;
	Thu,  3 Sep 2026 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417293; cv=none; b=b/MqXwjmt1tNKFgzH0N0nQU5KEMOGKzyyX6XSVJAS1asnbtlqnbe+d1C6BcknDkkV9im+CcgEtv89YPmCRPBR0Gbe7CvRwZHohljv7EPezrFqjFlRHpovwn4CRos95h7wJdIfhepSgAbHuaKSOzp8Qri+bjfnXHIIL8C6nBblC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417293; c=relaxed/simple;
	bh=6TImZBGHAhdYxVkEDETcezZAisuQ5lp2pbgc2nFxY8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRl0TWkjtCrs5jY1prFcWopHIqMzkUQTcfejku29egZMgdfGwR7VwXVUIZKyvMMXH0jn8KD+S9egyv2B2iJaHDKAmnKvewG1OjM4zx4soZ64DADCVwUajwBsD/s0bFMGHTuNIa9jXhO1QjLZTU5EIgbCNVFPbw0DFYTE210BGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ak5OpSKK; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jOt4ICMi; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ak5OpSKK";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jOt4ICMi"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hb8w44WmqzMlFs;
	Thu, 03 Sep 2026 08:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788417284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lOsGkjx8FvghBalpLXZpmIViiZLM5WeBkF7MIb6oEc=;
	b=Ak5OpSKK5k4V1tz/HiFQOESNJgKKNRs1RV3HbkrzegXSxfWzf9nI+kXAxpD06yhuDOPp+c
	KgpJx1leZiokokw33U2+3DJ314vD+casvlLn7MCBgDM0F09f2NviLRhzQwOXaECWbZyv5X
	i4eW7fD+LBHoXqNlm/+YZbp60ZwVw9o01yKyB7CowR6UNOMztnKAKLl1PC9yuJCPV4o4oy
	Iy2/OJ7z17ZF5fB7HrTrqC3NOqdXCA+ePeteUQlZtdkwp25P3DTqVEbzn80V02gmWioe/+
	6glw+VK5jicbBHz1yS6bmw9QBGfAYUMkLfrsTR+8A3+3WCA5TQxyouhG8+mLxQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788417282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lOsGkjx8FvghBalpLXZpmIViiZLM5WeBkF7MIb6oEc=;
	b=jOt4ICMirwM/HK6EfjtqHzS5IPGeFOgVxnGSKH/rx3Lcn2JmeLCwMwEDFGxenHGKbqMI2m
	xy6Zd23CvZ5wGv/CjiCLPlIwfyHdT7P0YGXlvT1fL9s260gkKDaP9b40OUixTZUBT/td4o
	SH41vlwElopM0yIqB4KZz0uCHs5Z/i81pagzGHZCxwDiZmaz/W+1yuyUtI3Hf8TikhO1u+
	Kl4RPFGaYiSnv3F2UUDx6ZQEt2dlx9mewGlCDpOw5Ai7c0dz2iFomeNMLfnSxXvqXVvXe1
	qVw/olbqN/PXqrjie3dak7dyXYGlvCuooiyRTX3mhvnWLG4cDbzvLaNgdzGUVg==
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: admin-guide: Fix bracket
Date: Thu,  3 Sep 2026 08:32:56 +0200
Message-ID: <20260903063257.711435-2-manuelebnerli@mailbox.org>
In-Reply-To: <2e2333a9-dc4b-49e5-a09a-47fa502e0e22@infradead.org>
References: <2e2333a9-dc4b-49e5-a09a-47fa502e0e22@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: psbz6ihqd7dinhaz4m4x9gy5s6f1pb5q
X-MBO-RS-ID: 9171e99d099856e7f34

Add missing ')' and remove ';'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/sysctl/vm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 5b318d17a..5f4a056e4 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -438,7 +438,7 @@ zone[i]'s protection[j] is calculated by following expression::
     = (total sums of managed_pages from zone[i+1] to zone[j] on the node)
       / lowmem_reserve_ratio[i];
   (i = j):
-     (should not be protected. = 0;
+     (should not be protected. = 0)
   (i > j):
      (not necessary, but looks 0)
 
-- 
2.54.0

