Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326988;
	b=PBVRDu6TYeyAuPPGajr7fG0QCQL5K5O2d6B8NG5pZuHo5EsovZT26DedpoWr8bDSIXHB
	 /vqYLLGVrTTqGhamLjZY4vrJistbBZ3MF1NGqwQXOdMNOReLd6Glm2odBnhLwVY7ERHbY
	 GRSvUmuTkwgDjViVegOaAFayI3r6Ot4+qn1loR7n9CUQ1/iMXMwErMxwwywMSsczQ1yjn
	 6C3/YtQvgvuqU3Nb8FRpRjD2snEGlFO6PcYrRtr55xQDWNzk9cW5xvlaFPkvbVK2CgX5c
	 u3FFDou2GnwwIUd22Ir3nRl6AdcqHmcbDy+VgfQYvmHodbbt/O46030SjCwWhS6wXzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zz5WGsHypyEtdDcjSz1FOSuo47hN9fAyIAMB/geGHVA=;
	b=W/w0Ybt35hjhRy3TRswHNrCiuRLuSabL5k1Bh/sHUbhiC7WBSTLPV82esh1uBNQtVbri
	 mR8GKNH6SOHeXTuWqiaggzW2XgQNfvMhaJKgd+Qeu24tNLB5fLl8kzFxwTs5HuOOUZgA6
	 Bgt19vgjx3YemHk2Oc+gy9uQVkBmWym49ZbXP91Ile3auXgEsI9iIiYym0aaCKIyQbmQi
	 RqlayIxBxZSlLdUAT5IApv5fpBz4iqccuNmsqLGLtwpci80RwzXY0skgH9zZJQxsYXtm6
	 nDcGa6brJPkcYXbxDAKslSE/mmsLxIE23jzlsDqdMtcV5Ra+i/EEc1+Qks4nXJh4vYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MQwhrC9p;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B58606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MQwhrC9p
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5364042eecfso2692051cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793326987; x=1793931787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zz5WGsHypyEtdDcjSz1FOSuo47hN9fAyIAMB/geGHVA=;
        b=MQwhrC9pdshC+kxWKYleANqU9qxe8epHKueUbhrU3yry46AFngca57xcAwxJxHxkXR
         CBY+JIacdQ38jZHJhexEaW1CW4RB0kY/72Hsmkbh5f6x+yi8YG80QWSDpqPRRyBp6Z1G
         0i61hWrEOqjSoxhAvMeiuRx7hAQxB+IzKHyerExLvzz2fGnSI3dtqyFYEtB19Xaqak2/
         Yml+FAZSVG5x+iVKRIVoOmzl0eRep7EEcziaES1BP4TtDlqTUgYE/ElnReIhMyREjoVQ
         YNK5aS8+kwYWSOu/c+70Cghu7/osNwLSzZ2V6chOU9IYpsQhGPwu5mXPIZH6sfWE/9DQ
         gtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326987; x=1793931787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zz5WGsHypyEtdDcjSz1FOSuo47hN9fAyIAMB/geGHVA=;
        b=Q2Qo6jAYLiBwb8LLQZmw57tg/tpDi+JVx4+W2+MReoHS/nyF2gw781PRLMqC1gVtuE
         FhO7khTtec36TlKdcBnsS6/KJhCgYOjdlSSeF5LV5/rFaTXRaRmkI5miaGC9ou2ZcqKT
         VmHPK7FK064FwxdLGNwOg1BNuB3eVR0mWR37OZIdJIUMCPqzte/VRUwmElf1zZmdTjEs
         CjLoWTft6FDsZRK4uU+JLvTDgqHahc1uLSOEgby3wGTAnsRAvWbQtfLpC45aKCBZ0W++
         S4HBZQEHQkkxsOa6wp9/N7mRXBBHE3VMYtDBo83pBUqp+4OrKtT8v0eUtBW0tuSMpgjd
         31KA==
X-Forwarded-Encrypted: i=1; AKwUvBxdrPyV2bHrOCl5Q6QhSxj2678kMlqi0C/SXb+SBRJ6Nq3gD3Gp0hMyTkQZWh0RVQG15GbKv6kZa8oycKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcoIc5Uz78rLRHuGVIcKWPs+c2WOlummZ9KMVO4oCuQbeilM+q
	GiAJe6opkusm0IGrjTUZ56uXYlU08jWrYh2f95kFIAmbU7GYz9dZ0YPz2EwSEUo1aw==
