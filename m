Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542299;
	b=01yQNrwjyEyANWUe1mBXDywOGUGoRXET37lzaTAOU4vR1uZKVj5ao6e1VpGqkHiqNw1w
	 vRmVTQDbgBFQpIZFez5D5Fb0jNazzmc6eJIsdPPuIbzR39Z4F1xnWKMbhccl12XKIIBe0
	 P5IJVNRMI6+AZjRUV/iY8kMEzFun+HPdq5SY5xY/3h6UPVX1/tmvMuA8VfZor5Nn62wQI
	 1eVK8GzhoHFC83h5Y+zDW7qeLdqqNl6tcrNXUnG78RnGnW1sBze01z91Yzdt5SfnDnq4b
	 XDlmIOkC/U2mYMSasuuABT1douOdcLNous0L+jFX22nCU8Csz/5UpFGmh4S5YBpMkoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542299;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3bh4372hS2kACn6ZvzQmLdLqtWIUlsk51eR2oxOMfCE=;
	b=tMkfiTb/Z+BgPsShne9Xkrs1piR4LylYu7tqMUQGz2Gaw8yNSC7o+KYO1ALfDJK9dvux
	 6Y4FlTq8jSAMpdH6A5eqOEnuC8A2hkeveoygJNun1OYuCB5F2wh5BeFOlZ7rgiTHKN6Wm
	 7By42m9RvybjwgJXPnmcAyvGi3Cig6RdwrF7pv6B7E+Pahm6VJV+YuoTlZpnTjQGD4bcd
	 HmUAQhET2egZrFaEbeK62W45HQbcWWUuTudSdeM/MXz8y1uRO/r/qi43DoAP62sE514w0
	 lIOGfwkP+ME7QDbA+8ZWbWrjOdEizQCw2Jg5FtjaZU9gTe3VKdVJTGvf9KorR/ycZEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Zs2i6Qn8;
	arc=none smtp.remote-ip=95.215.58.206
Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1EA606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D1EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Zs2i6Qn8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Yj3Ch96OSSiVTVr2M7wDl8PeUGqNkknXjeKIRpqUwXI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542296; v=1; x=1794147096;
 b=Zs2i6Qn8YKMyOPGaNdhbAu2b7U0EA/3LcCViZ0RuxYcPDVIGA5UW6VqTu1iv6HTBpTCTSlT6
 GjTz7mDywqSZYwaSpNWW7IRoJg2Mvz52a07DJvY3kfXOMe8mV6Y78BM588PkZkp6OQMjPra/nAT
 jZPTjpOn9xPTnSadfer61qmw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 785229cc940770b9;
	Sun, 01 Nov 2026 14:11:36 +0000
X-Mizu-Trace-ID: 785229cc940770b9
X-Migadu-Flow: FLOW_OUT
Message-ID: <5044b7a0-5eaf-4008-9653-11027b8055b5@linux.dev>
Date: Sun, 1 Nov 2026 14:11:31 +0000
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
Subject: Re: [PATCH v4 06/14] drm/tidss: oldi: Drop unnecessary forward
 declaration
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
 <20261029-beagley-ai-display-v4-6-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-6-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> Nothing needs "struct tidss_oldi" in tidss_oldi.h, so drop the forward
> declaration.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Should this perhaps have a Fixes tag?
Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")


Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

