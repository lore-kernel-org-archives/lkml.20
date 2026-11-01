Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542032;
	b=lPobcDy9mkDaj5LzjnsQxXVzdywQry2BFB46iEHEdMaJXKmbu+SrFN+ICBh6P4Hh0UyX
	 cxXcYLAla9zdO17+H0xjV3p5YeDC1xIgHnEU2P6Dg/ZRWgtgz6yepyOE89rgU0pUMq3v4
	 PdtLKUz7EKpZQ0dXBrz2WJRJSBbDvpB9mivQh5yw+M0dNd7Vf7wqal7E4WPYb4BFDdiLl
	 NYgvLNzqxGJLwqq0xTu7bESfUhzngDWWzLXW7XU6wnNbu5mxf+HjJ+KXZQyaJsaz8ZDzZ
	 jQFQhCzExJC2+FpUG3/Ci48eUCIRGMtaMCFWxu71H6H5bBZ2/Jnzcg8URTZ/To4djbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542032;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nKvUoZJ6cM4Q3+vdfnWBj8KC+NLhl6GuVHJjIA6JQ0o=;
	b=gECAwV04egw994rOsyzNbda0X/jOstynX82KceE3CWgXX2eCJNXiwvQUHAPm3Fdue36B
	 OQq/NJxLtSO5+mCaEvZC4h+Y3UA+qZqtQkIXB1syMyeNaldOCW8taSGEp5DXJ/0WqnGPn
	 weQbq4y/8XGbgYLDtd+pOU2SDSfc/maCEOp8OBVNenNWBKVnEyGimgKfXrrfBjI1DxbOk
	 OZ0h0VX/H2zB/mA0CEgRbcnuz72Q/rICOAjMGGTp9RuDsK8dlB0krZ7EnrPF+7y6zM51y
	 5xDVCYUghRtta8kjArrg58EwR9RJCdkj3SnjQAWVrsiMk0wfdMkEIrWT+TdnE4GrJ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VEieXkss;
	arc=none smtp.remote-ip=91.218.175.119
Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55032606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55032606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VEieXkss
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hnDwTwzHH35o8706gMWEB6t9gGfKl1uCTO/DK8frRFY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542028; v=1; x=1794146828;
 b=VEieXkssPAfYpr6PQ9tN2RZkcLJ3FyyWKFnGjG5v/V6eYLH2QxYSvsRLgrblyOaiEBXFFw6M
 htqzzv5UijwTqObZZkU93z9MgMmE1rKj6b0Em3hqlc0pMrkBEbPuiIRhA10HoU+Mmtv8FRTaCqg
 4kcOiK2c7w/eQ6wBdGMROTfc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 628719066510015c;
	Sun, 01 Nov 2026 14:07:08 +0000
X-Mizu-Trace-ID: 628719066510015c
X-Migadu-Flow: FLOW_OUT
Message-ID: <2375f4a7-eec6-473f-9795-5ed55c245208@linux.dev>
Date: Sun, 1 Nov 2026 14:07:05 +0000
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
Subject: Re: [PATCH v4 03/14] drm/tidss: Stop using vp_bus_type for directly
 connected panels
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
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-3-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-3-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> When a panel is connected directly to a video port,
> tidss_dispc_modeset_init() sets the encoder and connector types using
> the 'vp_bus_type' feat. DISPC_VP_DPI selects DPI and DISPC_VP_OLDI_AM65X
> selects LVDS. Any other type triggers a WARN and fails the probe.
> 
> vp_bus_type is problematic and is going to be removed. Change
> tidss_dispc_modeset_init() to use dispc_vp_is_am65x_oldi() for detecting
> the OLDI case, and default to DPI.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

