Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970471;
	b=5mLfoNexS2MGoU+vXOdqk0TeL3Yk9Awzu4B3NjFoXDzrdWbRKdNvZit1/D0rCDJ+NmpN
	 92QwskmBOLYd7pIFPDN46mCiibhJtVLVne/rgKUcSwjCCHZ18kZRxlPbDx1mXOCgSyE55
	 L8cCyeabBsy2DgB7qt9zLbMvlVmuro9CJBuNMKNELPg4xLUN31Cn63DYsOr8hb6B3tR9X
	 YS9kff2iwfvjMDaApQa8pnpksUx+Aqfr8Yu7gN1EyQP22SzMWmrzz+mM6E/o+WZWWEeZ3
	 0H8jlYJXYS6tkTMjBVC0dL8kXD3VwW0+QRhMh2BNqypopr/avxbup/TB8jz5s8Osrrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970471;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EpybBfrU4lUbKoWf/7zO/ipxZKcf3Adr06zFMm4/OD4=;
	b=EcXbW+7EjRg6bELQihJxfO/MMxJPBJiHudXArNW1f0AfLQ9aRG//n4WsCLKhYIeEFlOE
	 oGfRwL4Rs9PtvvseUbR0Xdtb5eguf4RL/L6ziD9k4RaGnQX6ZeYZ0+FPFD7FW+NHv88J9
	 5tn4AMcH8iIsAUZbzeAhsR/EF+slyHGxz/ILZtHij0c+aurJat2syfXq9KpgW3mL82N7j
	 M4/5XkO6z26LVevoyk//iix93Cph/plCLaJimfyG0ryIqkETrpPqqGEdr8yMTiwqa2Y8x
	 dtLE3i2Vryvi7pxOvwtnVXwjmBnqd1lyCPg1WVr3Rl/j/Ea0s0WEEFmW5tgU0ML6L8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b="bsfAH+/F";
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=OvnC4pqF;
	arc=none smtp.remote-ip=185.136.64.136
Received: from mta-64-136.flowmailer.net (mta-64-136.flowmailer.net [185.136.64.136])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A0E606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=bsfAH+/F;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=OvnC4pqF
Received: by mta-64-136.flowmailer.net with ESMTPSA id 2026110613073948f7d5a4360019fd3e
        for <linux-kernel@vger.kernel.org>;
        Fri, 06 Nov 2026 14:07:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=EpybBfrU4lUbKoWf/7zO/ipxZKcf3Adr06zFMm4/OD4=;
 b=bsfAH+/FufM4Wo41KeHkmC5djQXna5lhSGUKjQ96mibtvsenni559J62Tqj5ESsbEI3Hzi
 1L+DtX7GcUJ/N2rvcyhadvMbHtju8xpTerbD5kmtQ1aVX9z6Zkbelgu3/kV5sj6oklKt4dY9
 J1UyVaQRcCcI6dgARUkWwIOvCDfEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=EpybBfrU4lUbKoWf/7zO/ipxZKcf3Adr06zFMm4/OD4=;
 b=OvnC4pqFx+g/B3A5yt0kM+dcsSmnUnyO4GvaOPI1VKE3sAXC0pGOM9P4dTNv7LG/2bUQ5U
 jv8Cvoo8h3yXYDFYBnHF0NSo5dToue9ONZHXDnxSZntmhg2cXav1uw4+XXfMwcgOgRHvKJS0
 XATOE0fLdHu6SO7Jri3r4FM3DN5xpGf2Rld/apgB/Z1YoyS1h90KfqeMbcSRaQzBRuVJ5Alw
 VQV83LJqjidYmlrp3jBidwoCq/gsLlRjYFN3rUSwvbFGwX+WZ2uEJtrGaGaaTcKYA1wyNG/D
 5qFpxUo2Tj+KpcENtUHeta9o7Sqdw00GbWk5FBLvMN5BPWQkCHGa74Yw==;
Date: Fri, 6 Nov 2026 14:07:38 +0100
From: Simon Schuster <schuster.simon@siemens-energy.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v2 1/3] lib: extract 32bit mul/div helpers from nios2
 into GENERIC_LIB
Message-ID: <20261106130738.avum4t2nhdnmenyu@dev-vm-schuster>
References: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
 <20261103-nios2-remove-usage-of-libgcc-v2-1-5fabbedc49ec@siemens-energy.com>
 <bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>
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
In-Reply-To: <bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>

Hello Vineet,

On Tue, Nov 03, 2026 at 08:23:23PM -0800, Vineet Gupta wrote:
> > +/*
> > + * Software 32-bit multiply for cores built without the hardware multiplier.
> > + */
> > +s32 notrace __mulsi3(s32 a, s32 b);
> > +s32 notrace __divsi3(s32 a, s32 b);
> > +s32 notrace __udivsi3(s32 a, s32 b);
> > +s32 notrace __modsi3(s32 a, s32 b);
> > +s32 notrace __umodsi3(s32 a, s32 b);
> 
> Shouldn't the 'u' prefixed functions have unsigned int args, result.
> It seems libgcc/?divmod.c doesn't but ARC does have nint_t for those which
> is unsigned.
> Nios it seems was removed from gcc?

As David has correctly pointed out, nios2 was dropped from gcc with
release line 14.y being the last one to contain it.
So at least for nios2, it seems like it has always been the case that
__udivsi3/__umodsi3 were declared as taking and returning SItypes:

https://github.com/gcc-mirror/gcc/blob/releases/gcc-14/libgcc/config/nios2/lib2-divmod.c#L106

Given that both implementations continue to pass it through to a very
similarly looking udivmodsi4 as u32, I would assume that this has partly
relied on 'why should the compiler do any strange upcasts here, it will
just pass through the registers and be done with it and this is
implementation-defined-good-enough', so I would not mind rolling a v3
with u32s for __umodsi3 and __udivsi3. Are these the only two symbols
you are concerned about, and would these signatures work for you?

u32 notrace __udivsi3(u32 a, u32 b);
u32 notrace __umodsi3(u32 a, u32 b);

Best regards
Simon
