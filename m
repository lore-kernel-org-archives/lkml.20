Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F79C448BA0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752975; cv=none; b=N3BzUz+rVA/wTtY44RdLop4IOoh3KmCkc2o828yaX0IVlWICyZscggF/n6el16F5E5DmP+jSB49Yv/1LZKq+FxzSpYroSjD+Cj/KC5X5w+S70vypPbkeDAEY6dCB0v5Rv3psWmNy9oejjoOQvcSVHYeHt5ifflYthknnjCYs/RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752975; c=relaxed/simple;
	bh=nV/iNF+/tr5R+HlRYzbBMnjCuktKhfYLuFq/OkCFbkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aO54RNc8yZs5bErvAEA4mv5tzFtaNttPR3yRVL3CA6/ubIpg2ANIjD08ZAa4ULgMvpab3wNgK2JOOeGHFK1oYuI8TCfkp09KWv5N9ReMyePvNLPIsMKOtPJSJIB+RjylGv00J4Ytn+okxLYAGpKdu1s8fMuANSDoE/jtc4A/sCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bPli6TS5; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bPli6TS5"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so1765733f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790752971; x=1791357771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3py4Gq1rrzGZxQ3f33llQv9RYaeSHhngqz3ACgv9Wfc=;
        b=bPli6TS5Ixd2Gb6EZaEhVvY721ieF8FawUAGhwt0PPwAvAlElpIOE7aW1BSHtohgwU
         DRh0V4ouZ5gGb6B9VBtY+S0/Yju5OtrlMuhZzTXa4crFzGmHI1h++ZffIpeXbiCdUAA/
         vESf8sjr4xnth7pZj+9dTtih3tiy7xros2Npm8W8O4Oq9IBXvC6awxihuxkPQXCaPBFX
         9ct4N7lbdDawmvWKrcc1OleYlWSy+m7IQGrW5TUiVCHMv6oTLRyMdpgE/3BQFZS7ivS5
         jY2uZ4jtOyvww+wpSsPrRfH/oB3i8aAqfpGTdohhqgoQabXdcRuPnxIxWoLP015eJtgo
         3hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752971; x=1791357771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3py4Gq1rrzGZxQ3f33llQv9RYaeSHhngqz3ACgv9Wfc=;
        b=sbMm03nlMU88cAqzfZMn9fcqJAGyKxOhWmwkxo484mRjYmK6buVqqwb6DPqLrmD35b
         M935+v/9NBP5TVpPJPHpMFwZ2ItRHFruj1XJi967xu5oFNMqsynz5+3BN94+lHIxzHlY
         AsqqwxBkuyQdm2QKFfRTVXthS2z0RDbVpZlydFYmmlzyfmt1Q6KNueH7ee/8aP4C2Z/S
         tvpCP8PPeDAVG98z6KNEGyvHFRV99IwYWPXFVlz5nKBtdFISFhL1WBpEB53PRR1uImkb
         k2y5woBVfiU6ipZgmU5tGXgsYFOuKs4EItqN0kN9ywZXlknUopCK4ILkely0tRMebp11
         HP6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+p7zi3TXb/7W7YNgMhqyKgnzRCMVB++0FrbWWFeiK0+mF9AiHeXOU7+cNdyIRj2wpgHExZ8VgmSGaW7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k9vz/yy99VbnnmxzON8uLB3TgjNhN0ngxkcXNqiTtXn8WjqRxO
	aShdZJRBIStGxecBzBbgRK/6D7RJ9jRiYTcrW1ICKYvtaqF3tA5wc2fx/h7E/bJd0zA=
X-Gm-Gg: AYBFou3NBBLLtq75Fs2j92VHIOJMU9iO1CnpUjTjbMGaroFmt+2K/x1hc15Ft5cDxQo
	fqjPFqMXK7+RZgmGdIiV3yixSk5qjERy7p/47RkxRjGXuwRJ4kHFjionYUBKR8EVjviSuNCwUAX
	M9TUzIcRI/T5NMDl82E1sS0IHoU1b2k9UwJ6gowWSxx8l8YaPQuxXfsutlvZU64p0LBcDcX5jVg
	x+8d/KIBR+HSbzMuW/8fy0ms5G6WBF+TlMVGqh8q1nDOE7/wCciuOHfMqxPBVoefi/mSEQAqIF8
	n/ZgZTr0yfnyO/kfyL9bBlyFORb1IpPvtjsrbMZBeZ/YtIUg/yxsrt8Dy8AI9hL0tResK/HDAlw
	JuVRyonFlvIjVE9UDsjTBSl8fcE2RZzJQtkqtrjSnppv97suiPVQlvp8dVHSU8VZMCcf9iPpNyj
	gRv745vBl/79Vy/g84shSHk4hQBdwIHtFrRaoMfTSrW3EzxP20LN7vLofNZQoBuJ9LA/weCkQth
	2PKwRtHaBOQfWTO+ASDZtecvtxFlncK5YRNDKyTXA==
X-Received: by 2002:a05:600c:c491:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a01b1966a9mr6038175e9.5.1790752971184;
        Wed, 30 Sep 2026 00:22:51 -0700 (PDT)
Received: from ?IPV6:2001:a61:136a:b001:2f5f:2aa6:50c2:162f? ([2001:a61:136a:b001:2f5f:2aa6:50c2:162f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm11026135e9.0.2026.09.30.00.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:22:50 -0700 (PDT)
Message-ID: <813dcf3a-0615-4152-baa7-47b0046ca113@suse.com>
Date: Wed, 30 Sep 2026 09:22:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: uas: quiesce SCSI before stopping endpoints on
 unbind
To: Jiayi Li <lijiayi@kylinos.cn>, Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <d3639d68-0213-4b70-a771-aa5dc3ec9767@suse.com>
 <20260930013332.829717-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260930013332.829717-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thank you for pursuing this issue.

On 30.09.26 03:33, Jiayi Li wrote:
> Hi Oliver,
> 
>> Acked-by: Oliver Neukum <oneukum@suse.com>
> 
> Thank you for the Acked-by. Subsequent testing found a regression in
> v2: physically unplugging the device with UAS commands in flight can
> cause an approximately 30-second SCSI timeout. I described the failure

This can happen. Don't be discouraged.

> in my reply to the Sashiko review:
> 
> https://lore.kernel.org/linux-scsi/20260922100542.164047-1-lijiayi@kylinos.cn/
> 
> I have a local candidate that keeps the unified teardown order.

Highly important.

> When URB submission or completion returns -ENODEV or -ESHUTDOWN,
> it marks the transport dead, stops further submissions, clears

Why this specific trigger?
I am asking because -ENODEV comes relatively late in the process.
URBs tend to fail long before that.

> COMMAND_INFLIGHT and sets DID_NO_CONNECT for pending commands.
> It drains the remaining URBs in work context, allowing the commands
> to complete through uas_try_complete().

In the context of which work?

> Does this approach seem reasonable, or would you suggest a simpler
> way to handle the physical-disconnect case?

I definitely have no simpler way to handle physical disconnect.
With what you describe, while the approach seems entirely reasonable,
I wonder what is to be done if error handling has already started
on the SCSI level.

	Regards
		Oliver


