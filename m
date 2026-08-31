Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB32F4AA1E5;
	Mon, 31 Aug 2026 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189197; cv=none; b=dJw26blwxkOSZO7WKyvQ/KyXkHKSvFBPw1O1wWr8edX6vVVZ8WXDNP4k9kZWaOhpOqL2Vak5tKM7gPjlQfFN3PtuPPRFodul2w3S+d7C8ntU4aPInSo06bfESR9bzaCeT6dPt0zxncKKalzg1WdFJkhkrmp1gYdmgFawarbvy2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189197; c=relaxed/simple;
	bh=cuXSOiUb45PYDPQsK83K7QK/zD/SV/sP/u7c4aoyzcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cH41IAXkutkpkUxsWAy0wkJ6EVvkXKZzrnWMRhW4BYOjfcbrCy34mms3KFtBlT+1+Sp1LJ9u8AM0ErcJfCq7jJOWhfA0nM5CUn7Prp7JXoQ32dz4RZVgOopMXicTWeU2h8dzEo7lxdpOxQAZ63hVuhNo4fbEh4UJU4LZob0WgEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AO8IaFX+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AO8IaFX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8E01F000E9;
	Mon, 31 Aug 2026 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788189196;
	bh=1HtfgGFiEBh3+uueg+DAhyzc6ww3KykW+NDvD+nmBWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AO8IaFX+fTD8vDibWVcdOTpG/5DKRXt0IQmtsbiW1CW7xMY36T1FTddiuClFkD2oB
	 58pc8VeSe/KUscbFWUfGA44h89AJ1vNZZuRHYVosvMoELCX6/i+oQygeKryG+hjm1c
	 zDJqLZAfZPqipV5aKzd5hOzooY8fI4PQ8q3bA5UkyHFtRG++JEpXvCoFDIVLImqNL9
	 NaA26YjgLsjG/PRQEr0UzoGb8tNvqcQ6AbNenF7vmSBqOcL+9s9lYIXoM929V1VC7e
	 UhSymhLRtsAmOWFbAnEF8LMwQoFq2P8R2lS94RKnVOCiVdQ4WrHRapASlNyE1Xo+pe
	 7X/eXQ2BYnJ5Q==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Mon, 31 Aug 2026 18:13:02 +0300
Subject: [PATCH 2/2] MAINTAINERS: add memory related docs in core-mm/ to MM
 - MISC section
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-docs-memalloc-guide-v1-2-547718c274c1@kernel.org>
References: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org>
In-Reply-To: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.17-dev

Previous efforts to make sure that mm files are properly listed in
MAINTAINERS missed

Documentation/admin-guide/mm/
Documentation/core-api/memory-allocation.rst

Add them to "MEMORY MANAGEMENT - MISC"

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

