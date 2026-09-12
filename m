Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254EC400DF6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789202855; cv=none; b=JOBsuZMzgZ2/6Jc1sKRlbel4rCcpEjEwNq3+DlreEwP8INKbge2q8qrKahtIEqa7ra9esYkmkxgIh4lT4MiNbrgJ0g5TivgpF1b5g+deqIwckUT3yVF66Eg/aJtSeILiFsocT2kUc3PlAOcDjN0KCWQwfL/IunGdpF6FSKe7hrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789202855; c=relaxed/simple;
	bh=muj/HRuq64yD8eyxGvhrEp19RdiCrjzHDAVXUMs7IHw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=nAALtHH/zLM9eNTktWRuu8BKxmb5fYGHXDSs01xp4UYRQLtnlawz9v9SyPopj3eJF84cCL4Y9ZGSSDCRiqtAKCnSTlj0cotrhFV3tdsk6p9wA501HvazU998mMslKbbg1qfF/qUPoarfKa34NPHl0zayTMwq8kLceRPIX72zU1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KG3bTJy2; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KG3bTJy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:Message-ID:From:To:Subject; bh=muj/HRuq64yD8ey
	xGvhrEp19RdiCrjzHDAVXUMs7IHw=; b=KG3bTJy25PW28Y/vRG1otgkYywi53jg
	Re5lHhiOV48Qww8ToHTOnJt4HWQ8UElDPLgxr2qYeTfd3jYcoal5vtzya6KcopTV
	gJNXRfXoiI0Z/anZV5/PBdIJwp6cClgtv3CRWE+sh//rrOsGbd6VtR6bW5/IH57n
	Ct4sS4YApVtE=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD332xZEaVqwa_uAA--.63502S2;
	Sat, 12 Sep 2026 16:46:18 +0800 (CST)
Date: Sat, 12 Sep 2026 17:46:17 +0900
Message-ID: <173eadcb2d7b18b3f8c57a7c57bd7652.sh_def@163.com>
From: Hui Su <sh_def@163.com>
To: Balbir Singh <balbirs@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Zi Yan <ziy@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/migrate_device: consolidate compound folio handling
In-Reply-To: <1ca189d6-5b36-4d70-9dfc-34316591447a@nvidia.com>
References: <20260912034414.1943342-1-sh_def@163.com> <1ca189d6-5b36-4d70-9dfc-34316591447a@nvidia.com>
X-CM-TRANSID:_____wD332xZEaVqwa_uAA--.63502S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF43ZFW8uFykKFyfXr1DKFg_yoWfGrg_ur
	yktr1UAa1rGr13t3Wayw4rXFZIka10ka4UCw4jqrnxAw1rArW7Gr18XF9Yv3Wkta18tr1a
	kFnYvF4UAw1fAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUaiiDUUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hpevWqlEVpBPQAA3r
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Balbir,

Thanks for the review and the Ack.

> Don't we want to check for *src_pfn == 0?

Yes. I'll avoid setting MIGRATE_PFN_COMPOUND when
migrate_device_pfn_lock() fails.

I don't think we should return 1 immediately when *src_pfn is zero,
though. We should still consume and clear the slots corresponding to the
whole compound folio. Otherwise, the outer loop would advance by only one
entry and the next iteration could treat a tail page of the same folio as
a new source PFN.

So the plan is to keep the folio-sized slot accounting, but only encode
MIGRATE_PFN_COMPOUND when *src_pfn is non-zero, and only do the
unlock/put when the lock succeeded.

> Can we please change this to VM_WARN_ON_ONCE?

Yes, agreed. I'll switch it to VM_WARN_ON_ONCE() and keep the existing
defensive clear-and-stop behavior.

I'll send a v3 with both changes.

Thanks,
Hui

