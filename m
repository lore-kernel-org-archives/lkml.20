Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682AE3672A0;
	Wed,  2 Sep 2026 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336629; cv=none; b=K9cfl+gp45UZrNIchyBdlVJ0bVZOOmIX8HPCrqoqUlR7r0VTj1TkL3wrYXBkX1M4+I34lMa/WJ2xz+1bNx7gMahNBfbBloF0MBXt9O1vQqNv/lOJKfEtjvvV0VyTwMLMJstMuzuSkSYW2qp9rVX0PPgY+talaiWv7rs6ngJ/syE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336629; c=relaxed/simple;
	bh=85GJjrWSlZsyKK0/S4LocZfdf+hRQq1pFWavnBABlqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jcaa8EwuT2OT4W51n4dhybcQvwFVTjp/nInWcQmG9JBEHnse1vYTijMEZB3tgATZSipJdWzg0uGx59aSrd9OomIfXiJ8yNGy5vr2AZXli/8bnPjOggwCpG5dx5HCDmh8plgVOwAIocV/7LyWldjf+HFL8HCvElHMQ2j5mTUTxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QS9JrRs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QS9JrRs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B297F1F000E9;
	Wed,  2 Sep 2026 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336628;
	bh=SeqDurGMv4fqw4TES+Ik13n+LgZ66K1BaegvU4ulnMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QS9JrRs7bGqV0qx1W1un5XzrqKncru7qKvNcVKXWc2pY3ZfQXF3tMeeZaSTrqpYSs
	 3TqR7FQBfp6RXpmwyw59LWtV+QUogwxgE5rY3A25MFFD674lTgVMOxfabtOJNg1sSE
	 0Ed755WVp/u5fzxuHEWyJp8NWkbOmOMS4syBg+imAk0bxTvAtLP9tB/cAusP+P3l9K
	 BUfYTTm0IQCDqlY/vTmK71zLeKV1dT9/L5tJY7HBiVvx3TCnnmrrc/i/yp+Rxu18S8
	 tgcXXJphOLO1IfFAwJR/XViZSI3hJZm/lItBVVeJycyBkawAHp9SOW07SdJu7q7dIx
	 i6VsTOfnWIwOQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 02 Sep 2026 11:10:12 +0300
Subject: [PATCH v2 2/2] MAINTAINERS: add memory related docs in core-mm/ to
 MM - MISC section
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-docs-memalloc-guide-v2-2-218c1a4dcb80@kernel.org>
References: <20260902-docs-memalloc-guide-v2-0-218c1a4dcb80@kernel.org>
In-Reply-To: <20260902-docs-memalloc-guide-v2-0-218c1a4dcb80@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 SJ Park <sj@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.17-dev

Previous efforts to make sure that mm files are properly listed in
MAINTAINERS missed

Documentation/core-api/mm-api.rst
Documentation/core-api/memory-allocation.rst

Add them to "MEMORY MANAGEMENT - MISC"

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: SJ Park <sj@kernel.org>
Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..707f93320ad72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17275,6 +17275,8 @@ F:	Documentation/ABI/testing/sysfs-kernel-mm-cma
 F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
 F:	Documentation/ABI/testing/sysfs-kernel-mm-numa
 F:	Documentation/admin-guide/mm/
+F:	Documentation/core-api/memory-allocation.rst
+F:	Documentation/core-api/mm-api.rst
 F:	Documentation/mm/
 F:	drivers/char/mem.c
 F:	include/linux/cma.h

-- 
2.53.0

