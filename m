Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F1357CEA;
	Tue,  8 Sep 2026 06:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847370; cv=none; b=FjbwzJpniBn5Mh95KFgMwz/GqYH5/7m7lezlkEJMoVlJe5zdRuC9opCz4fJqf4gm1zKtN8ZqQ/UDfZTFT53hZeFdbJlWDpLV/TZxH0F0KUTNXIdmU7kor4BgzQ0I6l8orElLZNW7W5hyClbpTTdPsP78cWrXRWQNCubJxtoVTRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847370; c=relaxed/simple;
	bh=6CDJ9bwh7Vpw2FEdcuAObM/GsJcBJeBBegBh054Ybgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Thw5cyKR8gfvcmRszS6vBL147fC9TOh2zS6Y57OYW4WJjaPYZYw4I7xdRw1Q9g0o5DKe47x0wQdEV1Z/w1EhlGxv9Rlmsu8fTW6CZ/cHaAc0VviRBPISdUDOspRhjXBN7Mx+zEc+CO86E6EGtmgeZTV45vvXk8j80ev/iyvMnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e6a1bc7cab4a11f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4d439ecc-d3aa-473d-adc6-14021b72d6f5,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:ff6910edd007dd1fa2fd1fc0a0adcd56,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e6a1bc7cab4a11f19a56ed5b684f684d-20260908
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 229542650; Tue, 08 Sep 2026 14:02:41 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xin Ji <xji@analogixsemi.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: anx7411 - stop the IRQ before destroying the workqueue
Date: Tue,  8 Sep 2026 14:02:36 +0800
Message-Id: <20260908060236.4082658-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ap6Xr5X64V6evYjz@black.igk.intel.com>
References: <20260903082254.1540271-1-gonglinkai@kylinos.cn> <ap6Xr5X64V6evYjz@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 12:53:35PM +0200, Heikki Krogerus wrote:
> Is the workqueu necessary at all? It's threaded irq.

Sorry, I spoke too soon. You are right that the workqueue looks
redundant, but I will keep this patch to the remove() race only.
I can drop the workqueue in a separate follow-up if you prefer.

Thanks,
Linkai
