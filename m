Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630422;
	b=QwARy1L0RioFXi+U0a2s+MVOW1/MGDtX8Czn95OlsA54mATExBLlrCcbO5f92yXgQK5N
	 0uYL2wwjTrICieKaEyUjbeaK1pOOjau6KkmkyH9fKQ5zJCmDYDeNNevYa8cHBgLYogTU6
	 BhXos5ZdgNGXZaWV19jA2jX+syJC1OOiiI5PL2NbUXLu3Iy3h7HnHGbpBKfSsQQveUaG5
	 DBtl+Ab7h4Bnk+ZzoRwNQlLIJ2J1XnAoQF7TGnPQQ9nquIGqCdV06Qx95sa47qZPlO/jy
	 xReNVzTiAgX/BbWOMmqqNgV3vsaRRGssMTdNuKQpW6hUgLuMpGc+kQFor4DkEYBlAGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UizaT5WEzB9VreQHfjKZbh6TJBmKHW201cFNMemllhA=;
	b=RhdgF9rFwuZlQV1Jf/BvtfWOwEuOLIgKbChGR9FarArZSyzIo5UUx6/UKZSric5i9BYg
	 I6cDbLxRecQlfBmucgRjSYV3DCti6w2ivqjVOLziKhBqUy2LtQIK/IoPdJ3/bHdwjBqXQ
	 zbMt9tfukh3Tl7nOF496fWVRH9YOjWvPCOVG5N3cxbjitcB7hm8SYqojRgTLFVoLjDkrg
	 Gx/hPvPk3pmx2xl4PDmY6TuofIXAMlYrYILPLahZob5RvREufDGyVJEG7XAJSy0j8a+fK
	 7gaESq4rTVQG5+d1F/W8ES6BQ7trB6VU0BRY50FBB9VABKr4n+lUpAMOk9YJlaPI4rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iG/109Er";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926B5607BDD1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926B5607BDD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iG/109Er
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so27719175e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630421; x=1794235221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UizaT5WEzB9VreQHfjKZbh6TJBmKHW201cFNMemllhA=;
        b=iG/109ErfUTVi8jDP0vrFWZo7Psujzqil5wyhqf4iemzyOnEJStEOLQgkWk+A1jU7t
         S88ig/9rVLMeCO7qATemzGG94r6g2rL/zyVlvaVQj+dMjVwVOIfbxr6gDYw9zZXq+4lj
         09Z5o24dQlGjOs/Sdj19rrM0lwQ3p1+jO/JUR1SuBXmoq5rplV3V+swZJM87e19ffWY3
         bOivyO5/4YBYN+851VXw4TkQ7ILGTLxM+KlTSY22gVBXR6BNJ1I+IvyYabNWXupjq9Hv
         GtWvKd+GajmwnnT6glO69nlaBJzzwh7tSrpqiCyRCWejIcrvAHecP4PbsKtrNlAIMLMP
         H1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630421; x=1794235221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UizaT5WEzB9VreQHfjKZbh6TJBmKHW201cFNMemllhA=;
        b=EBFzNo7qYuhXYqEYAZEHD8a7NcA6SNy7c/xkqTML95x1g/cn0chiyCznsQZSx5FLB2
         OCnTlNxpLq2esy3rndPny4j6upBVgd/GiOvLxySvBd2+2z8DPHJcX1ffwL5NHS7b8gPh
         FP0woirPhtNvGq5tviZIqz4uo9Auxj7MkMJFmfqul0EPf5NNfEoghYuGqQVdyXbYZeFx
         ZsHiLYaPivNJhak7CYCiXi5VcOe96k7Y+YGPn1mrsHayXcLhkBcUrfpSxh4Q6yuplJ+z
         15wBdWGXW7opz1w0OF5fRpw2iu08B9wT34swLkRuiEVXRAij683yXSaRkNLqg1RaJ91h
         HJDA==
