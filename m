Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2791C3033EB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570330; cv=none; b=FvMts4oYraIO41vYU3GRVzJIjpWiP2e3QY3S3tURC4ybbF1c+xw+ZZpXPc5z2rr8yupoH6tMu41PF/0qhwDUie/807N3dz1sRgunUoyBFEVmPX1edOMphtM8FJmTMhQjpr+YGHgHuXx8MkMvJsWyF5tAN281/utMtQD1QjSlexE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570330; c=relaxed/simple;
	bh=oYMPXUg5FRpTGpq/VChufToWIT8D2XYBNz1jqWQZd14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWkg+roYcroZ3Jl1OsAJvMcRLHFenO6YquGMUP5Rn5InPSAtsOSfwpB3/7b9DJs94pkz5d9qzewddnMdCwuiDKv4mwdSn1w2R/FvAVvONwkzQCQbaEmX1Hkhij5Qu5LQ2JEWjRGu3PTrafxzAQ7LCoDdsPYCElQ2xjVCn+2+5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+S9GrTH; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+S9GrTH"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148c3a4733fso90132c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570328; x=1791175128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9YFNOM35bVSfIS9/7AW72GbBEe1YCeVTQopxAj3TL0=;
        b=Q+S9GrTHakmOPeFFNUbWxnb7iokwjTb6dKNPNxocRySVeYxMcySNBHP5pWjMFfqFeI
         T1U3iRA9w5c2Isj9IZeQ/ZMvmxMK0eYpmgbQW6Jpq/mvQkc45mDAnebvBTfG5xnwvLWt
         nFAia4LO2aYxcG/cwwftKzqy1RznYw7grjJ3GAwHISrkG+32oME39aG1suLcC+cnsP3e
         8pCLXvmcix9WlPRnA5Hwx1haoQrW0GqjFM6vNZb3uzy3HMAiq/xmHLbssbRKT1ndq9c6
         +qS50F2g8mvn0rXZIlJOeFImlPbKbq/FnZIrOKRs7kHf9qtGT1dLv6StiEsDCMVzxnmJ
         DVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570328; x=1791175128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9YFNOM35bVSfIS9/7AW72GbBEe1YCeVTQopxAj3TL0=;
        b=h9xa4kQOhTG2z7BtPnSdQcLcx8fhRxf+wrh/DQQeAdYcQKR3GP87zcqCmZ7ke+HDU/
         qoiMTVQWuOkAGTQ8LqzME6ELkusqsNF2jl4PrJtIlUX2yWPNxAUQxZn2QWbKE97PHa69
         vScuAh2sPpwXURaNBGaau/oARb11EuihBJ9A8Gea/5smi/3DT4TPY0wEQzcp0S2n02Uo
         wdNk2vfCRUR+f9C6m9IUZfAfglyiCZnsaWVicNq7UbN0iq55xenR9NhhtYiSGXHrKyMY
         CBLW8HRgRfDxX52PlDHrmtdwsafyrQq81h26HKTa6ZtAi7bK6hIItthvvp1yPsAYngtH
         lmhQ==
X-Forwarded-Encrypted: i=1; AKwUvByAhe+RRsGbSCOrY1pMX5kTVvCybxatSFv+5g/Ls8LqoKc+D0WOsb9prLFG2p8NXmVK88+582xFpTtBOZg=@vger.kernel.org
X-Gm-Message-State: AFuF++mE7GvdCOE8VpWPdsnfz8KY8VtWkriANgGOqvvb913V3e2q0FPC
	orayKT0k7rAFB12mZ/wmFUL4guO9bfeIrApfD7OLbfUKBrCKkdCIFMek
X-Gm-Gg: AYBFou3g+ofF8nwAjiTeGg94YcsteK7AlXv4yGBayZTiORs1H0Fe03UDS5GrJYUau8J
	4xWQge3uWnx/wZ0UYuI1tz+bIt6//NXHsDhO8A92R8G7La0UwVaVgseSVx04cnJSEPZjuYE04ne
	mxI6JkXR/gjTWSxLutVlibqPWgbSXeozjqHn2QXTyfvxTBKck1g421DZA02oBlNwSuZ6l9VWRbY
	ZjVJZVzKrV7jyZ9D8Ej70HnQlKzZSG+UbXu/ltsvAMK/qu+Xf+15RSBqa0Rae11inibHXOEShaU
	ETLwpAqqc4l8R+cHYmZeXVqVk+AjYixU6t4UOHUA77SNr/yZsLwmyNDC/SYmeF9/J+XU8VH501x
	7T9OHYyldPvKnqXbRkfiIcuK2FmPy0PANcDJg+6uJuoFy/htzrRkYLBvNqa7vT4wzMVSadBOpcP
	aefPIBTqvLroBi0oEpdlC4XGBCgkHDkok6tpRn+F1XbrYl21prGIt2+VsX5JHfr9Om7lVsJ7zwc
	HlMCgnvPipJ5Sgwrgk5AlYbFBBQ9Ce06NTknYJX1g==
X-Received: by 2002:a05:7022:b048:10b0:144:e658:94f with SMTP id a92af1059eb24-146d0f33db2mr8902859c88.43.1790570328080;
        Sun, 27 Sep 2026 21:38:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:526d:2f94:503b:aada])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm16358758c88.17.2026.09.27.21.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:38:47 -0700 (PDT)
Date: Sun, 27 Sep 2026 21:38:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Andi Shyti <andi@etezian.org>, Rob Herring <robh@kernel.org>, 
	Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] Input: s6sy761 - fix resume ordering and restore
 sensing
Message-ID: <arnvS7Hk7uIKKLrZ@google.com>
References: <20260926-s6sy761-suspend-v2-1-8f00a96ee6e8@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-s6sy761-suspend-v2-1-8f00a96ee6e8@ixit.cz>

On Sat, Sep 26, 2026 at 10:26:47PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> System suspend powers the controller off and resume powers it back on,
> but the resume path enables the interrupt before s6sy761_power_on()
> checks the boot. The firmware raises its boot-complete event on the
> interrupt line, the threaded handler consumes it, s6sy761_power_on()
> then reads an empty event and resume fails with -ENODEV, skipping the
> touch function setup:
> 
> s6sy761 2-0048: PM: dpm_run_callback(): s6sy761_resume [s6sy761] returns -19
> 
> Power the chip on first and only then unmask the interrupt. Once resume
> completes the boot handshake the chip comes back with sensing off, as
> at probe where input_open() turns it on, so the touchscreen stays dead
> after resume. Send SENSE_ON again when the input device is open.
> 
> Tested on a Pixel 3 XL over several s2idle cycles: resume succeeds and
> the touch function and sense status match the pre-suspend state.
> 
> Assisted-by: LLM
> Cc: stable@vger.kernel.org
> Fixes: 0145a7141e59 ("Input: add support for the Samsung S6SY761 touchscreen")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
