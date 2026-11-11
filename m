Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387442;
	b=vcIKoUrIS8Vrw/YjB4KzGAGIk0/H1iZSIMDxATOCOhPcB1Wy+OtULwV32kfjrQtjkk0T
	 qj/EKNdr+MLME/SYkqcr0dlHP3A/igpcOS3sWWRKUZfQsX2xCls9ji/oS4ckdhQYTunQA
	 EiHIeIDX8TBgBn5fd4hd6qntCGaufu6Qvgf8jXsx4uQsBKgvYof8ELq8g+suPNtCyvWZx
	 DIMOl49C5JmY5bdqikrqdNdvGdGSCv470IZ/xchTr90ZG2UDC4MR2Wa20aw1+bo3WoIBa
	 aey1XiirXQ8iDbm4mdRZvvCPvqU+fPCp/q5nC4gnO0uYK4ntHVSsmRaLSOti1mTBdiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=TmyvoYQN8Xr0ogKf42Npt/1uUvAg4Sn8MVVxHY9pi3g=;
	b=KMfrfUYQI1rQsIEByn9zuditIY0VmQKQs8te4bjVDxIMXEhdBsW2wwEPtji6EgvMWZbR
	 xugAOa4bCQ75MdXyJdTvTZao7o4r54dqY8K8OaYnP/jRtI7r6GOmaarN6A2OdXnyxqU3e
	 nyxa/k7CqEmdudh3/AOYW63n8DQIcm4sbklng1I5nGJJX71Vqu+4THz4kZCD5mjmcs/4z
	 wyE2V2HpYVnboeJMb+XEgA0R0Q3U+hIHaqDaKNQ0irO3WkxRmY3BZ1hMNwjEGVJtqx3Ux
	 V0zEFvr2XNXdEnb52DE8e+5jR8bXt5kg8W0O4MRn8xre3aAaiRa2O7KLO+K6MQYoMGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JZ7G9fcW;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F8F60A260A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F8F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JZ7G9fcW
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d58c50743so252953166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794387440; x=1794992240; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmyvoYQN8Xr0ogKf42Npt/1uUvAg4Sn8MVVxHY9pi3g=;
        b=JZ7G9fcWbH/o78OOgwAKmpN1iTKlwz+zWvPt5iYUHy8qkl0bh5aOPPN1Unyt+3/Ix4
         IuhmMzBATvD4lh2k1kmkWoxwn8M22fVKCGDRCP6tkk1lkH4o0IDkNuLYD1yuofXCEnEl
         eFD8NCORGQZmL2jeqEYhBy2uyOtbuSbD3eh885X5BAQeuw76BhH9r6oIPa+bP8Pjs8JA
         67Lu8SdpXSktP+2d7fZLeCc4fWjQn27wt6ymOvFrmZCjSbNkB9+1AawDKFV99R9tnJwM
         LbmXBLDNBG7DN80BBEAtHZhGu0i30uio9SIRxI2Tf+b05e1zXfjhX8fBdF4hzyEWbLbk
         vIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387440; x=1794992240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TmyvoYQN8Xr0ogKf42Npt/1uUvAg4Sn8MVVxHY9pi3g=;
        b=vKhE5kyN1bomdixA570q3y05On3bkp+HTiM/1mIEgQuW/a1wm095ho3nzrFfKwtj/i
         X5EAbdHxgpD1fDhzAKM68WHnfAPoHFtamWjgciBNo02I2YFm5PU1ywcOvWzng07PPJD1
         X3t+FaIj5XfC8jyxlYjibb40lwTTIzkkfc1eUXoiMIPa94EgSVANA8ecyB8qaJuRK+kk
         9o8XoP6/uieqksYJn+T+8IqhTFuJJZQDhck1jwykemWZQOHRB1YMXUqfDGbprYssnbdE
         3DWs+3kT6xGr2Z7zCv1Y5iA4ytDBWIAGfyJZJatLRpxyKOEVcXzXuKCcymMd8e6vA3JD
         fSMg==
X-Forwarded-Encrypted: i=1; AL+hErFYbUGBq9bYyVSqqtl4bemI7BafBPU5Uq+Vw8ph7c1zSkMhhc038yCpg5ymfMozmFHKYYWX/cu14dLl7TU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kdjDta3EPI3X2HbL2nLSjuoN+eQKYWVTVCvT+cd/geXO3QJll
	knCb+0RgjZpbcUX0dmMAAUK0gYIBTvlK5vuC2xq0IhicOEhh/KHxqm4eyrtW5T6mlg==
