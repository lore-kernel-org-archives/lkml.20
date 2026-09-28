Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4184E431C;
	Mon, 28 Sep 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607985; cv=none; b=BTy5t0LYDmcyOdAInQsFNNCr290hX7LLZGrE3e8bHymebMPOzpPkV43mrJXtYOdXqhil3rWCa+Wk+hgStWeIL+4dILA0OICwDGoxJl3TK+RbWT4D4CeZrBJSIwK0R769AOoKzy8yY4uuCJvaTbwDYH22rYW31DDLrmjflvBnh0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607985; c=relaxed/simple;
	bh=nJAjUMntL0+3YxTbP4hGwOKq1p3SF4zI58hh8DGGWAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJu7mtgBObI+vCdVTof91EJv02DwGvbtp9DGUKOGf/vVXx82kD+uPvIBHiYxyKRs115kHIcc3Yk4GgeconPOGf3m8rNlLgBFRHrF40bhKZmQUIvKdmk+7TxpyoJhJrdbZH/+gdTdhgxvV6fIvIXPbW6k9ZurKCRv7jPB+jw4w6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxl4uvj7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxl4uvj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA151F000FF;
	Mon, 28 Sep 2026 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607984;
	bh=0Onsk/cNBu2snz5ivlHPH+8znvaJFwtXC7DVbyWB1pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lxl4uvj7p+p3g07vY2TcB2MI47U5CSau9WMkr7xpKT2xAqZG0rf3KsqGKaGl/dXt3
	 c4hJ4M1B96gt69t7s4MJr/hQrERnIRkoouepZe8GWzbD8GqsnM07dL3OPlTDh2fP84
	 RW1YRsMzAhF6yj6HE0BvGwJCxnQR+JGQd4I+kpfZSac+xtO98ZpdTJFzj4C/8toxo3
	 UEwtAjcgarpeGgGV2kEu4vcg2xeI/09DKAQ376PTfr95RSTL9CrfFWWVtxJD8iMRvS
	 BSzKCNqRYXDW4E1kNoYrBF4Ktl4WEoHsS0S2IVl4ok6PNKPlTieUM8lPUwHEAaondB
	 WxSm3G+WeOBcg==
Date: Mon, 28 Sep 2026 16:06:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Quchaosheng <quchaosheng000406@163.com>
Subject: Re: linux-next: manual merge of the tip tree with the jc_docs tree
Message-ID: <9acf3e81-a5f3-4bc7-bf5f-32899f1a2021@sirena.org.uk>
References: <arpymyOST1apXE25@sirena.org.uk>
 <2ef4f859-6cc6-4dd0-90da-8bf57b519ab7@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zRaS2zKzFa/ZheB1"
Content-Disposition: inline
In-Reply-To: <2ef4f859-6cc6-4dd0-90da-8bf57b519ab7@linux.ibm.com>
X-Cookie: All is fear in love and war.


--zRaS2zKzFa/ZheB1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2026 at 07:45:54PM +0530, Shrikanth Hegde wrote:
> On 9/28/26 7:28 PM, Mark Brown wrote:

> > +++ b/Documentation/scheduler/index.rst
> > @@@ -23,6 -23,6 +23,7 @@@ Schedule
> >        sched-stats
> >        sched-ext
> >        sched-debug
> > +     sched-paravirt
> >   +    sched-preemption
> >        text_files

> Looks correct to me.
> I guess it clashed since both were beginning around sched-p.

> Sorry, I should have mentioned, But it didn't occur to me when I sent it.

Don't worry about it, trivial conflicts like this don't cause any real
issues.

--zRaS2zKzFa/ZheB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6gmoACgkQJNaLcl1U
h9Dn9wf/Y9XiMIVdmgpo03T1fKezBbyF2dL78o8kSKZT1GzgzsqdhKN7/mu4cfKw
PXBQXMdP3BpERbWRtQPV6O+XDceuUB0uqfL5X3ItuF9vBEcaF9sRTXshPrzaCXAE
61+BUnvV2A6GjL8/+kSuCnFClc5qelvFG6Tzy3LqwIuEINKbE2eeWC0KMOCigxzo
NY1WayECr8gMMBpClRqQ6xtxYTo4xTtQyz2AiVmODgny9vzUrIN5g6xl0F5zvygM
Fo+ggHXwcdpRHZ4Q03NBSLQXmXgrhlIxKbssQhaF6wXa0bPE9huf7kwGKTXW7q/0
Cp5uUF1FZXecs1nMfITYKKP6R1RITA==
=hfhM
-----END PGP SIGNATURE-----

--zRaS2zKzFa/ZheB1--
