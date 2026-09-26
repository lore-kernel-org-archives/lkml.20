Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4835BDC7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451802; cv=none; b=hPoTRuTTyjoZJB32sSrYI67Sq3dEBKKYGZRg8uvpDTMNIQOEmPOp6RbCOqZmTrlFJSs9rqSCt5Ax4oDT9PKTGk8kTWkJYCVL/Day3Tf+ydYT3spHJYu+pN+WsXOHdgbLRyt2Hn7bXMVrhvAzTM0KGggvBJm962WBujZ97k5INhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451802; c=relaxed/simple;
	bh=yFzj5SLBlau0HvAKLRZZb9fm5oHRvILo885f0yEf6+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIZFo/DTN4j6mFVJTaPjflCWyqGCl5llJfJF+IMu0fjJ+xdWnRecgh+sgE26JvmSxWjwle5INWhXfpcDb75XZrpVUEBmGpKp/CsBJodzkJ0eF3ugBgvv59e7hfdSoOKe+u7VWz0/JXdjYX0IskmHJ/gqXBveIEVDfubhoyYOWfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SmIezdHK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SmIezdHK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso1618645e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790451799; x=1791056599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGm9iURTFOlFsZwXuvtV7Ou17cgzdnPa0yxJVyNfdSA=;
        b=SmIezdHKprJN3ZjANvSWLfMXmZLxaKO2zcpWybN25horFWCOlgRmSQPS+j0URZrbmY
         tz+HTZ3ScIZUId5NJgaN7UFxraHNY9HN/VacwqgH3pE0EuProk/6QqX9mDR9+IkjrYTF
         cWwAB+0RxbKZFIusc38rbzVpnLaaU85OynABE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451799; x=1791056599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGm9iURTFOlFsZwXuvtV7Ou17cgzdnPa0yxJVyNfdSA=;
        b=pxI15cSZt7kWd1v9lt7jOaRNEu14p1ndL3A+mnQy23OnFTtcYGdOpyQfguztvQh3om
         yQddFg1r2RTsJKUn0gqVPbL0FLn4bFVI6VmrH4bajVAGUKN4XnG5iAWmkjX7XkeJtAU+
         en5o7jwN55+oKB4ADQBD3rR2mk6xXynQNcsfTpkDmuhcHKV2o5r6bmK2O6IEQqGoHTWa
         d50irTRPUS631MLrEQ9q/rPoYclWgnPn5Fs0hrQIpQOCzBHGI8jwPOH6Qp/xiXz5U9eE
         g/JbDe0o/AeYafkNQ+r6tAnE8hOrTgOO65QdHnW/qNkLrXqkxpZebsacFJqbZ6hKYzCa
         Yvlw==
X-Forwarded-Encrypted: i=1; AKwUvBxNx6hk1bVFUynCVrfwwW7QWmNrViXYFdaBDnAN9v/iEtzyEsYmN5LKvfxb9/d6Md9s9VBJNTUiF3VyU+w=@vger.kernel.org
X-Gm-Message-State: AFuF++nhbsHPuH7UdMtDMxkdYFXzxINrYHzrpgjhf9kUUSEzgxOs/8U3
	N6sxoOgEUY3cRNgLdSnm7tmZaxon9ZypY56fCzbd2bqdsrAQCbdFH5xGN1WMC4YxeTQ=
X-Gm-Gg: AYBFou1ZDvW1taxwfsCpxxPle/VH/y8woOIdparoL8TU7Qb+Csr2hN43S3LY/nOnWPc
	T3rtuLnK58jJBB0583fs2HtBEYsRiv407dFFj3FJFiSVznySS3hBLhl5bYCulCjAKiQCfeVQsr4
	ztQ2XmHO8vJb7DRBMOgWTdugTkPE6bPfd+AgkG1/0f9uGWtqzwGQD3tKydblJFr0vNL1WOQxnYA
	JYVzgvrspFnK+T+Qd3m2gNAUSG2k4k/opy7lTA82ENZ+9QDM/qHUr/HbjSETDeO7IthUbJ0nXk6
	iaKaXJtLq/nw6f0meASCV2WGaB5fJbcN49PYfl0Pm+dttA68k5p6/X+pCbLaTJTKnUQay7664c3
	LGHPywO+ilUEomQuaBSc6WKbkrvF3S+t1+axanC4FWlRupv4zBZPRD2EC93jBLeGVMRBwli9snH
	S+N7XvSAqDZMOEbJh1seAYkSs3wIBuwb9DULdd3rnuvERty0XyXBRkXVr7UgmdTUDRuwV1kYAro
	gLFd77tMjd7ngRkC5Be+/TdiwywXRCnHP7sZQUoBThVkrZZjQsf4XacuQ==
X-Received: by 2002:a05:600c:4705:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fe66d03b6mr165541205e9.5.1790451798838;
        Sat, 26 Sep 2026 12:43:18 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fffc12af2sm35786975e9.10.2026.09.26.12.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:43:17 -0700 (PDT)
Message-ID: <b0b2ed50-efc3-4b73-bf03-33adbe37cd2d@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:43:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usbip: vudc: Prevent transfer timer rearm during
 teardown
To: mhun512@gmail.com, valentina.manea.m@gmail.com, shuah@kernel.org,
 i@zenithal.me, gregkh@linuxfoundation.org
Cc: ae878000@gmail.com, michael.bommarito@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <CAGEsz8Gwh=Y31EuTJLUp_jq3HhiizHxt7_ivOuytyZZH06mycA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAGEsz8Gwh=Y31EuTJLUp_jq3HhiizHxt7_ivOuytyZZH06mycA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 15:51, mhun512@gmail.com wrote:
> Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
> vudc_remove due to race condition") deletes the timer before
> usb_del_gadget_udc() stops the receive thread.  v_kick_timer() can rearm
> it even in VUDC_TR_STOPPED, leaving v_timer() to use freed vudc.
> 
> Use timer_shutdown_sync() to reject later rearms.  Replace the
> inaccurate blanket lock comment with __must_hold(&udc->lock) on
> v_start_timer() and v_kick_timer(); v_init_timer() and v_stop_timer() run
> unlocked.
> 
> A KASAN/DEBUG_OBJECTS_TIMERS x86_64 QEMU harness binds g_zero to
> usbip-vudc.0, sends CMD_SUBMIT to usbip_sockfd via a socketpair, and
> repeatedly unbinds/rebinds vudc.  The unpatched kernel reported a
> free-active timer and a use-after-free in v_timer(); the patched kernel
> ran 4000 iterations without either report.  No physical device or
> remote client was tested.
> > Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in
> vudc_remove due to race condition")

If you haven't tested this physical devices and a remote client, how
do you know this change fixes the problem. Sorry I can't accept this
patch.

thanks,
-- Shuah
