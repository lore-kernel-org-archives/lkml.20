Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258420;
	b=hqiBiL3dCQhApgLKU9T4ZweiMhU2qRmfXR6uDYg8g7BwCofMKL11jMLNjz+B6SW60FgS
	 DUCtiFdansbflFkOpEfx/jvBTQ3tAqkSyUZSii4Tt/Fd3DK17z/nvrcYQwvOrGyBznhWo
	 ucZMOMR7w4hFYM2pvyQwQUdLEH3do6mhqO5jDW4n2s3jjXlWV29uyeZydtxHek9hRBqep
	 twDpfeMsbx25SYaiSaiK9LhRm4dnD4028ShhGTcwfPpIPOXZcCzEREN9kJ2XqqR+UwVhm
	 f9Skj0IgJbnofOAU8IRkc8Tj9BgR0zasvPSOBQPqXtT4ay7FBilhcnyXdYeXIIcUkAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=msIwo/eMaQA86/KSNqtbAUpHQHSvhDmPlJ4v36muoi0=;
	b=eNBwh/TRU8nkHKokeijiXUlR6bdVarGkxYl8NnOh0Cz36GFzhWySi9dtzRGanRctJ+I/
	 fxl65S4DOOHevY3OCeLJI01KRITRBhRW4jH29FAZQV2hvnQ3pk+wkHZG8YElh5b2bpI2o
	 yYIYEyU8EhkhjapigsQa5w1cnmgkJNDiPZvBEGy+9tEY/8SiH5xOXiY6VBoKM2Cz4gRSR
	 VgR6Msdl7UyFOZsgdeY6SVEaPUOTj4wYb0sXVtrZ9+AJRluZYTZ8R5bW1XYzj7Qw9afoT
	 sSirfwrK3HJXFdylMX25x/CJ13y8E00cg+kOcqG2Rwns1gDG0gFTOKHec7NVlIzAUJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="ZOF8ZVP/";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C431606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C431606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZOF8ZVP/
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso954990b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793258419; x=1793863219; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=msIwo/eMaQA86/KSNqtbAUpHQHSvhDmPlJ4v36muoi0=;
        b=ZOF8ZVP/+ft5G0xbjZvNsEI2Sy7HUSanc2AHIj6gbQfCoTvvXH47Rv2wOXek07mlHS
         ABxhnKGCt5pSoYdjNSIaZD9DwBKzdjBkMxGVqOWUdNe6+0+XFOwZg+vD5eit2I7o7k+0
         MGi38YDSSHL9pN2K5czmV6ukBO4pDBWAacGLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258419; x=1793863219;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msIwo/eMaQA86/KSNqtbAUpHQHSvhDmPlJ4v36muoi0=;
        b=pDarEAfIvWzpMWBpKZBfjq3ju+stE0fnjdO/k8ZpCDUrB/Vatu+IUZ+xaajV5HX0sd
         FGD6ccm3cwX1CtiaN7r50zg2PPu2XGFY6q8+xc9rX32Tf68k1guXMFfBGoihc6TC2+IP
         s6YknaRtZ45E6cQwLsW4wbiNzs8lyU9372NavEi3gJxKdHWqdrMR64lbN5Z2UPH5iCsB
         VZHOI3u4GR408Cv6fU7sA7Ssjc/NtgJj+z6KLqyG3lUSpSWdHhTxV+y0vF2lGcySKCVK
         x4ZrGwu41vhr7vI1StFpEWnRCjYXSoOUEWc5+B67whQXFUy2AhdjS7g12TXV9zwvvTVB
         ZRqA==
X-Forwarded-Encrypted: i=1; AKwUvBw3LRa8zMAW2cmcibLX6hRrAd1KfR+dhVlP2NAU7bXc/lzgPlYEGW2xVQxJlp2PNP8McZADNJh5NfNllQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyZEndwQVtcIlIbaiWi/Q9ojUAceaAhsWECzTug3k0taW83XBv
	4Q4/P/X5VZ+W+2BfadJba2vbdm3YU9e23v8Y4rq2KK41ah1kG01Hh7ZPjU+UO5mVo3ErBD/EdyY
	0yc+zFqXDjRJR
X-Gm-Gg: AYBFou2pGzj2shtud3wZGyyWiY3YxJKvylveQamAD4VKBMQPw+LtyL8uOEaWWAzeJkz
	YmAM7zGZnMBxNe9nWF34uTXoyCGmGQn55dtXro0u7waCHveUdqWJU08O7x5qLx0kKXQYZzas2hH
	ZWYJ2NwFgIGPbawWiBzawL+yU5O2Hz1tNTW8ctso14HKlmt0HD5sQW5g+NCceB2wtljMaQsWYTr
	Izlf8ElEI/QHtBLmYAUuMST/nPDRPQf6dyad7yUaXaWMkJB1Qe7TPNpWwTtYvhQjFUKO+Z5IAki
	acTW328cJvLuKoOFPSPkCKhR0ixwotmx1p33YrPO/qjMvSvPM3YBKJbTSqxNg+zNcAv18jqyHYr
	tcKNGnhZA20jVrlBb8bCKKUV0grG6l2ccxAKSih6wdOfrNg06fEuMWsFFaFe7wgGbkwetOvsDuJ
	Vc1lxCTNu07oZdHeeRuft88QSSN5FfyCoqYop0y4Sk3zr3MOmbGslDVnZiUjf1gCPg7EdzBgFRf
	Ojwx2ZyfWjgCFf+1EZkEXFsbphGPgV3y6uIgYfapDux1uWQg2gHK0zDtKmwADOMdr2DXVUwsH6G
	8DfjJAAl25OtqvgfAQVikpK6BoCYrRqRw12wJ8SHtcX4sCBZQgfYHqoDIc1PMSmJg3p5oNKvnkH
	Z70pTSqy0lHOCyL5OeQdk88kw/u/Qcwm5vwBgPX/PK5m3gJYFicRgGT/NriH15Id+tgloPm2+
X-Received: by 2002:a05:6a00:421b:b0:89e:b12e:7eda with SMTP id d2e1a72fcca58-8a6e3c6d4d6mr3938049b3a.7.1793258419593;
        Thu, 29 Oct 2026 00:20:19 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662d96asm1913026b3a.26.2026.10.29.00.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:20:18 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:20:13 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 15/16] printk: Modify try_enable_default_console() to
 return error/success
Message-ID: <auLzrR_kDaEtr7Us@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-16-pmladek@suse.com>
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
In-Reply-To: <20260929120546.328616-16-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Thank you!

Acked-by: Chris Down <chris@chrisdown.name>
