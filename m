Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A1E2FC011
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744784; cv=none; b=eEi6LMnD4OL+1caucBhDPWtBWyFg5yxxiuNzOFSQr0oeqK014eYMAN+FFYPMVibFxu9MP41xojmt2qOQpw93aYUAq5yFhJPoTi27xXGIupjUszFUNIW4SP0tde/6zJ1Ck/K47hPIEjdfhdIYqdfWH/mAYxjlRsEJBGRLz6alLyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744784; c=relaxed/simple;
	bh=zYSUmldqZNFN7H3/a5usElfEPj3ThsKq72A1iZOzhBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWsIf6H+mqar0iZ7VPlaEngak3ZaDpr2DMQKDt+YeU+qLrvOodp0p8Cj0AMqLrz3TCfNXXnPuhSXC5isrrqji4PSFjfNgUX1i6R2r9XJrH+kNGVdUgyAAvxU3Buo1ZpHA3xx9hWbeZy0y4laBNhJWFhNFtz25IPaEOXOHkWyuYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WerGsb2v; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WerGsb2v"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so5626369eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744782; x=1791349582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAgL0Mi0+sX1VGlcOpnZQYafcet3pBZW3SXrknQHEys=;
        b=WerGsb2vgJFYwiDL0Dh05AiSvxmcpVlD3EnLzAs3mlxh6PH4jJHORbxGXNGTBvCkRM
         6/q987R7t8rCTDWyubF2d12SdZHnrrgfeiEvZeQVevDacRY2cim3TzvHlQ4pF8Sr5ev2
         kCc+TrNw4+zYUX+G/lUUJltkQEsC3y6FWeVhwppMMAH6OPgDJQ61wNOQ4fPoyMI9lC/J
         oBj2I9gSgFJX4fVa2JCl9P7Dd0oe6yr17r84VIC+kJOkiEiMDMaf5RpdjHDhFJGlvTtY
         Cc0fCC94K0ZaYpWXUmqkgUWRXdOQfHCAodCXVdSPuRP/xoHyVZP1XKWJryoBQcXJsg3j
         JSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744782; x=1791349582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sAgL0Mi0+sX1VGlcOpnZQYafcet3pBZW3SXrknQHEys=;
        b=rbIZJK51r4LOUZexeNqHeCiOR19JQ+TYb3ib6DrP6PknSm0vMMlmCC+jYmGmnbXHOy
         zZ3ttTt3I1QSWdU8Y1+SFiSJDoGy8d2Rkkv1X81GNhy5BGlegK5f9Is9eRd+5SeJZ4IX
         IIHMDXIUAz/rLl7xGHBQBoMtxZOwX1YAdjBHc9rVzjJLDcAHh84U3K7Nwm32k2VdiI5h
         xCQs8inldPQ2pxo03Vzee2+NAyOzoTs2rXbEbbnjBoXj5vn/eRzWsfnQS+fzUAm2ZmV9
         y0x6OR8QEOkjxNlK3yX7zSYesx4ffujT0gAXma6X1luJ+bmfHntgnXbM+4WdGH2plMf6
         FN9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzyLe0z/nxlkJ/3f1lUs+eJmzU7GQrjWZmEaNoATK3ON0rf5qdoXiA9iecaOV47mLb/69LHkW4LvefJoF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL1EaDcroMF2IH/LaB7fiTSGJKIkqcmoM2dS56/ZxRiJc27dMW
	96eRCtl87IYEU1/SKI7MZ5r2rfBfwThvUHZG1ODZP3RzZA06VQNR9Crr
X-Gm-Gg: AYBFou3j43UNDXGJcp2hK24aMTGUoc2C02N4SReeeYhyBvv4VotwdFs4pPrqailfIr0
	7omxdyMn7BivkPsQgkD5XAeOjwvIwcIniTIZ9eHYb5lAsaA/jYAUn0LpxYXdk43017eLbF8p5HG
	VmI5pqsdfTS15ahte2m12pRSboAWEGW1bVWVu4tE4CiHmCxMCPO99h3HlgbTAsw/GWHBbDuoWYd
	I49wDYh3wKEb14GYlLNpSU4InBhfQEKLVHBWV0zo87TFyMR3AsLiCigIzXeNMOL39u3rWSPoVNx
	MKxqifMujHh5RjgirIp71OdX31ySU8ZfhCtrIJVwhxdAMUTs1gJzE8OAEG8YBWT1DmSSmmSDMBC
	P7padDd0bEnvwyOXha5onMuaNvvHp+JLfDgWbLAlt5ZnoqUjWBxBrrt3E+g9/Fz/R9EBfqhtwCY
	Kr7KElnbp3g27kW6Og04gvgh72EP4wxudJIl/FjuZtM7drxxTjhw0gPvmmCG6igZUIV1rvyK47n
	viJMUQ3Xkl32nONb/Mud9/sBEKfk9x0+jMLWL5v
X-Received: by 2002:a05:7301:92a:b0:33c:e9d:6d49 with SMTP id 5a478bee46e88-34ce170a6d3mr413680eec.39.1790744781935;
        Tue, 29 Sep 2026 22:06:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf22f97cdsm959454eec.1.2026.09.29.22.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:06:20 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:06:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hansg@kernel.org>, Nitin Joshi <nitjoshi@gmail.com>, 
	platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] platform/x86: thinkpad_acpi: convert mutex_lock() to
 guard(mutex)
Message-ID: <aryYOI92NRUGT-4F@google.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
 <15bd7fc2-ea2c-95fe-330f-6dcb005239c9@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15bd7fc2-ea2c-95fe-330f-6dcb005239c9@linux.intel.com>

Hi Ilpo,

On Tue, Sep 15, 2026 at 02:33:27PM +0300, Ilpo Järvinen wrote:
> On Wed, 5 Aug 2026, Dmitry Torokhov wrote:
> 
> > Convert straightforward mutex_lock() and mutex_unlock() usages for
> > hotkey_mutex, tpacpi_inputdev_send_mutex, kbdlight_mutex, lcdshadow_dev
> > lock, and dytc_mutex to guard(mutex) and scoped_guard(mutex) helpers
> > from linux/cleanup.h.
> > 
> > This improves code readability and ensures that mutexes are
> > automatically released when exiting their respective scopes.
> > 
> > Assisted-by: Antigravity:gemini-3.6-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Hi,
> 
> I've now applied this patch 1 into the review-ilpo-next branch. I 
> converted the newly added mutex_lock/unlock() pair in hotkey_poll_setup() 
> while at it but it would have been nice if you'd have made them a series 
> instead and done that for me as there was unclear dependency between the 
> input_device_enabled() change and this one because of the newly added 
> mutex_lock/unlock() pair. Hopefully the next time. :-)
> 
> Patch 2 seems contested and changes behavior without telling upfront. And 
> a return value change shouldn't be hidden into otherwise mechanical 
> conversion patch like that anyway. The change is generally good otherwise
> so please resend it once the return value thing is addressed.

Sorry about this, that was my oversight and not an intentional change. I
reverted to reporting '0' even if something fails inside of
brightness_get().

> 
> Sashiko complains about the strscpy() placement in patch 3 and that looks 
> valid concern to me.

Fixed up as well. I just sent out updated series.

Thanks.

-- 
Dmitry
