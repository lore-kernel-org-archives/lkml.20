Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216C367287;
	Tue,  1 Sep 2026 02:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229252; cv=none; b=CRfrOBjK5DIUTrdbpn94/eTuizidGuf4Hx6Y9qigXb8uaJ23TeTOShh7lEhpLapjd9UybeXxc7zrqSIR6Yre19k41VgaPNkiVpvfiJOKP3iGh1NIlC509kuA7cC0G2bag7uxYwSgK5WmyP6DdxvVFJiMBaXzZdcsClIyVUdW0iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229252; c=relaxed/simple;
	bh=scAe+7Cj1ljdjEQpiNGp8DoWdPjkZCJPBQdp7e+aBH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFngNsd1WKzmThFzXKSK969BiEDwUjPigN0JP1Hj7TlcxN0T4KeNAJBYJ2PHbcCvkqWiSxLACRdtJCoEdNwT/mauNsStFDeCNeiniyz0kZ+uACnAZzMmXyp9/1dcOHZZTVdYIHScMn7DVv0h3YxdhBMa1U3uYySmVYbpwVK0CfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfSIHXEk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfSIHXEk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7E71F000E9;
	Tue,  1 Sep 2026 02:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788229251;
	bh=RPNd7vtOepkHl6GY6KIZ7ovqiK8wcRWvYFho7XV0g5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LfSIHXEkNPtWXRJuCdQYfcTosklIqnKwQn/huxnZ7o8NO9iCQjLxBu/BkDfVDrYSa
	 SMl7mJmOz7UEIAozOuqGIQ9jW5Cy+EVA3BudztRH+R/52JT/MNr5GjtMC3RGs7BylR
	 i93R+/1AqZmwYTnre4Zel8W5yfYYpi5nd1h5Av+xduuh5CbC2YZ2WNBrg3cswCi7JD
	 5z0QWafyy96PODSyeAO2ET73IKTyL6HJxb0FJ/Dep4uG2K4ukL2q91MOhxM+6qLGWf
	 HfxDQvhAaUWIIPjddAYXHHBaXP9lNjCAwUWSrkiPtDvqFq/rPg6yXxJXRoYJ70kpyt
	 8rtmRvWFc0mfA==
Date: Tue, 1 Sep 2026 02:20:48 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, tomhughes@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] platform/chrome: cros_ec_proto: Fix deferred response
Message-ID: <apY2gGlAXsuqjCPR@google.com>
References: <20260901005126.3344929-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901005126.3344929-1-robbarnes@google.com>

On Mon, Aug 31, 2026 at 06:51:26PM -0600, Rob Barnes wrote:
> When cros_ec_wait_until_complete() succeeds after an
> EC_RES_IN_PROGRESS status, it previously returned the 4-byte
> transfer size of EC_CMD_GET_COMMS_STATUS. For 0-byte payload
> commands (such as EC_CMD_FLASH_ERASE), userspace received 4
> bytes instead of 0, causing response size validation errors.
> For commands expecting non-zero response payloads, the kernel
> exited without issuing EC_CMD_RESEND_RESPONSE, leaving response
> buffers uninitialized.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_proto: Fix deferred response
      commit: c55749415623a58eba3eb527da023d29b43fbf5d

Thanks!
