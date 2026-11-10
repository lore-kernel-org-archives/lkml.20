Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354348;
	b=kfi7NO1sv6lw0JUfHzb0MLTt/QKKK/W0V7F8B8kACYFaFzYv8yW2vhvv80x8Vkz5Qv8C
	 U28nN7lxGrHHCtVHQrhy4ePavmjvtqZ5wmdssxDF11w51hx6OVfSziio1LnUYHPbrrQ3p
	 6AlfAxTKVgdL/WXqzum+8BlPxXmhg0uTf+6ob8U6YWNQa7TxTa7CQN1D4QRZX8DY3cgjq
	 ZwV5c5TMBNcxWsagxge6PwAFKAmzp894WoJvQ8lq42nE7B5l8i0/VvVlGNCgtjJ7mrw7x
	 1qkryGQllRkoopzOa51Gw+hnHuDDmJxM/7kpEnlSdN1SZymLrQvpOEIexU12ZFRqJIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4Lsy1zyB+gZPkYYNWFQCNSOq76EenYc9gTefr5K/zps=;
	b=zKQHVa+SBDIi+dNsCzdpUtBKtIIemtyZS2tVrsD69nTMRvWUYSlsuJjJcwhptAftdJDw
	 8GX3NiHUZSWbBsT7Axfn4WG+6QrHyJ1BerOMp6JsogL0FEZx6vlAFE/xy37uhCetR7sLq
	 /bxa9bvmNUTQ3mcvgFuLX2grQjXsBpTEKk6Gc/sPZWwEbFVftsf66c1PELpZqWe0AsTrD
	 klAkvHaYVbANAFYs/eqQ9cBxJZ8EOfROswd9gOlXGPXtd8FfCT/w3yr9IpJZsOK8mGpTs
	 OXq86mafuewHPVQW7dPN6Bf2G4UkPZzVkHL69cZ2d70inHMjk05R3pPNtXmPzN+FcGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxfmtrg6;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 51A7A606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A7A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxfmtrg6
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so21224835e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354347; x=1794959147; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Lsy1zyB+gZPkYYNWFQCNSOq76EenYc9gTefr5K/zps=;
        b=kxfmtrg6hICMHR/In+Quy6FtPzrP0qEjJrogJcgX5m8fZd5Cc4i6EkbuNbBfat6HvA
         jYkEgpBgf+8KWakwxcFHTzqJxNFY/eZvLGXUeqnTzZP00Ya/pRdKQB7a+85C3iU/TzSK
         l9pM1aazZib8wTjm0WiZ3wKNSWR7gXoFKc0TAWO0BQUFzJ+AGiqNs1Ix/Vng7CWEknz/
         H8UUTQOreCE6tBxpOwmpiHmwkp7CgXX/8S3RizmQ8Ghbs5xXZJ199iv7J+v8VjhXfOqX
         4rnL8Gc+kUKAWqxL1eIN69C5fplCmdzM/AlrH6yMbKBH1CdNLEOLT1YHQbtR0EApHuMe
         IKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354347; x=1794959147;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Lsy1zyB+gZPkYYNWFQCNSOq76EenYc9gTefr5K/zps=;
        b=1ifb+e16wFOYBh7br+mppOqi4DMoJyd7npkRGKwja31LhIbgicHdA86e6lOtqumBtp
         H1F1lGzn7rllMe3rNOUXq0KOf6bjjW8N9CwcfCANJjC2LDqLSIgK4zSKpbM33Bjfgzye
         0ApW+k8ZYnQuoirLZDkeQedWIvBWGD6KOD0kVwvUFx2TmeOBO8FR3OYHiGu6zxiyVTMn
         0sYGheFC5sckgF/y6PKZd4mMzmnzyoZ9IrRn6OPD9XpmM5txfrFiEz4bDgZavCfXN/Dr
         Uk+aRumtx/KlyDxdMgts8RdKbU173faoAUMDYHtO59iDGi5Qk3DcVIHHi+rmCcZAaBh1
         WGtw==
X-Forwarded-Encrypted: i=1; AL+hErFuy8a4pZ2vzmzV9mInhGG/Xe2a3NNNdvvxd/+uLbtpsZLEoZb/25uf1f2gX7cX7GTuo0wC0WSE8doSjH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I4xjgq6ed7LDiQrjPiO3cUmLnHSZYpRn42MYfZMYByUZSoYcb
	MmqUIdvanvSxktPMmIGAvN07CqdTrkKgJ9FGYNqCOxkq7uR/5KkUXBw=
X-Gm-Gg: AYBFou0pmWiqH2fYNyixZeDcw9AUYWcRsW0mC0sOc3vQRtf5MTDZ19SJdq79whBCRej
	l0wHb/1m7q3KCxoZRx2CYUKa452Zhq9YOZUpBkrOH+aEpLHXp6+DarEF3rCIhGp2Tv04JFPfXQ1
	2yBL0F/OdITY/t+c0G7znCg6FmehpY+4MgRFjN4+C0sXc+BpSYsSM0SvMtoopsNRBX5bVU4hK02
	z9XKG4APG5sYFF98GobR20B1xJr7+5UajcAf6T2sPU2kcuQ/NAxf1L7fsSLaxIkeY6IgzFaxyoi
	KyTNm8ZsYQ/rTHZaiCrZdL6/8atgsY0a+mN77SO/Uhc8/5qvMj7ODF0HZEiMD9nUkDyACNNsUpx
	SzKcISfG6H8UtCSJIZHXMPFKMPLAYJpxr70ltQ1HaYC9zxqLJjIjSeMVml6l25k38kx03Fqxa1H
	cq8CV16MaAfQSw96lTdoWdazts67qNqI9HzRbUZukUriYs/OH82eeSG8CmoX0t+7iY7su/bdwwR
	pl3WUJm+4UVk32ei25CE8a3gk7+KQOFgEwF3gRy1H5IQfkfKlAflL0xM1gJWUwmLvg1cl0fy/Jn
	zUAmtVkv
X-Received: by 2002:a05:600c:4ecb:b0:4b9:ff69:19ac with SMTP id 5b1f17b1804b1-4ba093811d3mr8644335e9.11.1794354346600;
        Tue, 10 Nov 2026 15:45:46 -0800 (PST)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4983f7801bbsm7532615f8f.5.2026.11.10.15.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:45:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Azael Avalos <coproscefalo@gmail.com>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: toshiba_acpi: validate ACPI object type in
 tci_raw()
Date: Tue, 10 Nov 2026 23:45:45 -0000
Message-ID: <179435434594.2276199.18274627858522339873@talencesecurity.com>
In-Reply-To: <7ac2114f-f4a5-c94a-0578-7659a7a291eb@linux.intel.com>
References: <20261102181827.1989460-1-tristan@talencesecurity.com>
 <7ac2114f-f4a5-c94a-0578-7659a7a291eb@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 9 Nov 2026, Ilpo Järvinen wrote:
> Your ACPI validation patches seem to lack information whether these
> actually have been observed to occur on some device.

No, this was found by code audit, not observed on hardware.  The
tci_raw() function accesses the returned ACPI object as a package
without checking the type field first.  If the firmware method ever
returns something other than a package (e.g. an integer or buffer),
the code interprets whatever the union holds as package.count and
package.elements, which is undefined.

The sibling hp-bioscfg driver already validates the return type in
the same way (biosattr-interface.c line 159), but toshiba_acpi
predates that and never picked up the check.

I can resend as v2 with the changelog explicitly noting this is a
hardening fix found by code inspection, if that helps.
