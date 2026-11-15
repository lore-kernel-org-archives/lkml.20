Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729657;
	b=n8jiPPWRnBIA7js/RqjcO1xBJcosccX7zDqImaLMNt59iSDFgqVDIYHVF/R4ciZ/25/3
	 F2CeVyJm4O4uZ3jJQDUguyDs0YNl97kV+C7+3+7n1WVvjriDCBCl5L+0Y2PxVJqv6hkoV
	 sMwf7gVHvsEhg4cmJ0o9voJ+uRXEqrYn12pzi4/LO8OUM0C5QAVUXll8zP6esRv4DDgZg
	 vVBqDoKL3FXPrn6QAHe3jw2QYoB0iRaYfw0wkUYwihAlSPWLcW1ICZrcYXZJ11Lk86H3X
	 l5yb87MnMQvFDmSiZaMiZ/wlkPPW6ltFpNFVTihC2BsRZXXGHKSfx1jJcqZW1imHPcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=;
	b=gh6Fn/m5mief5Heu3GysS5TCgN8BYS+QauNsdrRb60K+rtFHLyfS87Fp1Bwj6exfScrG
	 kyjm+4Tr7YnQoxyED69sViXVGIBsjKAQGp8CcXJnAVRGZVm6KQd17cSvzVwf+6SdWOG+i
	 VvJ7JajD66FLdElDY84wJUJsW0UQtUr72g40IKr8qjU1QBMgiIysBz8jfBEQBUfcsSDGI
	 A8M7CmlWVqlfAhw4KWIXff29k5DoI2CktTySvRDRmX6mwmaCwtRmFPYNmyMb4QYZ8Q0EM
	 cVMQYj3riXJkmaWK0p9RfmJM++2f1JybDERdUoq15o/ElOhaTHdhxvKx5DMFOmO2xpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEKYv2q5;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E32606A33B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E32606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEKYv2q5
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acb1224533so393158a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729657; x=1795334457; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=;
        b=sEKYv2q5F5cStHly1PzXhg2pDNY7ud1RE71OLiZ1wg52oYeVgF4GSLnfD36SWbv7gn
         KEWjaDeR48gOyq1IsILAAJykEUmn7TVJXA2ETl2z+W+0CgWywOKV9Qj+iUdk3SvGdylE
         Fwnw8ctZagJ//lUFXAACsOmAmUroHCTexpDEF5NwXjwzXMDppFMXsDRYd3dLcUej5QJ7
         mqe5Y6WlDlpzWW712NINam4esUU5TLte1ROKn5lxuer1+rKf6Jw2sog7HOzMy3PmvtDR
         WalG0ozetnCcep3jorPIV+z9d3eAWOuFKlRYLZ6Wda0jc06COV8Z6T1/zwF9QTbH6lF4
         uG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729657; x=1795334457;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=;
        b=xEtv9oJybylird9LhOzySBjKxDsuJqa+JOxH4Wd+e2b91DoZt6HKcKPcbpeawlRlAP
         0xPHv8pb6d76bf0iZla74mD/Y4dtXYuM9wqO8TsFYiPHyQEXHmZvAokn4LnVCOSAFTwQ
         6BA95Ulj41fwxF7FjLQOL1o9hN+LDkgi3chhlwknrCiPy00anjxbUy/w6Ao3z9RAh+BI
         Uzo+j6h3SvNWCOYMwOzeycw/Y26CT/MUn0GfSa/KergxmiCDgHlFZqlJerYnJVxoXx5y
         ER+CR/0hkFuhxCBmggQrBlDtu3MoOJHYZQnbUt+YK0fP2pXA/nxZNkcPw4bGDG3xB9aU
         FQmQ==
X-Forwarded-Encrypted: i=1; AL+hErEdayUPqarrCnf3stLYm3i1CPsfInuuFPpywO9780tRUv916eo3H15CDTQ9gBvvBcPh9RutaMwciPejY8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AIcNlO251moReaWGWejjkTUqKVSf+/AU2uoV0mE8pjVJ29vQ9
	MIxieJXs2At/+c4nKos+2NxtcQueIrXc79uFxdbxD2isqfng/6ByfpY/
X-Gm-Gg: AYBFou0YU0wL77u5ayHXaIdzuTLTWqLOvTfQxDhp6ioMLdvmgS8YImQMT5uhGV2vJfQ
	WvSVVxzDn8ayjFMd4FUqOyMzm6VMn7otfvF/+BKPoqFctgcL6EP8xkGAmFdK35e0iTi2OU056E9
	vcWjt3NR5JFpJeMXRwtN3ps7wuLIhSv9Mer19vDlfYcbr8EpZVVT8OZ7qNS78VJgfqdEnLfEAIt
	iYVPESgPXFTD1wcuoysF5b+UFTj6UTiYm72zoJolCbIcQWihK0PTz4oAvmJ2IJ2IfDeEo3W3deL
	W5F8yGvOfd2IeRmJTB6H4J45x9fMye69fxYtQar6MMXH5Qy4EnoKsfow1LwP6Q2YNfLzlpakz/Q
	/+vvL2lO8xVH5BhLUTAmEB5ULbLIGTaqvTBP4LbKYlnPq1yUoZPbAq031Jo1b7yaMA/QtVXa6Ci
	s8CwmdLphpp0lNb3AAud2RB+FQ/mHpVMKYsWDRnIm1NW7I2u7yEPgJgZQaUWFSUUMtA+ZArLjGH
	ipF82crBQfkz8uUDXb4qWNyJqBB+5iC2Ar1MdRkElJ+/Y9+6PTBsUzi6Dhtp16+b6tBbJsEO1KX
	q2HVoQ75wjXp6eBT5htmXNnb+fjIDpXiGqNVHofYqEklWbYtRPaaWvJNgO85JESUH7vnHYDhGpB
	l3JwoiQ==
X-Received: by 2002:a17:90b:5844:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b1b081cd6amr12270088a91.1.1794729656691;
        Sun, 15 Nov 2026 00:00:56 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm11795937a91.4.2026.11.15.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:00:56 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, hverkuil+cisco@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
Date: Sun, 15 Nov 2026 08:00:55 -0000
Message-ID: <179472965541.3841740.13087399923892139638@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Tested on an Orange Pi 5 (RK3588S), media next 48fe5a7834cc with this
series, KASAN on, GStreamer 1.28.6: fluster VP9 224/305 as in your
cover, Profile 2 output md5-identical to FFmpeg and libvpx, HEVC
unchanged at 146/147, v4l2-compliance 0 failures, no KASAN or IOMMU
fault. Not tested: 8K, long runs.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
