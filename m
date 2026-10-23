Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747010;
	b=mDLvMwh2fvjMAAMIsibB18UWgjbR5XhrL/NLhE62kZZFHjNgha40sbbJb8HEJM+zI7Oj
	 00xbaAAnBr7tcdUqUAeKwWoBij7mog/1lZSY73UXpfSXQUlH/+K7tJ2AEaG7+k+OCHGxm
	 6ASggQkrzbYy77mCApt8/XU5nk8NhbfODjKoM1RiMACcQy9nF4q+0Mlku2JmQBMHMlFII
	 4jiHHFWFk0GckAIGhB9Y6/yAnapF/g/7FMzmqGcXNZSIUU5i7o9qSJxjcR4EGzuMv7Bcp
	 Z/Ye/saclsx0gUzIUnkAxNsfk74HXoBnqrkZ1lN562D06nWN7kDaEfTAohcVkrF0RhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7QbAvKZlHDd3AEbAYJ/zukbrl6OsuWTPpYdirZ5iLSM=;
	b=OMydKAPxwdsx/0ZWagWyLntZpKSqcglra3JIgwoEsRlBr7C1STeibvk8rM9qcKn9T/qQ
	 VoM9v4kLTuicgF/kYqKeqIVYVB6uAySc977SWpQHbyHnJx/UtnaKXShMUIvFW8cqrDAvI
	 zkvZWFAICeoXyHt4LjOjcguymcmnuo9Wa0XYyeo9FeoVwIGHpxqN4vxc2kUhjT5l+Ru2k
	 dW1YL2hr8Su7kVclwkX4GbyPtaca+OmllQaa+13TZXxuGbXtwTlJg/8wNOHVKCfdUgCmZ
	 DFbX7UU5cdejHSLN3vnNZTOyFSwvXCFSuiGUlBsC+IA3r3u3sZAoBMFrE9KC2lMPFig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mW+avd+h;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711A606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C711A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mW+avd+h
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so3381445e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792747008; x=1793351808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QbAvKZlHDd3AEbAYJ/zukbrl6OsuWTPpYdirZ5iLSM=;
        b=mW+avd+hjO8+1Rstd5HMROdiarYwWClCmO+5Kd4xM5ZoI3CKxiuXaywpfuOj6Os9S8
         groA2rZBSGzxCF4MYRQGf80pez30iNfMrhBRjFZTb08jpPeOqxcJfBnVLD4+KPmHrbwS
         kOm2rvFEl23NAbCROpt/y3G8MTyHGaXeV8yskvIvmEwxVp2O3TVbH5Ft/zecFQQc4SJT
         khNsF0eriWubmgTIwxXYAv58AR5f7oWNaonNlCrTIrfLZMMqz6SHEtnFIv4GKV6w+PVz
         AD7rxCI7/kxEigsMZvlFq0Fxn4dRFZR6+79WXXMCe5HU4rY/L9SWZBQ1T7nZTjAG5J85
         hz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747008; x=1793351808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QbAvKZlHDd3AEbAYJ/zukbrl6OsuWTPpYdirZ5iLSM=;
        b=GQQXaDstooCBI6RmKHhGhqEBQmpLAKLsCTlpqwGZZLx6lrWnbCE5z5Fb4JXSErsdU0
         XvaxaTym6uQCA2wvUb2AgAo3VpKACJg/9GgZ+tzcHE0jZ4r3+Md/SHQQvnZosqHTmpxB
         un3GqNFS5cxTXWC1KAbwPbExQGdqh9Zn4XklWHTTcViYoQT4/k99k7OZ5qluGs5dG55X
         tiTIKJWeU2Cg9GU+ZtofYAITKSow94mt5gAdlvrIdgBgi8xBlEBRm1os6JCru85VJD7q
         r6+bKNhaN8yS9jVovHUsYTuF7Dw+wgZV5g3DZaWsJI+bTloVTw5+nYj9ZkRi9/XzBbLi
         VwSw==
