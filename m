Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D33ED3CC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338442; cv=none; b=kPRjjyXRIJaoaTTV7N7n4CgfM/YgjY5OUbEWHtT8l9jec87KZ7WKsqB5Fqu9QIMxVUXpAW4iiD32LVVN6qczXRQmBDifTwo9La1r2Yo6RgAv7NKtOjTd3dQIW4QWx6rf2F6Awzrlnixfaor/qtf6TCISPAS6lo7QMsuyGhl1Uko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338442; c=relaxed/simple;
	bh=6xyVYgBjvDRYlC5dKAUtHMP5xW5qcq1J5+NeCUIzUSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AD4rdMI6Y+bk+o5EPNUYKBFD8d/quUYrTK23uthofIBzH761AWbcp4p3XPiyWFJ0ILxGcZv99F39azgstvbg01ecJwotnfV5GHLOGnyYP+uEm43Jv/9GbTSuSbVFPovktI6tH9J9x+kO9h55ADkl/kPhoGw3nYQjQWx7ftB4Or8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KHH3xS2Y; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KHH3xS2Y"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48436251906so893814f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788338438; x=1788943238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmfehxYEzo9SaHUf1Myafiql9t/Z4/xrEqiCgCkFexE=;
        b=KHH3xS2YSSAZxiAcGEGCkVegDDLbc0N5X1LL3dxxo5tz66e9Tr6p6hgJVfx2CQXoEJ
         ZfMOk2j8htz9wEk/KnqaSvYyDLMokDIOeQi6E+BR5yiBPHAiympF/lXWlAZEi4NYyOX4
         YZRZEL98u2MaiL42D+XVJ1mxP6GlYEbiqa/uF9PfFbDX7HLbgJulamy/bQqf+MMGgov3
         dq7Dzxx5evm+gm7tEiAMUHTKrWfFNWxPFqcuHwdR1MvIFjRpk/JJwnqKwRVAljxOH+bb
         wnKmfyHxF9tPpRB3X39oLSDSGWJXjgjW9zCfO8axxcVAC/2wur49sWQOi5JeL0imreZB
         tN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338438; x=1788943238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmfehxYEzo9SaHUf1Myafiql9t/Z4/xrEqiCgCkFexE=;
        b=oXIGMBGpkhIue+NFzwhYtk6NUWmjWayK/L9fwv8ZE+YwMJ4lSx4tZQK93Olix2GKMm
         dGMbOZT6u0dlgKGwfMtgNSjXJZu8CN2XDbOwk1JmjyzYw+qSHjN950NjBqSOhCalSUmj
         yVLGLOk/nEVVRfIvLg1X+9bKBYGtvXJ4iETMec5Uw0wrUrvAs/sj+R7LqxJwb77kIoQ+
         e+6wk0JXij0e1IuyMTg/1DnHaVp2LoUSfNPvRb0dRk+AoChuGbA4/BVvu/T0Rsl976yH
         1boTh3UDZGjcLuc2RgggfNGm9cdDMlL7JTKG0rxU8SpCWW/cQM5olCz8y/Kk9BPL/6eI
         B6Ng==
X-Forwarded-Encrypted: i=1; AKwUvByomeBu29R+3ZZMEH9A4uVURW5zZkccOcNXrVJ/pZm9yragFxCc/aK8BJtCUSmX8o2Of77uo8DAK4y4h6o=@vger.kernel.org
X-Gm-Message-State: AFuF++ndqPHCVAQTAPG0Mnxyh31N+yB7NwUXSl8uihk8v335bQMUEO3E
	+d05+2BigjuCRWvi2lj35nJE6e8ABc2wfFH8j7LnNDwHO9hIKYU5xI+PgFbRngcj/YLGa4tu8QZ
	pQ34Q
