Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6603F075A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442980; cv=none; b=f7dhBqxzD8lQLO35LGkhaBcmiNx6kRMu3X6Nc1gl/PaCjLqydgLNwtrd2ADoqSF4wepH3YvuDJUOVlTzKiRcrNIWRaK7V39tc+mbUi9i6bFTO2uw3AC+EDDpbrYLS2cX6ANR7BU96w0BfydOZcZ8XPLkXOtCKypQ4gXp1/gCv0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442980; c=relaxed/simple;
	bh=8SRRdOHvGVWlfHYjcNoslgmSDHrKecE+Ub2ys19p5so=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KlvyLcYQuhKLfL41fDEv10JR2QFndF+ND2u6Qap61RxTZ5pFZpdZoOsHzFwlQlt6j9zEXk9R2yKvNtS4wfSi+Nsl6o1Izfll4iwH9qjWjwAdDAaKnNChZcCzoMHMw/6Cwz6RwMyM/q2PBPtrM4qQaFQ7w++CnQFdgzoBCMpx/Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: aac04a3cb0b511f19a56ed5b684f684d-20260915
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:eb3d3894-82e9-443d-91fc-bec10bb22076,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:242077cd59a1502f77935d0990a33437,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aac04a3cb0b511f19a56ed5b684f684d-20260915
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 667585345; Tue, 15 Sep 2026 11:29:32 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: kbusch@kernel.org
Cc: hare@suse.de, hch@lst.de, axboe@kernel.dk, sagi@grimberg.me, kch@nvidia.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: Re: [PATCH v1 0/1] nvme-auth: constant-time DH-HMAC-CHAP response comparison
Date: Tue, 15 Sep 2026 11:30:00 +0800
Message-ID: <reply-nvme-auth-memneq-ping.20260915.liuxixin@kylinos.cn>
In-Reply-To: <cover.nvme-auth-memneq.1781751816.git.liuxixin@kylinos.cn>
References: <cover.nvme-auth-memneq.1781751816.git.liuxixin@kylinos.cn> <0001.nvme-auth-memneq.1781751816.git.liuxixin@kylinos.cn> <20260702141317.GA23046@lst.de> <df336dde-f70b-4ddf-b77d-b9b910d2c10e@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

Hi Keith,

Gentle ping: this v1 still has Reviewed-by from Christoph and Hannes, please apply when you have a chance.

Thanks,
Xixin Liu

