Received: from mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A7B54707B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791178110; cv=none; b=bRgW/QTUssFmzJvnSnAasK7IlbDbfqGX5Cub4MRFzur4K+JqXspumMD0C5hhTOTlzfEF14guMSSLm7nQeHM0hGVmng5LjXKMz6cwyT1u1TRei2XOUAf3lMt5k1O1F5KK0taBsZbov2tl/lFcQXy9FYDgKTiTkN6EjuGKqEg5cC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791178110; c=relaxed/simple;
	bh=yv2ydgbE99zjgLs891Kb2Etny/Z8MADPirm+ePJIz/8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=k6DMK1yxc/H7j8tyFnwbd8QO+o/GqjC0fsC0S0F1NPMwt6Gcobd/xId8T8K/VIEyDxfbHzfH7vVr4Ol1IJvig7n8RLQg0KtfC9otqRJ1xXJQLpBXVtbIM5Q7NgBhgKClxhNxH37g28RdZ2QhHOI+T4oPsbC6Bu3bp7PwNb3O+WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qhxLdF5N; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qhxLdF5N"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yv2ydgbE99zjgLs891Kb2Etny/Z8MADPirm+ePJIz/8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791178106; v=1; x=1791782906;
 b=qhxLdF5NYuwcYaBkPpgMJ/IxMdhG8av3kckH6MRMTTFUiFwmfHygFqvAhLRHxXTJrj8tSiah
 Vt6XgrTeAEfHOtdus3xCd351ny1Yltq8uEI/AREoymPOYkdoPgWPm1g87AjVNDQ1ns4P+3IUhT1
 /jpkOgDuYQtC1IoYLtCVyuEo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id af17c5ddab4b483b;
	Mon, 05 Oct 2026 05:28:26 +0000
X-Mizu-Trace-ID: af17c5ddab4b483b
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/2] MAINTAINERS: cover all hugetlb headers under
 HUGETLB SUBSYSTEM
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003060029.2152489-1-lienze@kylinos.cn>
Date: Mon, 5 Oct 2026 07:28:14 +0200
Cc: osalvador@suse.de,
 david@kernel.org,
 akpm@linux-foundation.org,
 sj@kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 enze.li@gmx.com,
 Joe Perches <joe@perches.com>
Content-Transfer-Encoding: 7bit
Message-Id: <051798AB-A30D-4EF3-8B7D-DC235177BA00@linux.dev>
References: <20261003060029.2152489-1-lienze@kylinos.cn>
To: Enze Li <lienze@kylinos.cn>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 3, 2026, at 08:00, Enze Li <lienze@kylinos.cn> wrote:
> 
> The HUGETLB SUBSYSTEM F: entries list include/linux/hugetlb.h
> explicitly, but other hugetlb headers are not covered, so
> get_maintainer.pl does not attribute them to the hugetlb maintainers.
> 
> Enumerating headers by hand is also fragile: any header not listed (such
> as hugetlb_cgroup.h) falls outside the subsystem.  Joe Perches suggested
> using a glob F: entry, which covers all current and future hugetlb
> headers in one line and avoids the gap.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Enze Li <lienze@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

