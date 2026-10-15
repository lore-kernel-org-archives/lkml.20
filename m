Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61E265623
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039018; cv=none; b=nMvhysYdTvZi4wBto8L4YpjZs+BJGOtPbNRFOjCxhan5bjkjj2CieKDZXF5ex5CVS9hj46bUMtis3Dw8oWp3zPnWMu7wTHrLgXKE/pM/m4ucanZ0qmL2gCb13aEO5Zx/BuW7BcsEWm9aAT5LAukhN628JD80Ja94v3cPnR8Gtvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039018; c=relaxed/simple;
	bh=mqgxjox2Ke6PdLi+uDbx/5rC2vwEe3N7bzWbljRvMAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EiPoAtWaorpg9yeJkpCT35F32hMytzx70KJyGBv2fkGSkZvKJbrPLdceEQvv6v/q4D0UcQuY1OuvyoA53Odm/RltOIpLkRL2a8WdZo/4/XPsH5FDRGUtYjCHzcwpZ7C9toccOnNEkDJZ5daIpTI2xiUuutAjHcHYH8HZI4lMSNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g1YK+Aya; arc=none smtp.client-ip=91.218.175.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g1YK+Aya"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mqgxjox2Ke6PdLi+uDbx/5rC2vwEe3N7bzWbljRvMAc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792039014; v=1; x=1792643814;
 b=g1YK+AyaEpn4uXak7c5NuQ+xq3JooAXPNCpEXMjyY7m+S9Hcse0vqci6uHRAjwbIcwZadCee
 lhWIDIbYw9j059wul0urXShqnlsryZu6TpCTTYYRxsesgb5sAa5Dy7CVAJ9Yuy8yADiHW53XYl2
 PqiccwYJpS2tYQBrEaPSKLBA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c19b6154bdd8c5f2;
	Thu, 15 Oct 2026 04:36:53 +0000
X-Mizu-Trace-ID: c19b6154bdd8c5f2
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	jannh@google.com
Subject: Re: [PATCH v5 2/9] mm/khugepaged: count collapses where khugepaged makes them
Date: Thu, 15 Oct 2026 12:36:38 +0800
Message-ID: <20261015043638.57643-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-3-kas@kernel.org>
References: <20261014171145.3292736-3-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:35PM +0100, Kiryl Shutsemau (Meta) wrote:
>collapse_single_pmd() bumps khugepaged_pages_collapsed for its caller, and
>tests cc->is_khugepaged to know whether it should: the counter belongs to
>the daemon, and MADV_COLLAPSE must not touch it.
>
>The daemon sees every result of every collapse it asks for, so it can keep
>its own counter without the shared path testing who called.
>
>Assisted-by: LLM
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
