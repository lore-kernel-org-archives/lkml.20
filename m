Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC12D7398
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248106; cv=pass; b=VYr48uUI0jVpymqhTVLGU6pPaKjDNvJySLX/bPCOq6jEUNDDOOQF2Pc8pM7cazOrepDxjpGykPq32nS2XLXKNNT+/P20by+H89RLraTkJ6T2UGwprcXV7tmDSPOph35OpMGjZqNz1x6F33PcOMEtDpce+VTrsKzcMGVFfjz2XOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248106; c=relaxed/simple;
	bh=WlUUULkXecDA3FrqNMgGGTCq58pBRHG2vpFkFbVh+ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtN7HQ/4SPM00YDvwEpWq58gJaQxnKg0VdoeuUiHOxjzgoHmPzD2zGlExLkfPvnCvOlUevPgkRfPk1zV6M+7SWmef/QHtSjZMnlde+mVxJZOU7la9JgCw/eBE6nQnjTfGDFIcD4s/N0B1r8YfGqIQBkaG6HRjbmSQHNnes1HqHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bW/qOGkn; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bW/qOGkn"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a595487d43so19612631fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791248103; cv=none;
        d=google.com; s=arc-20260327;
        b=VRHTPlDerVLLdVeKMEn7zVDwdZQservPcO25VKh/TKjMBd7P9/LV9MWYKC2LV57D/o
         ug83kwD1eL3ctNqK1Uak8hRz3ENoUli6kNvLybyIZzlQt4BaN/FnjkNl8kutQ/RyDrxT
         6uyDNYOJ7znXqjUjz8kjozj0Gr/Wt8/Klf7mWGSzIJsmKG75yHdfcQQ2lT3z6uC+ajXY
         W4bYpEgdJZx29eNzrR45f2uKPJ/DczrkN/M+wbqe6LaQ3YtnT0t7D40rmjoUrpNb8dwp
         xlq08mNhF/f8upMsCAQrN3ubeqk01L+Oc1EVqSVoj6VCE/ZiLj9AgNHswthoEt6f47zT
         9LIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        fh=s0J48BadDKD2+a0FRcpJrTnAFi7+F20ijv2mX/B0Jjg=;
        b=ps+KcXxAJbUdkGdap0iaLYl0UjH3z5DDxfdvDisfzt74JgWTZBWofi+JViHD+9R1hI
         zOgdwRYRt/YoACfKo+5WYfCzAm8caQA6EvRpWUYvOOYa2MVbJ+X+7JHokaQ/Rt4YvB6O
         YUtQTc69GTwxoDi6+ZBTQjkgAdqDZ8+GwUYedlmUzwwmv4k1chkHHdEOfDVPbGG3clLD
         60sVhW/E0DKAukA3n+3/TyVGeuuS620bs9T5Jx9KTEfyZfASwxbe6GGKIqrRDp1CVI/F
         Wr7VrqvXnSLVzYZnwqnpUhNi4M9x0t/XCGCld0Oy0EI8NhMINy+Rqg1NDv1zKM3T6VfD
         SpCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791248103; x=1791852903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        b=bW/qOGkn8Oq3ecnO3iORBbazJd2D788Dq6dJ3XWYfSdzJ6LwitRqTlwk46xelWflAV
         gbFGss68KaNVq7/giUy8G1imnN6qjgFYeGlGP4GkDjeI8mHeQmcGyZgO4DR8xgQBojFd
         BKAducA6nlvACC39vidsPLdmEkBBidl4l2tNV/l5BL7wKH5f6DmhVfHjAJLGGC/tuXxf
         XPSg+NTKeoCQzyOfEj2Mr8SDCLinsVL+iKUdl+/XWcioaKkJhM5Lz5jlM0d6+rFN5Eup
         dsFU9EjsHCawKIEUoxk67BFgonn5q5/8iVgi+JTenRCQhQu2rV7HNn+TLaxFHZFC3alU
         N2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791248103; x=1791852903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        b=cPSDitQM5ukWZUhTj1RF7hf79PJpU2ElOCkeWLO8ghCx8p78Ny019uKU/Zh9jlj0DI
         bf81Iy511MWjpkGgX84Aa6O2shmyODnz8dFXWWOADPlTZS3+ybQHeGYnPvLutMEa7Crp
         mZ7ckOFsc2NONHo12LXkMGGIbRamtRyCf3WkCPtdx//gK1e7BFENdTWoiykXbI79O733
         qSP4P8zN6EZHTKOH/lU89mmPqtsSHcV1QkjO498V8AfkPplfzslIR7g2ddL5NbPCz4QE
         YzoQncvwlLeN/H1ynw0P+upzhLyRr7uN1j2gWoh8BjyYgpyfy6Idn3NmOrAzezotTASC
         mqmg==