X-Forwarded-Encrypted: i=1; AKwUvBypslAk6BG/pXTkYLMQddq6dRH7ngc0T1y53p9lJkG2tbNZ7Du/pJGbKXMBJXYCxDYhaaokIkMcLoxcYtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHLw5L44RwalriOmJar6lYZzecxF7PffFp2dxCxAuhsjPhqS8g
	QYVGrtFsao8UsbcLCZmZQmwO8+yBFtJ/O+s48Npvmje8/hfnc83rqHJK
X-Gm-Gg: AYBFou0NQy2Axs9XqEA+vfZgQ2CCC5unVNjcgoEvQfwsKXc3CYcgW7l7qxvfO5qxxIU
	bN2p29Cltbmthi9ExJL3wR3QB8EL5ck+OV3a9VJ4GdjkPDA2AvaRUYR2UQuxLfyvqs9Lr6fQ7wB
	qOspxPIb0KnfD5UppzXJL7dO8OMDSOKVGbbKL1Ce6xqVFijaXAvBfpw+3at4yIL3pGhSQ90u22H
	pUkzkkcQ6ebzKNnCZPHPAbuRAcCF2V1Sc6B06TMp5iQpZd6GRTHrTn+DswJJ5fzRAR4FcYPzeD2
	FEPQMeWOwPke/rGvONqTIUA28isUHG2vRoVUCHAWj4wHqtn20quxcUzEierluABygj77vWOT01S
	xSCamlawPeuO+HgCRRMHzPcGHNpxBGW/QXELcnlhIXQxk2PH82K/nKBKmRX0FW87RQtZ674NoTk
	05XZO2OWQ1ar580z6zmau3rTIhbOGlR48DL1xRvXOiHMr84kAaVT55L61Zkln1e+Wqwqz+9cOOd
	5BW1XKUG7N45qGe99hZIUm6i/UGfxCfGrylnI5hOQ0cIiNlWaQqDGo/2Os2A1d4mw9B0kUGBf0x
	xWbOhISQ65V6UtxS5hylXlWLV3U/5O8i4yX43/+fpNiZ0KmTz50oG6QtFDCOYLG/GhGEDxZMl/h
	48Uv1cZDW1kAbnVBT617jZgqwQS923n88V0U8w3a6OJ9tSWspyxvbZremMwaq5+hV5yyDKrgntW
	/0hKRjz4II3hk5ir8Fk4zXYlnbSX5oiHpX+NKye7tFf25vxFXgxYB8QWICt0GF3A==
X-Received: by 2002:a05:600c:c11c:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4a2167acde3mr10151235e9.30.1792747008186;
        Fri, 23 Oct 2026 02:16:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211ba3ab5sm55235845e9.7.2026.10.23.02.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:16:48 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:16:43 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jesper X Nilsson <jesper.x.nilsson@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Stefan Windfeldt-Prytz"
 <stefan.windfeldt-prytz@axis.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@axis.com>
Subject: Re: [PATCH 2/3] iio: light: opt4001: refactor driver to prepare to
 support more devices
Message-ID: <20261023111643.00007823@gmail.com>
In-Reply-To: <20261023111032.0000019b@gmail.com>
References: <20261023-opt4041-v1-0-45227f82d05c@axis.com>
	<20261023-opt4041-v1-2-45227f82d05c@axis.com>
	<20261023111032.0000019b@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Oct 2026 11:10:32 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Fri, 23 Oct 2026 09:48:14 +0200
> Jesper X Nilsson <jesper.x.nilsson@axis.com> wrote:
> 
> > Prepare opt4001 driver to be able to support OPT4041. Extend struct
> > opt4001_chip_info with fields channels and device_id because OPT4041 has
> > two channels and another device id.
> > 
> > Datasheet: https://www.ti.com/lit/gpn/opt4041
> > Assisted-by: LLM  
> 
> This tag has been deprecated.
> 
> > Signed-off-by: Jesper X Nilsson <jesper.x.nilsson@axis.com>  
> 
> ...
> 
> > @@ -388,19 +411,19 @@ static int opt4001_probe(struct i2c_client *client)
> >  		return dev_err_probe(&client->dev, ret,
> >  				     "failed to reinit regmap cache\n");
> >  
> > +	chip->chip_info = i2c_get_match_data(client);  
> 
> + null check and return -ENODATA on failure.
> 

Just noticed that Andy was faster :)

-- 
Kind regards,
Joshua Crofts
