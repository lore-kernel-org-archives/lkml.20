Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABAE2F1FDF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831195; cv=none; b=UIndvqhgw00qJK3rV6731QxGTwtVAOgc94RbB/yCRubfadaGrnVfnI4cb62/cPz5nZb2y5nkhBrCyU+bCxp1rZbhmayq2ESEGEvEnVTs88PVzT8tm1ifz5sNaHTNITdx+kDNxtGg6n7HgpTxM0aVidv2E/tRdl3k+VsHH+cWAWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831195; c=relaxed/simple;
	bh=JBIJeyUF5JPm1xBAG2oWZhraynj8nQuauqje5HNBaf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dnw88qgxXrjD0KA07vrYyoo1dgNaqj+YI57LOXaKP1LdvEsBYSZwBx4QZ2d84IyWTEd+plTkqu9OxRtHM8wbv0UU6dsoHzhWJv/PIJXuSBPUKz8qfobhaFG1kpC4NAmS0Bq5SqK2nGKRSIMaCk37PBNAEnvKROa/3qlB0sVC69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xdm7fR10; arc=none smtp.client-ip=91.218.175.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xdm7fR10"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JBIJeyUF5JPm1xBAG2oWZhraynj8nQuauqje5HNBaf0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787831190; v=1; x=1788435990;
 b=xdm7fR10r57jOvscsWoyHopzQ2wylljneP3Kzur9OjlO7AG6kh6Ed+AFUxT0iuRXZOJFc1vp
 9CTFQr54r9ssqqYrZquOiXk5shGCnwpO1l8QLKq+X8WoxLYxq24IullCAe7bAvR32wsDD6nwPzb
 6nNT/hVF8QQU4t5CHTIp7tgw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c5776862b8f411c9;
	Thu, 27 Aug 2026 11:46:20 +0000
X-Mizu-Trace-ID: c5776862b8f411c9
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
Date: Thu, 27 Aug 2026 19:46:08 +0800
Message-Id: <20260827114608.4342-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260827103435.1371882-1-kas@kernel.org>
References: <20260827103435.1371882-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Aug 27, 2026 at 11:34:35AM +0100, Kiryl Shutsemau (Meta) wrote:
>I have been working on transparent hugepages since 2012, starting with
>the huge zero page and file-backed THP.  A lot of the code that causes
>pain now traces back to me.  It is only fair if I share the review load
>for THP.
>
>Add myself to the reviewer list so get_maintainer.pl puts me on Cc: as
>well.  It is also my commitment to be more active in reviewing this
>code.
>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Welcome back to the THP party, Kiryl! :)

Reviewed-by: Lance Yang <lance.yang@linux.dev>
