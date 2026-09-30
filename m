Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A774D37AF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771844; cv=none; b=gCBKPj5zxcwLo7BltQjXXnt/YPSDCL0WitWBhFJLy+Yy6NrfM3c1QwiTLltQfGLIAmptMyiaLCLU4/hOVxVZkI8+hRby9vPkojnuYpabbEreVxYWHT81eibq0N7P06P91e2sWaR7/3Fy4HPORq1gAUBsaUth9NCT20iMQcKqSd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771844; c=relaxed/simple;
	bh=p40B9btGReopRpM1Nfv5c+MJXT5wn0yzDEiLh9/dHYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryzuLd0QiFBOCQ3FnrCyK8453O2dORTBfPbtXgprmT+uk2Pk5Y9OLOzOzZqb/zewiJR5SrjDaqCOtcSgClDCyUq0pNKdf7AABoUEAWwR2K3OvN4s17Dpe1WSlk/YiTrp2cd7zJP7yad7iPNbLLhlWzAQ0GxlK90BWlEKhZnhj2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYJgBilU; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYJgBilU"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7901f7971so1693758a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790771842; x=1791376642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rq7mO0SajJJKY+1t6hXRwZfv5jk5Yv3qT3TLkdzP258=;
        b=AYJgBilUZn7sAHQUw2hn0Kcyx8GNhbR4+1s+mTPWJFDdKPnI2YKOVwBLEHCIpgKBH2
         V/faNTuY8o6ddDg0cYqhJTUxVequPDJmNUaNgmqgps/bh9HjpdbFCsqJA4Vl6IHFDElQ
         Lm9L7F2zgYb9TynjIp4m5aYaVygKpM/Rut6gymFyuawrIXNOrGJqmQwus9F1tgYFamH1
         yh1mvNclX1ASGLjCAdvbSlsxrhexC80LDV5szl0PShQuZOUbmAc4uedtr75CajR/2/oL
         I7uyq0p5gh7R/4km2jRbFWV0QCPJssDrCFKwOeyynp2dYn4flEPQ2FdP4fELeXXQ71OX
         B03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771842; x=1791376642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq7mO0SajJJKY+1t6hXRwZfv5jk5Yv3qT3TLkdzP258=;
        b=L7z0ebMTChBxPzNmc0EcnKpT1N60ore/euwSJmVM5IZPZNej7BnINARxZ5I0B0Tf2+
         ITVDDce+V/kYjr5u6Dz1ampBfESH09H54ALqlRYrhy1qqy+Juuds1jebKhbVAtRRRbAG
         eavgg2NKb61sDPQfukWpp7OaWYh3YWCwUBT346VgWBz+/ZJpYeZVXAMAMYFTD6XlXgGS
         JCJO/J0BdtxjoSOA5//JlMTmJpT1xiemeY2/yz6GnjMQ8VWMIIUrSFsjcW0V0Yh3KVLo
         1X8g10KNhsELbfWIxapopysM7f1pVfRlwhhiWYjZGwZ2e2h61NCbO/ac4RP0GwmRq9ZW
         xtXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVr3VnU1J1V9lSM28Y+wiphHGtINnwOnaM60tNieLwQaDJpolzdgbZR0lPKsXkD69UlUd5891yXcBvVXw=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ9bDQyI3mJB55OPiwu994hzknZYzrOrWDZcBNorJwDmT7D0kT
	uYdMWoAVAcbSu/Fh9SZw3FTaZEKarkTgAjh5rmUW5ZTuBFB6ebXq93g4Kk+JF1BY
X-Gm-Gg: AYBFou0zuybmYdk0SPfgST0+6fv6Er8Qawq80/VVx2tUeHDGhKyxX804C0J/3/YBOdG
	xg+HP9q6RXBftvKuy/dgdnNciyMj2RqK5FW6InZG/s4KA63YWcf36Hrudey4kHpmet/kqsOD0Yz
	nlnA5FBtbvfihIHlflD25qljYdPSu6VCweRiIZiALo7Kohj0U14z4MQMhflZ56GqVs3NjJFONi8
	CdSPerBCZ7S2iSANzW1Db/Hzxp+sUDCne34gSh5JFUuX3uUTHBjGee4G60lW1NkAHpH5Adxn2MA
	1bzI8v0b8P8M2HYoZrSRN7YRKh68oUWYHF0KFHJqNmyhSWC/JRUZZ160leAwBCzQ3J6eL7PBqxS
	mD/yywrnGdntG5KOHSP60i/CGLUJrq9/rTX9w+d+ek8tJxsClpmOvDhr6m+k5D6gSeWk3hrQVjJ
	+J3fUp7ESqsnN1BPJUmB92DdBIaD48VlvfgrP6yGarhNOPwvROWLsK9bkdvjhumKNuYRzmADhU5
	L/9xsdUYK2oNQD3lu9DskM=
X-Received: by 2002:a05:6a20:7f85:b0:3dd:a195:dd5b with SMTP id adf61e73a8af0-3de9eb40b3bmr1206936637.61.1790771842345;
        Wed, 30 Sep 2026 05:37:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726c07f4asm738071b3a.59.2026.09.30.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:37:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 30 Sep 2026 05:37:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] watchdog: core: Restore WDOG_HW_RUNNING if stopping
 watchdog fails
Message-ID: <3dea2f19-d6ff-47c1-9b05-857800287744@roeck-us.net>
References: <20260929134635.2567137-1-linux@roeck-us.net>
 <20260929134635.2567137-6-linux@roeck-us.net>
 <arz4bE9RRKSMQMrf@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arz4bE9RRKSMQMrf@tzungbi-laptop>

On Wed, Sep 30, 2026 at 07:54:20PM +0800, Tzung-Bi Shih wrote:
> On Tue, Sep 29, 2026 at 06:46:32AM -0700, Guenter Roeck wrote:
> > diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> > index af756ee228b2..edf2cccd1c0e 100644
> > --- a/drivers/watchdog/watchdog_dev.c
> > +++ b/drivers/watchdog/watchdog_dev.c
> > @@ -324,6 +324,8 @@ static int watchdog_stop(struct watchdog_device *wdd)
> >  		clear_bit(WDOG_ACTIVE, &wdd->status);
> >  		watchdog_update_worker(wdd);
> >  		watchdog_hrtimer_pretimeout_stop(wdd);
> > +	} else {
> > +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> >  	}
> 
> This makes more sense to me to move into the block introduced by [1].

Definitely. Thanks!

Guenter
