Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4E223DD4;
	Mon, 14 Sep 2026 23:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427980; cv=none; b=s+GEy3osXalDDRQGgGm8qkwCgIuLx4/rhhf3YZ+1hrA9rbVXBgjX/CSrj+dp0xp3DBmVS3be1Gr0zzbqu+emWQMENaxw/KfJ5RcMuCYSfpJ+qEj6qXWy/xzge/kx3msn8A2fSZahqRc3GLeMaUwY9OEL9bOxJ+IFJSL8k17pth8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427980; c=relaxed/simple;
	bh=13xsjcdozLewXmjZiS22lpIIaGJfZOHuzLKmqdrpxAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxSJ4I3bfxrAdFTwSyGYgUVDQnsFvEG3L2TknAGrB710SUHx8dg9vwxDId0rrzsMNFk86/4ISTwki6XoOQySW90uM65hF0Uk87f9H8WAJiiHfmCwHX1W2MOSkjRjrCbj1IaY43L6JcrOSHYg0NZVECU5Cub4KH0g/Krkcx3l7Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctx3DaKF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctx3DaKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686AF1F000FF;
	Mon, 14 Sep 2026 23:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789427979;
	bh=YOjd27heIbJDSbRLAfsWtlZE2YYS5VFzyfn4RD7p3TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ctx3DaKFBY83dpDfeZbhNnjBIOZeLo3ngmFLg9va7QMoGkOK/DGtmuOkPIJuyUaWN
	 mw9vM9eigqwTFdCAcpc1vkzNWbc5lAPXgaXpgI9nK928a0ipsRLg1Ew/m6V/v4Gu/j
	 1esRXqJa16J4H/yficCDkwKT/+qYZNt4+DR5xhGGDG7dberp+O7dbEmtrSqXPoFgj/
	 AiGlugmq4Vw4lBkO/fwH7QjsPC+sbStTV/myiKhRtnhw83GdGNZsGM2LAcnffpb/kc
	 nrS057SmpvEX+2Na4FSLNok9qRN7tXXg+FexDckk86h0wMhgKrfO/3NRIoXjcX3Tba
	 3UNpBqYD2tCEA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 4ED161010AA3; Tue, 15 Sep 2026 00:19:36 +0100 (BST)
Date: Tue, 15 Sep 2026 00:19:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexdeucher@gmail.com>,
	Alex Huang <Alex.Huang2@amd.com>, Alex Hung <alex.hung@amd.com>,
	Alvin Lee <Alvin.Lee2@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Dillon Varone <Dillon.Varone@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Fangzhi Zuo <jerry.zuo@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>, James Lin <pinglei.lin@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
	Ray Wu <ray.wu@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Satyajit Roy <sroy14@alum.utk.edu>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
	Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Wenjing Liu <wenjing.liu@amd.com>,
	YiPeng Chai <YiPeng.Chai@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the
 drm-misc,drm-fixes tree
Message-ID: <aqiBCCgXCnahDcT7@sirena.org.uk>
References: <aqQBUuTVpgnTkQ8k@sirena.org.uk>
 <20260914230828.GA331288@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sBsTvPY3UJ6lou0h"
Content-Disposition: inline
In-Reply-To: <20260914230828.GA331288@ax162>
X-Cookie: Orders subject to approval.


--sBsTvPY3UJ6lou0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 04:08:28PM -0700, Nathan Chancellor wrote:

> f65198b3d0738 removed the use of parse_edid_cea() in
> amdgpu_dm_connector.c but it looks like Mark put these functions back
> into place to keep everything building and working for 0412b1064a3bd
> when the two are merged together.

To be clear my current merge is junk, it's one of those occasional ones
where the constant stream of noisy conflicts caused issues when there
was actually something meaningful and I was fixing up later after rerere
had stored a badly broken resolution.  I was hoping the AMD people would
merge up the conflicting branch or give me a fixup so we had a proper
resolution in -next, I haven't had any input from them.

> Given f65198b3d0738, it seems like 0412b1064a3bd is pointless and could
> be reverted entirely to try and avoid this conflict altogether? I tested
> the following diff and it seems to build cleanly for me.

That does look sensible to me, I might try that next time this conflict
recurs.

--sBsTvPY3UJ6lou0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqogQcACgkQJNaLcl1U
h9CcEAf/dD9DzH4/38pED8MLRoYL5TpPHnOPQR9hyL7llxAJeTKltRbgylHcOXDx
l6HAS2FQ5rriuwIw4qMBPuNEHMb9dKASjkE/uycgAQRpB+8kigRIiURb2LFtOYPu
kpB9TcsCLKKJR5wBVvB3f3kCMbay/6yh6DH++746N8qt/QXPTUsOam+fFt3dk/ht
88WyBtZMmq1zXJdd6FXvlGk0Zj/Yx9MSTCfdgeqecscV4Vu2v+86krH4Y31dJc7R
9kYKscox5S4lEW2rzBj5+ayVE8xgytQvMV6wZijb5r4L0WBcsyQXCbvf1kzf5l+A
F6CxLb6XuPjrYOaICR0blTXiiYtKPw==
=x5A2
-----END PGP SIGNATURE-----

--sBsTvPY3UJ6lou0h--
