Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247552;
	b=APunUTvRVcvgSWx3ZI1tTUlE426uu9AwCGsCvvxZj4JyDz3lppsKeFuv+Kov5gjuTjow
	 U9dZ9ZlgMeSYL9lkPj1yPXfItwanPja/uY5tqoHld4Hj29cA5i8OLu3TdXrjLbM4HPWDK
	 pR8PseubiBgmuAUMKJBmvZxiI2uJ8al6jJXKf3gnRKZ1zez7KjrtGqShMjDZliI6dbCP2
	 /K2ze8Pz+qxSdbr7fmSN7jyulGbkVib/y5l+hxKTRgp1PJILkAF6aMbPd154pp6i9VHbU
	 v0OENkJq+06HlvS3WB7cGLVLJnAjEpSAB0VfRlzqD1R0MPrZWmOoOOvPTULxc22KcCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247552;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8UvwvqqL+8oX9fG1K/HLjaNLBYaNBspxDrTwv0Kk+KY=;
	b=dpsaM4S2IWkeq1VycGVS3p1KAyI3Y4KMV7q80aCX6weESECUJBzpAO1gVGiF6sQymi/1
	 bRT30VlArIP9ryVtwkyI4IKxyWgzgYzn5WOdBtzNhGLp4e2tdgpScwidhOFNni9lfX0Z6
	 kh945Ky5Xq/RL5Y6Dh+udsUZQ80iQzS90J1HFvOvu6hIEghZB0pjsFXOhdAVRcEmqoACe
	 OtM4rI3rEYG5kWZhO3W1bYn4jdO2EJuahfTvA0W6OaHc3Xek5zQBoR6v8CfcvHnaXzynN
	 5LxiTPb7RSOFA1lEBSjhuRJpcebJ3ibCQ2+Zvxrtnl7+47JUFxSwNWM6rtp5aLoXuSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTjZBT2t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D1A606A31C;
	Thu, 29 Oct 2026 04:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTjZBT2t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2566D1F01825;
	Thu, 29 Oct 2026 04:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793247551;
	bh=8UvwvqqL+8oX9fG1K/HLjaNLBYaNBspxDrTwv0Kk+KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTjZBT2tT4cqbYkRiJvYGBqLDYKd+opw3aDn2oyfSj3eLWQyUYQ0Qx3G6ljqdC6Gz
	 snIfa5z5zNwyabrVAlHg+jfv4cNZfZZ8xjFtPJEz9iwPtoiGPym/30tmhsy+X5jJxE
	 ksUziWQjDtgjInv8pHeVlKCNk/m8XoSfJODy38LK7ZG4bg1NEInyTIOqoN0pD5u8vH
	 1XGJiUtYMNdP47B7Sh83lGqO+l3YLVfxTSw9+0c0Z8DJ3idR/MFw0rh0GTQnx1njVU
	 emBdeg1q+setfQ5kxeb4Ub8bmwg78tNy+kd3UNoFHXUqR+Pir4+6+XDMz/2OqOGyqJ
	 1DDejcLT9nnRw==
Date: Thu, 29 Oct 2026 04:19:08 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
Message-ID: <auLJPLArIkwFHtRj@google.com>
References: <20261028090932.27053-1-akuchynski@chromium.org>
 <20261028090932.27053-2-akuchynski@chromium.org>
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
In-Reply-To: <20261028090932.27053-2-akuchynski@chromium.org>

On Wed, Oct 28, 2026 at 09:09:31AM +0000, Andrei Kuchynski wrote:
> The driver sets mode_selection bit for each Alternate mode, thereby
> preventing individual altmode drivers from activating their respective
> modes.
> Once the registration of all Alternate Modes is complete, the driver
> verifies if USB4 mode is supported by both the port and the partner and
> activates USB4 mode. In cases where USB4 is not supported, the driver
> invokes typec_mode_selection_start to initiate the mode selection process
> based on mode priorities.
> The driver communicates the current Type-C mode to the mode selection
> process via typec_altmode_state_update.

Hi Andrei,

I'm less familiar with the details of cros_ec_typec and its friend drivers.
Could you double-check the Sashiko review [1] to see if any of the findings
need to be addressed as they look real?

[1] https://sashiko.dev/#/patchset/20261028090932.27053-1-akuchynski%40chromium.org
