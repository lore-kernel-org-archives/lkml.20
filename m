Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373486;
	b=KXHKI1bqjffGisVscnrOtFJld92+EV5oXMm5GfInaaF4S6M01X2hmqqK9XOAj6ai11JZ
	 LdhEIDcDGEEf1fTWxZ36DdAqpJJ8/IPi0c4aFBOsQlP9NYjBJWyiEflrMovXOYB3X9nbe
	 OPgBOzOe1DHnyhCJ/N6jD8WcfUwKtZv6EYTnY9cTjSYz9wyApwNEh8jU08X19ENWadE3y
	 N3Jf/vQRE+49l7bHAneECeVCyVmGE/kJ88aMzDm0fzCqXhuA6trSBVk0B8DR+Q4Pu24Iw
	 wqaOyXXhxk+qoWi0Mb/J0PY/rRyr2nGWC/aaeMlp0BAYVKC+C0nsXRnzH3FSrHZRWsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wg7J0kRkDkaIERBv6F6MaX7gjPWqfUPz/HBXjTx6FxM=;
	b=SuZETkfSbA2KUip3WVnxPXuWQI50h0kLVa9HUkQg+kpL2kzlNODd8Rh9lGaJXr5Oqle7
	 jh0cnVLuv0+X56+M5saJbPos3sgwDq7trBg8UyLyFmPMLLiyhIfZNyy4dTbCUJ1Bd4rl8
	 F5mj/7dA/dYx/MqYtqOS0QKf8LQqpdgWQj4SDZwmZZtKnIdajlo72ASpr6GuiLPy4vk3+
	 bA6QpNEkY6VDBrtMz2D9ht9JFfQR+yrda9CNE17KZzSY0csMeMXTstkL74bhFoLljiC4L
	 ZVmJyn3pzWBDLEJurAFSL+Q3+Qm6Giw64gVw3UveCGxoXyABP/sEGgB/jlt1Pg0uQ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHamjCOz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF9E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHamjCOz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1080091f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373484; x=1793978284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg7J0kRkDkaIERBv6F6MaX7gjPWqfUPz/HBXjTx6FxM=;
        b=sHamjCOzjDh002vKJu+fePfjJAE8p/n10smGIM2N/YaarHtJUEZCWTXfbo5NzAgpky
         fwFsn1ittBM/jEOEjDALIOEPzc1Qdb2w/OiCRcoPT2Q5jPWg3t1NvbOLq0PhQa/8ScD/
         XHWP+W7p4/AM2GLEG1vRcljxlQBbPLvil6uS3dXNTTidSWK0XXwnO6kElYcSVwvn56Tc
         5CL0+8Q4npQG1y2nzPBdOiy7pHVLN8nUfnXI+jfnG9Kkmq+QidbDeGBI9b1pL5xBgoL3
         DYmkvLtOU+aCQzOPrnQ1i9xZLGKLRp4mWvO+aQhIBjdTJ9ymCPVgVHkGlwY96PE6lTrR
         PRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373484; x=1793978284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg7J0kRkDkaIERBv6F6MaX7gjPWqfUPz/HBXjTx6FxM=;
        b=jB8B6hW5DGwhsk5rgU/jfcH7T4TfjPWkffH0sRz04szDLSYUr4HBBgHoTUokBnhWmR
         iqTTQ1p9nHrVJaywrDsiR71HvN+o+yjZCkYYz279JTeLiHrVCvJaqZS+nzzK/1uQ0hLm
         tuiBGKCKVHJyF44jHqqkisue8IXiDKV+KQfTVGrNAtHM4KSk5szaVYC+fGSjeNXLmvJZ
         7qFPI49QLi3Ilpj5d5s/VliYyhIj0UMCWQKLW1vM9eeyu8cyZFj+8o5tn/zvBhC4/Gib
         tI7xEuw49XKDjl39FyS9MxIdSiMOW7i9lOCEXRR2FvdhPNRRcT59rii+hoX1EfkCldAv
         skeA==
X-Forwarded-Encrypted: i=1; AKwUvBx1KN7dZtbdRRP6A2gDQgdr1GiAvIlvhjqe2cJJZAAPyAPHPXGCLAJQRWFHltA4Qh+Q4l5hmVWH+e8BR9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjDH/7BPnFPEL8x3QPLedaDmeOI5LUidLRSoUBdzHoELuc6VLp
	COQossOeHbihHSeSFXq4sFWWSUG8oSTy8JikpM7o3faX4Qs9aZOBC9dz
X-Gm-Gg: AYBFou2+o8gdtWTr56lpH2hCZ1s6mvEZNwybATokQbhtf1G6TiZeyTBR2xCC3x0BH3o
	WUFSNlMVQYLzgDqxMG+OQzSyIZwsDBPCOQB9H+SRJl1BbL9H4O06LW4fho2EvNpkQACyXYf0TTi
	eA/jBDSbmsZRHes117pYAjr0yI7Wfg2xAYEVCw3BvM9scISYvV8a8KunIbuYRw1VcvPvLq5UWI+
	QsHKLjnOM//65sWIMHIN+Xt+htpnjNwgG1e9h7XWBUr6dwUYPKLlhtXNf9gPzJbf96HnKgkqR/C
	XbBLKACCfp+B77KzUfEINYxYlnCvdPPwbHstvO59jy0u0W6VWwHOLg2Jyo2MQOtLOChorBz+KUO
	q6GQnGYzGq7ecoifKY0Lr8EqkKVs+cxiiOrtKSDUwPkD816ka5FAhRiTOwzpA34d0+46DfAAIal
	YU/kID5qwCxJ2HS9KJ1EnGAeU5wzosYhGKjtCfT3R00p2h1ZzcCvuNSH4xI14IGP2BXJIPKe1F3
	PbAnCIqjVlGGQgIehLjkGEAzewjvE0yEYa8P4Ygc8WzSd+kNk1XzuKO6u86HsQ8UpiCsk9+YoEN
	xf+e71ANxXtb+vVzgbJy0aeaZMlBZTZbL1oRzgmmWL1AL5AdtmVIVCAn+XO3uYf/guBT/qY7tWb
	c4pOtzQVQVw1RPdEE+aDhdi1dTinnfrCwjdaDeLIiBIl67BFmUgPqfCLbDynblcpqjpM=
X-Received: by 2002:a05:6000:178f:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e64d038c9mr13914876f8f.29.1793373483805;
        Fri, 30 Oct 2026 08:18:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9a3b1sm4006308f8f.44.2026.10.30.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:17:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: linfordWu <linfordwu@163.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix use-after-free in dump_module
Message-ID: <auS1J5RV7VEL7iYs@stanley.mountain>
References: <20261030150355.1809319-1-linfordwu@163.com>
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
In-Reply-To: <20261030150355.1809319-1-linfordwu@163.com>

On Fri, Oct 30, 2026 at 11:03:55PM +0800, linfordWu wrote:
> gb_audio_manager_dump_module() drops modules_rwsem before dereferencing
> the module. A concurrent gb_audio_manager_remove() can free the module
> between the lookup and the dump.
> 
> Keep the read lock held while dumping the module so removal cannot free
> it during the access.
> 

The patch is correct, but it needs a Fixes tag.

> Signed-off-by: linfordWu <linfordwu@163.com>

The Signed-off-by line is supposed to be a bit formal like signing a
legal document so normally people would use capital letters.

Don't resend patches until after 24 hours and follow all the other
rules.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

