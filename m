Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFE44503B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791321353; cv=none; b=E7BRox8JRVdXFAxBcax73Kq+LT6S9BlnpfAAQ3qDl52dqOUcj0Bxhq5zJw0gdruQ4bnL68F3QIWj20UKmH/wo4kGbK+fvVU09cROK51oLRTHYvLn1ICKj4VEeAqRkE+mnXclh77zelpGJJw3dM0Xf45Jv/j5aO8JJRPiaQXJdQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791321353; c=relaxed/simple;
	bh=c/XsDhRFsQWooaZjD0jb1/gdnDss++ucVvL/9R3V+Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2RQaHgae8Vq+fcz3mjx0WM4BIAg25tpa95Uks6MEhxc7JiQuKWgwhEmCW2Zphb62n3kDbdkepF7V4OzvyJMO3SM+RGvhMFqq3pjCtpBx+OGLMT5YSdoNG6HP/wPCcIu7h8tbmCp9gULHUDS0HWl4ody2xtjuMsavd0RcKzhNiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qi0rWY/s; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qi0rWY/s"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0f534161so378998f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791321350; x=1791926150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=09pu2jwScTlH0IXCcu3YnB3jHWMTRjZZnpTwRHLnhOU=;
        b=qi0rWY/sFigZuIS/nadWzH6ul0OelOTcW8TDvbokrQzQeiIt913SZ28PKVEnTR9FFt
         NJWhGiEyq8OPmZRiaR0gdY98qk6WOm/Sg42oIDd7LRIfraX6C/VEjMsP7S385hXcPoJF
         DXE1sliIdiwMtrmltM9QKRz2yO0Qs2nar0DKf1+Nr7TfyDloj4Zz+McPROxeEzVyjoYJ
         +QtlhlphA8pO2BGhOJjANMZgcFmmFTjmJ9IGd3knOaB5p2JoAMfnkalW8u/uCCqGjw7A
         WchicPPIZ+81lxIW1sfh9wV403FFRuHk9UzaqoA76MPI/eGNvZLi8PDQSMCzjLNJgjyk
         w2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791321350; x=1791926150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09pu2jwScTlH0IXCcu3YnB3jHWMTRjZZnpTwRHLnhOU=;
        b=YSSav9hH3fSRYXdsiC/JbWE5voGWlQWqlvtRwRfFtk1tcTzbsjLGanSIflILuvCOtU
         zZ/gyBR5uANmx+5b0mRnrJrJszpJtGx0vFC2NVPJu1mKDsMfCKw78lWYo7mDQc3I/7jF
         rCvxQH9iiu2ygLO5IGyEGJZRuqLsweUdGD0WI1RMzBe0FsAnivEdAB3Cf7H2kwlivZuo
         hYk4BEFszZZ/sr1HXrVHjU25BE76upBRp+6EoBGa4DefYkM3Rf5Ylyn75eephbk9KEos
         9/9buw4r5GEdXuBVeii/AT7PRzIk1XoIQzYHuYUhCUHQV2W+/Mype4WUS3gr8N/B+QOi
         boFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4JS1TSQBCUicgiXv+L4xa4WDguX0lM8cX6kntg3p9quktnWf6r9hq/2XcGjqSSMK/kK2ZUZcUlJqvlRc=@vger.kernel.org
X-Gm-Message-State: AFuF++nAhm8603hrQENIZ5nyc0YIA9XKGfDfwZh45etc10Y1tMtXwi4/
	6fq7hFEO4wxuavQrkqWHIa0By7nEoTWug8bRucsi0V5t0DhQpEOuunt3
