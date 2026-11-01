Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541033;
	b=4LPerlgbH/PN+HW0W0bHfE36t2z8f9EjrzTlGBpX8bhFyp0mEvYZ2cfQFYrAAjyezTrb
	 FGVzsB0u7b4vzhlmV2Qfi8NxxYbTkO+JPTxDUjIIRS9q/F2ANw4Y9HMBAJel3O2TokJbv
	 7aGr4IY9HCk8o6GoCApBaSJJ/Oz2i9KyJOwwZa97IHb71bsOMWqMuJe7H26XXl6E4sLEw
	 afOpp6wClD5DlSC36twMGUeIntsP8mpXbqLN+Gr0Ax3HA26lVcWJ/02/q4D12VWT2NL7v
	 zoArCfa11Ku5FlMvsTiAyKGi2/4cFDHGk05vfiqixeNxz+S8G6hnbUaS5vhPNVIjRkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541033;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XSCBRN33qQsy8Auxjft+8kvMXuANLfWvZcIctPrMpas=;
	b=noo/YNxE5lHvKlGDaV1BCkwI2yh6KXiSumx3hyrsQCZAaq6yZQeATypt0LWmMNiPF8zk
	 TSxUT7ntuEzDAFIDEhooBs8/TqoQv1HeMClstHoj/JE3LEn7g1LP2ySETsFKo36JcgrpC
	 /VUugegGJA95KFMt0F3Kx/EWgaGzr4NtlhC2ph5/PrIiYztlMB1OHaeN6b7GatigEIQQm
	 tBKr9IsOtHlvAkHikjX84Fb0g5ztJfcLwa7biGqnZw0YPb28CIjWmRJkChfNayk6eKO0V
	 XFfB50eTVfty8ybYqS6zhDXIGL5mWFkgauuJAlGz3zw90fT/ThHjk/opLMSTj2rP97g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Pc24P/jl";
	arc=none smtp.remote-ip=91.218.175.12
Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983A606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C983A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pc24P/jl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H/s3VKQo6Z5fR1WbNIhwJli7PgqADZcHiVAAOisPb3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793541031; v=1; x=1794145831;
 b=Pc24P/jl4DNHuiBNxex6uzO6LR6dk7swpKTlTQ3YsA1IbGEC4hOBltfiDabywVGsnrpyDocA
 DGTrj7snn/tGnKkZeZ3im9eGAXntES97lgg5isCMnFpLhzEhIB5zA6jVkDJ+p0Kwqj0HJLh87Po
 ja6Ok4NL3eaTaU/pDRl/KVNw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 99df9d40205e812e;
	Sun, 01 Nov 2026 13:50:17 +0000
X-Mizu-Trace-ID: 99df9d40205e812e
X-Migadu-Flow: FLOW_OUT
Message-ID: <bec5d30e-4d65-49ce-8445-7f417d1a5060@linux.dev>
Date: Sun, 1 Nov 2026 13:50:11 +0000
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
Subject: Re: [PATCH v4 02/14] drm/tidss: Add helper to identify the AM65x OLDI
 video port
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
 <20261029-beagley-ai-display-v4-2-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-2-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> On AM65x the OLDI TX is modeled as a part of the DSS, not as a separate
> bridge as the newer SoCs do, and is fed by the first video port. To
> handle the AM65x OLDI, we check for it in multiple places using the
> feat's vp_bus_type.
> 
> However, vp_bus_type is problematic concept and should be removed, so
> this commit adds a helper function to check for the AM65x OLDI by
> looking at the DSS subrevision and videoport number.
> 
> No functional change.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

