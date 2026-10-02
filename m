Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC7515985
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965629; cv=none; b=DOvctNKaPr3RQf5g/8oqLWmNQlEjiHEZfItwS3treCXUAGd9jJ6vGxNijTZ/NLLEdKA1LXRzvk6WRIY65aUQw6cc7xa8yzMMSG3iWLrVL3o2+al5ZYw/dZU+APICVpMc2L8HTx1QC/TCbDpxCJRQnhkuaWK2bLNgMTZZLldNEaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965629; c=relaxed/simple;
	bh=1Olu1dQBVIbIUTXxqLxM92LY0Kjo3SCVgMNA0zEtigk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jG/hCW1v3c2LRRNlzGQm3AakW7lkZbFx59JP+MFNEJvP5O95xddIT7hMm0WmVpQ5iOZbe2KNbdDkHNyXLmINxgMEQq8/sCXXtxU4lL5XIehqAv2ENX5pkDjle9CQOPMW+rQX1satiPRuV5MnCPxJjIMHx1NfXUhXbRq2Yh/lR40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZK3P4kR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZK3P4kR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA911F00899;
	Fri,  2 Oct 2026 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790965628;
	bh=Hda13G5Ybj8yN9SXCRDlGBYWThd/Le9MyrEXHdOVh44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AZK3P4kRbM5feSDOYlhd54nv6YrAjROV/v2bXeT3QhGsOIaaJGaQ3bdYoLtTYID3h
	 HYOowB2CkCPO9Ed/XR9+4J8eogfrIYV1ekxmGmno216pKINNrxarEKmnhGkuA4NnUw
	 deURUZuHhuiuYoJpa4Th2n8W9SHvHJAW1lha34DawsFN9dY6VLrCKhPpYoBjYj8xkU
	 aqFUVPDHBmFHzp0FE3OvejaWNOA/GFRI0R6KpKl5vFq3pEorV9QmU7Ij0dO2mbQ405
	 yObpkY/wymhkXVF/vyii0DrM8fhgw8uupmdQbzhddolyvoRVgDG0eCopg5+tuqqU2a
	 ZOywZ6tTvmrDg==
From: SJ Park <sj@kernel.org>
To: Enze Li <lienze@kylinos.cn>
Cc: SJ Park <sj@kernel.org>,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/hugetlb_cgroup: add trailing #endif comment for include guard
Date: Fri,  2 Oct 2026 11:27:03 -0700
Message-ID: <20261002182703.40171-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001123747.634845-2-lienze@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  1 Oct 2026 20:37:47 +0800 Enze Li <lienze@kylinos.cn> wrote:

> The final #endif that closes the _LINUX_HUGETLB_CGROUP_H include guard
> is left without a comment.  Add the macro name to the comment for
> consistency and easier navigation.

Makes sense to me.

> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