X-Forwarded-Encrypted: i=1; AKwUvBwpChNwSPUdqxIpfSJGdS4IzJPIbsnyI3QxokfghTqiwjWQbZLou35qPYGGYMet9O8bgsq256H/kDIlvcA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsxkxd7mXs3dVBL2FngkQEWiAYGV3q95I5ozduwoTcD3SJCGH4
	Yjomz3ni9pKhz2GhCrXo25FjQ2U4CDXRarX/OaKBVO7akelYHIkLYeqN
X-Gm-Gg: AYBFou3Ukz4DXT9Jz7gizaOKAtmlGQ06IZfoXsa/+f/8JNTqNESyQsEK0Ju8LI8Uy7M
	AMfMOAKWyv2u2KyoJVcUM+axs03z2BuvmFhtDXUPvYfL8x7V/kEEpvxJ68/JapXvhFp1CJvL2Kx
	AOX54acFmZW6jQKllLFuFSBRWVEuO8a0yVxB5+O3xahUw2Mz/ZiELpdG6xVx/r6eDUc1CJlIIbA
	s0IPoL7btMDLN9Uciir3d3E3alswXlRyA9+u0t+NR0woY2+Coca/8+IMmRto7Cbs3YW9Z+C7lBj
	bSiNaGdAeY+hwQp2EkkuRpV5FitljuWF/tPjRJCfDT2JugB3QkcrwrahfLKQfh8aiM7+FcU4AqN
	9LNuHra1AhWADlRpL4o7RKCZtZOVtqYF0q5s/bTRLRZWqqgWxsk3d6P26DnqjKWGWZwcV3td3OE
	WeC5FjBTczGN5r2net80uHUAkN3p4pMcD4BFw9vPgn1AlVbXs2Nfhj0WvmQEFkf0pe62jY8AMx8
	7JuQpkg4pZXgRmlUG9Z6O8gO9iKRaY40GhyJLrVZ8cTcSpygsGkQKm2dXLw2xO2VxZQcnYvCIIw
	h1Hv/U9KNVVpaVUdI9dYy/ubc3DcAjtiQUqpnF+uwbCqJVY12sQ3+LgExaaimOuujKTPddaFXqK
	q6X5By2NuZSkcIB7z8aJ2wHBLKp8DKslxR6q2jk3C/6QXpkbNpUf6GTXR/YGEHcVjPwkhVKks2d
	ZTMtIRyXdljH0=
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr239559645e9.16.1793630420527;
        Mon, 02 Nov 2026 06:40:20 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm278034655e9.5.2026.11.02.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:40:20 -0800 (PST)
Date: Mon, 2 Nov 2026 17:40:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adhyansh Verma <adhyanshverma2010@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: add newline to sysfs_emit() in
 show functions
Message-ID: <auig0PAuoPinb0Kl@stanley.mountain>
References: <20261102140438.103135-1-adhyanshverma2010@gmail.com>
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
In-Reply-To: <20261102140438.103135-1-adhyanshverma2010@gmail.com>

On Mon, Nov 02, 2026 at 07:34:38PM +0530, Adhyansh Verma wrote:
> Per Documentation/filesystems/sysfs.rst and kernel conventions, sysfs
> show functions should terminate formatted attribute outputs with a
> newline character.
> 
> Commit 14c91651df34 ("staging: greybus: audio: Use sysfs_emit in show
> functions") converted sprintf() to sysfs_emit(), but left out the
> trailing newlines. As a result, reading these attributes in userspace
> outputs values without a line break and checkpatch warns that
> sysfs_emit() formats should include a terminating newline.
> 
> Add the terminating newline to each sysfs_emit() format string in
> audio_manager_module.c show callbacks.
> 
> Fixes: 14c91651df34 ("staging: greybus: audio: Use sysfs_emit in show functions")
> Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
> ---

Check the archives (lore.kernel.org) for why we aren't merging this.

regards,
dan carpenter

