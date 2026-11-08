Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794097139;
	b=VjuNTfGEVKqo3NoBWSCx7gUamzxXhl1h5peZDhr18U7V+Kro4bhPe/bj/HR+WkRGgKVC
	 WO3VACC3oeL10nVx7DAIj0R8v4d1DBMM39jAL6lQpzfufWuIhxzw0CIXEpe6hyDkI0e65
	 +b0dkhnA2sBqYiDRotqHzXrpEaJPfOnWYINfNnDRqDFuwJ7c0JAKdwJS6Smw/6hIP8yVJ
	 QKZ0YVTev+bsYdknW2SI2NBdF40stD/0++pHjbPUkNPobgckLbQBinTpV4NvnmyvYEGHe
	 g/cXddo1Lzu0VKaxGceHuwH3WEtow0Q8NOf0J0MJLUKlEKQ263z57L4tcuNZhJFlZ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794097139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=EfxSBm3bzgzf2A9VtrSo7r03r+1kEbbvQLbRQsMqp+w=;
	b=tDQ606RnNm7TTKudygMv/mK0RKq6KNd2CPp/Kz9AdVp4U6dJvSKuIHqjhVlGINaFVQmk
	 luHnDvNPpjo9brdmDjsd1McLXmcmoYmGB9R/j5qmtGnmpzMTD45BkTAlIrEBPGTeA1Gbm
	 ICstuR+4oIMZZJmrzkhMznt4e4SVcrPkNOYVt5QDC+UOuj8kxcUPllo/nh57vrkjjDGj7
	 +rc7L5WJe/ZJRBTU6dY5okOx4HPkILQTv047IchfUA/QdOzn8jQS2wjy4KBispnL40l5C
	 OJSYBJuC3uqTJZbgUABp9SYtvwRmGuHW7TnPm6imgygzRvoaZiR2gbgTVA2XyEke8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2TGOyRm;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDA1606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FDA1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2TGOyRm
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1adbf62dd31so61910c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 16:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794097138; x=1794701938; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EfxSBm3bzgzf2A9VtrSo7r03r+1kEbbvQLbRQsMqp+w=;
        b=d2TGOyRm9+/hxneg1TLi5SkUGIVJcqxd8tpssnCoA0seFj3UMrwvzsK5ZaHkPacPPu
         ckxD31vn1SjS5iXNgOSzpCEG9U0T0FWN5A9KQxamnbvhyXMdKEOzB6yQ2kNXbMiayf6A
         OEAd+KVeIC31GxBm0Ikq2kl9254iGD5WHineEOWGqTBc1Af5gHncO7GT6y6zBSSxSz0W
         WzIkoVSoKYiecR6VFOu9nWuqeg6YmABUN8x6cCAjdd2fBfX+KUlRNC4i56W+Xx2Adq04
         DHVi6c64AREYizRAlkRX4xS9PPwfktK6RUGferj3DRAAKN88KxW/s9dh/v+ZoIT/wF9+
         lUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794097138; x=1794701938;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EfxSBm3bzgzf2A9VtrSo7r03r+1kEbbvQLbRQsMqp+w=;
        b=wwflSC800SH4NU2qJIfXy9FvK0vhjFsXgrQwrQs954DsdlD07qeyg9PILlxHKr3IHg
         kidJM1fbNTD1T3W1/oRDfB24S5hxi6Ogoy+qqpLC45FULn1DnUW1eOCwz95XXB+KvKf8
         sSBEvwa87IyYh+5Yj8mEuzzKnQa4ti7XXy/euXG6jfsOrJU/8CtH9rrZhQFG0Rpkv6ee
         /ejL+CeJIr0T+2Gey1wz4YZ3eU4VqEaZsN8wzcfJbadcYYjIh2EZAR4jetxHjxnyDDC+
         McwytwdUz7pny5GUON0T9T6xSvouEonbe3u4pSMrMnv4uWO8ddBx54DwU8MTuN34zbJw
         p49A==
