Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87BE3EFFD1;
	Thu,  3 Sep 2026 06:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417906; cv=none; b=gdVwWMQObQtLHIvM6lP1fSqBMwn4k7Ch8SSqUQH2dcjFmXlYCE6LyLmmkEpliVIsUSKTk7iDWIBds86ompc+MxG2Q/2h7MsqOBuddkRUN3j1QTB0qUBTcGWKyueJUUUMOx8WWy0JjsJU/nIoVq+IUJih1JwSNkic7LAnrTPMCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417906; c=relaxed/simple;
	bh=DrF3jvrVM6IOupsbsQh1LJr9Yw6vuZDqhSj2bF72WME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjA5zFDdbRbzHxrUk0QTG1e/jF2FjcbQD9i7zFrXrVqT3QMZCS2ZCYM317QFxYQmFOqeMCazxqCTcUFcD6Kd3NHLVMErjxJ11Q9xi5lEo/W7wzqW3ekyO8inGnWjbhmYTzva8ag+uziZ/wm4gowV2DBup0FqfvlYZDmXW/T+MHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f7172b3ca76211f19a56ed5b684f684d-20260903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:94c12622-973b-473b-8cf6-e397eded272a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:627dc1d0ff5cd5c6053f3d3a7eb0218b,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f7172b3ca76211f19a56ed5b684f684d-20260903
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 681169013; Thu, 03 Sep 2026 14:44:51 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huang Wei <huangwei@kylinos.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: debugfs: fix memory leak of hsotg->regset
Date: Thu,  3 Sep 2026 14:44:49 +0800
Message-Id: <20260903064449.3359239-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026090200-mothproof-snowplow-f443@gregkh>
References: <20260807100400.3179625-1-huangwei@kylinos.cn> <20260902090541.2134430-1-huangwei@kylinos.cn> <2026090200-mothproof-snowplow-f443@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks — no rush on my patch, understood. I'll start helping review
others on the list.

Best regards,
Huang Wei
