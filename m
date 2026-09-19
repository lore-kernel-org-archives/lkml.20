Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F257331EBE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789779151; cv=none; b=uBY2rua2bZoiPyAIjJvZiIypcC2OSkOpuW9TzKVncitWw7wu8osgJC3iuN9qfh8BndE0p6WIOKnaqi/Oyeo2SvCW50M05o/J09DwgmsrNErpGhQa+XmlUKs1PYFDAfyXfafzMGGMuGltATFsdSceFSZ0PJ5NKXPZDg378U83TCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789779151; c=relaxed/simple;
	bh=kwZ7aOi5ukJ2roaWabIhmB0sWXIH1nbtKkTE3VfmWx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsGPe1XAybtZUPfY99TFZfmWmuG8CYZglHo90EZtOtqVyzj9Bd67bX8PbxyIBsREzyqNeHb6cbmX9kTX335IX5oife27pJZNBH8PlPOKewKIzYxJ1gzyMDOocktSy1n1VBkqQpTbRDhUsjJsIc7ow8XhX53SLI9W/WtudfAO/LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeUIT/4J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeUIT/4J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705A61F000FF;
	Sat, 19 Sep 2026 00:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789779150;
	bh=yocJRt7INhO2SPE/6i4fgtj/1ihi0f5vXImYQPJs+tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jeUIT/4JFcSEPoeuIbj2DApYpMR02vDomhp/WtVEMSTocITkL5yMMY3aFGcjxezv7
	 eC6th4RUAaadB/FhlAu8L9oXOgBMSNwQXQ0/7TqS1xhy22JIh1FDVP3vlVkXZNHeva
	 ppinlv2k0VfgkdY5LZbLyNHTGvnLLNDiQBpoNrJpgZIkveI9W2KFEoL6G3U8mgb9m8
	 s8konpYazp3rpN7UAMtyHkF19/iFvlGYw3ZVFJQMIJJ8PjEoD/CWm8dFkRjUkmmVOI
	 PIKA4oVOB1P+NmYaZ/NfOXba/awbP8r2Vu7v1qXa7drQh0qgSpwFAaHOEqS1t1W8Fv
	 RMzC0mSj67wDg==
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
Subject: Re: [PATCH 3/3] MAINTAINERS: make Gregory a co-maintainer of MEMORY MANAGEMENT - NUMA PLACEMENT
Date: Fri, 18 Sep 2026 17:52:21 -0700
Message-ID: <20260919005222.87342-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918-maintainers-mempolicy-v1-3-9a94cac6d135@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 18:34:26 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> Gregory is extremely familiar with NUMA placement handling and volunteer
> to help co-maintain the numa placement bits. So add him as a
> co-maintainer.

Thank you for volunteering and huge congrats, Gregory!

> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
