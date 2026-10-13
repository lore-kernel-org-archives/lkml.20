Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF33CEB8A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901133; cv=none; b=FVWP/cmyrZdzgkh8uFNjT+B5wg85yv5w2hwLohKHtyNmKekh0Tem4oFVEEGmlhU0VLf2u2GK4zgF8iZSnPADjcnaDzGdWGOxr92FA4P+ICKTfNGdP1/JeKuVlffkQJFBRGx9zIS4FsFnqMVic24JNQHcYVlTkT0kKnTJm5wUXh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901133; c=relaxed/simple;
	bh=jU/7GX4KXsH1jJRq9lbzfmdldjjzkUh1WHWdc+JQWw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+Qf1X0Ffz9SUvwBLr5vi6x6B4Jc6hShvqLAEW0+wna0yLgtvTJJ1ee5IvZxXHdK1QtquSVuR+Dq6NXEnhxOzhYKwMKQHLHcExvZNtmPaFh83DnSmT6V/TGDrVHb3JHREdnR4G4i1N80QLP2W+F+dtCv7y/P+91z5f+ZbnEgiIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WnqFh5ir; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WnqFh5ir"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917a707f37eso40401426d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791901131; x=1792505931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoW0AuPuvcUCxHBlCzsvE/6WR7qHvoTNOr1hSF5UVwI=;
        b=WnqFh5irUp/jYIh/R55tpbdV+PIO9orqtZdcj1Sgpqj83Bf4uW1j2KPcl0eFF6872D
         1QxGoeHiARj3nLaGzAuux9F9b5rNswGno1bbTC6LryEg/B1q5JeBMLy0UaF5EDdAGpJ7
         cnfJpNq8dKKwfwHnTZLSyaWCwd/yCyo+T8xXw6vsf/SoYLjsgfiCZG9iYa8THTGy2Juu
         JqjXXExf4r9kttzpSf1EKtSSJvYteQOjFMIiJ7MfCIXuVt+HNaQoSq/dAxVGkYgpQ7Tz
         6ugL5LA/wpIkwQ0/lC8v1TUhG0oDRmdUQ4J3ADEUzS9MNfY/n+XjiHeklCWDqreG9Boo
         LdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901131; x=1792505931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoW0AuPuvcUCxHBlCzsvE/6WR7qHvoTNOr1hSF5UVwI=;
        b=SKlYZBHURazIfkFGB/uWYmGDTM7pcoNdr4qFmhhLb2y7K23W5gVwoR94At6XIcupcX
         ++yQN9Ao0nU0hl0OtL4ZcruXyMwNALMXZtzBVh/Dix+55Nd4klzTSmNgz+l/wHVfm/y9
         xf5bgsnLOSYtxLdFJuR4PESqIAs0Lkj1hGq2fvp7wPWX3DRwqZJU5HbTlxn/HEjH9ggW
         xNiyo4ReFJ/JwqE+hwP85v5rK0y/cjYs/6ItxRzlvbFRpVsIIlI5a6IEHhRKS77T5bMJ
         Q825aKbU3XZD/jQUEoHgHb5oJVVEpBc1CHwNJCvePo2BpgUYTj7wnKaSNYfsgOfqybLe
         hVkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWXfnMEBxruL7mM55qwTW56BdfSELUu7lyUGqHdmJNuFxjQFoJ6FwbMLMqBslIiUJpMf/esJqC1h22IAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNtp/GQskxnlUkDgithPP5LaxsrAiHPIPJjAPYxYzd3PGsRIvk
	DjQMvYue2JH1VeDgDDfns/1elIBicYXJxzpLjYRoe2xtvdYYcLetLJ2QDhoxAwMAjw==
