Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27940928C;
	Wed,  2 Sep 2026 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339953; cv=none; b=oseF7LABMQ6tDCdk8RjFpealk69i3qVEgL5dFMUoSBkVm3uuSCWtZNCjkgsD1aQwlIIQQVXlN06gwZy324GfrFmxxn7Cz952i0Z0FDS4WqffvRGg7R0YKAMyI+UZkRgspzIVwFq7Me28HsWLj7guBU3Ld4mn/RS4FPhhGeIzsRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339953; c=relaxed/simple;
	bh=Y/3d0RoR+izshjp0ZAniIn7rN9BtI0BI45eamSvwAs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M76IR4YF6U57S1XCyjXzLV9Z2bvrr4NYL/8dAaZEY0UoJCLeN1qD214yTL56OQdviTJuyyGXMnDOj+SjJCiU/SHhbzFBmIjaJ3sHCyklRxKHMZBG0GFKqfEUHqkkTyKH0bJc2f05gnahSD5QhIeLL2tpHpx4yzJwcTzXczrT4BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7b9e4bf8a6ad11f19a56ed5b684f684d-20260902
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a2811aaa-aa6a-4d10-948d-24dae99bccaf,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:880dca6e603fce2eef954aa43971a336,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50,ED
	M:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7b9e4bf8a6ad11f19a56ed5b684f684d-20260902
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1717211814; Wed, 02 Sep 2026 17:05:45 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Minas Harutyunyan <hminas@synopsys.com>
Cc: Huang Wei <huangwei@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: debugfs: fix memory leak of hsotg->regset
Date: Wed,  2 Sep 2026 17:05:41 +0800
Message-Id: <20260902090541.2134430-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260807100400.3179625-1-huangwei@kylinos.cn>
References: <20260807100400.3179625-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this one. It's a small debugfs memory leak fix that
mirrors the equivalent dwc3 fix (commit e6bdf8195b4a ("usb: dwc3: fix
memory leak of dwc->regset")). Happy to address any feedback or resend
if needed.

Thanks,
Huang Wei
