Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793209;
	b=gpP2eWmlbpa5I0ySNe1HjlQu3vXCoRt8z87fRmj2ArkFfmUcq2C2XqQX4aAq7qSwCc0P
	 WqAC0l/eAciDzBkRYwcf0hEV1Uq+yKUSgLN1zEQH80vfbsnaLbq7mq57giRNIeo79FV8V
	 9dimV11P6X2Tgds2au0l2s/uwjgMfFf+r29MNxJbVjE26QDgjGLTTEQWN4Fb64dfPDrE7
	 Pq2i1X2WmRXYfr+BExcI6xiY7Q1koeMzt8qH2XsqxJTIRJ1KravjwQWEXWC/cSF8B1VIX
	 eMtduAqhBh+RHrnpUtBhMkZS+tlIO8k+vo9nSdn8WVwG0YpiqFR/HIcTX02pPaeFFvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793209;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=y+NYpw7VcamMXqZ0sP+WVZVi54+wDw6fM6nEwwrB8Hc=;
	b=FvkkeEiEpYi4uMKxuKBVf0CKynHlZKA8Q14yPDkDG+prpmt6jIxt6mW218uNjCktwgvC
	 V69+Vu74/oi8a/531/Kau5oJuSbUtkSjQmp0FvuoRJPQ0VRcGmmISGpVwicBG+rth6yiG
	 93FmsLFFxehwAmsD6mBr6Brssaazs5tFnW+5Gj1oDhorb8mA6tE+5vOVsKPxA4pq3KyVM
	 WXFZZ5zk6y9kLaU6ib8Ciaq84r6PRqI8QY2YgzpYLMt/hkUrD040REx47Y6hChuOyTKf6
	 yj35cghGea0HzL0rcjfDPLmk7QKxCx9QIoaZcA7/dZkWtJIs5b7P4yark1jL9d3QHnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CvYd9Nlz;
	arc=none smtp.remote-ip=95.215.58.84
Received: from mta1.migadu.com (out-84.mta1.migadu.com [95.215.58.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DAF606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DAF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CvYd9Nlz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pOoMwnuu6Rp2se8zYeQGNlKVFILsgpZAF6qFVCLOGW8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793793205; v=1; x=1794398005;
 b=CvYd9NlzMZTYKXFbDOd+DVdlB3EkTnsbY8xx48lUD3mMp92Q0YRUBQDuTMjorv3yA862tWWz
 RRM0nVuLBDZdigzqzpGEVDMB/AYcJ1d+kmuTVxoRcqqM3wDEeiJb45cIXVqQyH+F7X99Wmx+tc6
 K7+EHYD98tUTlzQbtvDZzaP0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 817128640c2180d6;
	Wed, 04 Nov 2026 11:53:25 +0000
X-Mizu-Trace-ID: 817128640c2180d6
X-Migadu-Flow: FLOW_OUT
Message-ID: <6e812fd1-218d-4393-a2a0-ed05f67e6b14@linux.dev>
Date: Wed, 4 Nov 2026 12:36:17 +0100
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
Subject: Re: [PATCH v2 4/5] ASoC: sdw_utils: honor empty DisCo port lists when
 creating DAI links
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
 <20261103200540.3863272-5-matthew.schwartz@linux.dev>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261103200540.3863272-5-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/3/26 21:05, Matthew Schwartz wrote:
> The codec_info tables give each DAI a fixed direction, so a TAS2783
> always gets an amp feedback capture link. The ASUS ROG Xbox Ally X20
> BIOS declares mipi-sdw-source-port-list as 0 for both of its TAS2783s,
> so the capture port has no DisCo properties and every open of the
> SmartAmp capture PCM fails in sdw_program_slave_port_params() with
> -EINVAL. The PCM is probed at session start, which logs a burst of
> transport errors on every boot, and the same failure is reported on the
> ASUS ProArt PX13.
> 
> Store the effective direction in each endpoint and, for codecs whose
> driver takes its ports from the DisCo port lists, drop a direction when
> the peripheral declares an empty list for it, and skip the endpoint when
> neither direction is left. Other codecs keep the table direction, as
> many of their drivers use fixed port masks. Since endpoints in one group
> can now differ, the machine drivers take the stream name and DAI link ID
> from an endpoint that is part of the stream, and only count and
> initialize those endpoints.
Can I suggest a more nuclear option, ignore all the port properties and
add them directly in the driver?
I am not aware of any other codec that relies on those properties, and
guess what they are wrong in that unique case. all other codec drivers
list the ports in their read_prop callback, e.g. ﻿﻿.read_prop =
rt711_read_prop,

While I am at it, this TAS2783-sdw driver does some really weird things
with data ports, all the uses of

	case 0x000 ... 0x080: /* Data port 0. */
	case 0x100 ... 0x140: /* Data port 1. */
	case 0x200 ... 0x240: /* Data port 2. */
	case 0x300 ... 0x340: /* Data port 3. */
	case 0x400 ... 0x440: /* Data port 4. */
	case 0x500 ... 0x540: /* Data port 5. */

are not correct IMHO, the data ports are managed by the core without
using regmap.
