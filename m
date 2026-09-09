Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C9566C48;
	Wed,  9 Sep 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961042; cv=none; b=VzlXAPHbppSxK979eE6F7SJQsmHelLqGd54T0mwJ+kaTA582Yknf26n4CyDmxXqaUsV9GqOGXMtqeftQEYItCLmyJ4FDBiGSf9jA3Mzw5pyrBtFbz0Ji3QOvQHFJskutmlGt11MUHxClMJG3wokfoXyFNE4SHYVyfZcHsHvSYyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961042; c=relaxed/simple;
	bh=65+d0Rvfqb0IQay+3uI+XpyGUOqAJEo9npG3XxnaGHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAQH7e3TI/mWBigDTKN+aN8GGEFq0+hSVK5oyWHsFyOz6BD/0taytWScOBv2wGYNP+xqCIvayxoLgcT2J/nDBV47GBHUWHWdlQwpKSrVySw/9eVn5U+KhNHYaWATkFqtCAnX4Il5v/hEKUjyz/OOe21FhXC/9n38r0OodMdCcLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpaCoghm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpaCoghm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2341F00A3A;
	Wed,  9 Sep 2026 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961041;
	bh=uW56hvLHa68R6xdKs+rfDiy6VuZYV0RW1WRfUgtnxWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OpaCoghmMaQySseSC7Soc4oPCVOvTk1LTLSnOrClIWVER5Hj1WdL+0Do23/g73H5O
	 zrhk5HM7vSj3dit+ytw87v7mVRRQMvYV+s5EQ6ySecoEcjVCk40Vr9NZLMthxHiR6y
	 qe1A6UgbQk1Zn2GatDZ/xpjkDsK6VCPhrcUpIg7JFeWZX6OBetTfgJi+9/KYBZ2kci
	 p75dyzMW3H4IOGkIZ9hOAztIoTeVknKWA7rXrHKuWErPKUAspLRLfIbD2OLbx2FRN/
	 JaPMmdgZeM/nTynoYScbgQkD8rwQ/RmMcmRVXFGCAkm4IN047/kxUfRR1Bo6XC+zpk
	 dHV0r2wgTGJHA==
Date: Wed, 9 Sep 2026 19:07:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the dmaengine tree
Message-ID: <aqFhDWWHbhg29FRY@parshuram>
References: <aprsrJt107UkFPZB@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aprsrJt107UkFPZB@sirena.co.uk>

On 04-09-26, 17:07, Mark Brown wrote:
> In commit
> 
>   3d2c0d555d34e ("dmaengine: sun6i-dma: Fix use-after-free in error handling paths")
> 
> Fixes tag
> 
>   Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Thanks, my script missed this. I have fixed it up

-- 
~Vinod
