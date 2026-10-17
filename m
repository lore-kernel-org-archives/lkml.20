Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7838DC44;
	Sat, 17 Oct 2026 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.129.46.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252580; cv=none; b=mbE/y1PA0IjiS+y+jMwTeGXZ+dTZLa+zKmtEEolZMRde19choxTWkJ0DQABpqYsePuE/fydvFcfjp0B8dRQczRlMb33mJRCFvL1A6ZsdFeA/hTPHlfkkHUjwFMjOhKmfRZSiBKcPHfxPDHlvgl7TCi63Uc0GzIiaixBhMO38PUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252580; c=relaxed/simple;
	bh=8p2lca59Kr/sPXCKE0RC6oNDFhBqdb/jXD9F09ecVvs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=UATTaM2UKEgdl46xhIbpdfRKK2y6nxRpgNAu8MX7DnVRJnodW2GBE9QyxCSdWTxwoWV1iEe9QshVE9GRyId13Tz0aR17AXc9/oF02dqbhuKZmXXArLNBvVzdyq5t/TV/PFJ9fvA95sxAL+KUsZc/yJ1Avq9DTyncovmsiSeSKNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com; spf=pass smtp.mailfrom=nwlink.com; dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b=XAwKO+Zv; arc=none smtp.client-ip=52.129.46.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b="XAwKO+Zv"
Received: from webmail.iinet.com (web1.iinet.com [52.129.46.51])
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPA id F4024B42BD1;
	Sat, 17 Oct 2026 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1792252578; bh=wOC3z8d3unpvQdUfL2bvr+OorEHjTzNQZKSBDptrq6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XAwKO+ZvEyUqx00zvjmuaTE/L9dRem0ramAaHSewGTTBAzjCD1A+fEG8pR4XFg4Dm
	 gUJY8aXJ43X5SOn1D0iVJj0pu/g9Jy/JF2aAyAR+ORSAykMZQ2VKylEczL9aJXPJ8D
	 BUGyrH7162eWdGVa42ZU9XxmFza+eiRzzFH/Z8J7HcEyF8SXGquOOZWV6T3Wx53pow
	 znAbaT33WQAGu89m/spHLSHFidV9PJu0DvNw9OOGec2h2On7EmTMB6hdI1fVEErsrd
	 DSUeLBfVDkTSRkjazJQZ4l9T3A3CNv+NXBYiWVEU2KSl7YFRO4fLHCTJdL6PtNnvZA
	 f5L9gR6Y2wVhw==
Received: from c-98-203-133-45.hsd1.wa.comcast.net ([98.203.133.45])
 by webmail.iinet.com
 with HTTP (HTTP/1.1 POST); Sat, 17 Oct 2026 08:56:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 17 Oct 2026 08:56:15 -0700
From: kaf@nwlink.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/2 RESEND] usb: gadget: uac2: support explicit channel
 counts
In-Reply-To: <2026101742-ouch-sensually-f5a4@gregkh>
References: <20261016162534.384844-1-kaf@nwlink.com>
 <2026101742-ouch-sensually-f5a4@gregkh>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <fef8f9aa36c922e846d37e686b38f6c3@nwlink.com>
X-Sender: kaf@nwlink.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-17 01:05, Greg Kroah-Hartman wrote:
> On Fri, Oct 16, 2026 at 09:25:32AM -0700, Kyle Farrell wrote:
>> USB Audio Class 2.0 permits up to 255 channels in an audio channel 
>> cluster
>> via bNrChannels. Independently, a channel-location bitmap is specified 
>> via
>> bmChannelConfig for up to 27 predefined spatial locations. Setting
>> bmChannelConfig to zero indicates that the channels have no predefined
>> spatial positions.
>> 
>> The current UAC2 gadget driver derives bNrChannels from the number of 
>> set
>> bits in bmChannelConfig. Since bmChannelConfig provides 27 predefined
>> spatial locations this limits playback and capture streams to 27 
>> channels.
>> 
>> This series allows channel counts up to the UAC2 limit of 255 without
>> requiring predefined spatial channel locations in bmChannelConfig.
>> Existing ConfigFS channel-mask configuration continues to work 
>> unchanged.
>> New optional playback and capture count attributes allow the number of
>> channels to be specified separately from the channel-location bitmap.
>> 
>> The series is split so that the shared u_audio infrastructure is 
>> updated
>> first without changing behavior, followed by the UAC2 functional 
>> change.
>> 
>> Patch 1:
>>   Pass resolved playback and capture channel counts explicitly into
>>   the UAC1/UAC2 shared u_audio implementation instead of deriving them
>>   from channel masks.
>> 
>> Patch 2:
>>   Add ConfigFS playback/capture channel-count attributes to the UAC2
>>   function driver and use them when generating descriptors and stream
>>   configuration, allowing counts beyond the 27 predefined channel
>>   locations.
>> 
>> Testing
>> 
>> Testing was performed using a Raspberry Pi Zero 2 W configured as a 
>> USB
>> UAC2 gadget. Streaming and descriptor validation were performed 
>> against
>> both Linux and macOS hosts.  Windows hosts were not tested.
>> 
>> UAC1
>>   - Verified playback/capture operation via alsaloop.
>>   - No descriptor or behavioral changes observed.
>> 
>> UAC2
>>   - Verified legacy channel-mask configuration (1-27 channels).
>>   - Verified explicit channel-count mode with 2, 28, 61, 62, 96 
>> channels.
>>   - Verified invalid channel-count/channel-mask combinations are 
>> rejected.
>>   - Verified Feature Unit descriptor size limits at 61/62 channel 
>> boundary.
>>   - Verified descriptors including:
>>       * bNrChannels
>>       * bmChannelConfig
>>       * Feature Unit presence and bLength
>>       * AudioControl wTotalLength
>>       * endpoint wMaxPacketSize
>>   - Verified ALSA-reported playback and capture channel counts.
>>   - Verified streaming using alsaloop.
>> 
>> Changes in v2:
>>   - Edit commit messages for clarity and brevity.
>>   - Add Assisted-by: LLM attribution.
>>   - No code changes.
> 
> Why was RESEND needed here?  Saying that would be nice.
> 
> Also, sashiko points out a number of problems...
> 
> thanks,
> 
> greg k-h

I resent v2 as both it and v1 had received no review. I should have 
stated
that in the cover letter.

I'm reviewing the Sashiko findings and will address relevant issues 
before
submitting a revised series.

Thanks,
Kyle
