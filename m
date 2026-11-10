Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299379;
	b=FD/ZTR1XFtuRGsYuHSxDxieyE+bQb8P0XZor+qXMkDSkk9Q1hnrLohDA33Cu388FXxcF
	 OcrkU4Qh8o9knD3zksZu19SsE3gEW6JpEo1dfj3K+P5Bo5V5z2UbLLWkHZ5O3f14wY1Xc
	 13IKkYjAkEZ1I/EIEHNi1nr6OiUlUGXc3AsfkOPVPgQYppBIDuVCWxXz3uybf6Z3djhAS
	 wUkGuADS2/EOGuvPEKAN7R/j+UbqWLg0UX1ZxivsptZTWjZhxIi6MFl5/d6LVEEpV1M6H
	 lTk7hF4A+8C6m3IKGDCiF3v7eUd67GzT4CHBJkC4xV8FQju5BGz1HTYjGoQg0vPtOxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299379;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tirkdGWdTsgezXW4Y/VcOfnawt6KAEbHYQuWL52223c=;
	b=gexCc0tsKD4szyJRzqdktf06xI39AccSci5MzR95+tVS3oXrT8Ie4LxQyN063n2G5R7T
	 WOCKeRIDOJMkPuG7IPEIXWQDUTgUafRYAprjG9JcpCDYEdUSVlQYTLxdgROVRRxzBOhOB
	 lByrugh9mvf3ibO9VMivSlFW0gpuVCcEhf0PNKxvfORhF1+wXcxOwwiAVMGV2l4m2d9CA
	 7XyuEvYDO1zEEWrZxj9Ipne8K6C+6OG6MfxS6xc+iBEIG9Z8gf6QyEs+hYFpspH1QSo1A
	 5gWvbANxHm4x7j9EqsSqiKPXuNnnVLZ+LQilgm4aXGgjWB38gykXsIM7Eim8V+sJuaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mvwsFlqI;
	arc=none smtp.remote-ip=91.218.175.237
Received: from mta0.migadu.com (out-237.mta0.migadu.com [91.218.175.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8EE60A6F4A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8EE60A6F4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mvwsFlqI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=niYzEsywKo6X66sxpMa4+p9kCOB99Q2cXGxQIJQRNYE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794299376; v=1; x=1794904176;
 b=mvwsFlqI3s7xAFCwFGKHzl+NELCnlu0SA5/yNjOVd5C9ouaO51o82lCM9wbef5auChzB8wvL
 2WZEt0lyZqIbgt/pOlljM/MQCR/RKRZtFgCt9m8mc3N+B4V4JiUKaumICGvgGk1Fk9U26ukTRNK
 u0E3GBimHIOYbbRt+TtxZ6DQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a69dc8e0cb53bc1d;
	Tue, 10 Nov 2026 08:29:36 +0000
X-Mizu-Trace-ID: a69dc8e0cb53bc1d
X-Migadu-Flow: FLOW_OUT
Message-ID: <42f25327-cb1e-4e16-a302-b9d367f30087@linux.dev>
Date: Tue, 10 Nov 2026 09:29:00 +0100
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH 1/2] soundwire: Improve channel min/max comments
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20261109173843.4184154-1-ckeepax@opensource.cirrus.com>
 <20261109173843.4184154-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20261109173843.4184154-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 18:38, Charles Keepax wrote:
> Presently, the comments for the minimum and maximum channels are
> misleading. In the SDCA specification these are actually channel
> indexes not a count of the number of channels. So for example
> min_ch=4 and max_ch=5 means that 1 or 2 channels are supported.
> Update the comments associated with the structure to make this
> more clear.

It's the DisCo spec, not SDCA.

The DisCo spec reads:

"
mipi-sdw-min-channel-number : This optional integer Property shall
indicate the minimum Channel Number for this Audio Port, if the
Audio Port uses consecutive inclusive Channel Numbers.
"

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  include/linux/soundwire/sdw.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index f710e5932b4b2..22fb7158bb709 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -289,8 +289,8 @@ struct sdw_dp0_prop {
>   * @ch_prep_timeout: Port-specific timeout value, in milliseconds
>   * @imp_def_interrupts: If set, each bit corresponds to support for
>   * implementation-defined interrupts
> - * @max_ch: Maximum channels supported
> - * @min_ch: Minimum channels supported
> + * @max_ch: Index of the maximum channel supported
> + * @min_ch: Index of the minimum channel supported

that's also ambiguous.

Maybe just use the spec definition "minimum Channel Number of this Audio
Port"

>   * @num_channels: Number of discrete channels supported
>   * @num_ch_combinations: Number of channel combinations supported
>   * @channels: Discrete channels supported