X-Gm-Gg: AYBFou2xVvsF3UC21JWPosdc3r7nnuEBZvvBSLoHk3lRwsKVlazMOFORgt59byHzQU9
	VX5RSyN+fljZG7OVxVmriskndZXfhCosHg+F9CGztr22d7Z6xm45JvFwSUQ8cQ/V/Obk/2aV166
	YuI7dp0mdcBIxC3uFotFhM6TXevrqUGu5x4jmlywnJEpWNnADnRRPjIqpQ75yIqvbt4RSw8Wesz
	TStSVVpvRJQQz9xx0cmVpmb4BHo6b8pc0+SmHP4EA1etoNf2Pgc9pZjNL9xMoVVEu9v5IAwRg3L
	FFzue2s0w5Ode7VyOUk/bEtgDPfrzjAoyg+SLcTD9/mxighSxXsltF1S48abXWVPSipe3d2as7T
	ZVw3CPHyXyuLh4fgbDoHdxQDjWyqdIIT3oXM8VOde3wwDYS6VQhlbeOaGxZYk1N1xuVDASqnAdh
	sDf1y8LYuqrUnWKooBmdSF7DTNP2lT6Yy/+lnevbMDyUrDUSMSHO8uoE4wnKDtUXnod9JGG+5jx
	fH3XlRKpU0WpQwCbnNgu3X6+1z/I1lE4KUdgbfz
X-Received: by 2002:a05:6000:250c:b0:484:3310:c4fc with SMTP id ffacd0b85a97d-48488f24193mr5629136f8f.23.1788338438306;
        Wed, 02 Sep 2026 01:40:38 -0700 (PDT)
Received: from ?IPV6:2001:a61:1304:a201:f0d3:bdff:55cd:3f16? ([2001:a61:1304:a201:f0d3:bdff:55cd:3f16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdbfbsm4917843f8f.33.2026.09.02.01.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:40:37 -0700 (PDT)
Message-ID: <51d22cfc-eb16-41cc-b27f-3bdad4460463@suse.com>
Date: Wed, 2 Sep 2026 10:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in
 endpoint
To: Michal Pecio <michal.pecio@gmail.com>, Julian Oes <julian@oes.ch>
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
 <20260901231355.114733-1-julian@oes.ch>
 <20260902064204.1a47cd73.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260902064204.1a47cd73.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02.09.26 06:42, Michal Pecio wrote:
> On Wed,  2 Sep 2026 11:13:53 +1200, Julian Oes wrote:
>> On Tue, Sep 01, 2026 at 10:28:08AM +0200, Oliver Neukum wrote:

> What you are probably seeing is USB 2.0 hub(s) returning STALL
> handshake when a transaction attempt with downstream low/full-speed
> device fails three times. See USB 2.0 section 11.17.1 page 364.

Nasty.

> If that's the case, the device endpoint isn't actually halted and you
> would see the traffic resume if you simply ignored the error and kept
> resubmitting until communication is restored.
> 
> That being said, calling usb_clear_halt() is indeed the only recovery
> supported by USB specs, both for -EPIPE and -EPROTO or similar. Linux
> has traditionally ignored this and things are quite broken sometimes,
> particularly with xhci-hcd, even if you call usb_clear_halt().

I think our record is better with -EPIPE.
The question is what we have to lose. Frankly, compared to the
status quo, nothing.
  
[..]

I don't have popcorn, but I do have cooled, sugar-free beverages ready.

> It seems there is only one risk of usb_clear_halt() in such cases:
> - you send a packet to an OUT endpoint
> - and the device accepts it but you never receive the ACK
> - even after re-sending three times
> - you call usb_clear_halt() and queue the same packet again
> - the device may accept the packet twice

I am afraid this is the time to be pedantic, because I don't
see the connection to usb_clear_halt().
The fundamental disagreement is on whether a packet has arrived
or not, isn't it? So the fundamental issue is whether IO should
be retried, not whether you clear a halt in between.

If you guess wrong you either transmit data twice or not at all.
And there is no generic mechanism to remedy that. Do you have
a proposal how one would look like?

However, eventually new data will need to be transmitted
or the device queried for newly received data. If that is to work,
we'll need to, well, do IO.
Our choices are whether

a) we retry IO before we do so
b) whether we try to clear a halt before that

Technically these decisions are independent of one another.
However, the spec says that we should clear a halt.
So I need to ask: Is there a situation in which we would
make matters worse by clearing the halt?
  

> One note about rate limiting: it would perhaps make sense to perform
> the first attempt ASAP and only slow down for retries. But arguably
> anything at all is better than just giving up like now.

And again, you make me ask whether a helper for that should
go into usbcore.

	Regards
		Oliver

