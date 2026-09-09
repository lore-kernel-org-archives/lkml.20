Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1763C4B6F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988118; cv=none; b=YmVPS8fX30zZ8wMjvy6hKnERxOCxO+E+pyigYfkuv+NNIqJjwpPFBHKMCMCJCM9ZgAp/7m9NBsqm4S/aQfK1FTI7THJILJt7DKzLIleNr1YedcSphn0ZFfG76nuns5MpP3gM9Ui8EyfPtbJyDmfU5ndHavXoaw/ZqjbuqEGsJcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988118; c=relaxed/simple;
	bh=Gajsr1kiLHqQCQ9SqWmRz8Vv502++7s2iR3vCVPs+KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCRBFQfedAuSQXV0gyyMeRmzYGdWb70CSHWVTaWaHoe+VXvtOFGFhTu5oi5SgaVefJYXGJXCYTQAkj31vYgOnNV/loJeBhZv7pkFVpRkisGWpjF03FFuripQo7QeWS6rjetxTb9U9l4m81Mfr8VNgVsHaIF1eM4XKs9cAKTvvVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYAvu2PS; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYAvu2PS"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39675172593so5311619a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988116; x=1789592916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UEK5sBdqDEjQeev2uIIR4l83OCeaIGTj3CDKY7Pw4J8=;
        b=rYAvu2PSoGHzDIP4wVJdKWIpRX+vtswYW802CsIbMIxuhNml2C4dLqE3DLFBK9SNNa
         QTpAvGOpTuWljLZsBDdDJNBGPPYBEBuvdSWMd9gzw4KK4+sMhPUFPTs5O/J0P/Yhzdn/
         mAs2qRPYVh6KJked+j5xTlAoLYbwzBz/hLWG5Y0ekNE/661xL7y94uSokxHZcU/Prsss
         G2yfIAZ2YqCBTfqYcQeiBm20R64QVb3Avp0VaOAS5f5gaG9uEieew4wKvy1R4TG7yhR8
         DwaqnsSKg+sopQjKx+cWfadcelhf2hHsqDBmas46984wfDIQHYDGPEmAvMXIcMgnV2Fh
         HEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988116; x=1789592916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEK5sBdqDEjQeev2uIIR4l83OCeaIGTj3CDKY7Pw4J8=;
        b=LCQ/U9vyKLCrhHQOmheButGF8+lvC83D4x55qNnbijCWUl85wr11Kd/sBHaRg6KHgz
         A/TA5IZI7V9vi20z/hG9gC6mcjIECcJR41BMphlVdzUVZAn8/6pvssDUK9bBww9yz6eg
         DMkA3JaDqqT7nwbDcJ+wxqlYrmjuwVV4Ij0E1TcLZcbk2nVivsFCzxq2bW8D8RElQE2Q
         voAIrvUcqs1aS6bcuNgmGSWJ+Lnz/q/9ZcJ5ORxLiPQ9NsbMnWf4zccOSmtEGvnp75En
         rfxScWzoxZTEnhFx6K54KTcUQxIBAGruQQrUVZLadPD/A8bCEy0Czhbn9vvJiw023/Im
         G6cA==
X-Forwarded-Encrypted: i=1; AKwUvBzHfk3jmgcUM8SF59dAsAswaUkjy0M8rB9d5x0ruqXprbma6cF924NAp1LLpgRv7rFWOhcdZWSahZhTrDc=@vger.kernel.org
X-Gm-Message-State: AFuF++lZKJjA7HYTdY4Czyk6Y3Fj4MLBfW6OPNdklI2ZY4STg5S7IOWE
	C/LlPyL1HRlpsdfRaMywZnHW7v7781WZUZB7S1VdgLDriFt45L8MVnhcCPIcvQ==
X-Gm-Gg: AYBFou3/Z2wbwJi6cq3UrLw01uQxoJSd9u0BnnoJkoP6S3Nay2BBvxTKGCOVtE+dxst
	bnE8Hox5wquAjdMPfsP6E8lL48V50kdg/zyJ4FRQleHtpZvW/7Eg4Pjqxre/VVvotxQW9S5lSWs
	TL0ExBRn7ZWG1Hs5ugC1bpJMg/ETUJ+tA8/ijc22gBE4ZutbqnptiIxfhLywMDNvJo0wU3JRKL4
	RbjjA8pf2HzrZ/CKdphC257xI7XtK3OeIqeW8+xgVowotw7EmnupWe/FtN7Zkvnvfs6mHYXlWIG
	8tVKhRkBZ4PlghiczUR5Tk9C53J0lbe5AZnCv5kLW+dEtPuSWeejCBPdC+VMmTV3f5ukMnoYgnw
	mjP3Y88bDLbhTXYsUwnx0Y3/JKCMQrElDl6pXKZmToWGYSY89GYDfSy4Cq3e5larawEovG5ydrk
	mkLRd5IAksRM5AmmCW4qks2fzSADyepwrFtXw0esYhKKRDpwFz7DXqP7vpS/+QnQTki3YSEZHQD
	Ei9Ce/B0MHpHtzSxtQg+tY=
X-Received: by 2002:a17:90b:1a8f:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39b2612ed35mr52904411a91.7.1788988116308;
        Wed, 09 Sep 2026 14:08:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770a010dsm1359550a91.3.2026.09.09.14.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:08:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:08:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] watchdog: msc313e: Avoid division by zero
Message-ID: <2c0b963e-6379-46a4-bae8-92ec2d76f8da@roeck-us.net>
References: <20260828161348.13212-1-tzungbi@kernel.org>
 <20260828161348.13212-3-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828161348.13212-3-tzungbi@kernel.org>

On Sat, Aug 29, 2026 at 12:13:41AM +0800, Tzung-Bi Shih wrote:
> clk_get_rate() could return 0.  Avoid a division by zero panic.
> 
> Fixes: e9800b799464 ("watchdog: Add Mstar MSC313e WDT driver")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

> ---
> Simply browsed code under drivers/watchdog/, the following drivers also
> use clk_get_rate() as a denominator directly:
> - drivers/watchdog/digicolor_wdt.c
> - drivers/watchdog/rtd119x_wdt.c
> - drivers/watchdog/rzv2h_wdt.c
> 
> Let me know if you think we should fix them as well.

Yes, we should.

Thanks,
Guenter
