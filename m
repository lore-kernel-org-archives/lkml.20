Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297228;
	b=Zh8yDwCkBB2ZiaWgHcvDJGB8Mx0oT1d5PTioQeH7Uqecrj29GS12u5xOA5+eP4Isthly
	 nMmTrdlTAVeFnf2GivxAmI6Da/kuIzpZZoru+At87wX8rT5CiIMC5FOAn2Y8/a3PN8Ul9
	 Jhexq3o29PT2H+aQk1eI228AqwQDlY7E7eVDzmChfo8qSs/BMk7JYQaY/dKyA+cX6kcQb
	 zT2XVy3GX+Fu5+AWe+p6tWiCn7WFSbtglqW1rtQgzoXBZwmKyRbKQhw8KMdr0JdWTJSDl
	 UHtmL4jUkr0bzwoPjbUyYYaDRgU7qxVtdrMO6Jj/Ib+vFkzXMt0AD9ctYuLtGOTbdfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Content-Type:MIME-Version:Content-Transfer-Encoding:From:
	 To:Cc:Subject:In-Reply-To:References:Date;
	bh=mdl2q7bYgyRiGGu1Nd8Y8m4pgXUNb+bUSGq/DaAvAic=;
	b=JtFMtF8KoWn9gvpiTGPAUNiWUF7sBuySPnngqWMtK3diidWHyi5FeA0F2OEaTEbUBgs8
	 RuUmcCxBl/q/bKRi5ijEbo7DIFdevIhPw+HJ1+7WPlCWLCrerqriCANpB6pfKameUJmcy
	 ilLqWrwiG21GtdqBMFrM8tEIh3rFNnRWle5Xpum+A0ujqLSAeRkaKS4X262vuWSPEMwgC
	 Gv3A5f+ltX+9rpNXot+in8H+PzMeAR/V6cZaTDswFIYo+Q9VGbFwoUXJKZb6ZzYYTlV0b
	 viufZwjmwi6yD6D48flUa0QvrctfTZbwJ4yScQXgbSDyTqiuCdBvcittvbMIJ+1DzMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goV3UiRS;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB9F606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB9F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goV3UiRS
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1439245f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297226; x=1793902026; darn=vger.kernel.org;
        h=date:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdl2q7bYgyRiGGu1Nd8Y8m4pgXUNb+bUSGq/DaAvAic=;
        b=goV3UiRS4/JqtjAof3nv5tvVThur+kPBovzAtGEKMeGx1UEQSTtN0qN2OFEUBwLjyN
         HWRXveU5R5DCDMVyK7w41sS1cnoVY5eG6ICY6dEGpeDNEgYaqsjNqBPk+deaWF3sP+BP
         ZIfjLXk+UCsSGxdEREF6LfVh96e2uOCYXYQNzBpZOLX8XfNdE2XnmrrT0g/tnm5SKxum
         Xmc5gDP0byL2hDY4INLLwNBTTyCVuYka3io7mCGu4xSVj/LHAsVCN6TR+w0UD16GqNfu
         JWbmEYmGh8fkvFH/OJlKDZs/lmPwZ4nJwcSyu1mfH57vb7hB8AspF9Dv0z/C8wLvRR06
         LQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297226; x=1793902026;
        h=date:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mdl2q7bYgyRiGGu1Nd8Y8m4pgXUNb+bUSGq/DaAvAic=;
        b=0TTuvPa5SZnh4qlyd+wze4VkpEuJrgDaZT+ZUkITUUMuZ4aRAT2oxnXaxfM/px6IA2
         qGJxWfLG2SRaSvHwoIjAOa+umrcsKeQJDwkMMkOJBvUK6EA6Z9jw+XJuKNnQcjzr/bzL
         NZxtlcTqfcQ6WuKx1vV64KfxjYNPqM1iclZQneHVG6uhMoBz7xz2RVlmnro0nHRDyLS3
         rKa5iKqyyh31JkGxc6zFoX2OW1PcbTYuVMH1I36W2iWkyjdqeeOugiHVwDqsB8WC/c+w
         UFMjCt+dPFQQkqQE0en9LTjCnfk53GQ3TcOgtfPUzWdWODrxTbUvwPKz4aPEJG7LGY/2
         ozXA==
X-Forwarded-Encrypted: i=1; AKwUvByVD3AZKZ7qXdHWKgu9pRWf3q0HaJMAZgcaoEiBHffb8OfjM9VqufkEbDmphogdAp66xtUQwRV2xpkufdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUY2tZnc134qxnDv8cHClcJYUzEtT70O08Ohse4ATKfFTAfhUW
	3Iio2RpJyPsYFZZS2XwFqfuYgryTDpmKbjqyJ0n5yI5Q+MJSGFSuwVs=
