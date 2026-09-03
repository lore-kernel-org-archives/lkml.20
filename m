Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CFE48C3FF;
	Thu,  3 Sep 2026 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455579; cv=none; b=Lc/6Y0vSHSAm4AVb8D+nQulNApbByBrDl5Tvw5ETcyiwVvUMpFqCoaa9xrq+NK0/YL4lTVpM3yQxik0676t+PsmXn66moneoaAUKRu/bVGJuLNJGGkkExs0XpfCd0fnwg0zExNzGIJ2YrJhKktFTX5LQrnvyf80PVEDjNZVGh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455579; c=relaxed/simple;
	bh=hwRYynNvJulkks5OvxSq1SFaO+mjn+PsVkm4aHLVj3Y=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YSMb2v4WeFbcbgzOQqZHqYJ9yXJRZA0tHnnJXSt79aRlpAScYpJfrsVNxoS4LM/VFzYNUZyly//RoHFoiE41k3H8xrCEOXy8H12s/TMkn7bPzYIHhn1mTb+vKMjkGaRxZ7mIy1eCC+1pVfIRIir2sonrpYTpmLLKCG0CDQ9vBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samaritansolutions.net; spf=pass smtp.mailfrom=samaritansolutions.net; dkim=pass (1024-bit key) header.d=samaritansolutions.net header.i=@samaritansolutions.net header.b=KsfMH+6l; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samaritansolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samaritansolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samaritansolutions.net header.i=@samaritansolutions.net header.b="KsfMH+6l"
Received: from webmail.porkbun.com (unknown [52.88.61.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: casey@samaritansolutions.net)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 35249463C85;
	Thu,  3 Sep 2026 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=samaritansolutions.net; s=default; t=1788455577;
	bh=DwJo6R1fAwLAtgbBpyESZ8JkErY7ihRhTUlfibmWXnA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KsfMH+6lecQmZa1OO8JqmhoRmbjFGSdWkDekRan4ixvyJ/8OPUhpft3eeTYQFLfcz
	 ME30cqQociQOFDDDZM9PGbYwTYFFX4mFkx1WrhEDwwF6vy3iGJgr4+83UZLFUtMU8B
	 /daHpILrRuS5ZfZqpQxnwMHOh1f9lFlvMW4XrOH4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 13:12:57 -0400
From: Casey Tunturi <casey@samaritansolutions.net>
To: Takashi Iwai <tiwai@suse.de>
Cc: Casey Tunturi via B4 Relay
 <devnull+casey.samaritansolutions.net@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: intel: reset link for HP ENVY 27-p014
In-Reply-To: <87o6ehcgzk.wl-tiwai@suse.de>
References: <20260828-hp-envy-27-hda-reset-v1-1-0da50c215148@samaritansolutions.net>
 <87o6ehcgzk.wl-tiwai@suse.de>
Message-ID: <4875e82cbae39f7ea1a18e11fe47c7e2@samaritansolutions.net>
X-Sender: casey@samaritansolutions.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On Tue, Sep 1, 2026 at 8:07 AM Takashi Iwai <tiwai@suse.de> wrote:
> Thanks for the patch. But I must say that it's very hackish, and we 
> should
> reconsider to make the changes a bit more generic or cleaner.
> 
> But, first off, could you give more details about your hardware? At 
> best,
> give alsa-info.sh output (run with --no-upload option and attach the 
> output).


Thank you for taking the time to review it!

Oh yes, I think it's cursed. This is a hack.

I submitted it just before leaving my in-laws' place so it wouldn't stay 
isolated to that one machine. It has been running for about four months, 
and it was the only thing I found so far that made the codec enumerate 
and gave my father-in-law working analog audio under Linux.

I don't have the machine in front of me now. I'll have it again just 
short of two weeks. I'll rerun the tests, collect the alsa-info output, 
and work through the reset and PIO questions then.

> Can't the standard snd_hdac_bus_reset_link() work? If not, we may tweak
> there in the standard code instead of open-code here.

I knew I was probably forcing the issue at the wrong layer. I asked 
around on Matrix with a couple of devs and couldn't get the standard 
reset path to work on this hardware.

I'd appreciate any pointers to code or docs I should read. I'd like to 
understand the right fix rather than just keep the workaround.

Casey
