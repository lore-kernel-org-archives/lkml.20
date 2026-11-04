Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781983;
	b=ygRccwnUIcbygF8IFWgCeilYRD36nXwroYo3qSn1p7X6S0ErybseLaXnSKAK0qvHDRp0
	 IoG5Exxw9H/4KeWOzpp4uIaaWjW3TG/aruEqjfm0UPVrNuPQ1Dm/PLdA+UL6XOyz5Uhcx
	 +XsFkTZmjFoZ5HEpBr1RxnwrkCzGOm5r6KvNcYEQGr1/l2hXH1CHF77XVjGAaeCubbwaw
	 SishuI4Wrmk9+UHQbtygI9LizkH6KkfHPe9mm9cccX64p6lKh5L0gQQxVeEUpfH+hK4rw
	 o43pEtnhM1/UEPiHEiuTeyC90wbCGQwhqX1QVTobQHX2g1aUoDflamfeR1FZjrCvSEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781983;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ubS0Mc1JwuLdPtK1RIzVjUmXMBZ2df+GGrwUK5Rlses=;
	b=rH+yt0sXBfNC/Su9H3RmmZJqbIeZIgx8oiAZzfOfYKh2lqq9ukdH+M8G/fFi0XIP4x/o
	 VtbsAdjq5VNiF+uwRPGDu98H9o8x4bf9A1BKw5IxuOatK+OLj0nIpG00QNHKnwWcUSSod
	 Pctupyqyxfk/QZE1h67RrTF4ad5ZfxDtDQEPimW7LoEIgyObxJ/cY7iT8Ix+xKTAGi2cn
	 EmR6zGsYLF7RN94flHDeGpAAxJe2Smw0IRZA/cZG5nLeSxhG1G4SWZcZA42AVTmaqN2Hs
	 qx1MDL8LlF5GJO0VFHxQLPYPCc6SyZX0dQs2jnFfNxccg5XKrRsa367ncKgFtrJbSNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75072606A32C;
	Wed,  4 Nov 2026 08:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75072606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3196a720d82c11f19a56ed5b684f684d-20261104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:103a28cd-7cdf-4ebc-ad1d-074fc210735a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:ae6ff80dba10cbf38515eda183a1ee71,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|817|850|865|898,TC:nil,Content:-10
	|-8|-5|14|50|99,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3196a720d82c11f19a56ed5b684f684d-20261104
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1301761025; Wed, 04 Nov 2026 16:46:14 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: info: Fix maxsize underflow in snd_info_entry_write()
Date: Wed,  4 Nov 2026 16:46:12 +0800
Message-Id: <20261104084612.2004410-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104061311.1345791-1-songxiebing@kylinos.cn>
References: <20261104061311.1345791-1-songxiebing@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>This was already addressed in Christian's recent patchset.
>https://lore.kernel.org/20261102-work-procfs-bugfixes-v1-9-59422ed3e465@kernel.org
>
>(... and he mentioned that return 0 would lead to endless stdio
>retry, too.)
>
>
>thanks,
>
>Takashi

Thanks for your reply. The above approach is indeed better.

Bob
