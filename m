Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7B1E1A3D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730309; cv=none; b=dAlJQ+JYmVXXR/czfqfX7p5fVsYOCHcoKZ/33+6hIVRdI8ZbeTfTtTGUVKatNZzIfNVlcYtqoaSdN364am6W4PPWElosFqmDebeQsJGPxE2uQRmWYyzll7Q4cAb+TdqAeWIL3Lrm5hv6finUJyyNCjKH8DdixA1cfCXiA07b6vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730309; c=relaxed/simple;
	bh=h8oQ2vtatOWugNQ2m73cbra59VtykLLACLyn4sPqM2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDcJ437R6/P+eZiS3POOHQNF5d/P9jLel12ApzX2RSWESZM70xHZLqmRioB4MBfTFg3s+b8yvG6vrRHq2b9UPU/7ab6pjMdre6gEi9CH1+5ArGRpvoewo0HG7TN3kY/fwd7RjTLCrQ1bL0KHGC3Uk3Lss+NIwc19f81evWKfDvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsFuEvxl; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsFuEvxl"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so1956483e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790730307; x=1791335107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMQZqq6NsGW7r3Ya7TEGt/n6qCY2JjVoUUL1F7Si3Zc=;
        b=XsFuEvxlWBY5Osy1yk9wRvbymO2T/xa+23zOmxMX184f+1oJX+dVLXnwdgL97fGCZd
         qhte+zRQRPos3DrVOQFuqCr4YRK6meL80afhidVub/RzLjSrHJuDOt2cdcH/bcEC5SxT
         ABOAivb4y0uqYEmrP2crnhEpNPabIzHV+p1TKSg4whzBw1fucc0t+MAE2jMpBB+PlirL
         dmWaK6GiyslLAQ81PCWSyxz4Bhmvx/Tl7VB2xEDNmvDVnyNWywvGxkfF15/S3bYzSx7m
         bI08fQIamwKI7VX1GqkZ80HgAvv6j3gN45kHytfgk68Vir9DsBMiIXxN+cGFFyKIMZ7f
         U1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730307; x=1791335107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMQZqq6NsGW7r3Ya7TEGt/n6qCY2JjVoUUL1F7Si3Zc=;
        b=2oCcz4Qrq6prSpqU5UMWUrae62aNL1zk5LCe07nnFNSWHMXL170r2gfz2UXhxnMH06
         wlkKQ8q57xBCIqMYeQzndTwUv09Zg4ix5ysvMzlpWxAycfArP7vlIotZrqhpxwEM8qrb
         MIJjJA7UJ9J1eIlOAL56Q7qqZW/ci+/vvY8bxyag4V79pRFIoZDutcHr/yCRsQNdaiQ0
         5ApCR5ad1omc5p2s2aqxKyYeFpNocrrkenqadRdQ97islXk3oEec0TOsLOzKWXuu2svz
         Q6G+ykwdRd68dUo4CEWohFkm4i0Qi70rKUTx4PHzApQ6MBKwd0iLCouqwvu54+VaAd8m
         +GMw==
X-Forwarded-Encrypted: i=1; AKwUvBzkhpe7P7EwkDf47xn2Gent1tjIODSy+qqdo/MZDXyF4jEu1rasmZm1bJruFX/B8kuRWsMJ1SCWpsn1QpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuM2rD4q+PsOeoy8zXgjCBoOByw/0J0XNWR3gR232G+PwuRTH/
	+bJCwVF7kHK78N9kuFZBuXAoaQDcKTZLxR+sTyBOWzwgwLWP37mrSEZZvT6wARpH
X-Gm-Gg: AYBFou3hWHLWuvmQrxm9QQzCPuJXRkVrTRr6EHt0omKqFjz43R691gpos2CC39FeBvj
	LzbcNDvJZZioSX05ZC627ipaFSDmyHRJSLwLSGJ+cswyTlZ0Cy/+WE9nhki+MhAZ+bv3D8h1ykc
	LFNIuC6SLhJN3Ve40J+fD+8P/cNLYBCYBMNIcam23NCv7qfnOdaKxuD1FFJkZcX9sd8jzqcIwPp
	Dt8E85Z3k8fOjVnEUJIN5XUlbkeqUT16UEqS/5fpYrOvMznLwWb9ooKfqKZOlWT3D1vVehPNzFX
	e5bmKfSJSZN2UcGm0f2t7QKRHurhiVx4D4Cw5sCJ1zkdSvGXFwxGjIBSXeydo+ylbadyWuiMl7U
	Q64pcWI8Z1UlZyrMBnmVIAc3ll2If0fxGloNhh2EVVrj/o+YPV750fIiu/pDFFWNu4v60UOEYJB
	oE9aKXnnbhDuvfzlNkpO3yIPV+AePN3EENrY/CXYooKkmuohNYEAQX4VQwOL0z0YWpuudc5Dz/1
	f8fp2B+nUD4201oM9kmZiwIJYlzDTINBcZd0CYkRQDNRDacAN99G4OaeO6D9jyxQQwlD9omRY17
	ZZOXa2hs
X-Received: by 2002:a67:e045:0:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7bc48eff358mr258529137.27.1790730306667;
        Tue, 29 Sep 2026 18:05:06 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988d2a0a645sm1184024241.5.2026.09.29.18.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:05:06 -0700 (PDT)
Date: Tue, 29 Sep 2026 21:05:04 -0400
From: Frank van de Pol <fvdpol@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, corbet@lwn.net, khan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/1] ALSA: usb: Add support for Reloop Jockey 3 DJ
 controllers
Message-ID: <2ja7iapaq4aecpz2iem2c4e5aowcm5fjigjqrvbvtvqhyr7bpi@urmbkvhr47rk>
References: <20260925021915.78909-1-fvdpol@gmail.com>
 <875wzp4a3i.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875wzp4a3i.wl-tiwai@suse.de>

On Mon, Sep 28, 2026 at 06:25:05PM +0200, Takashi Iwai wrote:
> 
> Thanks for the update.  I think overall the code would be OK, but
> the problem is that it's a way too big single patch to digest.
> 
> Could you try to instruct LLM for splitting logically for easier
> reviews?  It could be like starting with the core probe skeleton,
> polytec core stuff, basic PCM loops, the mixer support, the MIDI
> support, kunit, documentation, something else I forgot, etc.
>

Thanks Takashi,

That makes sense.  I'm not sure I'd trust the LLM to do that splitting by
itself, but I can see a couple of large-chuncks that could be separated out
as individual patches in a patch-set while maintaining a "buildable" driver.

Will also simplify the "Assisted-by tag" as per your recommendation.

Thanks,
Frank.
