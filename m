Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D11632E7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787798760; cv=none; b=o9NlHoMLdBaoKXR71mWqGXYnHYN8AHVIKDwbuEDA3T2pL42XOdNpCvRTZYE2aBsDhkyqv6NHwedPYeXR0Oj+839d1tZPu3wa0Qb8GmOaLiiCKs6kOD1DPoA9PgZrqDRDx/a1nGEzfshW9Vua1bKNyRpt7p+6FRZZC+9hGy0FVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787798760; c=relaxed/simple;
	bh=qUTIO36B7LYdS2pP2Fh1w7yT/UU6sIUL66lGWxG6G5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUvvNpYY3L4cZmbb9a8sjS2JeTtrIBQCWt0keRTRtI82I56uxVQJvMgAL7fwHncaNlNy/ZSN/HjSDY93XUrhquiJESsc113ruSuiVaGVS5CQRdn3HmbOUTabypKSBGeVRk22iO/UWNdLrp9Td8S4PBvH/rjhgbzyv7q5ojfQ5bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6a53b9faa1c111f19a56ed5b684f684d-20260827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9de7c10d-7fa3-4876-97dd-5191811ee0c2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:74741afd7e287d08cbb00f419265b54d,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6a53b9faa1c111f19a56ed5b684f684d-20260827
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 435989249; Thu, 27 Aug 2026 10:45:50 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, hare@suse.de, dwagner@suse.de, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 0/1] nvme-tcp: fix wrong status on deferred digest error
Date: Thu, 27 Aug 2026 09:05:00 +0800
Message-ID: <cover.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.nvme-tcp-req-status.v1.git.liuxixin@kylinos.cn>
References: <cover.nvme-tcp-req-status.v1.git.liuxixin@kylinos.cn>
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

Thanks Hannes for the review on v1.

Changes since v1:
- keep req->status as __le16
- only fix the rsp path: shift left when a deferred host error is stored

Same loopback test as v1, PASS.

Thanks,
Xixin Liu

---

Xixin Liu (1):
  nvme-tcp: fix wrong status on deferred digest error

 drivers/nvme/host/tcp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.53.0

