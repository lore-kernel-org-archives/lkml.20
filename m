Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261326;
	b=Z3wwb1bDHU/CVT3U6SZKR1MXwwFluaEav/ulB/RU+lbSzNhq8UnxIei18cVLkGZZSwqD
	 IFhqKobs6jeM08J/DfK83BAqX7GytXygKT3C4y3hXjqOIAKJQmXX1lC+HGkElHgpmf7XU
	 H667keSCziJKxcCXOYjXaV7GLQQDVzCxOnSP54tgVkl1d+UudEt1avoOV81CsOagUqtP5
	 NF+vDv4ZD3LOpTpzrDQFNRb/wnJ3euwj+yxI/SFmWhKuac1OEtPCBnixW0ZPA50rnP0Kl
	 C2slDn2tZkryDT5ztYtZzK6foQHnRGPZWsEmhGqV57YWmuH7Sp73nSVPZZ59C6OojlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261326;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uMmXqKOWSDerKoZDexLe6ZA5akl0CdWFfN+grIqz/hM=;
	b=Tzeh1NNSiOSyyvvDOCWOMFRr918RN/+8GIFk3WeZw6/DHBsKimUP/adIAeN0akHdEyMH
	 NATP/QPumJzLbdoBJi+Gn7wa+56OlIftfCvQuL+iWtbzxI44C303CDwOLPvBmQ9RM8n0E
	 RLQROkYIzFOez8nLIcaP1xrdimNYLUS3/VL32isKYlJpJhHlQCCiGUMQY+XnGVHAI4orx
	 EVi6dW5rGCjxHusrtMrrVtD62lAJQV1GPQjcHwttXntZYHueMBReqgKgZV3+CoMg2qOtt
	 QAl2UIjWGitFse3+6kQ4vWDwnO/mfoHYLiBB4vbGeekUJG+fcMzRJ+Dfj4jml9jbgyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R4OCV9hK;
	arc=none smtp.remote-ip=91.218.175.124
Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R4OCV9hK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V2VelVUxdDMx4cPW1WDf+FAp9sAH8Gz07xIdBowp3g0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793261318; v=1; x=1793866118;
 b=R4OCV9hK32Yk1I9oOsFFlaCA6BIunQiDmokZ69V73MATNWepOumw8LgUXFYNxL6dEKopp2w0
 FRFABRNBRK56nBKoLHi/O+d8Q4pgFzBRdXtyfSyNA1OUPbxIRuhQ0cW21mr99sspVlHKZO3WNRV
 5ystsx6E4PdIU4CmT2k4mamU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a828defffc5abe13;
	Thu, 29 Oct 2026 08:08:38 +0000
X-Mizu-Trace-ID: a828defffc5abe13
X-Migadu-Flow: FLOW_OUT
Message-ID: <529b2b8a-fc6b-435e-a7ac-e73bf4eec729@linux.dev>
Date: Thu, 29 Oct 2026 09:07:23 +0100
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
Subject: Re: [PATCH v3 02/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI
 link support
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
 <20261023065216.3473883-3-Vijendar.Mukunda@amd.com>
 <f4a337e6-9ba4-4f52-be99-95d0d5ba11ff@linux.dev>
 <a5771999-6521-4d02-868a-5cf5b75b6848@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <a5771999-6521-4d02-868a-5cf5b75b6848@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/29/26 05:56, Mukunda,Vijendar wrote:
> On 26/10/26 02:41, Pierre-Louis Bossart wrote:
>> It'd be useful to comment/explain why this routine only relies on a
>> subset of IDS...
> On ACP7x, each SoundWire data port has a dedicated DMA channel mapped
> in hardware. This function selects only the ports required by the
> currently supported ACP7x machine topologies:
> 
>   AUDIO0_TX (0)  - headset/jack playback
>   AUDIO4_TX (4)  - amplifier/speaker playback
>   AUDIO0_RX (11) - headset/jack capture
>   AUDIO4_RX (15) - amplifier/speaker capture (feedback)
>   AUDIO5_RX (16) - DMIC capture
> 
> The remaining port IDs are defined for completeness to represent the
> hardware data port layout, but are not used by the currently supported
> machine topologies.
> 
> The ID numbering differs from ACP70 due to the hardware differences
> between ACP70 and ACP7x. ACP7x uses a flat ID space, with TX ports
> numbered 0-10 and RX ports numbered 11-21.
> 
> Will add comments above the define block and the function to clarify
> this in the next version.
sounds good, thank you.
