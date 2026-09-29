Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84AC5427E5;
	Tue, 29 Sep 2026 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702231; cv=none; b=ZCcirEFGNZkMzSDfuUoJ3OV1pMHc8Ig3xMtdHzqWONWC5IqcAHVFMyF9BcwAddgdblVyGqgVU9VJAeywC8GOGr4xKFzk1wvhDgYWZR94wZEa7vBqUUlZC3AqzmvseSVUS18TNkzafCqEprYazv7dyDjxZBGF8qgXX4xsSxk0F00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702231; c=relaxed/simple;
	bh=/pHfoKgokia/MdRzHNMrVcLo021G7LgctLnT21f/BYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R3ZMmBxX036blnkwAHxMyYblginm7xEiH6hfTMisSIMq+jANnX02v5w7i9QJ5gehGAz43W+J7mpiIwzaIVSj+uX7VnXES6yem9FLP7qBluzSvkCv8GSGhdG91maKgPi+S6vrGCB2Tk5JNrIEYV9AoxRVHaJE7KSx4gVEeXbpjww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 93e4361ebc2911f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2b340d9d-b854-44b7-b308-5ce70dc73aaa,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:916476fa9f55dfc2dc4ea2b3266bf061,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 93e4361ebc2911f19a56ed5b684f684d-20260930
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 152541326; Wed, 30 Sep 2026 01:16:58 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host with wakeup
Date: Wed, 30 Sep 2026 01:16:53 +0800
Message-Id: <20260929171653.3167156-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Fabricio,

This matches what I'd expect from the PHY behaviour - in peripheral
mode the device disconnects before the glue suspends, so there is no
link left to park in L2, and the unconditional check is just log noise
on every suspend. Restricting it to the host-with-wakeup case that
actually relies on L2 retention looks right.

The untested host path is low risk in a specific way: for host with
wakeup the check runs exactly as before, so the patch only silences
the cases where L2 is not expected. And since the runtime PM paths
pass wakeup unconditionally, host runtime suspend still gets the
check, which seems to be the intended behaviour.

Tested on real hardware in the mode that was noisy - nice.

Reviewed-by: Huang Wei <huangwei@kylinos.cn>

Thanks,
Huang Wei
