Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3405026ED3D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520840; cv=none; b=Xy1OUOKoW7agsLpLLDz4Z5v11RRrl3JqdTYM0E1RYSIl/y3G3GaLpsbWSAzLo3sXv5hXHvWjqc8g+4nuisfa0Hd+LWpTWCpqwgCd4Vu87C/Lxw468Ziq5x2xp6PQg+lTCgfal4P2hSeAewokFoLS0IQB6PpYqyrQkIN45qnZ/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520840; c=relaxed/simple;
	bh=dapO0baKQ7A5fSYLm2jaHeMRSFuP5ubkiQSWlwV9M4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2yVLZboUtYrmYMHn+FAJ33hZqbrPzf5dnqwdCC2NevXh3dQdts1AQqwAJvRBzWEl/toJ8H9s5rRn6lk07LN1HQfd0221EbV0t+jCV2B2XK6MturRESwA1aC1Xv62Erq6300QFK0UKWfZKsPgmVjx/ti7wQ5MrqUKFmqBxKvqX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f07e488eb16a11f19a56ed5b684f684d-20260916
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d24ea6b0-6fb1-46a1-86d1-957573a9d07e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:34f08496e484b9c3311aaf7a7a37961a,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f07e488eb16a11f19a56ed5b684f684d-20260916
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 890354739; Wed, 16 Sep 2026 09:07:08 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: kbusch@kernel.org
Cc: hare@suse.de, hch@lst.de, axboe@kernel.dk, sagi@grimberg.me, kch@nvidia.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: Re: [PATCH v1 0/1] nvme-auth: constant-time DH-HMAC-CHAP response comparison
Date: Wed, 16 Sep 2026 08:50:00 +0800
Message-ID: <reply-nvme-auth-memneq-thanks.20260916.liuxixin@kylinos.cn>
In-Reply-To: <aqmY5qqjghx4DFNM@kbusch-mbp>
References: <cover.nvme-auth-memneq.1781751816.git.liuxixin@kylinos.cn> <reply-nvme-auth-memneq-ping.20260915.liuxixin@kylinos.cn> <aqmY5qqjghx4DFNM@kbusch-mbp>
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

No worries at all, and thanks for applying.

Thanks,
Xixin Liu

