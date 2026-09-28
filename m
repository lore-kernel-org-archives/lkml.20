Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0D4E77F6;
	Mon, 28 Sep 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609168; cv=none; b=QxU8h+nW2+lm5aJpcIbcalEbzsaPuK8+Ngk6D7pnxUp74hniVP0d8JaqD4y7Ue2j62XFAtrFW5E0HjwAQzrMYtE/DbY3UsJEMRW9pPsFnhZeXT/t0DtY2KsnDgmRNQ/r6mSRMgucjO1EIKUXehLEN2yfVqk1KoDIiamWjDuQnEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609168; c=relaxed/simple;
	bh=eQ0oqytzJ8vWXFWZtcRnAGFQJAXYoWIugUoR4MpEhKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDqavTR/qm4DsVhSiRgyfT/L8612NME4ocNrDQGpKli5U661TKVRfx7QnlKUrPDjhEm3AnlwfHMgRlHPwCkPMXX36DdL+dtu1RYtYrX/0DO+gt6DQ0p6ouyUx0WeN2SEwKOsOoh4GZQvuiW2TzednaBnCfAQ4adu1VnaHrEWEzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCQlm0fw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCQlm0fw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AB61F000FF;
	Mon, 28 Sep 2026 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790609164;
	bh=pOoCF6MK9EIVi8+GIATHY1F0oU3kga1CPCt/SemTgs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gCQlm0fwbMvrASH2i0NE090nknFjUNDkg4U4USbT+/yhpr0uHxilM8wc/WvR4fGzp
	 aY1SvgaLUyhoPdLCwzCtb0JiM8Kv26WoYJVW7X8ndV+nwnYrBjHp5MP2jHbEAZ2xOp
	 rmXJhaIljJ6zbIcxqwVHaLWnjccaxegpOhPEjTuN2x6H3Id+lOrMI2P0WkvyKkn7et
	 BZ3cbXaperX35HfUIRG6F9dBpa7WriAQMpBQ8aLIy/doTNiYiopYqWNeKM7xMvrc2d
	 fuDp44KnYoGfIz84ZZnd6MIfGwhh+DQe4F4DA6FrtRTdNswz9Zv6r72EbC1osM+wGv
	 EhUZW5S45I03Q==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xBDEv-00000003gnv-31HH;
	Mon, 28 Sep 2026 17:26:01 +0200
Date: Mon, 28 Sep 2026 17:26:01 +0200
From: Johan Hovold <johan@kernel.org>
To: Liviu Nicoara <lnicoara@thinkoid.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonathan Marek <jonathan@marek.ca>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
Message-ID: <arqHCRgQUcKPVpoJ@hovoldconsulting.com>
References: <20260924125940.22665-1-lnicoara@thinkoid.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924125940.22665-1-lnicoara@thinkoid.org>

On Thu, Sep 24, 2026 at 08:59:40AM -0400, Liviu Nicoara wrote:
> Commit 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless
> gain read/write sequence") removed the read and write of the digital
> volume register in wsa_macro_enable_interpolator(), on the grounds that
> writing back the value just read does nothing. The comment above it,
> "apply gain after int clk is enabled", was left in place.
> 
> On the Dell XPS 13 9345 (X1E80100, four WSA8845 amplifiers on two WSA
> macros) the write does something: a volume change made while the path
> is idle does not take effect when playback starts. Lowering the digital
> volume from 81 to 63 with nothing playing, then playing a test tone,
> gave about the same level as before the change. With the rewrite
> restored, lowering it from 81 to 69 while idle played audibly quieter,
> and restoring 81 while idle brought the level back. Changes made during
> playback take effect with or without the rewrite.
> 
> This is the behaviour described in commit 46188db080bd ("ASoC: codecs:
> lpass-wsa-macro: fix compander volume hack"): "the volume registers
> still need to be written after enabling clocks in order for any prior
> updates to take effect." The value read comes from the register cache,
> so the write pushes the last requested volume to the hardware once its
> clock runs.
> 
> Restore the rewrite in the interpolator's POST_PMU event only. The mix
> path event removed later in the same series is not brought back.
> 
> Fixes: 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence")

Since this fixes a regression that may affect the speaker limits imposed
by the machine driver, please make sure that this gets backported as
well:

Cc: stable@vger.kernel.org

> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>

Johan
