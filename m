Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8766360EF9;
	Thu, 10 Sep 2026 01:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002830; cv=none; b=HcZiZsN1cZlJ1U1sPaSuzx6+Tjs9QzRVHDqPOMhgDoCSEe2YwzSP8vYHp8ja7pid7SxpC8b5iErcTezW44yR2WaldBT1i2wK9u2WzgQujtxak2bBIUsVjkRuS+9N3o0xhcdsFW/8yV7D8T/1NL9hw1HHw9wfmqRBS0bypmnYnKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002830; c=relaxed/simple;
	bh=BM1bDryVxArz7zWpHXmFGYY/4aFVoqAMbC/YF/M13a0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qbzk2XqjPMqPsDoPrk+4nIsShjM6Z4kr8A9XvyoeaDjpmo5BG1RLuranVKuRS1VvOvRQP/48um6pJxQEpq8STe6apTLooethS3oMmI20TX4gIiHa/CfB2sX9Bn6Om2wEPjDcUHaCKpwMzQuUx2LCsEud73esBC38hfe5y4GRTpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d6bbc558acb411f19a56ed5b684f684d-20260910
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:160eb880-997d-4160-91d4-32f9a8bdf3b0,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:98ce87efc9072afb8358ed02141a9184,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6bbc558acb411f19a56ed5b684f684d-20260910
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1321048547; Thu, 10 Sep 2026 09:13:32 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xin Ji <xji@analogixsemi.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: Re: [PATCH v2] usb: typec: anx7411 - stop the IRQ before destroying the workqueue
Date: Thu, 10 Sep 2026 09:13:29 +0800
Message-Id: <20260910011329.2990767-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aqFr0gC4b3mn1pbP@black.igk.intel.com>
References: <20260903082254.1540271-1-gonglinkai@kylinos.cn> <20260908060333.4097219-1-gonglinkai@kylinos.cn> <aqFr0gC4b3mn1pbP@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 09, 2026 at 04:23:14PM +0200, Heikki Krogerus wrote:
> Not for stable?

Yes, it should go to stable. The race has been there since the driver
was added. I will send a v3 with Cc: stable.

> I don't see any difference compared to v1?

Correct, the code is the same as v1. After your question about the
workqueue I only wanted to say I am keeping this minimal remove()
fix for now; I should have replied without posting an identical
patch. Sorry for the noise.

Thanks,
Linkai
