Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE0496D48
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461352; cv=none; b=gPCbltRdP5GclWxIVoCbt77yqFIp8DPmMy0ll+lIU3eYtmOATDLusl8TD1Cw2t87/wrzSsDmAj2c6Votr7dFi2VjneXWZgJSjLSeKsEztI6k0N58SDgYzF4lXERmhRQ0KGWIqydFvM925EHgFDVka1ACKT+mC2NZKYuEZG6o2dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461352; c=relaxed/simple;
	bh=UxWvBiFLrCuQi9TNkzjtu18nlHcBKoUJpDAjQqN5GgM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VlVu0jO2vxvcfPIW0kUsI3FI4Duuu1hIYxd30sqTIKPyedD9wAV+iRoTzRgvA9TCL7TB62DAZ2mWHdTjknhIKpID3Dijbp8UnU810eBauQ59GMvnk4qxpR/otrKFlkXSJFyLS112+qyGT0vgRbtvw8Ffq/hhTj+mqoJvx8XUpQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WLE7hqkF; arc=none smtp.client-ip=91.218.175.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WLE7hqkF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UxWvBiFLrCuQi9TNkzjtu18nlHcBKoUJpDAjQqN5GgM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789461347; v=1; x=1790066147;
 b=WLE7hqkFT8CS5SvSefyHcNXeI+YjVi/UdWZ0cmTAWGz7wpLiPqSl5L7h6GAQRLSrLQ9iQmWM
 OXqAXdT+iNDx+wXRpLIiPswiHBHdi7+If+iROQ9KWMYaBAyvz4zPBfhKGIRzoFZkvnP/kRlWqUc
 KFS7/nqdJa4oAP2OHksGWZJw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1ae303b1f455d87d;
	Tue, 15 Sep 2026 08:35:47 +0000
X-Mizu-Trace-ID: 1ae303b1f455d87d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] mm/hugetlb: fix misspelled parameter names in comment
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <tencent_034C6FC23D4817C40657E5F17F64E260A009@qq.com>
Date: Tue, 15 Sep 2026 16:35:33 +0800
Cc: linux-mm@kvack.org,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <276F2B46-5BA5-4C54-88E8-3DC75AC179D2@linux.dev>
References: <tencent_034C6FC23D4817C40657E5F17F64E260A009@qq.com>
To: Zhenghui Hao <zhenghui.hao@qq.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 15, 2026, at 16:20, Zhenghui Hao <zhenghui.hao@qq.com> wrote:
> 
> The comment above hugepages_setup() refers to "hugepagsz" and
> "default_hugepagsz", but the parameters parsed by this code are
> "hugepagesz" and "default_hugepagesz".  Fix the spelling and also drop
> the redundant spaces so the comment reads normally.
> 
> No functional change.
> 
> Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>

Thanks. This makes tree-wide searches for these command-line
parameters more reliable.

Acked-by: Muchun Song <muchun.song@linux.dev>

