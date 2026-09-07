Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC13B47FA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762614; cv=pass; b=a5hia50ba1gN26IFQmr2Af7aEnpz6Mg1OqFvxh+mfY4s49xjU+oCFBZhTX7yKHcvG4cBC9n5j9BwW+XtZssbQBjiMooUHP4HIp/SvH0PACWQIlOHmVTR6qXTOrCvkIYVwDfapzixBCCbwqtneYsENr6eP0+QjFP5Q52IFmO7xr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762614; c=relaxed/simple;
	bh=BTlSK8IEuU/ZfhP4e+N4l6mYEm/TqMP9+vi7uMPINYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frcL/DZzWrnuhejY+Pij9J432Edzm2o0dLwYeAIMWKnf6KlYA6nKQjtN5xopnq07FMDMdRzPCJxkZvs2NEh5s3Rc5ZiNdI0nveaAejOz5vCKCDHwEMtU0mwH/g0DxQaoSJw6b7hZz/z+3tCLNPYyOUHXQyN9F+ewGpza9kf9hfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=IcXBGKbu; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="IcXBGKbu"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90d7fa95a58so34570396d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788762609; cv=none;
        d=google.com; s=arc-20260327;
        b=s35JNT4GgfBlgW5wlME9DjSYGq/JajYM5myPlTwXxdSAOCsiCzELTQU2ikI+iVTRu8
         kg0kLIrSFUEFK9Y4lgRuIAykOAWNyKV0zt8LFbjjwb4y0JyT11WhjzqUuj6geikHb9iN
         B51p3V0BDocXpqNMGLLHr4vZzlM1pWFK6p3AkuxxdFswozxz7hrqsJxPq0Ld1XmYW7+s
         tnmhnWL/g7H805oBNku8dF2YJ9LPqkgVH2i7aQ0a5+w2JzaSHYJTAfNMdcni9lkk8jY9
         v9mnXlTuaBHbj0nMSYZugR9UAWAnN7XceEdG+Y2CreBIu8zobOGUEBHC7XKnw7JMuM6q
         g3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BTlSK8IEuU/ZfhP4e+N4l6mYEm/TqMP9+vi7uMPINYw=;
        fh=YFGYnyHgooI+/TY2QyX7Wms4fRshuv8dDeRs/US0OB8=;
        b=iAw2F0IwHivAFoYB3IYOPjowoxSBM4Ub03aMWhqRhpYfGiLFcRUUn2H80ZMdfftjKE
         wG9Q84LASzPuC2n16KPj9ZROQQuiv1qs18oEJhKQcGJJ494Grdb0GGBgyQqBfB578mgJ
         7vC8M8cHb2ciWIWrBikCeLAOlLrvVEdemsG6taXGhZhZ/8FXNhWmj5ityLddMMXvoGgQ
         M01zdmSBzh4E9J55+TX4u3kvZm+w00bKX6JRuPZD46r8OJVXUSyIOCYKGgSO46fZPBq/
         C/qAAGC7D62WqSjUvv5d3x7LcdV5bQEQB62OXkaLHkyYR9DwgB0o+cHjXkLYC6EqrGdf
         KXWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788762609; x=1789367409; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTlSK8IEuU/ZfhP4e+N4l6mYEm/TqMP9+vi7uMPINYw=;
        b=IcXBGKbu1tzIa2MwkfNiJOctqGzTXzARla1cztFTyg4rqCMeOehHfzLWq0X8U8rnda
         Y1Qu48GV49PO+vxd3/ht68GQ/Xt7Bh6WoLJ//hDpbrNgI/idse6MMUonBUdgvxqP7Nil
         QLxPwxpl1Ha4sQTZacZkefYpbu3SxsmGb4E8dKzOU5Lvgap5PE8LXD+QHik5Bz2edWUk
         EjwO4ZoRGfWzPRtr6GKsjKN0fqn1fS74Ak0ec56K85h+5uh/0TeRVNigJ7qX4umMgD3G
         cAxNU9TSLtOOlcfhFnVhhaljf7IHTfbqx6EX1xJR659Lv7GdlPmV12aYz2rB/mHThjjR
         BAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762609; x=1789367409;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BTlSK8IEuU/ZfhP4e+N4l6mYEm/TqMP9+vi7uMPINYw=;
        b=NIz2oDK9jqi447gzWhIlbfseo3UUb+KIOBsa51PXVBKv2RfLWf52aGIA3hTXku0DbV
         AlkazqnDR6q+CecCLu96yzM0vlPiNMQ2PjnQ1G0tMHlH2sPxFOTJXyr+lGH4SFy+4AIH
         yOwBTb361gjWd0EzUmeED1UoFA87njkkYMWXN0coW/et5Fobq0wAS5cjEzL/3sznc9y9
         M78PW4NqhgzbUUk3d9/WtF7JCmwYEPqrOFhFhAwwR8FyRasSZWcgq9mYsrheXJbIRBH5
         PtAUj/2TQsmU0QZe+l1s62fI5qLpI7KWa6eIYyEouslMVel8I/VU9kMxPPxjH1acG47O
         Pu+A==