X-Gm-Gg: AYBFou3UCLFBjc+ymGu4InYuIX2DXU+k3FApdOZfuS52T/b+xak0O0NagBkK0q3yw6q
	0qDUPYWGIyc/YPpoR5IpMMBwm1KWtvCP69TdYG/Jz2Hy4bPmRogkoz+BmZhJDlXL4hiQSECSg1s
	AnmUyEeEaaikycZDWKEAacBJ+qpm/hZSB7DXCIgLf5qMrekN9MxJzAF5PW6qmDWNFMghY6u8aPQ
	YDGrsZ9Byba0q7NZL+0Ng5nI1ac1OqXQplrNxJU1bzbkBrCSrDx95dRX76FHZ+D+nYmBrU9Se8G
	8TFVXpZr6ovQeQa2dpLDGPcvxe6HWb8tJ3Li0m/joYP2hYMs96m7GUi1FA+jryOose0SQif9Y1x
	vfi4mslK86Gy3x4IWOUhwldRMldIEztDZeeTZoUhLrpxnB1Jev2e60XR1bfNj+O1foI7dyMrYmF
	uOC4EoosrfGYo2S7DtWYkwxXBU8SjTObnTng0tBKmnMx/BzZreHLguoIxeoHi4A0w=
X-Received: by 2002:a05:600c:3c89:b0:49f:c432:885 with SMTP id 5b1f17b1804b1-4a18041afbbmr1800205e9.2.1791321350648;
        Tue, 06 Oct 2026 14:15:50 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:92f9:f192:2805:c29a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2e2dcsm1837566f8f.42.2026.10.06.14.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:15:49 -0700 (PDT)
Date: Wed, 7 Oct 2026 00:15:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <20261006211547.lfrhgdkixbbbyiju@skbuf>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com>
 <asN4I1cpVb5HLNu7@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asN4I1cpVb5HLNu7@parshuram>

On Mon, Oct 05, 2026 at 12:12:51PM +0200, Vinod Koul wrote:
> On 29-09-26, 16:52, Inochi Amaoto wrote:
> > Add several helper functions that allow drivers to get several phy
> > consumers in one operation. If any of the phy cannot be acquired then
> > any phys that were got will be put before returning to the caller.
> 
> Do we have many such examples? Phy is not a many resource like
> clock/regulators... Do we really need this. How many in kernel users
> will benefit from this API?

I have another case for more than 1 PHY. On some NXP boards, retimers
like phy-ds125df111.c are used for networking, but not in the way you'd
expect, i.e. not like this:

 SerDes      SerDes
 Lane A      Lane B
 RX   TX     RX   TX
  ^   |       ^   |
  |   |       |   |
  |   v       |   v
Retimer C   Retimer D
ch0  ch1    ch0  ch1
  ^   |       ^   |
  |   |       |   |
  |   |       |   |
  |   |       |   |
  |   v       |   v

but like this:

SerDes  SerDes       SerDes  SerDes
Lane A  Lane B       Lane A  Lane B
RX      RX           TX      TX
 ^      ^             |      |
 |      |             |      |
 |      |             v      v
Retimer C            Retimer D
ch0  ch1             ch0  ch1
 ^      ^             |      |
 |      |             |      |
 |      |             |      |
 |      |             |      |
 |      |             v      v

Since the retimer channels are bidirectional and not hardcoded for RX/TX
function (unlike the SerDes differential pairs), this is not a problem.

Since one SerDes lane is one struct phy, its RX side and its TX side
need to configure the channels of physically different retimer devices.

The retimer driver was modeled to permit this configuration, and it
exposes each channel as a separate struct phy. The implication is that
any consumer of this retimer needs two 'phys' phandles to have both RX
and TX retimed.


Actually I'm interested in this series too, specifically due to retimers/
repeaters. I believe they should gain core PHY support, because the
current support is very sporadic and not homogenous.

Today all SerDes PHYs capable of supporting repeaters/retimers need to
manually acquire their phy->repeater using phy_get(), and forward all
ops from their consumer to the repeater as well. But this creates the
odd situation where maybe the SerDes PHY doesn't need to do anything on,
say, phy_init(), yet it needs to implement it anyway, just to call
phy_init(phy->repeater). The existence of downstream repeaters can be
made very transparent to the top-level struct phy (the one that the
consumer interacts with).

And because in general, there could be >1 repeater in the signal path,
I was thinking the bulk API could be a good candidate for managing the
list of repeaters of a PHY.
