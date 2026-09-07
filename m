Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C54FB9DF;
	Mon,  7 Sep 2026 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799583; cv=none; b=lR+mKMEUmKzRalx+OItAO79zhNPxUlVCx7dV2fj9SbMMuVNjkfeqNCfV3WmKU49xleL6BgB6ffYbm9t222/+yr0vyPoiZ0j09wxMgSHoTBnQyB4S8Qk6FGxjEiJsMPkbg9eLCMLX6Zymo6Um/OCuCKMS/dvoh39csvc2B5aicF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799583; c=relaxed/simple;
	bh=LX83kIxvxb9Xh6M7jPdPVuES9mIs0FMDi/3ZtAMbmrQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ota0+Fhe9bLBc84XnWV7CMnt9liFK2BsQ3/39Xow1vm57HtuZfmgoxy0sEhlwaPDuuNuxnKAWlvHD7VLKAUzGFV5CbI9TJHHotEn1ETelYGuiVP01Rx61cJiEwM23KD6J9HIwTi/4+KvDgbYR99vbrfdinqHtTvMPCFfpIKi/D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=C+z3UkHK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="C+z3UkHK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DE55B408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788799581; bh=bfGeFE0QA/H0zdYazVCg0mjCJk512rtabn92S77Os4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C+z3UkHK2OZbaCWcSbM6uFo8KP6S+tvPc4lC8I18gK+/9xGb9Hnv08OWuow3W7y1L
	 etrRDXh+OKybk8Yukx4rJHlhinFellKoQD7yVV/cjQTy9Jx+77+A16YgovNxYEEyez
	 ht0CygTsA6LBuspXV4CPCNwC1fPRvI6OC/CWQ0Lde0hBaoo886BNmpRnR5IG+fSgiK
	 aBL3QuFw4kyXptBgPGBaSk2JH4MAGtW6DmO5bEJRsMDghOSiyippaZCLYKkeSckrHK
	 vMVfxIDqpKDfU5PlVdMTAKD5w1NV6UcDB9+/AnsqIKXoXAY0BviJyJb62+eRuT+CLW
	 rZv5nCnGOSDdQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DE55B408FF;
	Mon,  7 Sep 2026 16:46:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Michal
 Hocko <mhocko@suse.com>, Marco Crivellari <marco.crivellari@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, Waiman
 Long <longman@redhat.com>
Subject: Re: [PATCH v3 0/2] doc: Rename dynticks-testing to cpunoise
In-Reply-To: <20260902092434.85096-1-marco.crivellari@suse.com>
References: <20260902092434.85096-1-marco.crivellari@suse.com>
Date: Mon, 07 Sep 2026 10:46:19 -0600
Message-ID: <878q5dovqc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marco Crivellari <marco.crivellari@suse.com> writes:

> Hi,
>
> Currently the documentation still mention dynticks-testing.
>
> Recently the repository name and the tool have been renamed to cpunoise,
> both the patches reflect this change.
>
> The tool announcement can be found at:
>
>   https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
>
> Thanks!
>
> ---
> Changes in v3:
> - Use "https:" instead of "git:" for the repo URL
>
> Link to v2: https://lore.kernel.org/all/20260831092118.124576-1-marco.crivellari@suse.com/
>
> Changes in v2:
> - Link to the tool Announcement added in both the patches and cover letter
>
> - Corrected another occurrence reported by Sebastian
>
> Link to v1: https://lore.kernel.org/all/20260831081823.67972-1-marco.crivellari@suse.com/
>
> Marco Crivellari (2):
>   doc: Change dynticks-testing repository name
>   Documentation/no_hz: Change dynticks-testing repository name
>
>  Documentation/admin-guide/cpu-isolation.rst | 4 ++--
>  Documentation/timers/no_hz.rst              | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
