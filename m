Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0209C345EC0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660912; cv=none; b=MX6ZBZljmR9QXfVdAZTRVPGTQOdHeiduLVdiIVCoi7LSGac8F/fJryucFJ1vYhz0VSy9UdFHXh0XvdMfP0heCYE2h7N0wyilBFG/5Ltk1pV3s05oiMGzWAvkW4E2JiEaJ/Rz05tuQpZ2/CVy31qqvgOp9+rjHVkcFokciUimxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660912; c=relaxed/simple;
	bh=nIBSfw1LfyVPNKVjGhgOz5oK7ZNih0oGWQ10zg/ah1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otdZNkoFGaSbKI3DQkP/ywrDdZA2hZZCZCqW4u3+S0MjT4SXSYWRkvpnW0X8Os6bCKBupZCzzA+Y08ZJfdgXQijgHcRzAm2hU7KG+vfRm2Vnh7LrnZogiAofPFsPPT2OfpX8mfiWH4i7dRvko2tGSV/dgAJZH1cVGzN9Um39aYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PYd9AFwj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtjyvv7Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PYd9AFwj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtjyvv7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789660909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3TmwoF6QRPVszagCKLa4KUEmX+YeKCjKjB3KheH1TNY=;
	b=PYd9AFwjc8gfZQlY+Zohr5e7TFcDt2z3nv8VwmttzbPZq0jdnx9iCx9xEQ7JVixcsNw/oP
	el7/x1nd2LojiopGrg8GoPfbkz6XhfHIQ9Y1pbfsYkgeR1bTf1Ec2jxN/mTdxDFBnrSRKB
	Iod77B66Crx0QXAw4kUNLbTm6jJKDVw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-DOLr4izdPWWp8yvYQBBM7A-1; Thu, 17 Sep 2026 12:01:47 -0400
X-MC-Unique: DOLr4izdPWWp8yvYQBBM7A-1
X-Mimecast-MFC-AGG-ID: DOLr4izdPWWp8yvYQBBM7A_1789660906
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52f9e903b02so16073041cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789660906; x=1790265706; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3TmwoF6QRPVszagCKLa4KUEmX+YeKCjKjB3KheH1TNY=;
        b=dtjyvv7ZdpuOSU3Jblz5XwETfuEmcsToeEn8hkKT0k/5tuMJukjJrqzvMy3UFGnkie
         QD4Ps2ldbj8puxlFmSC404iE1zCc8mW7j16ugi/jbadovONatEGksp/LX6QXtw4rRKu0
         6nZJRpirrY2gPBlRUiiMU//uoufdj9802WTHI3mGMFx8svCW2mG70F+m5jUSUlSe1x9K
         iC91CSBRo5RBJ8IhrMdkZmtGcinsaO40u+zzysdDtcXyGZPk8dXk8J2sJj7bvZY+9atU
         No0UpHSapdn8zZ4unrN0hvRQ2RCcbyt+mInoHLgjDVWfNXLo4GPnBDRAg8nqgna8lefj
         garw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660906; x=1790265706;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TmwoF6QRPVszagCKLa4KUEmX+YeKCjKjB3KheH1TNY=;
        b=AH5lBPxUnuXCgY1SsZ9lVZjLjtwpVuJdKGJu7Qs6iPRvd76s2t4ZVu4fka2QF9JWER
         wLiViaa4vXWGw9RgkgVq2mYMnaI0QfShtQK7WOkciHcK8TFOqEp+/hOrFEylVciJfMn9
         TRK54USKvEpKvbWzKYGazwP8yJpjwwoU2YfKyLUj2E0qe6cfhgwZZmaIwmEb96lfb2c9
         i/mYjvKstxqPbWT87+2Ke6mdGxuBWLcF109TI8Smo93srsgL2FuvnEu7va5YbAGLxLoz
         hMP4D53DyFsWiO4KXqvbP3kD5A2KIGgJxZUGrKDA/UvM5/U0VNbBzBeNLJj5E2dAxfyH
         08VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnvXRLi7ygxGkwbHaGTKDGQDEruCd9Nl47fmCp5C2QjTUMWQnKsElfltAAcfCjCHAuNu0VYOFCB1DT0gY=@vger.kernel.org
X-Gm-Message-State: AFuF++kHBmiTDSqYy4YAg3075rmIqDE2ajcBKCr70cjwqPo/kWw75OOq
	vLIEHLHXFdrrriunL2DEw6TsevZHkGsI3dyp/g4vZWcJTM7HA42+L1+tfYGkNnST/4K+i/Pv7Y8
	4o7d/EVi9Ug6Jcsu+V1FyBJ/htfobfmTgKlL8l+4+5wYXAuU1raHPMlBnfBnLRDrTvQ==
X-Gm-Gg: AYBFou1MjzDmI3tbza0Zdk+hAx82/kEsm952qOKlSM3exzWkWbf9rSanESxxMJgee7E
	7iou8F9D+JOt8Y9O9c0zau3/28l0UuJrChRx7+WNiFxLcGILn4Xz2NPdMkThy0mAU1kGZAe14DP
	bmGfHgA5X03QQsnavPtxkSvdYsK+HZlL0WD85+MTCWDHJb1WzuaC0Cbb7xdqpMTLx3HWDNsjDWW
	BbWLC5uGpnMfZ8EnPNlEt1cijzxQpXi2Y4bmKq4L9Fyn6GZjShowkNAB8f80GHmNnEcGQsXS5RC
	F78yq4Kwo/RSoYkpBowH6T/Ee3cY5F04q8m2xOhkDQXqmYq05ydQX9cDjY80O2n5eVvRBgesF01
	/YVQ5F1g+UFjcuEv3DnubajDM37HCUaQJBtY=
X-Received: by 2002:a05:622b:c4:20b0:532:852a:da61 with SMTP id d75a77b69052e-5329b52689cmr8100121cf.31.1789660906348;
        Thu, 17 Sep 2026 09:01:46 -0700 (PDT)
X-Received: by 2002:a05:622b:c4:20b0:532:852a:da61 with SMTP id d75a77b69052e-5329b52689cmr8099451cf.31.1789660905746;
        Thu, 17 Sep 2026 09:01:45 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532620acc1bsm51463701cf.25.2026.09.17.09.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:01:43 -0700 (PDT)
Date: Thu, 17 Sep 2026 12:01:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: alexandre.belloni@bootlin.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: disable unused clocks registered after boot
Message-ID: <aqwO5sAN9qbvK8LF@redhat.com>
References: <20260917144011.3014860-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917144011.3014860-1-alexandre.belloni@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Alexandre,

On Thu, Sep 17, 2026 at 04:40:10PM +0200, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> clk_disable_unused() only runs once as a late_initcall, so clocks
> registered afterwards by loading a module are never checked and may be left
> running needlessly.
> 
> So record when clk_disable_unused has run and afterwards, schedule a
> delayed work to run the scan when new clocks are registered.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

We're actually in the process of redoing the way clk_disable_unused is
handled. I posted a series to add sync_state support to the clk
framework:

https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Will you be at Linux Plumbers in Prague in 2.5 weeks? If so, come to
this talk where we will talk about the clk subsystem.

    Evolving support for sync_state to subsystems beyond genpd 
    https://lpc.events/event/20/contributions/2504/

Brian

