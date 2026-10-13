Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCE73E6DE7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887006; cv=none; b=f50wMlzfPyoTNw16/zrVlzlt0m0QjccLeyjPuvUfFdTNqcM++YmU/w9RyO+cyKUOYeYUGQtXridrg+Quyz3FYVQ9g4BxxQKpIebu3J3y2mTNyU7UqaUb90Pitw73QltiUeL9LxLF7BrNdbeTaEYHOKxpeZkJ9ptyQ514MQPB7Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887006; c=relaxed/simple;
	bh=tA7j6Y+q7+O+PPmAsRSUyNJSl0qTby5SFHLs09Qpn7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuY1KyUQkuRrMFcLnu3rjP8P4EWBUlp8A4MGcY2BT2kHYHU2cpqFkGZFKztGuUQk7X0lg24Zp0UJ0as7FA9YeExNgZYc70Cz/kNxOnxdeahBcYLp+Nu02qAt9bHGNJcKIJVwY2Mkn6z109JIWwLm0teTth8kEjXh3MR17ENfAs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=UW2a/6+h; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="UW2a/6+h"
Received: (wp-smtpd smtp.wp.pl 48916 invoked from network); 13 Oct 2026 12:23:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1791886991; bh=nvfOKQkvNl/DRJDxoaT8ei28DP0LijEvm6ibI1XKXyk=;
          h=From:To:Cc:Subject;
          b=UW2a/6+hIOgh6yKJjeUYblS57FUmI18yskhOe3ZUWnjm9ivkmNz0aTTq5ly3Jf/93
           W/lK52qSuEnx6di5Po18yqcn5JizgreR8oLtjhaft3bUDO2N91bGP3mBSpVWgROQSi
           pyqfKPcz0WlI74xSN25wnqkS8EA1kyTa9bITQwcy/5twdd0rFYdo3BlprUpJW64Enx
           QVGk+MoiU5IKtaGGcl6mjSD0JRjLCBXpbWies9sZ3Cnwcal0fHGv/QuJARsE5ZXK9A
           KOUc919ZlwwF5LYT4cLIjMjxibfVj/ZyvTd7gxuoBqRP179S2jfWAb5PCPFlxVbM9b
           xtEquBIBB2PVg==
Received: from localhost (77-236-6-58.static.play.pl [77.236.6.58])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <hjf3108@gmail.com>; 13 Oct 2026 12:23:11 +0200
Date: Tue, 13 Oct 2026 12:23:05 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Ho Jie Feng <hjf3108@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] wifi: rt2x00: use VCO_IC 0x2 for RF3053 on 2.4 GHz
Message-ID: <20261013102305.GA58849@wp.pl>
References: <20261012133728.77780-1-hjf3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012133728.77780-1-hjf3108@gmail.com>
X-WP-MailID: b04750d965be26e9a9e667a6954ea8a2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [MQMR]                               

Hi

On Mon, Oct 12, 2026 at 09:37:27PM +0800, Ho Jie Feng wrote:
> Using the 0x1, the VCO calibration result is 0x7f on channels 6
> and below. Using 0x2 fixes it.
>
> Hardware: Netgear WNDA4100 (USB 0846:9013, RT3593 rev 0402, RF3053)
> 
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
> RFC for this since I am not sure if it is a generic fix, since the
> vendor driver also doesn't use VCO_IC=0x2.
> Is this also a known issue?

Could you elaborate what is the issue and what you mean by
"VCO calibration result is 0x7f" ?

Regards
Stanislaw

> Testing on different hardware would be appreciated.
> 
>  drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> index 2e2e382b62475..4a44a0222210d 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> @@ -2979,7 +2979,7 @@ static void rt2800_config_channel_rf3053(struct rt2x00_dev *rt2x00dev,
>  
>  	rfcsr = rt2800_rfcsr_read(rt2x00dev, 6);
>  	if (rf->channel >= 1 && rf->channel <= 14)
> -		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 1);
> +		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 2);
>  	else if (rf->channel >= 36 && rf->channel <= 64)
>  		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 2);
>  	else if (rf->channel >= 100 && rf->channel <= 128)
> 
> base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
> -- 
> 2.55.0
> 
