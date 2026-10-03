Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F911C695;
	Sat,  3 Oct 2026 20:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060052; cv=none; b=klfqwsvaxlSOc90i+4KkfsDT/07mjlq5nCsU4OXhmWYORIpxBMeqWcl1nsMZh6I+eqspOgJPFco/lHHvwK6drfbM1D6c1QvArLnyu3dXLd5DZn7NP7wy4q2Kco+YDIFZ9JqtHyI2l5NJySKhmWJF64FzNylOZZZHt/qn1xdEn9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060052; c=relaxed/simple;
	bh=rUn1RTobXicOz/YPzdugOT5F3qZ0z8buqI9OEuq9rS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjXjvQ3L8/83no6HGsfXLMT24F416t+NmiQgq2a0wNkPKfpKKbx7Ruaaik164JnyKFZaYeEh5gxJo4eYtMs8jEIee3bszLFLk3DZ+6zmKEKV4rtiND+f2eZJzKL4Bfe5o0wnsu//HPNNUbgdeO5bAw4zyIzRvD9cB00own3nlkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=I0HnBZ45; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="I0HnBZ45"
Received: from [192.168.178.20] (i5C75F769.versanet.de [92.117.247.105])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id BE7D72FC0048;
	Sat,  3 Oct 2026 22:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1791060041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXkULiA2kJFFK7UGYbig9D0e2jvjOcgghdizKthHrkg=;
	b=I0HnBZ45Sx/LwPUJ1TLu20CIgvbsG4C++yG2d0nkXeM18gb+U8qnQLLWSyyjats0AXllMK
	6JK5gCmROHz37meffnAbKI9ZzKjAXAx1hkkjeW9hOxMUzGxe8zgW/03GzUE1jHedgBINz6
	LYlzIR/FubIM/7cr+NZVIwQGrPA1A5k=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <80121f8d-c272-46f8-ab8b-2479a70c0186@tuxedocomputers.com>
Date: Sat, 3 Oct 2026 22:40:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASRock NUC BOX-358H
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Eckhart Mohr <e.mohr@tuxedocomputers.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261001183403.103990-1-wse@tuxedocomputers.com>
 <87ld8fxi1j.wl-tiwai@suse.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <87ld8fxi1j.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.10.26 um 11:14 schrieb Takashi Iwai:
> On Thu, 01 Oct 2026 20:34:00 +0200,
> Werner Sembach wrote:
>> From: Eckhart Mohr <e.mohr@tuxedocomputers.com>
>>
>> Fix headphone jack detection for some devices
>>
>> Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Applied now.  Thanks.

again i forgot to add cc stable

can you add that in your branch?

>
>
> Takashi
