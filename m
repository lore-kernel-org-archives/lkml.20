Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716276;
	b=mMN8w05qwxh+dlvU0j5qhjUiAhPpm7NZDgnJ7yot/KgbH1m6Mmn00u6YIJifnRv+l58T
	 nWp1qRwjnFNb6S+Afrf6kFh1i7KNtV6+M4XmOF6YSnkQ4zdo7tqbqif0Kfd9gNcXQpIpF
	 twDUAVtr56uMcH7c8Fcq3Uu+Ri/YP3k1yb0U4SEtG/WVcdd1nr+EtrLOzFPJPQKJqLP2V
	 gQHBI6DmcxgTGaXUh4Xlxb4znMY/j+Y/ofBnAChpdf8DvncwuJq385rZMrHLfKBbp3ZJq
	 X0c1i3S0J4o8P3kqzzx1xGh34zafcR1iN77r9Xg6/h3CLicCx0FlxZafB21bY5eFMxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=7gHNoWmTfmQOSG4KOSEWfHiqr4reWyCq9KH7l8wRe3s=;
	b=MNEK/ErGRwIhyGjdznaTyXXKHiQ976NlE9px6sY5AP4XoldUk8lPVmKvBTftyFJRwzEl
	 mk0v3/sR4nHucvXWKFmJ23FwmT9DDhJ658CJ85+Z4jmqAQke/JAPC74nB7SP/qyfaTEt9
	 2ER42nNpzaPCBbk4o8SFn4xT5oTY92jq2Roa74unFuHvOl85xzw9OCRFcXNn5UO5Evp0k
	 U5zVSuP+HPEVYy55FmwmGK+lxdoXXYvaBpwLEr7MZNFxVPuQfTSXFaMvl/UDTGFF11Oo0
	 5ffW4h7xs25tvg3G5DE1fBXHOOcBEuvp+G+TJgWepFNW9wXqiQdvAxKFXBpvikOAO4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UD1Vo4w3;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7135606EEBD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7135606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UD1Vo4w3
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6270695c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716275; x=1794321075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gHNoWmTfmQOSG4KOSEWfHiqr4reWyCq9KH7l8wRe3s=;
        b=UD1Vo4w3gZhfJtogWZQDD61Mxt2SSZ+1t62Lk8dMZD1ytyuke5jYQNUnvGV7Ro9jTb
         X6CV6HnzlZrMW52dOsL7ElRhIH2rmmVYxpCMyMzkVZTuHsPzwOTcWaP1VATRRuZrEpo1
         b4FIACf2S62DY+fyl3zqXQRPcTHO48tj+COqLBMs3so6xPDqPIrtSfcW5fo55y22M1LD
         ZLUisuhsSSYN4xON2yqH36Q2JPgvnM7TJViD/2ePJqaRKE/vDpu6spk0WEFBk/khZua2
         +wgo9A8BrOL/39hm5EX4uzsovKHF/OAhTmHo4YysjFdqKQUGo3eXDvMhcwW6QykucZra
         fTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716275; x=1794321075;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gHNoWmTfmQOSG4KOSEWfHiqr4reWyCq9KH7l8wRe3s=;
        b=hetr4m1GJuNVF4+Z7RN+cAgXttWHLdQa4LdHwHPE0Page8K4I6gsr6phhflk5imQKZ
         NDhVPTjXgbVyaIfAWxcRz4NeUn/dtipho6Yqg8Ou7oGUQAOAlxJy4g+NRNFbSEDDFySx
         2aOLBtkSMkrfRgLZEf/T30EryS7vkNO5BUxa0lFQaZloFNSXMJYlqkADu9ljdE5IL133
         2TucXqhIuFPxzKtfnK0RUqvAn32Xuk+JdlnRBXv+EHl2xrq+gDz97lgZUYy3s854C8nP
         DzJbOwdxt32TS9w5XDqmPYUXqzgrmF7d34K4VT7sUr8y3fL+RjM1kHwNEvUw5cTTzQ4A
         uOBA==
X-Forwarded-Encrypted: i=1; AKwUvBwnvyAnCKFgV1bKe7sj6HK0Lyt/A2BDwBTcK7BGJkdJIyHKqxyK772HE2QcaIaB7Us9QN1pZC6LIsMxfrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F+iEvyZCSMzcGwtKhU0B2qXLE7YF5B2xxkVgTce9fU6IhWXZI
	WgDi9T8stxbA4eZhy60Wy3C+X3FAdE2QUOUXsKYcu5A0p/BPCy08Cbo9Odrxe0XyK8M=
X-Gm-Gg: AYBFou18bzhURGaHhJrePCJ9hHxfzMd46hQO0lOV4xkZbjzizQ4SwhxvXz1jl/wHUYV
	vE09CYTc690FrVGGUllSepbKPSwO1C1F03z+xFt5kRgxFIobgFmUlJfvSRcIjSZYbgzKMYIfAUl
	Ml80BwDBTCoc+Jlxga28Uyk3qj9/rY0qf34+U9bZLCK/RPzKT1yloQIT8cu1R4m77NABz1NBh8q
	hrlw5pRpNN3PMNhoKEEvd9XYQ1USnLTz3BTRIjt8w7u2laSgVhtjyr+8FknpDECKc0F5N0iyozJ
	fO+reE7nkzKXyAhl9+wxPIpbf9cK0sMnDLJ6qgRCrNsh1q6PrGGWlxtUcAjTux/Ftn0oJ56Z+oZ
	692bH7gchuDK0443oWCCG0pwtFhXSToI0Bsm9ng+OHXeV+jOGnpvC77EVA1StgSW1TTG/NeqyVx
	c5d1e2gt4VcmxgO09BrfZhmIotWCKOWN8SAWc9cgvhyHSbVaTlSRLAp67Ffgh9WC7O41HlQjVYy
	XFnh936RLuX6oDRuPv3KozzkNtRXvWKKPCX9vXSHrUGLYhfPoT1fJ2JrOp+HJD3d7YlWosmoRyi
	zT0fcvmZt7LFUsGnXYLERJN8TdPDn+ZHuwa4E8umzcSDMD4ie4ef7EcPu4SHO7KnLkug+sEcQH2
	aMvAzyjZiywig
X-Received: by 2002:a05:7022:3a06:b0:1a5:1c15:9ea3 with SMTP id a92af1059eb24-1ac5ac4b77amr21046296c88.17.1793716274970;
        Tue, 03 Nov 2026 06:31:14 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:14 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: linux-block@vger.kernel.org, hch@lst.de, mkp@kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261031102023.3644494-2-thnkslprpt@gmail.com>
References: <20261031102023.3644494-2-thnkslprpt@gmail.com>
Subject: Re: [PATCH] block: report the correct discard alignment in sysfs
Message-Id: <179371627406.3691261.9915846526191615476.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:14 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 31 Oct 2026 12:20:24 +0200, Avi Weiss wrote:
> disk_discard_alignment_show() reports the physical I/O alignment offset
> instead of the discard alignment. Devices can specify these offsets
> independently, so the discard_alignment sysfs attribute can report the
> wrong value.
> 
> Use bdev_discard_alignment() for the whole-disk attribute, as is already
> done for partitions.
> 
> [...]

Applied, thanks!

[1/1] block: report the correct discard alignment in sysfs
      commit: 2516f0413f8704a7370ef8a2eeae26c9bc438978

Best regards,
-- 
Jens Axboe



