Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA6537996C;
	Wed,  9 Sep 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945331; cv=none; b=VO0fFBU6iLX3hY3jOB6D9hQgnHt111IsYqzx8ZbSXF3VaFFGQGzOS1WQJjt/RpZ86AW38kpp0NRnyT03LW+IJG0hDbKTRlH35lR6tIpDniyeDCyjatpKh5byjUYhWeQLgljDYuuwJyE39Jb5TdHzIsX9XaSrNatiPGbvYIEu2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945331; c=relaxed/simple;
	bh=Q1hPFcHkvswbhbdcsLOQX7sUlSGIB2PG8xMG+T49BdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzRzN+E1XmyCEjg8wOTcnYpkxRrRWD/YOyTwHnQrAQcDyTrJqyfiGCj8V+Gn6GRlQ228qk5u/rFhwfCmUszAjNF8xuwbKCz92eyOF6Dp5VcverJOROCIZMpgkvccZHL5f+CBIlEXL2N/B2oN3Qj3kQ1m+N1wlND6AjY6aL+wJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dT2IlqVY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dT2IlqVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788945325;
	bh=Q1hPFcHkvswbhbdcsLOQX7sUlSGIB2PG8xMG+T49BdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dT2IlqVYjgDxGh0a45aUg5OLWqBfn58Tqt+giiqkH/WI7jCVZTpq39H7OPXvyc+9k
	 Y7bmq7IYqc98Lfkus42umstvLW4rDYwwLXiRDBWrE69flsMPUEkSDwRLTQoQrqN8//
	 3gASZwZWUVen+9+pS4SKdmBNCG5c+lkO6TUtRKxiYEJZJKsrvxI1xHnCxH0caEpkRh
	 KU0WcYboDKQFpEtc3jES2L/YVxBFQmtLHoyU/mNFh4FjPzvLP++Mw3sQ+cFhpeBHUe
	 tWs4wzGEGcrtF51V24DffIbEm8ehBowmunz6LbYkd+S6ntCu2Oarxo8mfP7KjcYC4j
	 df2B9WEsk0Qpw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDED317E06E0;
	Wed, 09 Sep 2026 11:15:24 +0200 (CEST)
Message-ID: <3bb91821-e618-4992-8f95-8e2631568bbe@collabora.com>
Date: Wed, 9 Sep 2026 11:15:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate
 regmap update errors
To: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kees Cook <kees@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Douglas Anderson
 <dianders@chromium.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
 <20260907120310.135693-4-phucduc.bui@gmail.com>
 <e011cd74-7c5a-4cd1-b412-ad11765ad11c@intel.com>
 <a88fbf17-faac-4902-bd39-ff0a616a7d2d@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a88fbf17-faac-4902-bd39-ff0a616a7d2d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 20:52, Mark Brown wrote:
> On Tue, Sep 08, 2026 at 07:49:00PM +0200, Cezary Rojewski wrote:
> 
>> I'd expect someone from Mediatek to verify this.  While I agree with the
>> change, some drivers follow "ignore register update result" arch and,
>> what was previously ignored will now cause basic operations to fail.
> 
> We don't really get any review from Mediatek, AngeloGioacchino used to
> try to cover things but it seems he got busy recently :(

Yeah, sorry about that, it's busy-busy-busy days here.
Also I had a summer break, so 1+1=ouch :-)

The changes are fine, those regmap updates always succeed, that's why it works,
and ignoring an error there would actually break things.

Cheers,
Angelo