X-Gm-Gg: AYBFou2RN9f5XXegYjkIiHBs+P0RcUWv6YpIqt8hEIf4vz7W9u3mCQQWtIrClU61Z4u
	ugbGompTxitS3RsHAbLwmtZPV3GFVk3w314utvldOjpXUcIGYlsOShT/IvTVtUYZ+5gTEAsKEUg
	imWbKIeXgv5LSh8/8Zzh0PRA/TJKj/nJyH6rQ0j92jWvgcDBQmKfY0ExQ+anDMai/GLN7jYiwNR
	lqgV1ZyYYXXGYGj7abClxJci+m4x3tE0TQcEmUygRRmyg/1xCQQclc5E02UYf4sBqt0HFkFomwP
	4NPmVGqpqssd6tWQ7I7veqFuYCZXZ0Nd80bqq+NqQ1QJxIiZE3V8NDlSbOR6vJjdVRqlZpFiPXz
	pmmhf1PMLZFQRJo1LidNoWjwi36ZJ3XUK6MR8U8xAVRvzOV4nUNB+c5wdmaicImJ0MehWdW7Svf
	CUSJQsDVxpnEGXcGK+CPaBF9YErhaOKNWEfURjwbCQ3/KbEzZXPtaQVdi69bbdULu6ZamOf8tQ7
	88UQMwbxEqzChg+AKHWXmaDU0j2eB/ePjlfuB5N/tFmRXA5Dhd5KsHNXNNsg5yc4ALYVPivFnnP
	QA==
X-Received: by 2002:a05:6000:26c8:b0:48b:677:f80d with SMTP id ffacd0b85a97d-48e6e2ff7demr405585f8f.26.1793297225850;
        Thu, 29 Oct 2026 11:07:05 -0700 (PDT)
Received: from [127.0.1.1] ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb8bc12sm9433f8f.34.2026.10.29.11.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:07:04 -0700 (PDT)
Message-ID: <6ae38b48.a6a2e554.2bec60.2370@mx.google.com>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Tristan Madani <tristmd@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: David Heidelberg <david@ixit.cz>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 John W. Linville <linville@tuxdriver.com>,
 Samuel Ortiz <sameo@linux.intel.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v2 net] nfc: llcp: use disable_work_sync and
 timer_shutdown_sync in local_cleanup
In-Reply-To: <179329133392.3327.1911358623600296609@kernel.org>
References: <179329133392.3327.1911358623600296609@kernel.org>
Date: Thu, 29 Oct 2026 18:07:03 +0000

VGhlIGlzc3VlIHdhcyBmb3VuZCBieSBtYW51YWwgY29kZSBpbnNwZWN0aW9uIG9mIHRoZSBORkMg
TExDUCB0ZWFyZG93bgpwYXRoIGluIGxvY2FsX2NsZWFudXAoKS4gY2FuY2VsX3dvcmtfc3luYygp
IGRvZXMgbm90IHByZXZlbnQgdGhlIHdvcmsKZnJvbSBiZWluZyByZS1xdWV1ZWQsIGFuZCB0aW1l
cl9kZWxldGVfc3luYygpIGRvZXMgbm90IHByZXZlbnQgdGhlIHRpbWVyCmZyb20gYmVpbmcgcmUt
YXJtZWQgLS0gYm90aCBjYW4gcmFjZSB3aXRoIGFuIGluY29taW5nIExMQ1AgZnJhbWUgdGhhdApz
Y2hlZHVsZXMgdGhlbSBhZ2FpbiBhZnRlciBjYW5jZWxsYXRpb24uCgpUaGUgaXNzdWUgaXMgdGhl
b3JldGljYWwgKGZvdW5kIGJ5IGNvZGUgcmV2aWV3LCBub3QgdHJpZ2dlcmVkKSwgYnV0IHRoZQpy
YWNlIHdpbmRvdyBpcyByZWFsOiBhbnkgTExDUCBmcmFtZSBhcnJpdmluZyBiZXR3ZWVuIHRoZSBj
YW5jZWwvZGVsZXRlCmNhbGxzIGFuZCBrZnJlZShsb2NhbCkgY2FuIHJlLXF1ZXVlIHRoZSB3b3Jr
IG9yIHJlLWFybSB0aGUgdGltZXIsCmxlYWRpbmcgdG8gdGhlIGNhbGxiYWNrIHJ1bm5pbmcgYWZ0
ZXIgdGhlIGxvY2FsIHN0cnVjdHVyZSBpcyBmcmVlZC4K
