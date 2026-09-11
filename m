Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC12138E5C8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105278; cv=none; b=q7KaHvyg7hhFH2FSvAzDb9AFRM5ZvC7CLARgi+/YCIZ9d65hw74lcK/sD4sVrdTM/7hSXlF131wcPA1c+ydR9bDyr0oLzApsEvr3Ya1PnFMGj1dn6P52pzP3loA/klr5oamTlgRDyv+extXst+bcfDx2WcYCEwAm8AxLDsxpvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105278; c=relaxed/simple;
	bh=/831fpL1BijVYX4Nh3eoAAyvWhJ/a1UeM3X/5uaTXzM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References; b=riXG8oNSTnLPcvYzbdX4HXgfQxOEXgX3RonCBtEnA/An6w2RCQ5HWGydqsS7OkoZKADF3MA5sExLhKK1WCi3hS/lWvuZ9BpNWpEKjA/BoJ2kpp4sYKQh0J/JlgjmJbTUqjYW4pS2l9a5VDmU4xzPdGBTpCLGkpQH+m0iYquqL8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=M+d4LBud; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="M+d4LBud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:From:To:Subject:Date; bh=/831fpL1BijVYX4
	Nh3eoAAyvWhJ/a1UeM3X/5uaTXzM=; b=M+d4LBudlflk9/56dGu+07+ITa2RPyJ
	FvCZbZF3sVuU/bfvRs/YRhjoFQK6Q9VOEMu/GfoUm+2+44obcSPgf6XKjAGEfuKo
	4M+Bn7bc2x+ERhzeNYB7u1YYM66K/AiCEamCKbwvEpgOSngWTfxIvctSaIhkDyVR
	u/Vev5IHVqMI=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f2k_lKNqyckLAA--.5439S2;
	Fri, 11 Sep 2026 13:40:15 +0800 (CST)
Message-ID: <c1ef3ed47d2403fbc23a6032ca54a872.sh_def@163.com>
From: Hui Su <sh_def@163.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Balbir Singh <balbirs@nvidia.com>,
	Zhi Wang <ziy@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gourry <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alex Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: Re: [PATCH v2] mm/migrate_device: avoid out-of-bounds writes for compound folios
Date: Fri, 11 Sep 2026 14:40:15 +0900
In-Reply-To: <c99ca53a-73ef-4a0c-8738-eba1cc89bea2@kernel.org>
References: <20260817120758.669807-3-sh_def@163.com>
	<4ead5df7-f000-4087-83e4-13aae036e0b7@kernel.org>
	<apESOAPVzggWmbcJ@gsse-cloud1.jf.intel.com>
	<5ae7a11c-1db4-44cd-bf67-a98cfd5ca08b@kernel.org>
	<20260909112049.3202956-1-sh_def@163.com>
	<c99ca53a-73ef-4a0c-8738-eba1cc89bea2@kernel.org>
X-CM-TRANSID:_____wD3f2k_lKNqyckLAA--.5439S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr1UGryDurykur4rZw18Krg_yoWfWFXEvr
	yvgw1Dt3yF9ay7ta17Kr4agFZ7ur48A3yFyryDWwnavryrJan7trWvv3Z5JF15urZ5Arya
	gwn0yFyj9w129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjaii7UUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQC4GGqjlEAQwAAA3s
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, Sep 09, 2026 at 03:43:03PM +0200, David Hildenbrand (Arm) wrote:
> Yes, and please clean up the code in any case; the duplication should be avoided.

Hi David, Matthew,

I reran the original HMM migrate_anon_huge_zero reproducer on current
mainline.

The private-device case passes, and I could not reproduce the original
KASAN out-of-bounds write. I also instrumented the truncated
compound-folio case, and that condition was not hit. The coherent-device
case was skipped on this setup.

So for the follow-up cleanup, I don't plan to add a Fixes tag or Cc
stable. It only consolidates the duplicated compound-folio handling,
uses memset() for the tail entries, and adds WARN_ON_ONCE() for the
caller invariant discussed here.

The original stable Cc was based on the KASAN OOB I observed on the tree
I tested at the time.

I'll send the cleanup as a separate patch.

Thanks,
Hui

