Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CF3485925
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399036; cv=none; b=ed3JAKcmeS5uCiVGszLObK6hM0EcOF8grQFIjySIYsfePkIgCZoXXvTdOYmDEAnFprQOHAeU8hJpVuMzfLf7dEzGWGjox2vrJ9gzPDJ/HMO9Nu1tBlKA0YFINhMd7zYUi9RrH9WQkooWYetF+rFQeExjmuLDfBURchhsfvSgx1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399036; c=relaxed/simple;
	bh=ZHCQroNngKeckgZXECdRhqBoIG9zlpblU5OFaFkBjoc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B0mMcw325l/cFRq0Lx7clpbHi8nZZsuA+Z8LLkfeLAwqWwPSCVJgzXRIwBBb9k+dRbKnN6gpV2JB7lI3J30R51R6yhRGss7o4Suh8e3XXQpNPtZuFXu3daLHLSZQqR/LUJcNjtg5kzHDlBXCva1UNowrm9Ak+S4cP/xW9vH1rlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 439bde90cb9811f19a56ed5b684f684d-20261019
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:40f6eb13-f796-4f05-8a77-5e38376972e8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:8f3520c8e780fa2c22df261c230c53de,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|123|850|865|898,TC:nil,Content:0|1
	5|50|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 439bde90cb9811f19a56ed5b684f684d-20261019
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 15019227; Mon, 19 Oct 2026 16:37:05 +0800
From: yaolu@kylinos.cn
To: christian.koenig@amd.com
Cc: alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	andrealmeid@igalia.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	yaolu@kylinos.cn
Subject: Re: Re: [PATCH] drm/amdgpu: Fix out-of-bounds write in amdgpu_debugfs_gfxoff_count_read()
Date: Mon, 19 Oct 2026 16:36:58 +0800
Message-Id: <20261019083658.259000-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b6ce551d-b37c-40a7-a2b0-07eae754a156@amd.com>
References: <b6ce551d-b37c-40a7-a2b0-07eae754a156@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So, may I need to make the change? Such as a conversion of all gfxoff handlers
to seq_file text output, following amdgpu_debugfs_test_ib_show() in this file.

Another issue is switching these files from raw u32/u64 to text
changes what existing consumers read.Is this approach acceptable?

Regards,
Lu
>Regards,
>Christian.
>
>>  	}
>>  
>>  	r = result;