X-Forwarded-Encrypted: i=1; AKwUvBz1SyAbNLE+BK4CDg9z2kN3wILcVDbB/YpYCvsIpJT5SnIi9PmF2UnI8RTyucurg5xvZxxc9M7rcYHzlAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5jT4qVPZQek+DCHV6WMHINB/qcG1sTSfH0kPbO1ekDfsJK+aw
	QystcepjtUi7w/JycH8bUIcHhPM39F37+rrovGVxKC9pF6q58RTRi1eN
X-Gm-Gg: AYBFou0jMdvXOedmJxT4kVLGY35EUxkipDNLBxn6batEQxaH3xgW5YONyhIJtSdMkVA
	yodPTkrmWUs3jer1tuie72nt2pJC3o6vqb1KrFyJ07HhE8AgXDgNU4yh4APiHIV2f5os/weUpu1
	y2hJ6ueuXXZ49sDHrUWwFSKVa62hSxyMRSdv6uhiQwlgulzgpJCQlGR99gcE6e2+kFQUCB5UTMg
	33h+iD0OwboQaUjppmL4GRfmmJ84tJLmlw+6d2bjY3OCdICNbT8feCQxDN5vdnhYC9qLdd5Yqxc
	j4TepBM7u0K0j23eWlreCHd4gIIYOF2yMNhBp8W9amaDBjrLoync2q21+c8hmpWr+CrsOIbMBNq
	efS7sUYapmsjn60zx/PpOhBenkH5ED8zX4BMGtL2aZaz1v4r5fYovMGJmXuB6+avzZJhUQP4FCl
	HpWR3Tfv5tW3KE5vd/DgnlzkR0tp8aRvB34RY6AP+pO53mkCti0Bg/exoTQEHE4zo9nXY7xwAQ0
	4tYwCD9cSsi0xQytvkqy/Cl/bmXI88WJB9qN7GzIQhSx0A+dGT6Mu87ThoN6Isce6dtLJn5r88J
	l1Uru+u/8Ph06nejeRjTWX0c6eJhOqQ+4kfbPYRLQIZOoG6sWMXbRgvxHIzPBGFGDIs3
X-Received: by 2002:a05:701b:4294:10b0:1b2:6c97:fecd with SMTP id a92af1059eb24-1b39fecea0amr167005c88.42.1794097138049;
        Sat, 07 Nov 2026 16:18:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:5a4:1cb9:242d:4f00])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b372ed839fsm2018026c88.0.2026.11.07.16.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 16:18:56 -0800 (PST)
Date: Sat, 07 Nov 2026 16:18:56 -0800
Message-ID: <ccc5eb71825e1bd468007e548a8367e7@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: amijoy - fix memory region leak on registration failure
In-Reply-To: <20261107160159.367919-2-blum@kernel.org>
References: <20261107160159.367919-2-blum@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Thorsten,

On Sat, Nov 07, 2026 at 05:01:57PM +0100, Thorsten Blum wrote:
> If input_register_device() fails in amijoy_init(), release the memory
> region for port i before cleaning up the previously registered ports.
>
> Fixes: 127278ce2254 ("Input: joysticks - handle errors when registering input devices")
> Cc: stable@vger.kernel.org
...
>  		err = input_register_device(amijoy_dev[i]);
>  		if (err) {
>  			input_free_device(amijoy_dev[i]);
> +			release_mem_region(CUSTOM_PHYSADDR + 10 + i * 2, 2);
>  			goto fail;
>  		}

Do we really need this in stable? It has been like this for 20 years,
and only affects an unlikely input_register_device() failure (basically
-ENOMEM during init) on Amiga hardware, so please drop Cc: stable.

Without the constraint of keeping the diff minimal for stable, could we
also clean up the error handling here instead of unwinding inline (and
out of order relative to input_allocate_device() / request_mem_region())?
Either add cascading err_release_mem / err_free_dev labels before the
unregister loop so unwinding happens in reverse order without repeating
input_free_device(), or factor per-port initialization out into a small
amijoy_setup_port() helper.

Thanks.

-- 
Dmitry
