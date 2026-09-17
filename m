Received: from mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93A631AF2D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625307; cv=none; b=e5RKcsPhQ8/a6GjFbps21PUyg3KWJfCvwiaSKNeYdTTA99KUbZDRlkpka+QRAWYvhnAhnv0SvjmvTZ7xZ0LnSxId5XdGnB6/dn0F0LKtPQYL6NqJCmRkWS4OYokRA3Rw8FHY0hJP6jm4V4QGYzGdF+CPEPXbpyRkOvV5AZDyp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625307; c=relaxed/simple;
	bh=ElFJqSc+70lL1/cQRQceNiS69ssSlpSJfebxt7yM0jk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VX+xlfgO7+LxhZhuYGRTyksRQSDWf5t6Gu72Noopa/o4EEuzUUDMD4pCVddyUFcS4YHyjL4R9qDu7EIF0bS144vxwdswcPOYYDkHCJbhfxM6U9czibfP/vDTLZ0AZ+tXTSWhoxy/oeuvTeU48HpESTVeR/MQmtgxDZzMZrintcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uM1ofARJ; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uM1ofARJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ElFJqSc+70lL1/cQRQceNiS69ssSlpSJfebxt7yM0jk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789625303; v=1; x=1790230103;
 b=uM1ofARJhQpH3pstizTba6PiCYLqihbk5UGbAQudPaISrrlyS4p+uEdHbnApIwEfpskJvNQ2
 1Sub5infXZsXtwY+bdFgYNaoZj7UtcXsksZUjJgZg147h+BIJUWYh6HAHeOtPxS0O0gJURHwqWm
 HlFD8tUYhGnSR15RWZ8b/vhY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3f0bbeab4455297c;
	Thu, 17 Sep 2026 06:08:23 +0000
X-Mizu-Trace-ID: 3f0bbeab4455297c
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 2/2] mm/hugetlb_cgroup: move per-node usage on cgroup
 reparenting
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260916-for-hugetlb-charge-v1-2-70fb708b2e4a@kylinos.cn>
Date: Thu, 17 Sep 2026 14:08:01 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <kees@kernel.org>,
 Colin Ian King <colin.i.king@gmail.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Mina Almasry <almasrymina@google.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <595A571A-C790-4AAA-BA11-F95D44BB063D@linux.dev>
References: <20260916-for-hugetlb-charge-v1-0-70fb708b2e4a@kylinos.cn>
 <20260916-for-hugetlb-charge-v1-2-70fb708b2e4a@kylinos.cn>
To: Hongfu Li <hongfu.li@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 16, 2026, at 16:30, Hongfu Li <hongfu.li@linux.dev> wrote:
> 
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> hugetlb_cgroup_css_offline() hands the folios of a dying cgroup over to
> its parent with hugetlb_cgroup_move_parent(), which moves the page_counter
> charges and the hugetlb_cgroup pointer of the folio but not its per-node
> usage.  The parent's hugetlb.<size>.numa_stat is short by that usage while
> they are charged, and underflows once they are freed, exposing incorrect
> per-node usage values to userspace.
> 
> Move the per-node usage to the parent as well.  The folios keep their node
> here, so only the cgroup which holds the usage changes.
> 
> Fixes: f47761999052 ("hugetlb: add hugetlb.*.numa_stat file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>


