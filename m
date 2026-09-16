Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BC4AB1A0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552430; cv=none; b=HVP84Do+0Xbu7pKgsLS/mgnPbYzeSsLacndVVIOX6Yo7h5I1yG3u+yuO5fwH8yBrs1OWyqnX6TSXpM9R9KuyAA+jVypY1F551ZVoTVyxETUq/BikUQDb64WscmYXG4B/iup6i8AcTEUgc+LA6HFM/6LSSVuZQ6aTzKFpBC4p+gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552430; c=relaxed/simple;
	bh=lxocw8UJdi0kfwxQHtMgH/1lbyEtj6cBRi40qJLiw20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtnKA2npVNCQVsXxWAQ8DQ8Ikogb6gH/ELWjBlUpep0b0UuOZrY1gqK9/wL7GXI+3rktwU+wlmUoMCLgKO2J5UlUHQ6gPqPYGEeav5Xr+mB8vbh+0kW4ZS/evVHjq2Gpfz4AIhFey0Wh+Q4JzMgTrPt5ey12nihqgueI9KyKzYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=iLHwqWnU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="iLHwqWnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986371F00893;
	Wed, 16 Sep 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=iLHwqWnU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1789552406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xu4ZxYAW3LZUG/XBl95d2MgIx5kxVzqiTxW9XauCHMc=;
	b=iLHwqWnUXjQt/7bu3EgSlyBJbOwzMPxm+HQ9EyLsq4E5lDQvSR7fYcstiKjN6LagUVvZA/
	L/hpNV0PyU7IuXZxLBs0YMH+fuOmtv4EADDjklnV3a0cADAFVwwOVh0bp4EDZv1oczttUy
	+WRNBKJ2amZn81xjq/Qw2YYBYrlMYI8=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 3f16d0d5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 16 Sep 2026 09:53:26 +0000 (UTC)
Date: Wed, 16 Sep 2026 11:53:24 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] random: Fix vgetrandom_opaque_params kernel-doc
Message-ID: <aqpnFMgAKn7RyZmz@zx2c4.com>
References: <20260909063744.89918-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909063744.89918-1-kmehltretter@gmail.com>

On Wed, Sep 09, 2026 at 08:37:44AM +0200, Karl Mehltretter wrote:
> struct vgetrandom_opaque_params contains size_of_opaque_state, but its
> kernel-doc describes size_per_opaque_state. This leaves the real member
> undescribed and adds a nonexistent member to the generated
> documentation.
> 
> Use the member's actual name.

Applied. Thank you.
