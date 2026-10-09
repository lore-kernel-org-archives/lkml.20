Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DD37BE71;
	Fri,  9 Oct 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541477; cv=none; b=jt452N+XMkbhRKmsW5R9xvIloR5qTR3Ef4pffwscgbWdjqSK82hQcnDk6NAAVSTHmXz75jLUzJ37aQZVMd62p7CPC+hEHFYviLWhN6Kofi5F3awmjrCpvDVQVbMltp31VRO5Fo63PcX9NT5OjozoYwcp9+f0TCKkvf4VVgX3CQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541477; c=relaxed/simple;
	bh=krZqmCeIwGUFDimWvSfZ2QgPdJMDXERPq/Dikx/DSDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVNiE6hi1mtwZ2o9ly5UMkyVNhqBCrHQXe8v7BlJC00q8PflK2Hva6HSfrFrICSVC4fh0SB+h7HXXYaPleDVslbivpSssRNIJRw4CeSKaFzG9QqVbmzA0HzK69OrU7Xxyw/oF4ZR5WbCR0ZCvPHB1Tw/CdlBNzgD97jYaERst0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LjoACy0W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LjoACy0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104881F000FF;
	Fri,  9 Oct 2026 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791541475;
	bh=zH4vJ5LQ/ytzaLP3H4bPqjrLKu3sU/6VKEMVPNc8LGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LjoACy0W2Qc08bFPZm6/+izk3B+23tPSO7RpabtjGhVLcTyKQQb1SpSeFMc77afFH
	 KbUTBlHz8tnNNzC0lUt0aXsjcw5j2zn43omuHFEo9XmuWCm5DEKa8v0/X5oz2esc9+
	 YuzoNTeHrH91ROdARN7QrrT7M55XxvmZTVNNicM0=
Date: Fri, 9 Oct 2026 12:24:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <2026100940-deceiving-lazily-9416@gregkh>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>

On Fri, Oct 09, 2026 at 12:05:06PM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2026 10:31, Sasha Levin wrote:
> > The Maintainers Summit reached consensus to deprecate the Assisted-by
> > tag. Remove the documentation requiring it.
> 
> Please provide here some sort of arguments used in that summit
> consensus/discussion. This basically reverts/changes previous consensus
> [1], which is fine itself, but it lacks reasoning.
> 
> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/

I agree with this patch, but yes, it does need a bit more documentation
in the changelog to convey the discussion and consensus about it as it
is a "change in policy" here.

thanks,

greg k-h
