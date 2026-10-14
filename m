Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9483FF8A5;
	Wed, 14 Oct 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000155; cv=none; b=swFNEed5Hp4YIrTTdgClaSqEkPrRJBrBfILo7+mdAQTecmFrkp7tBUJ1NVO8JMiSHKM5aybKWH25LSPkbCBfVxNxGxpVtdGAkcJSHbWH9zd2qX8matZrSigvGQ2Wej4FoNwuR0JE9xT7eZQcoTCfOpZWztMYhECoz48zM0SUiM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000155; c=relaxed/simple;
	bh=HVEwR1NusfXDH2gZtiy+6THgNw0LWNTEYzJ/BVTB99A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dT1TT4TMkPn/hcrMFR/q2hWAzwkrDZknWnhwc7L5sNeoswqeO6mR/WQshAOTamKekxLRlG/k4fFFZ9Q7thNraZk/MKyPXPvAPQAROlNFy4CDW9v7DH+MUW2QmNpSiPgesexIetTD6m8g6Bx7j1wjG6AS7rWvK+Spf7OsCrTb4Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjBTku2C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjBTku2C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2A31F000C4;
	Wed, 14 Oct 2026 17:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792000154;
	bh=HVEwR1NusfXDH2gZtiy+6THgNw0LWNTEYzJ/BVTB99A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YjBTku2CyZA0MXqd7tTFmmGVK2OFo97NnGxuv2FeutEOkyzSPzs1VIecdfyxbJEMA
	 G24b7cOE4lF5AelC6aLupmgV2BLdlnd+bmf3X6Nuyv+783TNCCjuAIAtH6Jmw90QoU
	 iULvfOjq5d0FtOSQbTHVMyR/SWWk08UpR0fBktSYPIVzCiX4pZPcTikLZEFHezFOSP
	 h4u3QXP2ZzaRMTxnGyPVywvf+WP5Lz7uuWW7rqK/GgB0hn2Sn1iRnZTbe5fseu2a8j
	 qorZQwdE3GVUVCIXYxotOELeMTavP8uylahNE4HAMh33tcNaS7uflOSq3bovN0jhD5
	 Ut/7zBES06CMQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: sashal@kernel.org
Cc: broonie@kernel.org,
	corbet@lwn.net,
	ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	tytso@mit.edu,
	workflows@vger.kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
Date: Wed, 14 Oct 2026 19:48:38 +0200
Message-ID: <20261014174838.114990-1-ojeda@kernel.org>
In-Reply-To: <cover.1791499378.git.sashal@kernel.org>
References: <cover.1791499378.git.sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 08 Oct 2026 18:54:51 -0400 Sasha Levin <sashal@kernel.org> wrote:
>
> I'm not sure whether this belongs under Documentation/ or in a separate
> agents/ directory at the root. I'm open to changing the location.

Either way, we still need local setup to use these skills in at least a couple
popular tools, right?

One discussion point could be which markup language to use. If we were to do it
in `agents/`, I guess Markdown could be a possibility. But reStructuredText and
having it in `Documentation/` would allow to have it rendered and to "link"
things more easily, which could potentially be useful for certain skills.

Anyway, I tested it with a simple case invoking it explicitly, and it seems to
work, including one where it was not an actual bug (it complained about it :).

Cheers,
Miguel