X-Forwarded-Encrypted: i=1; AKwUvBwnY56iI691211bjKFlOwKA9+z52uUJZK06VSQgxTopqz4lnT65zAC5rGcmordiu/G50MmktM5W96pusog=@vger.kernel.org
X-Gm-Message-State: AFuF++lVgQ6Fcsr2Uxo40t0iw8ogdMXZo4o9Q2+TA349ZceOFHXSQMZM
	bc+arWsbYgzgjYpAUNiBVSIaDOLXKZjnh36zaOjgsQVvQSc08aDz1oIPhQ0MvROwBcw0hzRuA2p
	sISQ9iTUp5eYXLeMsOyVvC4EbC/T/UujOB35aBuyQZQ==
X-Gm-Gg: AYBFou3s95f1ggYvzxyZSPd/olEtICWPIVYlZQlG8o6v8j835RE0GFfjJUfO48Eg8sp
	E7GF4CnHntPLX9r76MOFht2Ob4hqB4bKM1MUPqhOdAsGGQLp9O7XQH1BnILawJohrWEvT21BQia
	IhFw3XtiZS4ctFRQyUpvwzxxSTFUbsaRWJEiw/ZTX8KejdAM0kcpNbAQ89+DAFE3SEzwWNWJtoo
	nzzrK5HAevzElm+EHMrh6bAuhfRDcfRxy0EEWzaL83maSCFeK8O+7rlQKYkw7DQpcPSBzdZpuIJ
	jxBVarwUECq11aqA22dCvWEy7TGTKhlOAIXDWCEP4qXviXIsfGoLrIcYeDupZZ9uazUn0Y2qopJ
	u5As=
X-Received: by 2002:a05:6214:482:b0:910:4baa:98ae with SMTP id
 6a1803df08f44-9104baa98f0mr120884516d6.1.1788762609584; Sun, 06 Sep 2026
 23:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-acpi-firmware-v1-1-7e4d7a09198e@thegoodpenguin.co.uk> <ap470yV5nunouUL_@google.com>
In-Reply-To: <ap470yV5nunouUL_@google.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 7 Sep 2026 07:29:58 +0100
X-Gm-Features: AcwNN1WRvyX32GGQfQgurGPgW7Z6MfiXEQmYZW8OW5bVbpbsLQ_b5OXFZsk8Jok
Message-ID: <CAA6zWZLxEi2ep7HYxMP-p398cGwoLD4r6wqU7mHBbBAGn9YicA@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: use named initializers for acpi_device_id
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The file has moved to drivers/firmware/coreboot/coreboot_table.c recently.
> Please rebase to the latest linux-next or for-firmware-next branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/
> and resend.

Ah, will do in v2.
