Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254610;
	b=oh0wkcYprIIavQGNYK3zIGANbRpVATOAcDVWkjQOd5lcrSuzB0qeMGgIsRxa+RoIc9cn
	 41tI+jlB9GnOu04FdLm2i8+wla+WXOzKa/sBx2Geg65XoI5iFGFFUL7CLp7si97wIz5d+
	 e9LAQvWB8jCzpFfZQg8GjKxTw1YzwW35+/1xDmPVEimctzTcbtvIAfTYy+F4OxDFoq5sm
	 T/U1BLebad9nFfNQt1iyHUjKaiW8Xh5UfVkiN8TXGnz/899gQhlocbK5/XOUj9vc5TqiL
	 3Oc113nu0n4E7zaBxxuhobT9N9H0AAtWrbCjv72ibWNliznG//2EmDFhmBcLBUvpouQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254610;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LMPVJCyKN1w9GY344qkoEP2t/rXKZG9B3wcnLo4MkY8=;
	b=pQeXBqHXqVLXCcM04hqrFcWpEB4CmgY7SFhcEwMwIoZz2StyOIIRv+OL60LeeQl43wyz
	 YoxOeX1C/GBKOJ7q63BEtZ+cnGyHqEtVHFE4JcUPB3B9wfPyIMwtqSvVYer5TX9mTmVuF
	 mADosqT5kxm4SqVgDleQYUeOn9+Q0D/MOBFetvWkUT42nHsmc68koA9a7IUr1yRKivL7A
	 g3ULiER1V/m5Kg3/TnNZ9pDifx9yC9Xn0lepZBzBnpRWhAOSgb3RSdLHCLFDs6fS9zS87
	 +1bgdzghQXTuckOn+4VMdkCvCKH7Fn8dLV8WiFbM1bv1XZbcMXBFrDs/adl9Gjwiieg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bP4+9V/P";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC0606A334;
	Mon,  9 Nov 2026 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bP4+9V/P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCA81F0089F;
	Mon,  9 Nov 2026 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254609;
	bh=LMPVJCyKN1w9GY344qkoEP2t/rXKZG9B3wcnLo4MkY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bP4+9V/P53s0Jewms7QsWP4WbJEHM9DfHgVHr+XAEwHHuEcm3TzLEKEgLXrACdsDh
	 Bc4m3AXfsbejjH4gg6aSFS7eZN8h0TzHqyS+8czGkDJr3e0/Qmse21ViMcjfl0fia1
	 UCZEDmeUXzpB3LNiidA7sK6Z93YFZLfwNEHo5DC52H9dJIaxTQbqvdptdCr5+3f+1h
	 e4vnMahZwvXAlwqc8+eFsvlIM+QZE+N9h5rScXvhO36R5rnzkumWgIiNIk4BMzugov
	 kXPNOVCxnnu6C8jGeGaPj8OPRG85s8fT1nfkqxZFlBYQS19P3svtdbYWKPAEizpGFB
	 ELp7O4/NBRq5w==
Date: Mon, 9 Nov 2026 14:03:24 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Nov 9
Message-ID: <20261109200324.GA950470-robh@kernel.org>
References: <avHgrm2PmkCsLyDT@sirena.co.uk>
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
In-Reply-To: <avHgrm2PmkCsLyDT@sirena.co.uk>

On Mon, Nov 09, 2026 at 03:03:10PM +0000, Mark Brown wrote:
> Hi all,
> 
> Changes since 20261105:
> 
> The exfat tree acquired a conflict with the origin tree.
> 
> The drivers-memory-fixes tree acquired a conflict with the origin tree.
> 
> The imx-mxs tree acquired a conflict with the origin tree.
> 
> The sound-asoc tree acquired multiple conflicts with the origin tree.
> 
> The mfd tree acquired multiple conflicts with the origin tree.
> 
> The spi tree acquired a conflict with the origin tree.
> 
> The gpio-brgl tree acquired multiple conflicts with the origin tree.
> 
> Non-merge commits (relative to Linus' tree): 2367
> 
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There is also the merge.log file in the Next
> directory.  Between each merge, the tree was built with a defconfig
> for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
> an arm64 build of various kselftests, a KUnit build and run on arm64,
> and a native build of tools/perf.  After the final fixups (if any), I do
> an x86_64 modules_install followed by builds for x86_64 allnoconfig,
> arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
> sparc64 defconfig and htmldocs.
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 436 trees (counting Linus' and 135 trees of bug
> fix patches pending for the current release).

It looks like a number of trees are missing today. For example, clk, 
reset, and i2c trees have fixes, but not next branches.

Rob
