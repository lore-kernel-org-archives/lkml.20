Received: from mail-108-mta150.mxroute.com (mail-108-mta150.mxroute.com [136.175.108.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC774D17AF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545813; cv=none; b=V3f9lVtBj06svaJ/tD4bqum5kcrCQkgyjzSzSnpA4QWc3gzMrP+vCQKNFk/EbVZIlCyRzo4Fo1lU4f7LkT0DP9jpLk+Fsvg/+nT0AzEG3B617y8n6i2C8EQK+Kns9Gx/mVOZjnEFztejS0ZG5yUjtGFhbwT61KMJwyjx+Cw1Zoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545813; c=relaxed/simple;
	bh=72mb7nDzWwJbkkQTYO35saRlKYr1LDO6zGEKsn74JQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNf7eYvxhXc1M2BlP0gv4TeSMGhvpft2JuJ/FUT2BvT8X8y8wxsETS0hYG5BgIGljikztYvOxqqMZPPMwVVB64Lvt7raZlOxocdnZPYT2CWmN7Y0LyRee3qsjIThj5Nbs/iRLoLg4cY7k/yJIJ26jP4SxekgZnwUOnBkQ75pA30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=JiQfopHq; arc=none smtp.client-ip=136.175.108.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="JiQfopHq"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta150.mxroute.com (ZoneMTA) with ESMTPSA id 1a1207374be00028b2.009
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 09 Oct 2026 11:36:39 +0000
X-Zone-Loop: fc265d78d85525497cd61ac2ffbe90250f3e56d0bbc0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1WzxT4EeKabTRMvEusYxWV+LdwJUl+4VKsG0DruUDyI=; b=JiQfopHqe0hsa+NxuKZC9XnAcI
	MhLkXtp4c97TencxVnX7W1SKkieszlUcY2MdxwQ/bZ9Yszt8oRvYTB/sV9CB4T0VfK/ZT+k9uUJRY
	Bx5PnIQ3+ZTxBxjX1Ish6zQvT9717AwQMEK6+ExkhdFGJRSYO9pRTRcTJBWesInjnHErOR8yMr1gx
	rX1a0Pkuc8IzaX0+O1Vh0EUl8AMS5BLPN142XPU5PV4AGsqxCWOwocBdU+zQjyITj+NlkGAJEB7s7
	wq26StDciAXl4EtW+SG4JlhUPkAmRnWoUduo6PUZRZfBYYtBXCRtOOMb9uuZE5ZhXmFHY4rMU0ImX
	tCaV5LwA==;
Date: Fri, 9 Oct 2026 11:36:23 +0000
From: Richard Patel <ripatel@wii.dev>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kees@kernel.org" <kees@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/3] x86/shstk: ban ia32 sigreturn when shadow stack is
 enabled
Message-ID: <asjRt49FfzdP4pxk@wii.dev>
References: <20261008201610.1003569-1-ripatel@wii.dev>
 <20261008201610.1003569-2-ripatel@wii.dev>
 <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
 <asgQDlpnDwu04oZc@wii.dev>
 <6deab6fec99c65408a19b9036d67ce7f1fab54b5.camel@intel.com>
 <asgdlclj3MgtGrSp@wii.dev>
 <f78ade122593ecdd686ec1b29340b0124b925c48.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f78ade122593ecdd686ec1b29340b0124b925c48.camel@intel.com>
X-Authenticated-Id: ripatel@wii.dev

On Thu, Oct 08, 2026 at 11:11:41PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-10-08 at 22:47 +0000, Richard Patel wrote:
> > > But today setting EIP to an arbitrary point is fairly easy. But even in a
> > > future
> > > case of IBT enabled, shadow stack would still need enhancements for the
> > > normal
> > > 64 bit runtime to prevent this. 
> > 
> > What do you think of creating a shadow stack frame on signal delivery
> > and popping that on sigreturn? I suppose that would need siglongjmp
> > modifications and probably break CRIU. :(
> 
> Yes I didn't know they did not parse the shadow stack signal frame
> appropriately. That is unfortunate. But we can still evolve the shadow stack ABI
> by adding new modes to the enable prctl if we want.

In the case of CRIU, they are not only parsing, but crafting their own
frames on the shadow stack. I suppose we can keep the kernel's parser
lenient so it works with older CRIU frames even after IBT enablement.
