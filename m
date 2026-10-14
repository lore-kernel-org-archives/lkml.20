Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597461D9A70;
	Wed, 14 Oct 2026 04:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791953783; cv=none; b=YmF3hzle8+aB183P6vCxQDqRKg5QBuX/rbhVhFJOSasP+6efVJgcg1WiAQB0Nwmg7w7pwklnV13TCZOqxqi2UiB+xj2Xi0LVR/I1LHZy7t4xSyvZCb6DQPJy8dkjx3Dp5rKGYfwiRlLbrYFvlqjmEQJc7h4HhbYwqtPjVt6ek4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791953783; c=relaxed/simple;
	bh=9Dgr6S9rub3+BJDRKPd6m5eYRoQZhIcuq4O4s8VoVx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1W3PP3smZLXGZzp7HxlLUMQH3k24rz+5vS/hyWKo4oxGo9YXXriux0zFWeJ98/K2XJ//Plw5dJbLmb1WMYCkXSGBTAkfYqZ/Zvbq4G3Gt0iobhyhnWzfRzBCZ+S19AsHhFRzb+04oKwnCURYcZu6UM2Ex1jaNSx8GjAZ2UuQ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=alNvzpql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="alNvzpql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614AC1F000FF;
	Wed, 14 Oct 2026 04:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791953781;
	bh=3rNi/lg2R62xrW1wOGGqDN728UZW/+SlnQLPcg3WGXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=alNvzpql4l3HOe/DGiQDHWL5TXY/Q5fu7gwMSlLRMfa87c6QY0OsNZvbl3qum/47W
	 AORO9HswAMUweAw4kBUrNzuMPzLTzFYDl+a7F+Bb1024DDnk+RoE0h60yFDcvARuTk
	 Cg7rIWvqGFiAkvu33m1ioItcV19JdaXpgFTFMdJk=
Date: Wed, 14 Oct 2026 06:56:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zach Schneider <me@zachschneider.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: remove remaining comparisons to
 true/false
Message-ID: <2026101410-estate-tasting-23bb@gregkh>
References: <20261013214129.699212-1-me@zachschneider.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013214129.699212-1-me@zachschneider.com>

On Tue, Oct 13, 2026 at 04:41:28PM -0500, Zach Schneider wrote:
> Checkpatch reports "Using comparison to true/false is error prone"
> in rtw_wlan_util.c, hal_com.c, hal_intf.c, odm.c and
> ioctl_cfg80211.c. Replace "x == true" with "x" and "x == false"
> with "!x".
> 
> bwmode_updated, bDisableSWChannelPlan and the HAL_DEF_MACID_SLEEP
> value are u8, and rtw_validate_ssid() returns u8, but they only ever
> hold true or false. ODM_RAStateCheck() returns bool. This does not
> change behavior.
> 
> Assisted-by: LLM
> Signed-off-by: Zach Schneider <me@zachschneider.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 2 +-
>  drivers/staging/rtl8723bs/hal/hal_com.c           | 2 +-
>  drivers/staging/rtl8723bs/hal/hal_intf.c          | 4 ++--
>  drivers/staging/rtl8723bs/hal/odm.c               | 2 +-
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

Please read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

thanks,

greg k-h
