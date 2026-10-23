Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752249;
	b=gR1Zug2VYPmSjc29p+hDs+O0bvWOLirqwB/Ooojj5RWwpqqpk3Wd6+7SsnM9A18Z108m
	 umQsCJYvs5GQrO3tNZNX+vWMiIQnhTxDQisApHwg+eNX4pEbpQzI0bO7oH91oLJPqCpYd
	 igUOAEy+KdMPTOGvOUkbsVdyNuwjHnnkjeuuRP2seYA1c4j2cO0cz90+T3E6X9yHVP0Lr
	 0nhVrkxzQ45Mz+jvkFBizxuvMiBBjjRVLJ0P00sQrHZQqlhozbqMdNmJo14T/WJVHH39v
	 M7CW81hRl/cDE7htukQ9DIbTSSoo3M/OM5FUg1gxos6KjzCz4P4ypnGi+Qw/+UwcVLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j13J37zaRLVnSoEsPhtFLUTrQib/jdWNau8tT8thTlE=;
	b=ooXMgB1nfsCTnifPzdx00er+86i+GVxwdHwG09iTiXTji15ilCaGY3FY/owf6xPrxsfl
	 m7HocH40aXRwQp26f4vqp5upRVWCW/q588ufyv9CoVKmWMW+/tEzvEX7cg7XzObm3plOo
	 5df3Ri/GOdo036J3mUsc95kb1UCXZOFH0MF3PDQxYfOa02ypwcLVSxJWZmFtQvHyiGB0a
	 Bo1vsznQ13BQktq6tObsM8LfLiXcy39WxkVedlOgklb/8X9QjV9EtyF3WewQVwRmLrKGx
	 1vcBzusE1BQOyLAMRNfnekyc/LYzN4e+WawYycH8TKo0h56iU3xDIO59Wr2SK6fsGyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TCuCqubO;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8671B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8671B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TCuCqubO
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so4528305e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752248; x=1793357048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j13J37zaRLVnSoEsPhtFLUTrQib/jdWNau8tT8thTlE=;
        b=TCuCqubOwlyeMtze1v4IPChdCAYoAnpZL+46N5bIXfnmfxqBpQd3UV/GOricdn/7Cm
         DS5VBC3WNX2c99esq/ojswURrPDyTpOXOuvdHInjiS5/UcTlm7wbCP39udkN16JTW4kp
         RCiyNN5Axb6s3eAY6ZDGgUtJQ8NuKD4HAcqf11Ul/WXUMJG2rmXxfRQYNGpWQCOAD5vD
         3TwfnJwPtrmBDIv/7blCJuVbCl4fpcmfpiFYndpq8d7kt7XPtJTTuPJDEBGHBB9SPYDv
         rsI3WzI8C+LQLFJGsZyiayAg8b3ABtJluBpOmreA+tKet9A3X0vZGbDPEF2QT/TZ8em7
         MtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752248; x=1793357048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j13J37zaRLVnSoEsPhtFLUTrQib/jdWNau8tT8thTlE=;
        b=d+KYI3canYIEUVKy5hOqkY15WEp0VAcDzi8NHIR5w6J0KZHYiv76L/5pSXCZQ87N5y
         SLmkLmnII8s4xHgFn8sbOmSfKGsWWDkwf+AjL5WIbwHVy389eXFjZz9d1o61g3AtSmPB
         cc6mEUzfJkypovhocF5Hodcjg94+t0dm8pWhXPUrP9ADW/t5xJLB2kKzgJ/U4VADF0Wt
         XiT6EvEwYEDokt9T9HM1CjaOGaXHZp1gEr596zoCxw1pDmqPkPzbUf1bx/ZgJZikdUbn
         kAwHrEmvr/gtnibUJmV9LWCPzUp9e8pLkcK/XqGGMQL/5s+MFAdnVsp12ahH2/6+KmGx
         WrUg==
X-Forwarded-Encrypted: i=1; AKwUvBw5h9N6bsZhmRTTLU6hLfW0137YBTo+b+tBEjWlnrzEScpzEgmOyo+lRAKepk5znPnFWh+kKVLwhuXemH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7XrrzgJiNOLd90KBMfaYryj7gkZKlzmUbC2RGpmxw5aI/Ojag
	SK5ouHwrpvq7xZ/ML789fIE6jEcYdyIG+IxlkXThGGTgHwsaA+GgvCnUx14KcxOUErGPIDoh
X-Gm-Gg: AYBFou2jUmX3nQau8+WBepsge0zDmUrIG041k0eU077uBJbrrYggJeewO3gzVaZkteY
	Lzws6R+2xoZXnvYrBnbVOuKPbAqeqj0UOqDrz0VDj5fGWMPXvFR6wRbjpTV30swHS24zDeK4/at
	LpPPFWBlDs7o4fb3dpWe3838Q8FeDS4GpZlq0C5wChICSUtvr9RQgoTde8YZEmYpAP5ep5Be0Rc
	WxKuvdEiAyk503WB3d5+zF8Zct6uvHLtZkkdhp8vXYFUHRvyqHmRX6frS/8qys96lBfBewvi0MZ
	Gu5CsS8SF1bK835o5hkLhOinPsYRMkppa7JDdNsdaObw36SlqJRkAYa1mSS1CHLSyF6YLPXfs0r
	+xJlEDwNTGf1yDfLc2K17Y8fEOVx7iT2EjOkx7+STsIGUTfXSIFhP2eNaPDLCClf3qyJFi+fZcF
	zRN78I2zXhAdqk5NfvgMY5wFExXh8O1aQY+/oEAtM7UKLwqzsz/nrXfxw2XF+WqhLamIkSWavXS
	mcCs/EC4S6+gUt9Xq0hmCVDPKriJjG1iqliGs70vrf+G+QXPSND
X-Received: by 2002:a05:600c:314f:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a211ed3908mr26418105e9.23.1792752247565;
        Fri, 23 Oct 2026 03:44:07 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215418d9csm20423895e9.2.2026.10.23.03.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:44:06 -0700 (PDT)
Date: Fri, 23 Oct 2026 13:44:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: axis-fifo: remove unused r_mem local variable
Message-ID: <ats6crcniknWB9ry@stanley.mountain>
References: <2026102337-headroom-shun-9d45@gregkh>
 <20261023103943.20995-1-breno3011alves@gmail.com>
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
In-Reply-To: <20261023103943.20995-1-breno3011alves@gmail.com>

On Fri, Oct 23, 2026 at 07:39:43AM -0300, Breno Rodrigues Alves wrote:
> Remove 'struct resource *r_mem' from axis_fifo_probe().  It is filled
> in by devm_platform_get_and_ioremap_resource() but never read; pass
> NULL instead.
> 
> This is v2 of a three-change series.  The debugfs_create_dir() check
> was dropped because debugfs has handled ERR_PTR parents gracefully
> since 2019 (thanks Greg and Dan for the correction).  The
> -EINVAL -> -ENOBUFS change was dropped as well, after Dan Carpenter
> noted that -EINVAL is the common errno for this path and that he
> would leave the choice to the author.

This kind of meta commentary goes below the --- cut off line

> 
> Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
> ---
  ^^^
here.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

As always wait until tomorrow to send v3.

regards,
dan carpenter

