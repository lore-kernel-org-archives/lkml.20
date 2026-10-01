Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E23A48E9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867424; cv=none; b=gn87teCquBHNjTOsQGwC/VXuqMl/vunpXVh7noAxu+1IkYTlpzKsnYQKowgzZNSngprMSedx4H8FfnW6yhiSM5H5qcsxTW6GZbZoOXPjATauOIwXKybS32n/d6rhGuGRuijb5K3ldSsPT/HsuGTBd1hRU3lY3Ze/9wpwUJQAjRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867424; c=relaxed/simple;
	bh=L2y3LjuG7/C5nMxsLJdD+ZkujhPKk48juGG0sm2xrlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qf4AfmZCXJuHWZzY0OZdfQv5kllDKcwOz9z6k3aGKfE6PK0wgm3/B7PmoUPG4O95NLvRdEhDq2OnejW07pPhJJBmOyHopb7s2wtNou5BVEDxPgtE0wuidbW3V1plVtR20/LpqI8FgtWd2/JrXti9KU3AOyfQLdfHQZU9Kb/ku9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mpADEyj8; arc=none smtp.client-ip=91.218.175.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mpADEyj8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L2y3LjuG7/C5nMxsLJdD+ZkujhPKk48juGG0sm2xrlQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790867420; v=1; x=1791472220;
 b=mpADEyj8uQNZVkfjC29GZiKu9JxBNUHoFUXB0DH8b8ZwPIBiiF5EyYwcOAxm6FFVjEZLtNLI
 iBxbtO8Ko1Zs5p1kT5o8XQxp43WKB9YaAXdt4iGdty9D8X/n9blTRcrKf4Mrp0lJmH3CpWnSmA+
 tjuZ1CwRSCiIN8urlLWZzNoo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5f0bdfb081f1dba;
	Thu, 01 Oct 2026 15:10:12 +0000
X-Mizu-Trace-ID: e5f0bdfb081f1dba
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 5/6] mm/sparse-vmemmap: open-code vmemmap_populate_address()
Date: Thu,  1 Oct 2026 23:10:01 +0800
Message-ID: <20261001151001.20393-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260929053231.66085-6-songmuchun@bytedance.com>
References: <20260929053231.66085-6-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Sep 29, 2026 at 01:32:30PM +0800, Muchun Song wrote:
>vmemmap_populate_address() no longer has any callers that need the
>returned PTE.  Its only remaining user, vmemmap_populate_range(), only
>checks whether population succeeded.
>
>Open-code vmemmap_populate_address() directly in
>vmemmap_populate_basepages(), remove the now-redundant range helper,
>and return -ENOMEM directly on failure.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---

Much simpler without the extra wrappers :)

Reviewed-by: Lance Yang <lance.yang@linux.dev>
