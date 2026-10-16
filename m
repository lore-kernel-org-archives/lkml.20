Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A4B4C151C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157610; cv=none; b=jyy30vTmk8CUwWdgAs7AG0gr++ueNcQKHTrbFwoywi9CbOIR0C71uW6R9qr6Wk0HJ2K9gkvZENF6v9z0N3q2ieZYl3mWCzac4zTVOJGZychtd914KtCmebO6IWDztTe7C36ExxZ3eojpKIxSMwBFexpSOs7oXoTln1s30BDkZ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157610; c=relaxed/simple;
	bh=fwU42aIpPNTFK+PFlWvH4U7S5VMKZ3LQacT2xQo+2Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qox26xyOFq15n3VT7OcDAZ64vy4PaPxER2J/pJjUo/ohoET2CEUN4NwQ1tOIuxB3YlSB+H13Mu5oiSfdW0uYAV5w7HyLqhIVilK6X6RR38qWPmcbHRSFsW4Lm581bBmgxi02PHb8cks+DgchlE/1Ycm87UateuuhOz/UdfeINe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmTErLrv; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmTErLrv"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33c10faf6easo686548eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157608; x=1792762408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5RtP92zEDKwkid1nIgwHk5oXY9tjcIrIDYPD+NtWp4=;
        b=VmTErLrvhZDqpTyHK0XZSRmgGg2zZPmpctARj0RuAvF4u/izxVz465/AHQ6JVOi3Sg
         2ZUcLWCx/3rSe6A1+bKf6qvDT/1RRHS6MP8JaYruZtuT6xnUJDwd9V4+R96aeZTLdSmq
         mt5tXhOSUzTrLJpcZ5lriZk8zKpOOwS5kGgTsgbsFfufZA2Pa71OXxXd+ijROduqmgbA
         xyx6Jm3GcKRBU9K9GeS8C0yfX0fweOhwU9vJZLWAN1uGLvrJCepUld75U7tsQfKaI9cj
         ox8f/dW2+uz9SQ4PQWrL1dPka/SkuWVr/6yacU+f6vHd0Wd+C5anO9JdcWAHy1jqwQvE
         r02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157608; x=1792762408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5RtP92zEDKwkid1nIgwHk5oXY9tjcIrIDYPD+NtWp4=;
        b=JhK9ztzL1HkaZ3xsU9SHC8/zdKI+nLdqRrkhF3Wypx6s7Y5wtqY8F/JIFwrHml0mul
         BLryLHpvR1z2w5SAwdwv4L3Vmm/kmWzc0GOm8kdw52SBsOpBF4rr42F/h//ZCwPAFeOC
         /djTOm2bS9yqq/Cf3rD3MqKRS+LxZsXYlQJy2MCrvAJjlw06Kd5Ih47Ad8UXa6kxsgR4
         o6IuBPMdYZAfu3gpKzGIQPe512smvJJ1RwEtk+C32QPGaUnIQGmOHURNgTXA6rb54Z8J
         IvUYZX1KCDt9bfADOj/ooVKG27Csfc7YwfzwOtzp7tqkroKmPpgSxV2KZXbtVqNyqPMT
         hs+g==
X-Forwarded-Encrypted: i=1; AKwUvBw/N1leB1szwUGe8KUguYigYix0Bsy3NV3l+D5GI4ibIaz44xwUt7xvbrDz85ZViiXcnfm8T8EVg13t05I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0pNyXxJjfmWfjJMbcAWGfAD7cz694yabnmjsVtU0g+9qFORvC
	86NeTHQKYe/jZcFUJqCgRscuqg6Q+2MS95tn1Ipv7LXFs2HyShYqgoML/oSNr13KZ9A=
X-Gm-Gg: AYBFou2dTry35WMTmpi5fwaP2wLlAHvs1Cl6DNGNHUBiqGwdVzLkGG17gtrVZLS9bVa
	C8igDxg0esiUdiz+ddLzEAGxVsHr5BglN4zpkfWd88jZNQ3gdANVJK2mpbzkxX0VLseNpvMLppq
	gz/EiKNVJFX8rN2uEGMrs8pi14YZhbfaZawxC87dr+hLmNMw0utQfVuC33tTDS7TaATAWWga7S6
	WolPh2zGumYT/qkdSK6hw+0uo034OW/BZTfjXv1q+CJwxYJ+r2l/dY95Fekf4rFJU+rBuWwu2nj
	jKlIj6PD0rD+9rdNH+g1pk7dwq+X1q1YNHKptQRIRzX8IP2hdn4ya6r+Bl6mpFoyL8rYd9YQOqu
	QzFFu6uhMd8ZTh4dVLW7+5poKAUgPl2ULArB3LoHkIL9LPMmvLTR+cHQr1uvIiMVC6t2uGue97s
	qFIry0a3oXPnrHM+ChxkvTKAJHQBQBgw2Mp45HN6wJfrrI1PmYwa1vKad7+UktozonEBNqR7Wcx
	oQTaTer0q7jkLi3ZmhagZHBvBX7zNRIAnHzhLIOWMJ5dSfzWMIwBiY8JLGNWYY2mKtPo/DXZUPm
	UspQAI9LsQZvMoAqsA==
X-Received: by 2002:a05:7023:a5b:10b0:147:d430:7322 with SMTP id a92af1059eb24-16a5bc5bd84mr43402195c88.1.1792157607982;
        Fri, 16 Oct 2026 06:33:27 -0700 (PDT)
Received: from cachyos-aura ([45.112.151.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm7230494eec.23.2026.10.16.06.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:33:27 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mfd: intel-lpss: Set d3hot_delay to 0
Date: Fri, 16 Oct 2026 19:03:21 +0530
Message-ID: <20261016133321.49288-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atIjpJn1Y0GPmQbP@ashevche-desk.local>
References: <atIjpJn1Y0GPmQbP@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 04:16:20PM +0300, Andy Shevchenko wrote:
> So, do you state that this patch fixes some bad touchpad behaviour? If so,
> please, provide some logs.

No, nothing misbehaves without it, so this is only an optimisation. It
shortens the first touchpad report after the controller has autosuspended.
I went after it because the driver already clears d3cold_delay and the
D3hot one looked like it had been missed.

I timed the i2c-hid threaded IRQ handler for the touchpad (CIRQ1080 behind
00:15.0) with bpftrace, switching d3hot_delay at runtime:

                                   d3hot_delay=10   d3hot_delay=0
  controller already awake         ~1.1 ms          ~1.1 ms
  controller resumed in handler    12.6-14.4 ms     1.1-1.9 ms

There were no I2C errors with either value. That is about 12 ms saved once
per idle period, which is not much. If nobody can vouch for the older
generations, limiting it to newer IDs or dropping it is fine with me.
