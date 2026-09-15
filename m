Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B3336AB5A;
	Tue, 15 Sep 2026 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495165; cv=none; b=lIkDKy1cCMQJvRnSiVA1SNr3/s0XeoUnARC2u5f3KMEx6J3u9T35GJ6fBJ8eZX+W4Dp0ckjwLs80I1qU4nGDmZbnFUaArdVeV1P26CyGlpNDCCza3sBAIa/9OpSoGJSlaUoz1N0A32oVD0EbLbp3iwGDwNupZtwlzTOTwwBZp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495165; c=relaxed/simple;
	bh=tQQxtWXAPI677FQGLNGX0W5LSZ2Bs9QweatEvYMekLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmdQd6rITDMzuHfN4ZYk/vKwFbwhMQtEi1PQ71Fc18zlkZJb7WJgRqOjqDqk+dW9DP6vR2JRIb6hcRSA/TSip+/5/4UED0yd4cWjcHzWQPA494uimMrPD22nPeDgOAqvvM+vCuGxhUov9JUozR3dT6BuLg7TyfrcW1sknUmFZ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvs+H4U1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvs+H4U1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE771F000FF;
	Tue, 15 Sep 2026 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789495163;
	bh=UHDLjnoCxTU/009FWE6CslxwRC3xILnz+kwFnoxuUEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kvs+H4U1+sGWOL4ly4mRjiow4Hq0MQVZ+ujv2kb5KekJCRBlNO5ScXjvpWvLEv3rs
	 lRR+yuDIRocC7AN7/OF1PxObzjyUO7Cum2PB0NqpvLRHsO6vcVL2pgPbX3nTaZhYY0
	 7Fk6SwRE9fIXYVUC14LKWMtWiE87BCVGBD3+KObn4NB0FnKhyDssFFznzwfxnxIqi4
	 38eieE/nfVKc+BNnE7rqt0pkPGlrQcR3a7MTCrpU4cpvWpJW1J4c0PeDJDvcyT/xrL
	 HAV5MWfx1OLRCtglnBYT6IXyUp4iJ56JEAddoHvZJWbbgA6ylNcBgMj0udmQhVSZDI
	 eFD2kaw7ygEXw==
Date: Tue, 15 Sep 2026 18:59:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Krishna Iyer <kiyer@crusoe.ai>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	SJ Park <sj@kernel.org>, David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm tree
Message-ID: <0c4ebe5f-724f-4621-8803-826fbb7e841f@sirena.org.uk>
References: <aqlI5oRGnTQDCgQu@sirena.org.uk>
 <20260915105413.53146d2718de082bdff61706@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZFPXCtXoKlDxuwbp"
Content-Disposition: inline
In-Reply-To: <20260915105413.53146d2718de082bdff61706@linux-foundation.org>
X-Cookie: Void where prohibited by law.


--ZFPXCtXoKlDxuwbp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2026 at 10:54:13AM -0700, Andrew Morton wrote:
> On Tue, 15 Sep 2026 14:32:22 +0100 Mark Brown <broonie@kernel.org> wrote:

> > from the mm tree and commit:

> hm, "mm tree" isn't a branch name.  I assume "mm-unstable" was meant.

No, this is David's tree at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git for-next

As requested your nonmm branches are the only ones left from your tree,
they were replaced by the above and the fixes branch at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git for-next-fixes

Something got messed up with the CCs there, there were two other similar
conflicts today.  I'll double check what the scripts are doing next time
this comes up.

--ZFPXCtXoKlDxuwbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqph3YACgkQJNaLcl1U
h9AbNQf/d6+oitXMqxL1gZKvBHTAkwf+F+ILqyK290hNObNsIk0cPKHjosAkM9S8
nY9vHMhMTDGmuAKhdTnz+q2bKQY+FQSGDD84+rVX6YsxOQzKFeDsNHByfbgILtOj
7qKYbQQ2jTkqWUdH4A2OF9tw4/FY2Ys9o4HPBDbKfg0ozbEMR1Dgo0pu6zy4a2L5
7Jsewrr1Hf/P7IYfR0nCQ9Y3kC9ENL1TAv34bMMQqJcEob+v9uoW5PRDyalCguF1
w4Ti9eBMqqFrG7RqDUeBIYsyw2gAvYpn4lnDq22G6bf4ngQlS2/O/Tl61nB8rEWl
dHofEXRn2cXxLVBaEDUIaFkhMB4Svw==
=IkHb
-----END PGP SIGNATURE-----

--ZFPXCtXoKlDxuwbp--
