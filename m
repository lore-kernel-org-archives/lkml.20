Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6E03C4163;
	Sat, 17 Oct 2026 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224317; cv=none; b=G48ZD+KfUool3Ei9ejItleq7YbTe65sou4v8l4S3638UysNTiNtN3ac5HCtdkIhQ4Oo1yGauPTiLkFNEUpt2MdlelyUpUcl5z+tg8/FXmTWrsyqXbUp2Z5mN+0HXq6K0q8bAgeVQwYxr+aoi2WIrBikk2ngVQA1fOIkO6w5KEks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224317; c=relaxed/simple;
	bh=6v1c9XZS4bixBBqUUcfJEteCcdTXTXnQcDN+8g3SW5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mf0nV/E887Jlabv96XgykqcD/x/0zl2PIKn/DzbfiEbnyAZNr4XHiFpeDVoCdE3/KyTBX9geTd/ovJQrKo9uW3BVi7pPsIQocvl16Ar93suyUZ7fc5K+JHVY5JrY2Z5YDUNg3u/7vsb2c2PLb2y1l1LZhOoSWMLjjf3OZ4ZRNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pF3WD4qs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pF3WD4qs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF541F000C4;
	Sat, 17 Oct 2026 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792224315;
	bh=pYaLRk3IaoCXdaGwBn5EufmNnHO0PU354pzQex0/BOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pF3WD4qseeZzl6s4Pk82VAawF+goGtZns/w0a01evta0Afl94Q3U6jqGM+LBqIQvP
	 i7xERIBtkvcMEC3W1FsWNcdwQ3WJhwaD3BboKgvt2TTWJZ8G+vOrFAi2RyaU0sJepf
	 KVOdOgZQkp+p9U1+f6p36wxSx0nHEhNM5E4Gi04c=
Date: Sat, 17 Oct 2026 10:05:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kyle Farrell <kaf@nwlink.com>
Cc: linux-usb@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/2 RESEND] usb: gadget: uac2: support explicit
 channel counts
Message-ID: <2026101742-ouch-sensually-f5a4@gregkh>
References: <20261016162534.384844-1-kaf@nwlink.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016162534.384844-1-kaf@nwlink.com>

On Fri, Oct 16, 2026 at 09:25:32AM -0700, Kyle Farrell wrote:
> USB Audio Class 2.0 permits up to 255 channels in an audio channel cluster
> via bNrChannels. Independently, a channel-location bitmap is specified via
> bmChannelConfig for up to 27 predefined spatial locations. Setting
> bmChannelConfig to zero indicates that the channels have no predefined
> spatial positions.
> 
> The current UAC2 gadget driver derives bNrChannels from the number of set
> bits in bmChannelConfig. Since bmChannelConfig provides 27 predefined
> spatial locations this limits playback and capture streams to 27 channels.
> 
> This series allows channel counts up to the UAC2 limit of 255 without
> requiring predefined spatial channel locations in bmChannelConfig.
> Existing ConfigFS channel-mask configuration continues to work unchanged.
> New optional playback and capture count attributes allow the number of
> channels to be specified separately from the channel-location bitmap.
> 
> The series is split so that the shared u_audio infrastructure is updated
> first without changing behavior, followed by the UAC2 functional change.
> 
> Patch 1:
>   Pass resolved playback and capture channel counts explicitly into
>   the UAC1/UAC2 shared u_audio implementation instead of deriving them
>   from channel masks.
> 
> Patch 2:
>   Add ConfigFS playback/capture channel-count attributes to the UAC2
>   function driver and use them when generating descriptors and stream
>   configuration, allowing counts beyond the 27 predefined channel
>   locations.
> 
> Testing
> 
> Testing was performed using a Raspberry Pi Zero 2 W configured as a USB
> UAC2 gadget. Streaming and descriptor validation were performed against
> both Linux and macOS hosts.  Windows hosts were not tested.
> 
> UAC1
>   - Verified playback/capture operation via alsaloop.
>   - No descriptor or behavioral changes observed.
> 
> UAC2
>   - Verified legacy channel-mask configuration (1-27 channels).
>   - Verified explicit channel-count mode with 2, 28, 61, 62, 96 channels.
>   - Verified invalid channel-count/channel-mask combinations are rejected.
>   - Verified Feature Unit descriptor size limits at 61/62 channel boundary.
>   - Verified descriptors including:
>       * bNrChannels
>       * bmChannelConfig
>       * Feature Unit presence and bLength
>       * AudioControl wTotalLength
>       * endpoint wMaxPacketSize
>   - Verified ALSA-reported playback and capture channel counts.
>   - Verified streaming using alsaloop.
> 
> Changes in v2:
>   - Edit commit messages for clarity and brevity.
>   - Add Assisted-by: LLM attribution.
>   - No code changes.

Why was RESEND needed here?  Saying that would be nice.

Also, sashiko points out a number of problems...

thanks,

greg k-h
