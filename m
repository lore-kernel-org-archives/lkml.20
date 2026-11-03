Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726633;
	b=KXhGInY6QPuXzjaxcjpbS1L3Lmk22focMtKSGyKVpyxiPT6r/h3hT3pJsxmmKBfhDC60
	 LJW/wmikUntmSpgVKA52WnJG0mjs/jQrNbU8EKBT7PAa07iHBkz1FNPcw2DfQb1GfBEKC
	 nXrD8oTG6+NJQoFMrDkuRGpRE/iPGpRJMnYiFQluOPYejPCol6AxblL/DnhirWqbfGm9B
	 RVqqczRMFHn9WGJQwB/3BZrTkScVoAI+lZ8DCxTV3esd74V8NhV3GkQA7+U0oZRA55yki
	 JM6CXHWRYWzDD7KAHibEA0qYgbaQi3Ax2wKcTxWD7MhQIMdTRmZFZybABFJQXQ+rcWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726633;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lao6LJzaJ3Qalh9YZQw6NR3znQNVpF71VzIbnXWrGr0=;
	b=nnMqR5I+DluQ8DmovJ44SIrdX21Ivz/Sbvlx2AGQ3xHpL50IReVeGwIHBYSmQbiLxmQD
	 DjgeaFbhxoHQyjzp2pBNSnnUjQ4KOmHrFfVRBlBq53b/EkZgfn+dkZQxUSeMme7Lqf6Wf
	 LNYGALk/2smh44ZDuVSFTGPMt2IV/5yQKhfaQ0i+FdESxfBSSouw+p/2JI089dmVPoke4
	 U+VtBeVX5kyO+7Uv62srC8WlM5hTlvh2tB3M5EHsolGMq/m9B49K9v0R2NPV6MpLk8Y+j
	 +QwwDTB72m8uHz4d7BXdosZxFWxXmhm3siB8/af2ukPkbLTAiDdPuHZnc7TG/qiEpvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MU2GQQzh;
	arc=none smtp.remote-ip=91.218.175.196
Received: from mta0.migadu.com (out-196.mta0.migadu.com [91.218.175.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2DC606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E2DC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MU2GQQzh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m/ibj+CJrr6gcQpwt3tG+9S9z5VbFOBOoeA/Ra6FQUw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793726630; v=1; x=1794331430;
 b=MU2GQQzhU5dJz2+mzQ8g694U5Tgn/ENwz4Dp1ocPLz7ydunkoEgrNrKaYDEB18hZjCI9LFfe
 p8IPrHou4cVrI42lUSo5Etqh5066DkA4fCSDETeLY7N+ihfhCjUWEYTNu8RrkmYOV0R1ynPN5pL
 teq+rWITr63q5NI5ABABCdz8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 08ccdf66400b8021;
	Tue, 03 Nov 2026 17:23:48 +0000
X-Mizu-Trace-ID: 08ccdf66400b8021
X-Migadu-Flow: FLOW_OUT
Message-ID: <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
Date: Tue, 3 Nov 2026 18:20:48 +0100
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
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261103134958.2089136-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
> That's not the case for the avs-driver.  It simply asks: "is any PDI
> free?" and assigns it for the substream if one is found.
> No predefining.  Again, this aligns with how HDAudio streaming is done.
Yeah but at the end of the day there's a 1:1 mapping between cpu_dai and
PDI, no?

All PDIs are created equal, a dynamic mapping doesn't make things more
efficient. It just makes things more complex to debug since you don't
have a fixed mapping between dailinks/stream/cpu_dai/PDI.

Put differently, couldn't the AVS driver work around that fixed mapping
to avoid changes to legacy platforms that have shipped many moons ago?
