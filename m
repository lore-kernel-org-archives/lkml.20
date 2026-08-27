Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE341DDEC;
	Thu, 27 Aug 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824233; cv=none; b=Pcy7qVIHm2V9UjoaPRlXxhy5sUZpmobCo1DAt2cjUMwxMhzqb1fUnokujhTrG9SU0OomsoPVcfs6DvikfVijxqA0VEo2MRGdgWa54UABOzy4mRSubZ27J73D7maaTd+HB1tzMYfuK70B5vkmrrJaYMeYwVz/3oc7HWFVE7U655U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824233; c=relaxed/simple;
	bh=WLLOWcSYaZlmj8u2C+KiUcseFA7ic9vl6LdYrFo1y7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBkmXHfud1c3+Grnoqee5yL8b9p/kc7elKns3FkWWKHYxvFFnrlfkkM3xlX96Yt9YDIYxRnFhoKIWco5rukajNu9aqrdSBfrv3IFIh733djeiHJ+dP1yJPBv6NdFySZaejvWAEm2fYBL5obtBSdyR1E7D1u7pye3+q81iYx9o3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=WZxb3J/r; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="WZxb3J/r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WLLOWcSYaZlmj8u2C+KiUcseFA7ic9vl6LdYrFo1y7c=; b=WZxb3J/rx6sCKfuNUFdYhGGwRo
	sNifhTFmluUCXNt1OWSMchnlGH3cdwQqfOoGO+RRf+X96eCIK71knVZJMVyEVOxIGM8DSNIUUjRgU
	oSWH3AN2By4o7GZO/Oz3Ymp4L5CVJ5YqtCaGO+hMIrzAeWrTkceWsYosS+/zXiEp2mkrx3uGizK5k
	i0LBVsXF88ghkFHPGzGBqnRPYQvKM/HqMKdeDHVV2XJx+qZ/vrFAk7PZTNN+ybl2ODAbHLShojp/d
	qeYfgtkaOm8X/QIKbqzXa2TVmBeO7r/TtIPtnhH6woZJ4iBqJPblFk9PSMk5qTru7QEO066fvJizM
	agNq6c1g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wzWkF-00FuL2-0j;
	Thu, 27 Aug 2026 09:50:03 +0000
Date: Thu, 27 Aug 2026 02:49:57 -0700
From: Breno Leitao <leitao@debian.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 1/2] x86/mce: Rate-limit the CMCI storm transition notices
Message-ID: <apAHMQckYRyVx5OS@gmail.com>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-1-7a465c708d82@debian.org>
 <SJ1PR11MB6083DE19F9E5E6BADF22A237FCA32@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083DE19F9E5E6BADF22A237FCA32@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Debian-User: leitao

On Fri, Aug 21, 2026 at 04:18:42PM +0000, Luck, Tony wrote:
> > One host in our fleet logged 9970726 "CMCI storm detected" and 9970734
> > "CMCI storm subsided" lines for a single bank over four days, which is
> > a bit excessive for all monitoring purposes.
>
> Marvelous use of understatement!
>
> Patch 1:
>
> Acked-by: Tony Luck <tony.luck@intel.com>

FYI: As this patch hasn't drawn any further discussion, I'll send it
separately from the "panic on MCI storms" patch, so the two can move
forward in parallel.
