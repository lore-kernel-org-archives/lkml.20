Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DACA492520
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861403; cv=none; b=qlJ8MDFRKGTf+kZ2+LKZwXCaYACYyqA0vlRWJfY3wfss6xHaXrJe0OqQHkrqkTDlDG0yohz/FX7VpoD4kc0ebqSX6vUT0rx10TeXUXrMYhpu19vE/PHJhVNUCR/gQu/vV2pv4NoZTPAS8LCeGF9wDYHfrTSxIoK5lqVGaqvmaXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861403; c=relaxed/simple;
	bh=AArGw4NjSUphCjKBCyX2H8MS5/BS/00cSe0pJ8BVlO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gz2MWVQ6hkJsc57m2i8mVRvmT2lHsNCwpmFGxwLtiZ0UUYlSSSOB3oNd4dKttW4GYBoQwkEK2QLq05O/D09TBmZaWlpt9zrxTuOoc6fmb8LQ+AyXOYHPUeOSgUSVA9i9yDpMEgHUn9HeHOAdBUqrbJkgsW1F15kp4KcPgxhRr9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 921928feab6b11f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4716adfa-6f8e-4ef5-8821-d7ce7aaad837,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:0f4028235c6ff823b644fee21e638421,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|850|865|898,TC:nil,Content:0|15|50
	|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 921928feab6b11f19a56ed5b684f684d-20260908
X-User: liuqiqi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuqiqi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 990608029; Tue, 08 Sep 2026 17:56:32 +0800
From: Qiqi Liu <liuqiqi@kylinos.cn>
To: Gregory Price <gourry@gourry.net>
Cc: Qiqi Liu <liuqiqi@kylinos.cn>,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: page_alloc: add trace_mm_page_alloc to bulk allocation path
Date: Tue,  8 Sep 2026 17:56:26 +0800
Message-Id: <20260908095626.339906-1-liuqiqi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ap7Pbm70m0pw_NqM@gourry-fedora-PF4VCD3F>
References: <20260907120949.418450-1-liuqiqi@kylinos.cn> <ap7Pbm70m0pw_NqM@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 10:53:19AM -0400, Gregory Price wrote:
> Sashiko asked whether we're also missing kmsan hook here as well:
> 
> 	kmsan_alloc_page(page, 0, gfp);
> 
> Might be worth a quick look and just adding both in one go.
> 
> ~Gregory

Hi Gregory,

Thanks for the suggestion and for taking the time to review this patch.

I've added both trace_mm_page_alloc() and kmsan_alloc_page() in v3 to
ensure the bulk path matches the standard allocation path.

Best regards,
Qiqi Liu
