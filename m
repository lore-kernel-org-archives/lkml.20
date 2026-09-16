Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E5C1BD9D0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789533723; cv=none; b=BJ2jx7842t0xlR47au14QxHovpdTtzFe562DKGgnepiQrFh9BSeYuNyCtFPTV7xJU3pCnVmVC7OIRK8cClulkjyjep1VGJr8KSD3GHwZB8k33q1/XkQJVHVU/y5tUBcOb7iEHm8FfjRRLKZI/l+p6mQJb6qRt2UF/4IwsO9xL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789533723; c=relaxed/simple;
	bh=csk+huPoq9Uf1TQgms2r3QUbeMYTjSPHnReXbJBHu7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fGJR7UI/YFgyL2CEVoKLqr2keX1yCO79ISO8h9c0vfYiumThfkL2BIdBCXbCa3Iw5BsnnrcUf1Sh1hjNtHSW834iCdhu+1hh/LmcsA969YM9iXNdv4Qp1jtYr2zgBZ7FVbGUjRI8RwKMqYkkSWo+WoWA988COr97I3nTH/LN9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XFl9vTiM; arc=none smtp.client-ip=91.218.175.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XFl9vTiM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=csk+huPoq9Uf1TQgms2r3QUbeMYTjSPHnReXbJBHu7k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789533718; v=1; x=1790138518;
 b=XFl9vTiM8k380r/49IwlQRxFiBRp+w7Y+TEJpXNnNS9YvYfG9x23rK6m3T19S2etFDj6/xrj
 S3iMeyndPYEiHlMR2un3s4ewiLfrwPGhQhaEsMNRzF0Hipy39MoDqkzaXxlX+Ho4U9kVbF5MI8Q
 +kiLM85QvyTXiwTuZIje8xng=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 52e16c50c9bcfb05;
	Wed, 16 Sep 2026 04:41:48 +0000
X-Mizu-Trace-ID: 52e16c50c9bcfb05
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: lance.yang@linux.dev,
	akpm@linux-foundation.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	surenb@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/huge_memory: fix pgtable withdrawal for huge zero PMDs
Date: Wed, 16 Sep 2026 12:41:42 +0800
Message-Id: <20260916044142.95044-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <83a1287b-8589-4408-96f4-4f78dfca1bc9@kernel.org>
References: <83a1287b-8589-4408-96f4-4f78dfca1bc9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Sep 15, 2026 at 05:13:17PM +0200, David Hildenbrand (Arm) wrote:
[...]
>
>Ok, it's really only DAX and anonymous VMAs that use the huge zero folio. Other
>(module) code would have a hard time using it, as mm_get_huge_zero_folio() is
>not exported to modules.
>
>DAX uses dax_pmd_load_hole()->vmf_insert_folio_pmd()->insert_pmd() where we
>deposit a page table only if arch_needs_pgtable_deposit().
>
>
>So I think the rule is simply:
>
>arch_needs_pgtable_deposit() -> always deposited
>vma_is_anonymous() -> always deposited
>
>?

YES!

>
>The trick is that we don't have anon THPs in non-anon VMAs.
>
>So could this be simplified further or am I missing something?

Ah, cool! I hadn't thought of that :) You're right, anon THPs cannot live
in non-anon VMAs, so pmdval and folio aren't needed here. Will simplify
it as suggested :) and add a comment explaining the rule.

static bool has_deposited_pgtable(struct vm_area_struct *vma)
{
	return arch_needs_pgtable_deposit() || vma_is_anonymous(vma);
}

Cheers, Lance
