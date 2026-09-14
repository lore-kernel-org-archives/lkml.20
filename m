Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30BC3D9DC9;
	Mon, 14 Sep 2026 11:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385674; cv=none; b=sDTjbrOtOrVOejTNuAj8GcU5rWuymnVS27LnwUKjGMKGh522vEDOhuBwwfpGmpQEyPabNvM2m1USIwdWdaB5KY6x1PW11ncsjEgQH3vADiE9uADx6KYfQDYJgsr7TJZlDGHjUNl5D4ftz8UVoKnTjcNZnUeUFGxm3sqGfX6wQUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385674; c=relaxed/simple;
	bh=PpE900YYTup0zjX0/okVz2oU4lPrmeJ3iBMQI4+6hUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBbJqM1HetKNNgn3qAXmSFeI0ow+E1foU1YyYKKW0NhhINphyf7vU1rhBrIqfoYDDPQdwAl8DYx8D8YAqJLD6UVfYmX/W5NeQ3ls27mqYhsDGB5Cku+SIqDe6jRDyKahK8nvbVclxyw4z9paVzHiKf6ZS6djr0MmSzPCgKtVfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=eXt2uK6E; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="eXt2uK6E"
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 41378FB04;
	Mon, 14 Sep 2026 13:34:27 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2-6ixqJmWgU; Mon, 14 Sep 2026 13:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1789385665; bh=PpE900YYTup0zjX0/okVz2oU4lPrmeJ3iBMQI4+6hUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXt2uK6ET6OmQAl0AHF96DnJPXD6K1mJgX5C+K7pwwntUyjd2vUgdexDNnfbHgJJb
	 2QW4IQQ9kKcLjgYMUWqAzyVDB8oMjtbS2QZj8piXcXmjNZKgtBxDTSVtD2osX+Uhsj
	 7wPoMerGU1kNWdxIZ07l28aRSr66ZH/HYdgZSNX71fsetPCvTF0c5Mkb2mef19Zvhl
	 +5my7Fn2LRLxD4HJNAf26WW3lFCm6g3v/LTF9b8YJBjibQADMy8kQx1jJMxeYHBizT
	 eZFSDghpu+Vk4It72IHi/sVcO93w5BioRtEiapkZ6EIqkLoj8ZVJJXGLiArB/RghCO
	 NV5A50eRRtMuQ==
Date: Mon, 14 Sep 2026 13:34:24 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Mark Brown <broonie@kernel.org>
Cc: Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: soc-core: use the device tree card name as
 long_name
Message-ID: <aqfbwDUegHcx-kDn@quark2.heme.sigxcpu.org>
References: <20260506041112.412871-2-val@packett.cool>
 <aqfT4ZzmxtxM2Dn0@quark2.heme.sigxcpu.org>
 <aqfYM0svh1mDZtqj@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqfYM0svh1mDZtqj@sirena.co.uk>

Hi Mark,
On Mon, Sep 14, 2026 at 12:19:15PM +0100, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 01:00:49PM +0200, Guido Günther wrote:
> > On Wed, May 06, 2026 at 12:58:55AM -0300, Val Packett wrote:
> > > When setting the model property for the sound card on an OF/DT system,
> > > the expectation is that that model name would be used in the UCM config
> > > path lookup. However, the DT model name was only used as the "short"
> > > name, which gets overriden by the "long" name during loading, and
> > > the "long" name is automatically set based on DMI data if available.
> > > As a result, adding an intermediate bootloader such as U-Boot which
> > > provides DMI data on a device that didn't have it before would break
> > > the UCM config loading by suddenly looking at the "wrong" path.
> 
> > > Fix by assigning the DT model name to the long_name field as well.
> 
> I'm not convinced that there is a clear expectation here, any change
> will doubtless upset some other user (for example someone using a system
> derived from a reference board that happens to work with it's device
> tree, or something where the firmware puts discovered information into
> DMI).  Really you're just not supposed to combine DMI and DT based
> discovery methods, having a system shipping both is just going to lead
> to confusion and there's no way we can possibly get it right.  You have
> decided that for your systems the DMI information is bad and you want to
> override it but that doesn't mean that the next person won't make the
> opposite choice.  Any decision here should be policy based in userspace
> based on the full system information.

Thanks for the hint. So that would mean we should do something similar
to what Lenovo does in UCM (that Val pointed to)?

https://github.com/alsa-project/alsa-ucm-conf/blob/980fb83651e82c3e53d3a0ab7fa9b7d6fc2d809b/ucm2/Qualcomm/x1e80100/x1e80100.conf

> 
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so 
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.

The original mail was from May so I figured ~ half a year would be o.k.?
Sorry I got that wrong.

Cheers,
 -- Guido



