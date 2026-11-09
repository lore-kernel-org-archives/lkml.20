Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228223;
	b=P1Z0uvMTI4cspDKKwa9cKt8+6pKUN1sm7X4qZ7mQxhbYMuPplCeYR/jxXj0wWVr1t/4t
	 fw50UMcYo4tOIkY3AE+cgGSUu99ZxngUcfqud/OHuMgAYHXua7/krU75Tfshwzj3hUwBf
	 FSJGbgT+xwMbEWd0iBO9lqZhZSb5bINbfPjYkklAUxYhwrbbEi/WNyUX1T69NOfQ6GrEn
	 fU7YesoeyJjlnzA8Rwe7E8NRujUFhPZLwEM1fnnR8hgzQMSPCeBYjniHWBSmrZmSlg0pN
	 Ti96YosHbHSgwsSfnLiOHJaNpMbPagb6SQ1JCYArqMMHeI2ENX6bt0+nyhiHBPbCQCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228223;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a86PC/JlFhI9QzWc5mWdTvSDfxy09rYrpKx10NN2IkI=;
	b=ZYqpDotyB/bPPUtn5DcR4/OPZKjpwP2a30bWjEcqI1i7yqEOipzm09jYUFL2O3NGFqvb
	 +gf6c5zUeF7j93qKIVQMt/6ulVwzGb7QaGgCIs+f77PvQzd8F6+rpQILlUR+D58h3aiMs
	 zCKfvcf91XwRkO16GJZk56vLrLEKdhT5b8KJChTK2gZcYs0uBR3WTntzpy+wk7LgiN2bw
	 SH7VEyyVRDQt2r/8rXqv52TpYQZXF+3Uef74LCCkbJmVxKG9Vs6m2JRBQXZ/r3TSOjK87
	 wp3VpV3bwHhxSyhtQSctraTl9gCR5Rq1rCnG4NvJ6Ha5PaTyHUvF2ixEDbzH38ILXAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9pIWTYv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA356606A322;
	Mon,  9 Nov 2026 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9pIWTYv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8375C1F0089F;
	Mon,  9 Nov 2026 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228222;
	bh=a86PC/JlFhI9QzWc5mWdTvSDfxy09rYrpKx10NN2IkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9pIWTYvDBscsjoqdj+ff4Jrjv6tMYkVR49IQ9UXzyvbUvrDtRsv/H8kxdjV1d7cg
	 lc9/ovyHmXaqFYFvXyM5pN0KNogDVV+fA6Hg7SY42xTc6YFvu+rLhwH2qn5ke26XAr
	 /LkJhX0VEiNl0EqUzQj7rfm8Xtk5SzCpD1/ZMYNv6PvGcxWsGbEfsOC8quBxap8ZgK
	 TsyWXMstC6PGwzmpwKpKXSWY9fa8XOXPXXKrHkyH9aqdcZ9Vrwas9pIgzuOWdbRzcw
	 dFpLcTkcD1MR+aZTF5Tj9L66S//Azf1T/Sa99E4PqL4JFMMQMaEQO0k+eprsDY2G2d
	 riJ3f4MCuW8AA==
Date: Mon, 9 Nov 2026 13:43:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Message-ID: <20261109-burrowing-sloppy-bumblebee-f2d7d8@quoll>
References: <20261107060549.598466-1-artem122novak@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107060549.598466-1-artem122novak@gmail.com>

On Sat, Nov 07, 2026 at 12:05:49AM -0600, Artem Novak wrote:
> The Synology DS212 Device Tree lists "synology,ds212pv10" twice
> in its compatible property. The corresponding Kirkwood binding
> also repeats this entry.
> 
> Remove the duplicate from both the Device Tree and its binding
> so that the documented compatible sequence contains only unique
> identifiers.
> 
> The compatible ordering is otherwise unchanged.
> 
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
>  arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

You also should have Fixes tags.

Best regards,
Krzysztof

