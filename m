Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299377;
	b=sVqCUjIy1ryUjDsASJF+pZRbGaH9sJybCdCfhIcU264ge1tn6QdLAwEFudRpmLBFjH/L
	 Exr5YAb+Cnf0WGFNc1q8IU65l251Eu/goMyxstV9/Y1eh36udTnMGFz2G/F2b9TBghGHa
	 Zdd0Tvf4co669fnDTtfkaIImkgZqDRtR1Xmyni3hY/g4m6RmJIzVzZhDvYjiFVrIDUXDz
	 7r9j2uu/8JDoUTACcPxgBhxuyuIavn05BELkJPhqvEQXgasu1msOEjUaKdjaFgqeRwph0
	 RtOmScLW13tJY4enoGoTUWrvLhKtVdDP14XvC/MjTqLO9Z4WVHYUh9Qknxe/spnNkHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299377;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=59mCIyqgzplgCfH637KwGYXkKPKZEjLf+njuYYkkxxs=;
	b=qLuJvRMLhYTMZ8LnvfjGiP02oDELIQprabnoVB60qd7fd5+UM9CJnIBIF/CNr4L8sAvo
	 AmBrAVMzKjo2W+5m2dTW//ZGKO0O9I6/jIAJ6Q9dMoldRemlsds5Vdih9yR+w2MCgs/Sf
	 +inceYsIERsNz8Ted0PiRmi2xOegjOI5ttJBCz/jd6I86KDj4Bm3ECdrujb2UYeF1aPN7
	 t2QAWINGka1Aw811YOyMDQFPf1mBUIlo+2XPiXhzPGXGbITHj/TdZ8r55T7ERCHojIUW7
	 hsAvo4FLE0t2KX7JF0NanjCpxF5061UYAjTp9KK7L2MmZd8yzs1JjCQI0QG3mFRHiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Cm/FvJb8";
	arc=none smtp.remote-ip=95.215.58.103
Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D335160A3814
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D335160A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Cm/FvJb8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GWcT2EPC1sMeUtNkzbslb0fqDYQEU9ePmyP+FxmAtjk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794299374; v=1; x=1794904174;
 b=Cm/FvJb8rbjThIJSfi4qHx683h5xTSjOCV8xzp7IL91eYFOrfNZaFW9R92dnQRAYjn3TKuK3
 KQIhdUp3nwdaIqxplJja7LeLvQwbI9atMbiM+s5OrHzlZyLq05b/yFC+h7QzHTum6KcIuMzZmEN
 Z+hRKGfj0PQTgE+pazRpj1Pw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7f9c5af96b043bd7;
	Tue, 10 Nov 2026 08:29:33 +0000
X-Mizu-Trace-ID: 7f9c5af96b043bd7
X-Migadu-Flow: FLOW_OUT
Message-ID: <da201f07-1385-47cf-ad71-8f01ee5ca124@linux.dev>
Date: Tue, 10 Nov 2026 09:09:23 +0100
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
Subject: Re: [PATCH v4 0/3] Add SoundWire port constraints into SDCA stream
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 18:26, Charles Keepax wrote:
> SDCA adds constraints onto the DAI based on the DisCo properties for the
> Input/Output Terminal. As the SoundWire port for a Terminal can be
> selected it is possible for the SoundWire port to support fewer options
> than the Terminal. These patches add the SoundWire port properties into
> the constraints for the DAI startup to cover these situations.
> 
> Changes since v3:
>  - Added defaults for the word length min/max
>  - Removed unused static_assert
> 
> Changes since v2:
>  - Add check for ending up with a zero mask for channels
>  - Switch to using SNDRV_PCM_HW_PARAM_FORMAT, rather than SAMPLE_BITS
> 
> Changes since v1:
>  - Move constraint allocation to DAI probe/remove
>  - Use BIT macro where appropriate
>  - Correct GENMASK usage
>  - Add missing array indexing
>  - Correct channel masking
>  - Reorder the priority of SDCA properties
>  - Handle the case of the word length not being specified
>  - Add a static_assert to check the constraint array is large enough for
>    the word length mask
> 
> Charles Keepax (3):
>   ASoC: SDCA: Move DAI constraint allocation
>   ASoC: SDCA: Factor out helper for creating mask of Cluster channels
>   ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()
> 
>  include/sound/sdca_asoc.h            |   9 +-
>  sound/soc/sdca/sdca_asoc.c           | 246 +++++++++++++++++++++------
>  sound/soc/sdca/sdca_class_function.c |   6 +-
>  3 files changed, 206 insertions(+), 55 deletions(-)

LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

