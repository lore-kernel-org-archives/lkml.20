Received: from mta1.migadu.com (out-202.mta1.migadu.com [95.215.58.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA5243A806
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789906862; cv=none; b=iJIGJaMESt1MrNun9hn76ScV8eIxP9xU2iVTZPGnq8n194elNUX/rtqqe8JCoYOqmrqAQl8q8pBMZC4L6CK/0FwX4FPi1+MDKtHnHQhIOJ57z16jfBQ+YDJnqL7iGQCRm3MkciYJRdBpOJc9MTe7bO+fDOWIGCimeuWVKEhL7kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789906862; c=relaxed/simple;
	bh=mOMKVBKBfUL6Eqo1C/LC7lB1eE674NCOqBy+dNKmAd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Av4NHVhTUVIiTyg76lfRD9pllx/NRN1vgXUYKDk35bFXfJZWZ4bBM/Aselsho6ZwgMf/8OXS0yB+TinAuOhFXdz+FBSmPYW3K8pFv5I7Ja0fH3giuYC9YSOQdJV4bJ+rKLDS/XpezM0wNAj9PcqzAvBSWOvHFuiLFFezTJ/UugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oaUD7Rdy; arc=none smtp.client-ip=95.215.58.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oaUD7Rdy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mOMKVBKBfUL6Eqo1C/LC7lB1eE674NCOqBy+dNKmAd0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789906834; v=1; x=1790511634;
 b=oaUD7RdyLK32CNLCjj2ZekgwNiO8e8L/LKzBHb0wLwRSaqG80AM9quK0nQHFYR7p7HKRz/zr
 xR91qp6UoNMJG09XRZJJvpYL5JIkYKHmE5x8ozk/m0BRkxS7ltG/iZSQXFTDqfLxksVLQ0dgClh
 BmhEHL/10+9Fjwp5So1vnTuw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cca487d333b8b0d5;
	Sun, 20 Sep 2026 12:20:34 +0000
X-Mizu-Trace-ID: cca487d333b8b0d5
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	surenb@google.com,
	liam@infradead.org,
	vbabka@kernel.org,
	shakeel.butt@linux.dev,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	mhocko@suse.com,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	jannh@google.com,
	pfalcato@suse.de,
	riel@surriel.com,
	harry@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	youngjun.park@lge.com,
	peterx@redhat.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/vma: const-ify vma_assert_stabilised() and associated functions
Date: Sun, 20 Sep 2026 20:20:27 +0800
Message-ID: <20260920122027.8234-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>
References: <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Sep 17, 2026 at 08:47:41PM +0100, Lorenzo Stoakes (ARM) wrote:
>The vma pointers are not modified in any of these functions so make it
>official by const-ify them.
>
>Propagate this throughout the call stack.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
