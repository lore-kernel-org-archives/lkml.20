Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D22F8E91;
	Tue,  8 Sep 2026 13:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875351; cv=none; b=sYyfgKfbAgANcKUf6BJxKI/SoN1Dkk7kYwy6RUBKjK0mVApXZ+ykWhCMG3C8OScFvSu1Puwj8weHj3ledPlx8fhVRA5hKb8u7cSteOThgL9BTbZ20rZzRMCyXP7NEHEbZn36Y2yB1nPxGWsETyv4AtGlKhUIc3a5D0LEsHDzwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875351; c=relaxed/simple;
	bh=jj7IVMfdTan1AQdrfgxTEhvk/WTuzFtWvCHgAGnhNxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jn8ZLG2AKab4woaz1I/khD0WDzHw9WViLTpLQji30bjS5PKTZ5UyBlFVov8OHnjAHCaTmLpGoNwNuNApa5U4JZfd4eJsWKyNYR2f+XMv12ee1VpkLpzVVzAMWnJL0oSf3wFQxNDaQA5/or9mW1DyNsASessDbcW/2uImArmrLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNKoULhk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNKoULhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C0C1F00A3A;
	Tue,  8 Sep 2026 13:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788875344;
	bh=PM7XyI+VJkKn6Mq5p7XzDI5uzv8QD7Uex8E6dNQ8pAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mNKoULhkF6jVXr8fkFfNNlUTyBWaIImiYnIirVs81RXlNlUa/5vQoZ/PeTwBiKOqU
	 EQwQ6zL75hHbTh4Huzg+uEGGUZt9jCRAkPALbNbaRTMUYpRG1iW+Sf/+aPDkhYXSoo
	 Z1LVy3yy3wffBLNpZ+iQBSIhkEzt4Ecod7morGcfVJFTSdnar5DQeS7S94/n3z+l9B
	 91OKW6mUnplqcr6S7bnulnOju/rRZyrHUNlddd+Usc2RtLuut1Ttv66own1W1eOZAc
	 tQFgYYBlcfZ4dHD7RvIb9udZhD6311bKgI2fLZfkUj9F1mQU8veo0Cr2lq5jvXYrRI
	 K7LacC7xUJo+g==
Date: Tue, 8 Sep 2026 19:18:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: "Liao, Bard" <bard.liao@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] soundwire: debugfs: add root-level peripherals table
Message-ID: <aqASR5r7Bf8tdAwJ@parshuram>
References: <20260902081802.420946-1-yung-chuan.liao@linux.intel.com>
 <6aa4b17e-042e-4319-a3a2-41f7346f3755@linux.dev>
 <SJ2PR11MB8424EEF8CC938A4DD842F06EFFB52@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <9f06bdbc-b25d-4a8f-aeb6-ba11e43e9cdb@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f06bdbc-b25d-4a8f-aeb6-ba11e43e9cdb@linux.dev>

On 04-09-26, 15:47, Pierre-Louis Bossart wrote:
> On 9/4/26 13:36, Liao, Bard wrote:
> > 
> > 
> >> -----Original Message-----
> >> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> >> Sent: Friday, September 4, 2026 3:35 PM
> >> To: Bard Liao <yung-chuan.liao@linux.intel.com>; linux-
> >> sound@vger.kernel.org; vkoul@kernel.org
> >> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org;
> >> peter.ujfalusi@linux.intel.com; Liao, Bard <bard.liao@intel.com>
> >> Subject: Re: [PATCH] soundwire: debugfs: add root-level peripherals table
> >>
> >> On 9/2/26 10:18, Bard Liao wrote:
> >>> The table will let user know what peripherals are listed and get the
> >>> detected status by the dev_num.
> >>
> >> This sounds useful indeed, but does this need to be in debugfs?
> >>
> >> We already have a sysfs entry for every peripheral listed in ACPI. Each
> >> peripheral will have a set of properties extracted from DisCo tables,
> >> could we piggy-back on all this and just expose the dev_num?
> > 
> > It is convenient for the user to get all information on top of the
> > soundwire folder instead of looking for the information one by one
> > in each peripheral folder.
> Right, but as Charles suggested one could use a script to provide the
> information in a more self-explanatory format.
> That script could even be added to 'alsa-info' and make existing reports
> better without needing kernel changes.

Yep, and debugfs maynot be on all platform, sysfs is...


-- 
~Vinod
