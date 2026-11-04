Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835801;
	b=OsT6N90hOgpSKkZUqgiVLl99hDQvelQbH9w/NhpN5Xm9NX67FejZzg3hEstOojYwSdrN
	 uRw2U7ALOwqK5QvydD5lqnz7PHdiWicNf3RNsUCguwYbDGZ5sqgQZWD3i4hDmwnqI9tM0
	 lFqNS2Kc1Ol2E7r9vAiLA9chyd27IgdHNVeSfKlvWNEv+Anfyn40aTdDWJPSRnO6pHaIt
	 3wU2KFXWRfLN36CezuSCLNBqRuuSl1wNwE0aM6blZRTyT3uBr/905ag4Y1TeQMybaU8z4
	 KTdaceh7tFPGwVawyk7irzQJ0PPexidXZ64WPhZXiuSoTq97RgzPnpIw1JZz0W+PoWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5nFrUseiN9YOf0OgZ2S8yogfl08qqWr5d0TY5rbXHDg=;
	b=WGTJC3eHaQmOpsWRIxAff2eIsuqV41D8r/Ey6o2Z0tc8VLWd15K5iDcjL8t35utCk0Pw
	 zQYdhySmPtWu0HCeDuQ12ucKrAEj/GFl1r6LXd4vKBo684MPof1bKMSSIcgQPEqWj0h09
	 SZbv0cywLs05+ube9llv7OC0Uhjj59W64UXsmSGaRHXUepi2RcHqmysHaQDV8nJlIQF+U
	 sK3TxT0FKL4/4eJTQRiy/4jX2pjraBYC/LZsaODmPAJtzVNabuXj2fui0Km5Qy7K1gA7w
	 RJ3CdKG7OBq7Rnh1/NVLnPWchgC/NMhtfyOmdq+5flP3m5XSObOklYfesQeZxjjxOUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTUWy8jM;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38C3606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTUWy8jM
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2376774eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835800; x=1794440600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5nFrUseiN9YOf0OgZ2S8yogfl08qqWr5d0TY5rbXHDg=;
        b=fTUWy8jM1PsytsBsChYqVoszYkib2vcZrvOgSPKUcKRvOR2J5KlKs9FxUqVw8q8iFH
         Bc+DyvtMrivviUhsJf6HrM086DGRaC5KbowncGQ0/M1apkBieWLL4XEYGda4IKzCkmJ2
         9tgEdaQrKAJOCBGJVguKlOnY6y+l2arA7bXhdD70ekFiZVw+fh+PCR3KJK+teTgWZsx3
         Iex+BPdW4t5+1bylYB+A8YBcnddCBGtf4ZdVm56baw+25ZpVvLrU3v4bmPyA7c14pL8V
         9lJaNEMZH6a9oYqTug2PXqB86vxJCcWAXonEuz9BAviQY67Uf4ME4EEbBGhTn4ua5j8m
         gkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835800; x=1794440600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nFrUseiN9YOf0OgZ2S8yogfl08qqWr5d0TY5rbXHDg=;
        b=kvRhx9ckCzRlVm15EV8ZObqxZteNDpdDVPkzCjKkrVsAZ7gakDaRuzyQUJ89NyJGd0
         7I2qS4SRzkkO0O9tsRu0lLjM671RHC7YzQUl9A2fK3+EpsLeAaFqHTS0ygovO50F8uoG
         MNUUtu16vvWiBiAkmdwsZQrTnx/Jep3YhCM7rDb/84aowFOJGBL/BTyJjxd81B434x+n
         zFRwidpsEXR26/wnvrp0ORXV6EcCnyprNdnJEQe82vOeFeAAbaR6cnlV7RKaAlxu33ug
         GpF/QZCXIP5XVKcnvbK65il/0ADUurodU29y75nrXtAmbA9uLnKkWP7eeAH+bM3cbUpH
         /a0A==
X-Forwarded-Encrypted: i=1; AKwUvBwGasnh0LZ18xUCcjsmmabWQzTwaczUcPEUFa4D1MVs8hH8DbKLbvZ+BijLaMAkyK9MJ0up54A1nztqRRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pzadSWcS954vQCCYYTjQSaZWRN6dTt6dkkdB1zmAtlGGqKz1r
	QsXQEbpdb/boKwZrS2rqArgA8ZY4lBA41+CwNCzL3qIVANUo+VvlJZMEBWEPbg==
X-Gm-Gg: AYBFou2HFIHb5GyADbnFBq7rIbEdlHSoMXWxOtxS0Bfueow6IdCHEKDeO4C0jhR8RA1
	38BYBGA5Ww9vhEj7VmvVnZlvdformY+K4osJVr5g3WvXPcwZgwMwweZaeruv/tRy0H14dg/QO06
	htlwJmwiwgdKWgp4FPdAHs67WswHBQjwC753oS61RKstW9NSfufj1Nyqp3iZotIUnZtG3fpnXvs
	MwkAF4hTHpVkmJKi7P0dPXb49lEAhVjV+iQUkaMsgTu1bG80RMXZexBo80IoW3HR3jGkcpV5MBX
	M5SM4bI4wCxNPSQ8P4BZlrFxCcpBxT8ZhJpDNoVpI+TDFRGVcAHjBbgsS4465LyBIGiZNu/mqCP
	ESy7tv9Hnjdp0zsMoJjX56fhFFX/TvODN1UW6NXQUsb/q32dHTV6ZO3auyNWngfUL0bJprIABip
	Ensz7vGMi5gLL43+Sas0fnLeXRMVoN5qbIB2UnlzUa7f4plmX7wWSl1bWMcfHZ06LRW/52p3Ntx
	G9TfooTCnmDrHvkwJvIPf5u4l3TC69XygcZQs25jdSDNxy6bQf9ISV3+UUlXDNpTyK4ZkTCsYFj
	+0I/0u3cLlCYHAb7sDaTiFGbUm1hR6xoDq3/1qz7j0P5wb4VlRv08cT+PzjQ4S4YTpmU9A==
X-Received: by 2002:a05:7022:b053:10b0:190:da74:2c89 with SMTP id a92af1059eb24-1ac5bda4447mr27386294c88.21.1793835799860;
        Wed, 04 Nov 2026 15:43:19 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm12650219eec.12.2026.11.04.15.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:43:19 -0800 (PST)
Date: Wed, 4 Nov 2026 15:43:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: arnd@arndb.de, marco.crivellari@suse.com, 
	bartosz.golaszewski@oss.qualcomm.com, tony@atomide.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] Input: gpio-keys - do not rely on debouncing
 capabilities of dedicated irqs
Message-ID: <auvDDyECLJsQdIu9@google.com>
References: <20261104185044.2551808-1-andreas@kemnade.info>
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
In-Reply-To: <20261104185044.2551808-1-andreas@kemnade.info>

On Wed, Nov 04, 2026 at 07:50:44PM +0100, Andreas Kemnade wrote:
> If no GPIO interrupts are used, these IRQs are unlikely subject to the same
> debouncing mechanisms as a GPIO interrupt would be, so stick to software
> debouncing. Experienced on OMAP4 using pinctrl IRQs.
> 
> Fixes: 3717194f2492 ("Input: gpio-keys - add system suspend support for dedicated wakeirqs")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thank you.

-- 
Dmitry