X-Gm-Gg: AYBFou3dtAT7CSk7/lb8M+hZRGYeGk3v8wPAZtqlDZ+rWcNIHn3G2j/+7t1yTtfMQ6X
	RcKOzIeWCb8aCsXaGySZ4xf2TvltzhiibsxH57aWZrLfVJFhaD4cIpRSZ/ElVcoY06fgd9USweG
	Ri5PMUJGkraO4Z8J2TOm9gqTJeGKmp329Gsm71bUbC45++NZ9A3e8c0WsYsJGCVl2aO3PXhuxc+
	+zzajb6D/2mLdBr60i3qlcqhuSVv8aN/XckRM2pWArI8ftrlGO8eA9STgqcDifC77KDvmM7qUt1
	TpqcAS9FBHlulXw1Vv4Jp32B8yjEH8vw7KBMDYfdG9o5cDWbn9opdyrl1WVNYuKJaISzr8VWdMe
	ivrBBrGuYCVvHnxbODAc+LSJJ6YzozBovdVykESO/bemPuGJGNXLFzTU9kr5KlaMYz6xjzX2l4t
	j7gUFsMVsTlEtEHX1DIXqF7ESYlTtoafw6qh5kgax2WoN31hTqppunYhmKm27Y6TP8ZcXIvS8De
	pz3tgJnduP6Up8+B+CNr6kh6JDGuSwVl88pNfR82Szdp7aaMjBIarMPO5eizi0UKu+3ZYSt/qtq
	FlFZob4jxn/Tpx/0CSYE9x6aEj9NFQ==
X-Received: by 2002:a05:622a:8c5:b0:536:9737:e30 with SMTP id d75a77b69052e-542b62a563cmr16157041cf.18.1793326986787;
        Thu, 29 Oct 2026 19:23:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5431246b61csm1484721cf.16.2026.10.29.19.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:23:05 -0700 (PDT)
Date: Thu, 29 Oct 2026 22:23:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jianping Liu <frankljpliu@gmail.com>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org,
	shashank.mahadasyam@sony.com, johan@kernel.org, hadess@hadess.net,
	frankjpliu@tencent.com, guanyulin@google.com, gary@garyguo.net,
	rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: raise root-hub autosuspend delay to stop a
 busy-loop
Message-ID: <a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
References: <20261028041859.1061836-1-frankljpliu@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028041859.1061836-1-frankljpliu@gmail.com>

On Wed, Oct 28, 2026 at 12:18:59PM +0800, Jianping Liu wrote:
> From: Jianping Liu <frankjpliu@tencent.com>
> 
> hub_probe() sets the hub autosuspend delay to 0. An idle hub is
> therefore suspended at once, with no waiting time.
> 
> Suspending the root hub can fail. While a port reports over-current
> or a connect change, xHCI refuses the bus suspend and returns -EBUSY.
> usb_runtime_suspend() returns that error. The hub is resumed, and when
> its status URB completes the same suspend runs again.

Why should root hubs be special?  An ordinary hub doesn't refuse to 
suspend because of an over-current or connect change.  xhci-hcd ought to 
behave the same way.

> The PM core would normally leave a gap before that next attempt. It
> starts the autosuspend timer only when the delay is still in the
> future. A delay of 0 is already due, so no timer is started and there
> is nothing to wait for. Suspend and resume repeat immediately, and one
> CPU core stays at 100% until the port is no longer stuck.
> 
> If a root-hub runtime suspend fails while the delay is still 0, set
> the delay to 1000 ms so the next attempt waits. If a later runtime
> suspend succeeds and the delay is not 0, put it back to 0.

The concerns raised by Sashiko are valid.  If people really want hubs 
(or just root hubs) to have a positive autosuspend delay, it should be 
set to a small value such as 100 ms.  Not constantly alternating between 
0 and 1000.

Furthermore, this can be controlled from userspace by writing to the 
aprpopriate sysfs attribute file.  The kernel doesn't need to be 
involved.

Alan Stern
