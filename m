Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950202;
	b=0p5ByMK8Fl09Z1i7vzhfSDHgRT6NrL/D1yx/iThKBa8AkRnn32vzB9/vQD5L2bflZUDR
	 RhRQFNiBmducVYscyII2oUfDXLYiop3cJ1C5Oe75qjdve/YDRoM7CYFOYRm+Zm3nNS9ww
	 EUuMxkJ8ABBmCccq+E8tbqQ1XZxep3TcybrAZGn8zYwaw0a+oeHYr6E9t7o51ubDkq0mF
	 IM7tNW8E3Opw2SFZBz1G1cG0AokjvcnqxRqkLD3BuR2UMJ8q3N69jIFcw0nJ/lQMQaCUI
	 qjpGPQDB0n3iuhV46b+YwF/zneWwuE2Q8bsQpSzwCzekmh9AQvcMiUMlzF0zd4TZVXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950202;
	h=DMARC-Filter:Received:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=mNs5N3ByZcKURXLYgWSCOVl30kJMaOASdt1lItaSz5o=;
	b=a44n5m9aIe1optcwdl0y8db2biIQsdDRzVqCJ0QE8o29gQv8tBdaNKj0W5qmxcxTDAC8
	 j6DEHW2tc4EBdYBckHzgIu9F/rHoGrwwGfBge408hRyfroIiyNycigqCRc05k6iwY7a/Y
	 dNMKni/g/7dEz41rSF008WhMQ94J/yvkl6jIPGhHkOULB7SjYj904bbCBSJVyrTmY4kd8
	 Nz3/akAwazj71YH5iIxPdkUlM0Swjf7YaGUA3FKT8fTMeaXwGyLgyIPL03sW1fIQ46ZjK
	 0Q0e56oZEh0ucmcGakcbi1gznauIvg/bA2DkVAgfRQgXwGW3+RjgtP5CJrb8ZGJoTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A09606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A09606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADX24zjge1qt9tpAA--.4908S2;
	Fri, 06 Nov 2026 15:29:39 +0800 (CST)
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Fix runtime PM leak in
 cdns_dsi_bridge_atomic_pre_enable()
From: Wentao Liang <vulab@iscas.ac.cn>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20260916145427.GA40507@killaraus.ideasonboard.com>
References: <20260916100405.2012604-1-vulab@iscas.ac.cn>
 <20260916145427.GA40507@killaraus.ideasonboard.com>
Date: Fri, 06 Nov 2026 07:21:21 -0000
Message-ID: <179394968139.2115975.2528146030466193368@iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
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
X-CM-TRANSID:rQCowADX24zjge1qt9tpAA--.4908S2
X-Coremail-Antispam: 1UD129KBjvdXoWrJw4UGw15Ar4UtFWfJw1kXwb_yoWxXwc_KF
	4rAF4DXws8Wr1kK3W7Gr13ZFyIga92g34UJ3y0v3W3tFySqFs8Wwn3Jr9xAr17Wa18A3W5
	tw42yFWUJrs8ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbx8YjsxI4VWDJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK
	82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UC38
	nUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIDA2rtTc+7tAAAsR

Hi Laurent,

Sorry for the very late reply, and thanks for the suggestion.

I agree that pm_runtime_resume_and_get() is preferable here.

I also noticed that cdns_dsi_bridge_atomic_post_disable() unconditionally
accesses the controller registers and releases the PHY and runtime PM
reference.  Since the pre-enable callback returns void, the post-disable
callback may still be invoked after a failed runtime resume.

I'll update the patch to use pm_runtime_resume_and_get() and track whether
the runtime PM reference was successfully acquired, so that post-disable
skips cleanup when pre-enable fails.

Thanks,
Wentao

