Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6961B3B19BA;
	Thu, 10 Sep 2026 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020732; cv=none; b=cFfknGM7yIHQp/EILJ7NHDTLcJgTTQP2coO+MVrkat1nkkPUEuruIv43LisD2mSv8t07FGLZfJcpkdC8kQ4nSMnsT+6e8SLl+qEm4ivnoP86W82DIlevYk6FfGSTOxHiDJe1Q7jmTz4XlbaESCimNQruOevDAtUgTCRaSuZZMQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020732; c=relaxed/simple;
	bh=311saYwwKPTfQAVsdL8cI0CojdN932dYzqRIxDGhcjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6Cwn0jU6v34fNcEgu+MNxrcxmiFK4JOfApZ5CirmN/+R8hpqS3GfOj8fYMPZF2JQuyZvT2qWhvZ5+1E7K2aj9OXZQnCPPhb3nsjKmMBXvwbFFoCIsWPJMeqCP+dTLDgn48cw1eTkBJ1ic2zppbOPEvZxx89HxT9QIUAuoAlbpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vdgVN9L/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vdgVN9L/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EBC1F000FF;
	Thu, 10 Sep 2026 06:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789020718;
	bh=QoybkwdFrnLK7llMYHPgBUkmKlSi8hvY6f51nkYo6kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vdgVN9L/Ie0clCMd2WwbM79esqcn4YF8Bs3yAkPFofFbTkv7uu9LIKcYJJ1U+qE9t
	 vTVuvlY/BYk82NBdEkeQ+ipnAYpxENZzOFPQOYN3AWIwKzonx8f8gFldxq3x+zchwZ
	 sAIxg8KOXJPWlNLtRaivjH4k2Q9qkmV+D5pVfsp4=
Date: Thu, 10 Sep 2026 08:10:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, Farhad Alemi <falemi@asu.edu>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-out-of-bounds Write in gb_hid_raw_request
Message-ID: <2026091048-expediter-lubricate-a2df@gregkh>
References: <CA+0ovCgLrz4WhPKP5LGW5HZa8VOodgeo6pWuyQGgHE7UY57Oog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovCgLrz4WhPKP5LGW5HZa8VOodgeo6pWuyQGgHE7UY57Oog@mail.gmail.com>

On Wed, Sep 09, 2026 at 06:38:02PM -0700, Farhad Alemi wrote:
> Hello,
> 
> We are reporting the following crash (reproducer and a proposed patch attached):

Great, please submit the patch properly so that we can review and apply
it if it works.

> Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
> Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)
> 
> [   44.000772][  T804] usb 3-1: new high-speed USB device number 2
> using dummy_hcd
> [   44.163699][  T804] usb 3-1: New USB device found, idVendor=18d1,
> idProduct=1eaf, bcdDevice= 1.00
> [   44.169786][  T804] usb 3-1: New USB device strings: Mfr=0,
> Product=0, SerialNumber=0
> [   44.212054][   T12] greybus 1-svc: set power mode = 0
> [   44.212064][   T12] greybus 1-svc: power mode change failed on AP
> to switch link: -5
> [   44.213758][    C1] greybus greybus1: 0/0:0: short response 0x94
> received (8 < 9)
> [   44.215179][ T9337] greybus greybus1: 0/0:0: synchronous operation
> id 0x0003 of type 0x14 failed: -90
> [   44.215216][ T9337] greybus 1-svc: failed to get rail count: -90
> [   44.234071][ T9337] greybus 1-2.2: Interface added (greybus)
> [   44.234080][ T9337] greybus 1-2.2: GMP VID=0x00000001, PID=0x00000001
> [   44.234087][ T9337] greybus 1-2.2: DDBL1 Manufacturer=0x00000126,

I'm guessing this is an emulated device, not a real one?

thanks,

greg k-h
