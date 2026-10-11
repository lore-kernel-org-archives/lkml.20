Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B94B298CAF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725220; cv=none; b=eMC7N6M8qfWihO9j/ZvYWgE6YWc5D/6aEIPIzSiQhh3cKKa6E4Zrhay1lVs1GiCFenyCip9Flm71GfK8q/kMTI+CbnbqVwvP3t8nqX/CavRyZLjoyrLNYKWMRsuLfyly451IK4dCLOq+EGGQZdIo5Y/QueT0bp9wRa71iZebheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725220; c=relaxed/simple;
	bh=rWIIdv6XkQmAjC485PeFv1P5R+jwR2yX2Rpc7qhktK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4Bcj0ZztpAqeRmrwVubBalpehhvItDsnYkOU5eHOEIlpZ8Jdyfg7MeZmlL0ouamPfyzeWw0KZUuP6Wc78iTqVlPHiTEJ70YJ3p70zkkhBumvib3+GTExQOXFBn4Hpbg/1wG7VRf5SRCLtfkSD8Ya6rk6obb0z7+u1t9+MRJiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGKiMPZm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGKiMPZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AAB1F0089B;
	Sun, 11 Oct 2026 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791725219;
	bh=KTynRFACxYdoGph3mIdkaVUwsIAqbjT7oQo7KP6oejs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGKiMPZmoLYtpq08MOh/fXJtfz5xGv3P+1qZUe6K5f75XLkdO1p0Ba7HqWw7mL6IZ
	 fvzxHWzzxkY3w39jJhRmsIL7bXtsJH5v69iJY0r/VkrWIOUbUvoNFThv9lk8X43Fyc
	 Fp+Rnqka9YKAA2c59acNEQdzyoYBOxLgttlNyi0Tfd6AFEDEV+MNYpYYUk6mS9A157
	 8avE2BOG0yrtiqq/zTwzYeGBrTW5b3HsjZjh1N6SgZlb1bEtan7WEaRMQNv8ndY9Cy
	 SVR/qZsZLxekdsOApZITNhx3xZL0uvjwDLbj7kyGV4Rto+dpg2lLnVKIQGff+FX1RL
	 TN7UmWac+s5eg==
Date: Sun, 11 Oct 2026 09:26:57 -0400
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] regulator fixes for v7.3-rc6
Message-ID: <asuOoUt8XcOJJmSE@laps>
References: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
 <CAHk-=wiSL2hmOhLz6f_pY-SD+Q=2q+swkENsHhWvwtL8az1Wqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wiSL2hmOhLz6f_pY-SD+Q=2q+swkENsHhWvwtL8az1Wqw@mail.gmail.com>

On Sat, Oct 10, 2026 at 05:06:37PM -0700, Linus Torvalds wrote:
>On Sat, 10 Oct 2026 at 16:48, Mark Brown <broonie@kernel.org> wrote:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-rc6
>
>I don't recognize the signing key this was done with - and it also
>doesn't match anything from the kernel.org pgp key repository.
>
>Both of your recent pull requests used that unknown key. I'm holding
>off for now.

I noticed this key change with Mark's linux-next releases, so I looked into it:
looks like the key was sent in
https://lore.kernel.org/keys/31c98cd5-bea4-428c-950f-d38a43709245@sirena.org.uk/
but not updated in the kernel.org repo just yet. It seemed to be a new properly
signed subkey.

-- 
Thanks,
Sasha
