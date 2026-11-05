Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908187;
	b=maec6xNR1nRmFpNBangr5KUJ+EjvnDxowlCg5fHNKVTyC7+5z640uVuASJ5I2BweZ/C8
	 CaKeohRbuxt8KxU0lieuzsrmCbhvCwbYEqYv2IUbKshFXEsa/uI1oFnL7B5U2n8QP42vA
	 DQyo8YjRYPfqx/URsxMVnA32Zb2HBSMPGP8ArveKTnvVjOzv8dpwbh3dv0nYIc/zeDyvb
	 W1AFdS4oWUb1M7HFlgRGDRXsqoJS8i2cy76Eq6oXPn/5Q8nxuMrJfpKVqkF8jIdFg3dCg
	 I7pUypNNLOIIwZfR4pStg/fZGYbh+91UCcazV5SoRAP95KQvi3F3ngYdFtzcbhY3dGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908187;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qScYQxrMhDNOEAGF/9rBfbZWicHpQDMbkGzOg5+rxBU=;
	b=kEMCfQ8ILvsCRTHkiAVOyA6zEdQ+nL23ddQvGXwK2eZeL6hl8LnI7Lu2L6YB1xC6Hbow
	 ixHbspdQaveSMYNvBUl04shIwldbGK+bZ3NSAaK5nXpKTBgVuRv3r3GYwz0xICXkPFGdI
	 WZ3hrVF1gBaYQh5hH1j0hp6zdfyy158Ul0LDACdYhXBExodX5Ju3cGK/JaNFGCJpa6bm6
	 5it/kYmxId6ijW3/oJ8TiUJ6UFOPO1SF5QcOudAtnyIJEcaZuP/KMSBkC0Vqqz1Pibfhd
	 MAQanpi9RHyJq7WqH2tewORTklVr0qmqczQSAlrVZzfwYWz2oNnjk4Cit9hTgMtHvAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qemT7U8e;
	arc=none smtp.remote-ip=91.218.175.32
Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3618C60772AC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3618C60772AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qemT7U8e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hllPb5qZ3MwACXrit8oyaRfVECBhdjxwmlbhGw/GJz4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793908184; v=1; x=1794512984;
 b=qemT7U8e/A/UCeZLneIPHTKmmFbWKXrkGzDdmXqSOk3qEsEYf2aCA/apehPcDL7L1fdnstnm
 9+eiKUGZ4gpRIfKWrmZejTVV+xMZaEXLID7MsPZgxfoHI/SoOV3wYCWKa2AXJTC1lQWfXdRmz8Q
 hgrjvsO63w2NTGz8YtoiJ4dM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d639df3448ef7c08;
	Thu, 05 Nov 2026 19:49:43 +0000
X-Mizu-Trace-ID: d639df3448ef7c08
X-Migadu-Flow: FLOW_OUT
Message-ID: <1cae1b17-4c49-4a10-922e-c552e90593c4@linux.dev>
Date: Thu, 5 Nov 2026 20:49:43 +0100
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
Subject: Re: [PATCH 2/2] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
 <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
> +			  struct snd_pcm_substream *substream,
> +			  unsigned int *word_mask, unsigned int *ch_mask)
> +{
> +	struct sdw_dpn_prop *prop;
> +	unsigned int nprop;
> +	int i, j;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		prop = sdw->prop.sink_dpn_prop;
> +		nprop = hweight32(sdw->prop.sink_ports);
> +	} else {
> +		prop = sdw->prop.src_dpn_prop;
> +		nprop = hweight32(sdw->prop.source_ports);
> +	}

The definition of those DisCo properties was done with separate masks
for source and sinks, but it's allowed to have the same bit set for
source and sink if the port supports bi-directional transfers.

I don't think it impacts the way the constraints are added, since you
use substream->stream direction to disambiguate, but I thought I'd ask
the question.

> -	if (entity->type != SDCA_ENTITY_TYPE_IT)
> -		return 0;
> +	/* FIXME: Currently only a single unshared port is supported */

I must admit I have no idea how we'd handle ports that can be connected
to multiple terminals. It's allowed in the spec, even between Functions
which are then no longer independent, and I was told it was due to
hardware restrictions, but still I hope we never have to deal with this...


