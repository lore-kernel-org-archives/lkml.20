Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645015;
	b=aIoc/ciHuzC3tydM0mLJFf5txtD7o3sh9Gfgbop3Qeb9GgKzXK1BDUXRLaypEREmyfMo
	 AqTJ7Uk6Fedv2jl4GjEEDrL/eBndZPEd7hqT8m0WpwTD0XPLxZPdeeGdZ80A7HI4nf/qV
	 sHRUnilVx/FJUtKaeZ3ddJ1oRsPYrPdhpqF4Dixm0Z2MsXb4IJpnrZl1FAkZmEifhNTxB
	 qPwqjB39ifG0cZsFnbxq9G3wSFZI9tqgtFXdNfmN/8uL0+u2hCV+rrkwRorKYq/zMt3P5
	 I55IClRBR5L/lbe8LocNmJlgemn8JCv7yJU6RI2PNE84u8i70sK1vu9e9z4OA+thAiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
	b=cdvFb3jAYAHlw1jQmwevE1TvzgENDJ2jlAaqx7sa2TeJZ3LOPiN303dM35NMy1f9WBjd
	 uKVcUV3Hrvk37T38H/PNtDShUKyACtrYZ2aTeZDHKrw/m5gYJDDdQumG2Ln6Kiux9gHFa
	 NZVzf5jkd6CWipo0TfKyUELBzz+z44RfxCs0/iN3n8+91w+V40PJ9nXiHOT2dH6pBgO0X
	 euwiVUfxCZ01yvH8f9UJKpe+KpDVnLOhu2HRF1m8tBh5kVf2QTlJpMIey2a921hhiqORH
	 K45pXqeiPC/R3sR3R9w0Nqa76zrQzvrgOWlaMCWF7sFGAMtcCr1EJjKH1gmZayk++QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1cNDI6m;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC8606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBC8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1cNDI6m
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491aaed7565so766402f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645013; x=1795249813; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
        b=l1cNDI6maJQghXoN5Bi3lRgzuojcOPv/fbKoo6wB7B4ANNCwdsmC1uDJGvRWeh+8Or
         RczhXvtEz7U2aEfXDHYHHb100veeL5CTuQgmKX1Ahgpy7/Iy+myvw5N8OG46JM7KQZq/
         6yOBt95prApmoYTfLzMf0TpHbSdwEXR1SSUnEvVJBEUHvkhiezddLe0hYD48Q4w7a+a2
         QlLp35R69SBgrBQd/m7x+VYQdUd3iEwhsiSN/8nMNuxExrvVmAJLutWH8lzjW16BN1YT
         brJ3a0A2uD2PK5qVBbtyqFMYT0yheWw30f2Q9bto0taHAZoJ2qihB1W2jC+IeF9Kd15X
         MtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645013; x=1795249813;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
        b=J+kY49lHxeF4gYA3WkqBT3Xa0cIzHyAIhK2+c7NJIEFxqb59u8fLy/Jg2giHkhtV7L
         GAMEcANahV3mtnUYV8/C7U30MWQ1XfMdCnho8NalpTQFkj5pysuwqVxlroVpyqzgoy4D
         cpatfDhttBW3ewm0IU/fZ3iJB0UZjRnslSZ6zRTfQIOBXnjfLIdG0DNj02qqGHXwDz+I
         oUKZt+ftcpYQFvhcwUKadPZddh8feGMp41et36TPSl5bmRmWjWPbrZx2avBoeur0s4Z+
         gPK7Fl+dkl6+IEqRHbJo+8wgVIvHEVSePEuNS7x1FYxKj0IA9Q57RWcnvjL7DW0B3eMp
         htJg==
X-Forwarded-Encrypted: i=1; AL+hErGVuauWj9EvYlsqMICy8GYIq599Zjq0D8PvTB8ryGHPu9ViZsBthic9rZ3rhI69FitGcx/vzXFUahTzD0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SYCN1lQB6N360nnwMF5p/O1z0dOfRKppvLNX7aPwj0j1JhVqD
	IJXMZ7PGD97IEj611DDS/pdEC20FM9nxzeTLQMZLYwN0XeOSx2c5roF1
X-Gm-Gg: AYBFou3ijYAMDqzeipXSl7+1bDHXoO34GjZXQpa1Vc6+6zExzcTWGmflAxGf0NMn1CX
	M7TSlaB0JtNNrONAeE7ue+bO9+/JMJQK0XVZ0CPJmDRYGdpw6Ejc4aB3bprhBohVOiFlovxHCho
	4k41XdX+HT3i+Vh23OJxdiIMzLf3/Lu2Ofwt8hHCLgj1UfM3NMgPAwpkmpPfCeW82S0yhPSAu6R
	GQ64TUvrqrwbUa+2OHWBu4JoKVtiIXixascprc4LvRvFYtfbR6T2zeBZ802PJ8IOFn0eSb51OVF
	9HVqS8YXMRx9XHf5WP9UcEzV3vEN8mGcWlOf6y/+eXkujVEgdfpgbzoTIFeAEUho/tKNstsyExA
	9gPz1Rrd9vYnpzX81LzSbtc3UGQ2T+KL3YwEnN5uQGt97VfFUsFU1l4E0sluTs7YwxW6L2D0LKJ
	5sj6OqAwlbSaTaSmOrXAYYcORUq3l4s46EK1KLJ6OufYYzpyF5MFdCiAQQqdrRgtzQwFK22aK61
	q6yt1grCdl/8paU8v/EZi5rGAecaJbB9A0MJpZc26724Fmtvsd/
