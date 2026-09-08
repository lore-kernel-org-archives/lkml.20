Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D98309F09;
	Tue,  8 Sep 2026 03:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788837431; cv=none; b=DWAdNgwnuiAYWEcgjjkyo6k1B2nKaYRiPkLxfgVSk5i+GXixDbq+8tp9Sfv2DSsFwu7uGP+i4P4HpJSdJSJq9k7dyAbbupVF3WbqMsVtQmoRgExwqRvACj88A3iicIx+oT+YYQtZDmdtGY98HOrpEUoCmuoZ/FNsTdGd96rJZn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788837431; c=relaxed/simple;
	bh=VAnsUQQm9HMc3PvDQkZY4r52fQYsGwTdCiT+OzCD7DY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cx29jAvKOkyN2m3glLX+VcxBCS9jEcRUWii6gLt/DL1Y3wY5wI2TIKnbk9S+egsxICKimcmbiKN+/aSN86NI4BmZ5paJbTiS/fOg2BDa26creuicuD/6bmgUEg3/FgggrXblGBJOp5Y202NhmM70Bx3RxTKYVBom0DFlukGsXGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c2197e42ab3311f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8446925c-9cab-4dd6-810c-54d43974159e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:b65983027b9c3d31dda9f774f3ab9263,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2197e42ab3311f19a56ed5b684f684d-20260908
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1724547676; Tue, 08 Sep 2026 11:17:01 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xin Ji <xji@analogixsemi.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: anx7411 - stop the IRQ before destroying the workqueue
Date: Tue,  8 Sep 2026 11:16:56 +0800
Message-Id: <20260908031656.1687932-1-gonglinkai@kylinos.cn>
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

You are right. The threaded handler only queues work, so the
extra workqueue does not buy much.

I will send a v2 that runs the handler body in the threaded IRQ
and drops the workqueue. That also removes the remove() race.

Thanks,
Linkai
