Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735320;
	b=FamUgvLpG97KaHrayr8O0xpUkyADvTdiTnqnxNxXbv6Hu06+R+0lfT12hraDCa5BUePr
	 5qDcUwUwwyUK8G1bsJ8dgcDDyw4nxq0ivgU5kmCwGSB/NAuUFUp9w4DllC7oeb6gUfe+3
	 a0eRo0qBwz8zyPKhIs8VmacLOZnBHMi6OJImNo3i/bbP1Yaz0g8hzyKDhFJUinH8ujj35
	 20THfMIp4F6KdxZpooYt80n4Xzj/A91sWQZSXZiiwtV9Kax1Dk+ge3plxkL1uryidmPMO
	 Bo6GoLAyD+ivY8292uVpQ3BbJ/n0pwIcG/glKl/dWZNxfR2zWG/dBi2bdc1PJqvD4cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735320;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qDht7kUBjwiFuupxpSjoCHWozkHuOwZYWLrUEOZke3Y=;
	b=05Juec9TKEOTxmQV1ywrIW9a3tQnBpD0/6TdaN987zfKbcHQfON1M+YROa5KqUALrBB2
	 SfBfLvB9hQAlFdOpwVg/LPlw1Lhud1g+SQsAu+ZxgMnfPPhXI7BOE1NyOKRvHggdDtDxZ
	 CfsZf4sr+M3+FlmvHHI5sR+pgy6ffMTiBaCfaH5zo2scosQebOEIpwzInWOyegFAbiS9c
	 vPopsIfJT5X+TEz5DPDw2mGsWf8RswTCu35t5IbMXpaOjuSHeJHU77//QC4RAea8mMqF7
	 vg0a/kmnzrCpLcEKVcYwaoTFobqFWfuk5RRa2Bspfv+WKIwYt9WNap15XM/ST1L4tiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Da0lOPL7;
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF13606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF13606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Da0lOPL7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Cs/EvP2YgSGBbFayzDmMjVfLNJJWOpIwZ2LJBIWe214=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793735316; v=1; x=1794340116;
 b=Da0lOPL7y+1EoOnSSPKf7p7REg4b2JIvJNlAO2HcVQW63NbEJ28kHlGJWw6tvaRwSkCBlTdK
 4Cm+Ez0hRLCRnl931x3o5hp88wK++p3BQYzLty53Fr+nY74NXwu0ASv/jsAnIxfi9If6zecpGYA
 V8KGO1cx+uabKb55X82nEQSQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2e169ec5dd3d5b0;
	Tue, 03 Nov 2026 19:48:35 +0000
X-Mizu-Trace-ID: c2e169ec5dd3d5b0
X-Migadu-Flow: FLOW_OUT
Message-ID: <5ad5837a-dd9a-4558-b85f-f8c83da57e48@linux.dev>
Date: Tue, 3 Nov 2026 19:48:32 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/15] drm/tidss: Add support for AM62P display
 subsystem
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
 <20261103-beagley-ai-display-v5-13-f1c8d0e52bb4@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261103-beagley-ai-display-v5-13-f1c8d0e52bb4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03/11/26 11:34, Tomi Valkeinen wrote:
> From: Swamil Jain <s-jain1@ti.com>
> 
> The DSS controller on TI's AM62P SoC features two instances of the TI
> DSS. Each DSS instance supports two video ports, similar to the DSS
> controller found on the TI AM62X SoC. This allows three independent
> video streams to be supported: OLDI, DPI, and DSI.
> 
> Since the DSS instances on AM62P are architecturally similar to those
> on the AM62X DSS controller, the existing dispc_am625_feats
> configuration can be reused for the AM62P DSS support.
> 
> This commit adds the necessary device tree compatibility entry for
> "ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
> thereby enabling DSS support on AM62P devices.
> 
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Seems like b4 did not pick up my R-b tag from the previous version.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