X-Received: by 2002:a5d:64c3:0:b0:490:1358:2265 with SMTP id ffacd0b85a97d-49c72ab09fdmr11144513f8f.34.1794645012869;
        Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:12 -0800 (PST)
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
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 0/3] arm64: dts: qcom: add device tree for Asus Vivobook 16
 X1607QA
Message-ID: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2NCBvZiB0aGUgc2VyaWVzLCBub3cgc2VudCBhcyBhIGZy
ZXNoIHRocmVhZCAodjMgd2FzIHNlbnQgYXMgcmVwbGllcwppbnNpZGUgdGhlIHYyIHRocmVhZCwg
d2hpY2ggbWFkZSBpdCBlYXN5IHRvIG1pc3MgLSBhcG9sb2dpZXMgZm9yIHRoYXQsCmFuZCBmb3Ig
djIgcmVhY2hpbmcgeW91IHdpdGggdGhlIGNvbW1pdCBkZXNjcmlwdGlvbnMgc3RyaXBwZWQgYnkg
bXkKbWFpbCBzZXR1cDsgdGhlIGNvbW1pdHMgdGhlbXNlbHZlcyB3ZXJlIGFsd2F5cyBjb21wbGV0
ZSkuCgpDaGFuZ2VzIHNpbmNlIHYzOgoKLSBEcm9wcGVkIHRoZSBMUEFTUyBtYWNybyAvIFNvdW5k
V2lyZSBjbG9jay1yZXRyeSBwYXRjaCBmb2xsb3dpbmcKICBNYXJrIEJyb3duJ3MgcmV2aWV3LiBU
aGUgZHJpdmVyIGNvcmUgYWxyZWFkeSByZXRyaWdnZXJzIGRlZmVycmVkCiAgcHJvYmUgd2hlbiBz
dXBwbGllcnMgcmVnaXN0ZXIsIGFuZCBhIGJvdW5kZWQgcmV0cnkgbG9vcCBvcGVuLWNvZGVkCiAg
aW4gZml2ZSBkcml2ZXJzIGlzIG5vdCB0aGUgcmlnaHQgZml4LgotIHNvdW5kd2lyZTogdGhlIGNs
a19wcmVwYXJlX2VuYWJsZSgpIGNoZWNrIG5vdyByZXR1cm5zIElSUV9OT05FIGZyb20KICB0aGUg
aW50ZXJydXB0IGhhbmRsZXIgKHRoZSBzdGF0dXMgaXMgbmVpdGhlciByZWFkIG5vciBjbGVhcmVk
IG9uCiAgdGhhdCBwYXRoKSwgY2FycmllcyBGaXhlczogdGFncywgYW5kIHRoZSBydW50aW1lIHJl
c3VtZSBlcnJvciBwYXRoCiAgcmV0dXJucyB0aGUgZXJyb3Igd2l0aG91dCB1bm1hc2tpbmcgdGhl
IGxldmVsLWhpZ2ggd2FrZSBJUlEuCi0gYXJtNjQvZHRzOiBzdHlsZSBjbGVhbnVwcyAtIHN0YXR1
cyBwcm9wZXJ0aWVzIHBsYWNlZCBsYXN0LAogIGFscGhhYmV0aWNhbCBvcmRlcmluZyBvZiBEQUkt
bGluayBzdWJub2RlcywgY29udGludWF0aW9uIGxpbmVzCiAgYWxpZ25lZCB0byA4LWNvbHVtbiB0
YWJzLCBjaGFzc2lzLXR5cGUgbm8gbG9uZ2VyIGR1cGxpY2F0ZWQgZnJvbQogIHRoZSBzaGFyZWQg
ZHRzaS4KLSBUaGUgYmluZGluZ3MgcGF0Y2ggbm93IHVzZXMgdGhlICJkdC1iaW5kaW5nczogYXJt
OiBxY29tOiIgc3ViamVjdAogIHByZWZpeC4KClNlcmllczoKWzEvM10gZHQtYmluZGluZ3M6IGFy
bTogcWNvbTogZG9jdW1lbnQgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsyLzNdIGFybTY0OiBk
dHM6IHFjb206IGFkZCBkZXZpY2UgdHJlZSBmb3IgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsz
LzNdIHNvdW5kd2lyZTogcWNvbTogY2hlY2sgY2xrX3ByZXBhcmVfZW5hYmxlKCkgcmV0dXJuIHZh
bHVlcwoKQmVzdCByZWdhcmRzLApEYW5pZWwgQ2FydGVyCg==
