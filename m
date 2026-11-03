Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721675;
	b=Q/CW8r0TCSpIRNHWliCKJOG0wm4r6dSEMLcmCoZZgFk9Rlmrf2/B28fTqQ6P7PnC9rIw
	 WUlvEyZsd3sr25G1S7QwMChG+nOYRzkUYyPman5iF7ecQElGAY9cvO206JrLdx1nZwWO8
	 rwaAmIQCdzZPxdcfx969zHneMKG2KsFU9M0EMSERFu5PUygzFPtk0fuYokX7mjDIuD98h
	 z+kv1fvnDA7W6odhD6x9VwCOIgB63S6ycOublpUTE1YqJmf9TikzALS3Nj9ivqa8XI+F4
	 a0bvNzLV/6JwaG67wc/JL2hkhXVsKU0VPgtiRitFB+V140SyacKY0gcuBD6WhxDQtSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721675;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=siYFZaVAI4dRc0sumnY5kD2sUahMxACZ30o0p9TVTCE=;
	b=VCly4lZJw1/MLwcmQeTz9LyF3nscWGgXOGEyf8XadJuE37sWM6nHX+W5chR8S3/TL09c
	 YavfjyPuKytY3xVWaWK23t09+KE+Y35jD2lci8fBirtT5OSCiB7ig5SzFQhnY97k8RdMB
	 JiY+BxOFOQ3wyhrW1ugC1FSwDsQ65L1GYi1FqvEjT5KkHztUUnmNyRejWGOCZcnswhFuq
	 TAjEEucZfMSzfE5S9tL0MkrQZzWirmiINxYpsA5rFslFTbCNPbWFtgcPhtPf4kGJo6I2O
	 Xa2JuVgDGd5QY3V7j5LUNKQ9SZZOnILIfF6wTg5izazCUC9S/X6LPLB4vVrwYpwpAvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Fz3WJSla;
	arc=none smtp.remote-ip=91.218.175.239
Received: from mta0.migadu.com (out-239.mta0.migadu.com [91.218.175.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7FB606D825
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7FB606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Fz3WJSla
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RNHlMa6RwOm9qVZaoJD2JFv05KQ6puOjifLF8tZtWyk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793721671; v=1; x=1794326471;
 b=Fz3WJSlahqzHuNUJthc7oEnToQZ5wJmVnZqIOS1ISFr9L33FyDiknwAx3HI2RiL9+TnrEqhm
 eNZSMuvh8qJpRUVaQgRwZnkcQMJ7u25WtR5ruMHfk9++klDJcgTRvbbQJPp7sr4bFm8NQTqUKhX
 QDDIMRkTYdlSlQhiGkziSv2U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9fdc28ca13f7125a;
	Tue, 03 Nov 2026 16:01:11 +0000
X-Mizu-Trace-ID: 9fdc28ca13f7125a
X-Migadu-Flow: FLOW_OUT
Message-ID: <1a4eb0fb-adbe-4884-8f37-b5ffa6782b84@linux.dev>
Date: Tue, 3 Nov 2026 21:30:55 +0530
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
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
To: Alex Deucher <alexdeucher@gmail.com>,
 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, dev@deq.rocks,
 dri-devel@lists.freedesktop.org, ed@aicharmers.com, kenneth.feng@amd.com,
 linux-kernel@vger.kernel.org, simona@ffwll.ch
References: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
 <20261103150057.1227-1-atharvatiwarilinuxdev@gmail.com>
 <CADnq5_N-sobVK3qitqABjqMv2HMyGNdxX0XMXa4TZzVnMv8MLA@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <aditya.garg@linux.dev>
In-Reply-To: <CADnq5_N-sobVK3qitqABjqMv2HMyGNdxX0XMXa4TZzVnMv8MLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi Alex
> On Tue, Nov 3, 2026 at 10:01 AM Atharva Tiwari
> <atharvatiwarilinuxdev@gmail.com> wrote:
>>
>>> It is the same issue.  I don't want two fixes for the same issue. I
>>> just sent an updated version of this patch expanded to cover more
>>> macs.
>>>
>>> Alex
>>
>> How is the problems same exactly?, Does initializing UCLK later change the
>> PPTable?, and as said this is not even a solution for iMacs, so why are we
>> still trying to upstream this?, and btw initializing UCLK later with 5K,
>> makes it not initialize at all, so the patch is just wrong.
> 
> I asked around internally with the windows team about this issue and
> was told macs needed to enable UCLK DPM later, but no one was aware of
> any uclk dpm patching.We have filed multiple bug reports regarding the 5K issue on iMacs but they have simply been tagged and left over for many years. Now suddenly one day a person without properly consulting the author sends a patch upstream, inspite of the author himself saying doesn't work.

I own a MacBookPro16,1 and the v5 send doesn't work at all to fix it for me.

Since Windows team is willing to help us please fix the 5K issue on iMacs as well. And the devs aim achieve hybrid graphics, which Windows does not support.

For my testing results, the patch in v5 (https://lore.kernel.org/all/20261103143014.522592-1-alexander.deucher@amd.com/T/#u) doesn't solve what is claims to. It might be possible its needed, but in that case even more workups and patches should also needed to get the GPUs running properly on Linux only.

I believe patches submitted by the author himself should be acknowledged. We already are victims of AI cannon, pls don't make things worse.

Nacked-by: Aditya Garg <aditya.garg@linux.dev>
