Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF8355F5F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141647; cv=none; b=cl3K8BK3gbgLHacIHjXcNzuyS8fzXaka43/7TY0S4JxIQcQORg0wAjttpZB7Q2FYmjhhFdVfANuQWNxQbQmJnd4U0xM+wrUCYmS2+EjCprgRNxg0LCdNuj9g95SWI84wVWugnvikrMuPrX1Hd27LEB5GGzAbd0p9swPtm9+NneE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141647; c=relaxed/simple;
	bh=pD76rt82CjyPus8i9hN71JbKlHm7zdth0gNnCtL2yRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i3lKYM2dJlnBua/Vi96J2RXflf+rcPFaCA23Ef8j3S6tkyXiTHzm0uGDQAJVi70BXe6j5TuFAGX6BapNyfXAtbK7MRbuNMXbTBktAlLEsM4N2Nk8UILEPrmmldT8wvZbQFRstTO08BbWI+QoRCydpAYdNwsayRJWQ6crhI5xM8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c32c935aa4df11f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cec65129-6aa7-4c59-b818-887b5da86960,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:5a3e02a46bb50c0d64848fe73b044f0c,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c32c935aa4df11f19a56ed5b684f684d-20260831
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 758275693; Mon, 31 Aug 2026 10:00:38 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, hare@suse.de, dwagner@suse.de, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v3 0/1] nvme-tcp: fix wrong status on deferred digest error
Date: Mon, 31 Aug 2026 10:05:00 +0800
Message-ID: <cover.nvme-tcp-req-status.v3.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
References: <cover.nvme-tcp-req-status.v1.git.liuxixin@kylinos.cn> <cover.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

Hi,

Thanks for the review on v2.

Changes since v2:
- complete the rsp path through nvme_tcp_end_request with host status

Thanks,
Xixin Liu

---

Xixin Liu (1):
  nvme-tcp: fix wrong status on deferred digest error

 drivers/nvme/host/tcp.c | 36 ++++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

-- 
2.53.0

