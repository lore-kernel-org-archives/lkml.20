Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B291F3AE715
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744616; cv=none; b=VkvwtctkHbHbXMh9moD0yNarLrY2SIgsw9R/hgi3PyjOBXWfUX/JaSyUTQAP6Q5O1ad8P468ir55o6N6A3Qy1OsG1poD+GLicRaL8iP20tSCP35qSUJxTU84DeR6pUk8V8UVzu1XRLfM9Lg0qYe8PNSqxInIQU3S7x2Y40evwJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744616; c=relaxed/simple;
	bh=ZAOkRCY8wOKv81YxWLBl24DeI0DOK+J6kOTG4qojef8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7SUY5HwCJFYlTszbWfHYzrV9KlHE//RwYl6UF6TiCKlftn8psRwYdlZGtEm+XXDyCl+MjjNkgA4YzVt8BWboYXH/ZRMQ6maQWCZYAHiwwZ0mt+K89KL/a0krdwDAfVH7iFi0U4/ANwec9OvC+RO8qY9vXrg87LMsAk9Kwf/SQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2VGCKAF; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2VGCKAF"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b4f2d90c4so1238167eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744614; x=1791349414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zGAfoAFOLtOrNepRCLXprN9XZyZC5iWH5UnAhvOD2p0=;
        b=P2VGCKAFCV8yJ0vbi1I/QYKuNdgsegWttnrnUlb3rG7PKtW3M+DKGZ3zoyqyrlCf5a
         ltEB72yZ3VN+McR1oS1vEc3Lei8it/YEbZiUcE5XsSPEBRY8F8E6rWfClJ7J6ErIMRxX
         xTJHoGxQlDqcQcS6nh5ufYxct0fhDloAoa96W8eWbdiQupR1IffenEvJzuoheaQDbyFB
         Pug75kq1bvII81GgnHArtWdIYAEZ7JXcrxZ4uucElub8+b0AS4VnBUBcDw5g6FlWHiP8
         T6w6/N+ZcGJL6gmmsgLq3HR+uMtLrJOAwILM3sNisor7yFKNpreMbdQFm6G1HeO+LCzr
         cOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744614; x=1791349414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGAfoAFOLtOrNepRCLXprN9XZyZC5iWH5UnAhvOD2p0=;
        b=VGHgvk8bjSZOOeIU4qAyWH5qfJK3OXof50WDX8XUauEVXtasEqlE7t9H5PMdvV4/ZG
         10nvwRI3xoeLlDxpOXYgnpi8pzAk21yfrKsfyU5+jrlOCjNaNlt7O6Aiam4FQOyRWaLk
         C5Z561GfpoolGzUBk/I9l99kx41rFGU3axXnJCFRQQ3J3yw7JjI6XoJi8t1KIO3lDPJd
         UFiw2XqFaVVPNVONOO7k3GU95DByi4Is1UP405p6omXurOpC3JkbzjP2M00X7JyRZJZD
         /9Zx3DmF1S6/KJSXmB8zBpvkvY0akjnT37FG2/U7rgfgrzuRLtfmxj5CK0Rink2kFPiJ
         uS9Q==
X-Forwarded-Encrypted: i=1; AKwUvByZ5w4FF4uadiFu/WnTz2aCGg0XgQBJ9EJhU5MOWsk8hwDBIvkqijQ73ZGj89aSD4Xey/yW+2Ai60kbE+o=@vger.kernel.org
X-Gm-Message-State: AFuF++n0SrOq00jjPXWGck2GyT64Cmh3EWr8bG0On7EFu/Zojax5BE7e
	+I77nGfA2dArq5r9eBnhwa6bweOcQCsu/dvg5ndnEF6Z+6oF6zPi7b73
X-Gm-Gg: AYBFou19m2BZl6TL5YgNZUvHfxR26nsGjyIyokvqHLGUklzvlOshd1hJWaWPVkGjiGg
	IWGSW4tkD3y/72EEg8x+DdIBgyPrb9wZUrDPzMIeo+RyrsnFvS2mxtsEuR5Q/j9Q9Hzw+9wTpPH
	+GVsSkdPbSyNTAJGfoyoF7aN9FJJgFSPSox90V3h8+zTDvuXWiFEaY0IPFLmYYZzbUBYr5B3WiL
	j8cB5zjNlDyf0UdnnkhXJWOGxeXXwTZ0hzdJtWlBFLUM/3sgOI5jFP2q1uwY72daPIR5d6C7YGe
	urU/nToQPac2V/8FdNyh02HnVEam9fugiNu7zSzxI/sPY16UUKWBXmvoBcItohossNoee9gWLWE
	T+C/Gnpgnmk8UKcFNJfBuU+nDBd1FCXZNf9bdUOIjbDcgphbpO40HESAS3ps93xV8u3gQgMdRqt
	w4E0XgujmUyyr3s3yfLTaeo26tSSRiKimvmss56Q9+ppvXnaMxXNdD1YwZUAf31XXMU3T0dK03g
	nw+WMi66mFwl5r/0bzMJzwjPH+CCwdV0I8lCQQy3w==
X-Received: by 2002:a05:7022:7f05:b0:143:7dea:f6a with SMTP id a92af1059eb24-14d34ad35dfmr39419c88.32.1790744613793;
        Tue, 29 Sep 2026 22:03:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a605c2sm680082eec.7.2026.09.29.22.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:03:32 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:03:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sh: mach-x3proto: convert gpio-keys to software nodes
Message-ID: <aryX1eOmqUw2x09Z@google.com>
References: <20260704-sh-x3proto-swnode-v1-0-0c039549dc46@gmail.com>
 <20260704-sh-x3proto-swnode-v1-2-0c039549dc46@gmail.com>
 <d3a2875ba34bf10ddae3626b77da071cd4624348.camel@physik.fu-berlin.de>
 <arn6r3RohRPJrk0_@google.com>
 <61edcd485d5f2704a87f208a5d0eec82576a38ae.camel@physik.fu-berlin.de>
 <945d56acafd1910b7304903b06f974f41a2a018f.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <945d56acafd1910b7304903b06f974f41a2a018f.camel@physik.fu-berlin.de>

On Tue, Sep 29, 2026 at 09:31:05AM +0200, John Paul Adrian Glaubitz wrote:
> Hi,
> 
> On Mon, 2026-09-28 at 07:56 +0200, John Paul Adrian Glaubitz wrote:
> > Hi Dmitry,
> > 
> > On Sun, 2026-09-27 at 22:28 -0700, Dmitry Torokhov wrote:
> > > Hi John,
> > > 
> > > On Thu, Sep 17, 2026 at 08:49:15PM +0200, John Paul Adrian Glaubitz wrote:
> > > > 
> > > > It took me some time to fully grasp the rewrite, but I think this should work as expected.
> > > > 
> > > > Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > > 
> > > Sorry for bothering you but I do not see it in next. Just want to make
> > > sure this (and others) is not stalled.
> > 
> > Don't worry, I'll merge it today. It's already reviewed, so I just
> > need to merge and push it. Sorry for not doing it right away.
> 
> Pushed now: https://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git/log/?h=for-next

Awesome, thank you Adrian!

I also resent the rsk7203 patches folding the compound literals fixes
into relevant commits. Hope you will have time to take a look at them as
well.

Thanks.

-- 
Dmitry
