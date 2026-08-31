Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB4A353A7E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141606; cv=none; b=EYeXoibK4KprHpHEFT7+cPNze0lK1kfmwxeAGyC7Zb3wgjjmRLWb5v+ZXWBQaIY5uhzhpGUadkp9P2WZVHHbHwatIe1jEsO+K6g2bx6AL3qx/bfcN+QCKifjKX4Of7hsHWCVOJ7e6YEJJVAZuqo5rGXMcCDJ+w1hqE9f4jl3aO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141606; c=relaxed/simple;
	bh=oVY0T3JwyXT/6dVyL7LmwAP/+4eMrFjE9+JxXuFzXSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aTHJ0+Btuc3ecvx5IiRLwAVLKNzZjVcvu+jm7vOSFamAOFCovbrOo/H/PknWXokE3XSSFZxY3QzqzRBDoa5Ot2uEhKbE8ARK+knSD853zvbBNtGSgf/P+qkfYRK7iG8Bif0lGKAK2IhsQs5tMk69u42aTi24Y3UlU65m9Yqmz5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ab4075aea4df11f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3e89e118-3949-48f1-b183-cb3f0859ae69,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:4c411dc073f26930cd612200696fd570,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab4075aea4df11f19a56ed5b684f684d-20260831
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 769739705; Mon, 31 Aug 2026 09:59:58 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: sagi@grimberg.me
Cc: axboe@kernel.dk, dwagner@suse.de, hare@suse.de, hch@lst.de, kbusch@kernel.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, liuxixin@kylinos.cn
Subject: Re: [PATCH v2 1/1] nvme-tcp: fix wrong status on deferred digest error
Date: Mon, 31 Aug 2026 10:15:00 +0800
Message-ID: <reply-sagi.nvme-tcp-req-status.v3.20260831.liuxixin@kylinos.cn>
In-Reply-To: <9ded840a-d7c0-408d-a3a4-2729e26e15e9@grimberg.me>
References: <cover.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn> <1.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn> <9ded840a-d7c0-408d-a3a4-2729e26e15e9@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

Hi Sagi,

Thanks for the review. v3 follows your suggestion: host status on the rsp
path, complete through nvme_tcp_end_request with cqe->result. I will send
v3 shortly.

Thanks,
Xixin Liu