X-Gm-Gg: AYBFou20qTaM3EwVAJuVhIly4cJG2CjHUKmTSbz8QbjwHrxgeVvDjR8tNAPEyVejv9u
	gQMGW/JXp3g1O7g3Fu8uzaU7mRTYfniVa4EiCyvVjzNnI7smB8TJrA2M51+4XlNuEEaRUD7+11O
	a8KGugScpkIRZRAoPcelyTDs/EqqdCZ1LCEzLXeXPwC9JhnnCMccBD5MRAGyriAhNbMwHbTl9w/
	266UqjzkEvpAK0Ik5znDQzO/OquNlQ1iic0ITHk5dryxslZR3Bmpo9a7pNXqz8OfrUSUGT6k5fC
	6PLygj5B/XLkZG7E9UUFKBrTLJJ155YRIASAFfJQrnMxdIQayA6b7Ug61Ccb/r+HV/SvLaX3X12
	A7VDd+77arXzVqUiPytXadDSQSsJTHo7+etH9SkzmcZ2ZCNHCA4/rcMYTh0W0Z+i63XK3gP5vz4
	xv/+6dSATXz02c4Vu8z9AXS/N2vr03s3wt6M/44gOb1+SxAqp+DhL9bHdRtJw60fTBtFgOiNyGf
	7Uy8ymseNJguEo8
X-Received: by 2002:a05:6214:ca4:b0:91b:5d3b:4ac0 with SMTP id 6a1803df08f44-91b5d3b4e68mr214148336d6.53.1791901131080;
        Tue, 13 Oct 2026 07:18:51 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b9bda8643sm18530786d6.25.2026.10.13.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:18:50 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:18:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [BUG] usb-storage: 14cd:1212 returns incorrect data after large
 READ(10)
Message-ID: <1ff84ebd-f805-4f16-91cb-ccc805c8e946@rowland.harvard.edu>
References: <34f2ac0a-04d0-41cf-a2a4-11a93c7c9b91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34f2ac0a-04d0-41cf-a2a4-11a93c7c9b91@gmail.com>

On Tue, Oct 13, 2026 at 09:41:22PM +0800, Xuntao Chi wrote:
> Hello,
> 
> I would like to report a deterministic silent read corruption issue with
> 14cd:1212 USB microSD readers and propose adding a MAX_SECTORS_64 quirk.
> 
> A READ(10) larger than 64 KiB can cause the following READ(10) to return
> data from the wrong LBA. The trigger I have found is that the second
> read starts 64 KiB beyond the end of the first read. Instead of honoring
> that gap, the reader returns data starting at the end of the first read,
> that is exactly 64 KiB before the requested address. Both commands complete
> successfully, but the returned payload contains erroneous data.
> 
> The same problem is observed on 3 physically separate readers purchased
> from 2 different OEMs, all identifying as 14cd:1212 and with the same
> serial.
> 
> Device and environments
> -----------------------
> 
>   VID:PID:         14cd:1212
>   idVendor:        Super Top
>   idProduct:       microSD card reader (SY-T18)
>   bcdDevice:       1.00
>   iManufacturer:   Generic
>   iProduct:        Mass Storage Device
>   iSerial:         121220160204
>   speed:           USB 2.0 high speed
>   driver:          usb-storage
>   logical blocks:  512 bytes
> 
> The error is reproduced on an arm64 machine running 6.18.54 kernel, the same
> machine running a 6.12.112 kernel, and an amd64 machine running 6.8.0
> kernel, and is confirmed directly using libusb.
> 
> This has been observed to cause data silent data corrupting when mounting an
> ext4 partition from the device, and setting max_sectors_kb=64 as a
> workaround fixes it completely.
> 
> Would adding a US_FL_MAX_SECTORS_64 quirk be appropriate? I retest against
> the latest mainline if needed.

Yes, that quirk would certainly be appropriate if it fixes the problem.

Note that you can test it with no changes to the kernel, by specifying 
the appropriate "quirks" module parameter for usb-storage.  For example, 
before plugging in the device, do:

	echo 14cd:1212:m >/sys/module/usb_storage/parameters/quirks

Alan Stern
