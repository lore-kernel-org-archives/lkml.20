Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C144908AD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431615; cv=none; b=ByL2MPBX7INCTVJ6sb187GeWLKr2A/BfXdlSO+NkgJNhKqHpIFIp8pVHMJll2t2887D2WfKz58VpbX6ZJVyKh3QvMwVWeeHz78A8nNPpaemkaaJO8FfhqcsaA+3lOblLH9FN0xWdOdFjEQpeiP0ygh9zeWbHYVNT/Vd1n6w2RII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431615; c=relaxed/simple;
	bh=Gzpf1OJ3Rg0tl/VwErP7akFjhIt41l87hgHFrPCCF7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D6dWDT1WpDhOKj/jh5VPh9jIEBbJiySeHOuWIyCzXD+blZu90nLfdiJ/Q3GrObKbjEkXUzH+IwP5imoFFWO+Jcsmf+y+UPVncaPc9akiqAoQ78kcxJG+l/Iln7ea8zemyHibX25VnRGGltDMi0A7x77lFV1VVDHqqdZhbIC70VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: de4f0758a78211f19a56ed5b684f684d-20260903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8894f43c-2d59-48e3-9529-0f9be7bbfd96,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:a7b6a4cc6a1ce0a7371aea852b224a30,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: de4f0758a78211f19a56ed5b684f684d-20260903
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 418386978; Thu, 03 Sep 2026 18:33:14 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: maz@kernel.org
Cc: 13667453960@163.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	radu@rendec.net,
	tglx@kernel.org,
	yijiangshan@kylinos.cn
Subject: Re: Re: [PATCH] irqchip/gic-v5: Install root IRQ handler last in gicv5_init_common()
Date: Thu,  3 Sep 2026 18:33:11 +0800
Message-Id: <20260903103311.580671-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87fqzrmywu.wl-maz@kernel.org>
References: <87fqzrmywu.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 16:54:41 +0100, Marc Zyngier wrote:
> I don't think that's a massive problem. If you can't enable the IRS,
> you can't do much at all. Your system is already completely dead.

Fair enough, I'll drop the Fixes tag and reword the commit log.

> Under which circumstance can this fail? There should be none. So if
> this ever returns an error, we should immediately stop with a panic.
> No need to clean anything up, just die on the spot.

OK, v2 will panic() on failure and drop the out_handle label along
with the no-op set_handle_irq(NULL).

Thanks for the review.

Jiangshan
