Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869AB19DF62
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039274; cv=none; b=tMe+T9rPdixA3nQqzyyLC+Xh9UaA6fJTR+Kzv+wBkxu9w5PzynrcrDsjQP944YgVjQ35f0ixCY4nGcKcY1aZMCmir7OJniSt65DeKi/p05WjTySx2cKtGR68UzRpCzrbviWBlwW97v2Yh8bVz6pDl9Ei+RBAKnTHkHL51a4xLDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039274; c=relaxed/simple;
	bh=De6T00S6SFjuGflCzumt+OiPmeOo2NzkgabFnl2bQHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lN4MCuHjhwkyL0L2ZrTseAFE/TrrKs8cAfY1GSfwFJn1Y/wcfoWL7rwNq1Qgu2R5brB9ZCUJ6AlkdIC85MnC/yLDjpZSndI4OkfzuF6792kAk5/i3EEc7qCpbZo5e7EYQBgSzOQ5LjURUdYkitppqKkt7zTF7+3ObbpOrQCkXMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BwTQQyZX; arc=none smtp.client-ip=95.215.58.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BwTQQyZX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=De6T00S6SFjuGflCzumt+OiPmeOo2NzkgabFnl2bQHU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792039270; v=1; x=1792644070;
 b=BwTQQyZXZ8RQp0gWPWl52UyG+lD9ACYJ/lJm8mKEuKlvqXhyYjUSVySjANZi8awPEWi8wcM5
 fG0alXIzusjaOFAFk0BRrIprmLRAvCvxVQfN+6ik9NWvYVjhkYuWYIb7xk6X68LMFZ0tV9Rxap2
 It3uel6dIOo80G71HO2rhkWA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 786eab450f251e7c;
	Thu, 15 Oct 2026 04:41:10 +0000
X-Mizu-Trace-ID: 786eab450f251e7c
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
Subject: Re: [PATCH v5 4/9] mm/collapse: add collapse.h for the collapse interface
Date: Thu, 15 Oct 2026 12:41:03 +0800
Message-ID: <20261015044103.58141-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-5-kas@kernel.org>
References: <20261014171145.3292736-5-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:37PM +0100, Kiryl Shutsemau (Meta) wrote:
>khugepaged.c holds both the users of collapse and the machinery that
>performs it.  The daemon's scan loop, the sysfs tunables, MADV_COLLAPSE's
>entry point and the collapse itself all sit in one file and reach into
>each other freely.  Nothing marks where a user ends and the engine
>begins.
>
>Start drawing that line.
>
>Add mm/collapse.h for what the two sides have to agree on:
>
>  - enum scan_result - what the engine hands back;
>  - struct collapse_control - the state a request carries.
>
>And two constants move with them:
>
>  - KHUGEPAGED_MAX_PTES_LIMIT -> COLLAPSE_MAX_PTES_LIMIT;
>  - KHUGEPAGED_MIN_MTHP_ORDER -> COLLAPSE_MIN_MTHP_ORDER.
>
>Neither is a fact about the daemon, so both lose the KHUGEPAGED_ prefix.
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