X-Gm-Gg: AYBFou359oPp7HeYRGVZupamRAhipqwAUbgd4Jarc5rYbUyRqmk0qx64l3uz5n2+Vy+
	ncUfzXitvXpTxLapPvvkpcfviNTj4h0sv4zxOm4XsDVK35JkTHHRk1AWP32DynvWqpW3loLc39Q
	38iGNS8imTYntcBTm/pJQSW6qlcr13/SWACc0m0uOWu7CO3PKnBY+9OXl94RiJ/Lii9qPhthnlp
	sCuTalUB+Wff72V2dRCl+O9wZZZYRObf8lfgZOxRoHGMLtQq57q2mW8TzI4KJ7A2RgztVfCfNq0
	RObLDHNDPL1QnI/GsoPS07frjGEGX9DehuPOTWgcz9qKY/xkvTHEI9MOmRNhYDPJcAUgsdcoDiW
	aq314BW/qVAKIwvU5EwtCJPXjQwUcIEDMGSH3nubqqVT4ZcxygZ2SOE6MqiFl2GlIwCT8UtlunH
	rJ4I9iCQR+lmcEzcfFlZSg7tmzJbAdSW4trxFsvLmqRd7bqSyTArl8oP0h8ejR2wilSL9DgHDGl
	4Ws2kJpo8PtwHIo5PM8OpS3Em+dKP7MfpXVUgXJBP7p93jMgjlSNOk10OCdPlefbHnodoaSSEro
	4U4RbWTMrbjDaOwqIUA1vU+U83ZxYvHgfTkJkKYEGBTSGLV+i/bW3c4l2PT8wIM+uQ==
X-Received: by 2002:a17:907:6ea7:b0:c44:9a32:b27 with SMTP id a640c23a62f3a-c5066b4a859mr135081366b.25.1794387439434;
        Wed, 11 Nov 2026 00:57:19 -0800 (PST)
Received: from google.com (202.70.147.34.bc.googleusercontent.com. [34.147.70.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a663f3bsm213970866b.72.2026.11.11.00.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:57:19 -0800 (PST)
Date: Wed, 11 Nov 2026 09:57:15 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peter Collingbourne <peter@pcc.me.uk>, stable@vger.kernel.org
Subject: Re: [PATCH 01/24] arm64: Fix lazy TCO clear when enabling user MTE
Message-ID: <avQqdBEGwje1iVlz@google.com>
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
 <20261107-mte-kasan-split-v1-1-d84ea5f30f94@google.com>
 <avNjcKtuQkZW0_Sr@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avNjcKtuQkZW0_Sr@arm.com>

Hi Catalin,

On Tue, Nov 10, 2026 at 06:33:20PM +0000, Catalin Marinas wrote:
> On Sat, Nov 07, 2026 at 04:36:07PM +0100, Pierre-Clément Tosi wrote:
> > On kernel entry from EL0 with HW KASAN inactive and user MTE disabled or
> > in async mode, mte_disable_tco_entry() leaves PSTATE.TCO set to avoid an
> > expensive write, as it assumes that EL1 tag checks are not needed.
> > 
> > However, if the thread is in the process of enabling sync or asymm MTE,
> > set_mte_ctrl() updates SCTLR_EL1.TCF0 without clearing PSTATE.TCO! As a
> > result, kernel uaccesses miss tag faults until the next context switch.
> 
> Nit: next context switch or another syscall. I think this makes it
> clearer that the only potential missed tag accesses after the prctl() is
> a signal frame write as we don't have other uaccesses.
> 
> > Clear TCO in set_mte_ctrl() immediately after setting the task's SCTLR.
> > 
> > Cc: Peter Collingbourne <peter@pcc.me.uk>
> > Cc: stable@vger.kernel.org
> > Fixes: 38ddf7dafaea ("arm64: mte: avoid clearing PSTATE.TCO on entry unless necessary")
> > Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
> 
> The patch is correct but I wonder whether we need a cc stable.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks for your review.

I'm happy to drop the cc in the next version. The rationale was that this fixed
an unexpected userspace-visible kernel behavior and closed a window during which
tag checks were not performed, which _could_ be a concern when userspace enables
MTE for security. I can see how this doesn't make a strong case for backporting.

-- 
Pierre
