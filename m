Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A561322A1F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789779054; cv=none; b=hFGo64NAU4Kw1dmmsq6h4uuLFkpWEZOvS2teacWggKTTAJR1VirStPepD2KGvqcMksowu0DS19MwKo7YfX7yakODYhhfCr4sSjfjjLqCSQynbD+0/IFj4LwAcmF/PINSO6pXptuij0W3F8r7FiqCPJKjjLvmmGgUTNFT1qQ47H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789779054; c=relaxed/simple;
	bh=Y4xg4EWs6TC0dejQIBsxK+mBitSOm4PAPm6bmuK4se0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8o/Ak+1/1bmdo1pv93I9x8OZ4ZEeTVIIf1TVWAMx3JaArGH29F1y0bTBku3SfH/nXRb71wA+AJ1KDU7cCa0fb3HnHU40NV/sqX4M+PhnooX39TNJef150WpB0KQ0RU7qttXonDUmsdqiidHBwbXcPMsgOJGAfnnNuZks4AVXTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWiegJOT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWiegJOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DE61F000FF;
	Sat, 19 Sep 2026 00:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789779044;
	bh=b1tw2IOdATgIAgeOtOU6aYsEKazCC4468v0MK6zfWn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OWiegJOT1477KjdFWhk3YWWOb8Ji4XwOajTwo+QzhXmIeDeigdMcClxq8G7x4Z2Oc
	 rzKQTSyW0MOe2pDyHt1AotVNoYDH9Mzy1Bex5xwq5xb+Zx0z0b/MFvQAvMdyyOYDy9
	 D+bnKsVZxc8Ytl9ZuAUxlxHbWYPrtoVfbUY9uQI8eHCbeQN/MRJSmXhnVQQ5GgiPb2
	 VgG9W2qD//8bh0MfSJ8dSmReZaQnCEHGfsGxKzxQSlCNfRg2n73EPplJLIpSQuCE6Z
	 rQAEI8jNCb3zIiRgkoK1Yv4mmDwEXHxn5bfHY6hov+wysyw7XcQzM2M2V57O5PK30j
	 C5HqY5aFpZkCA==
From: SJ Park <sj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 2/3] MAINTAINERS: move memory tiering under MEMORY MANAGEMENT - NUMA PLACEMENT
Date: Fri, 18 Sep 2026 17:50:36 -0700
Message-ID: <20260919005036.87201-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918-maintainers-mempolicy-v1-2-9a94cac6d135@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 18:34:25 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> NUMA PLACEMENT is a better place for memory tiering.

I agree that's a good placement :)

> 
> My best guess is that existing MISC reviewers are not that interested in
> memory tiering, so don't carry any over.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-byt: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
