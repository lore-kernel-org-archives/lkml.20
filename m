Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50358F079
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986664; cv=none; b=czoZ8UolfxTbQYtThSpphZmQblQQ+ZyDGGFpckS66bi03mspHo7TpKIhYZaLPjzQPHn3bG0LpRK92MphylLGLGkX00ojuHNFN9R+r6/iC+kQlHrey9pHM6dr6LEQ2gbArQK85JoR93v3SFKBCB0OdeI7pKn0lxdAwzhDsXdBOp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986664; c=relaxed/simple;
	bh=50nCYJPjbqQUb9GuXVSadJfp9i5nwJt7sQqIe3gmZNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3WiplNRD06CecYt9a6cGbY9VhihGYixo4+ZRwYlJO9dkUk80r/rorhE9xOukkugUNfbi9izc9HZ8G3RjHUK2fCP+dm5vInkBvzpL7S4GuIfPGtbk7uoIb7n+R3OvQiq2r9YS/a1y3afaNJ9H9sdGUzH/39SDh+1C31sB25oHzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyQmSBlT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyQmSBlT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4b28b358eso86740a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986647; x=1789591447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9fkP2hJvytILEzpGHVJRqCYsbQTF7+11HBlBKosjXQ=;
        b=DyQmSBlT9Q/L8ySaZ190Qb0hO5LHTaUHDL/8x7plTZLIJOMCSAE/UyiCGeD0+7UK3F
         /RtnZU/JvN9PZAYLpvFmOEBrmw6I6uu0F/4BDfaLAugx6gN0tr2ly/5CNc9FrzkedC/7
         7J7MMD8JPafiiZ/SXYiBbzqdNvf3NCd1ly3C7Roy0jIU/fPBsCQ5bLXzBNFlgNL2oo8v
         Ve92+ckWqFZkPwhUOBcI3x61px4tsYng4pg2CXuMgcIunqLh2LF+9uYuc8uSN8lzwSL9
         NGhicqv4GZEKmSIYCY/vd//6rK6dMisIchmXUlc9n7NwgcRuusMy7oaewzpltD51O4sQ
         gqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986647; x=1789591447;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9fkP2hJvytILEzpGHVJRqCYsbQTF7+11HBlBKosjXQ=;
        b=dSdZCBOrr4mmrpQP/6YO4PlK7mFKGoQccxcFmHnpDg9nunbi+DMsYtedXJm7LzEAD8
         QFFSOzS5JuoDDFe1mM02IJ25Es0KVwnFGk2WbBt4o55p4wvRdoKiZad26Eky9LtdP+Tg
         uSOCTp64AxsIwRTiLEYsf90pBTkHQvRM0F3jq4XhRGVB3/K+Pvd72XNCx9nWAwwhGI9L
         SQRUPuRIYgTx+U7NYjw52TpTrIk+5ag65DVgL3REOZnSTvFw+89PbEP1K+RMoDU+R566
         Km7iVuZ6aTQtRhy4q7fv8KEaRXZWX329ALVta8rgdDh7j9kt4nHUXH4k4yUEgnQ7NfQM
         ayGA==
X-Forwarded-Encrypted: i=1; AKwUvBz3OSZZWavJeIm/Q+1+PQWhOPyDQVMkuOugoZtIm7d6RghxH/OQ4BOU76KH/EdyAnHpm10/TM1hxvZwk3o=@vger.kernel.org
X-Gm-Message-State: AFuF++lfnQh3yTIpFdr22FBZh+sf7UoxHMZxryPPTv/0csFOdcske7+N
	vi9xxVVGxbYSFA0QpEbVYYW8ruoFoRK0OGdKiFYlGMw5AsdOSNY0Oh7l
X-Gm-Gg: AYBFou1gjJcnoQQeKM7Ed8XxRJfwREDG1TJJFxZnBK2cGxi5pWZ6DEg9w4kPUk6uuuG
	Vsm/RL3lEKfRN0t1CBHZQxQshzmITbqRTJkj5Uf+P216gsXI9cO2SFJb0D2yLdCmdATPO4fEYPD
	MGYd8RJHSh8dUCaohfqlVy6nPgYla8vkr6oHVCHP9ygj7IPEy5xLwlfukjsOnwPGqBFXmQwreFb
	iYoSVuEVq2IAWX3C43fIVTgbnyZSaq9hHdzj4OwQ2QtJa44hTKpcMf0gU1JdsOQ70aHGxpH1Qdz
	6djlqsohzuA4kUddZ0XrYglXYmoEUIPiinBrYmthjiI8ClLWf6Qg/JqB3C2fIjsCfwp2fHHwQ/h
	xYSDNEYglhuZBugF+hVpjdGiF6k4juZcXaD0CsxE9GM3LjsWfSKniMdvP//YeGaNQNnG2q+zkhV
	njh7oCmdbCJEhkzrOaguxBMOwXzSg9n3ORi0IevDrx71KbbsiB5jJzXHbScFwW5ZqT41kNtIsn5
	4ermoQ4maU0
X-Received: by 2002:a05:6a20:72a6:b0:3d1:e510:905f with SMTP id adf61e73a8af0-3da39b3a6b3mr52747720637.1.1788986647535;
        Wed, 09 Sep 2026 13:44:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45542dbbesm7256657a12.13.2026.09.09.13.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:44:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:44:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: i6300esb: do not stop an already running
 watchdog
Message-ID: <b52365f7-27d4-4c5e-885f-65413c7d2bd6@roeck-us.net>
References: <ea413e5d-9f37-46b8-8d93-863aa065a784@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea413e5d-9f37-46b8-8d93-863aa065a784@siemens.com>

On Wed, Sep 09, 2026 at 01:15:33PM +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> esb_initdevice() unconditionally disabled the WDT, stopping a
> watchdog that firmware had left running instead of taking over its
> care. Detect the enable bit in the lock register, set
> WDOG_HW_RUNNING like the other watchdog drivers do, and simply
> reset the timeout to the configured value.
> 
> Assisted-by: opencode:Qwen3.8-27B
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Applied.

Thanks,
Guenter
