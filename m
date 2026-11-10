Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321448;
	b=E7paR+VdIU6r2k0/y47Sp0prM9DxE09DUgv9L/XQhJxUq6m+EMl0XRBKlJ/iSqGY836L
	 DCU5RVHMzMgTAROj27N8W/c8UvsQ8/kF3+FluMTBm01sLFMc17QvrODQ2cOUFXy6hPzqB
	 jcrnftbSoT/xNUzlBjzdUTYQMmEqD3RhDchSRZMmq1cIM7ljwIpD2DlWKiNQnr47294cQ
	 A1hsn9bI7lcLYj/h++ntzkq6bXlcN//HZhjWvYSYeF92kxKcu3jgX50z4zpuggo8V8994
	 ISHZkFPjjuYqEYYEy9BeY7NqJHXKoJu5rleGmM+WYJfnUaVsUwq5PE4Cq141O5EzHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321448;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wwBd3t/fwKegvjYyHJ3qGX8rxto+Nf29p2WhgJO7ZDY=;
	b=TMwxI9c1bp/+azU/e/ltJs3kvnLLQIIFnv7R2lBa3vG77giSfcawxYdejoNEffsuX8yw
	 OsJQNfdgwmoVngcKtt3dMIY/hbZ9UTkjviQfyIxpi3UO3m3dWK0wxjCwkkLvKoClDk3V7
	 Fj5MdYUewd/Dr9iQtqptMdtoDrlkYVxc8kZ0OiRLpeZ1WAfo8KhNG4mW9NBPnu7YZWscM
	 o8/0vAxAU3wmOcKx/0d4I1mob/4LEcOIsMy3bEWDueZVDSe3vDU8d8nAa50rFuLMfZZfN
	 cqrDgi0SmpVeDUXHInkvUzqCUtQmYWOHZ5A3OnpXTJUmpyIUGGbzcaYSPbJjtov4a9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y2JKktDQ;
	arc=none smtp.remote-ip=95.215.58.60
Received: from mta1.migadu.com (out-60.mta1.migadu.com [95.215.58.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6BD606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y2JKktDQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y8URv/BoUUxJeCE3brxsR4XUJe568drCfoXFixTVCkM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794321444; v=1; x=1794926244;
 b=Y2JKktDQV1oQEpeKslmh1KET+OhcOr8AFn0LEf9znE7oN1GxOFy8hfbjOVmJQp+fdrzGPbj4
 V3TqspCmEd+4Gw0QcO2Bdw9jbfQ9WZxS3ZXYcd93A2+mn7xuo2q8AGuoWQYnKy2OrKZLY2I0im2
 sFr/hmBYzz96myOflPAt4+pU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d1f5f6f2264b66ef;
	Tue, 10 Nov 2026 14:37:24 +0000
X-Mizu-Trace-ID: d1f5f6f2264b66ef
X-Migadu-Flow: FLOW_OUT
Message-ID: <105b2b77-7eb6-4b96-821d-51af94a2e21d@linux.dev>
Date: Tue, 10 Nov 2026 15:30:43 +0100
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
Subject: Re: [PATCH v2 2/2] soundwire: Assume default maximum valid channel if
 not specified
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
 <20261110113842.347883-3-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261110113842.347883-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 12:38, Charles Keepax wrote:
> The SoundWire/DisCo specification defines all the supported channel
> properties as optional and states that in the case none are specified
> defaults of min_ch=0 and max_ch=7 should be used. If both properties
> are not present in the DisCo the current code results in min_ch=0
> and max_ch=0. As min_ch and max_ch are both channel indexes, users
> can't discern if they should interpret this as the default case
> (1-8 channels supported) or the DisCo specified a single valid
> channel of 0 (1 channel supported).
> 
> In the case there are no valid supported channel properties populate
> max_ch with 7 as the specification suggests, to avoid the ambiguity.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No changes since v1.
> 
>  drivers/soundwire/mipi_disco.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
> index 259ad98b5b7a9..eadbda55f377f 100644
> --- a/drivers/soundwire/mipi_disco.c
> +++ b/drivers/soundwire/mipi_disco.c
> @@ -284,12 +284,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  				"mipi-sdw-imp-def-dpn-interrupts-supported",
>  				&dpn[i].imp_def_interrupts);
>  
> -		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
> -					 &dpn[i].min_ch);
> -
> -		fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
> -					 &dpn[i].max_ch);
> -
>  		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-number-list");
>  		if (nval > 0) {
>  			dpn[i].num_channels = nval;
> @@ -309,6 +303,14 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  				return ret;
>  		}
>  
> +		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
> +					 &dpn[i].min_ch);
> +
> +		ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
> +					       &dpn[i].max_ch);
> +		if (ret && !dpn[i].num_channels)
> +			dpn[i].max_ch = 7;
> +

this works, maybe with one possible improvement: in theory if
"mipi-sdw-channel-number-list" is defined one can ignore the min/max,
the two approaches with the list or min/max are mutually exclusive.

Something like this:

if (!dpn[i].num_channels) {
	fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
				 &dpn[i].min_ch);
	ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
					       &dpn[i].max_ch);
	if (ret)
		dpn[i].max_ch = 7;
}

>  		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
>  		if (nval > 0) {
>  			dpn[i].num_ch_combinations = nval;

