Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242EE58FD38
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988624; cv=none; b=P4oAeVRkHLymH/fRbrxRrZl0WjfviKnPjDEcUyYpTnDhkySr7fWFUzZGTscg/ljkaW5lgDOhiU4pej6u3pJUrBJi2ZGJil05urh6yPYuZ3WN33p4O++6iAcQFkAA0UoAoirBsAWDQ3QZwcjyprinvKBpkC5S4LqwcNIb1TcgUQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988624; c=relaxed/simple;
	bh=k1jSlvLGd1N8T2+/PFzEq4zFFneeum+jSHZrxSX2XCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLqhGLKv/R9kGdKeEB9bSL9R4MZfOyglAsZH0flLZp69U+4Jz/JX6ZauKcOOXvPn+6/UEjW/WmLqYa3JgsDLASlDvwtKkTtfL3A9tuC+QFuj69DSF+fyTzzkt5mIG5sAGcVSZM7zG95YhOK4NmTV2/DyzYzNyCdPlo1UCDLovT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U426T8I5; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U426T8I5"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso8183501a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988622; x=1789593422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=elx9aBOBNV+MHhj5RKuekYxX8HXb64ybgFqVDYtbhUM=;
        b=U426T8I5Yp+PrYThRJHIUFlsPU+ApiV2zK0obVbnMaxxpJ357jd4mzznt8wQbtiWhb
         vUxDVpXLj8NhgNW00ftwIJh9oFxGF2dxQofBp2J0TTKF78+nFdyXcHSUnONvvxVETWNN
         1PpnSOYcuNCLe7jHH7UCl2SLoxdJDX1MN6D1TUST0lRf9WAKeh8U9aovxjzyrFl43oAH
         9rbrpT9ZQhp2lC+SmsjiPJIGakBQDcgqfbSoqtuMmv/ulI631F1AzA7FmQ+5wzxZPQyO
         opk2N9AET5m1VxqATNA4wJ4m8F7G+6JnFwJlQG+skDyq/Kfp7B2hl64ps6GashFPmuVj
         7pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988622; x=1789593422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elx9aBOBNV+MHhj5RKuekYxX8HXb64ybgFqVDYtbhUM=;
        b=n2jW8z3r/SJxccAmLzHNQcTlBVYffKUkiYX1Pr1vpGYg1eFIpF8fTH/YPep57ZTxzo
         ZPkkY0DATEejSJhZjn4cP7xij3U9Vr385AAL82Zrgb94MOQ9yKtDzB+T0tcJ47eFll+E
         wMDkGF8AgaofTg0uwAhH7cmBs8Hu4GVeYN/7ug7Rx4TeKX3T1i2gZOKpvFdM7AV8qri9
         XbGc7bAL/Fc0vL8Ivu87cI459wf8w/u6/5wi4e1+6JdrgLG5UJtwEuM5X/4cnhvkykxW
         gfZrIv7Ke4u17jDzRfQioIIHGZmgPR72docuw61hJZ8wDA2mYlHQuGCGR7U5tSokRds1
         50pQ==
X-Forwarded-Encrypted: i=1; AKwUvByXHAQ+u7i6/TTgoUM4VmehrDj2ryHr/Zgtvvg1a9Kg6VEgrCTIyhUh12auVRFjxVt23UD5Utt5rBkHV1U=@vger.kernel.org
X-Gm-Message-State: AFuF++meRVXPMthJ+9i9mD9xhFZeDTEU/3Y3CJ7r2aKjTU/funYIEyeL
	BrHcaUhtnuXjXl0xLNJu8ib3IUMxJPi1R5WJtOuTcYCNf7TIrBPiLygA
X-Gm-Gg: AYBFou22C2naRD0sxjgbTSwkjNLIMql/wY7LybaZnN8y7N1EErDTxMVjE1X9EjXmrqe
	OW5bC21Kyl/qHfUAKZYxzLMpYeeWgA7ZHcFN1qPQQQuS9S3KEOmyvpwtrqdHtnH1iwThrgfA/9w
	kpsuaQrc7LVtlNnYkuuLQP7VORd0zr9sCojk10LidQgviTKheacaAVEbp0nCxLJU/qChTz4Pmwh
	swPcgBFNIc2WzZL6FOQ23u8Z4GhcQo7bSNEPWrVyLJ4IcHwaszlWtj7vtO47kwS3CcZIgj5NETh
	ixOfXjUd8fEatxsbY7mFKx2gCQn8zUe/RY0qsDiWWwcqZlst4gKQyZSy36mfb+VD5h+zVw4mX6Y
	RYLnlRs3eXbsXM1cM0IEpuasi7ib9UWqFhfgMyuaA7M5WaOHC4VfO/NTGVzn0hPT/Sb23gDcyYd
	a0WTZ1lOBnW3qzxI+FKAPx2R7M9FPt+RDzzrwc/vJuf2JoYgBij1Gxp9AcdDb6aj0xxl+t7sjux
	XVvABIyqMaxlf+7uZnsFNo=
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr25249929a91.14.1788988618972;
        Wed, 09 Sep 2026 14:16:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d76aba5d6sm1440472a91.0.2026.09.09.14.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:16:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:16:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] watchdog: msc313e: Fix spurious reset on suspend
Message-ID: <b28e620d-4508-4287-a8e2-7d44cb062a67@roeck-us.net>
References: <20260828161348.13212-1-tzungbi@kernel.org>
 <20260828161348.13212-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828161348.13212-6-tzungbi@kernel.org>

On Sat, Aug 29, 2026 at 12:13:44AM +0800, Tzung-Bi Shih wrote:
> If the hardware watchdog was started by the bootloader and the device is
> suspended before userspace opens it, the ping worker (from watchdog
> core) is frozen and the active hardware timer continues running.  This
> leads to a spurious system reset.
> 
> Check both watchdog_active() and watchdog_hw_running() when deciding
> whether to start or stop the watchdog during suspend and resume.
> 
> Additionally, call watchdog_stop_ping_on_suspend() to ensure the ping
> worker be correctly paused and restarted during suspend and resume.
> 
> Fixes: ffd264bd152c ("watchdog: msc313e: Check if the WDT was running at boot")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Sashiko has a point about the bug in the watchdog core, though. We'll have
to fix that at some point.

Thanks,
Guenter
