Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471121;
	b=hILQ+5fI8OMybLzNMJ4gv/bI6jbtT+dmhzmXTALjzZk4KUMEoUCIEapvZNkhFCYBBD+z
	 pHY1UApsM2kaOYLhoVOMCQJ+54Foig1d9yTDxgw3B3PIg+Dk1N890leiWDquPDHrQo140
	 3gQldRoykc807jDSt/pEFoPlEn+NFmvd5TKwUS4tihWTQ/VO9KksHhOUZj1cY9UUZJ28F
	 8FveoxQWZ47Nnf6LyJ2PGAVtFHO6HCZeWq983zjA6H5y6DS9yFc05jr042P3eFrPcKj/j
	 2QUb8KlIXFRdSF2ofeDTp8E6l14kr0xbxixNQ3egEqbMQD1VedlxDraN8bXVM1mQeDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471121;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=McIZmaGpPMOXjPPsjKu9t77cCTo+al4fqqHFl0JVXT8=;
	b=l5CyLUVprhAFwo8OMw+ppZyJcbhZFmvHtxLz0+eSIRiWGSSNM0jZaNG1rI8rsRwDEVxl
	 DxKUq/sBVtMf8nS8UBOfZ3ahmYfEcPO4YSaKJi+ocma7gtldJ/amkqu42NWXOw5zwFXv7
	 ziMn92ceINsoqBROP5IY44cr4r8Xl6/w4WKJ+bWWO4mJWhjLjriASN+jt1whiUms1Wxt4
	 B7OMwkNs7shMty0oeUrPjSJsM5h65x3HITe4AIB+IyELu7VtN4b3JQ8O5UiLorNi85mrL
	 bTKjrac6ReTN39QcKWDyxxznxBncftg+4MQSeewvi+poLBCWEL+NOHPjgNU+Xh/WlTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L9c23g6L;
	arc=none smtp.remote-ip=95.215.58.229
Received: from mta1.migadu.com (out-229.mta1.migadu.com [95.215.58.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E8360A3828
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E8360A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L9c23g6L
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U5IaE73OL1o1Rt6QlRFwjegd0n2omyditaJKMgT0+hU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471117; v=1; x=1795075917;
 b=L9c23g6LXgr8zLXiFjXLJk/VkOplQtTZFX084Yr8orp1ia0+hHEmIvz2iiV3BQv+R9kWN/oX
 rA2lcdpXVaZCZKD69AGFxdPRI5zy+gDaGe/cDf9CI6iedxpx35VQOhgD5XJIQoKFd1gfrR2SaBW
 Rztxl5AmBACLSN4wYuPYLTNo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c156e9d0543595a4;
	Thu, 12 Nov 2026 08:11:57 +0000
X-Mizu-Trace-ID: c156e9d0543595a4
X-Migadu-Flow: FLOW_OUT
Message-ID: <69e3aa67-aa99-4d27-abd7-8faf2d58a3a9@linux.dev>
Date: Thu, 12 Nov 2026 08:56:50 +0100
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
Subject: Re: [PATCH v3 0/2] Update handling of min and max channel in DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 17:24, Charles Keepax wrote:
> The DisCo properties "mipi-sdw-min-channel-number" and
> "mipi-sdw-max-channel-number" are both channel indexes rather than
> counts. Update the kernel code to more accurately reflect this.
> 
> There are a few Qualcomm drivers that likely specify these incorrect,
> min_ch=1, max_ch=X, rather than min_ch=0, max_ch=X-1, however these
> should work fine as the number of supported channels is equivalent.
> If people feel strongly I can send another series to fix those up.
> 
> Changes since v2:
>  - Moved the parsing of min/max channels to only be processed if
>    num_channels is missing
> 
> Changes since v1:
>  - Update wording on min_ch/max_ch comments
> 
> Charles Keepax (2):
>   soundwire: Improve channel min/max comments
>   soundwire: Assume default maximum valid channel if not specified
> 
>  drivers/soundwire/mipi_disco.c | 14 ++++++++------
>  include/linux/soundwire/sdw.h  |  4 ++--
>  2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

