Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42933E0C4A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907241; cv=none; b=rZ0E/8jn8reoWUeQ+6DJWMiX7eUfjap02iN8EHtwPTyn+Hrww5CAdIAs3E4AO3/ADSdTQ/d6RfAc3GMBvE8TbfPxs7f4k5tyIkiXkb9bfeIYQRukyW1Ten7sK50x54KSlcYaS0twbuADIjw/q2chk/RjrzHNZToInwBINE9uvRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907241; c=relaxed/simple;
	bh=3SHrYiXrqoDN9FrxmtWulJL32fKDNnhM5OnISyolSxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atuYh/bBiZ9SiNTCEKOTaOQQDWcGy8EvmZJCLMdeLTFnFeliR4JgXtcXLnVdhyFZEsXGAqH95z81QNBmAX4r9O3/bXvz10UXEkUGHwjn5EvIAenY3LMBvlD01fD8nx/QVJ6NkncmPteBo+lZbz3z0YYfyHLdfh9700ySKEoGys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JOOvlXwC; arc=none smtp.client-ip=95.215.58.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JOOvlXwC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3SHrYiXrqoDN9FrxmtWulJL32fKDNnhM5OnISyolSxE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789907213; v=1; x=1790512013;
 b=JOOvlXwCgXh/KNhdk0mhTJMTNMnQGsjkZyQNKdllcagszAknoOc+vSttQTsDIApCJ1plq0CV
 hBiRAseTFGoPylyPk0qnJBelUWq19A33wh3U8UJvBAqau17FikuKepNI/3CyIpOD8toVnWj4giD
 kcPkHUuexPOEw4o1XePlyGFQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 31352f99dc44c0b4;
	Sun, 20 Sep 2026 12:26:52 +0000
X-Mizu-Trace-ID: 31352f99dc44c0b4
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
Subject: Re: [PATCH v3 3/3] mm: update comments to refer to anon rmap rather than anon_vma
Date: Sun, 20 Sep 2026 20:26:42 +0800
Message-ID: <20260920122642.8387-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260917-vma-is-faulted-v3-3-5c22314a72e7@kernel.org>
References: <20260917-vma-is-faulted-v3-3-5c22314a72e7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Sep 17, 2026 at 08:47:43PM +0100, Lorenzo Stoakes (ARM) wrote:
>Now that vma_has_anon_rmap() abstracts whether a VMA has an anonymous
>reverse mapping, remove references to anon_vma and instead reference the
>anon rmap.
>
>The anon_vma is an implementation detail and should be treated as such.
>
>Do not update mm/rmap.c which implements the anon_vma mechanism as it is
>reasonable to directly reference it there.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

Nice work!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
