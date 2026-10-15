Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960383314C3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039602; cv=none; b=fyVTZG1qhjCyaeIFLQ+TJx8w2PiTQwZy30V/WWLewQrJRnMNiWIjlh2x8Tt6W/IWc91X7HDInzXGxin6WUGkbFmnhoAbnvI37aauLW4YSHemQ2jGZ5iBtSMTd6E1vnLlb61BTEaRDBn0y2cwrh5MiRMmlrv6qxOGXUBy+L6EBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039602; c=relaxed/simple;
	bh=xGmsa/vfdzmgR4inHm+nx01+1+CizJckEWu34ED7NnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SALusBiE3qa+knVmkF2yqt2/XGWQwY5U3BHmRjzSHy8mawDwt7VScK9Vretq1LT/3Bqi+j1EeI3BIw9/LfbYDC+2hG/cYZZqJHf5dG40I8w+mBAbnhFLM+9Jy8r8acyOmY0gcyIWDJ8J80rcwB5X3xEGgrJaMtSPO1zvwZPYIHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XbUFTs++; arc=none smtp.client-ip=91.218.175.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XbUFTs++"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xGmsa/vfdzmgR4inHm+nx01+1+CizJckEWu34ED7NnQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792039598; v=1; x=1792644398;
 b=XbUFTs++ueeUg6Qr4YyvsuNWFU9UoDE/y+8tWuJktBbtSQsMceW7d07DwvG4KHD481EiqNBK
 u3mtSyo3vlnCHsxbuVwfTY1lYbMouffRRfbtUG/ohEldTsNrsCzLlatz1gRV36XZPHjtp1EqVse
 38PcGAIQHdEGwTmjokfBMMiM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0fb9831d6411b311;
	Thu, 15 Oct 2026 04:46:38 +0000
X-Mizu-Trace-ID: 0fb9831d6411b311
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
Subject: Re: [PATCH v5 7/9] mm/collapse: name the per-table scan reset for what it resets
Date: Thu, 15 Oct 2026 12:46:32 +0800
Message-ID: <20261015044632.58880-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-8-kas@kernel.org>
References: <20261014171145.3292736-8-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:40PM +0100, Kiryl Shutsemau (Meta) wrote:
>collapse_control_init_scan() resets what one scan accumulates: the node
>load, the allocation nodemask and the eligible-PTE bitmap.  It runs before
>every PTE table a scan is given, not once per control, so its name points
>at the wrong thing.
>
>Call it collapse_scan_reset().
>
>Preparation for giving a control a real init, run once for a whole series
>of scans.  Two names a word apart would then stand for two different jobs.
>
>No functional change.
>
>Assisted-by: LLM
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
