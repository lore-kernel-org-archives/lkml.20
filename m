Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799197;
	b=g9aGz02ySaaIDyvSlLXl80MMtznMSH/hZtjcqsP8c5Itfn+0lvrM+lpIJWoR2FB+pqmX
	 GLV1wM4kv7YPN7VKusJLKP9bKUJmrrQ0IBALXNOh+phO6mflfzhdzdgqxYUA2LAK5rVDn
	 4dFtqpc3pt1mJlbRjBiXW4dWkV1K2NDFQE6YbnD+cwyuHpfrBPP0WNVQDOzQWT3ohBK27
	 aAHf8/ogEQDKwuuI9v5N0AHT9oc0JxbXeIJ6QiEomXlRjgJ1wMxcSk+M+Ljq/7iNKJL3y
	 RXWxGApx0PqNTPkkzR6scsqQF9xbcfe3TPwZi0zuaUt+l4zho/xLQsaKWojWytcwTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799197;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KQZKDzQx9VZLQOJ+kDPw3CdtC+NPfudEVlpyTH5gT9E=;
	b=knqo8D23oXR6KWLs5QnEcgmsTfLMiZHpLa+TYFT4q7owFeeI3W4nB+mon61QdBubGDfe
	 DTXYyA5Hm1fr3IkL3ec4tmlF5DLDcOZyfs0TQsdJ07Zv30iy9MNIy5QkBDGiePtvUKaGJ
	 9o7gk/G+/S0D5M9/G2kRXO1V3MO6uB3BgpWtgBfIs2oQyhuqKd/51SC4zYegNqDsvyH74
	 5CweiYrQbEXqEa7AI2dj5YKxIuHW1huNKhiWtPffn7oQ1qW8HpGgXDq2cPEJy/jqFe9AN
	 nuiPDKulTPvmD/HzpRTcO60hacKmytBE51n4JQ5UbayZLQdJGJt3wdKO6CFS3E89ZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VW3VmH6W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4DE606A32E;
	Wed,  4 Nov 2026 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VW3VmH6W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD281F00A16;
	Wed,  4 Nov 2026 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799196;
	bh=KQZKDzQx9VZLQOJ+kDPw3CdtC+NPfudEVlpyTH5gT9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VW3VmH6WE4hzuk4i1EbniUqRi9cA07WC87pZ0xGcwZA1uCwcx8fcMwJc2ANmteB5L
	 KbzL8Fx6MvTdUMVf6oJoxUJlaxQ2tDlMzpaMXezMt5SwKUuBf9GTm/YBEo46iRgRsy
	 hDp6CGLjGTXnrZ+oYETWwXBRXyYqtbIaQGGgaw24/Bmk/5qVsQE8FY99wLkmNdQkpS
	 49SvFwCaIMog5GFmoE7UOqIRu/T6RIz7s01zMPfN2vr5dWdF4wKVTHSUr4AaR9X+uk
	 ZW32uycNKTh/WjNj5li62iUJfnEo94G+ckjCKTqaEnfdY2a1BSWmJON8sI9WgTTqzT
	 ZqBzvaOtjTfCA==
Date: Wed, 4 Nov 2026 19:03:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, linux-kernel@vger.kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
Message-ID: <aus0GT3ht1oEY2mc@parshuram>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
 <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
 <d9672276-5616-4609-98c1-5b9bdd06cf05@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9672276-5616-4609-98c1-5b9bdd06cf05@linux.dev>

On 04-11-26, 12:52, Pierre-Louis Bossart wrote:
> On 11/4/26 10:14, Cezary Rojewski wrote:
> > On 11/3/2026 6:20 PM, Pierre-Louis Bossart wrote:
> >>
> >>> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
> >>> That's not the case for the avs-driver.  It simply asks: "is any PDI
> >>> free?" and assigns it for the substream if one is found.
> >>> No predefining.  Again, this aligns with how HDAudio streaming is done.
> >> Yeah but at the end of the day there's a 1:1 mapping between cpu_dai and
> >> PDI, no?
> >>
> >> All PDIs are created equal, a dynamic mapping doesn't make things more
> >> efficient. It just makes things more complex to debug since you don't
> >> have a fixed mapping between dailinks/stream/cpu_dai/PDI.
> >>
> >> Put differently, couldn't the AVS driver work around that fixed mapping
> >> to avoid changes to legacy platforms that have shipped many moons ago?
> > 
> > Kind disagree on the debugging part.  Having SDW streaming follow
> > closely to what is done for HDAudio from the beginning (no hardcodes)
> > makes it easier for a developer to debug stuff.  OTOH if one of these
> > two follows a completely different path, the developer has to have such
> > hardcodes in mind when debugging the PCM code or even when looking at
> > the topology.
> > 
> > At the same time, I'm not going anywhere and I do intend to work with
> > Peter and Kai to update the common code. Simply put, such a refactor
> > would be routed through SOF GH first.
> The machine driver selects the first available cpu_dai when creating a
> dailink. It doesn't really add much value to add a second level of
> freedom to select PDIs, since in practice it'll select the first as
> well. PDIs have no moral equivalent in HDaudio, it's a Cadence-specific  IP.
> 
> Also there is already a degree of freedom in the allocation of
> stream_tag, which is used for DMA support. That one makes sense since
> DMAs may be used for non-SoundWire things (HDMI, trace, probe, etc).
> 
> That's 2 degrees of freedom on 3 levels, do you really need full
> configurability?

I dont see any gain from this approach. I would reconsider and see if we
can reuse things

-- 
~Vinod
