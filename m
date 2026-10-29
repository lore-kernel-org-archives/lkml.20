Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282875;
	b=On8gvqbh1elfYHRAb0zpEUGedtALJ6mtWBSYiL0gjiyVaail6r3HIGXbMZEjHpABS46L
	 dfn04PjJ9EQpirIgxPcejJ/rM2/LR3BZBAwPeEBS/M2O18roq/qVad5kzgZAo646p5sRu
	 lwWP/xWYlappe+e3UvPUO/l22MtvSxZaphMoFBSmgpT+5oL1eCDnXDn5qqc0KuAraiWXQ
	 WHhJzb71wm6++gDofZH504r8fgPiMGTrJNI3MEPBJ/Smh0rVVbkBbJMl2HO/dxXyf2gJs
	 TkLWaYPZSueoXNM/W9DupIduP0+M8a57PwOwbJydoCk547h5b8Ds0EPKp1jUxvKEW+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282875;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=szVDTVMoBrzo+8gOA/eu3lrdUwW+vlQh8WYKufnmZdE=;
	b=EDCFKY5wtccR1vPc+G7yYCYUHUopx//Iyj9xocHtZLQ4we9XaDCf9IdX6YlhLkAdV88Q
	 lFdtXHPuGqI0Idl/bYy1LKXSR98Dvvpn8nNvzR4NGoIJI3c5SOClXfuJgjoNiyPEC6Pyl
	 MN4of0AANomGVmRswmDnyd5GnfoMYh95k3LHtJM+2MqLGy8j2gzVawiCfEIveYNtdRIMO
	 T1pf3HVZHbqrYleGmd1ol/bQqpPzH2vGtsYuEfrhVkt0BP13LNGYSHlZMcfLLmGzbt7iO
	 wztFFLg65rd1NSqGv7WlMteCmDKbM1gEIFVtrr7Msv1p7KNd8zgniHhrdKvkvHJWfMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="ZZ6/50eP";
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DFA6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZZ6/50eP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=szVDTVMoBrzo+8gOA/eu3lrdUwW+vlQh8WYKufnmZdE=;
	b=ZZ6/50eP6t1GsTidDd9rm4HpNhHivlubiJOa08tlsVDyYr5RidshMBymjo3uiH
	RZw+K7bMON/Ht98f8ij+6zXfsuynNMsphiB8tjnCbx62cqWmXGFmbBLAdxFjo/19
	lbvoT9Rj69CEN9Vx9t6GpREiYSXrfm6edTOqhFzlWhoKw=
From: linfordWu <linfordwu@163.com>
To: Johan Hovold <johan@kernel.org>
Cc: elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix loopback Kconfig help
Date: Thu, 29 Oct 2026 22:06:58 +0800
Message-ID: <179328281884.1789021.4493185936400503751.linfordWu@163.com>
In-Reply-To: <auC2LiV6564Z1zFg@hovoldconsulting.com>
References: <20261027142258.1720002-1-linfordwu@163.com>
 <auC2LiV6564Z1zFg@hovoldconsulting.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:QCgvCgAXPo4CU+NqX9goCw--.34937S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUUv38UUUUU
X-CM-SenderInfo: xolqw0pugz3qqrwthudrp/xtbC8gNoCGrjUwP70gAA3h

Hi Johan,

I found the incorrect help text while reviewing the Greybus Kconfig
entries and prepared the fix with assistance from an LLM. I should have
caught the earlier patch during my pre-submission search.

Thanks for pointing it out, and sorry for the noise. Please disregard
this patch.

Best regards,
linfordWu

