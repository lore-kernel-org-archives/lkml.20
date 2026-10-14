Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE1480DE0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009769; cv=none; b=Srhnj5rMU7FKE8LiC3369lzrMfqcgcQlywOYBF5ZgroZjFWkseA+rrftnaGQS2nxvhGANVq9ZO3SJALz8XnIBYzmMjpjk8i0agzTaUjaxZmC9RyF058uGVpBM9R6//bE2MeEUuJLJcEikdFdCUmPV30b6mJu88UNJEi1gghRz9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009769; c=relaxed/simple;
	bh=qW8kgS5rI2eVoIGCKQ+O8iZLryeVeCK4+U1ez8U1PEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcPHK6MWxYh/YWAF5SsBlX10xoorqC8H86bPHiVcdTHq2tNSqmKsu9Grbsy1B0F6gIpVL/Mn0qUgTNOivCALv3bV/jiaQTNWGnbYGUwvjklbbRY2TH87W2hQwPEawGD8Rd10GStv7rgKuvdoESAXywveltQYu9Mk2fbttWzmMy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=JL1ceMdg; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="JL1ceMdg"
Received: from macsyma.thunk.org (pool-173-48-111-204.bstnma.fios.verizon.net [173.48.111.204])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69EKT7PS005736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 16:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792009751; bh=ehk0EfsYsVO3ok06muLdS+e8JsTP8eS2cHq3e57P5Yw=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=JL1ceMdg2gImpRJz/WRvqgTiH6m7uE95bmAdolTVicC9UHUyCbdVQf+J8xlZYNu8b
	 PIIaM9+kXDA66AlaAzH41eMEyptBjJ82fHAfuPkqSZkY8YU2/W+vgl1MYjcwh1ufjO
	 x+nAOJRqSB1RsttcoG+R0OaSz6nvFRzvJc2rtV5dogiIrbzLGNq780He16aS9ke+iU
	 5//W630gPvQlqJH+YHUolhHiEH5CpMK0FfFxZtTu0kzdmH8I6khqvLImWl6CVX1Vxq
	 T78MXh38WzC3oWBFXMJEL1bxvVLcoOov4bMbATokTi8slU0/QnqftuU15tamdwL/3s
	 zrpVBQ0IgONdA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 2F7622094AB0; Wed, 14 Oct 2026 16:28:07 -0400 (EDT)
Date: Wed, 14 Oct 2026 16:28:07 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net,
        ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org,
        skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
Message-ID: <as_j3DawEZQWA4ls@mit.edu>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as_Cr4FhzyAh-kC4@laps>

On Wed, Oct 14, 2026 at 01:58:07PM -0500, Sasha Levin wrote:
> I'm following the specs[1] for these skills, and my testing showed it works
> fine with a few of the more common tools.
> 
> We can open the markup language discussion, but I'm concerned that doing that
> will break some tools logic around importing these at skills.

Most modern LLM's can deal with .md, .rst, .txt, and even .html
(although I don't recommend HTML mostly because it's more
token-inefficient and it's easier to insert prompt-injection attacks
in the form of 1 point text that is a lot harder for humans to notice).

> This was one of the reasons I sent the first version as agents/ rather than
> something under Documentation/ - this really feels like coding in English vs
> writing docs for humans :)

My preference is agents/ because these skills really aren't docs at
all.  This is especially true if some of future skills invoke python
scripts.

						- Ted