X-Forwarded-Encrypted: i=1; AKwUvBwtfuHBtk1XCeDRNSXRCYHFHLqLQvyZlxDg8WhlS2aPm4G6g4Y3/OU175A3bvLoQg+ubTY3ULsKt4m5k84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDyDoisn84Jhi6/iLraKvhP9qLdwj13ERLDBlokFH6ryZm6Dkh
	bYAdad3UF134VDTESldeXBK4xfiqTRRASjYGSKVvgZByjfHuMSE2HzdoEplLy5m7+wdEYzygJdl
	+ef/edTVv/NTytlJh+QbLtdBLJrDM1RI=
X-Gm-Gg: AYBFou2ZV4ZrooqC8eeIppBmmgVxf8tEawz2oRo+1Hb4diTAZMAgK6nf69TJgnY7BIM
	Wk+z4z+J8Nwx9rxxi9uSAbFzN86fvAc99Dq0nxGmjmhtYw34DxQXyM9aiUV64NeCW5wESWIRf60
	Eg4PA+ZymhbSwUxNZpetsIfhQM5hrYzlY74ejQLmR3FYiW89s2B5KqOtJZakFi1n0FpTiy08Oil
	p/Ec9ktIfJJ6RVaCsxPt7FmzC0jMap4U+RmVmj1R8OMhy2kgEa4Jax7dR/cFK0j/y28nQnsTdtU
	0DgozaOMizOkaU3f7mjPao34BqhiL6a2m62lNBbXFwwl9bfWlrwozfB7VJ/TQHMpLsbyJkR/gHZ
	0Lxz8NeY1OP1dr1KDLSEl0HU=
X-Received: by 2002:a05:651c:a10e:10b0:3a6:48ab:7973 with SMTP id
 38308e7fff4ca-3a974f7c448mr16424921fa.26.1791248102355; Mon, 05 Oct 2026
 17:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-4-sigefriedhyy@gmail.com> <20261005164905.3d5b6749@kernel.org>
In-Reply-To: <20261005164905.3d5b6749@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 6 Oct 2026 09:54:52 +0900
X-Gm-Features: AclHuK_fRzWbaSoo1jAzXFCqAnGNXFcKoa-i0NxMDceG-eS6OpMe7FREJUP2sdo
Message-ID: <CA+7S2vL2n+XTZHoSyitmQy59tAnKjJvErvZw-PdKaMx4-Deq6w@mail.gmail.com>
Subject: Re: [PATCH net-next v9 3/6] net: add a generation counter for dev->mc changes
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ajay Singh <ajay.kathat@microchip.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > + dev->rx_mode_addr_cache.owner = dev;
>
> There's no need to set this?

No, only dev->mc is looked at. It was set for all the lists of a device
after Nicolas's comment on v7:

```
  There are several lists owned by a device (dev->dev_addrs, dev->uc,
  dev->mc, dev->rx_mode_addr_cache), the name 'owner' does not reflect
  that it is set only when the list is dev->mc.
  I wonder if the name should be changed or if __hw_addr_init() should
  be updated to always set owner when the list is owned by a device.
```

v10 takes the other option: the field becomes mc_dev, set for dev->mc
only.
