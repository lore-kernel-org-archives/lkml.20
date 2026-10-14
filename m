Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841AD414A27;
	Wed, 14 Oct 2026 06:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960539; cv=none; b=dwkWeD6BE5RMb5mu0OYF6jEtVi6M4PrPhNjS1pxQbG1EdPEFsGCAWkQE/LGLdw8yWm6qlFz1Gp+eiZvyCmsDCb3yBVcYQDRh13o7C1dSrxBPipEoi4t030xlBi2tbZHsXyqlHL19x79X8BxyNLH2/SZlD4d82iCOLDxJi+IUFXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960539; c=relaxed/simple;
	bh=4sRv9LlDt/QFQt2J2hCMrxYjfnDkaQpVRSNLST+xGsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cq2grQcxwCXTc1c3Zc0ub+9k4TWShwZic7FH8Wu5lGQkvggXTXqCZTEoa2RK2k2ap8Ryd5nahgZzRMfEzAGkNvJySJIGgjflTTBGmKfckZlqqrFHiOg/cp4HqTW3/jAUDN22s3xenpJ6ApRXF9Pavos0d5GXenrhTlY1hCdsoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bc11fH8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bc11fH8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF58B1F000FF;
	Wed, 14 Oct 2026 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791960538;
	bh=3s3KwabcJwIRXUmI/Y+Bqws+Jo8G1XOlJIz1X+GBsuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bc11fH8U74i7RrUlQ5KqwGTUchjhVugnDivsPsLyeQXmbjKrmtwUGhVN3PbhPBeiL
	 cfQwruNYWI399jvmwJuI4th66Dr2RcqTzpQqjd87UvGubXC/RFzAr65qTeQUfIwnT8
	 eQIdwPhtoHrRuL0Ye2AzAJkYXXUoTuYT4h0FyVcXKUgFyxh2ojogGBROtpO0EJfP3L
	 yiQvRzVhfq/0/tKNaYipcoS0ggRQnDpATrx8LGcqx5Yz4jJmcj4LvmkudZDPlVagXm
	 luzSTJxdiDLzwl/uLkZvjkMWKOKj+CTezDg/kxRjaNrg3hFcfvyuOI+UV/RBcUjLrI
	 Qt9w6iJ0THlXg==
Date: Wed, 14 Oct 2026 06:48:54 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Satyam Gupta <sgsatyam@google.com>
Cc: Scott Collyer <scollyer@google.com>, Benson Leung <bleung@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/chrome: cros_ec_sensorhub: Modify clock
 drift estimation
Message-ID: <as8l1oKtNsIwNHWr@google.com>
References: <20260723163838.1698125-1-sgsatyam@google.com>
 <amiBVdd1KvxbW5Ul@google.com>
 <20261013105713.1369546-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013105713.1369546-1-sgsatyam@google.com>

On Tue, Oct 13, 2026 at 10:56:50AM +0000, Satyam Gupta wrote:
> On Tue, Jul 28, 2026 at 10:15:52AM +0000, Tzung-Bi Shih wrote:
> > > This CL makes 5 specific changes to the clock drift estimation algorithm
> > 
> > Since these are 5 distinct logical changes, shouldn't they be separated into
> > a 5-patch series?
> 
> Although the v3 commit description listed the adjustments as 5 bullet points,
> they are tightly coupled parts of a single fix to support sensor batching in
> the timestamp filter without breaking intermediate states:
> 
> - Extending TS_HISTORY_BORED_US from 0.5s to 2.0s so the filter survives 1-2s
>   batch flush intervals requires the 10x dx ODR/mode-change reset and slope
>   clamping; otherwise, transitions between active streaming and batching (which
>   previously exceeded the 0.5s timeout) mix into the same filter history.
> - The 10x dx check (which reads state->x_history[1] when history_len > 1)
>   depends directly on the loop start index fix: previously, with
>   `i = state->history_len - 1`, the loop did not run when `history_len == 1`,
>   leaving `x_history[1]` unpopulated when `history_len` became 2.
> - Dropping strictly past timestamps instead of clamping them to `last_ts`
>   prevents post-reset backward ticks from being mistaken for same-timestamp
>   batches by `cros_ec_sensor_ring_spread_add()`.
> 
> I have reworded the commit message in v4 to explain how these pieces work
> together as a single cohesive change rather than a numbered list of unrelated
> items.

I'm not convinced.  I think they should still separate into 5 patches and
form a series.

> > On a related note, is [1] still relevant?  Should we disregard it?
> > 
> > [1] https://lore.kernel.org/all/20260720110405.2127011-1-sgsatyam@google.com
> 
> Yes, [1] ("platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap") is still
> relevant — it addresses 32-bit EC timestamp rollover across deep AP suspend.

Please resend or include it in the same series.
