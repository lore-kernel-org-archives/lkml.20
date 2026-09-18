Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCF6511230;
	Fri, 18 Sep 2026 16:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747584; cv=none; b=ApCp+eKCclM9J1Ihqyq5eT9RmA1vh7bMjJGWw2XiBJUFqRjcxL5BLhHQEu1yJgIzKLuuqoKRCf3sRHsGXtWYcJ2NqCcPFE+6gVQ/MljwF6IxnKrxF4e3kgO6ZK0FzeRa/9TvNLtfuCjAxgyvVF1W7wB2s3Lg52HNagrvBgEEni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747584; c=relaxed/simple;
	bh=pQG99sEvZrzC/b4pNYr6YvveDw7w/AsRi71Sph1eZNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDGieDIQQ7kmdNQh9t8F1xI6Dz+seWOfn0N/we/XV5Xp2Zp2CrhxAnHDB9Xx+bt+f5yAk1PiK0vEUEuqYjA2uuubvjmu8NYNE5lcCOwwxcZyDnGD7EblXlNU9TQgfFBSXa/GZu0V/ZYZnuzIxSJfeQavnDMoGFauQ87F+o31geA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsbDNjMM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsbDNjMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802EE1F00898;
	Fri, 18 Sep 2026 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789747582;
	bh=DgQUG8pDvuuNYYAGh6Yto+5SQzXMUOTzv1Daej2EEbg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=lsbDNjMMrROkkN2lGaVT0XwcQua/lgqnk2loQCtCiMFCRycl5mDb0PA8FXtQEVxGm
	 9x1gK4nubI74wLGYzNzHCL7EQwM8EMcrmsGqXnaAqYjYUtEjJbnaVwFmhD8v//Wwvb
	 DosXYsXJ1VhZf8RGjCvmvZJbPR49QpK5QYMQF8y7mD9pJgp8zoZ2ou+8X3IiMWqPl2
	 Owy07JFiXceEJMdUOT6IQHl6gN3Jpw/saOLR9+lYvM0ACZnK02ywYTXPTiJsJPuj3s
	 gCgnP3wAFd+gINAOzlyovCdkHY4MDJCcxaoyYL/RMHPnihggbK2+cVNmmVeLDeAFbo
	 bK0w0gZbjms5A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3EAB7CE08CF; Fri, 18 Sep 2026 09:06:22 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:06:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rcu tree
Message-ID: <a6f5c2a5-f533-43d4-a8e7-62b26b263e84@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <aq0bIgOyDwt51Lot@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0bIgOyDwt51Lot@sirena.org.uk>

On Fri, Sep 18, 2026 at 12:06:10PM +0100, Mark Brown wrote:
> Commit
> 
>   3819612d99983 ("doc: RCU: Fix s/strategem/stratagem/ typo in Requirements.rst")
> 
> is missing a Signed-off-by from its author

Good catch, and apologies!

I will kick this patch into the post-v7.4 pile.

Costa, please re-send with your Signed-off-by.

							Thanx, Paul
